@interface CSAudioInjectionServices
+ (BOOL)audioInjectionEnabled;
+ (BOOL)setAudioInjectionMode:(BOOL)a3;
+ (id)GetConnectionForDaemon:(int)a3;
+ (id)getAudioInjectionXPCConnectionForCoreSpeechD;
+ (void)connectDeviceWithUUID:(id)a3 completion:(id)a4;
+ (void)connectDeviceWithUUID:(id)a3 handlingDaemon:(int)a4 completion:(id)a5;
+ (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 completion:(id)a7;
+ (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 handlingDaemon:(int)a7 completion:(id)a8;
+ (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4;
+ (void)disconnectDeviceWithUUID:(id)a3 handlingDaemon:(int)a4 completion:(id)a5;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 handlingDaemon:(int)a5 completion:(id)a6;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 completion:(id)a6;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 handlingDaemon:(int)a6 completion:(id)a7;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 withUserIntentOptions:(id)a6 completion:(id)a7;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 withUserIntentOptions:(id)a6 handlingDaemon:(int)a7 completion:(id)a8;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withfadingTimeWindowLength:(unint64_t)a5 completion:(id)a6;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withfadingTimeWindowLength:(unint64_t)a5 handlingDaemon:(int)a6 completion:(id)a7;
+ (void)pingpong:(id)a3 completion:(id)a4;
+ (void)primaryInputDeviceUUIDWithCompletion:(id)a3;
+ (void)primaryInputDeviceUUIDWithhandlingDaemon:(int)a3 WithCompletion:(id)a4;
@end

@implementation CSAudioInjectionServices

+ (id)GetConnectionForDaemon:(int)a3
{
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(a1, "getAudioInjectionXPCConnectionForCoreSpeechD", v3);
  }
  return v5;
}

+ (void)primaryInputDeviceUUIDWithhandlingDaemon:(int)a3 WithCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CSLogInitIfNeeded();
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke;
  v41[3] = &unk_1E658D210;
  id v6 = v5;
  id v42 = v6;
  v7 = (void *)MEMORY[0x1CB785210](v41);
  v8 = +[CSAudioInjectionServices GetConnectionForDaemon:v4];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_2;
  v39[3] = &unk_1E658D1C0;
  id v9 = v7;
  id v40 = v9;
  [v8 setInterruptionHandler:v39];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_20;
  v37[3] = &unk_1E658D1C0;
  id v10 = v9;
  id v38 = v10;
  [v8 setInvalidationHandler:v37];
  [v8 resume];
  v11 = [v8 remoteObjectProxy];
  v12 = (NSObject **)MEMORY[0x1E4F5D180];
  v13 = *MEMORY[0x1E4F5D180];
  v14 = *MEMORY[0x1E4F5D180];
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]";
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s Request to fetch primary device", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__27382;
    v48 = __Block_byref_object_dispose__27383;
    id v49 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__27382;
    v31 = __Block_byref_object_dispose__27383;
    id v32 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_21;
    v22[3] = &unk_1E658D238;
    v24 = &v33;
    p_long long buf = &buf;
    v26 = &v27;
    v16 = v15;
    v23 = v16;
    [v11 primaryInputDeviceUUIDWithCompletion:v22];
    dispatch_time_t v17 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1505 userInfo:0];
      v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v18;

      v20 = *v12;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v43 = 136315138;
        v44 = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]";
        _os_log_error_impl(&dword_1C9338000, v20, OS_LOG_TYPE_ERROR, "%s Fetching primary device timed-out!!", v43, 0xCu);
      }
    }
    (*((void (**)(id, void, void, uint64_t))v10 + 2))(v10, *((unsigned __int8 *)v34 + 24), *(void *)(*((void *)&buf + 1) + 40), v28[5]);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]";
      _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", (uint8_t *)&buf, 0xCu);
    }
    v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1503 userInfo:0];
    (*((void (**)(id, void, void *, void))v10 + 2))(v10, 0, v21, 0);
  }
}

uint64_t __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1502 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0, v4, 0);
}

void __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_20(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "+[CSAudioInjectionServices primaryInputDeviceUUIDWithhandlingDaemon:WithCompletion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1501 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0, v4, 0);
}

