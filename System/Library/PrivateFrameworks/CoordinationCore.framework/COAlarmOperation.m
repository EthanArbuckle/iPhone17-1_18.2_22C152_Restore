@interface COAlarmOperation
- (BOOL)performOperationWithMappedAlarms:(id)a3;
- (MTAlarm)alarm;
- (id)completion;
- (id)initForAdding:(id)a3 completion:(id)a4;
- (id)initForRemoving:(id)a3 completion:(id)a4;
- (id)initForUpdating:(id)a3 completion:(id)a4;
- (int64_t)type;
@end

@implementation COAlarmOperation

- (id)initForAdding:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmOperation;
  v8 = [(COAlarmOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 0;
    uint64_t v10 = [v6 copy];
    alarm = v9->_alarm;
    v9->_alarm = (MTAlarm *)v10;

    uint64_t v12 = [v7 copy];
    id completion = v9->_completion;
    v9->_id completion = (id)v12;
  }
  return v9;
}

- (id)initForUpdating:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmOperation;
  v8 = [(COAlarmOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 1;
    uint64_t v10 = [v6 copy];
    alarm = v9->_alarm;
    v9->_alarm = (MTAlarm *)v10;

    uint64_t v12 = [v7 copy];
    id completion = v9->_completion;
    v9->_id completion = (id)v12;
  }
  return v9;
}

- (id)initForRemoving:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COAlarmOperation;
  v8 = [(COAlarmOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = 2;
    uint64_t v10 = [v6 copy];
    alarm = v9->_alarm;
    v9->_alarm = (MTAlarm *)v10;

    uint64_t v12 = [v7 copy];
    id completion = v9->_completion;
    v9->_id completion = (id)v12;
  }
  return v9;
}

- (BOOL)performOperationWithMappedAlarms:(id)a3
{
  id v4 = a3;
  v5 = [(COAlarmOperation *)self alarm];
  id v6 = [v5 alarmID];
  int64_t v7 = [(COAlarmOperation *)self type];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = v7;
  v9 = [v4 objectForKey:v6];

  if (v9)
  {
    if (v8 == 2)
    {
      uint64_t v10 = [v5 alarmID];
      [v4 removeObjectForKey:v10];
LABEL_6:

      BOOL v13 = 1;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v10 = (void *)[v5 mutableCopy];
    v11 = [MEMORY[0x263EFF910] now];
    [v10 setLastModifiedDate:v11];

    uint64_t v12 = [v10 alarmID];
    [v4 setObject:v10 forKey:v12];

    goto LABEL_6;
  }
  v14 = COCoreLogForCategory(2);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    [(COAlarmOperation *)v5 performOperationWithMappedAlarms:v14];
  }

  objc_super v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
  v16 = [(COAlarmOperation *)self completion];
  ((void (**)(void, void *))v16)[2](v16, v15);

  BOOL v13 = 0;
LABEL_10:

  return v13;
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (id)completion
{
  return self->_completion;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_alarm, 0);
}

- (void)performOperationWithMappedAlarms:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [a1 alarmID];
  int v6 = 134218242;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_2217C1000, a3, OS_LOG_TYPE_ERROR, "Operation (%ld) didn't find alarm %@!", (uint8_t *)&v6, 0x16u);
}

@end