@interface DNDSAppSpecificSettingsTypeAppConfigurationTargetContentIdentifierPrefix
+ (Class)appSpecificSettingsClass;
+ (Class)appSpecificSettingsEncodedClass;
+ (NSString)appSpecificSettingsEntity;
+ (id)appSpecificSettingsForManagedObject:(id)a3;
+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3;
+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3;
+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4;
@end

@implementation DNDSAppSpecificSettingsTypeAppConfigurationTargetContentIdentifierPrefix

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)@"AppConfigurationTargetContentIdentifierPrefix";
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(&cfstr_Nsstring.isa);
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  return (id)[a3 targetContentIdentifierPrefix];
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
}

+ (Class)appSpecificSettingsEncodedClass
{
  return NSClassFromString(&cfstr_Nsstring.isa);
}

+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"AppConfigurationTargetContentIdentifierPrefix"];
}

+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  [v4 setObject:v3 forKeyedSubscript:@"AppConfigurationTargetContentIdentifierPrefix"];
  v5 = (void *)[v4 copy];

  return v5;
}

@end