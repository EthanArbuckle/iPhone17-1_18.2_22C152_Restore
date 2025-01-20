@interface DTActivityTraceTapConfig
- (BOOL)enableBacktraceReplacement;
- (BOOL)enableHTTPArchiveLogging;
- (BOOL)enablePowerLog;
- (BOOL)excludeDebug;
- (BOOL)excludeInfo;
- (BOOL)includeSenderInfo;
- (BOOL)includeWallTime;
- (BOOL)isTargetAllProcesses;
- (BOOL)onlySignposts;
- (BOOL)signpostsAndLogs;
- (BOOL)trackExpiredPIDs;
- (BOOL)trackPIDToExecNameMapping;
- (DTActivityTraceTapConfig)init;
- (NSArray)dynamicTracingEnabledSubsystems;
- (NSDate)importForcedEndDate;
- (NSDate)importForcedStartDate;
- (NSDictionary)loggingSubsystemCategoryPairsToEnable;
- (NSDictionary)signpostSubsystemCategoryPairsToEnable;
- (NSString)predicateString;
- (NSURL)importedFileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)memoHandler;
- (id)processDetectionCallback;
- (int)targetPID;
- (mach_timebase_info)machTimebase;
- (unint64_t)machContinuousStart;
- (unint64_t)mode;
- (void)setDynamicTracingEnabledSubsystems:(id)a3;
- (void)setEnableBacktraceReplacement:(BOOL)a3;
- (void)setEnableHTTPArchiveLogging:(BOOL)a3;
- (void)setEnablePowerLog:(BOOL)a3;
- (void)setExcludeDebug:(BOOL)a3;
- (void)setExcludeInfo:(BOOL)a3;
- (void)setImportForcedEndDate:(id)a3;
- (void)setImportForcedStartDate:(id)a3;
- (void)setImportedFileURL:(id)a3;
- (void)setIncludeSenderInfo:(BOOL)a3;
- (void)setIncludeWallTime:(BOOL)a3;
- (void)setLoggingSubsystemCategoryPairsToEnable:(id)a3;
- (void)setMachContinuousStart:(unint64_t)a3;
- (void)setMachTimebase:(mach_timebase_info)a3;
- (void)setMemoHandler:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOnlySignposts:(BOOL)a3;
- (void)setPredicateString:(id)a3;
- (void)setProcessDetectionCallback:(id)a3;
- (void)setSignpostSubsystemCategoryPairsToEnable:(id)a3;
- (void)setSignpostsAndLogs:(BOOL)a3;
- (void)setTargetPID:(int)a3;
- (void)setTrackExpiredPIDs:(BOOL)a3;
- (void)setTrackPIDToExecNameMapping:(BOOL)a3;
@end

@implementation DTActivityTraceTapConfig

- (DTActivityTraceTapConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)DTActivityTraceTapConfig;
  v2 = [(DTTapConfig *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DTTapConfig *)v2 _setSerializableObject:&stru_26E517620 forKey:@"predicate"];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DTActivityTraceTapConfig;
  id v4 = [(DTTapConfig *)&v10 copyWithZone:a3];
  objc_super v5 = _Block_copy(self->_memoHandler);
  v6 = (void *)*((void *)v4 + 13);
  *((void *)v4 + 13) = v5;

  v7 = _Block_copy(self->_processDetectionCallback);
  v8 = (void *)*((void *)v4 + 14);
  *((void *)v4 + 14) = v7;

  objc_storeStrong((id *)v4 + 10, self->_importedFileURL);
  objc_storeStrong((id *)v4 + 11, self->_importForcedStartDate);
  objc_storeStrong((id *)v4 + 12, self->_importForcedEndDate);
  return v4;
}

- (void)setPredicateString:(id)a3
{
  if (a3) {
    [(DTTapConfig *)self _setSerializableObject:a3 forKey:@"predicate"];
  }
}

- (NSString)predicateString
{
  return (NSString *)[(DTTapConfig *)self _getSerializableObjectForKey:@"predicate"];
}

- (void)setMode:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"mode"];
}

- (unint64_t)mode
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"mode"];
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (void)setOnlySignposts:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [NSNumber numberWithBool:];
  [(DTTapConfig *)self _setSerializableObject:v5 forKey:@"onlySignposts"];

  if (v3)
  {
    uint64_t v6 = MEMORY[0x263EFFA80];
    [(DTTapConfig *)self _setSerializableObject:v6 forKey:@"signpostsAndLogs"];
  }
}

- (BOOL)onlySignposts
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"onlySignposts"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSignpostsAndLogs:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [NSNumber numberWithBool:];
  [(DTTapConfig *)self _setSerializableObject:v5 forKey:@"signpostsAndLogs"];

  if (v3)
  {
    uint64_t v6 = MEMORY[0x263EFFA80];
    [(DTTapConfig *)self _setSerializableObject:v6 forKey:@"onlySignposts"];
  }
}

