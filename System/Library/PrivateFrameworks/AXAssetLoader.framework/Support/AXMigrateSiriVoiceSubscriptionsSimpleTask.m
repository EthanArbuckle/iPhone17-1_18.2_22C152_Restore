@interface AXMigrateSiriVoiceSubscriptionsSimpleTask
+ (id)triggers;
@end

@implementation AXMigrateSiriVoiceSubscriptionsSimpleTask

+ (id)triggers
{
  v2 = +[AXSimpleAssetTaskTrigger withFirstBootType];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

@end