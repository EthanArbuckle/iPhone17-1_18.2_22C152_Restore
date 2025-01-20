@interface DiagnosticPipelineOutlet
- (BOOL)logRequiresUploadConsent:(id)a3;
- (BOOL)publishReportForCase:(id)a3 options:(id)a4;
- (id)caseSignatureFieldFromCase:(uint64_t)a1;
- (id)contextDictionaryFromCase:(uint64_t)a1;
- (id)issueDescriptionFromCase:(uint64_t)a1;
- (uint64_t)shouldPublishReportForCase:(uint64_t)a1;
@end

@implementation DiagnosticPipelineOutlet

- (id)contextDictionaryFromCase:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = [v3 caseId];
    v6 = [v5 UUIDString];
    [v4 setObject:v6 forKeyedSubscript:@"caseID"];

    v7 = [v3 caseGroupId];
    [v4 setObject:v7 forKeyedSubscript:@"caseGroupID"];

    v8 = [v3 caseDomain];
    [v4 setObject:v8 forKeyedSubscript:@"caseDomain"];

    v9 = [v3 caseType];
    [v4 setObject:v9 forKeyedSubscript:@"caseType"];

    v10 = [v3 caseSubType];
    [v4 setObject:v10 forKeyedSubscript:@"caseSubtype"];

    v11 = [v3 caseSubTypeContext];
    [v4 setObject:v11 forKeyedSubscript:@"caseSubtypeContext"];

    v12 = [v3 caseDetectedProcess];
    [v4 setObject:v12 forKeyedSubscript:@"caseProcess"];

    v13 = NSNumber;
    [v3 caseOpenedTime];
    v14 = objc_msgSend(v13, "numberWithDouble:");
    [v4 setObject:v14 forKeyedSubscript:@"caseDetectionTime"];

    v15 = -[DiagnosticPipelineOutlet caseSignatureFieldFromCase:](a1, v3);
    [v4 setObject:v15 forKeyedSubscript:@"caseSignature"];

    v16 = +[SystemProperties sharedInstance];
    v17 = [v3 buildVariant];
    if (v17)
    {
      [v4 setObject:v17 forKeyedSubscript:@"buildVariant"];
    }
    else
    {
      v18 = [v16 buildVariant];
      [v4 setObject:v18 forKeyedSubscript:@"buildVariant"];
    }
    v19 = [v3 buildVersion];
    if (v19)
    {
      [v4 setObject:v19 forKeyedSubscript:@"buildVersion"];
    }
    else
    {
      v20 = [v16 buildVersion];
      [v4 setObject:v20 forKeyedSubscript:@"buildVersion"];
    }
    v21 = +[ABCAdministrator sharedInstance];
    v22 = [v21 configurationManager];

    v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "hasAppleEmail"));
    [v4 setObject:v23 forKeyedSubscript:@"hasAppleEmail"];

    v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "isCarryDevice"));
    [v4 setObject:v24 forKeyedSubscript:@"isCarryDevice"];

    v25 = [v3 basebandChipset];
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [v16 basebandChipset];
    }
    v28 = v27;

    if ([v28 length]) {
      [v4 setObject:v28 forKeyedSubscript:@"basebandChipset"];
    }
    v29 = [v3 basebandFirmwareVersion];
    v30 = v29;
    if (v29)
    {
      id v31 = v29;
    }
    else
    {
      id v31 = [v16 basebandFirmwareVersion];
    }
    v32 = v31;

    if ([v32 length]) {
      [v4 setObject:v32 forKeyedSubscript:@"basebandFirmwareVersion"];
    }
    v33 = [v3 regulatoryDomainCountry];
    if ([v33 length]) {
      [v4 setObject:v33 forKeyedSubscript:@"regulatoryDomainCountry"];
    }
    v34 = [v3 homeCarrier];
    if ([v34 length]) {
      [v4 setObject:v34 forKeyedSubscript:@"homeCarrier"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)caseSignatureFieldFromCase:(uint64_t)a1
{
  if (a1)
  {
    v2 = (objc_class *)MEMORY[0x263EFF980];
    id v3 = a2;
    id v4 = objc_alloc_init(v2);
    uint64_t v5 = [v3 caseDomain];
    v6 = (void *)v5;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    else {
      v7 = &stru_26BDE2C70;
    }
    [v4 addObject:v7];

    uint64_t v8 = [v3 caseType];
    v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = &stru_26BDE2C70;
    }
    [v4 addObject:v10];

    uint64_t v11 = [v3 caseSubType];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_26BDE2C70;
    }
    [v4 addObject:v13];

    uint64_t v14 = [v3 caseSubTypeContext];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = &stru_26BDE2C70;
    }
    [v4 addObject:v16];

    v17 = [v3 caseDetectedProcess];

    if (v17) {
      v18 = v17;
    }
    else {
      v18 = &stru_26BDE2C70;
    }
    [v4 addObject:v18];

    v19 = [v4 componentsJoinedByString:@"^"];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)issueDescriptionFromCase:(uint64_t)a1
{
  if (a1)
  {
    v2 = (objc_class *)NSString;
    id v3 = a2;
    id v4 = [v2 alloc];
    uint64_t v5 = [v3 caseDomain];
    v6 = [v3 caseType];
    v7 = [v3 caseSubType];

    uint64_t v8 = (void *)[v4 initWithFormat:@"AutoBugCapture case for %@, type:%@ subtype:%@", v5, v6, v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)shouldPublishReportForCase:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  id v4 = +[ABCAdministrator sharedInstance];
  uint64_t v5 = [v4 configurationManager];

  if (![v5 submitToDiagnosticPipeline])
  {
    v6 = casemanagementLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    LOWORD(v23) = 0;
    v7 = "Not configured to submit to DiagnosticPipeline";
LABEL_8:
    uint64_t v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  if (![v3 dampeningType])
  {
    v13 = [v3 attachments];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      [v5 diagnosticPipelineSubmissionRate];
      unsigned int v16 = (v15 * 100.0);
      if (v16 > 0x63)
      {
        v6 = casemanagementLogHandle();
        uint64_t v11 = 1;
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        LOWORD(v23) = 0;
        v20 = "Submission rate configured to always submit to DiagnosticPipeline";
        v21 = v6;
        uint32_t v22 = 2;
      }
      else
      {
        uint32_t v17 = arc4random_uniform(0x64u);
        v18 = casemanagementLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v23 = 67109376;
          int v24 = 100;
          __int16 v25 = 1024;
          unsigned int v26 = v16;
          _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_INFO, " Current submission probability is %u to %u against", (uint8_t *)&v23, 0xEu);
        }

        v19 = casemanagementLogHandle();
        v6 = v19;
        if (v17 >= v16)
        {
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_11;
          }
          int v23 = 67109632;
          int v24 = 100;
          __int16 v25 = 1024;
          unsigned int v26 = v16;
          __int16 v27 = 1024;
          uint32_t v28 = v17;
          v7 = "Failed to pass probability check (%u to %u against). Will not submit this case to DiagnosticPipeline. [%d]";
          uint64_t v8 = v6;
          os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
          uint32_t v10 = 20;
          goto LABEL_10;
        }
        uint64_t v11 = 1;
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        int v23 = 67109120;
        int v24 = v17;
        v20 = "Allowing submission to DiagnosticPipeline [%d]";
        v21 = v6;
        uint32_t v22 = 8;
      }
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v23, v22);
      goto LABEL_12;
    }
    v6 = casemanagementLogHandle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    LOWORD(v23) = 0;
    v7 = "Cases with empty attachments will not be submitted to DP";
    goto LABEL_8;
  }
  v6 = casemanagementLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v23) = 0;
    v7 = "Dampened cases will not be submitted to DP";
    uint64_t v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
