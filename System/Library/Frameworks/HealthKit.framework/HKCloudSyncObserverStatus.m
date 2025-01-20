@interface HKCloudSyncObserverStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)accountProhibitedForCloudSync;
- (BOOL)accountSupportsSecureContainer;
- (BOOL)isEqual:(id)a3;
- (BOOL)syncEnabled;
- (HKCloudSyncObserverStatus)init;
- (HKCloudSyncObserverStatus)initWithCoder:(id)a3;
- (HKCloudSyncObserverStatus)initWithSyncEnabled:(BOOL)a3 accountSupportsSecureContainer:(BOOL)a4 accountProhibitedForCloudSync:(BOOL)a5 lastPullDate:(id)a6 lastPushDate:(id)a7 lastLitePushDate:(id)a8 lastPulledUpdateDate:(id)a9 restoreCompletionDate:(id)a10 errorRequiringUserAction:(id)a11 dataUploadRequestStatus:(int64_t)a12 dataUploadRequestStartDate:(id)a13 dataUploadRequestCompletionDate:(id)a14;
- (NSDate)dataUploadRequestCompletionDate;
- (NSDate)dataUploadRequestStartDate;
- (NSDate)lastLitePushDate;
- (NSDate)lastPullDate;
- (NSDate)lastPulledUpdateDate;
- (NSDate)lastPushDate;
- (NSDate)restoreCompletionDate;
- (NSError)errorRequiringUserAction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dataUploadRequestStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountProhibitedForCloudSync:(BOOL)a3;
- (void)setAccountSupportsSecureContainer:(BOOL)a3;
- (void)setDataUploadRequestCompletionDate:(id)a3;
- (void)setDataUploadRequestStartDate:(id)a3;
- (void)setDataUploadRequestStatus:(int64_t)a3;
- (void)setErrorRequiringUserAction:(id)a3;
- (void)setLastLitePushDate:(id)a3;
- (void)setLastPullDate:(id)a3;
- (void)setLastPulledUpdateDate:(id)a3;
- (void)setLastPushDate:(id)a3;
- (void)setRestoreCompletionDate:(id)a3;
- (void)setSyncEnabled:(BOOL)a3;
@end

@implementation HKCloudSyncObserverStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKCloudSyncObserverStatus)init
{
  return [(HKCloudSyncObserverStatus *)self initWithSyncEnabled:0 accountSupportsSecureContainer:1 accountProhibitedForCloudSync:0 lastPullDate:0 lastPushDate:0 lastLitePushDate:0 lastPulledUpdateDate:0 restoreCompletionDate:0 errorRequiringUserAction:0 dataUploadRequestStatus:0 dataUploadRequestStartDate:0 dataUploadRequestCompletionDate:0];
}

