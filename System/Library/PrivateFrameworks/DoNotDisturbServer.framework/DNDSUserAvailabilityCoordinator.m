@interface DNDSUserAvailabilityCoordinator
- (BOOL)_isLocalUserAvailableForAppId:(id)a3 modeIdentifier:(id)a4 withError:(id *)a5;
- (BOOL)_isLocalUserAvailableForMessagesWithModeIdentifier:(id)a3 withError:(id *)a4;
- (BOOL)_isTCCUserAvailabilityGrantedForMessages;
- (BOOL)_queue_didAppAvailabilityChangeForApplicationIdentifier:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5;
- (BOOL)isLocalUserAvailableForApplicationIdentifier:(id)a3 withError:(id *)a4;
- (BOOL)isTCCUserAvailabilityGrantedForBundleId:(id)a3;
- (BOOL)userAvailabilityInActiveModeForContactHandle:(id)a3 withError:(id *)a4;
- (DNDSUserAvailabilityCoordinator)initWithConfigurationProvider:(id)a3 stateProvider:(id)a4;
- (DNDSUserAvailabilityCoordinator)initWithConfigurationProvider:(id)a3 stateProvider:(id)a4 userAvailabilityTCCProvider:(id)a5;
- (id)_entitlementRecordForApplicationRecord:(id)a3;
- (id)allowedModesForContactHandle:(id)a3 withError:(id *)a4;
- (id)exceptionalModesForContactHandle:(id)a3 withError:(id *)a4;
- (id)publishStatusKitAvailabilityReturningError:(id *)a3;
- (id)silencedModesForContactHandle:(id)a3 withError:(id *)a4;
- (void)_publishStatusKitAvailability:(BOOL)a3 activityIdentifier:(id)a4 local:(BOOL)a5 scheduled:(BOOL)a6 date:(id)a7 forced:(BOOL)a8 completion:(id)a9;
- (void)_publishStatusKitCurrentAvailabilityForced:(BOOL)a3 override:(int64_t)a4 completionHandler:(id)a5;
- (void)_queue_notifyIntentExtensionsOfUserAvailability:(id)a3 applicationIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)_queue_notifyIntentExtensionsOfUserAvailability:(id)a3 availabilityOverride:(int64_t)a4 applicationIdentifiers:(id)a5 completionHandler:(id)a6;
- (void)_queue_updateAvailabilityKit:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5 completionHandler:(id)a6;
- (void)coordinateUserAvailability:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5 completionHandler:(id)a6;
- (void)coordinateUserAvailabilityUpdateForApplicationIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)resume;
- (void)resumeUpdatingInvitationsForContacts:(id)a3 completionHandler:(id)a4;
- (void)sendStatusKitInvitationsForContacts:(id)a3 completionHandler:(id)a4;
- (void)sendStatusKitInvitationsForContacts:(id)a3 forceAvailabilityPublish:(BOOL)a4 completionHandler:(id)a5;
- (void)suspend;
- (void)suspendWithOverrideSetting:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation DNDSUserAvailabilityCoordinator

- (DNDSUserAvailabilityCoordinator)initWithConfigurationProvider:(id)a3 stateProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(_DNDSUserAvailabilityTCCProvider);
  v9 = [(DNDSUserAvailabilityCoordinator *)self initWithConfigurationProvider:v7 stateProvider:v6 userAvailabilityTCCProvider:v8];

  return v9;
}

- (DNDSUserAvailabilityCoordinator)initWithConfigurationProvider:(id)a3 stateProvider:(id)a4 userAvailabilityTCCProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)DNDSUserAvailabilityCoordinator;
  v12 = [(DNDSUserAvailabilityCoordinator *)&v24 init];
  v13 = v12;
  if (v12)
  {
    v12->_active = 0;
    objc_storeStrong((id *)&v12->_configurationProvider, a3);
    objc_storeStrong((id *)&v13->_stateProvider, a4);
    objc_storeStrong((id *)&v13->_tccProvider, a5);
    id v14 = objc_alloc(MEMORY[0x1E4FA8000]);
    uint64_t v15 = [v14 initWithStatusTypeIdentifier:*MEMORY[0x1E4F4F168]];
    statusService = v13->_statusService;
    v13->_statusService = (SKStatusPublishingService *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.donotdisturb.server.AvailabilityCoordinator", v17);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.donotdisturb.server.ExtensionLaunch", v20);
    extensionLaunchQueue = v13->_extensionLaunchQueue;
    v13->_extensionLaunchQueue = (OS_dispatch_queue *)v21;
  }
  return v13;
}

- (void)resume
{
  self->_active = 1;
}

- (void)resumeUpdatingInvitationsForContacts:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, DNDSUserAvailabilityPublishResult *, void))a4;
  v8 = DNDSLogAvailabilityProvider;
  if (self->_active)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSUserAvailabilityCoordinator resumeUpdatingInvitationsForContacts:completionHandler:]();
    }
    id v9 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
    v7[2](v7, v9, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_INFO, "Resuming User Availability publish current availability and update invites for relevant contacts.", buf, 2u);
    }
    [(DNDSUserAvailabilityCoordinator *)self resume];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke;
    v10[3] = &unk_1E6973B68;
    v10[4] = self;
    id v11 = v7;
    [(DNDSUserAvailabilityCoordinator *)self sendStatusKitInvitationsForContacts:v6 forceAvailabilityPublish:1 completionHandler:v10];
  }
}

void __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_2;
  block[3] = &unk_1E6973B40;
  block[4] = v4;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_INFO, "Notifying intent extensions of availability on User Availability coordinator resume", buf, 2u);
  }
  id v3 = *(id **)(a1 + 32);
  uint64_t v4 = [v3[5] lastCalculatedState];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_14;
  v5[3] = &unk_1E6973B18;
  id v7 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_queue_notifyIntentExtensionsOfUserAvailability:applicationIdentifiers:completionHandler:", v4, 0, v5);
}

uint64_t __90__DNDSUserAvailabilityCoordinator_resumeUpdatingInvitationsForContacts_completionHandler___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)suspend
{
  self->_active = 0;
}

- (void)suspendWithOverrideSetting:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  if (self->_active)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke;
    v9[3] = &unk_1E6973BE0;
    v9[4] = self;
    int64_t v11 = a3;
    id v10 = v6;
    [(DNDSUserAvailabilityCoordinator *)self _publishStatusKitCurrentAvailabilityForced:0 override:a3 completionHandler:v9];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSUserAvailabilityCoordinator suspendWithOverrideSetting:completionHandler:]();
    }
    v8 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
    ((void (**)(void, DNDSUserAvailabilityPublishResult *, void))v7)[2](v7, v8, 0);
  }
}

