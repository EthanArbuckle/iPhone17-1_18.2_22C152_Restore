@interface SAPhoneCallEmergencySnippet
- (id)sr_sirilandShim;
@end

@implementation SAPhoneCallEmergencySnippet

- (id)sr_sirilandShim
{
  id v3 = objc_alloc_init((Class)SFCard);
  v4 = [(SAPhoneCallEmergencySnippet *)self title];
  [v3 setTitle:v4];

  [v3 setType:1];
  v29 = self;
  v5 = [(SAPhoneCallEmergencySnippet *)self aceId];
  [v3 setCardId:v5];

  [v3 setSource:2];
  id v28 = objc_alloc_init((Class)SFNullCardSection);
  id v30 = v28;
  v6 = +[NSArray arrayWithObjects:&v30 count:1];
  [v3 setCardSections:v6];

  id v7 = [objc_alloc((Class)INStartCallIntent) initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:2 contacts:0 callCapability:0];
  v8 = [v7 backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = objc_alloc_init((Class)_INPBIntentMetadata);
    [v10 setLaunchId:@"x-apple-siri-app://com.apple.InCallService"];
    [v10 setSystemExtensionBundleId:@"com.apple.InCallService.IntentsUI"];
    [v9 setIntentMetadata:v10];
    [v7 setBackingStore:v9];
  }
  id v11 = [objc_alloc((Class)INStartCallIntentResponse) initWithCode:1 userActivity:0];
  v12 = [v7 backingStore];
  v13 = [v12 data];

  [v3 setIntentMessageData:v13];
  [v3 setIntentMessageName:@"sirikit.intent.call.StartCallIntent"];
  v14 = [v11 backingStore];
  v15 = [v14 data];
  [v3 setIntentResponseMessageData:v15];

  [v3 setIntentResponseMessageName:@"sirikit.intent.call.StartCallIntentResponse"];
  id v16 = objc_alloc_init((Class)SACardSnippet);
  id v17 = [objc_alloc((Class)_SFPBCard) initWithFacade:v3];
  v18 = [v17 data];
  [v16 setCardData:v18];

  id v19 = objc_alloc_init((Class)SAUISash);
  LODWORD(v17) = AFIsInternalInstall();
  uint64_t v20 = sub_1000606C4(@"EMERGENCY_CALL_SASH_TITLE");
  v21 = (void *)v20;
  if (v17) {
    CFStringRef v22 = @"%@ (INTERNAL ONLY: LEGACY FLOW)";
  }
  else {
    CFStringRef v22 = @"%@";
  }
  v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v20);
  [v19 setTitle:v23];

  id v24 = objc_alloc_init((Class)SAUIColor);
  [v24 setRedValue:255];
  [v24 setGreenValue:255];
  [v24 setBlueValue:255];
  [v24 setAlpha:&off_100149A30];
  [v19 setTextColor:v24];
  id v25 = objc_alloc_init((Class)SAUIColor);
  [v25 setRedValue:255];
  [v25 setGreenValue:0];
  [v25 setBlueValue:0];
  [v25 setAlpha:&off_100149A30];
  [v19 setBackgroundColor:v25];
  [v16 setSash:v19];
  [v16 sr_applySnippetProperties:v29];
  v26 = +[NSNotificationCenter defaultCenter];
  [v26 postNotificationName:AFUIDidShowEmergencyCallViewNotification object:0];

  return v16;
}

@end