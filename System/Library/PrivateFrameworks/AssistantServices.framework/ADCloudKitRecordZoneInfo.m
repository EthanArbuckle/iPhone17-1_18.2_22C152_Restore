@interface ADCloudKitRecordZoneInfo
- (ADCloudKitDataStoreProtocol)dataStore;
- (ADCloudKitRecordZoneInfo)initWithZone:(id)a3 dataStore:(id)a4 subscriptionNames:(id)a5;
- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionName:(id)a4;
- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4;
- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4 ckAccountInfo:(id)a5;
- (BOOL)fetchInProgress;
- (BOOL)hasSetUpRecordZoneSubscription;
- (BOOL)simulatedError;
- (CKAccountInfo)ckAcctInfo;
- (CKRecordZone)zone;
- (CKServerChangeToken)serverChangeToken;
- (NSArray)subscriptionNames;
- (NSMutableArray)subscriptionList;
- (NSString)subscriptionId;
- (NSString)subscriptionName;
- (NSString)zoneId;
- (NSString)zoneName;
- (OS_dispatch_source)rateLimitTimer;
- (OS_dispatch_source)shareCreationTimer;
- (OS_dispatch_source)subscriptionSetupTimer;
- (OS_dispatch_source)syncRetryTimer;
- (OS_dispatch_source)zoneSetupTimer;
- (double)currentRetryInterval;
- (int64_t)retryState;
- (unint64_t)shareCreationRetryCount;
- (void)reset;
- (void)setCurrentRetryInterval:(double)a3;
- (void)setDataStore:(id)a3;
- (void)setFetchInProgress:(BOOL)a3;
- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3;
- (void)setRateLimitTimer:(id)a3;
- (void)setRetryState:(int64_t)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setShareCreationRetryCount:(unint64_t)a3;
- (void)setShareCreationTimer:(id)a3;
- (void)setSimulatedError:(BOOL)a3;
- (void)setSubscriptionId:(id)a3;
- (void)setSubscriptionList:(id)a3;
- (void)setSubscriptionSetupTimer:(id)a3;
- (void)setSyncRetryTimer:(id)a3;
- (void)setZone:(id)a3;
- (void)setZoneId:(id)a3;
- (void)setZoneSetupTimer:(id)a3;
@end

@implementation ADCloudKitRecordZoneInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionId, 0);
  objc_storeStrong((id *)&self->_zoneId, 0);
  objc_storeStrong((id *)&self->_shareCreationTimer, 0);
  objc_storeStrong((id *)&self->_syncRetryTimer, 0);
  objc_storeStrong((id *)&self->_rateLimitTimer, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_subscriptionSetupTimer, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_zoneSetupTimer, 0);
  objc_storeStrong((id *)&self->_ckAcctInfo, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_subscriptionNames, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

- (void)setSubscriptionId:(id)a3
{
}

- (NSString)subscriptionId
{
  return self->_subscriptionId;
}

- (void)setZoneId:(id)a3
{
}

- (NSString)zoneId
{
  return self->_zoneId;
}

- (void)setSimulatedError:(BOOL)a3
{
  self->_simulatedError = a3;
}

- (BOOL)simulatedError
{
  return self->_simulatedError;
}

- (void)setCurrentRetryInterval:(double)a3
{
  self->_currentRetryInterval = a3;
}

- (double)currentRetryInterval
{
  return self->_currentRetryInterval;
}

- (void)setRetryState:(int64_t)a3
{
  self->_retryState = a3;
}

- (int64_t)retryState
{
  return self->_retryState;
}

- (void)setFetchInProgress:(BOOL)a3
{
  self->_fetchInProgress = a3;
}

- (BOOL)fetchInProgress
{
  return self->_fetchInProgress;
}

- (void)setShareCreationRetryCount:(unint64_t)a3
{
  self->_shareCreationRetryCount = a3;
}

- (unint64_t)shareCreationRetryCount
{
  return self->_shareCreationRetryCount;
}

- (void)setShareCreationTimer:(id)a3
{
}

- (OS_dispatch_source)shareCreationTimer
{
  return self->_shareCreationTimer;
}

- (void)setSyncRetryTimer:(id)a3
{
}

- (OS_dispatch_source)syncRetryTimer
{
  return self->_syncRetryTimer;
}

- (void)setRateLimitTimer:(id)a3
{
}

- (OS_dispatch_source)rateLimitTimer
{
  return self->_rateLimitTimer;
}

- (void)setDataStore:(id)a3
{
}

- (ADCloudKitDataStoreProtocol)dataStore
{
  return self->_dataStore;
}

- (void)setSubscriptionSetupTimer:(id)a3
{
}

- (OS_dispatch_source)subscriptionSetupTimer
{
  return self->_subscriptionSetupTimer;
}

- (void)setSubscriptionList:(id)a3
{
}

- (NSMutableArray)subscriptionList
{
  return self->_subscriptionList;
}

- (void)setZoneSetupTimer:(id)a3
{
}

- (OS_dispatch_source)zoneSetupTimer
{
  return self->_zoneSetupTimer;
}

- (CKAccountInfo)ckAcctInfo
{
  return self->_ckAcctInfo;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (NSArray)subscriptionNames
{
  return self->_subscriptionNames;
}

- (NSString)subscriptionName
{
  return self->_subscriptionName;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)reset
{
  if ([(NSString *)self->_zoneName length])
  {
    v3 = (CKRecordZone *)[objc_alloc((Class)CKRecordZoneID) initWithZoneName:self->_zoneName ownerName:CKCurrentUserDefaultName];
    v4 = (CKRecordZone *)[objc_alloc((Class)CKRecordZone) initWithZoneID:v3];
    zone = self->_zone;
    self->_zone = v4;
  }
  else
  {
    v3 = self->_zone;
    self->_zone = 0;
  }

  [(ADCloudKitDataStoreProtocol *)self->_dataStore setZone:self->_zone];
  if (self->_zone
    && [(ADCloudKitDataStoreProtocol *)self->_dataStore hasSetUpRecordZoneSubscription])
  {
    v18 = [(ADCloudKitDataStoreProtocol *)self->_dataStore supportedRecordTypes];
    if ([(NSMutableArray *)v18 count])
    {
      uint64_t v6 = 0;
      unsigned int v7 = 1;
      do
      {
        id v8 = objc_alloc((Class)CKRecordZoneSubscription);
        v9 = [(CKRecordZone *)self->_zone zoneID];
        v10 = [(NSArray *)self->_subscriptionNames objectAtIndexedSubscript:v6];
        id v11 = [v8 initWithZoneID:v9 subscriptionID:v10];

        v12 = [(NSMutableArray *)v18 objectAtIndexedSubscript:v6];
        [v11 setRecordType:v12];

        subscriptionList = self->_subscriptionList;
        if (!subscriptionList)
        {
          v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
          v15 = self->_subscriptionList;
          self->_subscriptionList = v14;

          subscriptionList = self->_subscriptionList;
        }
        [(NSMutableArray *)subscriptionList addObject:v11];

        uint64_t v6 = v7;
      }
      while ((unint64_t)[(NSMutableArray *)v18 count] > v7++);
    }
    v17 = v18;
  }
  else
  {
    v17 = self->_subscriptionList;
    self->_subscriptionList = 0;
  }
}

- (void)setZone:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_zone, a3);
  v5 = [(ADCloudKitRecordZoneInfo *)self dataStore];

  if (v5)
  {
    uint64_t v6 = [(ADCloudKitRecordZoneInfo *)self dataStore];
    [v6 setZone:v7];
  }
}