void __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  }
  id v10 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:v7 availability:v8];
  int64_t v11 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", buf, 0xCu);
  }
  uint64_t v12 = a1[4];
  v13 = *(NSObject **)(v12 + 16);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_18;
  v17[3] = &unk_1E6973BB8;
  uint64_t v15 = (void *)a1[5];
  uint64_t v14 = a1[6];
  v17[4] = v12;
  uint64_t v20 = v14;
  dispatch_queue_t v18 = v10;
  id v19 = v15;
  v16 = v10;
  dispatch_async(v13, v17);
}

void __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_18(uint64_t a1)
{
  v2 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_INFO, "Forcing intent extensions to available on User Availability coordinator suspend.", buf, 2u);
  }
  id v3 = *(id **)(a1 + 32);
  uint64_t v4 = [v3[5] lastCalculatedState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_19;
  v6[3] = &unk_1E6973B90;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_queue_notifyIntentExtensionsOfUserAvailability:availabilityOverride:applicationIdentifiers:completionHandler:", v4, v5, 0, v6);
}

uint64_t __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_19(uint64_t a1)
{
  [*(id *)(a1 + 32) suspend];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)coordinateUserAvailability:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void (**)(void, void, void))v13;
  if (self->_active)
  {
    if (v11 && v12)
    {
      v45 = (void (**)(void, void, void))v13;
      id v46 = v10;
      uint64_t v15 = [v12 mode];
      v16 = [v11 mode];
      char v51 = [v15 isEqual:v16];

      [v12 impactsAvailability];
      uint64_t v48 = DNDResolvedImpactsAvailabilitySetting();
      [v11 impactsAvailability];
      uint64_t v47 = DNDResolvedImpactsAvailabilitySetting();
      v17 = [v12 configuration];
      dispatch_queue_t v18 = [v17 allowedApplicationIdentifiers];
      id v19 = [v11 configuration];
      uint64_t v20 = [v19 allowedApplicationIdentifiers];
      char v21 = [v18 isEqual:v20];

      id v22 = [v12 configuration];
      uint64_t v23 = [v22 deniedApplicationIdentifiers];
      objc_super v24 = [v11 configuration];
      v25 = [v24 deniedApplicationIdentifiers];
      char v26 = [v23 isEqual:v25];

      char v27 = v21 & v51 & v26 ^ 1;
      if (v48 != v47) {
        char v27 = 1;
      }
      char v52 = (v11 == 0) ^ (v12 == 0) | v27;
      if (v21)
      {
        v28 = 0;
        if ((v26 & 1) == 0) {
          goto LABEL_8;
        }
      }
      else
      {
        v50 = [v12 configuration];
        v38 = [v50 allowedApplicationIdentifiers];
        v39 = [v38 allKeys];
        v40 = [v11 configuration];
        v41 = [v40 allowedApplicationIdentifiers];
        v42 = [v41 allKeys];
        __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke((uint64_t)v42, (uint64_t)v39, v42);
        v28 = (DNDSUserAvailabilityPublishResult *)objc_claimAutoreleasedReturnValue();

        if ((v26 & 1) == 0)
        {
LABEL_8:
          v49 = [v12 configuration];
          v29 = [v49 deniedApplicationIdentifiers];
          v30 = [v29 allObjects];
          v31 = [v11 configuration];
          v32 = [v31 deniedApplicationIdentifiers];
          v33 = [v32 allObjects];
          v34 = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke((uint64_t)v33, (uint64_t)v30, v33);

          if (v34)
          {
            if (v28)
            {
              uint64_t v35 = [(DNDSUserAvailabilityPublishResult *)v28 setByAddingObjectsFromSet:v34];

              v28 = (DNDSUserAvailabilityPublishResult *)v35;
            }
            else
            {
              v28 = v34;
            }
          }
          uint64_t v14 = v45;
          id v10 = v46;

          if ((v52 & 1) == 0) {
            goto LABEL_18;
          }
LABEL_15:
          queue = self->_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_24;
          block[3] = &unk_1E6973C58;
          block[4] = self;
          id v54 = v10;
          id v55 = v11;
          id v56 = v12;
          v28 = v28;
          v57 = v28;
          v58 = v14;
          dispatch_async(queue, block);

          goto LABEL_21;
        }
      }
      uint64_t v14 = v45;
      id v10 = v46;
      if (v52) {
        goto LABEL_15;
      }
    }
    else
    {
      v28 = 0;
      if ((v11 == 0) != (v12 == 0)) {
        goto LABEL_15;
      }
    }
LABEL_18:
    v43 = DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v43, OS_LOG_TYPE_INFO, "Ignoring request to coordinate user availability; from and to configurations are the same.",
        buf,
        2u);
    }
    v44 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
    ((void (**)(void, DNDSUserAvailabilityPublishResult *, void))v14)[2](v14, v44, 0);

    goto LABEL_21;
  }
  v36 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v36, OS_LOG_TYPE_INFO, "Skipping availability coordination because User Availability is disabled.", buf, 2u);
  }
  v28 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
  ((void (**)(void, DNDSUserAvailabilityPublishResult *, void))v14)[2](v14, v28, 0);
LABEL_21:
}

id __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28BD0] setWithArray:a2];
  [v5 addObjectsFromArray:v4];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v7, "countForObject:", v12, (void)v15) == 1) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    id v13 = (void *)[v6 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

void __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_24(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6973C30;
  v6[4] = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  objc_msgSend(v3, "_queue_updateAvailabilityKit:fromConfiguration:toConfiguration:completionHandler:", v7, v4, v5, v6);
}

void __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_3;
  block[3] = &unk_1E6973C08;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v13 = v3;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_INFO, "Checking if intent extensions need availability update", buf, 2u);
  }
  id v3 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v3;
    uint64_t v6 = [v4 previousState];
    *(_DWORD *)buf = 138543362;
    id v19 = v6;
    _os_log_impl(&dword_1D3052000, v5, OS_LOG_TYPE_INFO, "update.previousState: %{public}@", buf, 0xCu);
  }
  id v7 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = [v8 state];
    *(_DWORD *)buf = 138543362;
    id v19 = v10;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_INFO, "update.state: %{public}@", buf, 0xCu);
  }
  uint64_t v11 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_INFO, "Notifying intent extensions of availability update", buf, 2u);
  }
  id v12 = *(void **)(a1 + 40);
  id v13 = [*(id *)(a1 + 32) state];
  id v14 = [*(id *)(a1 + 48) allObjects];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_25;
  v15[3] = &unk_1E6973B18;
  id v17 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 56);
  objc_msgSend(v12, "_queue_notifyIntentExtensionsOfUserAvailability:applicationIdentifiers:completionHandler:", v13, v14, v15);
}

