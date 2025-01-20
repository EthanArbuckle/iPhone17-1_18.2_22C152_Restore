@interface CKVocabularyAdminEventSimulator
- (CKVocabularyAdminEventSimulator)initWithAdminService:(id)a3;
- (CKVocabularyAdminEventSimulator)initWithAdminService:(id)a3 timeout:(double)a4;
- (int64_t)finish;
- (void)dealloc;
- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5;
@end

@implementation CKVocabularyAdminEventSimulator

- (void).cxx_destruct
{
}

- (void)handleTask:(unsigned __int16)a3 reason:(unsigned __int16)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  adminService = self->_adminService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__CKVocabularyAdminEventSimulator_handleTask_reason_completion___block_invoke;
  v11[3] = &unk_1E5CF9EC0;
  __int16 v13 = v6;
  id v12 = v8;
  id v10 = v8;
  [(CKVAdminService *)adminService handleTask:v6 reason:v5 completion:v11];
}

uint64_t __64__CKVocabularyAdminEventSimulator_handleTask_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CKLogContextVocabulary;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v4 = *(unsigned __int16 *)(a1 + 40);
      uint64_t v5 = v3;
      uint64_t v6 = CKVTaskIdDescription(v4);
      int v14 = 136315394;
      v15 = "-[CKVocabularyAdminEventSimulator handleTask:reason:completion:]_block_invoke";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1A77B3000, v5, OS_LOG_TYPE_INFO, "%s Successfuly handle %@ simulated event.", (uint8_t *)&v14, 0x16u);
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result)
    {
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v10 = *(unsigned __int16 *)(a1 + 40);
      v11 = v3;
      id v12 = CKVTaskIdDescription(v10);
      __int16 v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
      int v14 = 136315650;
      v15 = "-[CKVocabularyAdminEventSimulator handleTask:reason:completion:]_block_invoke";
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_error_impl(&dword_1A77B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to handle %@ simulated event due to service error result: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t result = *(void *)(a1 + 32);
    if (result)
    {
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (int64_t)finish
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 2;
  adminService = self->_adminService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__CKVocabularyAdminEventSimulator_finish__block_invoke;
  v11[3] = &unk_1E5CF9E48;
  __int16 v13 = &v14;
  void v11[4] = self;
  uint64_t v5 = v3;
  id v12 = v5;
  [(CKVAdminService *)adminService finishEventSimulation:v11];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
  if (dispatch_group_wait(v5, v6))
  {
    v7 = (id)CKLogContextVocabulary;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_timeout];
      *(_DWORD *)buf = 136315394;
      v19 = "-[CKVocabularyAdminEventSimulator finish]";
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_1A77B3000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service to finish simulation. timeout: %@ seconds", buf, 0x16u);
    }
  }
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __41__CKVocabularyAdminEventSimulator_finish__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = CKLogContextVocabulary;
  if (a2 == 1)
  {
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[CKVocabularyAdminEventSimulator finish]_block_invoke";
      _os_log_impl(&dword_1A77B3000, v3, OS_LOG_TYPE_INFO, "%s Successfuly finish event simulation.", (uint8_t *)&v8, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
    dispatch_time_t v6 = v3;
    v7 = [v5 numberWithInteger:a2];
    int v8 = 136315394;
    v9 = "-[CKVocabularyAdminEventSimulator finish]_block_invoke";
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_error_impl(&dword_1A77B3000, v6, OS_LOG_TYPE_ERROR, "%s Failed to finish event simulation due to service error result: %@", (uint8_t *)&v8, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)dealloc
{
  if (!self->_simulationFinished)
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"[CKVocabularyAdminEventSimulator finish] was not called" userInfo:MEMORY[0x1E4F1CC08]];
    objc_exception_throw(v2);
  }
  v3.receiver = self;
  v3.super_class = (Class)CKVocabularyAdminEventSimulator;
  [(CKVocabularyAdminEventSimulator *)&v3 dealloc];
}

- (CKVocabularyAdminEventSimulator)initWithAdminService:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKVocabularyAdminEventSimulator;
  int v8 = [(CKVocabularyAdminEventSimulator *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_adminService, a3);
    if (!v9->_adminService)
    {
      __int16 v10 = 0;
      goto LABEL_6;
    }
    v9->_timeout = a4;
    v9->_simulationFinished = 0;
  }
  __int16 v10 = v9;
LABEL_6:

  return v10;
}

- (CKVocabularyAdminEventSimulator)initWithAdminService:(id)a3
{
  return [(CKVocabularyAdminEventSimulator *)self initWithAdminService:a3 timeout:30.0];
}

@end