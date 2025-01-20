@interface HMSiriEndpointProfile
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isNeedsOnboarding;
- (BOOL)manuallyDisabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)supportsOnboarding;
- (HMSiriEndpointProfile)init;
- (HMSiriEndpointProfile)initWithSiriEndpointProfile:(id)a3;
- (HMSiriEndpointProfileAssistant)currentAssistant;
- (HMSiriEndpointProfileDelegate)delegate;
- (NSArray)assistants;
- (NSArray)attributeDescriptions;
- (NSNumber)activeIdentifier;
- (NSString)capabilityToString;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)siriEndpointVersion;
- (NSString)siriEngineVersion;
- (NSUUID)sessionHubIdentifier;
- (id)logIdentifier;
- (id)siriEndpointProfile;
- (int64_t)multifunctionButton;
- (int64_t)sessionState;
- (unint64_t)capability;
- (void)applyOnboardingSelections:(id)a3 completionHandler:(id)a4;
- (void)deleteSiriHistoryWithCompletionHandler:(id)a3;
- (void)refreshStateWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)siriEndpointProfile:(id)a3 didUpdateActiveIdentifier:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateAssistants:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateManuallyDisabled:(BOOL)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateMultifunctionButton:(int64_t)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateNeedsOnboarding:(BOOL)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSessionState:(int64_t)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSiriEngineVersion:(id)a4;
- (void)siriEndpointProfile:(id)a3 didUpdateSupportsOnboarding:(BOOL)a4;
@end

@implementation HMSiriEndpointProfile

uint64_t __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyClientDidUpdateSessionState];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_3;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_41(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_42;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_43(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_44;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_45(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_46;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_47(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_48;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_49(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_50;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_51(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_52;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_53(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) context];
  v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_54;
  v5[3] = &unk_1E5945628;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_54(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "multifunctionButton"));
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateMultifunctionButton : %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "siriEndpointProfile:didUpdateMultifunctionButton:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "multifunctionButton"));
}

uint64_t __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_52(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "manuallyDisabled"));
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateManuallyDisabled : %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "siriEndpointProfile:didUpdateManuallyDisabled:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "manuallyDisabled"));
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_50(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) activeIdentifier];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateActiveIdentifier : %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(v9 + 8);
  __int16 v10 = [v7 activeIdentifier];
  [v8 siriEndpointProfile:v7 didUpdateActiveIdentifier:v10];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_48(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) assistants];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateAssistants : %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(v9 + 8);
  __int16 v10 = [v7 assistants];
  [v8 siriEndpointProfile:v7 didUpdateAssistants:v10];
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_46(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) siriEngineVersion];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateSiriEngineVersion : %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(v9 + 8);
  __int16 v10 = [v7 siriEngineVersion];
  [v8 siriEndpointProfile:v7 didUpdateSiriEngineVersion:v10];
}

uint64_t __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_44(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) capability];
    id v6 = HMFBooleanToString();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateSupportsOnboarding : %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "siriEndpointProfile:didUpdateSupportsOnboarding:", *(void *)(a1 + 32), ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "capability") >> 1) & 1);
}

uint64_t __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_2_42(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) capability];
    id v6 = HMFBooleanToString();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    int v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateNeedsOnboarding : %@", (uint8_t *)&v8, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "siriEndpointProfile:didUpdateNeedsOnboarding:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "capability") & 1);
}

void __45___HMSiriEndpointProfile_mergeFromNewObject___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) sessionHubIdentifier];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling didUpdateSessionHubIdentifier : %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = a1 + 32;
  v7 = *(void **)(a1 + 32);
  int v8 = *(void **)(v9 + 8);
  __int16 v10 = [v7 sessionHubIdentifier];
  [v8 siriEndpointProfile:v7 didUpdateSessionHubIdentifier:v10];
}

