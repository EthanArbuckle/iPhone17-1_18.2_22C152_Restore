@interface CNGeminiManager
+ (BOOL)deviceSupportsGemini;
+ (id)channelStringFromSenderIdentity:(id)a3;
+ (id)descriptorForRequiredKeys;
- (BOOL)isReferencedByContactsForSenderLabelIdentifier:(id)a3 store:(id)a4;
- (BOOL)remapChannelIdentifier:(id)a3 toIdentifier:(id)a4 error:(id *)a5;
- (BOOL)remapContactsHavingPreferredChannelIdentifier:(id)a3 toPreferredChannelIdentifier:(id)a4 contactStore:(id)a5 error:(id *)a6;
- (BOOL)remapMessagesHavingChannelIdentifier:(uint64_t)a1 toChannelIdentifier:(void *)a2 error:(void *)a3;
- (BOOL)remapRecentCallsHavingChannelIdentifier:(uint64_t)a1 toChannelIdentifier:(void *)a2 error:(void *)a3;
- (CNGeminiManager)init;
- (CNGeminiManager)initWithCallProviderManager:(id)a3;
- (CNGeminiManager)initWithEnvironment:(id)a3 coreTelephonyClient:(id)a4 callProviderManager:(id)a5;
- (CNGeminiResult)geminiResultForChannel:(uint64_t)a3 usage:(void *)a4 availableChannels:(int)a5 isUnknownNumber:;
- (CNGeminiResult)geminiResultForHandle:(void *)a3 contactStore:(uint64_t)a4 substituteDefaultForDangling:(uint64_t)a5 error:;
- (id)badgeLabelForSenderIdentity:(id)a3 error:(id *)a4;
- (id)badgeLabelForSubscription:(id)a3 error:(id *)a4;
- (id)bestChannelIdentifierForPhoneNumbers:(void *)a3 fromChannelIdentifiers:(void *)a4 defaultChannelIdentifier:;
- (id)bestSenderIdentityForContact:(id)a3 error:(id *)a4;
- (id)bestSenderIdentityForFavoritesEntry:(id)a3 error:(id *)a4;
- (id)bestSenderIdentityForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5;
- (id)bestSubscriptionForContact:(id)a3 error:(id *)a4;
- (id)bestSubscriptionForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5;
- (id)callProviderManager;
- (id)channelForContact:(id)a3 error:(id *)a4;
- (id)channelForFavoritesEntry:(id)a3 error:(id *)a4;
- (id)channelForFavoritesEntry:(void *)a1 includeDanglingChannels:(void *)a2 error:(int)a3;
- (id)channelForPreferredChannelString:(void *)a3 fromChannels:(int)a4 synthesizeMissingChannels:;
- (id)channelIdentifierForMostRecentCallFromPhoneNumbers:(uint64_t)a1 fromChannelIdentifiers:(void *)a2;
- (id)channelIdentifierForMostRecentSMSFromPhoneNumbers:(void *)a3 fromChannelIdentifiers:;
- (id)channelsByIdentifierIncludingDanglingPlans:(uint64_t)a3 defaultChannel:(void *)a4 availableChannels:;
- (id)contactForPhoneString:(void *)a3 contactStore:;
- (id)coreTelephonyClient;
- (id)fakeSenderIdentities;
- (id)fetchedSenderIdentitiesWithError:(id *)a3;
- (id)fetchedSubscriptionForSenderIdentity:(id)a1;
- (id)fetchedSubscriptionsWithError:(id)a1;
- (id)geminiResultForContact:(id)a3 error:(id *)a4;
- (id)geminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 error:(id *)a5;
- (id)geminiResultForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5;
- (id)mostRecentChannelIdentifierForPhoneNumbers:(void *)a3 fromChannelIdentifiers:;
- (id)remoteBestSenderIdentityForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5;
- (id)remoteGeminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 error:(id *)a5;
- (unint64_t)dataSourceExclusions;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)notifyDelegateOfChannelUpdates;
- (void)removeDelegate:(id)a3;
- (void)setDataSourceExclusions:(unint64_t)a3;
@end

@implementation CNGeminiManager

void __44__CNGeminiManager_descriptorForRequiredKeys__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"phoneNumbers";
  v5[1] = @"preferredChannel";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  v1 = [NSString stringWithFormat:@"Gemini"];
  v2 = +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:v0 description:v1];
  uint64_t v3 = [v2 copy];
  v4 = (void *)descriptorForRequiredKeys_cn_once_object_4;
  descriptorForRequiredKeys_cn_once_object_4 = v3;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_4 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_4, &__block_literal_global_8);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_4;

  return v2;
}

