@interface _DASExtension
- (NSDate)startTime;
- (OS_os_log)log;
- (OS_os_transaction)transaction;
- (_DASActivity)activity;
- (_DASExtension)init;
- (_DASExtensionRemoteContext)context;
- (_DASExtensionRunner)runner;
- (void)_activityCompletedWithStatus:(unsigned __int8)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)runner:(id)a3 performActivity:(id)a4;
- (void)setActivity:(id)a3;
- (void)setContext:(id)a3;
- (void)setLog:(id)a3;
- (void)setRunner:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTransaction:(id)a3;
- (void)suspend;
@end

@implementation _DASExtension

- (_DASExtension)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DASExtension;
  v2 = [(_DASExtension *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.duetactivityscheduler", "extension");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_DASExtension *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Beginning request with extension context %@", (uint8_t *)&v6, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_DASExtension *)self setContext:v4];
  }
}

- (void)_activityCompletedWithStatus:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = [(_DASExtension *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B578B000, v5, OS_LOG_TYPE_DEFAULT, "Extension is finished.", buf, 2u);
  }

  int v6 = [(_DASExtension *)self context];
  id v11 = 0;
  id v7 = [v6 hostContextWithError:&v11];
  id v8 = v11;

  if (!v7 || v8)
  {
    v9 = [(_DASExtension *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1B578B000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get remote context with error %@", buf, 0xCu);
    }
  }
  else
  {
    [v7 activityCompletedWithStatus:v3];
  }
  transaction = self->_transaction;
  self->_transaction = 0;
}

- (void)runner:(id)a3 performActivity:(id)a4
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DASExtension *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    *(void *)v21 = v7;
    _os_log_impl(&dword_1B578B000, v8, OS_LOG_TYPE_DEFAULT, "Extension performing activity: %@", (uint8_t *)&v20, 0xCu);
  }

  v9 = (void *)os_transaction_create();
  [(_DASExtension *)self setTransaction:v9];

  v10 = [MEMORY[0x1E4F1C9C8] date];
  [(_DASExtension *)self setStartTime:v10];

  [(_DASExtension *)self setRunner:v6];
  id v11 = (void *)[v7 copy];
  [(_DASExtension *)self setActivity:v11];

  v12 = [(_DASExtension *)self runner];
  int v13 = [v12 prepareForActivity:v7];

  if (v13)
  {
    uint64_t v14 = [(_DASExtension *)self runner];
    uint64_t v15 = [v14 start];
  }
  else
  {
    uint64_t v14 = [(_DASExtension *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_DASExtension runner:performActivity:]((uint64_t)v6, v7, v14);
    }
    uint64_t v15 = 3;
  }

  v16 = [MEMORY[0x1E4F1C9C8] date];
  [v16 timeIntervalSinceDate:self->_startTime];
  uint64_t v18 = v17;
  v19 = [(_DASExtension *)self log];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109376;
    v21[0] = v15;
    LOWORD(v21[1]) = 2048;
    *(void *)((char *)&v21[1] + 2) = v18;
    _os_log_impl(&dword_1B578B000, v19, OS_LOG_TYPE_DEFAULT, "Extension complete (%hhu), time elapsed: %f s", (uint8_t *)&v20, 0x12u);
  }

  [(_DASExtension *)self _activityCompletedWithStatus:v15];
}

- (void)suspend
{
  uint64_t v3 = [(_DASExtension *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B578B000, v3, OS_LOG_TYPE_DEFAULT, "Request for extension to finish early.", v5, 2u);
  }

  id v4 = [(_DASExtension *)self runner];
  [v4 stop];

  [(_DASExtension *)self _activityCompletedWithStatus:2];
}

- (_DASExtensionRemoteContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_DASExtensionRunner)runner
{
  return self->_runner;
}

- (void)setRunner:(id)a3
{
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_runner, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)runner:(NSObject *)a3 performActivity:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a2 name];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B578B000, a3, OS_LOG_TYPE_ERROR, "Unable to set up extension runner %@ for activity %@", (uint8_t *)&v6, 0x16u);
}

@end