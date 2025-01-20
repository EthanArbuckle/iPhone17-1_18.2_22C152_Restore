@interface MRAVConcreteEndpoint
+ (id)errorWithChangeResult:(id)a3 outputDevice:(id)a4;
- (MRAVConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4;
- (MRAVConcreteEndpoint)initWithOutputDeviceGroup:(id)a3 groupLeader:(id)a4 outputDevices:(id)a5;
- (float)volumeForOutputDevice:(id)a3 error:(id *)a4;
- (void)addOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)handleVolumeCapabilityChangedNotification:(id)a3;
- (void)handleVolumeChangedNotification:(id)a3;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)registerVolumeNotifications;
- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
- (void)setExternalDevice:(id)a3;
- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6;
@end

@implementation MRAVConcreteEndpoint

- (MRAVConcreteEndpoint)initWithDesignatedGroupLeader:(id)a3 outputDevices:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"MRAVConcreteEndpoint.m" lineNumber:71 description:@"Attempted to create MRAVConcreteEndpoint without using AVOutputDeviceGroup. Use MRConcreteEndpoint instead."];

  return 0;
}

- (MRAVConcreteEndpoint)initWithOutputDeviceGroup:(id)a3 groupLeader:(id)a4 outputDevices:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 receivesLongFormAudioFromLocalDevice])
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"MRAVConcreteEndpoint.m" lineNumber:78 description:@"Attempted to initialize local endpoint from AVOutputDeviceGroup. Use MRAVLocalEndpoint instead."];
  }
  v32 = self;
  v12 = [MRAVOutputDeviceSourceInfo alloc];
  v13 = [v10 deviceID];
  uint64_t v14 = [(MRAVOutputDeviceSourceInfo *)v12 initWithRoutingContextUID:v13 multipleBuiltInDevices:0];

  v33 = v10;
  v31 = (void *)v14;
  v30 = [[MRAVConcreteOutputDevice alloc] initWithAVOutputDevice:v10 sourceInfo:v14];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v22 = [MRAVOutputDeviceSourceInfo alloc];
        v23 = [v21 deviceID];
        v24 = [(MRAVOutputDeviceSourceInfo *)v22 initWithRoutingContextUID:v23 multipleBuiltInDevices:0];

        v25 = [[MRAVConcreteOutputDevice alloc] initWithAVOutputDevice:v21 sourceInfo:v24];
        [v15 addObject:v25];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v18);
  }

  if (([v15 containsObject:v30] & 1) == 0) {
    [v15 addObject:v30];
  }
  v34.receiver = v32;
  v34.super_class = (Class)MRAVConcreteEndpoint;
  v26 = [(MRConcreteEndpoint *)&v34 initWithDesignatedGroupLeader:v30 outputDevices:v15 preferredSuffix:0];
  outputDeviceGroup = v26->_outputDeviceGroup;
  v26->_outputDeviceGroup = (AVOutputDeviceGroup *)v9;

  [(MRAVConcreteEndpoint *)v26 registerVolumeNotifications];
  return v26;
}

- (void)addOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v54 = a6;
  id obj = [MEMORY[0x1E4F1C9C8] date];
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = [MEMORY[0x1E4F29128] UUID];
    id v12 = [v13 UUIDString];
  }
  int v48 = MRAnalyticsCompositionForEndpoint(self);
  BOOL v45 = [(MRAVEndpoint *)self isLocalEndpoint];
  uint64_t v14 = [(MRConcreteEndpoint *)self outputDevices];
  uint64_t v15 = [v14 count];

  id v16 = NSString;
  uint64_t v17 = MRAVOutputDeviceArrayDescription(v9);
  uint64_t v18 = [(MRAVEndpoint *)self debugName];
  uint64_t v19 = [v16 stringWithFormat:@"devices=%@ to endpoint=%@", v17, v18];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"addOutputDevices:APSync", v12];
  v21 = v20;
  if (v19) {
    [v20 appendFormat:@" for %@", v19];
  }
  v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v21;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v23 = [NSString alloc];
  v24 = [(AVOutputDeviceGroup *)self->_outputDeviceGroup outputDevices];
  v47 = (uint64_t (*)(uint64_t, uint64_t))[v23 initWithFormat:@"Existing devices in endpoint %@", v24];

  v25 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = @"addOutputDevices:APSync";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v84 = v47;
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v70[3] = &unk_1E57D9300;
  v70[4] = self;
  v71 = @"addOutputDevices:APSync";
  id v51 = v12;
  id v72 = v51;
  id v44 = v19;
  id v73 = v44;
  id v43 = obj;
  id v74 = v43;
  id v42 = v54;
  id v78 = v42;
  dispatch_queue_t queue = (dispatch_queue_t)v11;
  dispatch_queue_t v75 = queue;
  int v80 = v48;
  id v49 = v10;
  id v76 = v49;
  uint64_t v79 = v15;
  id v26 = v9;
  id v77 = v26;
  BOOL v81 = v45;
  v46 = (void *)MEMORY[0x1997190F0](v70);
  v55 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v27 = getAVOutputDeviceGroupAddOutputDeviceOptionCancelIfAuthRequired();
  [v55 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v27];

  if (v10)
  {
    v28 = getAVOutputDeviceGroupAddOutputDeviceOptionInitiator();
    [v55 setObject:v49 forKeyedSubscript:v28];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v84 = __Block_byref_object_copy__44;
  v85 = __Block_byref_object_dispose__44;
  id v86 = 0;
  v29 = dispatch_group_create();
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obja = v26;
  uint64_t v30 = [obja countByEnumeratingWithState:&v66 objects:v82 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v67 != v31) {
          objc_enumerationMutation(obja);
        }
        v33 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        dispatch_group_enter(v29);
        outputDeviceGroup = self->_outputDeviceGroup;
        long long v35 = [v33 avOutputDevice];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_39;
        v63[3] = &unk_1E57D9328;
        v65 = buf;
        v63[4] = self;
        v63[5] = v33;
        v64 = v29;
        [(AVOutputDeviceGroup *)outputDeviceGroup addOutputDevice:v35 withOptions:v55 completionHandler:v63];
      }
      uint64_t v30 = [obja countByEnumeratingWithState:&v66 objects:v82 count:16];
    }
    while (v30);
  }

  long long v36 = [MRBlockGuard alloc];
  long long v37 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"addOutputDevices:APSync", v51];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
  v61[3] = &unk_1E57D0FE8;
  id v38 = v46;
  id v62 = v38;
  v39 = [(MRBlockGuard *)v36 initWithTimeout:v37 reason:v61 handler:30.0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  block[3] = &unk_1E57D9350;
  v58 = v39;
  id v59 = v38;
  v60 = buf;
  id v40 = v38;
  v41 = v39;
  dispatch_group_notify(v29, queue, block);

  _Block_object_dispose(buf, 8);
}

