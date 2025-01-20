@interface MTLFunctionConstant
+ (MTLFunctionConstant)allocWithZone:(_NSZone *)a3;
@end

@implementation MTLFunctionConstant

+ (MTLFunctionConstant)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLFunctionConstant *)+[MTLFunctionConstant allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLFunctionConstant;
    return (MTLFunctionConstant *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

@end