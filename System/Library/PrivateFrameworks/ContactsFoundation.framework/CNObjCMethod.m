@interface CNObjCMethod
+ (id)methodWithName:(id)a3 implementation:(void *)a4 typeEncoding:(id)a5;
- (CNObjCMethod)initWithMethod:(objc_method *)a3;
- (CNObjCMethod)initWithName:(id)a3 implementation:(void *)a4 typeEncoding:(id)a5;
- (NSString)name;
- (NSString)typeEncoding;
- (SEL)selector;
- (id)methodBySettingName:(id)a3;
- (id)performOnObject:(id)a3;
- (void)implementation;
@end

@implementation CNObjCMethod

+ (id)methodWithName:(id)a3 implementation:(void *)a4 typeEncoding:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithName:v9 implementation:a4 typeEncoding:v8];

  return v10;
}

- (CNObjCMethod)initWithMethod:(objc_method *)a3
{
  Name = method_getName(a3);
  v6 = NSStringFromSelector(Name);
  IMP Implementation = method_getImplementation(a3);
  id v8 = [NSString stringWithUTF8String:method_getTypeEncoding(a3)];
  id v9 = [(CNObjCMethod *)self initWithName:v6 implementation:Implementation typeEncoding:v8];

  return v9;
}

- (CNObjCMethod)initWithName:(id)a3 implementation:(void *)a4 typeEncoding:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNObjCMethod;
  v10 = [(CNObjCMethod *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    v10->_implementation = a4;
    uint64_t v13 = [v9 copy];
    typeEncoding = v10->_typeEncoding;
    v10->_typeEncoding = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (SEL)selector
{
  return NSSelectorFromString(self->_name);
}

- (id)methodBySettingName:(id)a3
{
  return +[CNObjCMethod methodWithName:a3 implementation:self->_implementation typeEncoding:self->_typeEncoding];
}

- (id)performOnObject:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, -[CNObjCMethod selector](self, "selector"));

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)implementation
{
  return self->_implementation;
}

- (NSString)typeEncoding
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeEncoding, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end