LABEL_9:
    uint32_t v10 = 2;
LABEL_10:
    _os_log_impl(&dword_209DBA000, v8, v9, v7, (uint8_t *)&v23, v10);
  }
LABEL_11:
  uint64_t v11 = 0;
LABEL_12:

LABEL_13:
  return v11;
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (-[DiagnosticPipelineOutlet shouldPublishReportForCase:]((uint64_t)self, v6))
  {
    uint64_t v8 = [v6 caseDomain];
    os_log_type_t v9 = -[DiagnosticPipelineOutlet issueDescriptionFromCase:]((uint64_t)self, v6);
    uint32_t v10 = -[DiagnosticPipelineOutlet contextDictionaryFromCase:]((uint64_t)self, v6);
    uint64_t v11 = +[ABCAdministrator sharedInstance];
    v12 = [v11 configurationManager];
    char v13 = [v12 cloudKitEnabled];

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 1;
    *(void *)uint64_t v29 = 0;
    v30 = v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__1;
    v33 = __Block_byref_object_dispose__1;
    id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v14 = [v6 attachments];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __57__DiagnosticPipelineOutlet_publishReportForCase_options___block_invoke;
    v27[3] = &unk_263FC3B30;
    char v28 = v13 ^ 1;
    v27[4] = self;
    v27[5] = &v35;
    v27[6] = v29;
    [v14 enumerateObjectsUsingBlock:v27];

    if (*((unsigned char *)v36 + 24))
    {
      double v15 = casemanagementLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v16 = [v6 caseId];
        uint32_t v17 = [v16 UUIDString];
        *(_DWORD *)buf = 138543362;
        id v40 = v17;
        _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEFAULT, "Submitting case id %{public}@ to DiagnosticPipeline", buf, 0xCu);
      }
      char v18 = DRSubmitLogs();
      id v19 = 0;
      if (v18)
      {
        uint64_t v20 = 1;
      }
      else
      {
        __int16 v25 = casemanagementLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v19;
          __int16 v41 = 2112;
          id v42 = v6;
          _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEFAULT, "Error occurred when submitting case to DiagnosticPipeline: %@ (case: %@)", buf, 0x16u);
        }

        uint64_t v20 = 4;
      }
      [v6 setDPSubmissionState:v20];
    }
    else
    {
      uint32_t v22 = casemanagementLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = [v6 caseId];
        int v24 = [v23 UUIDString];
        *(_DWORD *)buf = 138543362;
        id v40 = v24;
        _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEFAULT, "Skipping submission of case id %{public}@ to DiagnosticPipeline due to preflight errors", buf, 0xCu);
      }
      [v6 setDPSubmissionState:3];
      char v18 = 0;
    }
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v21 = casemanagementLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEFAULT, "Case not eligible for submission to DiagnosticPipeline", v29, 2u);
    }

    [v6 setDPSubmissionState:2];
    char v18 = 0;
  }

  return v18;
}