- (HKCloudSyncObserverStatus)initWithSyncEnabled:(BOOL)a3 accountSupportsSecureContainer:(BOOL)a4 accountProhibitedForCloudSync:(BOOL)a5 lastPullDate:(id)a6 lastPushDate:(id)a7 lastLitePushDate:(id)a8 lastPulledUpdateDate:(id)a9 restoreCompletionDate:(id)a10 errorRequiringUserAction:(id)a11 dataUploadRequestStatus:(int64_t)a12 dataUploadRequestStartDate:(id)a13 dataUploadRequestCompletionDate:(id)a14
{
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = v19;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a13;
  id v26 = a14;
  v48.receiver = self;
  v48.super_class = (Class)HKCloudSyncObserverStatus;
  v27 = [(HKCloudSyncObserverStatus *)&v48 init];
  v28 = v27;
  if (v27)
  {
    v27->_syncEnabled = a3;
    v27->_accountSupportsSecureContainer = a4;
    v27->_accountProhibitedForCloudSync = a5;
    uint64_t v29 = [v18 copy];
    lastPullDate = v28->_lastPullDate;
    v28->_lastPullDate = (NSDate *)v29;

    uint64_t v31 = [v21 copy];
    lastPushDate = v28->_lastPushDate;
    v28->_lastPushDate = (NSDate *)v31;

    uint64_t v33 = [v20 copy];
    lastLitePushDate = v28->_lastLitePushDate;
    v28->_lastLitePushDate = (NSDate *)v33;

    uint64_t v35 = [v22 copy];
    lastPulledUpdateDate = v28->_lastPulledUpdateDate;
    v28->_lastPulledUpdateDate = (NSDate *)v35;

    uint64_t v37 = [v23 copy];
    restoreCompletionDate = v28->_restoreCompletionDate;
    v28->_restoreCompletionDate = (NSDate *)v37;

    uint64_t v39 = [v24 copy];
    errorRequiringUserAction = v28->_errorRequiringUserAction;
    v28->_errorRequiringUserAction = (NSError *)v39;

    v28->_dataUploadRequestStatus = a12;
    uint64_t v41 = [v25 copy];
    dataUploadRequestStartDate = v28->_dataUploadRequestStartDate;
    v28->_dataUploadRequestStartDate = (NSDate *)v41;

    uint64_t v43 = [v26 copy];
    dataUploadRequestCompletionDate = v28->_dataUploadRequestCompletionDate;
    v28->_dataUploadRequestCompletionDate = (NSDate *)v43;
  }
  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL syncEnabled = self->_syncEnabled;
  id v5 = a3;
  [v5 encodeBool:syncEnabled forKey:@"HKCloudSyncObserverStatusSyncEnabled"];
  [v5 encodeBool:self->_accountSupportsSecureContainer forKey:@"HKCloudSyncObserverStatusAccountSupportsSecureContainer"];
  [v5 encodeBool:self->_accountProhibitedForCloudSync forKey:@"HKCloudSyncObserverStatusAccountProhibitedForCloudSync"];
  [v5 encodeObject:self->_lastPullDate forKey:@"HKCloudSyncObserverStatusLastPullDate"];
  [v5 encodeObject:self->_lastPushDate forKey:@"HKCloudSyncObserverStatusLastPushDate"];
  [v5 encodeObject:self->_lastLitePushDate forKey:@"HKCloudSyncObserverStatusLastLitePushDate"];
  [v5 encodeObject:self->_lastPulledUpdateDate forKey:@"HKCloudSyncObserverStatusLastPulledUpdateDate"];
  [v5 encodeObject:self->_restoreCompletionDate forKey:@"HKCloudSyncObserverStatusRestoreCompletionDate"];
  [v5 encodeObject:self->_errorRequiringUserAction forKey:@"HKCloudSyncObserverStatusErrorRequiringUserAction"];
  [v5 encodeInteger:self->_dataUploadRequestStatus forKey:@"_HKCloudSyncObserverStatusDataUploadRequestStatus"];
  [v5 encodeObject:self->_dataUploadRequestStartDate forKey:@"_HKCloudSyncObserverStatusDataUploadRequestStartDate"];
  [v5 encodeObject:self->_dataUploadRequestCompletionDate forKey:@"_HKCloudSyncObserverStatusDataUploadRequestCompletionDate"];
}

