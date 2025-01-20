@interface CATransaction(PKCommon)
+ (uint64_t)_pk_withDisabledActions:()PKCommon perform:;
@end

@implementation CATransaction(PKCommon)

+ (uint64_t)_pk_withDisabledActions:()PKCommon perform:
{
  v5 = (void *)MEMORY[0x1E4F39CF8];
  v6 = a4;
  [v5 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:a3];
  v6[2](v6);

  v7 = (void *)MEMORY[0x1E4F39CF8];

  return [v7 commit];
}

@end