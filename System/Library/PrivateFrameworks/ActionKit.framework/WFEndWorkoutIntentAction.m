@interface WFEndWorkoutIntentAction
- (BOOL)allowsContinueInAppWhenRunningRemotely;
- (BOOL)isParameterHidden:(id)a3;
- (BOOL)skipsProcessingHiddenParameters;
- (id)actionForAppIdentifier:(id)a3;
- (id)appResource;
- (id)selectedAppNotSupportedError;
@end

@implementation WFEndWorkoutIntentAction

- (id)selectedAppNotSupportedError
{
  v15[2] = *MEMORY[0x263EF8340];
  v3 = WFLocalizedString(@"Unsupported Device");
  v4 = NSString;
  v5 = WFLocalizedString(@"This action can only be run on Apple Watch.");
  v6 = [(WFEndWorkoutIntentAction *)self localizedName];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

  v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F870B8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v14[0] = *MEMORY[0x263F08338];
  v14[1] = v10;
  v15[0] = v3;
  v15[1] = v7;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v12 = [v8 errorWithDomain:v9 code:10 userInfo:v11];

  return v12;
}

- (id)appResource
{
  return 0;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (BOOL)allowsContinueInAppWhenRunningRemotely
{
  return 1;
}

- (BOOL)isParameterHidden:(id)a3
{
  id v3 = a3;
  v4 = [v3 resourceManager];
  if ([v4 resourcesRequiredForDisplayAvailable]) {
    char v5 = [v3 isHidden];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)actionForAppIdentifier:(id)a3
{
  return 0;
}

@end