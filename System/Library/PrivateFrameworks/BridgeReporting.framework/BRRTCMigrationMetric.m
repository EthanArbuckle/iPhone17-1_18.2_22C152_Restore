@interface BRRTCMigrationMetric
- (BOOL)isAutomation;
- (BOOL)migrationDeviceUnpairedBecauseKeychainIsOff;
- (BOOL)migrationDeviceUnpairedBecauseStale;
- (BOOL)migrationDeviceUnpairedByUserAction;
- (BOOL)migrationFailedBTKeysNotSynced;
- (BOOL)migrationSucceeded;
- (BRRTCMigrationMetric)init;
- (BRRTCMigrationMetricDeviceDetails)deviceDetails;
- (NSMutableDictionary)transactionPhases;
- (NSNumber)migrationFailureCode;
- (NSString)lastActiveDate;
- (NSString)migrationBeganTime;
- (NSString)migrationFailureDescription;
- (NSString)migrationFailureDomain;
- (NSString)sessionID;
- (NSString)suspectTransaction;
- (id)dictionaryRepresentation;
- (unsigned)rtcType;
- (void)setDeviceDetails:(id)a3;
- (void)setIsAutomation:(BOOL)a3;
- (void)setLastActiveDate:(id)a3;
- (void)setMigrationBeganTime:(id)a3;
- (void)setMigrationDeviceUnpairedBecauseKeychainIsOff:(BOOL)a3;
- (void)setMigrationDeviceUnpairedBecauseStale:(BOOL)a3;
- (void)setMigrationDeviceUnpairedByUserAction:(BOOL)a3;
- (void)setMigrationFailedBTKeysNotSynced:(BOOL)a3;
- (void)setMigrationFailureCode:(id)a3;
- (void)setMigrationFailureDescription:(id)a3;
- (void)setMigrationFailureDomain:(id)a3;
- (void)setMigrationSucceeded:(BOOL)a3;
- (void)setRtcType:(unsigned __int16)a3;
- (void)setSessionID:(id)a3;
- (void)setSuspectTransaction:(id)a3;
- (void)setTransactionPhases:(id)a3;
@end

@implementation BRRTCMigrationMetric

