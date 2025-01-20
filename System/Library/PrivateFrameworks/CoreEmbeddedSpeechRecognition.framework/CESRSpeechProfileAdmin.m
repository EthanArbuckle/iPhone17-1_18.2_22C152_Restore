@interface CESRSpeechProfileAdmin
+ (id)makeAdmin;
- (CESRSpeechProfileAdmin)init;
- (CESRSpeechProfileAdmin)initWithAdminService:(id)a3 queue:(id)a4;
- (CESRSpeechProfileAdmin)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5;
- (int64_t)_synchronouslyWrapRequest:(id)a3;
- (int64_t)beginEvaluation:(id)a3;
- (int64_t)beginEvaluationWithSerializedSets:(id)a3;
- (int64_t)endEvaluation;
- (void)beginEvaluation:(id)a3 completion:(id)a4;
- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4;
- (void)endEvaluation:(id)a3;
- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4;
- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4;
@end

@implementation CESRSpeechProfileAdmin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_adminService, 0);
}

- (int64_t)_synchronouslyWrapRequest:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke;
  aBlock[3] = &unk_1E61C35A0;
  v19 = &v20;
  aBlock[4] = self;
  v6 = v5;
  v18 = v6;
  v7 = _Block_copy(aBlock);
  dispatch_group_enter(v6);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_12;
  v15[3] = &unk_1E61C35F0;
  v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  v4[2](v4, v15);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v6, v9))
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_3;
    v13[3] = &unk_1E61C3BA8;
    id v14 = v8;
    dispatch_sync(queue, v13);
  }
  int64_t v11 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(void *)(v2 + 24))
  {
    *(void *)(v2 + 24) = a2;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 4)
    {
      v4 = (void *)*MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        dispatch_group_t v5 = NSNumber;
        double v6 = *(double *)(*(void *)(a1 + 32) + 16);
        v7 = v4;
        id v8 = [v5 numberWithDouble:v6];
        int v9 = 136315394;
        v10 = "-[CESRSpeechProfileAdmin _synchronouslyWrapRequest:]_block_invoke";
        __int16 v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service. Timeout: %@ seconds", (uint8_t *)&v9, 0x16u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_12(uint64_t a1, uint64_t a2)
{
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_2;
  v4[3] = &unk_1E61C35C8;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__CESRSpeechProfileAdmin__synchronouslyWrapRequest___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (int64_t)endEvaluation
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CESRSpeechProfileAdmin_endEvaluation__block_invoke;
  v3[3] = &unk_1E61C3578;
  v3[4] = self;
  return [(CESRSpeechProfileAdmin *)self _synchronouslyWrapRequest:v3];
}

uint64_t __39__CESRSpeechProfileAdmin_endEvaluation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endEvaluation:a2];
}

- (void)endEvaluation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t))a3;
  BOOL v5 = +[CESRUtilities isCustomerInstall];
  uint64_t v6 = *MEMORY[0x1E4F4E380];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CESRSpeechProfileAdmin endEvaluation:]";
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 3);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CESRSpeechProfileAdmin endEvaluation:]";
      _os_log_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_INFO, "%s Submitting request to end evaluation", buf, 0xCu);
    }
    adminService = self->_adminService;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__CESRSpeechProfileAdmin_endEvaluation___block_invoke;
    v9[3] = &unk_1E61C3528;
    v10 = v4;
    [(CESRSpeechProfileAdminService *)adminService endEvaluation:v9];
  }
}

uint64_t __40__CESRSpeechProfileAdmin_endEvaluation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    BOOL v5 = @"NOT ";
    if (a2 == 1) {
      BOOL v5 = &stru_1F1291150;
    }
    int v8 = 136315394;
    int v9 = "-[CESRSpeechProfileAdmin endEvaluation:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@deactivated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

- (int64_t)beginEvaluationWithSerializedSets:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__CESRSpeechProfileAdmin_beginEvaluationWithSerializedSets___block_invoke;
  v8[3] = &unk_1E61C3550;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  int64_t v6 = [(CESRSpeechProfileAdmin *)self _synchronouslyWrapRequest:v8];

  return v6;
}

uint64_t __60__CESRSpeechProfileAdmin_beginEvaluationWithSerializedSets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) beginEvaluationWithSerializedSets:*(void *)(a1 + 40) completion:a2];
}