uint64_t __114__DNDSUserAvailabilityCoordinator_coordinateUserAvailability_fromConfiguration_toConfiguration_completionHandler___block_invoke_25(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)coordinateUserAvailabilityUpdateForApplicationIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (self->_active)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.MobileSMS" platform:1];
    int v11 = [v8 isEqual:v10];

    if (v11)
    {
      id v12 = DNDSLogAvailabilityProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_INFO, "Forcing Messages AvailabilityKit status to available on User Availability coordinator TCC revocation.", buf, 2u);
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke;
      v21[3] = &unk_1E6973C80;
      id v22 = (DNDSUserAvailabilityPublishResult *)v9;
      [(DNDSUserAvailabilityCoordinator *)self _publishStatusKitCurrentAvailabilityForced:v6 override:-1 completionHandler:v21];
      id v13 = v22;
    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_31;
      block[3] = &unk_1E6973CD0;
      BOOL v20 = v6;
      id v17 = (DNDSUserAvailabilityPublishResult *)v8;
      long long v18 = self;
      id v19 = v9;
      dispatch_async(queue, block);

      id v13 = v17;
    }
  }
  else
  {
    id v14 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v14, OS_LOG_TYPE_INFO, "Skipping availability coordination because User Availability is disabled.", buf, 2u);
    }
    id v13 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
    (*((void (**)(id, DNDSUserAvailabilityPublishResult *, void))v9 + 2))(v9, v13, 0);
  }
}

void __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  }
  id v10 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:v7 availability:v8];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 bundleID];
    *(_DWORD *)buf = 138543362;
    id v14 = v5;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_INFO, "Forcing intent extensions to available on User Availability coordinator TCC revocation. app=%{public}@", buf, 0xCu);
  }
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = -1;
  }
  id v7 = *(id **)(a1 + 40);
  id v8 = [v7[5] lastCalculatedState];
  uint64_t v12 = *(void *)(a1 + 32);
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_33;
  v10[3] = &unk_1E6973CA8;
  id v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "_queue_notifyIntentExtensionsOfUserAvailability:availabilityOverride:applicationIdentifiers:completionHandler:", v8, v6, v9, v10);
}

void __117__DNDSUserAvailabilityCoordinator_coordinateUserAvailabilityUpdateForApplicationIdentifier_forced_completionHandler___block_invoke_33(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
  (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *, uint64_t))(v3 + 16))(v3, v4, a2);
}

- (void)_queue_updateAvailabilityKit:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v52 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.MobileSMS" platform:1];
  uint64_t v15 = [v12 mode];
  id v16 = [v11 mode];
  id v51 = v11;
  if (v15 == v16)
  {
    int v24 = 0;
  }
  else
  {
    v49 = v14;
    id v17 = v10;
    id v18 = v13;
    id v19 = [v12 mode];
    if (v19)
    {
      [v11 mode];
      char v21 = v20 = v11;
      if (v21)
      {
        id v22 = [v12 mode];
        uint64_t v23 = [v20 mode];
        int v24 = [v22 isEqual:v23] ^ 1;
      }
      else
      {
        int v24 = 1;
      }

      id v11 = v51;
    }
    else
    {
      int v24 = 1;
    }

    id v13 = v18;
    id v10 = v17;
    id v14 = v49;
  }

  [v12 impactsAvailability];
  uint64_t v25 = DNDResolvedImpactsAvailabilitySetting();
  [v11 impactsAvailability];
  if (v25 != DNDResolvedImpactsAvailabilitySetting()) {
    int v24 = 1;
  }
  char v26 = [v11 configuration];
  char v27 = [v12 configuration];
  int v28 = v24 | [(DNDSUserAvailabilityCoordinator *)v52 _queue_didAppAvailabilityChangeForApplicationIdentifier:v14 fromConfiguration:v26 toConfiguration:v27];

  if (v28)
  {
    uint64_t v29 = [v10 source];
    BOOL v48 = [v10 reason] != 1 && objc_msgSend(v10, "reason") != 4;
    v32 = [v10 state];
    v33 = [v32 startDate];
    v34 = [v12 lastModified];
    uint64_t v35 = [v33 laterDate:v34];

    v36 = [v12 mode];
    [v12 impactsAvailability];
    v50 = v36;
    if (DNDResolvedImpactsAvailabilitySetting() == 2)
    {
      v37 = [v36 modeIdentifier];
      unsigned int v47 = [(DNDSUserAvailabilityCoordinator *)v52 _isLocalUserAvailableForMessagesWithModeIdentifier:v37 withError:0];

      v38 = [v36 identifier];
      v31 = [v38 UUIDString];
    }
    else
    {
      v31 = 0;
      unsigned int v47 = 1;
    }
    v39 = [v10 state];
    if ([v39 isActive])
    {
      v40 = [v10 state];
      [v40 activeModeIdentifier];
      v41 = v14;
      id v42 = v10;
      v44 = id v43 = v13;
      uint64_t v46 = [v44 length];

      id v13 = v43;
      id v10 = v42;
      id v14 = v41;

      if (v46)
      {
        uint64_t v45 = v47;
LABEL_27:
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __116__DNDSUserAvailabilityCoordinator__queue_updateAvailabilityKit_fromConfiguration_toConfiguration_completionHandler___block_invoke;
        v54[3] = &unk_1E6973C80;
        id v55 = v13;
        [(DNDSUserAvailabilityCoordinator *)v52 _publishStatusKitAvailability:v45 activityIdentifier:v31 local:v29 == 1 scheduled:v48 date:v35 forced:0 completion:v54];

        id v11 = v51;
        goto LABEL_28;
      }
    }
    else
    {
    }
    v31 = 0;
    uint64_t v45 = 1;
    goto LABEL_27;
  }
  v30 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_INFO, "Ignoring request to publish StatusKit availability; from and to configurations are the same.",
      buf,
      2u);
  }
  v31 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
  (*((void (**)(id, DNDSUserAvailabilityPublishResult *))v13 + 2))(v13, v31);
LABEL_28:
}

void __116__DNDSUserAvailabilityCoordinator__queue_updateAvailabilityKit_fromConfiguration_toConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  }
  id v10 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:v7 availability:v8];
  (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *))(v11 + 16))(v11, v12);
}

- (BOOL)_queue_didAppAvailabilityChangeForApplicationIdentifier:(id)a3 fromConfiguration:(id)a4 toConfiguration:(id)a5
{
  id v8 = a3;
  queue = self->_queue;
  id v10 = a5;
  id v11 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v12 = [v11 applicationConfigurationType];
  int v13 = [v8 bundleID];
  uint64_t v14 = [v11 exceptionForApplication:v13];

  int v15 = !(v12 | v14) || v12 == 1 && v14 != 1 || v12 == 2;
  uint64_t v16 = [v10 applicationConfigurationType];
  id v17 = [v8 bundleID];
  uint64_t v18 = [v10 exceptionForApplication:v17];

  int v19 = !(v16 | v18) || v16 == 1 && v18 != 1 || v16 == 2;
  BOOL v20 = v15 != v19;

  return v20;
}

