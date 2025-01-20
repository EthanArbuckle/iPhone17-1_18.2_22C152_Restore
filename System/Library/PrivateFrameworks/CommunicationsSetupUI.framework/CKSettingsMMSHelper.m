@interface CKSettingsMMSHelper
+ (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4;
@end

@implementation CKSettingsMMSHelper

+ (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F4AF80] sharedFeatureFlags];
  int v8 = [v7 isReadMMSDefaultFromCBEnabled];

  if (v8)
  {
    v9 = [MEMORY[0x263F4AF48] sharedInstance];
    v10 = [v9 ctSubscriptionInfo];
    v11 = objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);

    if (v11) {
      goto LABEL_3;
    }
    if (IMSharedHelperDeviceHasMultipleActiveSubscriptions()) {
      goto LABEL_9;
    }
    v17 = [MEMORY[0x263F4AF48] sharedInstance];
    v18 = [v17 ctSubscriptionInfo];
    v19 = [v18 subscriptions];
    v11 = [v19 firstObject];

    if (v11)
    {
LABEL_3:
      v12 = [MEMORY[0x263F4AF48] sharedInstance];
      v13 = (void *)[v12 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_26D075A58 defaultValue:0 valueIfError:0];

      if (v13)
      {
        v14 = [v13 valueForKey:@"MMSDefaultEnabled"];
        v15 = v14;
        if (v14) {
          char v16 = [v14 BOOLValue];
        }
        else {
          char v16 = 1;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
LABEL_9:
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

@end