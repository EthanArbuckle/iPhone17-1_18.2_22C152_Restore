@interface UIImageSymbolConfiguration(LPExtras)
+ (id)_lp_configurationWithTextStyle:()LPExtras weight:scale:;
+ (uint64_t)_lp_configurationWithPointSize:()LPExtras;
@end

@implementation UIImageSymbolConfiguration(LPExtras)

+ (uint64_t)_lp_configurationWithPointSize:()LPExtras
{
  return objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithPointSize:");
}

+ (id)_lp_configurationWithTextStyle:()LPExtras weight:scale:
{
  v6 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:a3 scale:a5];
  v7 = [MEMORY[0x1E4FB1830] configurationWithWeight:a4];
  v8 = [v6 configurationByApplyingConfiguration:v7];

  return v8;
}

@end