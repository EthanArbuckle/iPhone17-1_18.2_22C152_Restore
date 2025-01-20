@interface CAMediaTimingFunction(HUAnimationAdditions)
+ (id)hu_functionWithAnimationCurve:()HUAnimationAdditions;
@end

@implementation CAMediaTimingFunction(HUAnimationAdditions)

+ (id)hu_functionWithAnimationCurve:()HUAnimationAdditions
{
  if (a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:", **((void **)&unk_1E638E5E8 + a3), v3);
  }
  return v5;
}

@end