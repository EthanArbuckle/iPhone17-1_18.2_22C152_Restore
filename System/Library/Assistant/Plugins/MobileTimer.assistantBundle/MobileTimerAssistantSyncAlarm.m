@interface MobileTimerAssistantSyncAlarm
- (MTAlarmManager)alarmManager;
- (MobileTimerAssistantSyncAlarm)init;
- (NSMutableArray)domainObjects;
- (NSMutableArray)postAnchors;
- (NSString)finalAnchor;
- (id)calculateFinalAnchorForAlarms:(id)a3;
- (void)_beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)_getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)populateAnchorsFromAlarms:(id)a3 validity:(id)a4 beginInfo:(id)a5;
- (void)setAlarmManager:(id)a3;
- (void)setDomainObjects:(id)a3;
- (void)setFinalAnchor:(id)a3;
- (void)setPostAnchors:(id)a3;
- (void)syncDidEnd;
@end

@implementation MobileTimerAssistantSyncAlarm

- (void)dealloc
{
  [(MobileTimerAssistantSyncAlarm *)self syncDidEnd];
  v3.receiver = self;
  v3.super_class = (Class)MobileTimerAssistantSyncAlarm;
  [(MobileTimerAssistantSyncAlarm *)&v3 dealloc];
}

- (MobileTimerAssistantSyncAlarm)init
{
  v6.receiver = self;
  v6.super_class = (Class)MobileTimerAssistantSyncAlarm;
  v2 = [(MobileTimerAssistantSyncAlarm *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = (MTAlarmManager *)v3;
  }
  return v2;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = MTLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_116C4(v14, v15, v16, v17, v18, v19, v20, v21);
  }

  [(MobileTimerAssistantSyncAlarm *)self _beginSyncWithAnchor:v13 validity:v12 forKey:v11 beginInfo:v10];
  v22 = MTLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_1164C(v22, v23, v24, v25, v26, v27, v28, v29);
  }
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_117B4(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(MobileTimerAssistantSyncAlarm *)self _getChangeAfterAnchor:v7 changeInfo:v6];
  uint64_t v16 = MTLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1173C(v16, v17, v18, v19, v20, v21, v22, v23);
  }
}

- (void)syncDidEnd
{
  finalAnchor = self->_finalAnchor;
  self->_finalAnchor = 0;

  postAnchors = self->_postAnchors;
  self->_postAnchors = 0;

  domainObjects = self->_domainObjects;
  self->_domainObjects = 0;
}

- (void)_beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (([v12 isEqualToString:@"com.apple.alarm.label"] & 1) == 0) {
    NSLog(@"Unexpected key: %@", v12);
  }
  [(MobileTimerAssistantSyncAlarm *)self syncDidEnd];
  uint64_t v14 = objc_opt_new();
  uint64_t v15 = MTLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[MobileTimerAssistantSyncAlarm _beginSyncWithAnchor:validity:forKey:beginInfo:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  uint64_t v16 = [v14 alarms];
  objc_initWeak(&location, self);
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v31 = sub_CB7C;
  v32 = sub_CB8C;
  id v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_CB94;
  v25[3] = &unk_18630;
  objc_copyWeak(&v28, &location);
  uint64_t v27 = buf;
  uint64_t v18 = v17;
  uint64_t v26 = v18;
  id v19 = [v16 addSuccessBlock:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_CC90;
  v22[3] = &unk_188A0;
  objc_copyWeak(&v24, &location);
  uint64_t v20 = v18;
  uint64_t v23 = v20;
  id v21 = [v16 addFailureBlock:v22];
  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  [(MobileTimerAssistantSyncAlarm *)self populateAnchorsFromAlarms:*(void *)(*(void *)&buf[8] + 40) validity:v11 beginInfo:v13];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)_getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  id v7 = [(MobileTimerAssistantSyncAlarm *)self postAnchors];
  id v8 = [v7 count];
  uint64_t v9 = [(MobileTimerAssistantSyncAlarm *)self domainObjects];
  id v10 = [v9 count];

  if (v8 != v10)
  {
    id v11 = [(MobileTimerAssistantSyncAlarm *)self postAnchors];
    id v12 = [v11 count];
    id v13 = [(MobileTimerAssistantSyncAlarm *)self domainObjects];
    NSLog(@"Unexpected array length mismatch! postAnchors.count: %lu, domainObjects.count: %lu", v12, [v13 count]);
  }
  uint64_t v14 = [(MobileTimerAssistantSyncAlarm *)self domainObjects];
  if (![v14 count])
  {

    goto LABEL_9;
  }
  uint64_t v15 = [(MobileTimerAssistantSyncAlarm *)self finalAnchor];
  unsigned __int8 v16 = [v15 isEqualToString:v24];

  if (v16) {
    goto LABEL_9;
  }
  if (!v24)
  {
    uint64_t v19 = 0;
    goto LABEL_11;
  }
  dispatch_semaphore_t v17 = [(MobileTimerAssistantSyncAlarm *)self postAnchors];
  uint64_t v18 = (uint64_t)[v17 indexOfObject:v24];

  if (v18 >= 0x7FFFFFFFFFFFFFFELL)
  {
LABEL_9:
    [v6 setObject:0];
    [v6 setPostAnchor:v24];
    goto LABEL_12;
  }
  uint64_t v19 = v18 + 1;
LABEL_11:
  uint64_t v20 = [(MobileTimerAssistantSyncAlarm *)self domainObjects];
  id v21 = [v20 objectAtIndex:v19];
  [v6 setObject:v21];

  uint64_t v22 = [(MobileTimerAssistantSyncAlarm *)self postAnchors];
  uint64_t v23 = [v22 objectAtIndex:v19];
  [v6 setPostAnchor:v23];

LABEL_12:
}

