@interface FigCoreWiFi
- (FigCoreWiFi)initWithError:(id *)a3;
- (id)copyAllWiFiStats;
- (void)dealloc;
@end

@implementation FigCoreWiFi

- (id)copyAllWiFiStats
{
  if (!self->wifiStats) {
    return 0;
  }
  MEMORY[0x19970E290](self->_wifiStatsLock, a2);
  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->wifiStats, "objectForKeyedSubscript:", *MEMORY[0x1E4F5E2D0]), "copy");
  MEMORY[0x19970E2B0](self->_wifiStatsLock);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!v4) {
    goto LABEL_8;
  }
  MEMORY[0x19970E290](self->_wifiStatsLock);
  if (!self->ssid)
  {
    MEMORY[0x19970E2B0](self->_wifiStatsLock);
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend([NSString alloc], "initWithData:encoding:", self->ssid, 4, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
                 v26,
                 v27,
                 v28,
                 v29,
                 v30,
                 v31,
                 v32,
                 v33,
                 v34,
                 v35,
                 v36,
                 v37,
                 v38,
                 v39,
                 (void)v40);
  MEMORY[0x19970E2B0](self->_wifiStatsLock);
  if (v5)
  {
    v6 = objc_msgSend((id)objc_msgSend(v3, "linkQualityMetricData"), "copy");
    v7 = v6;
    if (v6)
    {
      [v6 getBytes:&v11 length:5536];
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithShort:", SWORD1(v11)), @"snr");
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "RSSI")), @"rssi");
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "CCA")), @"cca");
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "noise")), @"noise");
      [v4 setValue:v5 forKey:@"ssid"];
      v8 = NSNumber;
      [v3 rxRate];
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v8, "numberWithDouble:"), @"rx_rate");
      v9 = NSNumber;
      [v3 txRate];
      objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v9, "numberWithDouble:"), @"tx_rate");
    }
    goto LABEL_10;
  }
LABEL_9:
  v7 = 0;
LABEL_10:

  return v4;
}

- (FigCoreWiFi)initWithError:(id *)a3
{
  long long v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)FigCoreWiFi;
  id v4 = [(FigCoreWiFi *)&v12 init];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6 = v5;
  if (v4)
  {
    if (v5
      && (uint64_t v7 = FigReentrantMutexCreate(), (v4->_wifiStatsLock = (OpaqueFigReentrantMutex *)v7) != 0)
      && (id v8 = objc_alloc_init(MEMORY[0x1E4F5E318]), (v4->cwfInterface = (CWFInterface *)v8) != 0))
    {
      [v8 activate];
      uint64_t v9 = [(CWFInterface *)v4->cwfInterface cachedLinkQualityMetric];
      [v6 setValue:v9 forKey:*MEMORY[0x1E4F5E2D0]];
      MEMORY[0x19970E290](v4->_wifiStatsLock);
      v4->wifiStats = (NSDictionary *)[v6 copy];
      v4->ssid = (NSData *)objc_msgSend((id)-[CWFInterface SSID](v4->cwfInterface, "SSID"), "copy");
      MEMORY[0x19970E2B0](v4->_wifiStatsLock);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __29__FigCoreWiFi_initWithError___block_invoke;
      v11[3] = &unk_1E57A29D8;
      v11[4] = v4;
      [(CWFInterface *)v4->cwfInterface setEventHandler:v11];
      [(CWFInterface *)v4->cwfInterface startMonitoringEventType:7 error:&v13];
      if (!v13) {
        [(CWFInterface *)v4->cwfInterface startMonitoringEventType:2 error:&v13];
      }
    }
    else
    {
      long long v13 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CoreMediaErrorDomain" code:-19250 userInfo:0];
    }
  }

  *a3 = v13;
  return v4;
}

uint64_t __29__FigCoreWiFi_initWithError___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 type] == 7)
  {
    MEMORY[0x19970E290](*(void *)(*(void *)(a1 + 32) + 8));

    *(void *)(*(void *)(a1 + 32) + 24) = objc_msgSend((id)objc_msgSend(a2, "info"), "copy");
    MEMORY[0x19970E2B0](*(void *)(*(void *)(a1 + 32) + 8));
  }
  uint64_t result = [a2 type];
  if (result == 2)
  {
    MEMORY[0x19970E290](*(void *)(*(void *)(a1 + 32) + 8));

    *(void *)(*(void *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "SSID"), "copy");
    JUMPOUT(0x19970E2B0);
  }
  return result;
}

- (void)dealloc
{
  [(CWFInterface *)self->cwfInterface stopMonitoringEventType:2];
  [(CWFInterface *)self->cwfInterface stopMonitoringEventType:7];
  [(CWFInterface *)self->cwfInterface invalidate];

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCoreWiFi;
  [(FigCoreWiFi *)&v3 dealloc];
}

@end