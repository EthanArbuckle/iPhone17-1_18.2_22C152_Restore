@interface IMAssistantCoreTelephonySubscriptionsDefaultDataSource
+ (id)sharedInstance;
- (BOOL)deviceHasMultipleSubscriptions;
- (id)bestSenderIdentityForChatWithHandleIDs:(id)a3;
- (id)handleIDForSenderIdentity:(id)a3;
- (id)simIDForSenderIdentity:(id)a3;
- (id)subscriptionContextForSenderIdentity:(id)a3;
@end

@implementation IMAssistantCoreTelephonySubscriptionsDefaultDataSource

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22C1CCDF4;
  block[3] = &unk_264912A68;
  block[4] = a1;
  if (qword_2684A5588 != -1) {
    dispatch_once(&qword_2684A5588, block);
  }
  v2 = (void *)qword_2684A5580;

  return v2;
}

- (BOOL)deviceHasMultipleSubscriptions
{
  int HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  if (HasMultipleSubscriptions)
  {
    uint64_t v3 = MEMORY[0x263EFEAB0];
    LOBYTE(HasMultipleSubscriptions) = MEMORY[0x270F9A6D0](v3, sel_deviceSupportsGemini);
  }
  return HasMultipleSubscriptions;
}

- (id)bestSenderIdentityForChatWithHandleIDs:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F4B020];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  v6 = [v5 bestSenderIdentityForHandleIDs:v4];

  return v6;
}

- (id)handleIDForSenderIdentity:(id)a3
{
  uint64_t v3 = [(IMAssistantCoreTelephonySubscriptionsDefaultDataSource *)self subscriptionContextForSenderIdentity:a3];
  id v4 = [v3 phoneNumber];

  return v4;
}

- (id)simIDForSenderIdentity:(id)a3
{
  uint64_t v3 = [(IMAssistantCoreTelephonySubscriptionsDefaultDataSource *)self subscriptionContextForSenderIdentity:a3];
  id v4 = [v3 labelID];

  return v4;
}

- (id)subscriptionContextForSenderIdentity:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 accountUUID];
  id v4 = [v3 UUIDString];

  v5 = [MEMORY[0x263F4AF48] sharedInstance];
  v6 = [v5 ctSubscriptionInfo];
  v7 = [v6 subscriptions];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "labelID", (void)v16);
        int v14 = [v4 isEqualToString:v13];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

@end