void __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString alloc];
  v5 = [*(id *)(*(void *)(a1 + 32) + 104) outputDevices];
  v6 = (void *)[v4 initWithFormat:@"Final devices in endpoint %@", v5];

  v7 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v8;
    __int16 v37 = 2114;
    uint64_t v38 = v9;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = _MRLogForCategory(0xAuLL);
  id v12 = v11;
  if (!v3)
  {
    BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v19) {
        goto LABEL_16;
      }
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      v22 = *(void **)(a1 + 56);
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v20;
      __int16 v37 = 2114;
      uint64_t v38 = v21;
      __int16 v39 = 2114;
      id v40 = v22;
      __int16 v41 = 2048;
      uint64_t v42 = v23;
      v24 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v25 = v12;
      uint32_t v26 = 42;
    }
    else
    {
      if (!v19) {
        goto LABEL_16;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v27;
      __int16 v37 = 2114;
      uint64_t v38 = v28;
      __int16 v39 = 2048;
      id v40 = v29;
      v24 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v25 = v12;
      uint32_t v26 = 32;
    }
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_15;
  }
  BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138544386;
    uint64_t v36 = v14;
    __int16 v37 = 2114;
    uint64_t v38 = v15;
    __int16 v39 = 2114;
    id v40 = v3;
    __int16 v41 = 2114;
    uint64_t v42 = v16;
    __int16 v43 = 2048;
    uint64_t v44 = v18;
    _os_log_error_impl(&dword_194F3C000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_15:

    goto LABEL_16;
  }
  if (v13) {
    __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_cold_1(a1);
  }
LABEL_16:

  uint64_t v30 = *(void **)(a1 + 96);
  if (v30)
  {
    uint64_t v31 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_35;
    block[3] = &unk_1E57D0DB8;
    id v34 = v30;
    id v33 = v3;
    dispatch_async(v31, block);
  }
  MRAnalyticsTrackTopologyChangeEvent(@"add", *(void **)(a1 + 64), *(void **)(a1 + 80), *(_DWORD *)(a1 + 112), *(void *)(a1 + 104), *(void **)(a1 + 88), *(unsigned char *)(a1 + 116), v3);
}