- (void)_queue_notifyIntentExtensionsOfUserAvailability:(id)a3 applicationIdentifiers:(id)a4 completionHandler:(id)a5
{
  queue = self->_queue;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(queue);
  [(DNDSUserAvailabilityCoordinator *)self _queue_notifyIntentExtensionsOfUserAvailability:v11 availabilityOverride:-1 applicationIdentifiers:v10 completionHandler:v9];
}

- (void)_queue_notifyIntentExtensionsOfUserAvailability:(id)a3 availabilityOverride:(int64_t)a4 applicationIdentifiers:(id)a5 completionHandler:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = a5;
  uint64_t v35 = (void (**)(id, void))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v41 = self;
  v40 = [(DNDSUserAvailabilityTCCProviding *)self->_tccProvider userAvailabilityTCCApprovedBundleIds];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (!v9)
  {
    uint64_t v39 = 0;
    goto LABEL_28;
  }
  uint64_t v39 = 0;
  uint64_t v43 = *(void *)v52;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v52 != v43) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      uint64_t v12 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v11];
      int v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      int v15 = [v12 supportedIntentsByApp];
      if ([v15 containsObject:v14]) {
        goto LABEL_23;
      }
      uint64_t v16 = [v12 supportedActionsByExtensions];
      int v17 = [v16 containsObject:v14];

      if (!v17) {
        goto LABEL_24;
      }
      uint64_t v18 = (void *)DNDSLogStateProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
      {
        int v19 = v18;
        BOOL v20 = [v11 bundleIdentifier];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1D3052000, v19, OS_LOG_TYPE_INFO, "Found intent extension for app: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      char v21 = [v11 bundleIdentifier];
      int v22 = [v40 containsObject:v21];

      int v15 = [(DNDSUserAvailabilityCoordinator *)v41 _entitlementRecordForApplicationRecord:v11];
      uint64_t v23 = [v15 entitlements];
      int v24 = [v23 objectForKey:@"com.apple.developer.usernotifications.communication" ofClass:objc_opt_class()];
      int v25 = [v24 BOOLValue];

      char v26 = [v11 bundleIdentifier];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__3;
      v60 = __Block_byref_object_dispose__3;
      id v61 = (id)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:v26];
      int v27 = DNDGrantedUserNotificationsAuthorizationForBundleIdentifier(v26);
      if ((v22 & v25 & v27) == 1)
      {
        extensionLaunchQueue = v41->_extensionLaunchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke;
        block[3] = &unk_1E6973D20;
        uint64_t v29 = v37;
        p_long long buf = &buf;
        int64_t v50 = a4;
        uint64_t v45 = v29;
        uint64_t v46 = v41;
        id v47 = v38;
        BOOL v48 = v11;
        dispatch_async(extensionLaunchQueue, block);

        ++v39;
        v30 = v45;
LABEL_21:

        goto LABEL_22;
      }
      if ((v22 & 1) == 0)
      {
        v30 = (id)DNDSLogStateProvider;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v32 = [v11 bundleIdentifier];
          *(_DWORD *)id v55 = 138543362;
          id v56 = v32;
          _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_INFO, "App (%{public}@) does not have user availability TCC permission, not launching extension.", v55, 0xCu);
        }
        goto LABEL_21;
      }
      if ((v25 & 1) == 0)
      {
        v30 = (id)DNDSLogStateProvider;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v33 = [v11 bundleIdentifier];
          *(_DWORD *)id v55 = 138543362;
          id v56 = v33;
          _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_INFO, "App (%{public}@) does not have UN Communication entitlement, not launching extension.", v55, 0xCu);
        }
        goto LABEL_21;
      }
      if ((v27 & 1) == 0)
      {
        v30 = (id)DNDSLogStateProvider;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = [v11 bundleIdentifier];
          *(_DWORD *)id v55 = 138543362;
          id v56 = v31;
          _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_INFO, "App (%{public}@) does not have UN authorization, not launching extension.", v55, 0xCu);
        }
        goto LABEL_21;
      }
LABEL_22:
      _Block_object_dispose(&buf, 8);

LABEL_23:
LABEL_24:
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  }
  while (v9);
LABEL_28:

  v34 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_INFO, "Done dispatching launch blocks to _launchQueue", (uint8_t *)&buf, 2u);
  }
  v35[2](v35, v39);
}

void __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3
    && ![v3 containsObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)])
  {
    uint64_t v6 = DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_INFO, "Skipping Intent launch of %@ because relative availability did not change.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 72);
    if (v4 == -1)
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v9 = *(void **)(a1 + 40);
      id v10 = [*(id *)(a1 + 48) activeModeIdentifier];
      uint64_t v5 = [v9 _isLocalUserAvailableForAppId:v8 modeIdentifier:v10 withError:0];
    }
    else
    {
      uint64_t v5 = v4 == 1;
    }
    id v11 = [[DNDSUserAvailabilityIntentLauncher alloc] initWithApplicationRecord:*(void *)(a1 + 56) available:v5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6973CF8;
    uint64_t v12 = v2;
    int v15 = v12;
    [(DNDSUserAvailabilityIntentLauncher *)v11 launchIntentExtensionWithCompletion:v14];
    dispatch_time_t v13 = dispatch_time(0, 15000000000);
    dispatch_semaphore_wait(v12, v13);
  }
}

void __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2_cold_1();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_entitlementRecordForApplicationRecord:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  int v5 = [v4 deviceClass];

  id v6 = v3;
  if (v5 == 4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [v3 applicationExtensionRecords];
    uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    id v18 = v3;
    id v6 = v3;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      id v6 = v3;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "infoDictionary", v18);
          dispatch_time_t v13 = [v12 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

          uint64_t v14 = [v13 objectForKey:@"NSExtensionPointIdentifier"];
          int v15 = [v14 isEqualToString:@"com.apple.watchkit"];

          if (v15)
          {
            id v16 = v11;

            id v6 = v16;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v3 = v18;
  }

  return v6;
}

- (void)sendStatusKitInvitationsForContacts:(id)a3 completionHandler:(id)a4
{
}

