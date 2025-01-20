@interface CNObjCClass
+ (BOOL)addMethod:(id)a3 toClass:(Class)a4;
+ (id)allMethodsOfClass:(Class)a3;
+ (id)classWithClass:(Class)a3;
+ (id)instanceMethodOfClass:(Class)a3 forSelector:(SEL)a4;
+ (void)enumerateMethodsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)addMethod:(id)a3;
- (CNObjCClass)initWithClass:(Class)a3;
- (id)allMethods;
- (id)instanceMethodForSelector:(SEL)a3;
- (void)enumerateMethodsWithBlock:(id)a3;
@end

@implementation CNObjCClass

+ (id)classWithClass:(Class)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithClass:a3];

  return v3;
}

- (CNObjCClass)initWithClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNObjCClass;
  v4 = [(CNObjCClass *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_cls = a3;
    v6 = v4;
  }

  return v5;
}

+ (void)enumerateMethodsOfClass:(Class)a3 withBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CNObjCClass_enumerateMethodsOfClass_withBlock___block_invoke;
  v7[3] = &unk_1E56A23C0;
  id v8 = v5;
  id v6 = v5;
  +[CNObjCRuntimeAPI enumerateMethodsOfClass:a3 withBlock:v7];
}

void __49__CNObjCClass_enumerateMethodsOfClass_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x192FD0880]();
  id v5 = [[CNObjCMethod alloc] initWithMethod:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateMethodsWithBlock:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() enumerateMethodsOfClass:self->_cls withBlock:v4];
}

+ (id)instanceMethodOfClass:(Class)a3 forSelector:(SEL)a4
{
  InstanceMethod = (CNObjCMethod *)class_getInstanceMethod(a3, a4);
  if (InstanceMethod) {
    InstanceMethod = [[CNObjCMethod alloc] initWithMethod:InstanceMethod];
  }

  return InstanceMethod;
}

+ (id)allMethodsOfClass:(Class)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__CNObjCClass_allMethodsOfClass___block_invoke;
  v8[3] = &unk_1E56A23E8;
  id v6 = v5;
  id v9 = v6;
  [a1 enumerateMethodsOfClass:a3 withBlock:v8];

  return v6;
}

uint64_t __33__CNObjCClass_allMethodsOfClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)allMethods
{
  v3 = objc_opt_class();
  Class cls = self->_cls;

  return (id)[v3 allMethodsOfClass:cls];
}

- (id)instanceMethodForSelector:(SEL)a3
{
  id v5 = objc_opt_class();
  Class cls = self->_cls;

  return (id)[v5 instanceMethodOfClass:cls forSelector:a3];
}

+ (BOOL)addMethod:(id)a3 toClass:(Class)a4
{
  id v5 = a3;
  id v6 = (const char *)[v5 selector];
  v7 = (void (*)(void))[v5 implementation];
  id v8 = [v5 typeEncoding];

  id v9 = v8;
  LOBYTE(a4) = class_addMethod(a4, v6, v7, (const char *)[v9 UTF8String]);

  return (char)a4;
}

- (BOOL)addMethod:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(id)objc_opt_class() addMethod:v4 toClass:self->_cls];

  return (char)self;
}

@end