uint64_t __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_39(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 status] != 1)
  {
    uint64_t v3 = [(id)objc_opt_class() errorWithChangeResult:v6 outputDevice:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) disarm];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)removeOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v53 = a6;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    BOOL v13 = [MEMORY[0x1E4F29128] UUID];
    id v12 = [v13 UUIDString];
  }
  uint64_t v14 = NSString;
  uint64_t v15 = MRAVOutputDeviceArrayDescription(v9);
  uint64_t v16 = [(MRAVEndpoint *)self debugName];
  uint64_t v17 = [v14 stringWithFormat:@"devices=%@ from endpoint=%@", v15, v16];

  id obj = [MEMORY[0x1E4F1C9C8] date];
  int v47 = MRAnalyticsCompositionForEndpoint(self);
  BOOL v44 = [(MRAVEndpoint *)self isLocalEndpoint];
  uint64_t v18 = [(MRConcreteEndpoint *)self outputDevices];
  uint64_t v19 = [v18 count];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"removeOutputDevices:APSync", v12];
  uint64_t v21 = v20;
  if (v17) {
    [v20 appendFormat:@" for %@", v17];
  }
  v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v23 = [NSString alloc];
  v24 = [(AVOutputDeviceGroup *)self->_outputDeviceGroup outputDevices];
  v46 = (uint64_t (*)(uint64_t, uint64_t))[v23 initWithFormat:@"Existing devices in endpoint %@", v24];

  v25 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = @"removeOutputDevices:APSync";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v83 = v46;
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke;
  v69[3] = &unk_1E57D9300;
  v69[4] = self;
  v70 = @"removeOutputDevices:APSync";
  id v50 = v12;
  id v71 = v50;
  id v42 = v17;
  id v72 = v42;
  id v43 = obj;
  id v73 = v43;
  id v41 = v53;
  id v77 = v41;
  dispatch_queue_t queue = (dispatch_queue_t)v11;
  dispatch_queue_t v74 = queue;
  int v79 = v47;
  id v48 = v10;
  id v75 = v48;
  uint64_t v78 = v19;
  id v26 = v9;
  id v76 = v26;
  BOOL v80 = v44;
  uint64_t v45 = (void *)MEMORY[0x1997190F0](v69);
  id v54 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  if (v10)
  {
    uint64_t v27 = getAVOutputDeviceGroupRemoveOutputDeviceOptionInitiator();
    [v54 setObject:v48 forKeyedSubscript:v27];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v83 = __Block_byref_object_copy__44;
  v84 = __Block_byref_object_dispose__44;
  id v85 = 0;
  uint64_t v28 = dispatch_group_create();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obja = v26;
  uint64_t v29 = [obja countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(obja);
        }
        v32 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        dispatch_group_enter(v28);
        outputDeviceGroup = self->_outputDeviceGroup;
        id v34 = [v32 avOutputDevice];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_2;
        v62[3] = &unk_1E57D9328;
        v64 = buf;
        v62[4] = self;
        v62[5] = v32;
        v63 = v28;
        [(AVOutputDeviceGroup *)outputDeviceGroup removeOutputDevice:v34 withOptions:v54 completionHandler:v62];
      }
      uint64_t v29 = [obja countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v29);
  }

  long long v35 = [MRBlockGuard alloc];
  uint64_t v36 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"removeOutputDevices:APSync", v50];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_3;
  v60[3] = &unk_1E57D0FE8;
  id v37 = v45;
  id v61 = v37;
  uint64_t v38 = [(MRBlockGuard *)v35 initWithTimeout:v36 reason:v60 handler:30.0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_4;
  block[3] = &unk_1E57D9350;
  v57 = v38;
  id v58 = v37;
  id v59 = buf;
  id v39 = v37;
  id v40 = v38;
  dispatch_group_notify(v28, queue, block);

  _Block_object_dispose(buf, 8);
}

void __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [NSString alloc];
  v5 = [*(id *)(*(void *)(a1 + 32) + 104) outputDevices];
  id v6 = (void *)[v4 initWithFormat:@"Final devices in endpoint %@", v5];

  v7 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v36 = v8;
    __int16 v37 = 2114;
    uint64_t v38 = v9;
    __int16 v39 = 2112;
    id v40 = v6;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = _MRLogForCategory(0xAuLL);
  id v12 = v11;
  if (!v3)
  {
    BOOL v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v19) {
        goto LABEL_16;
      }
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      v22 = *(void **)(a1 + 56);
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138544130;
      uint64_t v36 = v20;
      __int16 v37 = 2114;
      uint64_t v38 = v21;
      __int16 v39 = 2114;
      id v40 = v22;
      __int16 v41 = 2048;
      uint64_t v42 = v23;
      v24 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v25 = v12;
      uint32_t v26 = 42;
    }
    else
    {
      if (!v19) {
        goto LABEL_16;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      uint64_t v28 = *(void *)(a1 + 48);
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138543874;
      uint64_t v36 = v27;
      __int16 v37 = 2114;
      uint64_t v38 = v28;
      __int16 v39 = 2048;
      id v40 = v29;
      v24 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v25 = v12;
      uint32_t v26 = 32;
    }
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_15;
  }
  BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138544386;
    uint64_t v36 = v14;
    __int16 v37 = 2114;
    uint64_t v38 = v15;
    __int16 v39 = 2114;
    id v40 = v3;
    __int16 v41 = 2114;
    uint64_t v42 = v16;
    __int16 v43 = 2048;
    uint64_t v44 = v18;
    _os_log_error_impl(&dword_194F3C000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_15:

    goto LABEL_16;
  }
  if (v13) {
    __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_cold_1(a1);
  }
LABEL_16:

  uint64_t v30 = *(void **)(a1 + 96);
  if (v30)
  {
    uint64_t v31 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_48;
    block[3] = &unk_1E57D0DB8;
    id v34 = v30;
    id v33 = v3;
    dispatch_async(v31, block);
  }
  MRAnalyticsTrackTopologyChangeEvent(@"remove", *(void **)(a1 + 64), *(void **)(a1 + 80), *(_DWORD *)(a1 + 112), *(void *)(a1 + 104), *(void **)(a1 + 88), *(unsigned char *)(a1 + 116), v3);
}

