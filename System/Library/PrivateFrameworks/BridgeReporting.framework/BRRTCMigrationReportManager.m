@interface BRRTCMigrationReportManager
- (BOOL)metricSubmitted;
- (BOOL)migrationBegan;
- (BRRTCMigrationMetric)migrationMetric;
- (BRRTCMigrationReportManager)initWithPairingID:(id)a3;
- (NSUUID)pairingID;
- (id)_likelyOffendingTransaction;
- (id)_transactionNameFromKey:(id)a3;
- (id)formatDate:(id)a3;
- (void)addDeviceDetails:(id)a3;
- (void)addTransactionPhase:(id)a3 withSuccess:(BOOL)a4 withPairingID:(id)a5;
- (void)setErrorCode:(id)a3 domain:(id)a4 description:(id)a5;
- (void)setIsAutomation:(BOOL)a3;
- (void)setLastActiveDate:(id)a3;
- (void)setMetricSubmitted:(BOOL)a3;
- (void)setMigrationBegan:(BOOL)a3;
- (void)setMigrationDeviceUnpairedBecauseKeychainIsOff:(BOOL)a3;
- (void)setMigrationDeviceUnpairedBecauseStale:(BOOL)a3;
- (void)setMigrationDeviceUnpairedByUserAction:(BOOL)a3;
- (void)setMigrationFailedBTKeysNotSynced:(BOOL)a3;
- (void)setMigrationMetric:(id)a3;
- (void)setMigrationSucceeded:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)submitMetic;
@end

@implementation BRRTCMigrationReportManager

- (BRRTCMigrationReportManager)initWithPairingID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRRTCMigrationReportManager;
  v6 = [(BRRTCMigrationReportManager *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(BRRTCMigrationMetric);
    migrationMetric = v6->_migrationMetric;
    v6->_migrationMetric = v7;

    objc_storeStrong((id *)&v6->_pairingID, a3);
  }

  return v6;
}

- (void)addTransactionPhase:(id)a3 withSuccess:(BOOL)a4 withPairingID:(id)a5
{
  BOOL v5 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = br_metriccollection_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"Failure";
    if (v5) {
      v9 = @"Success";
    }
    int v15 = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_225AD1000, v8, OS_LOG_TYPE_DEFAULT, "Adding transaction phase: %@ with success: %@", (uint8_t *)&v15, 0x16u);
  }

  objc_super v10 = [(BRRTCMigrationMetric *)self->_migrationMetric transactionPhases];
  v11 = [v10 objectForKey:v7];

  if (v11)
  {
    v12 = br_metriccollection_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225AD1000, v12, OS_LOG_TYPE_DEFAULT, "migration phase already recorded, skipping...", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    v12 = [(BRRTCMigrationReportManager *)self migrationMetric];
    v13 = [v12 transactionPhases];
    v14 = [NSNumber numberWithBool:v5];
    [v13 setObject:v14 forKey:v7];
  }
}

- (void)addDeviceDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v5 setDeviceDetails:v4];
}

- (void)setIsAutomation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v4 setIsAutomation:v3];
}

- (void)setErrorCode:(id)a3 domain:(id)a4 description:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = br_metriccollection_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_225AD1000, v11, OS_LOG_TYPE_DEFAULT, "Setting migration failure code %@ with description %@", (uint8_t *)&v15, 0x16u);
  }

  v12 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v12 setMigrationFailureCode:v8];

  v13 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v13 setMigrationFailureDomain:v10];

  v14 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v14 setMigrationFailureDescription:v9];
}

- (void)setMigrationFailedBTKeysNotSynced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"is";
    if (v3) {
      v6 = @"not";
    }
    int v8 = 136315394;
    id v9 = "-[BRRTCMigrationReportManager setMigrationFailedBTKeysNotSynced:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "%s %@ synced", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v7 setMigrationFailedBTKeysNotSynced:v3];
}

- (void)setMigrationDeviceUnpairedBecauseKeychainIsOff:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"not";
    if (v3) {
      v6 = @"indeed";
    }
    int v8 = 136315394;
    id v9 = "-[BRRTCMigrationReportManager setMigrationDeviceUnpairedBecauseKeychainIsOff:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "%s keychain is %@ off", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v7 setMigrationDeviceUnpairedBecauseKeychainIsOff:v3];
}