- (void)setHasSetUpRecordZoneSubscription:(BOOL)a3
{
}

- (BOOL)hasSetUpRecordZoneSubscription
{
  return [(ADCloudKitDataStoreProtocol *)self->_dataStore hasSetUpRecordZoneSubscription];
}

- (void)setServerChangeToken:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return (CKServerChangeToken *)[(ADCloudKitDataStoreProtocol *)self->_dataStore serverChangeToken];
}

- (ADCloudKitRecordZoneInfo)initWithZone:(id)a3 dataStore:(id)a4 subscriptionNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ADCloudKitRecordZoneInfo;
  v12 = [(ADCloudKitRecordZoneInfo *)&v19 init];
  if (v12)
  {
    v13 = [v9 zoneID];
    uint64_t v14 = [v13 zoneName];
    zoneName = v12->_zoneName;
    v12->_zoneName = (NSString *)v14;

    objc_storeStrong((id *)&v12->_dataStore, a4);
    objc_storeStrong((id *)&v12->_zone, a3);
    [v10 setZone:v9];
    uint64_t v16 = [v11 firstObject];
    subscriptionName = v12->_subscriptionName;
    v12->_subscriptionName = (NSString *)v16;

    objc_storeStrong((id *)&v12->_subscriptionNames, a5);
  }

  return v12;
}

- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4 ckAccountInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ADCloudKitRecordZoneInfo;
  v12 = [(ADCloudKitRecordZoneInfo *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_zoneName, a3);
    uint64_t v14 = [v10 firstObject];
    subscriptionName = v13->_subscriptionName;
    v13->_subscriptionName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_subscriptionNames, a4);
    objc_storeStrong((id *)&v13->_ckAcctInfo, a5);
    [(ADCloudKitRecordZoneInfo *)v13 reset];
  }

  return v13;
}

- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionNames:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADCloudKitRecordZoneInfo;
  id v9 = [(ADCloudKitRecordZoneInfo *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneName, a3);
    uint64_t v11 = [v8 firstObject];
    subscriptionName = v10->_subscriptionName;
    v10->_subscriptionName = (NSString *)v11;

    objc_storeStrong((id *)&v10->_subscriptionNames, a4);
    [(ADCloudKitRecordZoneInfo *)v10 reset];
  }

  return v10;
}

- (ADCloudKitRecordZoneInfo)initWithZoneName:(id)a3 subscriptionName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ADCloudKitRecordZoneInfo;
  id v9 = [(ADCloudKitRecordZoneInfo *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneName, a3);
    objc_storeStrong((id *)&v10->_subscriptionName, a4);
    uint64_t v11 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v8, 0);
    subscriptionNames = v10->_subscriptionNames;
    v10->_subscriptionNames = v11;

    [(ADCloudKitRecordZoneInfo *)v10 reset];
  }

  return v10;
}

@end