uint64_t __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 status] != 1)
  {
    uint64_t v3 = [(id)objc_opt_class() errorWithChangeResult:v6 outputDevice:*(void *)(a1 + 40)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__MRAVConcreteEndpoint_removeOutputDevices_initiator_withReplyQueue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) disarm];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)setOutputDevices:(id)a3 initiator:(id)a4 withReplyQueue:(id)a5 completion:(id)a6
{
  v6.receiver = self;
  v6.super_class = (Class)MRAVConcreteEndpoint;
  [(MRAVEndpoint *)&v6 setOutputDevices:a3 initiator:a4 withReplyQueue:a5 completion:a6];
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F29128] UUID];
  id v12 = [v11 UUIDString];

  BOOL v13 = [NSString stringWithFormat:@"deviceUID=%@, endpoint=%@", v8, self];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"outputDeviceVolume:APSync", v12];
  uint64_t v16 = v15;
  if (v13) {
    [v15 appendFormat:@" for %@", v13];
  }
  uint64_t v17 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v42 = v16;
    _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke;
  v34[3] = &unk_1E57D93A0;
  id v18 = v10;
  id v40 = v18;
  id v19 = v9;
  id v35 = v19;
  id v20 = v13;
  id v36 = v20;
  __int16 v37 = @"outputDeviceVolume:APSync";
  id v21 = v12;
  id v38 = v21;
  id v22 = v14;
  id v39 = v22;
  uint64_t v23 = (void (**)(void, void, __n128))MEMORY[0x1997190F0](v34);
  if ([(AVOutputDeviceGroup *)self->_outputDeviceGroup volumeControlType] == 1)
  {
    if (v8)
    {
      v24 = [(MRConcreteEndpoint *)self outputDevices];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_62;
      v32[3] = &unk_1E57D07B8;
      id v33 = v8;
      v25 = objc_msgSend(v24, "mr_first:", v32);

      if (v25)
      {
        id v31 = 0;
        [(MRAVConcreteEndpoint *)self volumeForOutputDevice:v25 error:&v31];
        unsigned __int32 v27 = v26;
        id v28 = v31;
        v29.n128_u32[0] = v27;
      }
      else
      {
        id v28 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
        v29.n128_u64[0] = 0;
      }
      ((void (**)(void, id, __n128))v23)[2](v23, v28, v29);
    }
    else
    {
      [(AVOutputDeviceGroup *)self->_outputDeviceGroup volume];
      ((void (*)(void (**)(void, void, __n128), void))v23[2])(v23, 0);
    }
  }
  else
  {
    uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:36];
    ((void (*)(void (**)(void, void, __n128), void *, double))v23[2])(v23, v30, 0.0);
  }
}

void __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  objc_super v6 = objc_msgSend(NSString, "stringWithFormat:", @"volume: %f", a3);
  if (*(void *)(a1 + 72))
  {
    v7 = *(NSObject **)(a1 + 32);
    id v8 = v7;
    if (!v7)
    {
      id v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2;
    block[3] = &unk_1E57D9378;
    id v11 = v5;
    id v12 = v6;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 72);
    float v18 = a3;
    dispatch_async(v8, block);
    if (!v7) {
  }
    }
}

uint64_t __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v3 = _MRLogForCategory(0xAuLL);
    BOOL v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v11)
      {
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v14 = *(void *)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 64);
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = *(void *)(a1 + 48);
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:*(void *)(a1 + 72)];
        int v34 = 138544386;
        uint64_t v35 = v14;
        __int16 v36 = 2114;
        uint64_t v37 = v15;
        __int16 v38 = 2112;
        uint64_t v39 = v16;
        __int16 v40 = 2114;
        uint64_t v41 = v17;
        __int16 v42 = 2048;
        uint64_t v43 = v18;
        id v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v20 = v3;
        uint32_t v21 = 52;
LABEL_19:
        _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v34, v21);
        goto LABEL_20;
      }
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v26 = *(void *)(a1 + 56);
      uint64_t v27 = *(void *)(a1 + 64);
      uint64_t v28 = *(void *)(a1 + 40);
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:*(void *)(a1 + 72)];
      int v34 = 138544130;
      uint64_t v35 = v26;
      __int16 v36 = 2114;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      uint64_t v39 = v28;
      __int16 v40 = 2048;
      uint64_t v41 = v29;
      id v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v11)
      {
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v30 = *(void *)(a1 + 56);
        uint64_t v31 = *(void *)(a1 + 64);
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:*(void *)(a1 + 72)];
        int v34 = 138543874;
        uint64_t v35 = v30;
        __int16 v36 = 2114;
        uint64_t v37 = v31;
        __int16 v38 = 2048;
        uint64_t v39 = v32;
        id v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v20 = v3;
        uint32_t v21 = 32;
        goto LABEL_19;
      }
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v23 = *(void *)(a1 + 56);
      uint64_t v22 = *(void *)(a1 + 64);
      uint64_t v24 = *(void *)(a1 + 48);
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:*(void *)(a1 + 72)];
      int v34 = 138544130;
      uint64_t v35 = v23;
      __int16 v36 = 2114;
      uint64_t v37 = v22;
      __int16 v38 = 2114;
      uint64_t v39 = v24;
      __int16 v40 = 2048;
      uint64_t v41 = v25;
      id v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    id v20 = v3;
    uint32_t v21 = 42;
    goto LABEL_19;
  }
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = _MRLogForCategory(0xAuLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 64);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:*(void *)(a1 + 72)];
      int v34 = 138544386;
      uint64_t v35 = v6;
      __int16 v36 = 2114;
      uint64_t v37 = v5;
      __int16 v38 = 2114;
      uint64_t v39 = v7;
      __int16 v40 = 2114;
      uint64_t v41 = v8;
      __int16 v42 = 2048;
      uint64_t v43 = v10;
      _os_log_error_impl(&dword_194F3C000, v3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v34, 0x34u);