- (void)beginEvaluationWithSerializedSets:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[CESRUtilities isCustomerInstall])
  {
    int v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CESRSpeechProfileAdmin beginEvaluationWithSerializedSets:completion:]";
      _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = *MEMORY[0x1E4F4E380];
    __int16 v10 = *MEMORY[0x1E4F4E380];
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[CESRSpeechProfileAdmin beginEvaluationWithSerializedSets:completion:]";
        _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation.", buf, 0xCu);
      }
      adminService = self->_adminService;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __71__CESRSpeechProfileAdmin_beginEvaluationWithSerializedSets_completion___block_invoke;
      v12[3] = &unk_1E61C3528;
      id v13 = v7;
      [(CESRSpeechProfileAdminService *)adminService beginEvaluationWithSerializedSets:v6 completion:v12];

      goto LABEL_12;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CESRSpeechProfileAdmin beginEvaluationWithSerializedSets:completion:]";
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s serializedSets cannot be nil.", buf, 0xCu);
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  if (v7) {
LABEL_11:
  }
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 3);
LABEL_12:
}

uint64_t __71__CESRSpeechProfileAdmin_beginEvaluationWithSerializedSets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    id v5 = @"NOT ";
    if (a2 == 1) {
      id v5 = &stru_1F1291150;
    }
    int v8 = 136315394;
    id v9 = "-[CESRSpeechProfileAdmin beginEvaluationWithSerializedSets:completion:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

- (int64_t)beginEvaluation:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__CESRSpeechProfileAdmin_beginEvaluation___block_invoke;
  v8[3] = &unk_1E61C3550;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  int64_t v6 = [(CESRSpeechProfileAdmin *)self _synchronouslyWrapRequest:v8];

  return v6;
}

uint64_t __42__CESRSpeechProfileAdmin_beginEvaluation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) beginEvaluation:*(void *)(a1 + 40) completion:a2];
}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[CESRUtilities isCustomerInstall])
  {
    int v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]";
      _os_log_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = *MEMORY[0x1E4F4E380];
    __int16 v10 = *MEMORY[0x1E4F4E380];
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]";
        _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Submitting request to begin evaluation.", buf, 0xCu);
      }
      adminService = self->_adminService;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__CESRSpeechProfileAdmin_beginEvaluation_completion___block_invoke;
      v12[3] = &unk_1E61C3528;
      id v13 = v7;
      [(CESRSpeechProfileAdminService *)adminService beginEvaluation:v6 completion:v12];

      goto LABEL_12;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]";
      _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Profile cannot be nil.", buf, 0xCu);
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  if (v7) {
LABEL_11:
  }
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 3);
LABEL_12:
}

uint64_t __53__CESRSpeechProfileAdmin_beginEvaluation_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    id v5 = @"NOT ";
    if (a2 == 1) {
      id v5 = &stru_1F1291150;
    }
    int v8 = 136315394;
    id v9 = "-[CESRSpeechProfileAdmin beginEvaluation:completion:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  adminService = self->_adminService;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__CESRSpeechProfileAdmin_rebuildSpeechProfileForUserId_completion___block_invoke;
  v9[3] = &unk_1E61C3528;
  id v10 = v6;
  id v8 = v6;
  [(CESRSpeechProfileAdminService *)adminService rebuildSpeechProfileForUserId:a3 completion:v9];
}

uint64_t __67__CESRSpeechProfileAdmin_rebuildSpeechProfileForUserId_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t))a4;
  if (+[CESRUtilities isCustomerInstall])
  {
    uint64_t v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[CESRSpeechProfileAdmin triggerMaintenance:completion:]";
      _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Not supported on customer install.", buf, 0xCu);
    }
    if (v6) {
      v6[2](v6, 3);
    }
  }
  else
  {
    adminService = self->_adminService;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__CESRSpeechProfileAdmin_triggerMaintenance_completion___block_invoke;
    v9[3] = &unk_1E61C3528;
    id v10 = v6;
    [(CESRSpeechProfileAdminService *)adminService triggerMaintenance:v4 completion:v9];
  }
}

uint64_t __56__CESRSpeechProfileAdmin_triggerMaintenance_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (CESRSpeechProfileAdmin)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use +makeAdmin factory method" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CESRSpeechProfileAdmin)initWithAdminService:(id)a3 timeout:(double)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CESRSpeechProfileAdmin;
  __int16 v11 = [(CESRSpeechProfileAdmin *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_adminService, a3);
    v12->_timeout = a4;
    objc_storeStrong((id *)&v12->_queue, a5);
  }

  return v12;
}

- (CESRSpeechProfileAdmin)initWithAdminService:(id)a3 queue:(id)a4
{
  return [(CESRSpeechProfileAdmin *)self initWithAdminService:a3 timeout:a4 queue:30.0];
}

+ (id)makeAdmin
{
  id v2 = +[CESRSpeechProfileAdminFactory sharedAdminFactory];
  uint64_t v3 = [v2 admin];

  return v3;
}

@end