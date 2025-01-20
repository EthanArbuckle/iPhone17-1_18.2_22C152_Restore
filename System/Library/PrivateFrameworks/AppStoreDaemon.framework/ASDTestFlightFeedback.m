@interface ASDTestFlightFeedback
+ (id)interface;
+ (id)sharedInstance;
- (ASDTestFlightFeedback)init;
- (BOOL)isFeedbackEnabledForBundleID:(id)a3;
- (BOOL)isFeedbackEnabledForBundleURL:(id)a3;
- (BOOL)isLaunchScreenEnabledForBundleID:(id)a3;
- (BOOL)isLaunchScreenEnabledForBundleURL:(id)a3;
- (id)getDisplayNamesForBundleID:(id)a3;
- (id)getDisplayNamesForBundleURL:(id)a3;
- (id)getEmailAddressForBundleID:(id)a3;
- (id)getEmailAddressForBundleURL:(id)a3;
- (id)getLaunchInfoForBundleID:(id)a3;
- (id)getLaunchInfoForBundleURL:(id)a3;
- (id)getLaunchInfoForVersion:(id)a3;
- (void)getFeedbackMetadataForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)getFeedbackMetadataForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)getLaunchInfoForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)getLaunchInfoForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)setFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5;
- (void)setLaunchInfo:(id)a3 withCompletionHandler:(id)a4;
- (void)setLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5;
- (void)submitFeedback:(id)a3 bundleURL:(id)a4 withCompletionHandler:(id)a5;
- (void)submitFeedback:(id)a3 withCompletionHandler:(id)a4;
- (void)updateTestNotes:(id)a3 forVersion:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation ASDTestFlightFeedback

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6BF18];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_getFeedbackMetadataForBundleID_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_getLaunchInfoForBundleID_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v5 forSelector:sel_getLaunchInfoForVersion_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v6 forSelector:sel_getLaunchInfoForVersion_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v7 forSelector:sel_setFeedbackEnabled_forVersion_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v8 forSelector:sel_setLaunchScreenEnabled_forVersion_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v9 forSelector:sel_setLaunchInfo_withCompletionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ASDTestFlightFeedback_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4D6460 != -1) {
    dispatch_once(&qword_1EB4D6460, block);
  }
  v2 = (void *)_MergedGlobals_27;
  return v2;
}

uint64_t __39__ASDTestFlightFeedback_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_27 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDTestFlightFeedback)init
{
  v3 = +[ASDServiceBroker defaultBroker];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDTestFlightFeedback;
    v5 = [(ASDTestFlightFeedback *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_serviceBroker, v3);
    }
  }

  return self;
}

- (id)getDisplayNamesForBundleID:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getDisplayNamesForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  objc_super v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke_2;
  v13[3] = &unk_1E58B3538;
  v13[4] = &v16;
  [v8 getDisplayNamesForBundleID:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getDisplayNamesForBundleID:%{public}@ - %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

void __52__ASDTestFlightFeedback_getDisplayNamesForBundleID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getDisplayNamesForBundleURL:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getDisplayNamesForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  objc_super v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke_2;
  v13[3] = &unk_1E58B3538;
  v13[4] = &v16;
  [v8 getDisplayNamesForBundleURL:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getDisplayNamesForBundleURL:%{public}@ - %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke(uint64_t a1, void *a2)
{
}

void __53__ASDTestFlightFeedback_getDisplayNamesForBundleURL___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getEmailAddressForBundleID:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getEmailAddressForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  objc_super v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke_2;
  v13[3] = &unk_1E58B3560;
  v13[4] = &v16;
  [v8 getEmailAddressForBundleID:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getEmailAddressForBundleID:%{public}@ - %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

void __52__ASDTestFlightFeedback_getEmailAddressForBundleID___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getEmailAddressForBundleURL:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getEmailAddressForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  objc_super v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke_2;
  v13[3] = &unk_1E58B3560;
  v13[4] = &v16;
  [v8 getEmailAddressForBundleURL:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getEmailAddressForBundleURL:%{public}@ - %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke(uint64_t a1, void *a2)
{
}

void __53__ASDTestFlightFeedback_getEmailAddressForBundleURL___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)getFeedbackMetadataForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "getFeedbackMetadataForBundleID: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E58B35B0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v12];
}

void __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E58B3588;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 getFeedbackMetadataForBundleID:v5 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __78__ASDTestFlightFeedback_getFeedbackMetadataForBundleID_withCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getFeedbackMetadataForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "getFeedbackMetadataForBundleURL: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E58B35B0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v12];
}

void __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E58B3588;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 getFeedbackMetadataForBundleURL:v5 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __79__ASDTestFlightFeedback_getFeedbackMetadataForBundleURL_withCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)getLaunchInfoForBundleID:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke_2;
  v13[3] = &unk_1E58B35D8;
  v13[4] = &buf;
  void v13[5] = &v16;
  [v8 getLaunchInfoForBundleID:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getLaunchInfoForBundleID: %{public}@ - %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

void __50__ASDTestFlightFeedback_getLaunchInfoForBundleID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getLaunchInfoForBundleURL:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke_2;
  v13[3] = &unk_1E58B35D8;
  v13[4] = &buf;
  void v13[5] = &v16;
  [v8 getLaunchInfoForBundleURL:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getLaunchInfoForBundleID: %{public}@ - %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke(uint64_t a1, void *a2)
{
}

void __51__ASDTestFlightFeedback_getLaunchInfoForBundleURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getLaunchInfoForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleID: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E58B35B0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v12];
}