- (HKCloudSyncObserverStatus)initWithCoder:(id)a3
{
  id v3 = a3;
  unsigned int v17 = [v3 decodeBoolForKey:@"HKCloudSyncObserverStatusSyncEnabled"];
  unsigned int v16 = [v3 decodeBoolForKey:@"HKCloudSyncObserverStatusAccountSupportsSecureContainer"];
  unsigned int v15 = [v3 decodeBoolForKey:@"HKCloudSyncObserverStatusAccountProhibitedForCloudSync"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HKCloudSyncObserverStatusLastPullDate"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HKCloudSyncObserverStatusLastPushDate"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HKCloudSyncObserverStatusLastLitePushDate"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HKCloudSyncObserverStatusLastPulledUpdateDate"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HKCloudSyncObserverStatusRestoreCompletionDate"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HKCloudSyncObserverStatusErrorRequiringUserAction"];
  uint64_t v10 = [v3 decodeIntegerForKey:@"_HKCloudSyncObserverStatusDataUploadRequestStatus"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_HKCloudSyncObserverStatusDataUploadRequestStartDate"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"_HKCloudSyncObserverStatusDataUploadRequestCompletionDate"];

  v13 = [(HKCloudSyncObserverStatus *)self initWithSyncEnabled:v17 accountSupportsSecureContainer:v16 accountProhibitedForCloudSync:v15 lastPullDate:v4 lastPushDate:v5 lastLitePushDate:v6 lastPulledUpdateDate:v7 restoreCompletionDate:v8 errorRequiringUserAction:v9 dataUploadRequestStatus:v10 dataUploadRequestStartDate:v11 dataUploadRequestCompletionDate:v12];
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setSyncEnabled:self->_syncEnabled];
  [v5 setAccountSupportsSecureContainer:self->_accountSupportsSecureContainer];
  [v5 setAccountProhibitedForCloudSync:self->_accountProhibitedForCloudSync];
  [v5 setLastPullDate:self->_lastPullDate];
  [v5 setLastPushDate:self->_lastPushDate];
  [v5 setLastLitePushDate:self->_lastLitePushDate];
  [v5 setLastPulledUpdateDate:self->_lastPulledUpdateDate];
  [v5 setRestoreCompletionDate:self->_restoreCompletionDate];
  [v5 setErrorRequiringUserAction:self->_errorRequiringUserAction];
  [v5 setDataUploadRequestStatus:self->_dataUploadRequestStatus];
  v6 = (void *)[(NSDate *)self->_dataUploadRequestStartDate copyWithZone:a3];
  [v5 setDataUploadRequestStartDate:v6];

  v7 = (void *)[(NSDate *)self->_dataUploadRequestCompletionDate copyWithZone:a3];
  [v5 setDataUploadRequestCompletionDate:v7];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_lastPullDate hash];
  uint64_t v4 = [(NSDate *)self->_lastPushDate hash] ^ v3;
  uint64_t v5 = [(NSDate *)self->_lastLitePushDate hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_lastPulledUpdateDate hash];
  uint64_t v7 = [(NSDate *)self->_restoreCompletionDate hash];
  uint64_t v8 = v6 ^ v7 ^ [(NSError *)self->_errorRequiringUserAction hash] ^ self->_dataUploadRequestStatus;
  uint64_t v9 = [(NSDate *)self->_dataUploadRequestStartDate hash];
  return v8 ^ v9 ^ [(NSDate *)self->_dataUploadRequestCompletionDate hash] ^ self->_syncEnabled ^ self->_accountSupportsSecureContainer ^ self->_accountProhibitedForCloudSync;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  if (self->_syncEnabled != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_30;
  }
  if (self->_accountSupportsSecureContainer != *((unsigned __int8 *)v4 + 9)) {
    goto LABEL_30;
  }
  if (self->_accountProhibitedForCloudSync != *((unsigned __int8 *)v4 + 10)) {
    goto LABEL_30;
  }
  if (self->_dataUploadRequestStatus != v4[8]) {
    goto LABEL_30;
  }
  lastPullDate = self->_lastPullDate;
  uint64_t v6 = (NSDate *)v4[2];
  if (lastPullDate != v6 && (!v6 || !-[NSDate isEqual:](lastPullDate, "isEqual:"))) {
    goto LABEL_30;
  }
  lastPushDate = self->_lastPushDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (lastPushDate != v8 && (!v8 || !-[NSDate isEqual:](lastPushDate, "isEqual:"))) {
    goto LABEL_30;
  }
  lastLitePushDate = self->_lastLitePushDate;
  uint64_t v10 = (NSDate *)v4[4];
  if (lastLitePushDate != v10 && (!v10 || !-[NSDate isEqual:](lastLitePushDate, "isEqual:"))) {
    goto LABEL_30;
  }
  lastPulledUpdateDate = self->_lastPulledUpdateDate;
  v12 = (NSDate *)v4[5];
  if (lastPulledUpdateDate != v12 && (!v12 || !-[NSDate isEqual:](lastPulledUpdateDate, "isEqual:"))) {
    goto LABEL_30;
  }
  restoreCompletionDate = self->_restoreCompletionDate;
  v14 = (NSDate *)v4[6];
  if (restoreCompletionDate != v14 && (!v14 || !-[NSDate isEqual:](restoreCompletionDate, "isEqual:"))) {
    goto LABEL_30;
  }
  errorRequiringUserAction = self->_errorRequiringUserAction;
  unsigned int v16 = (NSError *)v4[7];
  if (errorRequiringUserAction != v16
    && (!v16 || !-[NSError isEqual:](errorRequiringUserAction, "isEqual:")))
  {
    goto LABEL_30;
  }
  dataUploadRequestStartDate = self->_dataUploadRequestStartDate;
  id v18 = (NSDate *)v4[9];
  if (dataUploadRequestStartDate != v18
    && (!v18 || !-[NSDate isEqual:](dataUploadRequestStartDate, "isEqual:")))
  {
    goto LABEL_30;
  }
  dataUploadRequestCompletionDate = self->_dataUploadRequestCompletionDate;
  id v20 = (NSDate *)v4[10];
  if (dataUploadRequestCompletionDate == v20)
  {
    char v21 = 1;
    goto LABEL_31;
  }
  if (v20) {
    char v21 = -[NSDate isEqual:](dataUploadRequestCompletionDate, "isEqual:");
  }
  else {
LABEL_30:
  }
    char v21 = 0;
