@interface ADClockService
+ (id)sharedService;
+ (void)initialize;
- (ADClockService)init;
- (ADRemoteTimerManager)remoteTimerManager;
- (MTTimerManagerIntentSupport)timerManagerProxyForIntentSupport;
- (SOClockAlarmManager)localAlarmManager;
- (SOClockTimerManager)localTimerManager;
- (id)_mergedClockAlarmSnapshot;
- (id)_mergedClockTimerSnapshot;
- (id)addTimer:(id)a3;
- (id)dismissTimerWithIdentifier:(id)a3;
- (id)queue;
- (id)removeTimer:(id)a3;
- (id)sleepTimersWithState:(unint64_t)a3;
- (id)timers;
- (id)updateTimer:(id)a3;
- (void)_addTimer:(id)a3 completion:(id)a4;
- (void)_dismissFiringItemsWithOptions:(unint64_t)a3;
- (void)_enumerateAlarmSnapshotsUsingBlock:(id)a3;
- (void)_enumerateAlarmsUsingBlock:(id)a3;
- (void)_enumerateTimerSnapshotsUsingBlock:(id)a3;
- (void)_enumerateTimersUsingBlock:(id)a3;
- (void)_fetchTimerWithID:(id)a3 completion:(id)a4;
- (void)_fetchTimersWithCompletion:(id)a3;
- (void)_mutateMergedClockTimerSnapshotUsingBlock:(id)a3;
- (void)_performBlock:(id)a3;
- (void)_removeTimer:(id)a3 completion:(id)a4;
- (void)_removeTimerWithID:(id)a3 completion:(id)a4;
- (void)_updateTimer:(id)a3 completion:(id)a4;
- (void)_updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5;
- (void)getFiringStatesWithCompletion:(id)a3;
- (void)getSnapshotsWithCompletion:(id)a3;
- (void)performBlock:(id)a3;
- (void)removeTimerWithID:(id)a3 completion:(id)a4;
- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6;
- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5;
@end

@implementation ADClockService

- (id)dismissTimerWithIdentifier:(id)a3
{
  return 0;
}

- (id)removeTimer:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[ADClockService(IntentSupport) removeTimer:]";
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s timerToRemove = %@", buf, 0x16u);
  }
  id v6 = off_100580FD0();
  v13 = self;
  id v14 = v4;
  v7 = (id (__cdecl *)())off_100580FD8;
  id v8 = v4;
  v9 = objc_msgSend(v7(), "immediateScheduler", _NSConcreteStackBlock, 3221225472, sub_10010C1E8, &unk_100502588, v13);
  v10 = [v6 futureWithBlock:&v12 scheduler:v9];

  return v10;
}

- (id)updateTimer:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ADClockService(IntentSupport) updateTimer:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s timerToUpdate = %@", buf, 0x16u);
  }
  id v6 = off_100580FD0();
  __int16 v17 = self;
  id v18 = v4;
  v7 = off_100580FD8;
  id v8 = v4;
  v13 = objc_msgSend((id)((uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v7)(v8, v9, v10, v11, v12), "immediateScheduler", _NSConcreteStackBlock, 3221225472, sub_10010D110, &unk_100502588, v17);
  id v14 = [v6 futureWithBlock:&v16 scheduler:v13];

  return v14;
}

- (id)addTimer:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[ADClockService(IntentSupport) addTimer:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s timerToAdd = %@", buf, 0x16u);
  }
  id v6 = off_100580FD0();
  __int16 v17 = self;
  id v18 = v4;
  v7 = off_100580FD8;
  id v8 = v4;
  v13 = objc_msgSend((id)((uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v7)(v8, v9, v10, v11, v12), "immediateScheduler", _NSConcreteStackBlock, 3221225472, sub_10010E628, &unk_100502588, v17);
  id v14 = [v6 futureWithBlock:&v16 scheduler:v13];

  return v14;
}

