@interface MRAVDiscoverySessionHelper
- (MRAVDiscoverySessionHelper)initWithFeatures:(unint64_t)a3;
- (id)createDiscoverySession;
- (void)searchAVOutputDeviceForUID:(id)a3 timeout:(double)a4 identifier:(id)a5 reason:(id)a6 completion:(id)a7;
@end

@implementation MRAVDiscoverySessionHelper

- (MRAVDiscoverySessionHelper)initWithFeatures:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRAVDiscoverySessionHelper;
  result = [(MRAVDiscoverySessionHelper *)&v5 init];
  if (result) {
    result->_discoverySessionFeatures = a3;
  }
  return result;
}

- (void)searchAVOutputDeviceForUID:(id)a3 timeout:(double)a4 identifier:(id)a5 reason:(id)a6 completion:(id)a7
{
  v67[1] = *(id *)MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v40 = a6;
  id v14 = a7;
  v15 = [MEMORY[0x1E4F1C9C8] date];
  v16 = [NSString stringWithFormat:@"searchAVOutputDeviceForUID-%@", v40];
  v39 = [NSString stringWithFormat:@"outputDeviceUID=%@", v12];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v16, v13];
  v18 = v17;
  if (v39) {
    [v17 appendFormat:@" for %@", v39];
  }
  v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v64 = 0x3042000000;
  v65 = __Block_byref_object_copy__7;
  v66 = __Block_byref_object_dispose__7;
  v67[0] = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke;
  v56[3] = &unk_1E57D2878;
  p_long long buf = &buf;
  id v20 = v12;
  id v57 = v20;
  id v21 = v16;
  id v58 = v21;
  id v38 = v13;
  id v59 = v38;
  id v22 = v15;
  id v60 = v22;
  id v23 = v14;
  id v61 = v23;
  v24 = (void *)MEMORY[0x1997190F0](v56);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__17;
  v54 = __Block_byref_object_dispose__18;
  id v55 = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_19;
  v46[3] = &unk_1E57D28C8;
  id v25 = v20;
  id v47 = v25;
  v49 = &v50;
  id v26 = v24;
  id v48 = v26;
  v27 = (void *)MEMORY[0x1997190F0](v46);
  v28 = [(MRAVDiscoverySessionHelper *)self createDiscoverySession];
  [v28 setDiscoveryMode:3];
  v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v30 = getAVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification[0]();
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_3;
  v43[3] = &unk_1E57D28F0;
  id v31 = v27;
  id v45 = v31;
  id v32 = v28;
  id v44 = v32;
  v33 = [v29 addObserverForName:v30 object:v32 queue:0 usingBlock:v43];
  objc_storeWeak((id *)(*((void *)&buf + 1) + 40), v33);

  v34 = [MRBlockGuard alloc];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_4;
  v41[3] = &unk_1E57D0FE8;
  id v35 = v26;
  id v42 = v35;
  uint64_t v36 = [(MRBlockGuard *)v34 initWithTimeout:v21 reason:v41 handler:a4];
  v37 = (void *)v51[5];
  v51[5] = v36;

  (*((void (**)(id, id))v31 + 2))(v31, v32);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v67);
}

void __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1[9] + 8) + 40));
  [v7 removeObserver:WeakRetained];

  uint64_t v9 = a1[4];
  v10 = _MRLogForCategory(0xAuLL);
  v11 = v10;
  if (v5 && !v6)
  {
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        uint64_t v14 = a1[5];
        uint64_t v13 = a1[6];
        uint64_t v15 = a1[4];
        v16 = [MEMORY[0x1E4F1C9C8] date];
        [v16 timeIntervalSinceDate:a1[7]];
        int v37 = 138544386;
        uint64_t v38 = v14;
        __int16 v39 = 2114;
        uint64_t v40 = v13;
        __int16 v41 = 2112;
        id v42 = v5;
        __int16 v43 = 2114;
        uint64_t v44 = v15;
        __int16 v45 = 2048;
        uint64_t v46 = v17;
        v18 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v19 = v11;
        uint32_t v20 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v37, v20);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v12) {
      goto LABEL_22;
    }
    uint64_t v31 = a1[5];
    uint64_t v32 = a1[6];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:a1[7]];
    int v37 = 138544130;
    uint64_t v38 = v31;
    __int16 v39 = 2114;
    uint64_t v40 = v32;
    __int16 v41 = 2112;
    id v42 = v5;
    __int16 v43 = 2048;
    uint64_t v44 = v33;
    v18 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v19 = v11;
    uint32_t v20 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v21 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v21)
      {
        uint64_t v23 = a1[5];
        uint64_t v22 = a1[6];
        uint64_t v24 = a1[4];
        v16 = [MEMORY[0x1E4F1C9C8] date];
        [v16 timeIntervalSinceDate:a1[7]];
        int v37 = 138544386;
        uint64_t v38 = v23;
        __int16 v39 = 2114;
        uint64_t v40 = v22;
        __int16 v41 = 2114;
        id v42 = v6;
        __int16 v43 = 2114;
        uint64_t v44 = v24;
        __int16 v45 = 2048;
        uint64_t v46 = v25;
        _os_log_error_impl(&dword_194F3C000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v37, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v21)
    {
      __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(a1, (uint64_t)v6, v11);
    }
    goto LABEL_22;
  }
  BOOL v26 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v26) {
      goto LABEL_22;
    }
    uint64_t v34 = a1[5];
    uint64_t v35 = a1[6];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:a1[7]];
    int v37 = 138543874;
    uint64_t v38 = v34;
    __int16 v39 = 2114;
    uint64_t v40 = v35;
    __int16 v41 = 2048;
    id v42 = v36;
    v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v19 = v11;
    uint32_t v20 = 32;
    goto LABEL_16;
  }
  if (v26)
  {
    uint64_t v28 = a1[5];
    uint64_t v27 = a1[6];
    v29 = (void *)a1[4];
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:a1[7]];
    int v37 = 138544130;
    uint64_t v38 = v28;
    __int16 v39 = 2114;
    uint64_t v40 = v27;
    __int16 v41 = 2114;
    id v42 = v29;
    __int16 v43 = 2048;
    uint64_t v44 = v30;
    v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(a1[8] + 16))();
}

void __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_19(uint64_t a1, void *a2)
{
  v3 = [a2 availableOutputDevices];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_2;
  v5[3] = &unk_1E57D28A0;
  id v6 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "mr_first:", v5);
  if (v4 && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 ID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)createDiscoverySession
{
  v2 = (void *)[objc_alloc((Class)getAVOutputDeviceDiscoverySessionClass[0]()) initWithDeviceFeatures:self->_discoverySessionFeatures];

  return v2;
}

void __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:a1[7]];
  int v10 = 138544130;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  __int16 v16 = 2048;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_194F3C000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);
}

@end