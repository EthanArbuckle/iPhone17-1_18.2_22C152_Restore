@interface AnalyticsAgent
+ (id)_awdSignificantOperationalEventMetricForSignificantEvent:(int)a3 orEventName:(id)a4 errorContext:(int)a5 error:(id)a6 status:(int)a7;
+ (id)_awdSymptomsDiagnosticIncidentReportMetricForDiagnosticCase:(id)a3;
+ (id)_awdSymptomsDiagnosticNotificationTokenMetricForTokenString:(id)a3;
+ (id)sharedInstance;
+ (int)awdDampeningType:(signed __int16)a3;
+ (int)awdHandledResult:(signed __int16)a3;
+ (void)updateAWDReport:(id)a3 withEvents:(id)a4;
- (AWDServerConnection)symptomsAWDConnection;
- (AnalyticsAgent)initWithSymptomsAWDConnection:(id)a3 queue:(id)a4;
- (NSSet)awdSymptomsConfiguredMetricIds;
- (OS_dispatch_queue)queue;
- (void)_handleQuery:(unsigned int)a3;
- (void)_postMetric:(id)a3 metricIdentifier:(unsigned int)a4;
- (void)_registerAWDQueriableMetric:(unsigned int)a3;
- (void)apnsPostAPNSNotEnabled;
- (void)apnsPostNotificationToken:(id)a3;
- (void)apnsPostTokenConversionError;
- (void)apnsPostTokenEmpty;
- (void)apnsPostTokenNotSet;
- (void)postDiagnosticIncidentReportForCase:(id)a3;
- (void)postMetricForSignificantEvent:(int)a3 errorContext:(int)a4 error:(id)a5 status:(int)a6;
- (void)postMetricForSignificantEventWithName:(id)a3 errorContext:(int)a4 error:(id)a5 status:(int)a6;
- (void)setAwdSymptomsConfiguredMetricIds:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSymptomsAWDConnection:(id)a3;
@end

@implementation AnalyticsAgent

- (AnalyticsAgent)initWithSymptomsAWDConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AnalyticsAgent;
  v9 = [(AnalyticsAgent *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_symptomsAWDConnection, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    [(AnalyticsAgent *)v10 _registerAWDQueriableMetric:3145742];
    symptomsAWDConnection = v10->_symptomsAWDConnection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke;
    v15[3] = &unk_263FC3D10;
    v16 = v10;
    if (([(AWDServerConnection *)symptomsAWDConnection registerConfigChangeCallback:v15] & 1) == 0)
    {
      v12 = analyticsLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Failed to register for Symptoms AWD config change", v14, 2u);
      }
    }
  }

  return v10;
}

void __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke_2;
  block[3] = &unk_263FC3018;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __54__AnalyticsAgent_initWithSymptomsAWDConnection_queue___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = analyticsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [*(id *)(a1 + 32) description];
    uint64_t v4 = [v3 UTF8String];
    id v5 = [*(id *)(a1 + 40) description];
    int v11 = 136315394;
    uint64_t v12 = v4;
    __int16 v13 = 2080;
    uint64_t v14 = [v5 UTF8String];
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "Symptoms AWD metric ids configured, queriables: %s, triggers: %s", (uint8_t *)&v11, 0x16u);
  }
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v8 = [v6 setWithArray:v7];
  uint64_t v9 = *(void *)(a1 + 48);
  v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;

  return v2;
}

void __32__AnalyticsAgent_sharedInstance__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.autobugcapture.analytics", v0);
  if (!v1)
  {
    v2 = analyticsLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_ERROR, "Failed to create queue", buf, 2u);
    }
  }
  id v3 = (void *)[objc_alloc(MEMORY[0x263F864B0]) initWithComponentId:48];
  if (!v3)
  {
    id v5 = analyticsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "Failed to create symptoms AWD connection", v6, 2u);
    }
    goto LABEL_10;
  }
  if (v1)
  {
    uint64_t v4 = [[AnalyticsAgent alloc] initWithSymptomsAWDConnection:v3 queue:v1];
    id v5 = sharedInstance_sharedInstance_3;
    sharedInstance_sharedInstance_3 = (uint64_t)v4;
LABEL_10:
  }
}