- (id)sleepTimersWithState:(unint64_t)a3
{
  id v5 = off_100580FD0();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10010ECA8;
  v9[3] = &unk_100502510;
  v9[4] = self;
  v9[5] = a3;
  id v6 = [off_100580FD8() immediateScheduler];
  v7 = [v5 futureWithBlock:v9 scheduler:v6];

  return v7;
}

- (id)timers
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[ADClockService(IntentSupport) timers]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = off_100580FD0();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10010F158;
  v8[3] = &unk_1005024E8;
  v8[4] = self;
  id v5 = [off_100580FD8() immediateScheduler];
  id v6 = [v4 futureWithBlock:v8 scheduler:v5];

  return v6;
}

- (MTTimerManagerIntentSupport)timerManagerProxyForIntentSupport
{
  if (AFIsATV()) {
    v3 = 0;
  }
  else {
    v3 = self;
  }
  return (MTTimerManagerIntentSupport *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTimerManager, 0);
  objc_storeStrong((id *)&self->_localAlarmManager, 0);
  objc_storeStrong((id *)&self->_remoteTimerManager, 0);
  objc_storeStrong((id *)&self->_mergedClockTimerSnapshot, 0);
  objc_storeStrong((id *)&self->_mergedClockAlarmSnapshot, 0);
  objc_storeStrong((id *)&self->_remoteClockTimerSnapshotsByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteClockAlarmSnapshotsByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_localClockTimerSnapshot, 0);
  objc_storeStrong((id *)&self->_localClockAlarmSnapshot, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (SOClockTimerManager)localTimerManager
{
  return self->_localTimerManager;
}

- (SOClockAlarmManager)localAlarmManager
{
  return self->_localAlarmManager;
}

- (ADRemoteTimerManager)remoteTimerManager
{
  return self->_remoteTimerManager;
}

- (void)_dismissFiringItemsWithOptions:(unint64_t)a3
{
  unint64_t v4 = a3 & 1;
  unint64_t v5 = a3 & 2;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[ADClockService _dismissFiringItemsWithOptions:]";
    __int16 v11 = 1024;
    int v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5 >> 1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s includingAlarms = %d, includingTimers = %d", buf, 0x18u);
  }
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100360500;
    v8[3] = &unk_10050E138;
    v8[4] = self;
    [(ADClockService *)self _performBlock:v8];
  }
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100360A24;
    v7[3] = &unk_10050E138;
    v7[4] = self;
    [(ADClockService *)self _performBlock:v7];
  }
}

- (void)_removeTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADClockService _removeTimer:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerToRemove = %@", buf, 0x16u);
  }
  uint64_t v9 = [(SOClockTimerManager *)self->_localTimerManager removeTimer:v6];
  if (v7)
  {
    uint64_t v10 = self->_queue;
    __int16 v11 = [v6 timerID];
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1003614C8;
    v23[3] = &unk_10050E028;
    int v12 = v10;
    v24 = v12;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = v11;
    id v25 = v13;
    id v14 = v6;
    id v26 = v14;
    id v15 = v7;
    id v27 = v15;
    uint64_t v16 = [v9 addSuccessBlock:v23];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003615A0;
    v19[3] = &unk_10050DF38;
    id v20 = v14;
    __int16 v17 = v12;
    __int16 v21 = v17;
    id v22 = v15;
    id v18 = [v16 addFailureBlock:v19];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_removeTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[ADClockService _removeTimerWithID:completion:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerID = %@", buf, 0x16u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100361B3C;
  v11[3] = &unk_10050DFB0;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(ADClockService *)self _fetchTimerWithID:v9 completion:v11];
}