- (BOOL)signpostsAndLogs
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"signpostsAndLogs"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTrackExpiredPIDs:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"trackExpiredPIDs"];
}

- (BOOL)trackExpiredPIDs
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"trackExpiredPIDs"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setExcludeInfo:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"excludeInfo"];
}

- (BOOL)excludeInfo
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"excludeInfo"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setExcludeDebug:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"excludeDebug"];
}

- (BOOL)excludeDebug
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"excludeDebug"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIncludeSenderInfo:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"includeSenderInfo"];
}

- (BOOL)includeSenderInfo
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"includeSenderInfo"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIncludeWallTime:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"includeWallTime"];
}

- (BOOL)includeWallTime
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"includeWallTime"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnableHTTPArchiveLogging:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"enableHTTPArchiveLogging"];
}

- (BOOL)enableHTTPArchiveLogging
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"enableHTTPArchiveLogging"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnableBacktraceReplacement:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"enableBacktraceReplacement"];
}

- (BOOL)enableBacktraceReplacement
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"enableBacktraceReplacement"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnablePowerLog:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"enablePowerlogLogging"];
}

- (BOOL)enablePowerLog
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"enablePowerlogLogging"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTargetPID:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"targetPID"];
}

- (int)targetPID
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"targetPID"];
  int v3 = [v2 integerValue];

  return v3;
}

- (BOOL)trackPIDToExecNameMapping
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"trackPidToExecNameMapping"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTrackPIDToExecNameMapping:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"trackPidToExecNameMapping"];
}

- (NSArray)dynamicTracingEnabledSubsystems
{
  return (NSArray *)[(DTTapConfig *)self _getSerializableObjectForKey:@"dynamicTracingEnabledSubsystems"];
}

- (void)setDynamicTracingEnabledSubsystems:(id)a3
{
}

- (NSDictionary)loggingSubsystemCategoryPairsToEnable
{
  return (NSDictionary *)[(DTTapConfig *)self _getSerializableObjectForKey:@"logSubsystemsCategoryPairsToEnableV2"];
}

- (void)setLoggingSubsystemCategoryPairsToEnable:(id)a3
{
}

- (NSDictionary)signpostSubsystemCategoryPairsToEnable
{
  return (NSDictionary *)[(DTTapConfig *)self _getSerializableObjectForKey:@"logSubsystemsCategoryPairsToEnableV2"];
}

- (void)setSignpostSubsystemCategoryPairsToEnable:(id)a3
{
}

- (void)setMachTimebase:(mach_timebase_info)a3
{
  uint64_t denom = a3.denom;
  objc_super v5 = [NSNumber numberWithUnsignedInt:];
  [(DTTapConfig *)self _setSerializableObject:v5 forKey:@"machTimebaseNumer"];

  id v6 = [NSNumber numberWithUnsignedInt:denom];
  [(DTTapConfig *)self _setSerializableObject:v6 forKey:@"machTimebaseDenom"];
}

- (mach_timebase_info)machTimebase
{
  char v3 = [(DTTapConfig *)self _getSerializableObjectForKey:@"machTimebaseNumer"];
  unsigned int v4 = [v3 unsignedIntValue];

  objc_super v5 = [(DTTapConfig *)self _getSerializableObjectForKey:@"machTimebaseDenom"];
  uint64_t v6 = [v5 unsignedIntValue];

  return (mach_timebase_info)(v4 | (unint64_t)(v6 << 32));
}

- (void)setMachContinuousStart:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [(DTTapConfig *)self _setSerializableObject:v4 forKey:@"machContinuousStart"];
}

- (unint64_t)machContinuousStart
{
  v2 = [(DTTapConfig *)self _getSerializableObjectForKey:@"machContinuousStart"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (void)setMemoHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id memoHandler = self->_memoHandler;
  self->_id memoHandler = v4;
}

- (BOOL)isTargetAllProcesses
{
  return [(DTActivityTraceTapConfig *)self targetPID] == -3;
}

- (NSURL)importedFileURL
{
  return self->_importedFileURL;
}

- (void)setImportedFileURL:(id)a3
{
}

- (NSDate)importForcedStartDate
{
  return self->_importForcedStartDate;
}

- (void)setImportForcedStartDate:(id)a3
{
}

- (NSDate)importForcedEndDate
{
  return self->_importForcedEndDate;
}

- (void)setImportForcedEndDate:(id)a3
{
}

- (id)memoHandler
{
  return self->_memoHandler;
}

- (id)processDetectionCallback
{
  return self->_processDetectionCallback;
}

- (void)setProcessDetectionCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processDetectionCallback, 0);
  objc_storeStrong(&self->_memoHandler, 0);
  objc_storeStrong((id *)&self->_importForcedEndDate, 0);
  objc_storeStrong((id *)&self->_importForcedStartDate, 0);
  objc_storeStrong((id *)&self->_importedFileURL, 0);
}

@end