void __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E58B3600;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 getLaunchInfoForBundleID:v5 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __72__ASDTestFlightFeedback_getLaunchInfoForBundleID_withCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getLaunchInfoForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v6;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "getLaunchInfoForBundleURL: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E58B35B0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v12];
}

void __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E58B3600;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 getLaunchInfoForBundleURL:v5 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_5;
  block[3] = &unk_1E58B3068;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__ASDTestFlightFeedback_getLaunchInfoForBundleURL_withCompletionHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)getLaunchInfoForVersion:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "getLaunchInfoForVersion %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v30, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke_2;
  v13[3] = &unk_1E58B35D8;
  v13[4] = &buf;
  void v13[5] = &v16;
  [v8 getLaunchInfoForVersion:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v22 = 138543618;
      id v23 = v4;
      __int16 v24 = 2114;
      uint64_t v25 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in getLaunchInfoForVersion %{public}@: %{public}@", v22, 0x16u);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke(uint64_t a1, void *a2)
{
}

void __49__ASDTestFlightFeedback_getLaunchInfoForVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)isFeedbackEnabledForBundleID:(id)a3
{
  v28[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "isFeedbackEnabledForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  uint64_t v27 = __Block_byref_object_dispose__2;
  v28[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v28, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke_2;
  v13[3] = &unk_1E58B3628;
  v13[4] = &v16;
  [v8 isFeedbackEnabledForBundleID:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v20 = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in isFeedbackEnabledForBundleID:%{public}@ - %{public}@", v20, 0x16u);
    }

    BOOL v10 = 0;
    *((unsigned char *)v17 + 24) = 0;
  }
  else
  {
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __54__ASDTestFlightFeedback_isFeedbackEnabledForBundleID___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isFeedbackEnabledForBundleURL:(id)a3
{
  v28[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "isFeedbackEnabledForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  uint64_t v27 = __Block_byref_object_dispose__2;
  v28[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v28, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke_2;
  v13[3] = &unk_1E58B3628;
  v13[4] = &v16;
  [v8 isFeedbackEnabledForBundleURL:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v20 = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in isFeedbackEnabledForBundleURL:%{public}@ - %{public}@", v20, 0x16u);
    }

    BOOL v10 = 0;
    *((unsigned char *)v17 + 24) = 0;
  }
  else
  {
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __55__ASDTestFlightFeedback_isFeedbackEnabledForBundleURL___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isLaunchScreenEnabledForBundleID:(id)a3
{
  v28[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "isLaunchScreenEnabledForBundleID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  uint64_t v27 = __Block_byref_object_dispose__2;
  v28[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v28, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke_2;
  v13[3] = &unk_1E58B3628;
  v13[4] = &v16;
  [v8 isLaunchScreenEnabledForBundleID:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v20 = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in isLaunchScreenEnabledForBundleID:%{public}@ - %{public}@", v20, 0x16u);
    }

    BOOL v10 = 0;
    *((unsigned char *)v17 + 24) = 0;
  }
  else
  {
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __58__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleID___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isLaunchScreenEnabledForBundleURL:(id)a3
{
  v28[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_debug_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEBUG, "isLaunchScreenEnabledForBundleURL: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  uint64_t v27 = __Block_byref_object_dispose__2;
  v28[0] = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  serviceBroker = self->_serviceBroker;
  id obj = 0;
  id v7 = [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithError:&obj];
  objc_storeStrong(v28, obj);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke;
  v14[3] = &unk_1E58B3108;
  v14[4] = &buf;
  id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke_2;
  v13[3] = &unk_1E58B3628;
  v13[4] = &v16;
  [v8 isLaunchScreenEnabledForBundleURL:v4 withCompletionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v9 = ASDLogHandleForCategory(38);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v20 = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      uint64_t v23 = v12;
      _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "Error in isLaunchScreenEnabledForBundleURL:%{public}@ - %{public}@", v20, 0x16u);
    }

    BOOL v10 = 0;
    *((unsigned char *)v17 + 24) = 0;
  }
  else
  {
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __59__ASDTestFlightFeedback_isLaunchScreenEnabledForBundleURL___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v19 = v8;
    _os_log_debug_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_DEBUG, "setFeedbackEnabled:forVersion: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E58B3650;
  BOOL v17 = a3;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v14];
}

void __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E58B2CB8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v4 setFeedbackEnabled:v5 forVersion:v6 withCompletionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

void __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __77__ASDTestFlightFeedback_setFeedbackEnabled_forVersion_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v19 = v8;
    _os_log_debug_impl(&dword_19BF6A000, v10, OS_LOG_TYPE_DEBUG, "setLaunchScreenEnabled:forVersion: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E58B3650;
  BOOL v17 = a3;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v14];
}

void __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E58B2CB8;
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v4 setLaunchScreenEnabled:v5 forVersion:v6 withCompletionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

void __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __81__ASDTestFlightFeedback_setLaunchScreenEnabled_forVersion_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setLaunchInfo:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v6 version];
    *(_DWORD *)long long buf = 138543362;
    BOOL v17 = v12;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "setLaunchInfo: %{public}@", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E58B35B0;
  id v14 = v6;
  id v15 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v13];
}

void __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E58B2CB8;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 setLaunchInfo:v5 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__ASDTestFlightFeedback_setLaunchInfo_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)submitFeedback:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [v6 bundleID];
    *(_DWORD *)long long buf = 138543362;
    BOOL v17 = v12;
    _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "submitFeedback: %{public}@", buf, 0xCu);
  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E58B35B0;
  id v14 = v6;
  id v15 = v7;
  id v10 = v6;
  id v11 = v7;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v13];
}