+ (BOOL)deviceSupportsGemini
{
  id v2 = a1;
  objc_sync_enter(v2);
  int v3 = deviceSupportsGemini_haveValidGeminiStatus;
  if (deviceSupportsGemini_haveValidGeminiStatus == 1)
  {
    LOBYTE(v4) = deviceSupportsGemini_supportsGemini != 0;
    goto LABEL_8;
  }
  self;
  if (!CFPreferencesGetAppBooleanValue(@"CNEnableGemini", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0))
  {
    CFBooleanRef v4 = (const __CFBoolean *)MGCopyAnswerWithError();
    if (!v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFBooleanRef v4 = (const __CFBoolean *)*MEMORY[0x1E4F1CFD0];
  if (*MEMORY[0x1E4F1CFD0])
  {
LABEL_7:
    deviceSupportsGemini_haveValidGeminiStatus = 1;
    deviceSupportsGemini_supportsGemini = CFBooleanGetValue(v4) != 0;
    CFRelease(v4);
  }
LABEL_8:
  objc_sync_exit(v2);

  BOOL v5 = deviceSupportsGemini_supportsGemini != 0;
  if (v3) {
    return (char)v4;
  }
  return v5;
}

+ (id)channelStringFromSenderIdentity:(id)a3
{
  id v3 = a3;
  CFBooleanRef v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 accountUUID];

    if (v5)
    {
      v6 = NSString;
      v7 = [v4 accountUUID];
      v8 = [v7 UUIDString];
      BOOL v5 = [v6 stringWithFormat:@"uuid:%@", v8];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CNGeminiManager)init
{
  return [(CNGeminiManager *)self initWithEnvironment:0 coreTelephonyClient:0 callProviderManager:0];
}

- (CNGeminiManager)initWithCallProviderManager:(id)a3
{
  return [(CNGeminiManager *)self initWithEnvironment:0 coreTelephonyClient:0 callProviderManager:a3];
}

- (CNGeminiManager)initWithEnvironment:(id)a3 coreTelephonyClient:(id)a4 callProviderManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNGeminiManager;
  v12 = [(CNGeminiManager *)&v22 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.contacts.geminimanager.queue", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v12->_delegateToQueue;
    v12->_delegateToQueue = (NSMapTable *)v15;

    objc_storeStrong((id *)&v12->_environment, a3);
    objc_storeStrong((id *)&v12->_callProviderManager, a5);
    objc_storeStrong((id *)&v12->_coreTelephonyClient, a4);
    [(CoreTelephonyClient *)v12->_coreTelephonyClient setDelegate:v12];
    [(TUCallProviderManager *)v12->_callProviderManager addDelegate:v12 queue:0];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v18 = *MEMORY[0x1E4F580E8];
    self;
    v19 = [MEMORY[0x1E4F580F0] sharedManager];
    [v17 addObserver:v12 selector:sel_danglingPlansDidUpdate_ name:v18 object:v19];

    v20 = v12;
  }

  return v12;
}

- (id)coreTelephonyClient
{
  if (a1)
  {
    a1 = cn_objectResultWithObjectLock();
    uint64_t v1 = vars8;
  }
  return a1;
}

id __38__CNGeminiManager_coreTelephonyClient__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(getCoreTelephonyClientClass());
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setDelegate:");
    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }

  return v2;
}

- (id)callProviderManager
{
  if (a1)
  {
    a1 = cn_objectResultWithObjectLock();
    uint64_t v1 = vars8;
  }
  return a1;
}

id __38__CNGeminiManager_callProviderManager__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(getTUCallProviderManagerClass());
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    [*(id *)(*(void *)(a1 + 32) + 24) addDelegate:*(void *)(a1 + 32) queue:0];
    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }

  return v2;
}

- (id)channelsByIdentifierIncludingDanglingPlans:(uint64_t)a3 defaultChannel:(void *)a4 availableChannels:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v7 = [a1 fetchedSenderIdentitiesWithError:0];
    uint64_t v8 = 0;
    id v9 = 0;
    if (a2)
    {
      if ([(id)objc_opt_class() deviceSupportsGemini])
      {
        self;
        id v10 = [MEMORY[0x1E4F580F0] sharedManager];
        id v9 = [v10 danglingPlanItemsShouldUpdate:1];

        self;
        id v11 = [MEMORY[0x1E4F580F0] sharedManager];
        uint64_t v8 = [v11 planItemsShouldUpdate:1];
      }
      else
      {
        uint64_t v8 = 0;
        id v9 = 0;
      }
    }
    id v49 = (id)v8;
    v47 = a4;
    v48 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
    id v51 = v9;
    v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v9, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    obuint64_t j = v7;
    uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v63;
      uint64_t v16 = *MEMORY[0x1E4F5A298];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v63 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = -[CNGeminiChannel initWithSenderIdentity:]((id *)[CNGeminiChannel alloc], *(void **)(*((void *)&v62 + 1) + 8 * i));
          v19 = [v18 channelIdentifier];
          char v20 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v19);

          if ((v20 & 1) == 0)
          {
            v21 = [v18 channelIdentifier];
            [v12 setObject:v18 forKey:v21];

            [v48 addObject:v18];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v14);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v52 = v51;
    uint64_t v22 = [v52 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v59;
      uint64_t v25 = *MEMORY[0x1E4F5A298];
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v59 != v24) {
            objc_enumerationMutation(v52);
          }
          v27 = -[CNGeminiChannel initWithDanglingPlanItem:]((id *)[CNGeminiChannel alloc], *(void **)(*((void *)&v58 + 1) + 8 * j));
          v28 = [v27 channelIdentifier];
          char v29 = (*(uint64_t (**)(uint64_t, void *))(v25 + 16))(v25, v28);

          if ((v29 & 1) == 0)
          {
            v30 = [v27 channelIdentifier];
            [v12 setObject:v27 forKey:v30];
          }
        }
        uint64_t v23 = [v52 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v23);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v50 = v49;
    uint64_t v31 = [v50 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v55;
      uint64_t v34 = *MEMORY[0x1E4F5A298];
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v55 != v33) {
            objc_enumerationMutation(v50);
          }
          v36 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          if (([v36 isSelected] & 1) == 0)
          {
            v37 = -[CNGeminiChannel initWithDisabledCellularPlanItem:]((id *)[CNGeminiChannel alloc], v36);
            v38 = [v37 channelIdentifier];
            char v39 = (*(uint64_t (**)(uint64_t, void *))(v34 + 16))(v34, v38);

            if ((v39 & 1) == 0)
            {
              v40 = [v37 channelIdentifier];
              [v12 setObject:v37 forKey:v40];
            }
          }
        }
        uint64_t v32 = [v50 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }
      while (v32);
    }

    if (v46)
    {
      v41 = [obj firstObject];
      v42 = [v41 accountUUID];
      v43 = [v42 UUIDString];
      void *v46 = [v12 objectForKey:v43];
    }
    if (v47) {
      void *v47 = v48;
    }
    v44 = (void *)[v12 copy];
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)fetchedSenderIdentitiesWithError:(id *)a3
{
  self;
  if (CFPreferencesGetAppBooleanValue(@"CNEnableGemini", (CFStringRef)*MEMORY[0x1E4F1D3B8], 0))
  {
    uint64_t v4 = -[CNGeminiManager fakeSenderIdentities]((uint64_t)self);
  }
  else
  {
    BOOL v5 = -[CNGeminiManager callProviderManager](self);
    v6 = [v5 telephonyProvider];
    v7 = [v6 prioritizedSenderIdentities];
    uint64_t v4 = [v7 array];
  }

  return v4;
}

