@interface IMDSpotlightClientStateManager
+ (id)sharedManager;
- (id)_timeoutError;
- (id)currentClientStateWithError:(id *)a3;
- (id)description;
- (void)_currentClientStateWithCompletion:(id)a3;
- (void)_migrateClientStateFromManager:(id)a3;
- (void)_saveClientState:(id)a3 withCompletion:(id)a4;
- (void)currentClientStateWithCompletion:(id)a3;
- (void)saveClientState:(id)a3;
- (void)saveClientState:(id)a3 withCompletion:(id)a4;
- (void)saveClientState:(id)a3 withError:(id *)a4;
@end

@implementation IMDSpotlightClientStateManager

+ (id)sharedManager
{
  if (qword_1E9AF7FC8 != -1) {
    dispatch_once(&qword_1E9AF7FC8, &unk_1F084CBC0);
  }
  v2 = (void *)qword_1E9AF8008;
  return v2;
}

- (void)_migrateClientStateFromManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFB65E18;
  v6[3] = &unk_1E5F8D508;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  sub_1AFBD5444(v6);
}

- (id)currentClientStateWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (qword_1E9AF7FD8 != -1) {
    dispatch_once(&qword_1E9AF7FD8, &unk_1F084C360);
  }
  if (*(double *)&qword_1E9AF8020 > 0.0)
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = qword_1E9AF8020;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_DEFAULT, "Beginning simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }

    usleep((*(double *)&qword_1E9AF8020 * 1000000.0));
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = qword_1E9AF8020;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_DEFAULT, "Finished simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1AFB662D0;
  v25 = sub_1AFB662E0;
  id v26 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1AFB662D0;
  v20 = sub_1AFB662E0;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB662E8;
  v12[3] = &unk_1E5F8E598;
  p_long long buf = &buf;
  v15 = &v16;
  v8 = v7;
  v13 = v8;
  [(IMDSpotlightClientStateManager *)self _currentClientStateWithCompletion:v12];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    if (a3)
    {
      [(IMDSpotlightClientStateManager *)self _timeoutError];
      id v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    if (a3) {
      *a3 = (id) v17[5];
    }
    id v10 = *(id *)(*((void *)&buf + 1) + 40);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (void)currentClientStateWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFB66418;
  v6[3] = &unk_1E5F8E5E8;
  id v7 = v4;
  id v5 = v4;
  [(IMDSpotlightClientStateManager *)self _currentClientStateWithCompletion:v6];
}

- (void)_currentClientStateWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Not yet implemented" userInfo:0];
  objc_exception_throw(v4);
}

- (void)saveClientState:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = 0;
  [(IMDSpotlightClientStateManager *)self saveClientState:v4 withError:&v7];
  id v5 = v7;
  if (v5)
  {
    v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412802;
      dispatch_time_t v9 = self;
      __int16 v10 = 2112;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_ERROR, "Failed to save client state to %@ with error: %@ client state: %@", buf, 0x20u);
    }
  }
}

- (id)_timeoutError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v3 = *MEMORY[0x1E4F6E338];
  uint64_t v7 = *MEMORY[0x1E4F28228];
  v8[0] = @"Timed out talking to Spotlight.";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = (void *)[v2 initWithDomain:v3 code:2 userInfo:v4];

  return v5;
}

- (void)saveClientState:(id)a3 withError:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (qword_1E9AF7FE0 != -1) {
    dispatch_once(&qword_1E9AF7FE0, &unk_1F084C380);
  }
  if (*(double *)&qword_1E9AF8028 > 0.0)
  {
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = qword_1E9AF8028;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_DEFAULT, "Beginning simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }

    usleep((*(double *)&qword_1E9AF8028 * 1000000.0));
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = qword_1E9AF8028;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_DEFAULT, "Finished simulated hang of %f seconds", (uint8_t *)&buf, 0xCu);
    }
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1AFB662D0;
  v22 = sub_1AFB662E0;
  id v23 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = sub_1AFB669D0;
  uint64_t v16 = &unk_1E5F8E610;
  p_long long buf = &buf;
  __int16 v10 = v9;
  v17 = v10;
  [(IMDSpotlightClientStateManager *)self _saveClientState:v6 withCompletion:&v13];
  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    if (a4)
    {
      id v12 = [(IMDSpotlightClientStateManager *)self _timeoutError];
LABEL_14:
      *a4 = v12;
    }
  }
  else if (a4)
  {
    id v12 = *(id *)(*((void *)&buf + 1) + 40);
    goto LABEL_14;
  }

  _Block_object_dispose(&buf, 8);
}

- (void)saveClientState:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = sub_1AFB66AD4;
  v8[3] = &unk_1E5F8E660;
  id v9 = v6;
  id v7 = v6;
  [(IMDSpotlightClientStateManager *)self _saveClientState:a3 withCompletion:v8];
}

- (void)_saveClientState:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Not yet implemented" userInfo:0];
  objc_exception_throw(v7);
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  return v6;
}

@end