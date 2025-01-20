@interface HDFitnessMachineDataProducer
- (BOOL)attached;
- (HDFitnessMachineDataProducer)initWithProfile:(id)a3;
- (void)attachHealthServiceSession:(unint64_t)a3;
- (void)dealloc;
- (void)deliverFinalValuesAndDetachWithCompletion:(id)a3;
- (void)detachHealthServiceSession;
- (void)pauseCurrentSession;
- (void)resumeCurrentSession;
- (void)sendInitialValues;
- (void)workoutDataAccumulator:(id)a3 didUpdateStatistics:(id)a4;
@end

@implementation HDFitnessMachineDataProducer

- (HDFitnessMachineDataProducer)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDFitnessMachineDataProducer;
  v5 = [(HDFitnessMachineDataProducer *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v6->_sessionIdentifier = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_94C8, kHKNanoLifestylePrivacyPreferencesChangedNotification, 0, CFNotificationSuspensionBehaviorDrop);
    sub_94D0((uint64_t)v6);
  }

  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kHKNanoLifestylePrivacyPreferencesChangedNotification, 0);
  v4.receiver = self;
  v4.super_class = (Class)HDFitnessMachineDataProducer;
  [(HDFitnessMachineDataProducer *)&v4 dealloc];
}

- (void)attachHealthServiceSession:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_96A8;
  v4[3] = &unk_609D0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)sendInitialValues
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9874;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)deliverFinalValuesAndDetachWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_99BC;
  v7[3] = &unk_609F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)detachHealthServiceSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9C38;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)pauseCurrentSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9CB4;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeCurrentSession
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9D84;
  block[3] = &unk_60820;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)attached
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9E6C;
  v5[3] = &unk_60A20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)workoutDataAccumulator:(id)a3 didUpdateStatistics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  uint64_t v8 = HKLogWorkouts;
  if (os_log_type_enabled(HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Received updated accumulator statistics: %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9FE8;
  block[3] = &unk_607A8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_previousEurotasData, 0);
  objc_storeStrong((id *)&self->_heartRateTracker, 0);
  objc_storeStrong((id *)&self->_averageHeartRate, 0);
  objc_storeStrong((id *)&self->_latestHeartRate, 0);
  objc_storeStrong((id *)&self->_totalBasalEnergy, 0);
  objc_storeStrong((id *)&self->_totalActiveEnergy, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end