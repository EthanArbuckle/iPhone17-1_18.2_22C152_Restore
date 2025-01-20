@interface CABasicAnimation(ClipServicesUIExtras)
+ (id)cps_animationForKeyPath:()ClipServicesUIExtras from:to:beginAfter:duration:keepFinalFrame:;
+ (uint64_t)cps_nullAnimationWithDuration:()ClipServicesUIExtras;
@end

@implementation CABasicAnimation(ClipServicesUIExtras)

+ (id)cps_animationForKeyPath:()ClipServicesUIExtras from:to:beginAfter:duration:keepFinalFrame:
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  v16 = [(id)objc_opt_class() animationWithKeyPath:v15];

  [v16 setFromValue:v14];
  [v16 setToValue:v13];

  [v16 setAdditive:0];
  [v16 setRemovedOnCompletion:0];
  v17 = (void *)MEMORY[0x1E4F39FA8];
  if (!a8) {
    v17 = (void *)MEMORY[0x1E4F39F98];
  }
  [v16 setFillMode:*v17];
  [v16 setBeginTime:CACurrentMediaTime() + a1];
  [v16 setDuration:a2];

  return v16;
}

+ (uint64_t)cps_nullAnimationWithDuration:()ClipServicesUIExtras
{
  return objc_msgSend(a1, "cps_animationForKeyPath:from:to:beginAfter:duration:keepFinalFrame:", &stru_1F306C450, 0, 0, 1, 0.0, a3);
}

@end