- (id)fakeSenderIdentities
{
  v46[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v45 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v1 = [v45 persistentDomainForName:*MEMORY[0x1E4F283E0]];
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5E4B060A-7996-47D2-804E-0833378D1311"];
    v44 = (void *)v2;
    uint64_t v3 = [v1 objectForKey:@"CNGeminiFakeSubscription1Label"];
    uint64_t v4 = (void *)v3;
    BOOL v5 = @"Home";
    if (v3) {
      BOOL v5 = (__CFString *)v3;
    }
    v6 = v5;

    uint64_t v7 = [v1 objectForKey:@"CNGeminiFakeSubscription1Number"];
    uint64_t v8 = (void *)v7;
    id v9 = @"+14104844321";
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    id v10 = v9;

    uint64_t v11 = [v1 objectForKey:@"CNGeminiFakeSubscription2Service"];
    v12 = (void *)v11;
    uint64_t v13 = @"Subspace Relay";
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    uint64_t v14 = v13;

    uint64_t v15 = [(__CFString *)v6 rangeOfComposedCharacterSequenceAtIndex:0];
    v43 = [(__CFString *)v6 substringToIndex:v15 + v16];
    v42 = (void *)[objc_alloc(getTUHandleClass()) initWithType:2 value:v10];

    id v17 = objc_alloc(getTUSenderIdentityClass());
    uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
    v19 = (void *)[v17 initWithUUID:v18 accountUUID:v2 localizedName:v6 localizedShortName:v43 localizedServiceName:v14 handle:v42];

    char v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"ACE7E1F1-744F-41A5-856F-D8822258B2E1"];
    uint64_t v21 = [v1 objectForKey:@"CNGeminiFakeSubscription2Label"];
    uint64_t v22 = (void *)v21;
    uint64_t v23 = @"Work";
    if (v21) {
      uint64_t v23 = (__CFString *)v21;
    }
    uint64_t v24 = v23;

    uint64_t v25 = [v1 objectForKey:@"CNGeminiFakeSubscription2Number"];
    v26 = (void *)v25;
    v27 = @"+14089740000";
    if (v25) {
      v27 = (__CFString *)v25;
    }
    v28 = v27;

    uint64_t v29 = [v1 objectForKey:@"CNGeminiFakeSubscription2Service"];
    v30 = (void *)v29;
    uint64_t v31 = @"Quantum Entanglement";
    if (v29) {
      uint64_t v31 = (__CFString *)v29;
    }
    uint64_t v32 = v31;

    uint64_t v33 = [(__CFString *)v24 rangeOfComposedCharacterSequenceAtIndex:0];
    v35 = [(__CFString *)v24 substringToIndex:v33 + v34];
    v36 = (void *)[objc_alloc(getTUHandleClass()) initWithType:2 value:v28];

    id v37 = objc_alloc(getTUSenderIdentityClass());
    v38 = [MEMORY[0x1E4F29128] UUID];
    char v39 = (void *)[v37 initWithUUID:v38 accountUUID:v20 localizedName:v24 localizedShortName:v35 localizedServiceName:v32 handle:v36];

    v46[0] = v19;
    v46[1] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)channelForContact:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(CNGeminiManager *)self geminiResultForContact:a3 substituteDefaultForDangling:0 error:a4];
  BOOL v5 = [v4 channel];

  return v5;
}

- (id)bestSenderIdentityForContact:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(CNGeminiManager *)self geminiResultForContact:a3 substituteDefaultForDangling:1 error:a4];
  BOOL v5 = [v4 channel];
  v6 = [v5 senderIdentity];

  return v6;
}

- (id)remoteGeminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v10 = [v9 entitlementVerifier];
  int v11 = [v10 currentProcessHasBooleanEntitlement:*MEMORY[0x1E4F5A238] error:0];

  if (v11)
  {
    id v12 = [(CNGeminiManager *)self geminiResultForContact:v8 substituteDefaultForDangling:0 error:a5];
  }
  else
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.contactsd" options:0];
    uint64_t v14 = +[CNXPCDataMapper serviceProtocolInterface];
    [v13 setRemoteObjectInterface:v14];

    [v13 resume];
    uint64_t v15 = [v13 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_168];
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__3;
    v28 = __Block_byref_object_dispose__3;
    id v29 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__3;
    uint64_t v22 = __Block_byref_object_dispose__3;
    id v23 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__CNGeminiManager_remoteGeminiResultForContact_substituteDefaultForDangling_error___block_invoke_172;
    v17[3] = &unk_1E56B4450;
    v17[4] = &v18;
    v17[5] = &v24;
    [v15 geminiResultForContact:v8 substituteDefaultForDangling:v6 withReply:v17];
    [v13 invalidate];
    if (a5) {
      *a5 = (id) v25[5];
    }
    id v12 = (id)v19[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }

  return v12;
}