LABEL_20:
    }
  }
  else if (v4)
  {
    __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1(a1);
  }
LABEL_21:

  return (*(uint64_t (**)(float))(*(void *)(a1 + 80) + 16))(*(float *)(a1 + 88));
}

uint64_t __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_62(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];

  BOOL v13 = [NSString stringWithFormat:@"deviceUID=%@, endpoint=%@", v8, self];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"volumeControlCapabilities:APSync", v12];
  uint64_t v16 = v15;
  if (v13) {
    [v15 appendFormat:@" for %@", v13];
  }
  uint64_t v17 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v39 = v16;
    _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke;
  v31[3] = &unk_1E57D93C8;
  id v18 = v10;
  id v37 = v18;
  id v19 = v9;
  id v32 = v19;
  id v20 = v13;
  id v33 = v20;
  int v34 = @"volumeControlCapabilities:APSync";
  id v21 = v12;
  id v35 = v21;
  id v22 = v14;
  id v36 = v22;
  uint64_t v23 = (void (**)(void, void, void))MEMORY[0x1997190F0](v31);
  if (v8)
  {
    uint64_t v24 = [(MRConcreteEndpoint *)self outputDevices];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_68;
    v29[3] = &unk_1E57D07B8;
    id v30 = v8;
    uint64_t v25 = objc_msgSend(v24, "mr_first:", v29);

    if (v25)
    {
      v23[2](v23, [v25 volumeCapabilities], 0);
    }
    else
    {
      uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:39];
      ((void (**)(void, void, void *))v23)[2](v23, 0, v28);
    }
  }
  else
  {
    uint64_t v26 = [(AVOutputDeviceGroup *)self->_outputDeviceGroup volumeControlType];
    if (v26 == 1) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = v26 == 2;
    }
    v23[2](v23, v27, 0);
  }
}

void __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a2);
  if (*(void *)(a1 + 72))
  {
    uint64_t v7 = *(NSObject **)(a1 + 32);
    id v8 = v7;
    if (!v7)
    {
      id v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2;
    v10[3] = &unk_1E57D9378;
    id v11 = v5;
    id v12 = v6;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 72);
    int v18 = a2;
    dispatch_async(v8, v10);
    if (!v7) {
  }
    }
}

uint64_t __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2(void *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1[4])
  {
    uint64_t v12 = a1[5];
    uint64_t v11 = a1[6];
    uint64_t v3 = _MRLogForCategory(0xAuLL);
    BOOL v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v11)
      {
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v14 = a1[7];
        uint64_t v15 = a1[8];
        uint64_t v16 = a1[5];
        uint64_t v17 = a1[6];
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:a1[9]];
        int v34 = 138544386;
        uint64_t v35 = v14;
        __int16 v36 = 2114;
        uint64_t v37 = v15;
        __int16 v38 = 2112;
        uint64_t v39 = v16;
        __int16 v40 = 2114;
        uint64_t v41 = v17;
        __int16 v42 = 2048;
        uint64_t v43 = v18;
        id v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v20 = v3;
        uint32_t v21 = 52;
LABEL_19:
        _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v34, v21);
        goto LABEL_20;
      }
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v26 = a1[7];
      uint64_t v27 = a1[8];
      uint64_t v28 = a1[5];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:a1[9]];
      int v34 = 138544130;
      uint64_t v35 = v26;
      __int16 v36 = 2114;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      uint64_t v39 = v28;
      __int16 v40 = 2048;
      uint64_t v41 = v29;
      id v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v11)
      {
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v30 = a1[7];
        uint64_t v31 = a1[8];
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:a1[9]];
        int v34 = 138543874;
        uint64_t v35 = v30;
        __int16 v36 = 2114;
        uint64_t v37 = v31;
        __int16 v38 = 2048;
        uint64_t v39 = v32;
        id v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v20 = v3;
        uint32_t v21 = 32;
        goto LABEL_19;
      }
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v23 = a1[7];
      uint64_t v22 = a1[8];
      uint64_t v24 = a1[6];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:a1[9]];
      int v34 = 138544130;
      uint64_t v35 = v23;
      __int16 v36 = 2114;
      uint64_t v37 = v22;
      __int16 v38 = 2114;
      uint64_t v39 = v24;
      __int16 v40 = 2048;
      uint64_t v41 = v25;
      id v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    id v20 = v3;
    uint32_t v21 = 42;
    goto LABEL_19;
  }
  uint64_t v2 = a1[6];
  uint64_t v3 = _MRLogForCategory(0xAuLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      uint64_t v6 = a1[7];
      uint64_t v5 = a1[8];
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[6];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:a1[9]];
      int v34 = 138544386;
      uint64_t v35 = v6;
      __int16 v36 = 2114;
      uint64_t v37 = v5;
      __int16 v38 = 2114;
      uint64_t v39 = v7;
      __int16 v40 = 2114;
      uint64_t v41 = v8;
      __int16 v42 = 2048;
      uint64_t v43 = v10;
      _os_log_error_impl(&dword_194F3C000, v3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v34, 0x34u);