- (void)removeTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100361E14;
  block[3] = &unk_10050E1D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_updateTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADClockService _updateTimer:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerToUpdate = %@", buf, 0x16u);
  }
  id v9 = [(SOClockTimerManager *)self->_localTimerManager updateTimer:v6];
  if (v7)
  {
    id v10 = self->_queue;
    __int16 v11 = [v6 timerID];
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1003620E4;
    v23[3] = &unk_10050E028;
    id v12 = v10;
    v24 = v12;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = v11;
    id v25 = v13;
    id v14 = v7;
    id v27 = v14;
    id v15 = v6;
    id v26 = v15;
    __int16 v16 = [v9 addSuccessBlock:v23];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003621BC;
    v19[3] = &unk_10050DF38;
    id v20 = v15;
    id v17 = v12;
    __int16 v21 = v17;
    id v22 = v14;
    id v18 = [v16 addFailureBlock:v19];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v21 = "-[ADClockService _updateTimerWithID:changes:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s timerID = %@, changes = %@", buf, 0x20u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100362780;
  v15[3] = &unk_10050DF88;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [(ADClockService *)self _fetchTimerWithID:v12 completion:v15];
}

- (void)updateTimerWithID:(id)a3 changes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100362D04;
  v15[3] = &unk_10050E228;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_addTimer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADClockService _addTimer:completion:]";
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s timerToAdd = %@", buf, 0x16u);
  }
  id v9 = [(SOClockTimerManager *)self->_localTimerManager addTimer:v6];
  if (v7)
  {
    id v10 = self->_queue;
    __int16 v11 = [v6 timerID];
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100362FD4;
    v23[3] = &unk_10050E028;
    id v12 = v10;
    __int16 v24 = v12;
    objc_copyWeak(&v28, (id *)buf);
    id v13 = v11;
    id v25 = v13;
    id v14 = v7;
    id v27 = v14;
    id v15 = v6;
    id v26 = v15;
    id v16 = [v9 addSuccessBlock:v23];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1003630AC;
    v19[3] = &unk_10050DF38;
    id v20 = v15;
    id v17 = v12;
    __int16 v21 = v17;
    id v22 = v14;
    id v18 = [v16 addFailureBlock:v19];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_fetchTimerWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003635A4;
    v8[3] = &unk_10050DF10;
    id v9 = v6;
    id v10 = v7;
    [(ADClockService *)self _fetchTimersWithCompletion:v8];
  }
}

- (void)_fetchTimersWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = self->_queue;
    id v6 = [(SOClockTimerManager *)self->_localTimerManager timers];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100363870;
    v15[3] = &unk_10050DEC0;
    id v7 = v5;
    id v16 = v7;
    id v8 = v4;
    id v17 = v8;
    id v9 = [v6 addSuccessBlock:v15];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100363920;
    v12[3] = &unk_10050DEE8;
    id v13 = v7;
    id v14 = v8;
    id v10 = v7;
    id v11 = [v9 addFailureBlock:v12];
  }
}

- (id)_mergedClockTimerSnapshot
{
  mergedClockTimerSnapshot = self->_mergedClockTimerSnapshot;
  if (!mergedClockTimerSnapshot)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[ADClockService _mergedClockTimerSnapshot]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Merging local and remote timers...", buf, 0xCu);
    }
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = [(AFClockTimerSnapshot *)self->_localClockTimerSnapshot timersByID];
    if ([v6 count])
    {
      id v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v8 = v7;
        id v9 = [v6 count];
        *(_DWORD *)buf = 136315394;
        id v27 = "-[ADClockService _mergedClockTimerSnapshot]";
        __int16 v28 = 2048;
        id v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Adding %tu timers (local)...", buf, 0x16u);
      }
      [v5 addEntriesFromDictionary:v6];
    }
    remoteClockTimerSnapshotsByDeviceIdentifier = self->_remoteClockTimerSnapshotsByDeviceIdentifier;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100363CD4;
    v24[3] = &unk_10050DE70;
    id v11 = v5;
    id v25 = v11;
    [(NSDictionary *)remoteClockTimerSnapshotsByDeviceIdentifier enumerateKeysAndObjectsUsingBlock:v24];
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    __int16 v21 = sub_100363DEC;
    id v22 = &unk_10050DE98;
    id v12 = v11;
    id v23 = v12;
    id v13 = (AFClockTimerSnapshot *)+[AFClockTimerSnapshot newWithBuilder:&v19];
    id v14 = self->_mergedClockTimerSnapshot;
    self->_mergedClockTimerSnapshot = v13;

    id v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      id v17 = objc_msgSend(v12, "count", v19, v20, v21, v22);
      *(_DWORD *)buf = 136315394;
      id v27 = "-[ADClockService _mergedClockTimerSnapshot]";
      __int16 v28 = 2048;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Merged %tu local and remote timers.", buf, 0x16u);
    }
    mergedClockTimerSnapshot = self->_mergedClockTimerSnapshot;
  }
  return mergedClockTimerSnapshot;
}

