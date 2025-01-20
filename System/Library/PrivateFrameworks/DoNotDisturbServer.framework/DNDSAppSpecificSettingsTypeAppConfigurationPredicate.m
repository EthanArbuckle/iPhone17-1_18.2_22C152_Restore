@interface DNDSAppSpecificSettingsTypeAppConfigurationPredicate
+ (Class)appSpecificSettingsClass;
+ (Class)appSpecificSettingsEncodedClass;
+ (NSString)appSpecificSettingsEntity;
+ (id)appSpecificSettingsForManagedObject:(id)a3;
+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3;
+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3;
+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4;
@end

@implementation DNDSAppSpecificSettingsTypeAppConfigurationPredicate

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)@"AppConfigurationPredicate";
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(&cfstr_Nspredicate.isa);
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a3 predicateFormat];
  v5 = [v3 predicateWithFormat:v4];

  return v5;
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  id v5 = a3;
  id v6 = [a4 predicateFormat];
  [v5 setPredicateFormat:v6];
}

+ (Class)appSpecificSettingsEncodedClass
{
  return NSClassFromString(&cfstr_Nsstring.isa);
}

+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [a3 objectForKeyedSubscript:@"AppConfigurationActionPredicate"];
  id v5 = [v3 predicateWithFormat:v4];

  return v5;
}

+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  id v5 = [v3 predicateFormat];
  [v4 setObject:v5 forKeyedSubscript:@"AppConfigurationActionPredicate"];

  id v6 = (void *)[v4 copy];
  return v6;
}

@end