void __84__CSAudioInjectionServices_primaryInputDeviceUUIDWithhandlingDaemon_WithCompletion___block_invoke_21(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)primaryInputDeviceUUIDWithCompletion:(id)a3
{
}

+ (void)disconnectDeviceWithUUID:(id)a3 handlingDaemon:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  CSLogInitIfNeeded();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke;
  v40[3] = &unk_1E658D328;
  id v9 = v8;
  id v41 = v9;
  id v10 = (void *)MEMORY[0x1CB785210](v40);
  uint64_t v11 = +[CSAudioInjectionServices GetConnectionForDaemon:v6];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_2;
  v38[3] = &unk_1E658D1C0;
  id v12 = v10;
  id v39 = v12;
  [v11 setInterruptionHandler:v38];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_18;
  v36[3] = &unk_1E658D1C0;
  id v13 = v12;
  id v37 = v13;
  [v11 setInvalidationHandler:v36];
  [v11 resume];
  id v14 = [v11 remoteObjectProxy];
  dispatch_semaphore_t v15 = (NSObject **)MEMORY[0x1E4F5D180];
  v16 = *MEMORY[0x1E4F5D180];
  dispatch_time_t v17 = *MEMORY[0x1E4F5D180];
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&buf[4] = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Request to disconnect device with UUID %@", buf, 0x16u);
    }
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__27382;
    uint64_t v46 = __Block_byref_object_dispose__27383;
    id v47 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_19;
    v28 = &unk_1E658D288;
    v30 = &v32;
    v31 = buf;
    v19 = v18;
    uint64_t v29 = v19;
    [v14 disconnectDeviceWithUUID:v7 completion:&v25];
    dispatch_time_t v20 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v19, v20))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F5D138], 1505, 0, v25, v26, v27, v28);
      v22 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v21;

      v23 = *v15;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v42 = 136315138;
        v43 = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]";
        _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s Disconnect device timed-out!!", v42, 0xCu);
      }
    }
    (*((void (**)(id, void, void))v13 + 2))(v13, *((unsigned __int8 *)v33 + 24), *(void *)(*(void *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C9338000, v16, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1503 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
  }
}

uint64_t __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1502 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices disconnectDeviceWithUUID:handlingDaemon:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1501 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __79__CSAudioInjectionServices_disconnectDeviceWithUUID_handlingDaemon_completion___block_invoke_19(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4
{
}

+ (void)connectDeviceWithUUID:(id)a3 handlingDaemon:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  CSLogInitIfNeeded();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke;
  v40[3] = &unk_1E658D328;
  id v9 = v8;
  id v41 = v9;
  id v10 = (void *)MEMORY[0x1CB785210](v40);
  uint64_t v11 = +[CSAudioInjectionServices GetConnectionForDaemon:v6];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_2;
  v38[3] = &unk_1E658D1C0;
  id v12 = v10;
  id v39 = v12;
  [v11 setInterruptionHandler:v38];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_16;
  v36[3] = &unk_1E658D1C0;
  id v13 = v12;
  id v37 = v13;
  [v11 setInvalidationHandler:v36];
  [v11 resume];
  id v14 = [v11 remoteObjectProxy];
  dispatch_semaphore_t v15 = (NSObject **)MEMORY[0x1E4F5D180];
  v16 = *MEMORY[0x1E4F5D180];
  dispatch_time_t v17 = *MEMORY[0x1E4F5D180];
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&buf[4] = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Request to connect device with UUID %@", buf, 0x16u);
    }
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy__27382;
    uint64_t v46 = __Block_byref_object_dispose__27383;
    id v47 = 0;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_17;
    v28 = &unk_1E658D288;
    v30 = &v32;
    v31 = buf;
    v19 = v18;
    uint64_t v29 = v19;
    [v14 connectDeviceWithUUID:v7 completion:&v25];
    dispatch_time_t v20 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v19, v20))
    {
      uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F5D138], 1505, 0, v25, v26, v27, v28);
      v22 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v21;

      v23 = *v15;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v42 = 136315138;
        v43 = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]";
        _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s Connect device timed-out!!", v42, 0xCu);
      }
    }
    (*((void (**)(id, void, void))v13 + 2))(v13, *((unsigned __int8 *)v33 + 24), *(void *)(*(void *)&buf[8] + 40));

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C9338000, v16, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1503 userInfo:0];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v24);
  }
}