void __69___HMSiriEndpointProfile_setNotifications_options_completionHandler___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = @"enable";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  v22[1] = @"options";
  v23[0] = v2;
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v23[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  v5 = (void *)MEMORY[0x1E4F654B0];
  id v6 = [*(id *)(a1 + 32) messageDestination];
  v7 = [v5 messageWithName:@"HMSE.en" destination:v6 payload:v4];

  int v8 = [*(id *)(a1 + 32) context];
  uint64_t v9 = [v8 pendingRequests];

  __int16 v10 = [v7 identifier];
  int v11 = _Block_copy(*(const void **)(a1 + 48));
  [v9 addCompletionBlock:v11 forIdentifier:v10];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __69___HMSiriEndpointProfile_setNotifications_options_completionHandler___block_invoke_2;
  v18 = &unk_1E59450E8;
  id v19 = v9;
  id v20 = v10;
  id v21 = *(id *)(a1 + 40);
  id v12 = v10;
  id v13 = v9;
  [v7 setResponseHandler:&v15];
  v14 = objc_msgSend(*(id *)(a1 + 40), "messageDispatcher", v15, v16, v17, v18);
  [v14 sendMessage:v7 completionHandler:0];
}

void __69___HMSiriEndpointProfile_setNotifications_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v3 removeCompletionBlockForIdentifier:v4];
  id v6 = [*(id *)(a1 + 48) delegateCaller];
  [v6 callCompletion:v7 error:v5];
}

void __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 sessionHubIdentifier];
  [v1 siriEndpointProfile:v2 didUpdateSessionHubIdentifier:v3];
}

void __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 siriEngineVersion];
  [v1 siriEndpointProfile:v2 didUpdateSiriEngineVersion:v3];
}

uint64_t __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 capability] & 1;

  return [v1 siriEndpointProfile:v2 didUpdateNeedsOnboarding:v3];
}

uint64_t __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  unint64_t v3 = ((unint64_t)[v2 capability] >> 1) & 1;

  return [v1 siriEndpointProfile:v2 didUpdateSupportsOnboarding:v3];
}

void __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 activeIdentifier];
  [v1 siriEndpointProfile:v2 didUpdateActiveIdentifier:v3];
}

uint64_t __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_6(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 manuallyDisabled];

  return [v1 siriEndpointProfile:v2 didUpdateManuallyDisabled:v3];
}

uint64_t __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_7(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 multifunctionButton];

  return [v1 siriEndpointProfile:v2 didUpdateMultifunctionButton:v3];
}

void __52___HMSiriEndpointProfile__handleUpdateProfileState___block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 assistants];
  [v1 siriEndpointProfile:v2 didUpdateAssistants:v3];
}

void __60___HMSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v23[0] = @"session";
  v23[1] = @"settings";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v3 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v4 = [*(id *)(a1 + 32) messageDestination];
  id v21 = @"property-list";
  v22 = v2;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v6 = [v3 messageWithName:@"HMSE.rs" destination:v4 payload:v5];

  id v7 = [*(id *)(a1 + 32) context];
  int v8 = [v7 pendingRequests];

  uint64_t v9 = [v6 identifier];
  __int16 v10 = _Block_copy(*(const void **)(a1 + 48));
  [v8 addCompletionBlock:v10 forIdentifier:v9];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __60___HMSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke_2;
  v17 = &unk_1E59450E8;
  id v18 = v8;
  id v19 = v9;
  id v20 = *(id *)(a1 + 40);
  id v11 = v9;
  id v12 = v8;
  [v6 setResponseHandler:&v14];
  id v13 = objc_msgSend(*(id *)(a1 + 40), "messageDispatcher", v14, v15, v16, v17);
  [v13 sendMessage:v6 completionHandler:0];
}

void __60___HMSiriEndpointProfile_refreshStateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v3 removeCompletionBlockForIdentifier:v4];
  id v6 = [*(id *)(a1 + 48) delegateCaller];
  [v6 callCompletion:v7 error:v5];
}

uint64_t __59___HMSiriEndpointProfile_notifyClientDidUpdateSessionState__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = [v2 sessionState];

  return [v1 siriEndpointProfile:v2 didUpdateSessionState:v3];
}