LABEL_20:
    }
  }
  else if (v4)
  {
    __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1((uint64_t)a1);
  }
LABEL_21:

  return (*(uint64_t (**)(void))(a1[10] + 16))();
}

uint64_t __79__MRAVConcreteEndpoint_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_68(uint64_t a1, void *a2)
{
  return [a2 containsUID:*(void *)(a1 + 32)];
}

- (void)setOutputDeviceVolume:(float)a3 outputDevice:(id)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v31 = a5;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  BOOL v13 = [v12 UUIDString];

  uint64_t v14 = NSString;
  uint64_t v15 = [(MRConcreteEndpoint *)self uniqueIdentifier];
  uint64_t v16 = [v14 stringWithFormat:@"volume=%f, deviceUID=%@, endpoint=%@", a3, v10, v15];

  uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"setOutputDeviceVolume:APSync", v13];
  id v19 = v18;
  if (v16) {
    [v18 appendFormat:@" for %@", v16];
  }
  id v20 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v19;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (!v10)
  {
    if ([(AVOutputDeviceGroup *)self->_outputDeviceGroup volumeControlType])
    {
      p_outputDeviceGroup = &self->_outputDeviceGroup;
      uint64_t v24 = [NSString stringWithFormat:@"setVolume on %@", self->_outputDeviceGroup];
      *(float *)&double v28 = a3;
      [(AVOutputDeviceGroup *)*p_outputDeviceGroup setVolume:v28];
      uint64_t v26 = 0;
      if (!v11) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:36];
      uint64_t v24 = 0;
      if (!v11) {
        goto LABEL_17;
      }
    }
    goto LABEL_16;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v46 = 0x3032000000;
  int v47 = __Block_byref_object_copy__44;
  id v48 = __Block_byref_object_dispose__44;
  id v49 = 0;
  uint32_t v21 = [(MRConcreteEndpoint *)self outputDevices];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke;
  v40[3] = &unk_1E57D93F0;
  id v22 = v10;
  id v41 = v22;
  p_long long buf = &buf;
  [v21 enumerateObjectsUsingBlock:v40];

  uint64_t v23 = *(void **)(*((void *)&buf + 1) + 40);
  if (v23)
  {
    if ([v23 volumeControlType])
    {
      uint64_t v24 = [NSString stringWithFormat:@"setVolume on %@", *(void *)(*((void *)&buf + 1) + 40)];
      *(float *)&double v25 = a3;
      [*(id *)(*((void *)&buf + 1) + 40) setVolume:v25];
      uint64_t v26 = 0;
      goto LABEL_15;
    }
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:36];
  }
  else
  {
    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v43 = @"kMRAVEndpointOutputDeviceIdentifierUserInfoKey";
    id v44 = v22;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    uint64_t v26 = (void *)[v29 initWithMRError:39 userInfo:v30];
  }
  uint64_t v24 = 0;
LABEL_15:

  _Block_object_dispose(&buf, 8);
  if (v11)
  {
LABEL_16:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke_2;
    block[3] = &unk_1E57D9418;
    id v33 = v26;
    id v34 = v24;
    id v35 = v16;
    __int16 v36 = @"setOutputDeviceVolume:APSync";
    id v37 = v13;
    id v38 = v17;
    id v39 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_17:
}

