@interface BRReportManager
+ (id)reporterWithCatergory:(unsigned __int16)a3;
- (BOOL)pairingReportUnderway;
- (BRRTCPairingReportManager)pairingReportManager;
- (BRReportManager)initWithCategory:(unsigned __int16)a3;
- (NSString)configuration;
- (id)categortyToConfiguration:(unsigned __int16)a3;
- (unsigned)category;
- (void)reportRTCMetric:(id)a3;
- (void)setCategory:(unsigned __int16)a3;
- (void)setConfiguration:(id)a3;
- (void)setPairingReportManager:(id)a3;
- (void)setPairingReportUnderway:(BOOL)a3;
@end

@implementation BRReportManager

- (BRReportManager)initWithCategory:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)BRReportManager;
  v4 = [(BRReportManager *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(BRReportManager *)v4 setCategory:v3];
    v6 = [(BRReportManager *)v5 categortyToConfiguration:v3];
    [(BRReportManager *)v5 setConfiguration:v6];
  }
  v7 = br_metriccollection_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_225AD1000, v7, OS_LOG_TYPE_DEFAULT, "Returning report manager: %@", buf, 0xCu);
  }

  return v5;
}

+ (id)reporterWithCatergory:(unsigned __int16)a3
{
  uint64_t v3 = (void *)[objc_alloc((Class)a1) initWithCategory:a3];

  return v3;
}

- (void)reportRTCMetric:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = br_metriccollection_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[BRReportManager reportRTCMetric:]";
    _os_log_impl(&dword_225AD1000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [v4 dictionaryRepresentation];
  v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v14 = (void *)MEMORY[0x263F087E8];
              uint64_t v23 = *MEMORY[0x263F08320];
              v24 = @"RTC only accepts NSString, NSNumber, or NSDate as submittable values";
              v15 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
              id v16 = [v14 errorWithDomain:@"BRReportingErrorDomain" code:3 userInfo:v15];

              objc_exception_throw(v16);
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(BRReportManager *)self configuration];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __35__BRReportManager_reportRTCMetric___block_invoke;
  v17[3] = &unk_264763CA8;
  v17[4] = self;
  id v18 = v4;
  id v13 = v4;
  +[BRRTCSession startRTCReportingSessionWithConfiguration:v12 andComplection:v17];
}

void __35__BRReportManager_reportRTCMetric___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) category];
    uint64_t v8 = [*(id *)(a1 + 40) rtcType];
    uint64_t v9 = [*(id *)(a1 + 40) dictionaryRepresentation];
    [v5 sendMessageWithCategory:v7 type:v8 payload:v9 error:0];
  }
  else
  {
    uint64_t v9 = br_metriccollection_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_225AD1000, v9, OS_LOG_TYPE_DEFAULT, "RTC session failed with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)categortyToConfiguration:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = &unk_26D930508;
  v8[1] = &unk_26D930520;
  v9[0] = @"WatchPairing";
  v9[1] = @"WatchMigration";
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v5 = [NSNumber numberWithUnsignedShort:v3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (unsigned)category
{
  return self->_category;
}

- (void)setCategory:(unsigned __int16)a3
{
  self->_category = a3;
}

- (NSString)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BRRTCPairingReportManager)pairingReportManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingReportManager);

  return (BRRTCPairingReportManager *)WeakRetained;
}

- (void)setPairingReportManager:(id)a3
{
}

- (BOOL)pairingReportUnderway
{
  return self->_pairingReportUnderway;
}

- (void)setPairingReportUnderway:(BOOL)a3
{
  self->_pairingReportUnderway = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingReportManager);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end