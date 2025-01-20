@interface CASpringAnimation(ClipServicesUIExtras)
+ (id)cps_animationForKeyPath:()ClipServicesUIExtras from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:;
@end

@implementation CASpringAnimation(ClipServicesUIExtras)

+ (id)cps_animationForKeyPath:()ClipServicesUIExtras from:to:beginAfter:duration:mass:stiffness:damping:keepFinalFrame:
{
  v8 = objc_msgSend(MEMORY[0x1E4F39C90], "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:");
  [v8 setMass:a3];
  [v8 setStiffness:a4];
  [v8 setDamping:a5];

  return v8;
}

@end