void __83__CNGeminiManager_remoteGeminiResultForContact_substituteDefaultForDangling_error___block_invoke()
{
}

void __83__CNGeminiManager_remoteGeminiResultForContact_substituteDefaultForDangling_error___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)remoteBestSenderIdentityForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v11 = [v10 entitlementVerifier];
  int v12 = [v11 currentProcessHasBooleanEntitlement:*MEMORY[0x1E4F5A238] error:0];

  if (v12)
  {
    id v13 = [(CNGeminiManager *)self bestSenderIdentityForHandle:v8 contactStore:v9 error:a5];
    goto LABEL_13;
  }
  if ([v8 handleType])
  {
    uint64_t v14 = [v8 handleType];
    if (!v9 || v14 != -1) {
      goto LABEL_10;
    }
  }
  else if (!v9)
  {
    goto LABEL_10;
  }
  uint64_t v15 = [v8 stringValue];
  uint64_t v16 = -[CNGeminiManager contactForPhoneString:contactStore:]((uint64_t)self, v15, v9);

  if (v16)
  {
    id v17 = [(CNGeminiManager *)self remoteGeminiResultForContact:v16 substituteDefaultForDangling:1 error:a5];
    uint64_t v18 = [v17 channel];
    id v13 = [v18 senderIdentity];

    goto LABEL_13;
  }
LABEL_10:
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.contactsd" options:0];
  uint64_t v20 = +[CNXPCDataMapper serviceProtocolInterface];
  [v19 setRemoteObjectInterface:v20];

  [v19 resume];
  uint64_t v21 = [v19 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_175];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__3;
  uint64_t v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __72__CNGeminiManager_remoteBestSenderIdentityForHandle_contactStore_error___block_invoke_2;
  v23[3] = &unk_1E56B4478;
  v23[4] = &v24;
  v23[5] = &v30;
  [v21 bestSenderIdentityForHandle:v8 withReply:v23];
  [v19 invalidate];
  if (a5) {
    *a5 = (id) v31[5];
  }
  id v13 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
LABEL_13:

  return v13;
}

- (id)contactForPhoneString:(void *)a3 contactStore:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = a3;
    id v5 = a2;
    id v6 = [[CNPhoneNumber alloc] initWithStringValue:v5];

    uint64_t v7 = +[CNContact predicateForContactsMatchingPhoneNumber:v6];

    id v8 = [(id)objc_opt_class() descriptorForRequiredKeys];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v10 = [v4 unifiedContactsMatchingPredicate:v7 keysToFetch:v9 error:0];

    id v11 = 0;
    if ([v10 count] == 1)
    {
      id v11 = [v10 lastObject];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __72__CNGeminiManager_remoteBestSenderIdentityForHandle_contactStore_error___block_invoke()
{
}

void __72__CNGeminiManager_remoteBestSenderIdentityForHandle_contactStore_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)geminiResultForContact:(id)a3 error:(id *)a4
{
  return [(CNGeminiManager *)self geminiResultForContact:a3 substituteDefaultForDangling:0 error:a4];
}

- (id)geminiResultForContact:(id)a3 substituteDefaultForDangling:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v18 = 0;
    goto LABEL_22;
  }
  id v8 = [(id)objc_opt_class() descriptorForRequiredKeys];
  v37[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v7 assertKeysAreAvailable:v9];

  id v35 = 0;
  id v36 = 0;
  id v10 = -[CNGeminiManager channelsByIdentifierIncludingDanglingPlans:defaultChannel:availableChannels:](self, 1, (uint64_t)&v36, &v35);
  id v11 = v36;
  id v12 = v35;
  if (![v10 count])
  {
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  BOOL v34 = v5;
  uint64_t v13 = *MEMORY[0x1E4F5A298];
  uint64_t v14 = [v7 preferredChannel];
  char v15 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);

  if (v15) {
    goto LABEL_5;
  }
  uint64_t v16 = [v7 preferredChannel];
  id v17 = -[CNGeminiManager channelForPreferredChannelString:fromChannels:synthesizeMissingChannels:](self, v16, v10, 1);

  uint64_t v18 = -[CNGeminiManager geminiResultForChannel:usage:availableChannels:isUnknownNumber:]((uint64_t)self, v17, 1, v12, [v7 hasBeenPersisted] ^ 1);

  if (!v18)
  {
LABEL_5:
    if (![(id)objc_opt_class() deviceSupportsGemini])
    {
      uint64_t v18 = 0;
LABEL_19:
      if (v11)
      {
        uint64_t v31 = -[CNGeminiManager geminiResultForChannel:usage:availableChannels:isUnknownNumber:]((uint64_t)self, v11, 3, v12, [v7 hasBeenPersisted] ^ 1);

        uint64_t v18 = (void *)v31;
      }
      goto LABEL_21;
    }
    uint64_t v33 = v12;
    v19 = [v7 phoneNumbers];
    uint64_t v20 = objc_msgSend(v19, "_cn_map:", &__block_literal_global_179);
    uint64_t v21 = objc_msgSend(v20, "_cn_filter:", *MEMORY[0x1E4F5A280]);

    uint64_t v22 = [v10 allKeys];
    id v23 = [v11 channelIdentifier];
    uint64_t v24 = -[CNGeminiManager bestChannelIdentifierForPhoneNumbers:fromChannelIdentifiers:defaultChannelIdentifier:](self, v21, v22, v23);

    uint64_t v25 = [v24 first];
    LODWORD(v22) = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v25);

    if (v22)
    {

      uint64_t v18 = 0;
      unsigned int v26 = 1;
      id v12 = v33;
      goto LABEL_18;
    }
    v27 = [v24 first];
    v28 = [v10 objectForKey:v27];

    if (!v28)
    {
      v28 = [CNGeminiChannel alloc];
      id v29 = [v24 first];
      if (v28) {
        v28 = (CNGeminiChannel *)-[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&v28->super.isa, v29, &stru_1EE052B80, 0, 0, 0, 0);
      }
    }
    uint64_t v30 = [v24 second];
    uint64_t v18 = -[CNGeminiManager geminiResultForChannel:usage:availableChannels:isUnknownNumber:]((uint64_t)self, v28, [v30 unsignedIntegerValue], v33, objc_msgSend(v7, "hasBeenPersisted") ^ 1);

    id v12 = v33;
    if (!v18) {
      goto LABEL_19;
    }
  }
  uint64_t v21 = [v18 channel];
  unsigned int v26 = v34 & ~[v21 isAvailable];