void __57__DiagnosticPipelineOutlet_publishReportForCase_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)NSURL;
  id v7 = a2;
  uint64_t v8 = (void *)[[v6 alloc] initWithString:v7];

  int v9 = [*(id *)(a1 + 32) logRequiresUploadConsent:v8];
  id v10 = objc_alloc(MEMORY[0x263F3A178]);
  uint64_t v11 = [v8 path];
  uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
  id v22 = 0;
  char v13 = (void *)[v10 initWithPath:v11 transferOwnership:v12 errorOut:&v22];
  id v14 = v22;

  if (v14 || !v13)
  {
    double v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = [v8 path];
      *(_DWORD *)buf = 138412546;
      int v24 = v16;
      __int16 v25 = 2112;
      id v26 = v14;
      uint32_t v17 = " Failed to create DRClientLog object representing %@: %@";
      char v18 = v15;
      uint32_t v19 = 22;
      goto LABEL_8;
    }
  }
  else
  {
    if (!v9)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v13];
      goto LABEL_11;
    }
    double v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = [v8 path];
      *(_DWORD *)buf = 138412290;
      int v24 = v16;
      uint32_t v17 = " Log file at %@ is privacy sensitive and requires user consent for automatic upload";
      char v18 = v15;
      uint32_t v19 = 12;
LABEL_8:
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;

  *a4 = 1;
LABEL_11:
}

- (BOOL)logRequiresUploadConsent:(id)a3
{
  id v3 = [a3 lastPathComponent];
  id v4 = +[ABCAdministrator sharedInstance];
  uint64_t v5 = [v4 configurationManager];
  char v6 = [v5 autoBugCaptureUploadPreapproved];

  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = [v3 hasSuffix:@".pcapng"];
  }

  return v7;
}

@end