- (BRRTCMigrationMetric)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRRTCMigrationMetric;
  v2 = [(BRRTCMigrationMetric *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    transactionPhases = v2->_transactionPhases;
    v2->_transactionPhases = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = objc_opt_new();
  v4 = v3;
  migrationBeganTime = self->_migrationBeganTime;
  if (migrationBeganTime) {
    [v3 setObject:migrationBeganTime forKey:@"MigrationBeganTime"];
  }
  if (self->_isAutomation) {
    uint64_t v6 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v6 = MEMORY[0x263EFFA80];
  }
  [v4 setObject:v6 forKey:@"IsAutomation"];
  suspectTransaction = self->_suspectTransaction;
  if (suspectTransaction) {
    [v4 setObject:suspectTransaction forKey:@"SuspectTransaction"];
  }
  migrationFailureCode = self->_migrationFailureCode;
  if (migrationFailureCode) {
    [v4 setObject:migrationFailureCode forKey:@"MigrationErrorCode"];
  }
  migrationFailureDescription = self->_migrationFailureDescription;
  if (migrationFailureDescription) {
    [v4 setObject:migrationFailureDescription forKey:@"MigrationErrorDescription"];
  }
  migrationFailureDomain = self->_migrationFailureDomain;
  if (migrationFailureDomain) {
    [v4 setObject:migrationFailureDomain forKey:@"MigrationErrorDomain"];
  }
  if (self->_sessionID) {
    sessionID = (__CFString *)self->_sessionID;
  }
  else {
    sessionID = @"nil";
  }
  [v4 setObject:sessionID forKey:@"MetricSessionID"];
  if (self->_migrationFailedBTKeysNotSynced)
  {
    v12 = [NSNumber numberWithBool:1];
    [v4 setObject:v12 forKey:@"MigrationFailedBTKeysNotSynced"];
  }
  if (self->_migrationDeviceUnpairedBecauseKeychainIsOff)
  {
    v13 = [NSNumber numberWithBool:1];
    [v4 setObject:v13 forKey:@"MigrationDeviceUnpairedBecauseKeychainIsOff"];
  }
  if (self->_migrationDeviceUnpairedBecauseStale)
  {
    v14 = [NSNumber numberWithBool:1];
    [v4 setObject:v14 forKey:@"MigrationDeviceUnpairedBecauseStale"];
  }
  if (self->_migrationDeviceUnpairedByUserAction)
  {
    v15 = [NSNumber numberWithBool:1];
    [v4 setObject:v15 forKey:@"MigrationDeviceUnpairedByUserAction"];
  }
  lastActiveDate = self->_lastActiveDate;
  if (lastActiveDate) {
    [v4 setObject:lastActiveDate forKey:@"MigrationLastActiveDate"];
  }
  if (self->_migrationSucceeded)
  {
    v17 = [NSNumber numberWithBool:1];
    [v4 setObject:v17 forKey:@"MigrationSucceeded"];
  }
  else
  {
    [v4 setObject:MEMORY[0x263EFFA80] forKey:@"MigrationSucceeded"];
  }
  v18 = [(BRRTCMigrationMetric *)self deviceDetails];
  v19 = [v18 dictionaryOfMetricKeysWithRecordedValues];
  [v4 addEntriesFromDictionary:v19];

  [v4 addEntriesFromDictionary:self->_transactionPhases];

  return v4;
}

- (NSString)migrationBeganTime
{
  return self->_migrationBeganTime;
}

- (void)setMigrationBeganTime:(id)a3
{
}

- (BOOL)migrationSucceeded
{
  return self->_migrationSucceeded;
}

- (void)setMigrationSucceeded:(BOOL)a3
{
  self->_migrationSucceeded = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BRRTCMigrationMetricDeviceDetails)deviceDetails
{
  return self->_deviceDetails;
}

- (void)setDeviceDetails:(id)a3
{
}

- (BOOL)isAutomation
{
  return self->_isAutomation;
}

- (void)setIsAutomation:(BOOL)a3
{
  self->_isAutomation = a3;
}

- (NSMutableDictionary)transactionPhases
{
  return self->_transactionPhases;
}

- (void)setTransactionPhases:(id)a3
{
}

- (NSNumber)migrationFailureCode
{
  return self->_migrationFailureCode;
}

- (void)setMigrationFailureCode:(id)a3
{
}

- (NSString)migrationFailureDescription
{
  return self->_migrationFailureDescription;
}

- (void)setMigrationFailureDescription:(id)a3
{
}

- (NSString)migrationFailureDomain
{
  return self->_migrationFailureDomain;
}

- (void)setMigrationFailureDomain:(id)a3
{
}

- (BOOL)migrationFailedBTKeysNotSynced
{
  return self->_migrationFailedBTKeysNotSynced;
}

- (void)setMigrationFailedBTKeysNotSynced:(BOOL)a3
{
  self->_migrationFailedBTKeysNotSynced = a3;
}

- (BOOL)migrationDeviceUnpairedBecauseKeychainIsOff
{
  return self->_migrationDeviceUnpairedBecauseKeychainIsOff;
}

- (void)setMigrationDeviceUnpairedBecauseKeychainIsOff:(BOOL)a3
{
  self->_migrationDeviceUnpairedBecauseKeychainIsOff = a3;
}

- (BOOL)migrationDeviceUnpairedBecauseStale
{
  return self->_migrationDeviceUnpairedBecauseStale;
}

- (void)setMigrationDeviceUnpairedBecauseStale:(BOOL)a3
{
  self->_migrationDeviceUnpairedBecauseStale = a3;
}

- (BOOL)migrationDeviceUnpairedByUserAction
{
  return self->_migrationDeviceUnpairedByUserAction;
}

- (void)setMigrationDeviceUnpairedByUserAction:(BOOL)a3
{
  self->_migrationDeviceUnpairedByUserAction = a3;
}

- (NSString)suspectTransaction
{
  return self->_suspectTransaction;
}

- (void)setSuspectTransaction:(id)a3
{
}

- (unsigned)rtcType
{
  return self->_rtcType;
}

- (void)setRtcType:(unsigned __int16)a3
{
  self->_rtcType = a3;
}

- (NSString)lastActiveDate
{
  return self->_lastActiveDate;
}

- (void)setLastActiveDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveDate, 0);
  objc_storeStrong((id *)&self->_suspectTransaction, 0);
  objc_storeStrong((id *)&self->_migrationFailureDomain, 0);
  objc_storeStrong((id *)&self->_migrationFailureDescription, 0);
  objc_storeStrong((id *)&self->_migrationFailureCode, 0);
  objc_storeStrong((id *)&self->_transactionPhases, 0);
  objc_storeStrong((id *)&self->_deviceDetails, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_migrationBeganTime, 0);
}

@end