LABEL_18:

  if (v26) {
    goto LABEL_19;
  }
LABEL_21:

LABEL_22:

  return v18;
}

- (id)channelForPreferredChannelString:(void *)a3 fromChannels:(int)a4 synthesizeMissingChannels:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if ([v7 hasPrefix:@"uuid:"])
    {
      uint64_t v9 = [v7 substringFromIndex:5];
      a1 = [v8 objectForKey:v9];

      if (a1) {
        goto LABEL_9;
      }
    }
    else
    {
      a1 = 0;
    }
    if (a4)
    {
      id v10 = [CNGeminiChannel alloc];
      if (v10) {
        a1 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&v10->super.isa, @"BAD00000-0000-0000-0000-000000000000", &stru_1EE052B80, 0, 0, 0, 0);
      }
      else {
        a1 = 0;
      }
    }
  }
LABEL_9:

  return a1;
}

- (CNGeminiResult)geminiResultForChannel:(uint64_t)a3 usage:(void *)a4 availableChannels:(int)a5 isUnknownNumber:
{
  id v9 = a2;
  id v10 = a4;
  if (a1)
  {
    id v11 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v12 = [v11 featureFlags];
    int v13 = [v12 isFeatureEnabled:7];

    uint64_t v14 = [CNGeminiResult alloc];
    if ((v13 & a5) != 0) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = a3;
    }
    uint64_t v16 = [(CNGeminiResult *)v14 initWithChannel:v9 usage:v15 availableChannels:v10];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

id __77__CNGeminiManager_geminiResultForContact_substituteDefaultForDangling_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 value];
  uint64_t v3 = [v2 unformattedInternationalStringValue];

  return v3;
}

- (id)bestChannelIdentifierForPhoneNumbers:(void *)a3 fromChannelIdentifiers:(void *)a4 defaultChannelIdentifier:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if ([v7 count]
      && (-[CNGeminiManager mostRecentChannelIdentifierForPhoneNumbers:fromChannelIdentifiers:](a1, v7, v8),
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = (void *)v10;
      a1 = [MEMORY[0x1E4F5A490] pairWithFirst:v10 second:&unk_1EE089188];
    }
    else if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
      id v11 = 0;
      a1 = 0;
    }
    else
    {
      a1 = [MEMORY[0x1E4F5A490] pairWithFirst:v9 second:&unk_1EE0891A0];
      id v11 = 0;
    }
  }

  return a1;
}

- (id)bestSenderIdentityForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  BOOL v5 = -[CNGeminiManager geminiResultForHandle:contactStore:substituteDefaultForDangling:error:](self, a3, a4, 1, (uint64_t)a5);
  id v6 = [v5 channel];
  id v7 = [v6 senderIdentity];

  return v7;
}

- (CNGeminiResult)geminiResultForHandle:(void *)a3 contactStore:(uint64_t)a4 substituteDefaultForDangling:(uint64_t)a5 error:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  if (!a1
    || (uint64_t v11 = *MEMORY[0x1E4F5A298],
        [v9 stringValue],
        id v12 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12),
        v12,
        (v11 & 1) != 0))
  {
    int v13 = 0;
    goto LABEL_16;
  }
  if (![v9 handleType] || objc_msgSend(v9, "handleType") == -1)
  {
    if (v10)
    {
      uint64_t v15 = [v9 stringValue];
      uint64_t v16 = -[CNGeminiManager contactForPhoneString:contactStore:]((uint64_t)a1, v15, v10);

      if (v16)
      {
        int v13 = [a1 geminiResultForContact:v16 substituteDefaultForDangling:a4 error:a5];

        goto LABEL_16;
      }
    }
    id v17 = [v9 stringValue];
    v32[0] = v17;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v30 = 0;
  id v31 = 0;
  uint64_t v18 = -[CNGeminiManager channelsByIdentifierIncludingDanglingPlans:defaultChannel:availableChannels:](a1, a4 ^ 1, (uint64_t)&v31, &v30);
  id v19 = v31;
  id v20 = v30;
  uint64_t v21 = [v18 allKeys];
  uint64_t v22 = [v19 channelIdentifier];
  id v23 = -[CNGeminiManager bestChannelIdentifierForPhoneNumbers:fromChannelIdentifiers:defaultChannelIdentifier:](a1, v14, v21, v22);

  uint64_t v24 = [v23 first];
  uint64_t v25 = [v18 objectForKey:v24];

  if (!v25)
  {
    uint64_t v25 = [CNGeminiChannel alloc];
    unsigned int v26 = [v23 first];
    if (v25) {
      uint64_t v25 = (CNGeminiChannel *)-[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&v25->super.isa, v26, &stru_1EE052B80, 0, 0, 0, 0);
    }
  }
  v27 = [CNGeminiResult alloc];
  v28 = [v23 second];
  int v13 = -[CNGeminiResult initWithChannel:usage:availableChannels:](v27, "initWithChannel:usage:availableChannels:", v25, [v28 unsignedIntegerValue], v20);

LABEL_16:

  return v13;
}