uint64_t __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1502 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices connectDeviceWithUUID:handlingDaemon:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1501 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __76__CSAudioInjectionServices_connectDeviceWithUUID_handlingDaemon_completion___block_invoke_17(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)connectDeviceWithUUID:(id)a3 completion:(id)a4
{
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 withUserIntentOptions:(id)a6 handlingDaemon:(int)a7 completion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  CSLogInitIfNeeded();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke;
  v30[3] = &unk_1E658D260;
  id v17 = v16;
  id v31 = v17;
  dispatch_semaphore_t v18 = (void *)MEMORY[0x1CB785210](v30);
  v19 = +[CSAudioInjectionServices GetConnectionForDaemon:v9];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_2;
  v28[3] = &unk_1E658D1C0;
  id v20 = v18;
  id v29 = v20;
  [v19 setInterruptionHandler:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_14;
  v26[3] = &unk_1E658D1C0;
  id v21 = v20;
  id v27 = v21;
  [v19 setInvalidationHandler:v26];
  [v19 resume];
  v22 = [v19 remoteObjectProxy];
  v23 = *MEMORY[0x1E4F5D180];
  if (v22)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      uint64_t v33 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:completion:]";
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2112;
      id v37 = v14;
      _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_DEFAULT, "%s Request to inject audio %@ to deviceUUID %@", buf, 0x20u);
    }
    LODWORD(v24) = 1120403456;
    [v22 injectAudio:v13 toDeviceWithUUID:v14 withScaleFactor:a5 withNumChannels:v15 withUserIntentOptions:v17 completion:v24];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v33 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1503 userInfo:0];
    (*((void (**)(id, void, void *, void, void))v21 + 2))(v21, 0, v25, 0, 0);
  }
}

uint64_t __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:co"
         "mpletion:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1502 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0, v4, 0, 0);
}

void __121__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withNumChannels_withUserIntentOptions_handlingDaemon_completion___block_invoke_14(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withNumChannels:withUserIntentOptions:handlingDaemon:co"
         "mpletion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1501 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0, v4, 0, 0);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 withUserIntentOptions:(id)a6 completion:(id)a7
{
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 handlingDaemon:(int)a6 completion:(id)a7
{
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withNumChannels:(unint64_t)a5 completion:(id)a6
{
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withfadingTimeWindowLength:(unint64_t)a5 handlingDaemon:(int)a6 completion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  CSLogInitIfNeeded();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke;
  v29[3] = &unk_1E658D260;
  id v14 = v13;
  id v30 = v14;
  id v15 = (void *)MEMORY[0x1CB785210](v29);
  id v16 = +[CSAudioInjectionServices GetConnectionForDaemon:v8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_2;
  v27[3] = &unk_1E658D1C0;
  id v17 = v15;
  id v28 = v17;
  [v16 setInterruptionHandler:v27];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_13;
  v25[3] = &unk_1E658D1C0;
  id v18 = v17;
  id v26 = v18;
  [v16 setInvalidationHandler:v25];
  [v16 resume];
  v19 = [v16 remoteObjectProxy];
  if (a5) {
    float v20 = 1.0 / (float)a5;
  }
  else {
    float v20 = 1.0;
  }
  id v21 = *MEMORY[0x1E4F5D180];
  v22 = *MEMORY[0x1E4F5D180];
  if (v19)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      uint64_t v32 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]";
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v12;
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_DEFAULT, "%s Request to inject audio %@ to deviceUUID %@", buf, 0x20u);
    }
    *(float *)&double v23 = v20;
    [v19 injectAudio:v11 toDeviceWithUUID:v12 withScaleFactor:v14 completion:v23];
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v32 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C9338000, v21, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    double v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1503 userInfo:0];
    (*((void (**)(id, void, void *, void, void))v18 + 2))(v18, 0, v24, 0, 0);
  }
}