- (void)_registerAWDQueriableMetric:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  symptomsAWDConnection = self->_symptomsAWDConnection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke;
  v6[3] = &unk_263FC3458;
  v6[4] = self;
  if (([(AWDServerConnection *)symptomsAWDConnection registerQueriableMetric:*(void *)&a3 callback:v6] & 1) == 0)
  {
    id v5 = analyticsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v8 = a3;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "Failed to register queriable for 0x%x", buf, 8u);
    }
  }
}

void __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke_2;
  v5[3] = &unk_263FC3D38;
  v5[4] = *(void *)(a1 + 32);
  int v6 = a2;
  dispatch_async(v4, v5);
}

uint64_t __46__AnalyticsAgent__registerAWDQueriableMetric___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQuery:*(unsigned int *)(a1 + 40)];
}

- (void)_postMetric:(id)a3 metricIdentifier:(unsigned int)a4
{
  id v6 = a3;
  id v7 = [(AnalyticsAgent *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__AnalyticsAgent__postMetric_metricIdentifier___block_invoke;
  block[3] = &unk_263FC3D60;
  unsigned int v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __47__AnalyticsAgent__postMetric_metricIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) newMetricContainerWithIdentifier:*(unsigned int *)(a1 + 48)];
  id v3 = v2;
  if (!v2)
  {
    id v6 = analyticsLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v11 = *(_DWORD *)(a1 + 48);
    int v13 = 67109120;
    int v14 = v11;
    id v8 = "awd is not interested in metric ID %ul";
LABEL_9:
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_10;
  }
  [v2 setMetric:*(void *)(a1 + 40)];
  int v4 = [*(id *)(*(void *)(a1 + 32) + 16) submitMetric:v3];
  id v5 = analyticsLogHandle();
  id v6 = v5;
  if (!v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v12 = *(_DWORD *)(a1 + 48);
    int v13 = 67109120;
    int v14 = v12;
    id v8 = "Failed to send a metric with ID %ul";
    goto LABEL_9;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = *(_DWORD *)(a1 + 48);
    int v13 = 67109120;
    int v14 = v7;
    id v8 = "Successfully sent a metric with ID %ul";
    uint64_t v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl(&dword_209DBA000, v9, v10, v8, (uint8_t *)&v13, 8u);
  }
LABEL_11:
}

- (void)_handleQuery:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = analyticsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Received queriable metric request for metric ID %ul", (uint8_t *)v6, 8u);
  }

  if (a3 == 3145742)
  {
    id v5 = analyticsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Submitting APNS token to AWD has been deprecated", (uint8_t *)v6, 2u);
    }
  }
}

+ (id)_awdSymptomsDiagnosticNotificationTokenMetricForTokenString:(id)a3
{
  id v3 = a3;
  int v4 = objc_alloc_init(AWDSymptomsDiagnosticNotificationToken);
  [(AWDSymptomsDiagnosticNotificationToken *)v4 setNotificationToken:v3];

  return v4;
}