void __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 containsUID:*(void *)(a1 + 32)])
  {
    uint64_t v6 = [v9 avOutputDevice];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

uint64_t __76__MRAVConcreteEndpoint_setOutputDeviceVolume_outputDevice_queue_completion___block_invoke_2(void *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1[4])
  {
    uint64_t v12 = a1[5];
    uint64_t v11 = a1[6];
    uint64_t v3 = _MRLogForCategory(0xAuLL);
    BOOL v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v11)
      {
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v14 = a1[7];
        uint64_t v15 = a1[8];
        uint64_t v16 = a1[5];
        uint64_t v17 = a1[6];
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:a1[9]];
        int v34 = 138544386;
        uint64_t v35 = v14;
        __int16 v36 = 2114;
        uint64_t v37 = v15;
        __int16 v38 = 2112;
        uint64_t v39 = v16;
        __int16 v40 = 2114;
        uint64_t v41 = v17;
        __int16 v42 = 2048;
        uint64_t v43 = v18;
        id v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v20 = v3;
        uint32_t v21 = 52;
LABEL_19:
        _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v34, v21);
        goto LABEL_20;
      }
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v26 = a1[7];
      uint64_t v27 = a1[8];
      uint64_t v28 = a1[5];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:a1[9]];
      int v34 = 138544130;
      uint64_t v35 = v26;
      __int16 v36 = 2114;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      uint64_t v39 = v28;
      __int16 v40 = 2048;
      uint64_t v41 = v29;
      id v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v11)
      {
        if (!v13) {
          goto LABEL_21;
        }
        uint64_t v30 = a1[7];
        uint64_t v31 = a1[8];
        id v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceDate:a1[9]];
        int v34 = 138543874;
        uint64_t v35 = v30;
        __int16 v36 = 2114;
        uint64_t v37 = v31;
        __int16 v38 = 2048;
        uint64_t v39 = v32;
        id v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v20 = v3;
        uint32_t v21 = 32;
        goto LABEL_19;
      }
      if (!v13) {
        goto LABEL_21;
      }
      uint64_t v23 = a1[7];
      uint64_t v22 = a1[8];
      uint64_t v24 = a1[6];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:a1[9]];
      int v34 = 138544130;
      uint64_t v35 = v23;
      __int16 v36 = 2114;
      uint64_t v37 = v22;
      __int16 v38 = 2114;
      uint64_t v39 = v24;
      __int16 v40 = 2048;
      uint64_t v41 = v25;
      id v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    id v20 = v3;
    uint32_t v21 = 42;
    goto LABEL_19;
  }
  uint64_t v2 = a1[6];
  uint64_t v3 = _MRLogForCategory(0xAuLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      uint64_t v6 = a1[7];
      uint64_t v5 = a1[8];
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[6];
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:a1[9]];
      int v34 = 138544386;
      uint64_t v35 = v6;
      __int16 v36 = 2114;
      uint64_t v37 = v5;
      __int16 v38 = 2114;
      uint64_t v39 = v7;
      __int16 v40 = 2114;
      uint64_t v41 = v8;
      __int16 v42 = 2048;
      uint64_t v43 = v10;
      _os_log_error_impl(&dword_194F3C000, v3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v34, 0x34u);
LABEL_20:
    }
  }
  else if (v4)
  {
    __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1((uint64_t)a1);
  }
LABEL_21:

  return (*(uint64_t (**)(void))(a1[10] + 16))();
}

- (void)setExternalDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRAVConcreteEndpoint;
  id v3 = a3;
  [(MRConcreteEndpoint *)&v4 setExternalDevice:v3];
  objc_msgSend(v3, "setWantsVolumeNotifications:", 0, v4.receiver, v4.super_class);
  [v3 setWantsOutputDeviceNotifications:0];
  [v3 setWantsEndpointChangeNotifications:0];
}

- (float)volumeForOutputDevice:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (([v5 volumeCapabilities] & 2) != 0)
  {
    if ([v5 isVolumeControlAvailable])
    {
      [v5 volume];
      float v8 = v7;
      goto LABEL_8;
    }
    uint64_t v6 = 37;
  }
  else
  {
    uint64_t v6 = 36;
  }
  float v8 = 0.0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:v6];
  }
LABEL_8:

  return v8;
}

- (void)registerVolumeNotifications
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v4 = getAVOutputDeviceGroupVolumeDidChangeNotification();
  [v3 addObserver:self selector:sel_handleVolumeChangedNotification_ name:v4 object:self->_outputDeviceGroup];

  id v5 = getAVOutputDeviceGroupVolumeControlTypeDidChangeNotification();
  [v3 addObserver:self selector:sel_handleVolumeCapabilityChangedNotification_ name:v5 object:self->_outputDeviceGroup];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(MRConcreteEndpoint *)self outputDevices];
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = getAVOutputDeviceVolumeDidChangeNotification_0[0]();
        uint64_t v12 = [v10 avOutputDevice];
        [v3 addObserver:self selector:sel_handleVolumeChangedNotification_ name:v11 object:v12];

        BOOL v13 = getAVOutputDeviceCanSetVolumeDidChangeNotification_0[0]();
        uint64_t v14 = [v10 avOutputDevice];
        [v3 addObserver:self selector:sel_handleVolumeCapabilityChangedNotification_ name:v13 object:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)handleVolumeChangedNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRConcreteEndpoint *)self uniqueIdentifier];
  uint64_t v6 = [v4 object];
  getAVOutputDeviceClass_0[0]();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v4 object];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  [v9 setObject:v5 forKeyedSubscript:@"kMRAVEndpointIdentifierUserInfoKey"];
  if (v8)
  {
    uint64_t v10 = [(MRAVConcreteEndpoint *)v8 ID];
    [v9 setObject:v10 forKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];
    uint64_t v11 = NSNumber;
    [(MRAVEndpoint *)v8 volume];
    uint64_t v12 = objc_msgSend(v11, "numberWithFloat:");
    [v9 setObject:v12 forKeyedSubscript:@"kMRAVEndpointVolumeUserInfoKey"];

    BOOL v13 = _MRLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v4 name];
      [(MRAVEndpoint *)v8 volume];
      int v20 = 138543874;
      uint64_t v21 = v14;
      __int16 v22 = 2050;
      double v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Output device volume updated: %{public}f - %{public}@", (uint8_t *)&v20, 0x20u);
    }
    goto LABEL_9;
  }
  long long v16 = NSNumber;
  [(AVOutputDeviceGroup *)self->_outputDeviceGroup volume];
  long long v17 = objc_msgSend(v16, "numberWithFloat:");
  [v9 setObject:v17 forKeyedSubscript:@"kMRAVEndpointVolumeUserInfoKey"];

  uint64_t v10 = _MRLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = [v4 name];
    [(AVOutputDeviceGroup *)self->_outputDeviceGroup volume];
    int v20 = 138543874;
    uint64_t v21 = v13;
    __int16 v22 = 2050;
    double v23 = v18;
    __int16 v24 = 2114;
    uint64_t v25 = self;
    _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Endpoint volume updated: %{public}f - %{public}@", (uint8_t *)&v20, 0x20u);