uint64_t __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1502 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0, v4, 0, 0);
}

void __110__CSAudioInjectionServices_injectAudio_toDeviceWithUUID_withfadingTimeWindowLength_handlingDaemon_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices injectAudio:toDeviceWithUUID:withfadingTimeWindowLength:handlingDaemon:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1501 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void, void))(v3 + 16))(v3, 0, v4, 0, 0);
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 withfadingTimeWindowLength:(unint64_t)a5 completion:(id)a6
{
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 handlingDaemon:(int)a5 completion:(id)a6
{
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5
{
}

+ (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 handlingDaemon:(int)a7 completion:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  __int16 v33 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  CSLogInitIfNeeded();
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke;
  v53[3] = &unk_1E658D210;
  id v16 = v15;
  id v54 = v16;
  id v17 = (void *)MEMORY[0x1CB785210](v53);
  id v18 = +[CSAudioInjectionServices GetConnectionForDaemon:v9];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_2;
  v51[3] = &unk_1E658D1C0;
  id v19 = v17;
  id v52 = v19;
  [v18 setInterruptionHandler:v51];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_10;
  v49[3] = &unk_1E658D1C0;
  id v20 = v19;
  id v50 = v20;
  [v18 setInvalidationHandler:v49];
  [v18 resume];
  uint64_t v21 = [v18 remoteObjectProxy];
  v22 = (void *)v21;
  double v23 = *MEMORY[0x1E4F5D180];
  if (v21)
  {
    uint64_t v32 = (void *)v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:h"
                           "andlingDaemon:completion:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      v58 = v33;
      *(_WORD *)v59 = 2112;
      *(void *)&v59[2] = v13;
      *(_WORD *)&v59[10] = 2112;
      *(void *)&v59[12] = v14;
      _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_DEFAULT, "%s Request to create audio injection device type : %ld, deviceName : %@, deviceId : %@, productId : %@", buf, 0x34u);
    }
    uint64_t v45 = 0;
    uint64_t v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__27382;
    *(void *)v59 = __Block_byref_object_dispose__27383;
    *(void *)&v59[8] = 0;
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__27382;
    v43 = __Block_byref_object_dispose__27383;
    id v44 = 0;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    uint64_t v25 = [v18 remoteObjectProxy];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_11;
    v34[3] = &unk_1E658D238;
    id v36 = &v45;
    uint64_t v37 = buf;
    uint64_t v38 = &v39;
    id v26 = v24;
    __int16 v35 = v26;
    [v25 createAudioInjectionDeviceWithType:a3 deviceName:v33 deviceID:v13 productID:v14 completion:v34];

    v22 = v32;
    dispatch_time_t v27 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v26, v27))
    {
      uint64_t v28 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1505 userInfo:0];
      id v29 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v28;

      id v30 = *MEMORY[0x1E4F5D180];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v55 = 136315138;
        v56 = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:completion:]";
        _os_log_error_impl(&dword_1C9338000, v30, OS_LOG_TYPE_ERROR, "%s Fetching primary device timed-out!!", v55, 0xCu);
      }
    }
    (*((void (**)(id, void, void, uint64_t))v20 + 2))(v20, *((unsigned __int8 *)v46 + 24), *(void *)(*(void *)&buf[8] + 40), v40[5]);

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:h"
                           "andlingDaemon:completion:]";
      _os_log_error_impl(&dword_1C9338000, v23, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
    }
    id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1503 userInfo:0];
    (*((void (**)(id, void, void *, void))v20 + 2))(v20, 0, v31, 0);
  }
}

uint64_t __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:comp"
         "letion:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1502 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0, v4, 0);
}

void __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[CSAudioInjectionServices createAudioInjectionDeviceWithType:deviceName:deviceID:productID:handlingDaemon:comp"
         "letion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1501 userInfo:0];
  (*(void (**)(uint64_t, void, void *, void))(v3 + 16))(v3, 0, v4, 0);
}

