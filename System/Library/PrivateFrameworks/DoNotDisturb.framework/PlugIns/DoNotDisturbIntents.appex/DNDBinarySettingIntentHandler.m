@interface DNDBinarySettingIntentHandler
- (void)handleGetSetting:(id)a3 completion:(id)a4;
- (void)handleSetBinarySetting:(id)a3 completion:(id)a4;
@end

@implementation DNDBinarySettingIntentHandler

- (void)handleSetBinarySetting:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(DNDIntentHandler);
  v8 = +[DNDStateService serviceForClientIdentifier:@"com.apple.DoNotDisturb.Intents"];
  v9 = [v8 queryCurrentStateWithError:0];
  if ([v9 isActive]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = [v5 toDNDIntent];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100001FAC;
  v14[3] = &unk_100004200;
  id v15 = v5;
  id v16 = v6;
  uint64_t v17 = v10;
  id v12 = v5;
  id v13 = v6;
  [(DNDIntentHandler *)v7 handleToggleDoNotDisturb:v11 completion:v14];
}

- (void)handleGetSetting:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = a3;
  v7 = +[DNDStateService serviceForClientIdentifier:@"com.apple.DoNotDisturb.Intents"];
  v8 = [v7 queryCurrentStateWithError:0];
  if ([v8 isActive]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  id v10 = [objc_alloc((Class)INGetSettingIntentResponse) initWithCode:3 userActivity:0];
  id v11 = objc_alloc((Class)INGetSettingResponseData);
  id v12 = [v6 settingMetadata];

  id v13 = [v11 initWithSettingMetadata:v12 numericValue:0 boundedValue:0 binaryValue:v9 labeledValue:0];
  id v15 = v13;
  v14 = +[NSArray arrayWithObjects:&v15 count:1];
  [v10 setSettingResponseDatas:v14];

  v5[2](v5, v10);
}

@end