- (void)sendStatusKitInvitationsForContacts:(id)a3 forceAvailabilityPublish:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_active)
  {
    objc_initWeak(&location, self->_statusService);
    *(void *)long long buf = 0;
    long long v21 = buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke;
    v13[3] = &unk_1E6973DC0;
    objc_copyWeak(&v18, &location);
    id v14 = v8;
    int v15 = self;
    uint64_t v17 = buf;
    BOOL v19 = a4;
    id v16 = v9;
    dispatch_async(queue, v13);

    objc_destroyWeak(&v18);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_INFO, "Skipping invitation send request because User Availability is disabled.", buf, 2u);
    }
    if (v9)
    {
      uint64_t v12 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
      (*((void (**)(id, DNDSUserAvailabilityPublishResult *, void))v9 + 2))(v9, v12, MEMORY[0x1E4F1CBF0]);
    }
  }
}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  dispatch_semaphore_t v2 = dispatch_group_create();
  long long v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(v1 + 32), "count"));
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = *(id *)(v1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v79;
    *(void *)&long long v4 = 138412290;
    long long v49 = v4;
    uint64_t v51 = v1;
    long long v52 = v2;
    uint64_t v50 = *(void *)v79;
    do
    {
      uint64_t v7 = 0;
      uint64_t v55 = v5;
      do
      {
        if (*(void *)v79 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v78 + 1) + 8 * v7);
        id v9 = objc_alloc_init(MEMORY[0x1E4F5F6F8]);
        id v10 = [v8 contactIdentifier];
        [v9 setContactIdentifier:v10];

        id v11 = [v8 phoneNumbers];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          [v9 setType:2];
          dispatch_time_t v13 = [v8 phoneNumbers];
        }
        else
        {
          id v14 = [v8 emailAddresses];
          uint64_t v15 = [v14 count];

          if (!v15) {
            goto LABEL_11;
          }
          [v9 setType:1];
          dispatch_time_t v13 = [v8 emailAddresses];
        }
        id v16 = v13;
        uint64_t v17 = objc_msgSend(v13, "anyObject", v49);
        [v9 setValue:v17];

LABEL_11:
        id v18 = *(void **)(v1 + 40);
        id v77 = 0;
        BOOL v19 = objc_msgSend(v18, "exceptionalModesForContactHandle:withError:", v9, &v77, v49);
        id v20 = v77;
        v60 = [v19 allowed];
        [v19 silenced];
        v59 = id v58 = v20;
        if (v20)
        {
          long long v21 = DNDSLogStateProvider;
          uint64_t v22 = v58;
          if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v49;
            id v85 = v58;
            _os_log_error_impl(&dword_1D3052000, v21, OS_LOG_TYPE_ERROR, "Error getting allowedModesForContactHandle: %@", buf, 0xCu);
          }
        }
        else
        {
          v57 = v19;
          dispatch_group_enter(v2);
          char v23 = objc_opt_new();
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          int v24 = [v8 phoneNumbers];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v73 objects:v83 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v74;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v74 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4FA7FD8]) initWithString:*(void *)(*((void *)&v73 + 1) + 8 * i)];
                [v23 addObject:v29];
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v73 objects:v83 count:16];
            }
            while (v26);
          }

          long long v71 = 0u;
          long long v72 = 0u;
          long long v70 = 0u;
          long long v69 = 0u;
          v30 = [v8 emailAddresses];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v69 objects:v82 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v70;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v70 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4FA7FD8]) initWithString:*(void *)(*((void *)&v69 + 1) + 8 * j)];
                [v23 addObject:v35];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v69 objects:v82 count:16];
            }
            while (v32);
          }

          v36 = (void *)[objc_alloc(MEMORY[0x1E4F4F178]) initWithAvailableDuringActivityIdentifiers:v60 unavailableDuringActivityIdentifiers:v59];
          id v37 = [v8 phoneNumbers];
          id v38 = [v37 allObjects];
          uint64_t v39 = [v8 emailAddresses];
          v40 = [v39 allObjects];
          v41 = [v38 arrayByAddingObjectsFromArray:v40];

          id v42 = [[DNDSAvailabilityInvitationRequest alloc] initWithHandles:v41 invitation:v36];
          [v53 addObject:v42];

          uint64_t v43 = [MEMORY[0x1E4F1C9C8] date];
          v44 = [v36 statusKitInvitationPayloadWithDateCreated:v43];

          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_57;
          v66[3] = &unk_1E6973D48;
          uint64_t v1 = v51;
          dispatch_semaphore_t v2 = v52;
          uint64_t v68 = *(void *)(v51 + 56);
          v67 = v52;
          [WeakRetained inviteHandlesFromPrimaryAccountHandle:v23 withInvitationPayload:v44 completion:v66];

          uint64_t v6 = v50;
          uint64_t v5 = v55;
          BOOL v19 = v57;
          uint64_t v22 = 0;
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v5);
  }

  uint64_t v45 = *(void *)(v1 + 40);
  uint64_t v46 = *(NSObject **)(v45 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_62;
  block[3] = &unk_1E6973D98;
  char v65 = *(unsigned char *)(v1 + 72);
  void block[4] = v45;
  long long v61 = *(_OWORD *)(v1 + 48);
  id v47 = (id)v61;
  long long v64 = v61;
  id v63 = v53;
  id v48 = v53;
  dispatch_group_notify(v2, v46, block);
}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = DNDSLogStateProvider;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
      __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_57_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = NSClassFromString(&cfstr_Xctest.isa) != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_INFO, "Successfully published AKAvailabilityInvitation", v5, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_62(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    dispatch_semaphore_t v2 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3052000, v2, OS_LOG_TYPE_INFO, "Forcing availability re-publish despite no updated invitations.", buf, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(a1 + 64);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 8))
  {
    id v8 = DNDSLogAvailabilityProvider;
    if (!os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)long long buf = 0;
    id v9 = "Skipping availability re-publish because User Availability is disabled.";
LABEL_15:
    _os_log_impl(&dword_1D3052000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    goto LABEL_16;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v8 = DNDSLogAvailabilityProvider;
    if (!os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO)) {
      goto LABEL_16;
    }
    *(_WORD *)long long buf = 0;
    id v9 = "Skipping availability re-publish because there were no changes to allowed contacts.";
    goto LABEL_15;
  }
  long long v4 = [*(id *)(v3 + 40) lastCalculatedState];
  int v5 = [v4 isActive];

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_63;
    v11[3] = &unk_1E6973D70;
    dispatch_time_t v13 = (DNDSUserAvailabilityPublishResult *)*(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    [v6 _publishStatusKitCurrentAvailabilityForced:0 override:-1 completionHandler:v11];

    uint64_t v7 = v13;
    goto LABEL_18;
  }
  id v8 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    id v9 = "Skipping availability re-publish because no mode is enabled.";
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v10 = *(void *)(a1 + 48);
  if (!v10) {
    return;
  }
  uint64_t v7 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
  (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *, void))(v10 + 16))(v10, v7, *(void *)(a1 + 40));
