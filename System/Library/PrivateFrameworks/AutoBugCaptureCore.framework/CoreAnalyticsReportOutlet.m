@interface CoreAnalyticsReportOutlet
- (BOOL)publishReportForCase:(id)a3 options:(id)a4;
- (id)buildDiagnosticIncidentEventForCase:(id)a3;
- (id)closureTypeForClosure:(signed __int16)a3;
- (id)dampeningResultForDampeningType:(signed __int16)a3;
- (id)handledResultForDampeningType:(signed __int16)a3;
@end

@implementation CoreAnalyticsReportOutlet

- (id)handledResultForDampeningType:(signed __int16)a3
{
  uint64_t v3 = 2;
  if (a3 == -1) {
    uint64_t v3 = 3;
  }
  if (a3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1;
  }
  return (id)[NSNumber numberWithUnsignedInteger:v4];
}

- (id)dampeningResultForDampeningType:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3 + 2;
  if (v4 >= 0xB)
  {
    v6 = analyticsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Found unexpected dampening type %d", (uint8_t *)v9, 8u);
    }

    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = qword_209E3E2C0[v4];
  }
  v7 = [NSNumber numberWithUnsignedInteger:v5];

  return v7;
}

- (id)closureTypeForClosure:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 >= 6)
  {
    uint64_t v5 = analyticsLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "Found unexpected closure type %d", (uint8_t *)v8, 8u);
    }

    *(void *)&a3 = 0;
  }
  else
  {
    uint64_t v4 = a3;
  }
  v6 = [NSNumber numberWithUnsignedInteger:a3];

  return v6;
}

- (id)buildDiagnosticIncidentEventForCase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = [v4 caseDomain];
  [v5 setObject:v6 forKeyedSubscript:@"caseDomain"];

  v7 = [v4 caseType];
  [v5 setObject:v7 forKeyedSubscript:@"caseType"];

  v8 = [v4 caseSubType];
  [v5 setObject:v8 forKeyedSubscript:@"caseSubtype"];

  uint64_t v9 = [v4 caseSubTypeContext];
  [v5 setObject:v9 forKeyedSubscript:@"caseSubtypeContext"];

  uint64_t v10 = [v4 caseDetectedProcess];
  [v5 setObject:v10 forKeyedSubscript:@"caseDetectedProcess"];

  v11 = [v4 caseId];
  v12 = [v11 UUIDString];
  [v5 setObject:v12 forKeyedSubscript:@"caseIdentifier"];

  v13 = [v4 caseGroupId];

  if (v13)
  {
    v14 = [v4 caseGroupId];
    [v5 setObject:v14 forKeyedSubscript:@"groupIdentifier"];

    uint64_t v15 = MEMORY[0x263EFFA88];
  }
  else
  {
    uint64_t v15 = MEMORY[0x263EFFA80];
  }
  [v5 setObject:v15 forKeyedSubscript:@"hasGroupIdentifier"];
  [v4 caseClosedTime];
  if (v16 > 0.0)
  {
    [v4 caseClosedTime];
    double v19 = v20;
  }
  else
  {
    v17 = [MEMORY[0x263EFF910] now];
    [v17 timeIntervalSince1970];
    double v19 = v18;
  }
  v21 = NSNumber;
  [v4 caseOpenedTime];
  v23 = [v21 numberWithDouble:v19 - v22];
  [v5 setObject:v23 forKeyedSubscript:@"duration"];

  v24 = NSNumber;
  v25 = [v4 attachments];
  v26 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
  [v5 setObject:v26 forKeyedSubscript:@"attachmentCount"];

  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "attachmentsFileSize"));
  [v5 setObject:v27 forKeyedSubscript:@"totalAttachmentSize"];

  if ([v4 isRemoteTrigger])
  {
    v28 = &unk_26BDF58D0;
  }
  else
  {
    if (![v4 wantsRemote]) {
      goto LABEL_12;
    }
    v28 = &unk_26BDF58E8;
  }
  [v5 setObject:v28 forKeyedSubscript:@"remoteFlags"];
LABEL_12:
  v29 = -[CoreAnalyticsReportOutlet handledResultForDampeningType:](self, "handledResultForDampeningType:", [v4 dampeningType]);
  [v5 setObject:v29 forKeyedSubscript:@"handledResult"];

  v30 = -[CoreAnalyticsReportOutlet dampeningResultForDampeningType:](self, "dampeningResultForDampeningType:", [v4 dampeningType]);
  [v5 setObject:v30 forKeyedSubscript:@"dampeningResult"];

  v31 = -[CoreAnalyticsReportOutlet closureTypeForClosure:](self, "closureTypeForClosure:", [v4 closureType]);
  [v5 setObject:v31 forKeyedSubscript:@"closureType"];

  return v5;
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v9 = v6;
  objc_copyWeak(&v10, &location);
  AnalyticsSendEventLazy();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return 1;
}

id __58__CoreAnalyticsReportOutlet_publishReportForCase_options___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) caseId];
    id v4 = [v3 UUIDString];
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Submitting analytics for case id %{public}@ to CoreAnalytics", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained buildDiagnosticIncidentEventForCase:*(void *)(a1 + 32)];

  return v6;
}

@end