@interface AEAssessmentAgentService
+ (id)registerRestrictionEnforcer:(id)a3 machServiceName:(id)a4;
+ (id)setOfActiveRestrictionUUIDs:(id)a3;
@end

@implementation AEAssessmentAgentService

+ (id)registerRestrictionEnforcer:(id)a3 machServiceName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = -[AEAssessmentModeRestrictionEnforcementSession initWithRestrictionEnforcer:machServiceName:]((id *)[AEAssessmentModeRestrictionEnforcementSession alloc], v6, v5);

  return v7;
}

+ (id)setOfActiveRestrictionUUIDs:(id)a3
{
  id v3 = a3;
  v4 = +[AEActiveRestrictionUUIDFetchingProxy daemonProxyWithQueue:MEMORY[0x263EF83A0]];
  id v5 = [v4 setOfActiveRestrictionUUIDs:v3];

  return v5;
}

@end