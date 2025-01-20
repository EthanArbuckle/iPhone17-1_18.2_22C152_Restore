@interface AppDefaultsManager
+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5;
+ (BOOL)allowPurchaseRequestData;
+ (BOOL)alwaysUseLegacyAPIForStoreKitProductsRequest;
+ (BOOL)externalPurchaseSpringBoardAppDeleteAlertEnabled;
+ (BOOL)keepTemporaryFiles;
+ (BOOL)marketingDemoModeEnabled;
+ (NSArray)ocelotApps;
+ (NSDictionary)transporterConfiguration;
+ (const)kSKUserDefaultsIdentifier;
+ (id)databaseEncryptionKeyForIdentifier:(id)a3;
+ (void)deleteDatabaseEncryptionKeyForIdentifier:(id)a3;
+ (void)setDatabaseEncryptionKey:(id)a3 forIdentifier:(id)a4;
+ (void)setExternalPurchaseSpringBoardAppDeleteAlertEnabled:(BOOL)a3;
+ (void)setKSKUserDefaultsIdentifier:(const __CFString *)a3;
+ (void)setOcelotApps:(id)a3;
+ (void)setTransporterConfiguration:(id)a3;
@end

@implementation AppDefaultsManager

+ (BOOL)keepTemporaryFiles
{
  return CFPreferencesGetAppBooleanValue(@"KeepTemporaryFiles", @"com.apple.appstored", 0) != 0;
}

+ (BOOL)marketingDemoModeEnabled
{
  return CFPreferencesGetAppBooleanValue(@"MarketingDemoMode", @"com.apple.appstored", 0) != 0;
}

+ (NSArray)ocelotApps
{
  v2 = (void *)CFPreferencesCopyAppValue(@"BeagleApps", @"com.apple.appstored");

  return (NSArray *)v2;
}

+ (void)setOcelotApps:(id)a3
{
  CFPreferencesSetAppValue(@"BeagleApps", a3, @"com.apple.appstored");

  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

+ (BOOL)allowPurchaseRequestData
{
  BOOL v2 = CFPreferencesGetAppBooleanValue(@"AllowStoreKitPaymentRequestData", @"com.apple.appstored", 0) != 0;
  return (CFPreferencesGetAppBooleanValue(@"AllowStoreKitPaymentWithRequestDataWithoutEntitlement", @"com.apple.itunesstored", 0) | v2) != 0;
}

+ (BOOL)alwaysUseLegacyAPIForStoreKitProductsRequest
{
  return CFPreferencesGetAppBooleanValue(@"UseLegacyAPIForSKProductRequest", @"com.apple.appstored", 0) != 0;
}

+ (BOOL)externalPurchaseSpringBoardAppDeleteAlertEnabled
{
  return _[a1 _BOOLForKey:@"ExternalPurchasesSpringBoardAppDeleteIsEnabled" applicationId:@"com.apple.appstored" ifMissing:1];
}

+ (void)setExternalPurchaseSpringBoardAppDeleteAlertEnabled:(BOOL)a3
{
  v3 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!a3) {
    v3 = (CFPropertyListRef *)&kCFBooleanFalse;
  }
  CFPreferencesSetAppValue(@"ExternalPurchasesSpringBoardAppDeleteIsEnabled", *v3, @"com.apple.appstored");

  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

+ (void)setTransporterConfiguration:(id)a3
{
  CFPreferencesSetAppValue(@"TransporterConfiguration", a3, @"com.apple.appstored");

  CFPreferencesAppSynchronize(@"com.apple.appstored");
}

+ (NSDictionary)transporterConfiguration
{
  BOOL v2 = (void *)CFPreferencesCopyAppValue(@"TransporterConfiguration", @"com.apple.appstored");

  return (NSDictionary *)v2;
}

+ (BOOL)_BOOLForKey:(__CFString *)a3 applicationId:(__CFString *)a4 ifMissing:(BOOL)a5
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v6 = CFPreferencesGetAppBooleanValue(a3, a4, &keyExistsAndHasValidFormat) == 1;
  if (keyExistsAndHasValidFormat == 1) {
    return v6;
  }
  else {
    return a5;
  }
}

+ (const)kSKUserDefaultsIdentifier
{
  id v2 = sub_100109EAC();

  return (const __CFString *)v2;
}

+ (void)setKSKUserDefaultsIdentifier:(const __CFString *)a3
{
}

+ (id)databaseEncryptionKeyForIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = sub_100109FB8();
  unint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (v5 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000D57F8(v3, v5);
  }

  return isa;
}

+ (void)setDatabaseEncryptionKey:(id)a3 forIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10010A444();
  swift_bridgeObjectRelease();

  sub_100012EB8(v7, v9);
}

+ (void)deleteDatabaseEncryptionKeyForIdentifier:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10010A5D4();

  swift_bridgeObjectRelease();
}

@end