@interface CNTCCFactory
+ (Class)defaultClass;
+ (Class)defaultClassForType:(int64_t)a3;
+ (id)defaultTCC;
+ (id)defaultTCCForType:(int64_t)a3;
@end

@implementation CNTCCFactory

+ (id)defaultTCC
{
  return +[CNTCCFactory defaultTCCForType:1];
}

+ (id)defaultTCCForType:(int64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"unrecognized CNTCCType" userInfo:0];
      objc_exception_throw(v6);
    }
    v3 = off_1E569EB50;
  }
  else
  {
    v3 = off_1E569EB48;
  }
  id v4 = objc_alloc_init(*v3);

  return v4;
}

+ (Class)defaultClass
{
  return +[CNTCCFactory defaultClassForType:1];
}

+ (Class)defaultClassForType:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"unrecognized CNTCCType" userInfo:0];
    objc_exception_throw(v5);
  }
  v3 = objc_opt_class();

  return (Class)v3;
}

@end