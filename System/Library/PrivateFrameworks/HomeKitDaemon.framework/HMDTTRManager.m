@interface HMDTTRManager
+ (HMMRadarRequestFilter)defaultFilter;
+ (id)namespaceUUID;
+ (id)queue;
+ (id)sharedManager;
- (BOOL)isTTRServiceAuthorized;
- (HMDTTRManager)initWithDialog:(id)a3 requestFilter:(id)a4;
- (HMDUIDialogPresenter)dialog;
- (HMMRadarRequestFilter)requestFilter;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)messageReceiveQueue;
- (TapToRadarService)ttrService;
- (id)messageDestination;
- (void)handlePresentTTRDialog:(id)a3;
- (void)handleResetLastTTRTime:(id)a3;
- (void)initiateRadarWithTitle:(id)a3 componentName:(id)a4 componentVersion:(id)a5 componentID:(int64_t)a6 displayReason:(id)a7 attachments:(id)a8 isUserInitiated:(BOOL)a9;
- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4;
- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7;
- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 attachments:(id)a8;
- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 attachments:(id)a8 waitForResponse:(BOOL)a9;
@end

@implementation HMDTTRManager

+ (HMMRadarRequestFilter)defaultFilter
{
  id v2 = objc_msgSend(self, sel_sharedPreferences);
  sub_2302DD6F0();
  swift_allocObject();
  uint64_t v3 = sub_2302DD6E0();
  v4 = (void *)sub_22F560D80(v2, v3);
  swift_release();

  return (HMMRadarRequestFilter *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestFilter, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_ttrService, 0);
}

- (HMMRadarRequestFilter)requestFilter
{
  return self->_requestFilter;
}

- (HMDUIDialogPresenter)dialog
{
  return self->_dialog;
}

- (TapToRadarService)ttrService
{
  return self->_ttrService;
}

- (void)handleResetLastTTRTime:(id)a3
{
  id v5 = a3;
  v4 = [(HMDTTRManager *)self requestFilter];
  [v4 radarRequestedForDisplayReason:&stru_26E2EB898];

  [v5 respondWithSuccess];
}

- (void)handlePresentTTRDialog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 messagePayload];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"category"];

  if (v6) {
    v7 = (__CFString *)v6;
  }
  else {
    v7 = @"homeutil";
  }
  v8 = v7;
  [(HMDTTRManager *)self requestRadarWithDisplayReason:v7 radarTitle:v7];
  [v4 respondWithSuccess];
}

- (OS_dispatch_queue)messageReceiveQueue
{
  id v2 = objc_opt_class();
  return (OS_dispatch_queue *)[v2 queue];
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x263F42570]);
  id v4 = [(HMDTTRManager *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  id v2 = objc_opt_class();
  return (NSUUID *)[v2 namespaceUUID];
}

- (void)initiateRadarWithTitle:(id)a3 componentName:(id)a4 componentVersion:(id)a5 componentID:(int64_t)a6 displayReason:(id)a7 attachments:(id)a8 isUserInitiated:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v20 = [(HMDTTRManager *)self ttrService];

  if (!v20)
  {
    v34 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v41, 8);
    _Unwind_Resume(v34);
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v21 = (void *)getRadarDraftClass_softClass;
  uint64_t v44 = getRadarDraftClass_softClass;
  if (!getRadarDraftClass_softClass)
  {
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __getRadarDraftClass_block_invoke;
    v39 = &unk_264A2C2A8;
    v40 = &v41;
    __getRadarDraftClass_block_invoke((uint64_t)&v36);
    v21 = (void *)v42[3];
  }
  v22 = v21;
  _Block_object_dispose(&v41, 8);
  id v23 = objc_alloc_init(v22);
  unint64_t v24 = [v15 length];
  if (v24 >= 0xF0) {
    uint64_t v25 = 240;
  }
  else {
    uint64_t v25 = v24;
  }
  v26 = [v15 substringToIndex:v25];
  [v23 setTitle:v26];

  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v27 = (void *)getRadarComponentClass_softClass;
  uint64_t v44 = getRadarComponentClass_softClass;
  if (!getRadarComponentClass_softClass)
  {
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __getRadarComponentClass_block_invoke;
    v39 = &unk_264A2C2A8;
    v40 = &v41;
    __getRadarComponentClass_block_invoke((uint64_t)&v36);
    v27 = (void *)v42[3];
  }
  v28 = v27;
  _Block_object_dispose(&v41, 8);
  v29 = (void *)[[v28 alloc] initWithName:v16 version:v17 identifier:a6];
  [v23 setComponent:v29];

  [v23 setAttachments:v19];
  [v23 setIsUserInitiated:a9];
  [v23 setDiagnosticExtensionIDs:&unk_26E4744E8];
  unint64_t v30 = [v18 length];
  if (v30 >= 0x4B) {
    uint64_t v31 = 75;
  }
  else {
    uint64_t v31 = v30;
  }
  v32 = [v18 substringToIndex:v31];
  v33 = [(HMDTTRManager *)self ttrService];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __125__HMDTTRManager_initiateRadarWithTitle_componentName_componentVersion_componentID_displayReason_attachments_isUserInitiated___block_invoke;
  v35[3] = &unk_264A2F3E8;
  v35[4] = self;
  [v33 createDraft:v23 forProcessNamed:@"HomeKit" withDisplayReason:v32 completionHandler:v35];
}

