@interface FASTChildSetupControllerProvider
- (id)newChildSetupControllerOnChildDeviceWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5 introductionModelCompletionHandler:(id)a6;
- (id)newChildSetupControllerWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6 completionHandler:(id)a7;
- (id)newChildSetupControllerWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6 introductionModelCompletionHandler:(id)a7;
@end

@implementation FASTChildSetupControllerProvider

- (id)newChildSetupControllerOnChildDeviceWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5 introductionModelCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)getSTChildSetupControllerClass()) initOnChildDeviceWithDSID:v12 childAge:v11 childName:v10];

  [v13 setCompletionHandlerWithIntroductionModel:v9];
  return v13;
}

- (id)newChildSetupControllerWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)getSTChildSetupControllerClass()) initWithDSID:v14 updateExistingSettings:v9 childAge:v13 childName:v12];

  [v15 setCompletionHandler:v11];
  return v15;
}

- (id)newChildSetupControllerWithDSID:(id)a3 updateExistingSettings:(BOOL)a4 childAge:(id)a5 childName:(id)a6 introductionModelCompletionHandler:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)getSTChildSetupControllerClass()) initWithDSID:v14 updateExistingSettings:v9 childAge:v13 childName:v12];

  [v15 setCompletionHandlerWithIntroductionModel:v11];
  return v15;
}

@end