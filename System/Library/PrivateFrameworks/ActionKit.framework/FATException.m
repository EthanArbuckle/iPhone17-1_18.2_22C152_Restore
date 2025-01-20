@interface FATException
+ (id)structFields;
+ (id)structName;
+ (void)initialize;
- (FATException)init;
- (void)read:(id)a3;
- (void)write:(id)a3;
@end

@implementation FATException

- (void)write:(id)a3
{
}

- (void)read:(id)a3
{
}

- (FATException)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(FATException *)self initWithName:v4 reason:@"unknown" userInfo:0];

  return v5;
}

+ (id)structFields
{
  return 0;
}

+ (id)structName
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__FATException_initialize__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, block);
    }
  }
}

void __26__FATException_initialize__block_invoke()
{
  unsigned int outCount = 0;
  v0 = (objc_class *)objc_opt_class();
  v1 = class_copyMethodList(v0, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v3 = (objc_class *)objc_opt_class();
      Name = method_getName(v1[i]);
      Implementation = method_getImplementation(v1[i]);
      TypeEncoding = method_getTypeEncoding(v1[i]);
      class_addMethod(v3, Name, Implementation, TypeEncoding);
    }
  }
  free(v1);
}

@end