- (id)geminiResultForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  return -[CNGeminiManager geminiResultForHandle:contactStore:substituteDefaultForDangling:error:](self, a3, a4, 0, (uint64_t)a5);
}

- (id)mostRecentChannelIdentifierForPhoneNumbers:(void *)a3 fromChannelIdentifiers:
{
  id v5 = a2;
  id v6 = a3;
  if (a1 && [(id)objc_opt_class() deviceSupportsGemini])
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    id v8 = -[CNGeminiManager channelIdentifierForMostRecentCallFromPhoneNumbers:fromChannelIdentifiers:]((uint64_t)a1, v5);
    if ([a1 dataSourceExclusions])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]((uint64_t)a1, v5, v6);
    }
    objc_msgSend(v7, "_cn_addNonNilObject:", v8);
    objc_msgSend(v7, "_cn_addNonNilObject:", v9);
    [v7 sortUsingComparator:&__block_literal_global_192];
    uint64_t v11 = [v7 firstObject];
    id v10 = [v11 first];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)channelIdentifierForMostRecentCallFromPhoneNumbers:(uint64_t)a1 fromChannelIdentifiers:(void *)a2
{
  if (a1)
  {
    uint64_t v2 = (Class (__cdecl *)())getCHManagerClass;
    id v3 = a2;
    id v4 = objc_alloc_init(v2());
    id v5 = [v4 latestCallMatchingNormalizedRemoteParticipantHandleValues:v3];

    if (v5)
    {
      id v6 = [v5 outgoingLocalParticipantUUID];
      id v7 = [v6 UUIDString];

      uint64_t v8 = [v5 date];
      id v9 = (void *)v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = [MEMORY[0x1E4F5A490] pairWithFirst:v7 second:v8];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)channelIdentifierForMostRecentSMSFromPhoneNumbers:(void *)a3 fromChannelIdentifiers:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
    if (!IMCoreLibraryCore() || !getIMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc())
    {
      uint64_t v16 = 0;
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    id v9 = v7;
    id v10 = v8;
    IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc = (void (*)(id, id))getIMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc();
    if (IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc)
    {
      id v12 = IMSPIGetMostRecentIMEventForContactHandlesAndLocalLabelIDsSymbolLoc(v9, v10);

      if (v12)
      {
        int v13 = [v12 labelID];
        if (v13)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F5A490];
          uint64_t v15 = [v12 date];
          uint64_t v16 = [v14 pairWithFirst:v13 second:v15];
        }
        else
        {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }

      goto LABEL_13;
    }
    -[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]();
  }
  uint64_t v16 = 0;
LABEL_14:

  return v16;
}

uint64_t __85__CNGeminiManager_mostRecentChannelIdentifierForPhoneNumbers_fromChannelIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 second];
  id v6 = [v4 second];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)channelForFavoritesEntry:(void *)a1 includeDanglingChannels:(void *)a2 error:(int)a3
{
  id v5 = a2;
  id v6 = v5;
  if (a1
    && (uint64_t v7 = *MEMORY[0x1E4F5A298],
        [v5 actionChannel],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
        v8,
        (v7 & 1) == 0))
  {
    id v10 = -[CNGeminiManager channelsByIdentifierIncludingDanglingPlans:defaultChannel:availableChannels:](a1, a3, 0, 0);
    uint64_t v11 = [v6 actionChannel];
    id v9 = -[CNGeminiManager channelForPreferredChannelString:fromChannels:synthesizeMissingChannels:](a1, v11, v10, a3);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)channelForFavoritesEntry:(id)a3 error:(id *)a4
{
  return -[CNGeminiManager channelForFavoritesEntry:includeDanglingChannels:error:](self, a3, 1);
}

- (id)bestSenderIdentityForFavoritesEntry:(id)a3 error:(id *)a4
{
  id v4 = -[CNGeminiManager channelForFavoritesEntry:includeDanglingChannels:error:](self, a3, 0);
  id v5 = [v4 senderIdentity];

  return v5;
}

- (id)badgeLabelForSenderIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 localizedShortName];
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, __CFString *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v6))
  {

    uint64_t v8 = -[CNGeminiManager fetchedSubscriptionForSenderIdentity:](self, v5);
    id v9 = -[CNGeminiManager coreTelephonyClient](self);
    id v10 = [v9 getSimLabel:v8 error:0];

    uint64_t v11 = [v10 text];
    objc_msgSend(v11, "_cn_take:", 1);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(uint64_t, __CFString *))(v7 + 16))(v7, v6))
    {

      id v6 = @"?";
    }
  }

  return v6;
}