- (void)setMigrationDeviceUnpairedBecauseStale:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"didn't";
    if (v3) {
      v6 = @"did";
    }
    int v8 = 136315394;
    id v9 = "-[BRRTCMigrationReportManager setMigrationDeviceUnpairedBecauseStale:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "%s device %@ unpair", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v7 setMigrationDeviceUnpairedBecauseStale:v3];
}

- (void)setMigrationDeviceUnpairedByUserAction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"didn't";
    if (v3) {
      v6 = @"did";
    }
    int v8 = 136315394;
    id v9 = "-[BRRTCMigrationReportManager setMigrationDeviceUnpairedByUserAction:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "%s device %@ unpair by user action", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v7 setMigrationDeviceUnpairedByUserAction:v3];
}

- (void)setMigrationSucceeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = @"did not";
    if (v3) {
      v6 = @"did";
    }
    int v8 = 136315394;
    id v9 = "-[BRRTCMigrationReportManager setMigrationSucceeded:]";
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "%s Migration %@ succeed", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v7 setMigrationSucceeded:v3];
}

- (void)setMigrationBegan:(BOOL)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  id v6 = [(BRRTCMigrationReportManager *)self formatDate:v4];

  id v5 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v5 setMigrationBeganTime:v6];
}

- (void)setLastActiveDate:(id)a3
{
  id v5 = [(BRRTCMigrationReportManager *)self formatDate:a3];
  id v4 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v4 setLastActiveDate:v5];
}

- (void)setSessionID:(id)a3
{
  id v4 = a3;
  id v5 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v5 setSessionID:v4];
}

- (void)submitMetic
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BRRTCMigrationReportManager *)self _likelyOffendingTransaction];
  if (v3)
  {
    id v4 = [(BRRTCMigrationReportManager *)self migrationMetric];
    [v4 setSuspectTransaction:v3];
  }
  id v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BRRTCMigrationReportManager *)self migrationMetric];
    id v7 = [v6 dictionaryRepresentation];
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "Request to submit migration Metric with these keys: %@", (uint8_t *)&v10, 0xCu);
  }
  int v8 = +[BRReportManager reporterWithCatergory:2000];
  id v9 = [(BRRTCMigrationReportManager *)self migrationMetric];
  [v8 reportRTCMetric:v9];

  [(BRRTCMigrationReportManager *)self setMetricSubmitted:1];
  [(BRRTCMigrationReportManager *)self setMigrationMetric:0];
}

- (id)_transactionNameFromKey:(id)a3
{
  id v3 = a3;
  id v4 = [v3 substringFromIndex:objc_msgSend(@"MigrationPhonePhase", "length")];

  id v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 3);

  return v5;
}

- (id)_likelyOffendingTransaction
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(BRRTCMigrationReportManager *)self migrationMetric];
  id v4 = [v3 transactionPhases];

  if (v4)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__BRRTCMigrationReportManager__likelyOffendingTransaction__block_invoke;
    v9[3] = &unk_264763C80;
    v9[4] = self;
    v9[5] = &v10;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    id v5 = br_metriccollection_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v11[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v6;
      _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "offending transaction %@", buf, 0xCu);
    }

    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __58__BRRTCMigrationReportManager__likelyOffendingTransaction__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  if (([v7 BOOLValue] & 1) != 0 || *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (([v7 BOOLValue] & 1) == 0) {
      *a4 = 1;
    }
  }
  else
  {
    int v8 = NSString;
    id v9 = [*(id *)(a1 + 32) _transactionNameFromKey:v13];
    uint64_t v10 = [v8 stringWithFormat:@"EPSagaTransaction%@", v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)formatDate:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  if (BRIsInternalInstall()) {
    uint64_t v6 = @"yyyy.MM.dd_HH-mm-ss";
  }
  else {
    uint64_t v6 = @"yyyy.MM.dd_HH-mm";
  }
  [v5 setDateFormat:v6];
  id v7 = [v5 stringFromDate:v4];

  return v7;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (BOOL)migrationBegan
{
  return self->_migrationBegan;
}

- (BOOL)metricSubmitted
{
  return self->_metricSubmitted;
}

- (void)setMetricSubmitted:(BOOL)a3
{
  self->_metricSubmitted = a3;
}

- (BRRTCMigrationMetric)migrationMetric
{
  return self->_migrationMetric;
}

- (void)setMigrationMetric:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationMetric, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end