+ (id)_awdSymptomsDiagnosticIncidentReportMetricForDiagnosticCase:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(AWDSymptomsDiagnosticIncidentReport);
  [v4 caseOpenedTime];
  [(AWDSymptomsDiagnosticIncidentReport *)v5 setTimestamp:(unint64_t)(v6 * 1000.0)];
  [(AWDSymptomsDiagnosticIncidentReport *)v5 setVersion:2];
  -[AWDSymptomsDiagnosticIncidentReport setHandledResult:](v5, "setHandledResult:", +[AnalyticsAgent awdHandledResult:](AnalyticsAgent, "awdHandledResult:", [v4 dampeningType]));
  uint64_t v7 = +[AnalyticsAgent awdDampeningType:](AnalyticsAgent, "awdDampeningType:", [v4 dampeningType]);
  if ((int)v7 >= 1) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setDampeningType:v7];
  }
  [v4 caseClosedTime];
  double v9 = v8;
  [v4 caseOpenedTime];
  if (v9 > v10)
  {
    [v4 caseClosedTime];
    double v12 = v11;
    [v4 caseOpenedTime];
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setDuration:(unint64_t)(v13 * -1000.0 + v12 * 1000.0)];
  }
  int v14 = [v4 caseId];

  if (v14)
  {
    uint64_t v15 = [v4 caseId];
    v16 = [v15 UUIDString];
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setIdentifier:v16];
  }
  objc_super v17 = [v4 signature];
  v18 = [v17 objectForKeyedSubscript:@"groupID"];

  if ([v18 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setGroupIdentifier:v18];
  }
  v19 = [v4 signature];
  v20 = [v19 objectForKeyedSubscript:@"domain"];

  if ([v20 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setDomain:v20];
  }
  v21 = [v4 signature];
  v22 = [v21 objectForKeyedSubscript:@"type"];

  if ([v22 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setType:v22];
  }
  v23 = [v4 signature];
  v24 = [v23 objectForKeyedSubscript:@"subtype"];

  if ([v24 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setSubtype:v24];
  }
  v57 = v22;
  v25 = [v4 signature];
  v26 = [v25 objectForKeyedSubscript:@"additional"];

  if ([v26 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setSubtypeContext:v26];
  }
  v55 = v26;
  v56 = v24;
  v27 = [v4 signature];
  v28 = [v27 objectForKeyedSubscript:@"detected"];
  if (v28)
  {
  }
  else
  {
    v29 = [v4 signature];
    v30 = [v29 objectForKeyedSubscript:@"bundleID"];

    if (!v30) {
      goto LABEL_25;
    }
  }
  v31 = [v4 signature];
  v32 = [v31 objectForKeyedSubscript:@"bundleID"];

  if (![v32 length])
  {
    v33 = [v4 signature];
    uint64_t v34 = [v33 objectForKeyedSubscript:@"detected"];

    v32 = (void *)v34;
  }
  if ([v32 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setDetectedName:v32];
  }

LABEL_25:
  v35 = [v4 signature];
  v36 = [v35 objectForKeyedSubscript:@"effective"];

  if ([v36 length]) {
    [(AWDSymptomsDiagnosticIncidentReport *)v5 setEffectiveName:v36];
  }
  v37 = [v4 signature];
  v38 = [v37 objectForKeyedSubscript:@"related"];

  if (v38)
  {
    v39 = [v4 signature];
    v40 = [v39 objectForKeyedSubscript:@"related"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = v20;
      v53 = v18;
      id v54 = a1;
      id v41 = v40;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v58 objects:v62 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v59 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v46 length]) {
              [(AWDSymptomsDiagnosticIncidentReport *)v5 addRelatedNames:v46];
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v58 objects:v62 count:16];
        }
        while (v43);
      }

      a1 = v54;
      v20 = v52;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v47 = v40;
        if ([v47 length]) {
          [(AWDSymptomsDiagnosticIncidentReport *)v5 addRelatedNames:v47];
        }
      }
    }
  }
  v48 = objc_msgSend(v4, "events", v52, v53, v54);
  uint64_t v49 = [v48 count];

  if (v49)
  {
    v50 = [v4 events];
    [a1 updateAWDReport:v5 withEvents:v50];
  }

  return v5;
}

+ (int)awdHandledResult:(signed __int16)a3
{
  if (a3 == -1) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 1;
  }
}

+ (int)awdDampeningType:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3 + 2;
  if (v4 < 7) {
    return dword_209E3E338[v4];
  }
  double v6 = analyticsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Found unexpected dampening type %d", (uint8_t *)v7, 8u);
  }

  return 0;
}

+ (void)updateAWDReport:(id)a3 withEvents:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v5 = a4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    id v34 = v5;
    uint64_t v35 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      uint64_t v36 = v7;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v37 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v11 = [v10 objectForKeyedSubscript:@"type"];
          if ([v11 isEqualToString:@"probe"])
          {
            double v12 = [v10 objectForKeyedSubscript:@"status"];
            double v13 = [v10 objectForKeyedSubscript:@"result"];
            uint64_t v14 = 2;
            goto LABEL_11;
          }
          if ([v11 isEqualToString:@"symptom"])
          {
            double v13 = 0;
            double v12 = 0;
            uint64_t v14 = 1;
LABEL_11:
            uint64_t v15 = analyticsLogHandle();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = v11;
              _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Processing event of type: %@", buf, 0xCu);
            }

            v16 = [v10 objectForKeyedSubscript:@"name"];
            objc_super v17 = [v10 objectForKeyedSubscript:@"process"];
            v18 = [v10 objectForKeyedSubscript:@"timestamp"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v18 timeIntervalSince1970];
              goto LABEL_18;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              [v18 doubleValue];