void __125__HMDTTRManager_initiateRadarWithTitle_componentName_componentVersion_componentID_displayReason_attachments_isUserInitiated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error trying to create radar draft: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (BOOL)isTTRServiceAuthorized
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(HMDTTRManager *)self ttrService];

  if (!v3) {
    _HMFPreconditionFailure();
  }
  id v4 = [(HMDTTRManager *)self ttrService];
  id v5 = [v4 serviceSettings];
  uint64_t v6 = [v5 authorizationStatus];

  switch(v6)
  {
    case 2:
      v7 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v10;
        id v11 = "%{public}@Failing to initiate a radar: TapToRadarService is rate-limiting us";
        goto LABEL_11;
      }
LABEL_12:

      return 0;
    case 1:
      v7 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v10;
        id v11 = "%{public}@Failing to initiate a radar: TapToRadarService has been disallowed by the user";
        goto LABEL_11;
      }
      goto LABEL_12;
    case 0:
      v7 = (void *)MEMORY[0x230FBD990]();
      int v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = HMFGetLogIdentifier();
        int v15 = 138543362;
        id v16 = v10;
        id v11 = "%{public}@Failing to initiate a radar: TapToRadarService is not authorized";
LABEL_11:
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0xCu);

        goto LABEL_12;
      }
      goto LABEL_12;
  }
  return 1;
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 attachments:(id)a8 waitForResponse:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (isInternalBuild() && [(HMDTTRManager *)self isTTRServiceAuthorized])
  {
    id v18 = [(id)objc_opt_class() queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke;
    block[3] = &unk_264A2C280;
    block[4] = self;
    id v20 = v14;
    BOOL v25 = a9;
    id v21 = v15;
    id v22 = v16;
    id v23 = v17;
    int64_t v24 = a7;
    dispatch_async(v18, block);
  }
}

void __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) requestFilter];
  if ([v2 shouldRequestRadarForDisplayReason:*(void *)(a1 + 40)])
  {
    id v3 = (void *)MEMORY[0x230FBD990]([v2 radarRequestedForDisplayReason:*(void *)(a1 + 40)]);
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v6;
      __int16 v27 = 2114;
      uint64_t v28 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting radar because %{public}@", buf, 0x16u);
    }
    int v8 = [*(id *)(a1 + 32) dialog];
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = [NSString stringWithFormat:@"HomeKit requests you file a radar because %@.", *(void *)(a1 + 40)];
    uint64_t v11 = *(unsigned __int8 *)(a1 + 80);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke_21;
    v19[3] = &unk_264A2C258;
    v19[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 72);
    id v22 = v12;
    uint64_t v24 = v13;
    id v23 = *(id *)(a1 + 40);
    [v8 displayInternalTTRErrorWithContext:v9 message:v10 waitForResponse:v11 completionHandler:v19];
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      __int16 v27 = 2112;
      uint64_t v28 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Radar request filtered out: %@", buf, 0x16u);
    }
  }
}

