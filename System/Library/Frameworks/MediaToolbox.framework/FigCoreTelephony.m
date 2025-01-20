@interface FigCoreTelephony
- (FigCoreTelephony)initWithError:(id *)a3;
- (NSDictionary)signalStrength;
- (NSString)carrierName;
- (int)bars;
- (void)dealloc;
- (void)saveCarrierName;
- (void)saveSignalStrengthInfo;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
@end

@implementation FigCoreTelephony

- (int)bars
{
  MEMORY[0x19970E290](self->_cellStatsLock, a2);
  int bars = self->bars;
  MEMORY[0x19970E2B0](self->_cellStatsLock);
  return bars;
}

- (NSDictionary)signalStrength
{
  MEMORY[0x19970E290](self->_cellStatsLock, a2);
  v3 = (void *)[(NSDictionary *)self->signalStrength copy];
  MEMORY[0x19970E2B0](self->_cellStatsLock);

  return (NSDictionary *)v3;
}

- (NSString)carrierName
{
  MEMORY[0x19970E290](self->_cellStatsLock, a2);
  v3 = (void *)[(NSString *)self->carrierName copy];
  MEMORY[0x19970E2B0](self->_cellStatsLock);

  return (NSString *)v3;
}

- (void)saveSignalStrengthInfo
{
  uint64_t v11 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    uint64_t v4 = [(CoreTelephonyClient *)self->ctClient getCurrentDataServiceDescriptorSync:&v11];
    if (!v11)
    {
      uint64_t v5 = v4;
      v6 = (void *)[(CoreTelephonyClient *)self->ctClient getSignalStrengthMeasurements:v4 error:&v11];
      if (!v11)
      {
        v7 = v6;
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v6, "rssi"), @"rssi");
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "rsrp"), @"rsrp");
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "rscp"), @"rscp");
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "rsrq"), @"rsrq");
        objc_msgSend(v3, "setValue:forKey:", objc_msgSend(v7, "snr"), @"snr");
        uint64_t v8 = [MEMORY[0x1E4F23A68] contextWithServiceDescriptor:v5];
        if (v8)
        {
          uint64_t v9 = [(CoreTelephonyClient *)self->ctClient getSignalStrengthInfo:v8 error:&v11];
          if (v9)
          {
            v10 = (void *)v9;
            MEMORY[0x19970E290](self->_cellStatsLock);
            self->int bars = objc_msgSend((id)objc_msgSend(v10, "bars"), "intValue");
            MEMORY[0x19970E2B0](self->_cellStatsLock);
          }
        }
        MEMORY[0x19970E290](self->_cellStatsLock);

        self->signalStrength = (NSDictionary *)[v3 copy];
        MEMORY[0x19970E2B0](self->_cellStatsLock);
      }
    }
  }
}

- (FigCoreTelephony)initWithError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FigCoreTelephony;
  uint64_t v4 = [(FigCoreTelephony *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
    v5->ctClient = (CoreTelephonyClient *)v6;
    if (v6 && (uint64_t v7 = FigReentrantMutexCreate(), (v5->_cellStatsLock = (OpaqueFigReentrantMutex *)v7) != 0))
    {
      v5->signalStrength = 0;
      v5->carrierName = 0;
      [(FigCoreTelephony *)v5 saveCarrierName];
      [(FigCoreTelephony *)v5 saveSignalStrengthInfo];
      [(CoreTelephonyClient *)v5->ctClient setDelegate:v5];
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = (FigCoreTelephony *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CoreMediaErrorDomain" code:-19250 userInfo:0];
    }
  }
  *a3 = v4;
  return v5;
}

- (void)saveCarrierName
{
  uint64_t v6 = 0;
  id v3 = (void *)[(CoreTelephonyClient *)self->ctClient getPreferredDataSubscriptionContextSync:0];
  if (v3)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F23938]) initWithBundleType:1];
    if (v4)
    {
      uint64_t v5 = [(CoreTelephonyClient *)self->ctClient copyCarrierBundleValue:v3 key:@"CarrierName" bundleType:v4 error:&v6];
      id v3 = (void *)v5;
      if (!v6 && v5)
      {
        MEMORY[0x19970E290](self->_cellStatsLock);

        self->carrierName = (NSString *)objc_msgSend((id)-[CoreTelephonyClient getEnglishCarrierNameFor:error:](self->ctClient, "getEnglishCarrierNameFor:error:", v3, &v6), "copy");
        MEMORY[0x19970E2B0](self->_cellStatsLock);
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  [(FigCoreTelephony *)self saveSignalStrengthInfo];
  MEMORY[0x19970E290](self->_cellStatsLock);
  self->int bars = objc_msgSend((id)objc_msgSend(a4, "bars"), "intValue");

  JUMPOUT(0x19970E2B0);
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCoreTelephony;
  [(FigCoreTelephony *)&v3 dealloc];
}

@end