- (id)fetchedSubscriptionForSenderIdentity:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = -[CNGeminiManager fetchedSubscriptionsWithError:](v2, 0);
    id v5 = -[CNGeminiManager coreTelephonyClient](v2);
    id v6 = [v3 handle];

    uint64_t v7 = [v6 value];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__CNGeminiManager_fetchedSubscriptionForSenderIdentity___block_invoke;
    v11[3] = &unk_1E56B4580;
    id v12 = v5;
    id v13 = v7;
    id v8 = v7;
    id v9 = v5;
    objc_msgSend(v4, "_cn_firstObjectPassingTest:", v11);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (BOOL)remapChannelIdentifier:(id)a3 toIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4F5A298];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v8) & 1) != 0
    || (*(unsigned int (**)(uint64_t, id))(v10 + 16))(v10, v9))
  {
    uint64_t v11 = +[CNErrorFactory errorWithCode:205 userInfo:0];
    id v12 = v11;
    if (a5) {
      *a5 = v11;
    }

    BOOL v13 = 0;
  }
  else
  {
    uint64_t v14 = objc_opt_new();
    id v23 = 0;
    BOOL v15 = [(CNGeminiManager *)self remapContactsHavingPreferredChannelIdentifier:v8 toPreferredChannelIdentifier:v9 contactStore:v14 error:&v23];
    id v16 = v23;
    id v17 = v16;
    id v18 = 0;
    if (!v15) {
      id v18 = v16;
    }
    BOOL v19 = -[CNGeminiManager remapRecentCallsHavingChannelIdentifier:toChannelIdentifier:error:]((uint64_t)self, v8, v9);
    int v20 = v19 && v15;
    if (!v19 && v15)
    {

      int v20 = 0;
      id v18 = 0;
    }
    BOOL v21 = -[CNGeminiManager remapMessagesHavingChannelIdentifier:toChannelIdentifier:error:]((uint64_t)self, v8, v9);
    BOOL v13 = v21 & v20;
    if (!v21 && v20)
    {

      BOOL v13 = 0;
      id v18 = 0;
    }
    if (a5 && !v13) {
      *a5 = v18;
    }
  }
  return v13;
}

- (BOOL)remapRecentCallsHavingChannelIdentifier:(uint64_t)a1 toChannelIdentifier:(void *)a2 error:(void *)a3
{
  if (a1)
  {
    id v5 = (Class (__cdecl *)())getTUCallHistoryManagerClass;
    id v6 = a3;
    id v7 = a2;
    id v8 = objc_alloc_init(v5());
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
    [v8 updateOutgoingLocalParticipantUUID:v10 forCallsWithOutgoingLocalParticipantUUID:v9];
  }
  return a1 != 0;
}

- (BOOL)remapMessagesHavingChannelIdentifier:(uint64_t)a1 toChannelIdentifier:(void *)a2 error:(void *)a3
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_8;
  }
  if (!IMCoreLibraryCore()) {
    goto LABEL_8;
  }
  if (!getIMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc()) {
    goto LABEL_8;
  }
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  if (((*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v6) & 1) != 0
    || ((*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, v5) & 1) != 0)
  {
    goto LABEL_8;
  }
  id v8 = v5;
  id v9 = v6;
  IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc = (void (*)(id, id))getIMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc();
  if (IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc)
  {
    IMSPIRemapChatsWithLastAddressedLabelIDToNewLabelIDSymbolLoc(v8, v9);

LABEL_8:
    return a1 != 0;
  }
  id v12 = (CNGeminiManager *)-[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]();
  return [(CNGeminiManager *)v12 remapContactsHavingPreferredChannelIdentifier:v14 toPreferredChannelIdentifier:v15 contactStore:v16 error:v17];
}

- (BOOL)remapContactsHavingPreferredChannelIdentifier:(id)a3 toPreferredChannelIdentifier:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [@"uuid:" stringByAppendingString:a3];
  id v12 = [@"uuid:" stringByAppendingString:v10];

  SEL v13 = +[CNContact predicateForContactsMatchingPreferredChannel:v11 limitOne:0];
  id v14 = [CNContactFetchRequest alloc];
  v31[0] = @"preferredChannel";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  id v16 = [(CNContactFetchRequest *)v14 initWithKeysToFetch:v15];

  [(CNContactFetchRequest *)v16 setUnifyResults:0];
  [(CNContactFetchRequest *)v16 setMutableObjects:1];
  [(CNContactFetchRequest *)v16 setPredicate:v13];
  id v17 = objc_opt_new();
  id v30 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __113__CNGeminiManager_remapContactsHavingPreferredChannelIdentifier_toPreferredChannelIdentifier_contactStore_error___block_invoke;
  v27[3] = &unk_1E56B44E0;
  id v18 = v12;
  id v28 = v18;
  id v19 = v17;
  id v29 = v19;
  int v20 = [v9 enumerateContactsWithFetchRequest:v16 error:&v30 usingBlock:v27];
  id v21 = v30;
  uint64_t v22 = v21;
  if (v20)
  {
    id v26 = v21;
    char v23 = [v9 executeSaveRequest:v19 error:&v26];
    id v24 = v26;

    uint64_t v22 = v24;
    if (!a6) {
      goto LABEL_7;
    }
  }
  else
  {
    char v23 = 0;
    if (!a6) {
      goto LABEL_7;
    }
  }
  if ((v23 & 1) == 0) {
    *a6 = v22;
  }