LABEL_31:

  return v21;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HKCloudSyncObserverStatus;
  uint64_t v4 = [(HKCloudSyncObserverStatus *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: syncEnabled: %d, accountSupportsSecureContainer: %d, accountProhibitedForCloudSync: %d, lastPullDate: %@, lastPushDate: %@, lastLitePushDate: %@, lastPulledUpdateDate: %@, restoreCompletionDate: %@, errorRequiringUserAction: %@, dataUploadRequestStatus: %ld, dataUploadRequestStartDate: %@, dataUploadRequestCompletionDate: %@", v4, self->_syncEnabled, self->_accountSupportsSecureContainer, self->_accountProhibitedForCloudSync, self->_lastPullDate, self->_lastPushDate, self->_lastLitePushDate, self->_lastPulledUpdateDate, self->_restoreCompletionDate, self->_errorRequiringUserAction, self->_dataUploadRequestStatus, self->_dataUploadRequestStartDate, self->_dataUploadRequestCompletionDate];

  return v5;
}

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (void)setSyncEnabled:(BOOL)a3
{
  self->_BOOL syncEnabled = a3;
}

- (BOOL)accountSupportsSecureContainer
{
  return self->_accountSupportsSecureContainer;
}

- (void)setAccountSupportsSecureContainer:(BOOL)a3
{
  self->_accountSupportsSecureContainer = a3;
}

- (BOOL)accountProhibitedForCloudSync
{
  return self->_accountProhibitedForCloudSync;
}

- (void)setAccountProhibitedForCloudSync:(BOOL)a3
{
  self->_accountProhibitedForCloudSync = a3;
}

- (NSDate)lastPullDate
{
  return self->_lastPullDate;
}

- (void)setLastPullDate:(id)a3
{
}

- (NSDate)lastPushDate
{
  return self->_lastPushDate;
}

- (void)setLastPushDate:(id)a3
{
}

- (NSDate)lastLitePushDate
{
  return self->_lastLitePushDate;
}

- (void)setLastLitePushDate:(id)a3
{
}

- (NSDate)lastPulledUpdateDate
{
  return self->_lastPulledUpdateDate;
}

- (void)setLastPulledUpdateDate:(id)a3
{
}

- (NSDate)restoreCompletionDate
{
  return self->_restoreCompletionDate;
}

- (void)setRestoreCompletionDate:(id)a3
{
}

- (NSError)errorRequiringUserAction
{
  return self->_errorRequiringUserAction;
}

- (void)setErrorRequiringUserAction:(id)a3
{
}

- (int64_t)dataUploadRequestStatus
{
  return self->_dataUploadRequestStatus;
}

- (void)setDataUploadRequestStatus:(int64_t)a3
{
  self->_dataUploadRequestStatus = a3;
}

- (NSDate)dataUploadRequestStartDate
{
  return self->_dataUploadRequestStartDate;
}

- (void)setDataUploadRequestStartDate:(id)a3
{
}

- (NSDate)dataUploadRequestCompletionDate
{
  return self->_dataUploadRequestCompletionDate;
}

- (void)setDataUploadRequestCompletionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUploadRequestCompletionDate, 0);
  objc_storeStrong((id *)&self->_dataUploadRequestStartDate, 0);
  objc_storeStrong((id *)&self->_errorRequiringUserAction, 0);
  objc_storeStrong((id *)&self->_restoreCompletionDate, 0);
  objc_storeStrong((id *)&self->_lastPulledUpdateDate, 0);
  objc_storeStrong((id *)&self->_lastLitePushDate, 0);
  objc_storeStrong((id *)&self->_lastPushDate, 0);

  objc_storeStrong((id *)&self->_lastPullDate, 0);
}

@end