LABEL_18:
}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR)) {
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  }
  uint64_t v10 = DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    id v12 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:v7 availability:v8];
    (*(void (**)(uint64_t, DNDSUserAvailabilityPublishResult *, void))(v11 + 16))(v11, v12, *(void *)(a1 + 32));
  }
}

- (BOOL)_isLocalUserAvailableForAppId:(id)a3 modeIdentifier:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  configurationProvider = self->_configurationProvider;
  id v24 = 0;
  uint64_t v11 = [(DNDSModeConfigurationProviding *)configurationProvider modeConfigurationForModeIdentifier:v9 withError:&v24];
  id v12 = v24;
  int v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v16 = [v11 configuration];
    uint64_t v17 = [v16 applicationConfigurationType];

    id v18 = [v8 bundleID];
    uint64_t v19 = [v18 length];

    if (v19)
    {
      uint64_t v20 = [(DNDSModeConfigurationProviding *)self->_configurationProvider exceptionForApplicationIdentifier:v8 thread:0 forModeIdentifier:v9];
      if (!(v17 | v20))
      {
        BOOL v15 = 1;
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v20 = 2;
    }
    BOOL v22 = v17 == 1 && v20 != 1;
    BOOL v15 = 1;
    if (v17 != 2 && !v22)
    {
      [v11 impactsAvailability];
      BOOL v15 = DNDResolvedImpactsAvailabilitySetting() != 2;
    }
  }
  else
  {
    BOOL v15 = 1;
    if (a5 && v12) {
      *a5 = v12;
    }
  }
LABEL_21:

  return v15;
}

- (BOOL)_isLocalUserAvailableForMessagesWithModeIdentifier:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F5F598]) initWithBundleID:@"com.apple.MobileSMS" platform:1];
  configurationProvider = self->_configurationProvider;
  id v22 = 0;
  id v9 = [(DNDSModeConfigurationProviding *)configurationProvider modeConfigurationForModeIdentifier:v6 withError:&v22];
  id v10 = v22;
  uint64_t v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    BOOL v14 = [v9 configuration];
    uint64_t v15 = [v14 applicationConfigurationType];

    uint64_t v16 = [(DNDSModeConfigurationProviding *)self->_configurationProvider exceptionForApplicationIdentifier:v7 thread:0 forModeIdentifier:v6];
    uint64_t v17 = [v9 configuration];
    uint64_t v18 = [v17 senderConfigurationType];

    if (!(v15 | v16)) {
      goto LABEL_9;
    }
    if (!v15 && v16 == 2) {
      goto LABEL_12;
    }
    if (v15 == 1 && v16 == 1)
    {
      [v9 impactsAvailability];
      BOOL v13 = DNDResolvedImpactsAvailabilitySetting() != 2;
      goto LABEL_18;
    }
    BOOL v20 = v15 == 1 && v16 == 2;
    BOOL v21 = v20;
    if (v15 == 2 || v21)
    {
LABEL_12:
      [v9 impactsAvailability];
      BOOL v13 = DNDResolvedImpactsAvailabilitySetting() != 2 || (unint64_t)(v18 - 1) < 2;
    }
    else
    {
LABEL_9:
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 1;
    if (a4 && v10) {
      *a4 = v10;
    }
  }
LABEL_18:

  return v13;
}

- (BOOL)isLocalUserAvailableForApplicationIdentifier:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (self->_active)
  {
    id v7 = [(DNDSStateProviding *)self->_stateProvider lastCalculatedState];
    id v8 = [v7 activeModeIdentifier];
    BOOL v9 = [(DNDSUserAvailabilityCoordinator *)self _isLocalUserAvailableForAppId:v6 modeIdentifier:v8 withError:a4];
  }
  else
  {
    id v10 = DNDSLogAvailabilityProvider;
    BOOL v9 = 1;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_INFO, "Skipping availability check because User Availability is disabled.", v12, 2u);
    }
  }

  return v9;
}

- (BOOL)isTCCUserAvailabilityGrantedForBundleId:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL active = self->_active;
  id v6 = DNDSLogAvailabilityProvider;
  BOOL v7 = os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO);
  if (!active)
  {
    if (!v7)
    {
LABEL_11:
      char v9 = 0;
      goto LABEL_12;
    }
    LOWORD(v15) = 0;
    id v10 = "Skipping availability check because User Availability is disabled.";
    uint64_t v11 = v6;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl(&dword_1D3052000, v11, v12, v10, (uint8_t *)&v15, 2u);
    goto LABEL_11;
  }
  if (v7)
  {
    int v15 = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_INFO, "Looking up User Availability permission for bundleId: %{public}@", (uint8_t *)&v15, 0xCu);
  }
  if (![v4 length])
  {
    uint64_t v13 = DNDSLogAvailabilityProvider;
    char v9 = 0;
    if (!os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    LOWORD(v15) = 0;
    id v10 = "Empty bundleId passed to isTCCUserAvailabilityGrantedForBundleId";
    uint64_t v11 = v13;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  id v8 = [(DNDSUserAvailabilityTCCProviding *)self->_tccProvider userAvailabilityTCCApprovedBundleIds];
  char v9 = [v8 containsObject:v4];

LABEL_12:
  return v9;
}

- (id)allowedModesForContactHandle:(id)a3 withError:(id *)a4
{
  id v4 = [(DNDSUserAvailabilityCoordinator *)self exceptionalModesForContactHandle:a3 withError:a4];
  int v5 = [v4 allowed];
  if ([v5 count]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)silencedModesForContactHandle:(id)a3 withError:(id *)a4
{
  id v4 = [(DNDSUserAvailabilityCoordinator *)self exceptionalModesForContactHandle:a3 withError:a4];
  int v5 = [v4 silenced];
  if ([v5 count]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)exceptionalModesForContactHandle:(id)a3 withError:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_active)
  {
    os_log_type_t v12 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_INFO, "Skipping exceptional modes check because User Availability is disabled.", buf, 2u);
    }
    uint64_t v11 = 0;
    goto LABEL_26;
  }
  configurationProvider = self->_configurationProvider;
  id v38 = 0;
  id v8 = [(DNDSModeConfigurationProviding *)configurationProvider modeConfigurationsWithError:&v38];
  id v9 = v38;
  id v10 = v9;
  if (!v9)
  {
    uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    v30 = v8;
    uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [v8 allValues];
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v18 = [v17 configuration];
        uint64_t v19 = [v18 senderConfigurationType];

        BOOL v20 = self->_configurationProvider;
        BOOL v21 = [v17 mode];
        id v22 = [v21 modeIdentifier];
        uint64_t v23 = [(DNDSModeConfigurationProviding *)v20 exceptionForContactHandle:v6 forModeIdentifier:v22];

        if (!(v19 | v23))
        {
          id v24 = [v17 mode];
          uint64_t v25 = [v24 identifier];
          uint64_t v26 = [v25 UUIDString];
          uint64_t v27 = v32;
LABEL_21:
          [v27 addObject:v26];

          continue;
        }
        if (v19 == 1 && v23 == 1)
        {
          id v24 = [v17 mode];
          uint64_t v25 = [v24 identifier];
          uint64_t v26 = [v25 UUIDString];
          uint64_t v27 = v31;
          goto LABEL_21;
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (!v14)
      {
LABEL_24:

        uint64_t v11 = [[DNDSContentHandleExceptionalModesBox alloc] initWithContactHandle:v6 allowed:v32 silenced:v31];
        id v10 = 0;
        id v8 = v30;
        goto LABEL_25;
      }
    }
  }
  uint64_t v11 = 0;
  if (a4) {
    *a4 = v9;
  }