uint64_t __37___HMSiriEndpointProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v38;
  logCategory__hmf_once_v38 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMSiriEndpointProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMSiriEndpointProfileDelegate *)WeakRetained;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (id)logIdentifier
{
  v2 = [(HMAccessoryProfile *)self accessory];
  uint64_t v3 = [v2 uniqueIdentifier];
  uint64_t v4 = [v3 UUIDString];

  return v4;
}

- (NSArray)attributeDescriptions
{
  v36[10] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v35 = [(HMAccessoryProfile *)self accessory];
  v34 = [v35 uniqueIdentifier];
  v33 = (void *)[v3 initWithName:@"accessoryUniqueIdentifier" value:v34];
  v36[0] = v33;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v32 = HMSiriEndpointProfileSessionStateTypeToString([(HMSiriEndpointProfile *)self sessionState]);
  v31 = (void *)[v4 initWithName:@"sessionState" value:v32];
  v36[1] = v31;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v30 = [(HMSiriEndpointProfile *)self sessionHubIdentifier];
  v29 = (void *)[v5 initWithName:@"sessionHubIdentifier" value:v30];
  v36[2] = v29;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v28 = [(HMSiriEndpointProfile *)self siriEndpointVersion];
  v27 = (void *)[v6 initWithName:@"siriEndpointVersion" value:v28];
  v36[3] = v27;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v26 = HMSiriEndpointProfileCapabilityToString([(HMSiriEndpointProfile *)self capability]);
  v25 = (void *)[v7 initWithName:@"capability" value:v26];
  v36[4] = v25;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = [(HMSiriEndpointProfile *)self siriEngineVersion];
  uint64_t v9 = (void *)[v8 initWithName:@"siriEngineVersion" value:v24];
  v36[5] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointProfile *)self isNeedsOnboarding];
  id v11 = HMFBooleanToString();
  id v12 = (void *)[v10 initWithName:@"needsOnboarding" value:v11];
  v36[6] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v14 = [(HMSiriEndpointProfile *)self activeIdentifier];
  uint64_t v15 = (void *)[v13 initWithName:@"activeIdentifier" value:v14];
  v36[7] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMSiriEndpointProfile *)self manuallyDisabled];
  v17 = HMFBooleanToString();
  id v18 = (void *)[v16 initWithName:@"manuallyDisabled" value:v17];
  v36[8] = v18;
  id v19 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v20 = HMSiriEndpointProfileMultifunctionButtonTypeToString([(HMSiriEndpointProfile *)self multifunctionButton]);
  id v21 = (void *)[v19 initWithName:@"multifunctionButton" value:v20];
  v36[9] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:10];

  return (NSArray *)v22;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (void)setNotifications:(BOOL)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v11 = a5;
  id v8 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  [v10 setNotifications:v6 options:a4 completionHandler:v11];
}

- (void)refreshStateWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  [v6 refreshStateWithCompletionHandler:v7];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 accessoryProfile];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      id v11 = [(HMAccessoryProfile *)self accessoryProfile];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
      id v13 = v12;

      char v14 = [v13 mergeFromNewObject:v10];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (void)siriEndpointProfile:(id)a3 didUpdateMultifunctionButton:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMSiriEndpointProfile *)self delegate];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = HMSiriEndpointProfileMultifunctionButtonTypeToString(a4);
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated multifunction Button: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v9 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__HMSiriEndpointProfile_siriEndpointProfile_didUpdateMultifunctionButton___block_invoke;
    v16[3] = &unk_1E5945160;
    id v17 = v7;
    id v18 = v9;
    int64_t v19 = a4;
    [v15 invokeBlock:v16];
  }
}

uint64_t __74__HMSiriEndpointProfile_siriEndpointProfile_didUpdateMultifunctionButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateMultifunctionButton:*(void *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateManuallyDisabled:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMSiriEndpointProfile *)self delegate];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated manually disabled: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v9 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__HMSiriEndpointProfile_siriEndpointProfile_didUpdateManuallyDisabled___block_invoke;
    v16[3] = &unk_1E5944D60;
    id v17 = v7;
    id v18 = v9;
    BOOL v19 = a4;
    [v15 invokeBlock:v16];
  }
}