- (id)_mergedClockAlarmSnapshot
{
  mergedClockAlarmSnapshot = self->_mergedClockAlarmSnapshot;
  if (!mergedClockAlarmSnapshot)
  {
    id v4 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[ADClockService _mergedClockAlarmSnapshot]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Merging local and remote alarms...", buf, 0xCu);
    }
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = [(AFClockAlarmSnapshot *)self->_localClockAlarmSnapshot alarmsByID];
    if ([v6 count])
    {
      id v7 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        id v8 = v7;
        id v9 = [v6 count];
        *(_DWORD *)buf = 136315394;
        id v27 = "-[ADClockService _mergedClockAlarmSnapshot]";
        __int16 v28 = 2048;
        id v29 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Adding %tu alarms (local)...", buf, 0x16u);
      }
      [v5 addEntriesFromDictionary:v6];
    }
    remoteClockAlarmSnapshotsByDeviceIdentifier = self->_remoteClockAlarmSnapshotsByDeviceIdentifier;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100364138;
    v24[3] = &unk_10050DE20;
    id v11 = v5;
    id v25 = v11;
    [(NSDictionary *)remoteClockAlarmSnapshotsByDeviceIdentifier enumerateKeysAndObjectsUsingBlock:v24];
    id v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    __int16 v21 = sub_100364250;
    id v22 = &unk_10050DE48;
    id v12 = v11;
    id v23 = v12;
    id v13 = (AFClockAlarmSnapshot *)+[AFClockAlarmSnapshot newWithBuilder:&v19];
    id v14 = self->_mergedClockAlarmSnapshot;
    self->_mergedClockAlarmSnapshot = v13;

    id v15 = (void *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      id v17 = objc_msgSend(v12, "count", v19, v20, v21, v22);
      *(_DWORD *)buf = 136315394;
      id v27 = "-[ADClockService _mergedClockAlarmSnapshot]";
      __int16 v28 = 2048;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Merged %tu local and remote alarms.", buf, 0x16u);
    }
    mergedClockAlarmSnapshot = self->_mergedClockAlarmSnapshot;
  }
  return mergedClockAlarmSnapshot;
}

- (void)_enumerateTimersUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100364360;
    v6[3] = &unk_10050DDF8;
    id v7 = v4;
    [(ADClockService *)self _enumerateTimerSnapshotsUsingBlock:v6];
  }
}

- (void)_enumerateTimerSnapshotsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_localClockTimerSnapshot) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
    remoteClockTimerSnapshotsByDeviceIdentifier = self->_remoteClockTimerSnapshotsByDeviceIdentifier;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003644F4;
    v7[3] = &unk_10050DDA8;
    id v8 = v5;
    [(NSDictionary *)remoteClockTimerSnapshotsByDeviceIdentifier enumerateKeysAndObjectsUsingBlock:v7];
  }
}

- (void)_enumerateAlarmsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10036459C;
    v6[3] = &unk_10050DD80;
    id v7 = v4;
    [(ADClockService *)self _enumerateAlarmSnapshotsUsingBlock:v6];
  }
}

- (void)_enumerateAlarmSnapshotsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self->_localClockAlarmSnapshot) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
    remoteClockAlarmSnapshotsByDeviceIdentifier = self->_remoteClockAlarmSnapshotsByDeviceIdentifier;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100364730;
    v7[3] = &unk_10050DD30;
    id v8 = v5;
    [(NSDictionary *)remoteClockAlarmSnapshotsByDeviceIdentifier enumerateKeysAndObjectsUsingBlock:v7];
  }
}