LABEL_18:
              double v20 = v19;
              if (v19 > 0.0)
              {
                v21 = objc_alloc_init(AWDSymptomsDiagnosticIncidentEvent);
                [(AWDSymptomsDiagnosticIncidentEvent *)v21 setType:v14];
                if ([v16 length]) {
                  [(AWDSymptomsDiagnosticIncidentEvent *)v21 setName:v16];
                }
                if ([v17 length]) {
                  [(AWDSymptomsDiagnosticIncidentEvent *)v21 setDetectedName:v17];
                }
                v22 = analyticsLogHandle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v42 = v12;
                  _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_INFO, " kSymptomDiagnosticKeyEventStatus is %@", buf, 0xCu);
                }

                if ([v12 length])
                {
                  if (([v12 isEqualToString:@"starting"] & 1) != 0
                    || ([v12 isEqualToString:@"Starting"] & 1) != 0
                    || ([v12 isEqualToString:@"Requesting"] & 1) != 0)
                  {
                    uint64_t v23 = 1;
                    goto LABEL_30;
                  }
                  if (([v12 isEqualToString:@"finished"] & 1) != 0
                    || ([v12 isEqualToString:@"Finished"] & 1) != 0)
                  {
                    goto LABEL_66;
                  }
                  if ([v12 isEqualToString:@"success"])
                  {
                    uint64_t v31 = 1;
                    goto LABEL_65;
                  }
                  if ([v12 isEqualToString:@"failure"])
                  {
                    uint64_t v31 = 2;
LABEL_65:
                    [(AWDSymptomsDiagnosticIncidentEvent *)v21 setStatus:v31];
LABEL_66:
                    uint64_t v23 = 2;
LABEL_30:
                    [(AWDSymptomsDiagnosticIncidentEvent *)v21 setState:v23];
                  }
                }
                v24 = analyticsLogHandle();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v42 = v13;
                  _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_INFO, " kSymptomDiagnosticKeyEventResult is %@", buf, 0xCu);
                }

                if ([v13 length])
                {
                  if ([v13 isEqualToString:@"success"])
                  {
                    uint64_t v25 = 1;
                    goto LABEL_40;
                  }
                  if ([v13 isEqualToString:@"failure"])
                  {
                    uint64_t v25 = 2;
                    goto LABEL_40;
                  }
                  if ([v12 isEqualToString:@"timeout"])
                  {
                    uint64_t v25 = 3;
LABEL_40:
                    [(AWDSymptomsDiagnosticIncidentEvent *)v21 setStatus:v25];
                  }
                }
                if ([(AWDSymptomsDiagnosticIncidentEvent *)v21 hasState])
                {
                  v26 = analyticsLogHandle();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                  {
                    v27 = [(AWDSymptomsDiagnosticIncidentEvent *)v21 stateAsString:[(AWDSymptomsDiagnosticIncidentEvent *)v21 state]];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v42 = v27;
                    _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEBUG, "  state: %@", buf, 0xCu);

                    id v5 = v34;
                  }
                }
                if ([(AWDSymptomsDiagnosticIncidentEvent *)v21 hasStatus])
                {
                  v28 = analyticsLogHandle();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    v29 = [(AWDSymptomsDiagnosticIncidentEvent *)v21 statusAsString:[(AWDSymptomsDiagnosticIncidentEvent *)v21 status]];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v42 = v29;
                    _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_DEBUG, "  status: %@", buf, 0xCu);

                    id v5 = v34;
                  }
                }
                if ([(AWDSymptomsDiagnosticIncidentEvent *)v21 hasState]
                  || [(AWDSymptomsDiagnosticIncidentEvent *)v21 hasStatus])
                {
                  v30 = analyticsLogHandle();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_INFO, " Adding event to AWD incident report.", buf, 2u);
                  }

                  [v33 addIncidentEvents:v21];
                  [v33 addTimestampsIncidentEvents:(unint64_t)(v20 * 1000.0)];
                  id v5 = v34;
                }
              }
            }

            uint64_t v8 = v35;
            uint64_t v7 = v36;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v32 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
      uint64_t v7 = v32;
    }
    while (v32);
  }
}

