@interface DNDSAppSpecificSettingsTypeAppConfigurationAction
+ (Class)appSpecificSettingsClass;
+ (Class)appSpecificSettingsEncodedClass;
+ (NSString)appSpecificSettingsEntity;
+ (id)appSpecificSettingsForManagedObject:(id)a3;
+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3;
+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3;
+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4;
@end

@implementation DNDSAppSpecificSettingsTypeAppConfigurationAction

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)@"AppConfigurationAction";
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(&cfstr_Dndappaction.isa);
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F5F570];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 encodedAction];
  v7 = [v4 identifier];
  v8 = [v4 application];
  v9 = [v8 bundleIdentifier];
  uint64_t v10 = [v4 enabled];

  v11 = (void *)[v5 initWithEncodedAction:v6 actionIdentifier:v7 bundleIdentifier:v9 enabled:v10];
  return v11;
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  id v5 = a4;
  id v11 = a3;
  v6 = [v11 application];
  v7 = [v6 bundleIdentifier];
  [v5 setBundleIdentifier:v7];

  v8 = [v11 identifier];
  [v5 setIdentifier:v8];

  v9 = [v5 encodedAction];
  [v11 setEncodedAction:v9];

  uint64_t v10 = [v5 isEnabled];
  [v11 setEnabled:v10];
}

+ (Class)appSpecificSettingsEncodedClass
{
  return NSClassFromString(&cfstr_Nsdictionary.isa);
}

+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3
{
  return (id)[MEMORY[0x1E4F5F570] appActionFromDictionaryRepresentation:a3];
}

+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3
{
  return (id)[a3 dictionaryRepresentation];
}

@end