- (void)_mutateMergedClockTimerSnapshotUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    id v5 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADClockService _mutateMergedClockTimerSnapshotUsingBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Begin mutating timer snapshot.", (uint8_t *)&v10, 0xCu);
    }
    id v6 = [(ADClockService *)self _mergedClockTimerSnapshot];
    v4[2](v4, v6);
    id v7 = (AFClockTimerSnapshot *)objc_claimAutoreleasedReturnValue();
    mergedClockTimerSnapshot = self->_mergedClockTimerSnapshot;
    self->_mergedClockTimerSnapshot = v7;

    id v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[ADClockService _mutateMergedClockTimerSnapshotUsingBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s End mutating timer snapshot.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_performBlock:(id)a3
{
  group = self->_group;
  if (group) {
    dispatch_group_notify(group, (dispatch_queue_t)self->_queue, a3);
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100364954;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (id)queue
{
  return self->_queue;
}

- (void)requestLifecycleObserver:(id)a3 requestDidEndWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100364A10;
  block[3] = &unk_10050E278;
  id v13 = self;
  int64_t v14 = a5;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(queue, block);
}

- (void)requestLifecycleObserver:(id)a3 requestWillBeginWithInfo:(id)a4 origin:(int64_t)a5 client:(id)a6
{
  id v8 = a6;
  id v9 = +[ADCommandCenter sharedCommandCenter];
  id v10 = [v9 _contextManager];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100364BE8;
  v14[3] = &unk_10050DD08;
  id v15 = v8;
  id v16 = self;
  id v17 = v10;
  int64_t v18 = a5;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(queue, v14);
}

- (void)getSnapshotsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADClockService getSnapshotsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003654E8;
    v6[3] = &unk_10050E188;
    void v6[4] = self;
    id v7 = v4;
    [(ADClockService *)self performBlock:v6];
  }
}

- (void)getFiringStatesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v9 = "-[ADClockService getFiringStatesWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100365770;
    v6[3] = &unk_10050E188;
    void v6[4] = self;
    id v7 = v4;
    [(ADClockService *)self performBlock:v6];
  }
}

- (ADClockService)init
{
  v21.receiver = self;
  v21.super_class = (Class)ADClockService;
  v2 = [(ADClockService *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.assistant.clock-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    dispatch_group_t v7 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v7;

    id v9 = objc_alloc_init(ADRemoteTimerManager);
    remoteTimerManager = v2->_remoteTimerManager;
    v2->_remoteTimerManager = v9;

    id v11 = (SOClockAlarmManager *)objc_alloc_init((Class)SOClockAlarmManager);
    localAlarmManager = v2->_localAlarmManager;
    v2->_localAlarmManager = v11;

    id v13 = v2->_localAlarmManager;
    if (!v13)
    {
      int64_t v14 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v23 = "-[ADClockService init]";
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Unable to get an instance of SOClockAlarmManager.", buf, 0xCu);
        id v13 = v2->_localAlarmManager;
      }
      else
      {
        id v13 = 0;
      }
    }
    [(SOClockAlarmManager *)v13 checkIn];
    id v15 = (SOClockTimerManager *)objc_alloc_init((Class)SOClockTimerManager);
    localTimerManager = v2->_localTimerManager;
    v2->_localTimerManager = v15;

    id v17 = v2->_localTimerManager;
    if (!v17)
    {
      int64_t v18 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v23 = "-[ADClockService init]";
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Unable to get an instance of SOClockTimerManager.", buf, 0xCu);
        id v17 = v2->_localTimerManager;
      }
      else
      {
        id v17 = 0;
      }
    }
    [(SOClockTimerManager *)v17 checkIn];
    id v19 = +[ADRequestLifecycleObserver sharedObserver];
    [v19 addListener:v2];
  }
  return v2;
}

+ (id)sharedService
{
  if (AFIsHorseman())
  {
    if (qword_100586490 != -1) {
      dispatch_once(&qword_100586490, &stru_10050DB50);
    }
    id v2 = (id)qword_100586498;
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[SOClockAlarmManager warmUp];
    +[SOClockTimerManager warmUp];
  }
}

@end