uint64_t __71__HMSiriEndpointProfile_siriEndpointProfile_didUpdateManuallyDisabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateManuallyDisabled:*(unsigned __int8 *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateAssistants:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMSiriEndpointProfile *)self delegate];
  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated assistants: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v10 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__HMSiriEndpointProfile_siriEndpointProfile_didUpdateAssistants___block_invoke;
    v16[3] = &unk_1E5945650;
    id v17 = v8;
    id v18 = v10;
    id v19 = v7;
    [v15 invokeBlock:v16];
  }
}

uint64_t __65__HMSiriEndpointProfile_siriEndpointProfile_didUpdateAssistants___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateAssistants:*(void *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateActiveIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMSiriEndpointProfile *)self delegate];
  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v22 = v12;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated active identifier: %@, delegate: %@", buf, 0x20u);
  }
  id v13 = [(HMSiriEndpointProfile *)v10 currentAssistant];
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v14 = [(HMAccessoryProfile *)v10 accessoryProfile];
    uint64_t v15 = [v14 context];
    id v16 = [v15 delegateCaller];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__HMSiriEndpointProfile_siriEndpointProfile_didUpdateActiveIdentifier___block_invoke;
    v17[3] = &unk_1E5945650;
    id v18 = v8;
    id v19 = v10;
    id v20 = v13;
    [v16 invokeBlock:v17];
  }
}

uint64_t __71__HMSiriEndpointProfile_siriEndpointProfile_didUpdateActiveIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateCurrentAssistant:*(void *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSupportsOnboarding:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMSiriEndpointProfile *)self delegate];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    __int16 v24 = 2112;
    __int16 v25 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated siri endpoint capability supports on boarding: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v9 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSupportsOnboarding___block_invoke;
    v16[3] = &unk_1E5944D60;
    id v17 = v7;
    id v18 = v9;
    BOOL v19 = a4;
    [v15 invokeBlock:v16];
  }
}

uint64_t __73__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSupportsOnboarding___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateSupportsOnboarding:*(unsigned __int8 *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateNeedsOnboarding:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMSiriEndpointProfile *)self delegate];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    id v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = v12;
    __int16 v24 = 2112;
    __int16 v25 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated siri endpoint capability needs on boarding: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v9 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__HMSiriEndpointProfile_siriEndpointProfile_didUpdateNeedsOnboarding___block_invoke;
    v16[3] = &unk_1E5944D60;
    id v17 = v7;
    id v18 = v9;
    BOOL v19 = a4;
    [v15 invokeBlock:v16];
  }
}

uint64_t __70__HMSiriEndpointProfile_siriEndpointProfile_didUpdateNeedsOnboarding___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateNeedsOnboarding:*(unsigned __int8 *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSiriEngineVersion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMSiriEndpointProfile *)self delegate];
  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    __int16 v25 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated siri endpoint version: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v10 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSiriEngineVersion___block_invoke;
    v16[3] = &unk_1E5945650;
    id v17 = v8;
    id v18 = v10;
    id v19 = v7;
    [v15 invokeBlock:v16];
  }
}

uint64_t __72__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSiriEngineVersion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateSiriEngineVersion:*(void *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMSiriEndpointProfile *)self delegate];
  uint64_t v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    __int16 v25 = v8;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated siri endpoint session hud identifier: %@, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v13 = [(HMAccessoryProfile *)v10 accessoryProfile];
    char v14 = [v13 context];
    uint64_t v15 = [v14 delegateCaller];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSessionHubIdentifier___block_invoke;
    v16[3] = &unk_1E5945650;
    id v17 = v8;
    id v18 = v10;
    id v19 = v7;
    [v15 invokeBlock:v16];
  }
}