LABEL_25:

LABEL_26:
  return v11;
}

- (BOOL)userAvailabilityInActiveModeForContactHandle:(id)a3 withError:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_active)
  {
    if ([(DNDSUserAvailabilityCoordinator *)self _isTCCUserAvailabilityGrantedForMessages])
    {
      id v7 = [(DNDSStateProviding *)self->_stateProvider lastCalculatedState];
      configurationProvider = self->_configurationProvider;
      id v9 = [v7 activeModeIdentifier];
      id v10 = [(DNDSModeConfigurationProviding *)configurationProvider modeConfigurationForModeIdentifier:v9 withError:0];
      uint64_t v11 = [v10 configuration];
      uint64_t v12 = [v11 senderConfigurationType];

      uint64_t v13 = self->_configurationProvider;
      uint64_t v14 = [v7 activeModeIdentifier];
      uint64_t v15 = [(DNDSModeConfigurationProviding *)v13 exceptionForContactHandle:v6 forModeIdentifier:v14];

      BOOL v18 = v12 == 1 && v15 != 1 || v12 == 2;
      if (v12 | v15) {
        BOOL v19 = v18;
      }
      else {
        BOOL v19 = 1;
      }

      goto LABEL_23;
    }
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR))
    {
      -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:]();
      if (a4) {
        goto LABEL_20;
      }
    }
    else if (a4)
    {
LABEL_20:
      BOOL v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F5F528];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"Calling bundleId does not have permission to read user availability.";
      BOOL v19 = 1;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      *a4 = [v21 errorWithDomain:v22 code:1004 userInfo:v23];

      goto LABEL_23;
    }
    BOOL v19 = 1;
    goto LABEL_23;
  }
  BOOL v20 = DNDSLogAvailabilityProvider;
  BOOL v19 = 1;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v25 = 0;
    BOOL v19 = 1;
    _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_INFO, "Skipping availability check for contact because User Availability is disabled.", v25, 2u);
  }
LABEL_23:

  return v19;
}

- (id)publishStatusKitAvailabilityReturningError:(id *)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  if (self->_active)
  {
    *(void *)long long buf = 0;
    long long v37 = buf;
    uint64_t v38 = 0x3032000000;
    uint64_t v39 = __Block_byref_object_copy__3;
    v40 = __Block_byref_object_dispose__3;
    id v41 = 0;
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = __Block_byref_object_copy__3;
    long long v34 = __Block_byref_object_dispose__3;
    id v35 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__3;
    int v28 = __Block_byref_object_dispose__3;
    id v29 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    BOOL v18 = __78__DNDSUserAvailabilityCoordinator_publishStatusKitAvailabilityReturningError___block_invoke;
    BOOL v19 = &unk_1E6973DE8;
    BOOL v21 = buf;
    uint64_t v22 = &v30;
    uint64_t v23 = &v24;
    id v6 = v5;
    BOOL v20 = v6;
    [(DNDSUserAvailabilityCoordinator *)self _publishStatusKitCurrentAvailabilityForced:0 override:-1 completionHandler:&v16];
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      if (a3)
      {
        id v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        v43[0] = @"Call to -[SKStatusPublishingService publishStatusRequest:completion:] timed out";
        id v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1, v16, v17, v18, v19);
        *a3 = [v8 errorWithDomain:*MEMORY[0x1E4F5F528] code:1000 userInfo:v9];
      }
      id v10 = [DNDSUserAvailabilityPublishResult alloc];
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      if (a3) {
        *a3 = (id) v25[5];
      }
      id v10 = [DNDSUserAvailabilityPublishResult alloc];
      uint64_t v11 = *((void *)v37 + 5);
      uint64_t v12 = v31[5];
    }
    uint64_t v14 = -[DNDSUserAvailabilityPublishResult initWithIdentifier:availability:](v10, "initWithIdentifier:availability:", v11, v12, v16, v17, v18, v19);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v13 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D3052000, v13, OS_LOG_TYPE_INFO, "Skipping publish because User Availability is disabled.", buf, 2u);
    }
    uint64_t v14 = [[DNDSUserAvailabilityPublishResult alloc] initWithIdentifier:0 availability:0];
  }
  return v14;
}

void __78__DNDSUserAvailabilityCoordinator_publishStatusKitAvailabilityReturningError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9 && os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  }
  id v10 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    int v20 = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
  id v13 = v7;

  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v8;
  id v16 = v8;

  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v9;
  id v19 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_publishStatusKitCurrentAvailabilityForced:(BOOL)a3 override:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  BOOL v9 = [(DNDSUserAvailabilityCoordinator *)self _isTCCUserAvailabilityGrantedForMessages];
  BOOL v10 = v9;
  if (v6 || v9)
  {
    if (a4 != -1)
    {
      uint64_t v15 = (void *)DNDSLogAvailabilityProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = NSNumber;
        uint64_t v17 = v15;
        BOOL v18 = [v16 numberWithInteger:a4];
        *(_DWORD *)long long buf = 138412290;
        long long v36 = v18;
        _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_DEFAULT, "Applying override to focus status update: %@", buf, 0xCu);
      }
      uint64_t v14 = 0;
      BOOL v19 = a4 != 0;
      goto LABEL_19;
    }
    int v20 = [(DNDSStateProviding *)self->_stateProvider lastCalculatedState];
    if (![v20 isActive])
    {
      uint64_t v14 = 0;
      BOOL v19 = 1;
      goto LABEL_18;
    }
    configurationProvider = self->_configurationProvider;
    uint64_t v22 = [v20 activeModeIdentifier];
    id v34 = 0;
    uint64_t v23 = [(DNDSModeConfigurationProviding *)configurationProvider modeConfigurationForModeIdentifier:v22 withError:&v34];
    id v24 = v34;

    if (v24)
    {
      uint64_t v25 = (void *)DNDSLogAvailabilityProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
        -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:](v25, v20);
      }
    }
    else
    {
      if (v10)
      {
        [v23 impactsAvailability];
        if (DNDResolvedImpactsAvailabilitySetting() == 2)
        {
          uint64_t v26 = [v20 activeModeIdentifier];
          BOOL v19 = [(DNDSUserAvailabilityCoordinator *)self _isLocalUserAvailableForMessagesWithModeIdentifier:v26 withError:0];

          uint64_t v27 = [v23 mode];
          int v28 = [v27 identifier];
          uint64_t v14 = [v28 UUIDString];

          if (![v14 length])
          {
            id v29 = (void *)DNDSLogAvailabilityProvider;
            if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_FAULT)) {
              -[DNDSUserAvailabilityCoordinator _publishStatusKitCurrentAvailabilityForced:override:completionHandler:](v29, v20);
            }

            uint64_t v14 = 0;
            BOOL v19 = 1;
          }
        }
        else
        {
          uint64_t v31 = (void *)DNDSLogAvailabilityProvider;
          BOOL v19 = 1;
          if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = v31;
            uint64_t v33 = [v20 activeModeIdentifier];
            *(_DWORD *)long long buf = 138477827;
            long long v36 = v33;
            _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_INFO, ".impactsAvailability is disabled for %{private}@", buf, 0xCu);
          }
          uint64_t v14 = 0;
        }
        goto LABEL_16;
      }
      if (v6)
      {
        uint64_t v30 = DNDSLogAvailabilityProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1D3052000, v30, OS_LOG_TYPE_DEFAULT, "Forced focus status update indicating not focused due to TCC revocation", buf, 2u);
        }
      }
    }
    uint64_t v14 = 0;
    BOOL v19 = 1;
