@interface _NSItemProviderTypeCoercion
+ (id)typeCoercionForValue:(id)a3 targetClass:(Class)a4;
- (BOOL)shouldCoerceForCoding;
- (Class)targetClass;
- (id)_NSItemProviderTypeCoercion_coercedNSDataValueFromNSURLValue:(id)a3 error:(id *)a4;
- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSDataValue:(id)a3 error:(id *)a4;
- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSURLValue:(id)a3 error:(id *)a4;
- (id)coerceValueError:(id *)a3;
- (id)value;
- (void)dealloc;
- (void)setTargetClass:(Class)a3;
- (void)setValue:(id)a3;
@end

@implementation _NSItemProviderTypeCoercion

+ (id)typeCoercionForValue:(id)a3 targetClass:(Class)a4
{
  if (!objc_msgSend(a1, "instancesRespondToSelector:", _selectorForCoercion((uint64_t)a3, a4))) {
    return 0;
  }
  id v7 = objc_alloc_init((Class)a1);
  [v7 setValue:a3];
  [v7 setTargetClass:a4];
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSItemProviderTypeCoercion;
  [(_NSItemProviderTypeCoercion *)&v3 dealloc];
}

- (BOOL)shouldCoerceForCoding
{
  uint64_t v3 = objc_opt_class();
  [(_NSItemProviderTypeCoercion *)self value];
  if (objc_opt_isKindOfClass()) {
    return 0;
  }
  if ([(objc_class *)[(_NSItemProviderTypeCoercion *)self targetClass] isSubclassOfClass:v3])return 1; {
  v5 = [(_NSItemProviderTypeCoercion *)self targetClass];
  }
  uint64_t v6 = MEMORY[0x1E4F1C9B8];

  return [(objc_class *)v5 isSubclassOfClass:v6];
}

- (id)coerceValueError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = a3;
  id v8 = [(_NSItemProviderTypeCoercion *)self value];
  SEL v4 = _selectorForCoercion((uint64_t)v8, [(_NSItemProviderTypeCoercion *)self targetClass]);
  v5 = objc_msgSend(MEMORY[0x1E4F1CA18], "invocationWithMethodSignature:", -[_NSItemProviderTypeCoercion methodSignatureForSelector:](self, "methodSignatureForSelector:", v4));
  [v5 setSelector:v4];
  [v5 setArgument:&v8 atIndex:2];
  [v5 setArgument:v9 atIndex:3];
  [v5 invokeWithTarget:self];
  id v7 = 0;
  [v5 getReturnValue:&v7];
  return v7;
}

- (id)_NSItemProviderTypeCoercion_coercedNSDataValueFromNSURLValue:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:a4];
}

- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSURLValue:(id)a3 error:(id *)a4
{
  SEL v4 = [[NSFileWrapper alloc] initWithURL:a3 options:0 error:a4];

  return v4;
}

- (id)_NSItemProviderTypeCoercion_coercedNSFileWrapperValueFromNSDataValue:(id)a3 error:(id *)a4
{
  SEL v4 = [[NSFileWrapper alloc] initRegularFileWithContents:a3];

  return v4;
}

- (id)value
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setValue:(id)a3
{
}

- (Class)targetClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setTargetClass:(Class)a3
{
}

@end