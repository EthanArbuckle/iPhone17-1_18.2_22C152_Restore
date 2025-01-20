@interface CATransaction(HealthUI)
+ (uint64_t)hk_performWithoutAnimations:()HealthUI;
@end

@implementation CATransaction(HealthUI)

+ (uint64_t)hk_performWithoutAnimations:()HealthUI
{
  v3 = (void *)MEMORY[0x1E4F39CF8];
  v4 = a3;
  [v3 begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  v4[2](v4);

  v5 = (void *)MEMORY[0x1E4F39CF8];
  return [v5 commit];
}

@end