LABEL_9:
  }
  long long v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 postNotificationName:@"kMRAVEndpointVolumeDidChangeNotification" object:self userInfo:v9];
}

- (void)handleVolumeCapabilityChangedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRConcreteEndpoint *)self uniqueIdentifier];
  uint64_t v6 = [v4 object];
  getAVOutputDeviceClass_0[0]();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v4 object];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v9 setObject:v5 forKeyedSubscript:@"kMRAVEndpointIdentifierUserInfoKey"];
  if (v8)
  {
    uint64_t v10 = [(MRConcreteEndpoint *)self outputDevices];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__MRAVConcreteEndpoint_handleVolumeCapabilityChangedNotification___block_invoke;
    v22[3] = &unk_1E57D07B8;
    double v23 = v8;
    uint64_t v11 = objc_msgSend(v10, "mr_first:", v22);

    uint64_t v12 = [v11 volumeCapabilities];
  }
  else
  {
    uint64_t v13 = [(AVOutputDeviceGroup *)self->_outputDeviceGroup volumeControlType];
    if (v13 == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v13 == 2;
    }
  }
  uint64_t v14 = [NSNumber numberWithUnsignedInt:v12];
  [v9 setObject:v14 forKeyedSubscript:@"kMRAVEndpointVolumeControlCapabilitiesUserInfoKey"];

  if (v8)
  {
    float v15 = [(MRAVConcreteEndpoint *)v8 ID];
    [v9 setObject:v15 forKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];
    long long v16 = _MRLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v4 name];
      float v18 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v12);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      uint64_t v27 = v18;
      __int16 v28 = 2114;
      uint64_t v29 = v8;
      _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Device volume capabilities updated: %{public}@ - %{public}@", buf, 0x20u);
    }
  }
  else
  {
    float v15 = _MRLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [v4 name];
      int v20 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v12);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      uint64_t v27 = v20;
      __int16 v28 = 2114;
      uint64_t v29 = self;
      _os_log_impl(&dword_194F3C000, v15, OS_LOG_TYPE_DEFAULT, "[MRAVConcreteEndpoint] Volume - %{public}@ - Group volume capabilities updated: %{public}@ - %{public}@", buf, 0x20u);
    }
  }

  uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v21 postNotificationName:@"kMRAVEndpointVolumeControlCapabilitiesDidChangeNotification" object:self userInfo:v9];
}

uint64_t __66__MRAVConcreteEndpoint_handleVolumeCapabilityChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 ID];
  uint64_t v5 = [v3 containsUID:v4];

  return v5;
}

+ (id)errorWithChangeResult:(id)a3 outputDevice:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  uint64_t v8 = [v6 dictionaryWithCapacity:2];
  id v9 = [v7 uid];

  [v8 setObject:v9 forKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];
  uint64_t v10 = [v5 status];
  if (v10)
  {
    if (v10 == 2)
    {
      uint64_t v14 = @"Failed";
    }
    else
    {
      if (v10 != 3) {
        goto LABEL_10;
      }
      uint64_t v11 = [v5 cancellationReason];
      uint64_t v12 = (void *)v11;
      uint64_t v13 = @"Cancelled";
      if (v11) {
        uint64_t v13 = (__CFString *)v11;
      }
      uint64_t v14 = v13;
    }
  }
  else
  {
    uint64_t v14 = @"Unknown";
  }
  [v8 setObject:v14 forKeyedSubscript:@"kMRAVEndpointTopologyModificationFailureReasonUserInfoKey"];

LABEL_10:
  float v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:40 userInfo:v8];

  return v15;
}

- (void).cxx_destruct
{
}

void __77__MRAVConcreteEndpoint_addOutputDevices_initiator_withReplyQueue_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 64)];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);
}

void __60__MRAVConcreteEndpoint_outputDeviceVolume_queue_completion___block_invoke_2_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_3_4();
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 72)];
  OUTLINED_FUNCTION_0_16();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);
}

@end