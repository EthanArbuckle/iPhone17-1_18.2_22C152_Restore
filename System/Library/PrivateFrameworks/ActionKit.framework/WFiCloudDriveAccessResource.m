@interface WFiCloudDriveAccessResource
+ (BOOL)isSystemResource;
+ (BOOL)mustBeAvailableForDisplay;
- (WFiCloudDriveAccessResource)initWithDefinition:(id)a3;
- (id)associatedAppIdentifier;
- (id)localizedErrorReasonForStatus:(unint64_t)a3;
- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3;
- (id)localizedImportErrorReasonForStatus:(unint64_t)a3;
- (id)localizedProtectedResourceDescriptionWithContext:(id)a3;
- (unint64_t)status;
- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
@end

@implementation WFiCloudDriveAccessResource

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = (void *)MEMORY[0x263F33718];
  id v8 = a4;
  v9 = [v7 sharedContext];
  v10 = [NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Ubiquity"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __103__WFiCloudDriveAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
  v12[3] = &unk_264E59738;
  id v13 = v6;
  id v11 = v6;
  [v9 openURL:v10 withBundleIdentifier:@"com.apple.Preferences" userInterface:v8 completionHandler:v12];
}

uint64_t __103__WFiCloudDriveAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Open Settings");
  v6[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  return WFLocalizedString(@"In order to answer this question, Shortcuts needs access to your iCloud Drive account. Log into iCloud in Settings.");
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  return WFLocalizedString(@"Shortcuts can’t access iCloud Drive because no account is set up. Visit the Settings app to log into iCloud.");
}

- (unint64_t)status
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [v2 ubiquityIdentityToken];

  if (v3) {
    unint64_t v4 = 4;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F085F0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFiCloudDriveAccessResource;
  [(WFAccessResource *)&v4 dealloc];
}

- (WFiCloudDriveAccessResource)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFiCloudDriveAccessResource;
  v3 = [(WFAccessResource *)&v7 initWithDefinition:a3];
  if (v3)
  {
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_refreshAvailabilityWithNotification name:*MEMORY[0x263F085F0] object:0];

    v5 = v3;
  }

  return v3;
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3 = a3;
  objc_super v4 = WFLocalizedStringResourceWithKey(@"iCloud Drive", @"iCloud Drive");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)associatedAppIdentifier
{
  return @"com.apple.iCloudDriveApp";
}

+ (BOOL)isSystemResource
{
  return 1;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end