LABEL_16:

LABEL_18:
LABEL_19:
    [(DNDSUserAvailabilityCoordinator *)self _publishStatusKitAvailability:v19 activityIdentifier:v14 local:1 scheduled:0 date:0 forced:v6 completion:v8];
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
    -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:]();
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F5F528];
  uint64_t v37 = *MEMORY[0x1E4F28568];
  v38[0] = @"Caller does not have permission to trigger publishing user availability.";
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  uint64_t v14 = [v11 errorWithDomain:v12 code:1004 userInfo:v13];

  if (v8) {
    (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v14);
  }
LABEL_20:
}

- (void)_publishStatusKitAvailability:(BOOL)a3 activityIdentifier:(id)a4 local:(BOOL)a5 scheduled:(BOOL)a6 date:(id)a7 forced:(BOOL)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  if (a8
    || [(DNDSUserAvailabilityCoordinator *)self _isTCCUserAvailabilityGrantedForMessages])
  {
    BOOL v18 = DNDSLogAvailabilityProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = @"UNAVAILABLE";
      if (v13) {
        BOOL v19 = @"AVAILABLE";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v31 = v19;
      __int16 v32 = 2114;
      id v33 = v15;
      _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_INFO, "Informing availability (%{public}@) for activity %{public}@ to StatusKit", buf, 0x16u);
    }
    int v20 = (void *)[objc_alloc(MEMORY[0x1E4F4F170]) initWithAvailable:v13 activityIdentifierString:v15];
    id v21 = [v20 statusPublishRequest];
    [v21 setIsSecondaryDeviceRepublish:!v12];
    [v21 setIsScheduledRequest:v11];
    [v21 setDateCreated:v16];
    statusService = self->_statusService;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __123__DNDSUserAvailabilityCoordinator__publishStatusKitAvailability_activityIdentifier_local_scheduled_date_forced_completion___block_invoke;
    v27[3] = &unk_1E6973E10;
    id v28 = v20;
    id v29 = v17;
    id v23 = v20;
    [(SKStatusPublishingService *)statusService publishStatusRequest:v21 completion:v27];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
      -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:]();
    }
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F5F528];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = @"Caller does not have permission to trigger publishing user availability.";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v21 = [v24 errorWithDomain:v25 code:1004 userInfo:v26];

    if (v17) {
      (*((void (**)(id, void, void, void *))v17 + 2))(v17, 0, 0, v21);
    }
  }
}

void __123__DNDSUserAvailabilityCoordinator__publishStatusKitAvailability_activityIdentifier_local_scheduled_date_forced_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_ERROR)) {
    __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1();
  }
  id v7 = DNDSLogAvailabilityProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAvailabilityProvider, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_INFO, "Published status request with identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, void, id))(v8 + 16))(v8, v5, *(void *)(a1 + 32), v6);
  }
}

- (BOOL)_isTCCUserAvailabilityGrantedForMessages
{
  return [(DNDSUserAvailabilityCoordinator *)self isTCCUserAvailabilityGrantedForBundleId:@"com.apple.MobileSMS"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusService, 0);
  objc_storeStrong((id *)&self->_tccProvider, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
  objc_storeStrong((id *)&self->_configurationProvider, 0);
  objc_storeStrong((id *)&self->_extensionLaunchQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)resumeUpdatingInvitationsForContacts:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Skipping publish and invite on resume because User Availability is **still** enabled.", v2, v3, v4, v5, v6);
}

- (void)suspendWithOverrideSetting:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Skipping overriding publish on suspend because User Availability is **already** disabled.", v2, v3, v4, v5, v6);
}

void __80__DNDSUserAvailabilityCoordinator_suspendWithOverrideSetting_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error publishing availability to StatusKit: %{public}@", v2, v3, v4, v5, v6);
}

void __145__DNDSUserAvailabilityCoordinator__queue_notifyIntentExtensionsOfUserAvailability_availabilityOverride_applicationIdentifiers_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Intent launcher error: %{public}@", v2, v3, v4, v5, v6);
}

void __114__DNDSUserAvailabilityCoordinator_sendStatusKitInvitationsForContacts_forceAvailabilityPublish_completionHandler___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error publishing AKAvailabilityInvitation: %@", v2, v3, v4, v5, v6);
}

- (void)userAvailabilityInActiveModeForContactHandle:withError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1D3052000, v0, v1, "Messages does not have user availability TCC permission.", v2, v3, v4, v5, v6);
}

- (void)_publishStatusKitCurrentAvailabilityForced:(void *)a1 override:(void *)a2 completionHandler:.cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 activeModeIdentifier];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1D3052000, v3, OS_LOG_TYPE_FAULT, "Unexpected empty identifier UUID or nil mode for modeIdentifier, modeIdentifier=%{private}@", v5, 0xCu);
}

- (void)_publishStatusKitCurrentAvailabilityForced:(void *)a1 override:(void *)a2 completionHandler:.cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 activeModeIdentifier];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3052000, v3, OS_LOG_TYPE_ERROR, "Error getting mode configuration for %{private}@", v5, 0xCu);
}

@end