- (id)calculateFinalAnchorForAlarms:(id)a3
{
  id v3 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_CFE8;
  id v11 = &unk_188C8;
  id v12 = (id)objc_opt_new();
  id v4 = v12;
  objc_msgSend(v3, "na_each:", &v8);

  id v5 = [v4 hash];
  id v6 = +[NSString stringWithFormat:@"%lu", v5, v8, v9, v10, v11];

  return v6;
}

- (void)populateAnchorsFromAlarms:(id)a3 validity:(id)a4 beginInfo:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MobileTimerAssistantSyncAlarm *)self calculateFinalAnchorForAlarms:v28];
  [(MobileTimerAssistantSyncAlarm *)self setFinalAnchor:v10];

  id v11 = [(MobileTimerAssistantSyncAlarm *)self finalAnchor];
  unsigned __int8 v12 = [v11 isEqualToString:v8];

  if ((v12 & 1) == 0)
  {
    id v13 = [(MobileTimerAssistantSyncAlarm *)self finalAnchor];
    [v9 resetWithValidity:v13];

    id v14 = [v28 count];
    if (v14)
    {
      unint64_t v15 = (unint64_t)v14;
      id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v14];
      [(MobileTimerAssistantSyncAlarm *)self setPostAnchors:v16];

      id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v15];
      [(MobileTimerAssistantSyncAlarm *)self setDomainObjects:v17];

      for (uint64_t i = 0; i != v15; ++i)
      {
        uint64_t v19 = [v28 objectAtIndexedSubscript:i];
        id v20 = objc_alloc_init((Class)SAAlarmObject);
        id v21 = [v19 alarmURL];
        [v20 setIdentifier:v21];

        uint64_t v22 = [(MobileTimerAssistantSyncAlarm *)self domainObjects];
        [v22 addObject:v20];
      }
      if (v15 >= 2)
      {
        for (uint64_t j = 1; j != v15; ++j)
        {
          id v24 = [(MobileTimerAssistantSyncAlarm *)self postAnchors];
          uint64_t v25 = +[NSString stringWithFormat:@"%ld", j];
          [v24 addObject:v25];
        }
      }
      uint64_t v26 = [(MobileTimerAssistantSyncAlarm *)self postAnchors];
      uint64_t v27 = [(MobileTimerAssistantSyncAlarm *)self finalAnchor];
      [v26 addObject:v27];
    }
  }
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (NSString)finalAnchor
{
  return self->_finalAnchor;
}

- (void)setFinalAnchor:(id)a3
{
}

- (NSMutableArray)postAnchors
{
  return self->_postAnchors;
}

- (void)setPostAnchors:(id)a3
{
}

- (NSMutableArray)domainObjects
{
  return self->_domainObjects;
}

- (void)setDomainObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainObjects, 0);
  objc_storeStrong((id *)&self->_postAnchors, 0);
  objc_storeStrong((id *)&self->_finalAnchor, 0);

  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end