LABEL_7:

  return v23;
}

void __113__CNGeminiManager_remapContactsHavingPreferredChannelIdentifier_toPreferredChannelIdentifier_contactStore_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPreferredChannel:v3];
  [*(id *)(a1 + 40) updateContact:v4];
}

- (BOOL)isReferencedByContactsForSenderLabelIdentifier:(id)a3 store:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v7 = +[CNContact predicateForContactsMatchingPreferredChannel:v5 limitOne:1];
  id v8 = [CNContactFetchRequest alloc];
  v18[0] = @"preferredChannel";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v10 = [(CNContactFetchRequest *)v8 initWithKeysToFetch:v9];

  [(CNContactFetchRequest *)v10 setUnifyResults:0];
  [(CNContactFetchRequest *)v10 setPredicate:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __72__CNGeminiManager_isReferencedByContactsForSenderLabelIdentifier_store___block_invoke;
  v13[3] = &unk_1E56B4118;
  v13[4] = &v14;
  if ([v6 enumerateContactsWithFetchRequest:v10 error:0 usingBlock:v13])
  {
    BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  }
  else
  {
    BOOL v11 = 1;
    *((unsigned char *)v15 + 24) = 1;
  }

  _Block_object_dispose(&v14, 8);
  return v11;
}

uint64_t __72__CNGeminiManager_isReferencedByContactsForSenderLabelIdentifier_store___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CNGeminiManager_addDelegate_queue___block_invoke;
  block[3] = &unk_1E56B4508;
  block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  dispatch_async(queue, block);
}

uint64_t __37__CNGeminiManager_addDelegate_queue___block_invoke(uint64_t a1)
{
  id v2 = -[CNGeminiManager callProviderManager](*(void **)(a1 + 32));
  id v3 = -[CNGeminiManager coreTelephonyClient](*(void **)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 40);
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 40)) {
    uint64_t v7 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F14428];
  }

  return [v5 setObject:v7 forKey:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CNGeminiManager_removeDelegate___block_invoke;
  v7[3] = &unk_1E56B3DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __34__CNGeminiManager_removeDelegate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[5];
  }
  return [v1 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)notifyDelegateOfChannelUpdates
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke;
    block[3] = &unk_1E56B4530;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[5];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * v7);
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          id v10 = *(void **)(v9 + 40);
        }
        else {
          id v10 = 0;
        }
        id v11 = [v10 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * v7)];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke_2;
        v14[3] = &unk_1E56B3DC8;
        uint64_t v12 = *(void *)(a1 + 32);
        v14[4] = v8;
        v14[5] = v12;
        dispatch_async(v11, v14);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v13 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v5 = v13;
    }
    while (v13);
  }
}

uint64_t __49__CNGeminiManager_notifyDelegateOfChannelUpdates__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) channelsDidChangeForGeminiManager:*(void *)(a1 + 40)];
}

- (id)bestSubscriptionForContact:(id)a3 error:(id *)a4
{
  uint64_t v5 = [(CNGeminiManager *)self bestSenderIdentityForContact:a3 error:a4];
  if (v5)
  {
    uint64_t v6 = -[CNGeminiManager fetchedSubscriptionForSenderIdentity:](self, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)bestSubscriptionForHandle:(id)a3 contactStore:(id)a4 error:(id *)a5
{
  uint64_t v6 = [(CNGeminiManager *)self bestSenderIdentityForHandle:a3 contactStore:a4 error:a5];
  if (v6)
  {
    uint64_t v7 = -[CNGeminiManager fetchedSubscriptionForSenderIdentity:](self, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)fetchedSubscriptionsWithError:(id)a1
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v4 = -[CNGeminiManager coreTelephonyClient](a1);
    uint64_t v5 = [v4 getSubscriptionInfoWithError:a2];

    uint64_t v6 = -[CNGeminiManager coreTelephonyClient](v2);
    uint64_t v7 = [v5 subscriptionsInUse];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__CNGeminiManager_fetchedSubscriptionsWithError___block_invoke;
    v10[3] = &unk_1E56B4558;
    id v11 = v6;
    id v8 = v6;
    objc_msgSend(v7, "_cn_filter:", v10);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

uint64_t __49__CNGeminiManager_fetchedSubscriptionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSimHidden] & 1) != 0 || (objc_msgSend(v3, "isSimDataOnly"))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) getPhoneNumber:v3 error:0];
    uint64_t v6 = *MEMORY[0x1E4F5A298];
    uint64_t v7 = [v5 number];
    uint64_t v4 = (*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v7) ^ 1;
  }
  return v4;
}

uint64_t __56__CNGeminiManager_fetchedSubscriptionForSenderIdentity___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) getPhoneNumber:a2 error:0];
  uint64_t v4 = [v3 number];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];
  }

  return v5;
}

- (id)badgeLabelForSubscription:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  uint64_t v6 = [v4 label];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if (v5)
  {
    uint64_t v7 = @"?";
  }
  else
  {
    id v8 = [v4 label];
    uint64_t v9 = [v4 label];
    uint64_t v10 = [v9 rangeOfComposedCharacterSequenceAtIndex:0];
    uint64_t v7 = [v8 substringToIndex:v10 + v11];
  }

  return v7;
}

- (unint64_t)dataSourceExclusions
{
  return self->_dataSourceExclusions;
}

- (void)setDataSourceExclusions:(unint64_t)a3
{
  self->_dataSourceExclusions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

- (uint64_t)channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __LoadTelephonyUtilities_block_invoke_cold_1(v0);
}

@end