void __119__CSAudioInjectionServices_createAudioInjectionDeviceWithType_deviceName_deviceID_productID_handlingDaemon_completion___block_invoke_11(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)createAudioInjectionDeviceWithType:(int64_t)a3 deviceName:(id)a4 deviceID:(id)a5 productID:(id)a6 completion:(id)a7
{
}

+ (void)pingpong:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CSLogInitIfNeeded();
  uint64_t v6 = [a1 getAudioInjectionXPCConnectionForCoreSpeechD];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__CSAudioInjectionServices_pingpong_completion___block_invoke;
  v16[3] = &unk_1E658D1C0;
  id v7 = v5;
  id v17 = v7;
  [v6 setInterruptionHandler:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CSAudioInjectionServices_pingpong_completion___block_invoke_3;
  v14[3] = &unk_1E658D1C0;
  id v8 = v7;
  id v15 = v8;
  [v6 setInvalidationHandler:v14];
  [v6 resume];
  uint64_t v9 = [v6 remoteObjectProxy];
  if (!v9)
  {
    uint64_t v11 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v19 = "+[CSAudioInjectionServices pingpong:completion:]";
      _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s XPC connection not exist?", buf, 0xCu);
      if (!v8) {
        goto LABEL_6;
      }
    }
    else if (!v8)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    goto LABEL_6;
  }
  id v10 = [v6 remoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__CSAudioInjectionServices_pingpong_completion___block_invoke_5;
  v12[3] = &unk_1E658D1E8;
  id v13 = v8;
  [v10 pingpong:@"TEST" completion:v12];

LABEL_6:
}

uint64_t __48__CSAudioInjectionServices_pingpong_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "+[CSAudioInjectionServices pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Interrupted", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __48__CSAudioInjectionServices_pingpong_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "+[CSAudioInjectionServices pingpong:completion:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s CSAudioInjectionServices Invalidated", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __48__CSAudioInjectionServices_pingpong_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)audioInjectionEnabled
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CSLogInitIfNeeded();
  int v2 = [MEMORY[0x1E4F5D450] isExclaveHardware];
  uint64_t v3 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  int v4 = v3;
  if (v2)
  {
    int v5 = [v3 exclaveAudioInjectionEnabled];

    uint64_t v6 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "+[CSAudioInjectionServices audioInjectionEnabled]";
      __int16 v11 = 1024;
      int v12 = v5;
      id v7 = "%s Fetched exclave audio injection enabled : %d";
LABEL_6:
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x12u);
    }
  }
  else
  {
    int v5 = [v3 programmableAudioInjectionEnabled];

    uint64_t v6 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "+[CSAudioInjectionServices audioInjectionEnabled]";
      __int16 v11 = 1024;
      int v12 = v5;
      id v7 = "%s Fetched audio injection enabled : %d";
      goto LABEL_6;
    }
  }
  return v5;
}

+ (BOOL)setAudioInjectionMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CSLogInitIfNeeded();
  int v4 = [MEMORY[0x1E4F5D450] isExclaveHardware];
  int v5 = *MEMORY[0x1E4F5D180];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v11 = 136315394;
      int v12 = "+[CSAudioInjectionServices setAudioInjectionMode:]";
      __int16 v13 = 1024;
      BOOL v14 = v3;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting exclave audio injection enabled : %d", (uint8_t *)&v11, 0x12u);
    }
    id v7 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
    char v8 = [v7 enableExclaveAudioInjection:v3];
  }
  else
  {
    if (v6)
    {
      int v11 = 136315394;
      int v12 = "+[CSAudioInjectionServices setAudioInjectionMode:]";
      __int16 v13 = 1024;
      BOOL v14 = v3;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting audio injection enabled : %d", (uint8_t *)&v11, 0x12u);
    }
    id v7 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
    char v8 = [v7 enableProgrammableAudioInjection:v3];
  }
  BOOL v9 = v8;

  return v9;
}

+ (id)getAudioInjectionXPCConnectionForCoreSpeechD
{
  id v2 = objc_alloc(MEMORY[0x1E4F29268]);
  BOOL v3 = (void *)[v2 initWithMachServiceName:*MEMORY[0x1E4F5D130] options:0];
  int v4 = AudioInjectionXPCGetInterface();
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

@end