uint64_t __75__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSessionHubIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateSessionHubIdentifier:*(void *)(a1 + 48)];
}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionState:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMSiriEndpointProfile *)self delegate];
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v20 = v11;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    __int16 v23 = 2112;
    __int16 v24 = v7;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of updated siri endpoint session state: %lu, delegate: %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = [(HMAccessoryProfile *)v9 accessoryProfile];
    id v13 = [v12 context];
    char v14 = [v13 delegateCaller];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSessionState___block_invoke;
    v15[3] = &unk_1E5945160;
    id v16 = v7;
    id v17 = v9;
    int64_t v18 = a4;
    [v14 invokeBlock:v15];
  }
}

uint64_t __67__HMSiriEndpointProfile_siriEndpointProfile_didUpdateSessionState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriEndpointProfile:*(void *)(a1 + 40) didUpdateSessionState:*(void *)(a1 + 48)];
}

- (HMSiriEndpointProfileAssistant)currentAssistant
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 activeIdentifier];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = objc_msgSend(v4, "assistants", 0);
    id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v11 = [v10 identifier];
          if ([v5 isEqual:v11])
          {
            id v7 = v10;

            goto LABEL_15;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    id v7 = 0;
  }

  return (HMSiriEndpointProfileAssistant *)v7;
}

- (NSArray)assistants
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 assistants];

  return (NSArray *)v5;
}

- (int64_t)multifunctionButton
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  int64_t v5 = [v4 multifunctionButton];
  return v5;
}

- (BOOL)manuallyDisabled
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 manuallyDisabled];
  return v5;
}

- (NSNumber)activeIdentifier
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 activeIdentifier];

  return (NSNumber *)v5;
}

- (BOOL)supportsOnboarding
{
  return ([(HMSiriEndpointProfile *)self capability] >> 1) & 1;
}

- (BOOL)isNeedsOnboarding
{
  return [(HMSiriEndpointProfile *)self capability] & 1;
}

- (NSString)capabilityToString
{
  unint64_t v2 = [(HMSiriEndpointProfile *)self capability];

  return (NSString *)HMSiriEndpointProfileCapabilityToString(v2);
}

- (unint64_t)capability
{
  unint64_t v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 capability];
  return v5;
}

- (NSString)siriEngineVersion
{
  unint64_t v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 siriEngineVersion];

  return (NSString *)v5;
}

- (NSString)siriEndpointVersion
{
  unint64_t v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 siriEndpointVersion];

  return (NSString *)v5;
}

- (NSUUID)sessionHubIdentifier
{
  unint64_t v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  unint64_t v5 = [v4 sessionHubIdentifier];

  return (NSUUID *)v5;
}

- (int64_t)sessionState
{
  unint64_t v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  int64_t v5 = [v4 sessionState];
  return v5;
}

- (id)siriEndpointProfile
{
  unint64_t v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    return v4;
  }
  else
  {
    id v6 = (HMSiriEndpointProfile *)_HMFPreconditionFailure();
    [(HMSiriEndpointProfile *)v6 deleteSiriHistoryWithCompletionHandler:v8];
  }
  return result;
}

- (void)deleteSiriHistoryWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  SEL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting siri history", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [(HMSiriEndpointProfile *)v6 siriEndpointProfile];
  [v9 deleteSiriHistoryWithCompletionHandler:v4];
}

- (void)applyOnboardingSelections:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    long long v14 = v11;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Applying onboarding with selections: %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v12 = [(HMSiriEndpointProfile *)v9 siriEndpointProfile];
  [v12 applyOnboardingSelections:v6 completionHandler:v7];
}

- (HMSiriEndpointProfile)initWithSiriEndpointProfile:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMSiriEndpointProfile;
  int64_t v5 = [(HMAccessoryProfile *)&v7 initWithAccessoryProfile:v4];
  if (v5) {
    [v4 setDelegate:v5];
  }

  return v5;
}

- (HMSiriEndpointProfile)init
{
  unint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  int64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_58902 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_58902, &__block_literal_global_58903);
  }
  unint64_t v2 = (void *)logCategory__hmf_once_v28_58904;

  return v2;
}

uint64_t __36__HMSiriEndpointProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v28_58904;
  logCategory__hmf_once_v28_58904 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  unint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end