void __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E58B2CB8;
    id v10 = *(id *)(a1 + 40);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_4;
    v7[3] = &unk_1E58B2CB8;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v4 submitFeedback:v5 withCompletionHandler:v7];
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __62__ASDTestFlightFeedback_submitFeedback_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)submitFeedback:(id)a3 bundleURL:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v21 = v9;
    _os_log_debug_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_DEBUG, "submitFeedback:bundleURL: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E58B3678;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v16];
}

void __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 48);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 48);
    [v4 submitFeedback:v5 bundleURL:v6 withCompletionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __72__ASDTestFlightFeedback_submitFeedback_bundleURL_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)updateTestNotes:(id)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = ASDLogHandleForCategory(38);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v21 = v9;
    _os_log_debug_impl(&dword_19BF6A000, v11, OS_LOG_TYPE_DEBUG, "updateTestNotes:forVersion: %{public}@", buf, 0xCu);
  }

  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E58B3678;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(ASDServiceBroker *)serviceBroker getTestFlightFeedbackServiceWithCompletionHandler:v16];
}

void __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_1E58B2CB8;
    id v11 = *(id *)(a1 + 48);
    id v4 = [a2 remoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E58B2CB8;
    id v9 = *(id *)(a1 + 48);
    [v4 updateTestNotes:v5 forVersion:v6 withCompletionHandler:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_5;
  v7[3] = &unk_1E58B2E18;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __74__ASDTestFlightFeedback_updateTestNotes_forVersion_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
}

@end