uint64_t __129__HMDTTRManager_requestRadarWithDisplayReason_radarTitle_componentName_componentVersion_componentID_attachments_waitForResponse___block_invoke_21(uint64_t result, int a2)
{
  if (a2)
  {
    LOBYTE(v2) = 1;
    return [*(id *)(result + 32) initiateRadarWithTitle:*(void *)(result + 40) componentName:*(void *)(result + 48) componentVersion:*(void *)(result + 56) componentID:*(void *)(result + 72) displayReason:*(void *)(result + 64) attachments:0 isUserInitiated:v2];
  }
  return result;
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 attachments:(id)a8
{
  LOBYTE(v8) = 0;
  [(HMDTTRManager *)self requestRadarWithDisplayReason:a3 radarTitle:a4 componentName:a5 componentVersion:a6 componentID:a7 attachments:a8 waitForResponse:v8];
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7
{
  LOBYTE(v7) = 0;
  [(HMDTTRManager *)self requestRadarWithDisplayReason:a3 radarTitle:a4 componentName:a5 componentVersion:a6 componentID:a7 attachments:0 waitForResponse:v7];
}

- (void)requestRadarWithDisplayReason:(id)a3 radarTitle:(id)a4
{
  LOBYTE(v4) = 0;
  [(HMDTTRManager *)self requestRadarWithDisplayReason:a3 radarTitle:a4 componentName:@"HomeKit" componentVersion:@"New Bugs" componentID:590644 attachments:0 waitForResponse:v4];
}

- (HMDTTRManager)initWithDialog:(id)a3 requestFilter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDTTRManager;
  uint64_t v9 = [(HMDTTRManager *)&v15 init];
  if (v9 && TapToRadarKitLibraryCore())
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2050000000;
    __int16 v10 = (void *)getTapToRadarServiceClass_softClass;
    uint64_t v20 = getTapToRadarServiceClass_softClass;
    if (!getTapToRadarServiceClass_softClass)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __getTapToRadarServiceClass_block_invoke;
      v16[3] = &unk_264A2C2A8;
      v16[4] = &v17;
      __getTapToRadarServiceClass_block_invoke((uint64_t)v16);
      __int16 v10 = (void *)v18[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v17, 8);
    uint64_t v12 = [v11 shared];
    ttrService = v9->_ttrService;
    v9->_ttrService = (TapToRadarService *)v12;

    objc_storeStrong((id *)&v9->_dialog, a3);
    objc_storeStrong((id *)&v9->_requestFilter, a4);
  }

  return v9;
}

+ (id)queue
{
  if (queue__hmf_once_t10 != -1) {
    dispatch_once(&queue__hmf_once_t10, &__block_literal_global_35_247087);
  }
  uint64_t v2 = (void *)queue__hmf_once_v11;
  return v2;
}

void __22__HMDTTRManager_queue__block_invoke()
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.HomeKit.HMDTTRManager", v0);
  uint64_t v2 = (void *)queue__hmf_once_v11;
  queue__hmf_once_id v11 = (uint64_t)v1;
}

+ (id)namespaceUUID
{
  if (namespaceUUID__hmf_once_t8 != -1) {
    dispatch_once(&namespaceUUID__hmf_once_t8, &__block_literal_global_247090);
  }
  uint64_t v2 = (void *)namespaceUUID__hmf_once_v9;
  return v2;
}

void __30__HMDTTRManager_namespaceUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B4FFBCEC-B0A2-4660-B1B2-4B484FE76D74"];
  dispatch_queue_t v1 = (void *)namespaceUUID__hmf_once_v9;
  namespaceUUID__hmf_once_uint64_t v9 = v0;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HMDTTRManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_247093 != -1) {
    dispatch_once(&sharedManager_onceToken_247093, block);
  }
  uint64_t v2 = (void *)sharedManager_defaultManager;
  return v2;
}

void __30__HMDTTRManager_sharedManager__block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  if (isInternalBuild())
  {
    if (TapToRadarKitLibraryCore())
    {
      uint64_t v2 = [HMDTTRManager alloc];
      id v3 = +[HMDUIDialogPresenter sharedUIDialogPresenter];
      uint64_t v4 = [*(id *)(a1 + 32) defaultFilter];
      uint64_t v5 = [(HMDTTRManager *)v2 initWithDialog:v3 requestFilter:v4];
      uint64_t v6 = (void *)sharedManager_defaultManager;
      sharedManager_defaultManager = v5;

      id v7 = +[HMDMessageDispatcher defaultDispatcher];
      uint64_t v8 = sharedManager_defaultManager;
      uint64_t v9 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
      v15[0] = v9;
      __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      [v7 registerForMessage:@"presentTTRDialog" receiver:v8 policies:v10 selector:sel_handlePresentTTRDialog_];

      uint64_t v11 = sharedManager_defaultManager;
      uint64_t v12 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
      id v14 = v12;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
      [v7 registerForMessage:@"resetLastTTRTime" receiver:v11 policies:v13 selector:sel_handleResetLastTTRTime_];
    }
  }
}

@end