+ (id)_awdSignificantOperationalEventMetricForSignificantEvent:(int)a3 orEventName:(id)a4 errorContext:(int)a5 error:(id)a6 status:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a6;
  if ((int)v10 <= 0 && ![v11 length])
  {
    uint64_t v15 = analyticsLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109378;
      v21[1] = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      v16 = "Cannot create SignificantOperationalEvent metric without a valid event (%d) or event name (%@)!";
      objc_super v17 = v15;
      uint32_t v18 = 18;
      goto LABEL_18;
    }
LABEL_19:

    uint64_t v14 = 0;
    goto LABEL_20;
  }
  double v13 = objc_opt_new();
  if (!v13)
  {
    uint64_t v15 = analyticsLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      v16 = "Unable to create AWDSymptomsSignificantOperationalEvent object!";
      objc_super v17 = v15;
      uint32_t v18 = 2;
LABEL_18:
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v21, v18);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  if ((int)v10 < 1)
  {
    if ([v11 length]) {
      [v14 setAlternateName:v11];
    }
  }
  else
  {
    [v13 setName:v10];
  }
  if ((int)v9 >= 1) {
    [v14 setError:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v19 = [v12 domain];
    [v14 setErrorDomain:v19];

    objc_msgSend(v14, "setErrorCode:", objc_msgSend(v12, "code"));
  }
  if ((int)v7 >= 1) {
    [v14 setStatus:v7];
  }
LABEL_20:

  return v14;
}

- (void)apnsPostNotificationToken:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = analyticsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Creating AWDSymptomsDiagnosticNotificationToken metric with token string %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = +[AnalyticsAgent _awdSymptomsDiagnosticNotificationTokenMetricForTokenString:v4];
  [(AnalyticsAgent *)self _postMetric:v6 metricIdentifier:3145742];
}

- (void)apnsPostTokenConversionError
{
}

- (void)apnsPostAPNSNotEnabled
{
}

- (void)apnsPostTokenNotSet
{
}

- (void)apnsPostTokenEmpty
{
}

- (void)postDiagnosticIncidentReportForCase:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = analyticsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Creating AWDSymptomsDiagnosticIncidentReport for diagnostic case: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = +[AnalyticsAgent _awdSymptomsDiagnosticIncidentReportMetricForDiagnosticCase:v3];
  uint64_t v6 = +[AnalyticsAgent sharedInstance];
  [v6 _postMetric:v5 metricIdentifier:3145739];
}

- (void)postMetricForSignificantEvent:(int)a3 errorContext:(int)a4 error:(id)a5 status:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a5;
  uint64_t v10 = analyticsLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 1024;
    int v15 = v7;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "Creating AWDSymptomsSignificantOperationalEvent metric with event %d, error context %d, status %d, error: %@", (uint8_t *)v13, 0x1Eu);
  }

  id v11 = +[AnalyticsAgent _awdSignificantOperationalEventMetricForSignificantEvent:v8 orEventName:0 errorContext:v7 error:v9 status:v6];
  id v12 = +[AnalyticsAgent sharedInstance];
  [v12 _postMetric:v11 metricIdentifier:3145749];
}

- (void)postMetricForSignificantEventWithName:(id)a3 errorContext:(int)a4 error:(id)a5 status:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = analyticsLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138413058;
    id v15 = v9;
    __int16 v16 = 1024;
    int v17 = v8;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Creating AWDSymptomsSignificantOperationalEvent metric with event name %@, error context %d, status %d, error: %@", (uint8_t *)&v14, 0x22u);
  }

  id v12 = +[AnalyticsAgent _awdSignificantOperationalEventMetricForSignificantEvent:0 orEventName:v9 errorContext:v8 error:v10 status:v6];
  double v13 = +[AnalyticsAgent sharedInstance];
  [v13 _postMetric:v12 metricIdentifier:3145749];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (AWDServerConnection)symptomsAWDConnection
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSymptomsAWDConnection:(id)a3
{
}

- (NSSet)awdSymptomsConfiguredMetricIds
{
  return self->_awdSymptomsConfiguredMetricIds;
}

- (void)setAwdSymptomsConfiguredMetricIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdSymptomsConfiguredMetricIds, 0);
  objc_storeStrong((id *)&self->_symptomsAWDConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end