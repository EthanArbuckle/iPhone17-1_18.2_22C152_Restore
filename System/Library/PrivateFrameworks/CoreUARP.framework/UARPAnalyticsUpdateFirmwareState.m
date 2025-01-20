@interface UARPAnalyticsUpdateFirmwareState
- (BOOL)isEqual:(id)a3;
- (UARPAccessoryID)accessoryID;
- (UARPAnalyticsUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4;
- (UARPAssetID)assetID;
- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)eventParams;
- (id)description;
- (unint64_t)age;
- (void)accessoryUnreachable;
- (void)setState:(int64_t)a3;
- (void)stagingCompleteWithStatus:(unint64_t)a3;
- (void)stagingInterrupted;
- (void)stagingStartedWithUserIntent:(BOOL)a3;
- (void)updateStagingDuration;
@end

@implementation UARPAnalyticsUpdateFirmwareState

- (UARPAnalyticsUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPAnalyticsUpdateFirmwareState;
  v8 = [(UARPAnalyticsUpdateFirmwareState *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    accessoryID = v8->_accessoryID;
    v8->_accessoryID = (UARPAccessoryID *)v9;

    uint64_t v11 = [v7 copy];
    assetID = v8->_assetID;
    v8->_assetID = (UARPAssetID *)v11;

    uint64_t v13 = [MEMORY[0x263EFF910] date];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v13;

    os_log_t v15 = os_log_create("com.apple.accessoryupdater.uarp", "analytics");
    log = v8->_log;
    v8->_log = (OS_os_log *)v15;
  }
  return v8;
}

- (void)stagingStartedWithUserIntent:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v8, 0x16u);
  }
  if ((self->_state | 2) == 2)
  {
    id v6 = [MEMORY[0x263EFF910] date];
    stagingDurationStart = self->_stagingDurationStart;
    self->_stagingDurationStart = v6;

    ++self->_stagingIterations;
    [(UARPAnalyticsUpdateFirmwareState *)self setState:1];
    self->_stagingUserInitiated = a3;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:]();
  }
}

- (void)stagingInterrupted
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Staging interrupted while in an unexpected state: %s", v2, v3, v4, v5, 2u);
}

- (void)stagingCompleteWithStatus:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "-[UARPAnalyticsUpdateFirmwareState stagingCompleteWithStatus:]";
    __int16 v11 = 2112;
    uint64_t v12 = self;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v9, 0x16u);
  }
  if (self->_state == 1)
  {
    [(UARPAnalyticsUpdateFirmwareState *)self setState:3];
    [(UARPAnalyticsUpdateFirmwareState *)self updateStagingDuration];
    if (a3 > 8) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = qword_21E104F90[a3];
    }
    id v7 = [NSNumber numberWithInteger:v6];
    stagingStatus = self->_stagingStatus;
    self->_stagingStatus = v7;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPAnalyticsUpdateFirmwareState stagingCompleteWithStatus:]();
  }
}

- (void)updateStagingDuration
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_stagingDurationStart];
  double v5 = v4;

  stagingDurationStart = self->_stagingDurationStart;
  self->_stagingDurationSeconds += (unint64_t)v5;
  self->_stagingDurationStart = 0;
}

- (void)accessoryUnreachable
{
  if (self->_state == 1) {
    [(UARPAnalyticsUpdateFirmwareState *)self stagingInterrupted];
  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t state = self->_state;
  if (state > 3) {
    uint64_t v6 = "unrecognized";
  }
  else {
    uint64_t v6 = off_264491C00[state];
  }
  if ((unint64_t)a3 > 3) {
    id v7 = "unrecognized";
  }
  else {
    id v7 = off_264491C00[a3];
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412802;
    __int16 v10 = self;
    __int16 v11 = 2080;
    uint64_t v12 = v6;
    __int16 v13 = 2080;
    v14 = v7;
    _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "%@ state change: %s -> %s", (uint8_t *)&v9, 0x20u);
  }
  self->_unint64_t state = a3;
}

- (unint64_t)age
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_startDate];
  unint64_t v5 = (unint64_t)v4;

  return v5;
}

- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)eventParams
{
  uint64_t v3 = objc_alloc_init(UARPUpdateFirmwareAnalyticsEventFrameworkParams);
  double v4 = [NSNumber numberWithBool:self->_stagingUserInitiated];
  [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v3 setStagingUserInitiated:v4];

  unint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_stagingDurationSeconds];
  [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v3 setStagingDuration:v5];

  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_stagingIterations];
  [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v3 setStagingIterations:v6];

  [(UARPUpdateFirmwareAnalyticsEventFrameworkParams *)v3 setStagingStatus:self->_stagingStatus];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UARPAnalyticsUpdateFirmwareState *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v10 = 1;
    }
    else
    {
      unint64_t v5 = v4;
      accessoryID = self->_accessoryID;
      id v7 = [(UARPAnalyticsUpdateFirmwareState *)v5 accessoryID];
      if ([(UARPAccessoryID *)accessoryID isEqual:v7])
      {
        assetID = self->_assetID;
        int v9 = [(UARPAnalyticsUpdateFirmwareState *)v5 assetID];
        char v10 = [(UARPAssetID *)assetID isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(UARPAccessoryID *)self->_accessoryID manufacturer];
  id v7 = [(UARPAccessoryID *)self->_accessoryID modelName];
  int v8 = [(UARPAccessoryID *)self->_accessoryID serialNumber];
  int v9 = [(UARPAccessoryID *)self->_accessoryID firmwareVersion];
  char v10 = [(UARPAssetID *)self->_assetID assetVersion];
  __int16 v11 = [v3 stringWithFormat:@"<%@: %@ %@ [%@] %@ -> %@>", v5, v6, v7, v8, v9, v10];

  return v11;
}

- (UARPAccessoryID)accessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 104, 1);
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_analyticsApplyStatus, 0);
  objc_storeStrong((id *)&self->_analyticsApplyUserInitiated, 0);
  objc_storeStrong((id *)&self->_analyticsApplyDurationStart, 0);
  objc_storeStrong((id *)&self->_stagingStatus, 0);
  objc_storeStrong((id *)&self->_stagingDurationStart, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)stagingStartedWithUserIntent:.cold.1()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Staging started while in an unexpected state: %s", v2, v3, v4, v5, 2u);
}

- (void)stagingCompleteWithStatus:.cold.1()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Staging completed while in unexpected state: %s", v2, v3, v4, v5, 2u);
}

@end