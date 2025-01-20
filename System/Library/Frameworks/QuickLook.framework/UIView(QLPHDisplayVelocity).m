@interface UIView(QLPHDisplayVelocity)
+ (uint64_t)qlph_animateView:()QLPHDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:;
@end

@implementation UIView(QLPHDisplayVelocity)

+ (uint64_t)qlph_animateView:()QLPHDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  long long v11 = a4[1];
  v13[0] = *a4;
  v13[1] = v11;
  v13[2] = a4[2];
  return objc_msgSend(a1, "qlpu_animateView:toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:", a3, v13, a9, a10, a11);
}

@end