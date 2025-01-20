@interface HMDHomeActivityStateManagerDataSource
- (BOOL)hasFinishedLoadingHomeData;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isEligibleForFMFDesignation;
- (BOOL)isResidentCapable;
- (HMCContext)workingStoreContext;
- (HMDBackgroundTaskManager)backgroundTaskManager;
- (HMDBulletinBoard)bulletinBoard;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHome)home;
- (HMDHomeActivityStateManagerDataSource)initWithHome:(id)a3;
- (HMDHomeAdministratorHandler)administratorHandler;
- (HMDLocation)location;
- (HMDResidentDevice)currentPrimaryResident;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFPreferences)preferences;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)currentDate;
- (NSNotificationCenter)notificationCenter;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (double)reportValidityInterval;
- (id)createPresenceFeeder;
- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
@end

@implementation HMDHomeActivityStateManagerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_currentPrimaryResident, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_administratorHandler, 0);
}

- (double)reportValidityInterval
{
  return self->_reportValidityInterval;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return self->_featuresDataSource;
}

- (HMDBulletinBoard)bulletinBoard
{
  return self->_bulletinBoard;
}

- (HMDHomeAdministratorHandler)administratorHandler
{
  return self->_administratorHandler;
}

- (id)createPresenceFeeder
{
  v2 = objc_alloc_init(HMDUserPresenceFeeder);
  return v2;
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a4 options:a3];
  return v4;
}

- (HMDLocation)location
{
  return +[HMDLocation sharedManager];
}

- (HMCContext)workingStoreContext
{
  v2 = [(HMDHomeActivityStateManagerDataSource *)self home];
  v3 = [v2 backingStore];
  v4 = [v3 context];

  return (HMCContext *)v4;
}

- (HMFPreferences)preferences
{
  return (HMFPreferences *)[MEMORY[0x263F42608] sharedPreferences];
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  return +[HMDBackgroundTaskManager sharedManager];
}

- (HMDResidentDevice)currentPrimaryResident
{
  v2 = [(HMDHomeActivityStateManagerDataSource *)self home];
  v3 = [v2 residentDeviceManager];
  v4 = [v3 primaryResidentDevice];

  return (HMDResidentDevice *)v4;
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  v2 = [(HMDHomeActivityStateManagerDataSource *)self home];
  char v3 = [v2 isCurrentDeviceConfirmedPrimaryResident];

  return v3;
}

- (NSDate)currentDate
{
  return (NSDate *)[MEMORY[0x263EFF910] now];
}

- (BOOL)hasFinishedLoadingHomeData
{
  v2 = [(HMDHomeActivityStateManagerDataSource *)self home];
  char v3 = [v2 homeManager];
  char v4 = [v3 hasLoadedData];

  return v4;
}

- (BOOL)isResidentCapable
{
  if (self) {
    LOBYTE(self) = isTVOSDevice();
  }
  return (char)self;
}

- (BOOL)isEligibleForFMFDesignation
{
  if (self)
  {
    if (isiOSDevice())
    {
      LOBYTE(self) = 1;
    }
    else
    {
      LOBYTE(self) = isWatch();
    }
  }
  return (char)self;
}

- (HMDHomeActivityStateManagerDataSource)initWithHome:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDHomeActivityStateManagerDataSource;
  v5 = [(HMDHomeActivityStateManagerDataSource *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 administratorHandler];
    administratorHandler = v5->_administratorHandler;
    v5->_administratorHandler = (HMDHomeAdministratorHandler *)v6;

    uint64_t v8 = +[HMDBulletinBoard sharedBulletinBoard];
    bulletinBoard = v5->_bulletinBoard;
    v5->_bulletinBoard = (HMDBulletinBoard *)v8;

    v10 = objc_alloc_init(HMDFeaturesDataSource);
    featuresDataSource = v5->_featuresDataSource;
    v5->_featuresDataSource = v10;

    objc_storeWeak((id *)&v5->_home, v4);
    uint64_t v12 = +[HMDMetricsManager sharedLogEventSubmitter];
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v12;

    v14 = [v4 uuid];
    uint64_t v15 = [v14 UUIDString];
    logIdentifier = v5->_logIdentifier;
    v5->_logIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 msgDispatcher];
    messageDispatcher = v5->_messageDispatcher;
    v5->_messageDispatcher = (HMFMessageDispatcher *)v17;

    uint64_t v19 = [v4 workQueue];
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v19;

    v5->_reportValidityInterval = (double)(unint64_t)(60
                                                           * (presenceMonitorRefreshGracePeriodInMinutes
                                                            + presenceFeedRefreshInMinutes));
  }

  return v5;
}

@end