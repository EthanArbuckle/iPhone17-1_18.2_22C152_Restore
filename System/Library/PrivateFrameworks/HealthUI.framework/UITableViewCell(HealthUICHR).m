@interface UITableViewCell(HealthUICHR)
- (void)hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:()HealthUICHR;
@end

@implementation UITableViewCell(HealthUICHR)

- (void)hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:()HealthUICHR
{
  if (a3)
  {
    v4 = [a1 traitCollection];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 6)
    {
      v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
      [a1 setBackgroundColor:v6];
    }
  }
  return a1;
}

@end