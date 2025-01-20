@interface DRSRequest
+ (BOOL)_requestMOHasRequiredFields_ON_MOC_QUEUE:(id)a3;
+ (BOOL)cleanRequestRecordsFromPersistentContainer:(id)a3 removeFiles:(BOOL)a4 removeRecord:(BOOL)a5 matchingPredicate:(id)a6 errorOut:(id *)a7;
+ (BOOL)cullOldRequestRecordsFromPersistentContainer:(id)a3 currentDate:(id)a4 errorOut:(id *)a5;
+ (BOOL)isExpeditedTeamID:(id)a3 issueCategory:(id)a4;
+ (Class)_moClass;
+ (id)_requestWithRequestMO_ON_MOC_QUEUE:(id)a3;
+ (id)entityName;
+ (id)leastRecentDateFirstSortDescriptor;
+ (id)migrateRequestDataStoreAtPath:(id)a3 errorOut:(id *)a4;
+ (id)mostRecentDateFirstSortDescriptor;
+ (id)requestForMessage:(id)a3;
+ (id)requestsForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7;
+ (id)requiredSystemResourceName;
+ (id)unreportedTerminalRequestsFromContext:(id)a3 sortDescriptors:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6;
+ (id)uploadedBytesSinceDate:(id)a3 context:(id)a4 errorOut:(id *)a5;
+ (unint64_t)requestCountForFilterPredicate:(id)a3 context:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6;
- (BOOL)_deleteLogs;
- (BOOL)_markLogsAsPurgeableWithUrgencyWithDeleteFallback:(unint64_t)a3;
- (BOOL)_performPostClientLogWork:(id)a3 dampeningOutcome:(unint64_t)a4 isLogUploadEnabled:(BOOL)a5;
- (BOOL)_populateLogsArray_ON_MOC_QUEUE:(id)a3;
- (BOOL)_updateLogFileStateForTransitionFromPreviousState:(unint64_t)a3;
- (BOOL)_updateLogStateToExpectedState:(unsigned __int8)a3;
- (BOOL)hasBeenCountedByTelemetry;
- (BOOL)hasUploadableContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (BOOL)isExpedited;
- (BOOL)isNonPurgeableInFlightUntilUploadAttempt;
- (BOOL)performOnReceiptWork:(id)a3 dampeningOutcome:(unint64_t)a4;
- (BOOL)updateToState:(unint64_t)a3 errorDescription:(id)a4 errorOut:(id *)a5;
- (BOOL)uploadStarted;
- (Class)pbBatchResponseClass;
- (DRSDecisionServerBatchRequest)pbBatchInstance;
- (DRSRequest)initWithXPCDict:(id)a3;
- (NSArray)logs;
- (NSArray)submittedLogInfos;
- (NSData)contextDictionaryData;
- (NSDate)requestDate;
- (NSDictionary)contextDictionary;
- (NSString)build;
- (NSString)ckRecordID;
- (NSString)debugDescription;
- (NSString)decisionServerDecisionString;
- (NSString)errorDescription;
- (NSString)functionName;
- (NSString)issueCategory;
- (NSString)issueDescription;
- (NSString)logType;
- (NSString)requestOutcomeString;
- (NSString)requestStateString;
- (NSString)requestType;
- (NSString)teamID;
- (NSUUID)requestID;
- (id)_initWithRequestMO_ON_MOC_QUEUE:(id)a3;
- (id)_logsDescription;
- (id)_processSubmittedLogInfo:(id)a3 workingDirectory:(id)a4;
- (id)fileAssets;
- (id)fileNames;
- (id)filePaths;
- (id)fileURLs;
- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3;
- (id)logPath;
- (id)newRequestMOInContext_ON_MOC_QUEUE:(id)a3;
- (id)protoFileDescriptions;
- (id)protoRequestDescription;
- (id)recordRepresentation;
- (id)replyForMessage:(id)a3;
- (id)targetContainerName;
- (id)uploadRequest;
- (unint64_t)expectedType;
- (unint64_t)logSizeLimitBytes;
- (unint64_t)requestMCT;
- (unint64_t)requestState;
- (unint64_t)totalLogSizeBytes;
- (unint64_t)uploadID;
- (unsigned)decisionServerDecision;
- (unsigned)requestOutcome;
- (unsigned)uploadAttemptCount;
- (void)_addLogMOs:(id)a3;
- (void)_configureRequestMO:(id)a3;
- (void)addAutomatedDeviceGroupContext;
- (void)makeTerminalDueToMissingLog;
- (void)setDecisionServerDecision:(unsigned __int8)a3;
- (void)setHasBeenCountedByTelemetry:(BOOL)a3;
- (void)setLogType:(id)a3;
- (void)setLogs:(id)a3;
- (void)setRequestState:(unint64_t)a3;
- (void)setUploadAttemptCount:(unsigned __int16)a3;
- (void)updateContextWithRequest_ON_MOC_QUEUE:(id)a3;
- (void)uploadAbortedDueToLogSize;
- (void)uploadCompleteWithError:(id)a3 ckRecordID:(id)a4;
- (void)uploadDeniedByDecisionServerWithReason:(id)a3;
- (void)uploadFailedDueToReason:(id)a3;
@end

@implementation DRSRequest

- (id)logPath
{
  v3 = [(DRSRequest *)self logs];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(DRSRequest *)self logs];
    v6 = [v5 firstObject];
    v7 = [v6 path];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)totalLogSizeBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DRSRequest *)self logs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) size];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)logSizeLimitBytes
{
  v2 = +[DRSSystemProfile sharedInstance];
  unint64_t v3 = [v2 uploadSessionUploadCapBytes];

  return v3;
}

+ (id)requiredSystemResourceName
{
  return 0;
}

- (NSString)decisionServerDecisionString
{
  unsigned int v2 = [(DRSRequest *)self decisionServerDecision];
  if (v2 > 2) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_263FC9868[(char)v2]->isa;
  }
}

- (unsigned)requestOutcome
{
  uint64_t v2 = [(DRSRequest *)self requestState];

  return DRSRequestOutcomeForState(v2);
}

- (BOOL)_markLogsAsPurgeableWithUrgencyWithDeleteFallback:(unint64_t)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (![(DRSRequest *)self hasUploadableContent]) {
    return 1;
  }
  unint64_t v3 = DPLogHandle_LogManagement();
  if (os_signpost_enabled(v3))
  {
    uint64_t v4 = [(DRSRequest *)self requestID];
    unint64_t v5 = (void *)v4;
    switch(a3)
    {
      case 0x200uLL:
        uint64_t v6 = @"Low";
        break;
      case 0x800uLL:
        uint64_t v6 = @"High";
        break;
      case 0x400uLL:
        uint64_t v6 = @"Medium";
        break;
      default:
        uint64_t v6 = @"Unknown";
        break;
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v48 = v4;
    __int16 v49 = 2114;
    v50 = v6;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkingCasePurgeability", "Request %{public}@: Marking files as purgeable with urgency %{public}@", buf, 0x16u);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v8 = [(DRSRequest *)self logs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v44;
    *(void *)&long long v10 = 138543874;
    long long v37 = v10;
    v39 = v8;
LABEL_14:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(v8);
      }
      objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v13), "path", v37);
      uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      char v42 = 0;
      v15 = [MEMORY[0x263F08850] defaultManager];
      char v16 = [v15 fileExistsAtPath:v14 isDirectory:&v42];

      if (v16)
      {
        if (v42)
        {
          v17 = DPLogHandle_LogManagementError();
          if (os_signpost_enabled(v17))
          {
            v18 = [(DRSRequest *)self requestID];
            *(_DWORD *)buf = 138543618;
            uint64_t v48 = (uint64_t)v18;
            __int16 v49 = 2114;
            v50 = v14;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PurgeabilityFailure", "%{public}@: File %{public}@ is a directory", buf, 0x16u);
          }
          v19 = DPLogHandle_LogManagementError();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            goto LABEL_36;
          }
          v20 = [(DRSRequest *)self requestID];
          *(_DWORD *)buf = 138543618;
          uint64_t v48 = (uint64_t)v20;
          __int16 v49 = 2114;
          v50 = v14;
          _os_log_fault_impl(&dword_209E70000, v19, OS_LOG_TYPE_FAULT, "ERROR: %{public}@: File %{public}@ is a directory", buf, 0x16u);
          goto LABEL_25;
        }
        v21 = v14;
        int v22 = open((const char *)[(__CFString *)v21 UTF8String], 0);
        if ((v22 & 0x80000000) == 0)
        {
          int v23 = v22;
          unint64_t v41 = a3 | 0x10005;
          int v24 = ffsctl(v22, 0xC0084A44uLL, &v41, 0);
          close(v23);
          if (v24)
          {
            v31 = DPLogHandle_RequestError();
            if (os_signpost_enabled(v31))
            {
              v32 = [(DRSRequest *)self requestID];
              switch(a3)
              {
                case 0x200uLL:
                  v33 = @"Low";
                  break;
                case 0x800uLL:
                  v33 = @"High";
                  break;
                case 0x400uLL:
                  v33 = @"Medium";
                  break;
                default:
                  v33 = @"Unknown";
                  break;
              }
              v34 = __error();
              v35 = strerror(*v34);
              *(_DWORD *)buf = 138544130;
              uint64_t v48 = (uint64_t)v32;
              __int16 v49 = 2114;
              v50 = v21;
              __int16 v51 = 2114;
              v52 = v33;
              __int16 v53 = 2082;
              v54 = v35;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkingLogFilePurgeabilityFailure", "Request %{public}@: Failed to mark '%{public}@' as purgeable with urgency %{public}@ due to error: %{public}s. Attempting to delete to prevent accumulating files.", buf, 0x2Au);
            }
            [(DRSRequest *)self _deleteLogs];

            BOOL v7 = 0;
            v8 = v39;
            goto LABEL_56;
          }
          v25 = DPLogHandle_Request();
          if (os_signpost_enabled(v25))
          {
            uint64_t v26 = [(DRSRequest *)self requestID];
            v27 = (void *)v26;
            switch(a3)
            {
              case 0x200uLL:
                v28 = @"Low";
                break;
              case 0x800uLL:
                v28 = @"High";
                break;
              case 0x400uLL:
                v28 = @"Medium";
                break;
              default:
                v28 = @"Unknown";
                break;
            }
            *(_DWORD *)buf = v37;
            uint64_t v48 = v26;
            __int16 v49 = 2114;
            v50 = v21;
            __int16 v51 = 2114;
            v52 = v28;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MarkedLogFilePurgeability", "Request %{public}@: Marked '%{public}@' as purgeable with urgency %{public}@", buf, 0x20u);
          }
          v8 = v39;
          goto LABEL_37;
        }
        v19 = DPLogHandle_RequestError();
        if (os_signpost_enabled(v19))
        {
          v29 = [(DRSRequest *)self requestID];
          *(_DWORD *)buf = 138543618;
          uint64_t v48 = (uint64_t)v29;
          __int16 v49 = 2114;
          v50 = v21;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OpenFileFailure", "Request %{public}@: Failed to open file with path %{public}@ to tag it as purgeable", buf, 0x16u);
        }
        v8 = v39;
      }
      else
      {
        v19 = DPLogHandle_LogManagementError();
        if (os_signpost_enabled(v19))
        {
          v20 = [(DRSRequest *)self requestID];
          *(_DWORD *)buf = 138543618;
          uint64_t v48 = (uint64_t)v20;
          __int16 v49 = 2114;
          v50 = v14;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PurgeabilityFailure", "%{public}@: File %{public}@ does not exist", buf, 0x16u);
LABEL_25:
        }
      }
LABEL_36:

LABEL_37:
      if (v11 == ++v13)
      {
        uint64_t v30 = [v8 countByEnumeratingWithState:&v43 objects:v55 count:16];
        uint64_t v11 = v30;
        if (v30) {
          goto LABEL_14;
        }
        break;
      }
    }
  }
  BOOL v7 = 1;
LABEL_56:

  return v7;
}

- (id)_logsDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(DRSRequest *)self logs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(DRSRequest *)self logs];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) debugDescription];
          uint64_t v13 = (void *)v12;
          if (v10) {
            [(__CFString *)v5 appendString:v12];
          }
          else {
            [(__CFString *)v5 appendFormat:@", %@", v12];
          }

          char v10 = 0;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v10 = 0;
      }
      while (v8);
    }
  }
  else
  {
    unint64_t v5 = @"No logs";
  }

  return v5;
}

- (NSString)debugDescription
{
  v32 = (void *)MEMORY[0x21050DCE0](self, a2);
  unint64_t v3 = [(DRSRequest *)self totalLogSizeBytes];
  if (v3) {
    v36 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%zuB", v3);
  }
  else {
    v36 = @"<No cached log size>";
  }
  id v28 = [NSString alloc];
  v35 = [(DRSRequest *)self build];
  v31 = [(DRSRequest *)self requestID];
  v34 = [v31 UUIDString];
  uint64_t v30 = [(DRSRequest *)self ckRecordID];
  if (v30)
  {
    uint64_t v4 = NSString;
    v21 = [(DRSRequest *)self ckRecordID];
    v33 = [v4 stringWithFormat:@"CKRecordID: %@", v21];
  }
  else
  {
    v33 = @"-";
  }
  uint64_t v26 = [(DRSRequest *)self requestStateString];
  uint64_t v5 = [(DRSRequest *)self errorDescription];
  v27 = (void *)v5;
  uint64_t v6 = @"<No error>";
  if (v5) {
    uint64_t v6 = (__CFString *)v5;
  }
  v25 = v6;
  int v24 = [(DRSRequest *)self requestType];
  unsigned int v23 = [(DRSRequest *)self uploadAttemptCount];
  BOOL v7 = [(DRSRequest *)self hasBeenCountedByTelemetry];
  uint64_t v8 = &stru_26BDF7DE8;
  if (v7) {
    uint64_t v8 = @"(Reported to telemetry)";
  }
  int v22 = v8;
  uint64_t v9 = [(DRSRequest *)self decisionServerDecisionString];
  if ([(DRSRequest *)self isExpedited]) {
    char v10 = @"ExpeditedUpload";
  }
  else {
    char v10 = @"NormalUpload";
  }
  uint64_t v11 = [(DRSRequest *)self teamID];
  uint64_t v12 = [(DRSRequest *)self issueCategory];
  uint64_t v13 = [(DRSRequest *)self issueDescription];
  uint64_t v14 = [(DRSRequest *)self _logsDescription];
  long long v15 = [(DRSRequest *)self logType];
  long long v16 = [(DRSRequest *)self contextDictionary];
  uint64_t v17 = [v16 debugDescription];
  long long v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"-";
  }
  v29 = objc_msgSend(v28, "initWithFormat:", @"%@ %@ %@ (%@,%@) %@ %u %@ %@ %@ %@/%@ %@ %@(%@, %@) %@", v35, v34, v33, v26, v25, v24, v23, v22, v9, v10, v11, v12, v13, v14, v15, v36,
                  v19);

  if (v30)
  {
  }

  return (NSString *)v29;
}

- (id)jsonCompatibleDictionaryRepresentationVerbose:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x21050DCE0](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x263F088C0]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = [(DRSRequest *)v4 build];
  [v7 setObject:v8 forKeyedSubscript:@"build"];

  uint64_t v9 = [(DRSRequest *)v4 requestDate];
  char v10 = [v6 stringFromDate:v9];
  [v7 setObject:v10 forKeyedSubscript:@"date"];

  uint64_t v11 = [(DRSRequest *)v4 teamID];
  [v7 setObject:v11 forKeyedSubscript:@"teamID"];

  uint64_t v12 = [(DRSRequest *)v4 issueCategory];
  [v7 setObject:v12 forKeyedSubscript:@"issueCategory"];

  uint64_t v13 = [(DRSRequest *)v4 issueDescription];
  [v7 setObject:v13 forKeyedSubscript:@"issueDescription"];

  uint64_t v14 = [(DRSRequest *)v4 logType];
  [v7 setObject:v14 forKeyedSubscript:@"logType"];

  unint64_t v15 = 0x263F08000uLL;
  long long v16 = objc_msgSend(NSNumber, "numberWithBool:", -[DRSRequest isExpedited](v4, "isExpedited"));
  [v7 setObject:v16 forKeyedSubscript:@"isExpedited"];

  uint64_t v17 = [(DRSRequest *)v4 contextDictionary];

  if (!v17)
  {
LABEL_4:
    if (!v3) {
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  long long v18 = (void *)MEMORY[0x263F08900];
  v19 = [(DRSRequest *)v4 contextDictionary];
  LODWORD(v18) = [v18 isValidJSONObject:v19];

  if (v18)
  {
    uint64_t v20 = [(DRSRequest *)v4 contextDictionary];
    [v7 setObject:v20 forKeyedSubscript:@"contextDictionary"];

    goto LABEL_4;
  }
  v21 = DPLogHandle_Request();
  if (os_signpost_enabled(v21))
  {
    int v22 = [(DRSRequest *)v4 debugDescription];
    *(_DWORD *)buf = 138543362;
    v73 = v22;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkippedContextDictionaryJSONSerialization", "Context dictionary for %{public}@ cannot be serialized in JSON", buf, 0xCu);
  }
  [v7 setObject:@"<Could not serialize>" forKeyedSubscript:@"contextDictionary"];
  if (v3)
  {
LABEL_9:
    unsigned int v23 = [(DRSRequest *)v4 requestID];
    int v24 = [v23 UUIDString];
    [v7 setObject:v24 forKeyedSubscript:@"requestID"];

    v25 = [(DRSRequest *)v4 ckRecordID];

    if (v25)
    {
      uint64_t v26 = [(DRSRequest *)v4 ckRecordID];
      [v7 setObject:v26 forKeyedSubscript:@"ckRecordID"];
    }
    v27 = [(DRSRequest *)v4 requestStateString];
    [v7 setObject:v27 forKeyedSubscript:@"requestState"];

    id v28 = [(DRSRequest *)v4 errorDescription];

    if (v28)
    {
      v29 = [(DRSRequest *)v4 errorDescription];
      [v7 setObject:v29 forKeyedSubscript:@"errorDescription"];
    }
    uint64_t v30 = [(DRSRequest *)v4 requestType];
    [v7 setObject:v30 forKeyedSubscript:@"requestType"];

    v31 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[DRSRequest uploadAttemptCount](v4, "uploadAttemptCount"));
    [v7 setObject:v31 forKeyedSubscript:@"uploadAttemptCount"];

    v32 = [(DRSRequest *)v4 decisionServerDecisionString];
    [v7 setObject:v32 forKeyedSubscript:@"decisionServerDecision"];

    v33 = [(DRSRequest *)v4 logs];
    uint64_t v34 = [v33 count];

    v35 = [(DRSRequest *)v4 logs];
    v36 = v35;
    if (v34 == 1)
    {
      long long v37 = [v35 firstObject];
      v38 = [v37 path];
      [v7 setObject:v38 forKeyedSubscript:@"logPath"];

      v39 = NSNumber;
      v40 = [(DRSRequest *)v4 logs];
      unint64_t v41 = [v40 firstObject];
      char v42 = objc_msgSend(v39, "numberWithUnsignedLong:", objc_msgSend(v41, "size"));
      [v7 setObject:v42 forKeyedSubscript:@"logSizeBytes"];

      long long v43 = NSNumber;
      long long v44 = [(DRSRequest *)v4 logs];
      long long v45 = [v44 firstObject];
      long long v46 = objc_msgSend(v43, "numberWithBool:", objc_msgSend(v45, "isAvailableOnDisk"));
      [v7 setObject:v46 forKeyedSubscript:@"logAvailableOnDiskPath"];
    }
    else
    {
      uint64_t v47 = [v35 count];

      if (v47)
      {
        id v62 = v6;
        v63 = v7;
        id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v61 = v4;
        id obj = [(DRSRequest *)v4 logs];
        uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v50; ++i)
            {
              if (*(void *)v66 != v51) {
                objc_enumerationMutation(obj);
              }
              __int16 v53 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              v69[0] = @"logPath";
              v54 = [v53 path];
              v70[0] = v54;
              v69[1] = @"logAvailableOnDiskPath";
              v55 = objc_msgSend(*(id *)(v15 + 2584), "numberWithBool:", objc_msgSend(v53, "isAvailableOnDisk"));
              v70[1] = v55;
              v69[2] = @"logSizeBytes";
              unint64_t v56 = v15;
              v57 = objc_msgSend(*(id *)(v15 + 2584), "numberWithUnsignedLong:", objc_msgSend(v53, "size"));
              v70[2] = v57;
              v58 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];

              unint64_t v15 = v56;
              [v48 addObject:v58];
            }
            uint64_t v50 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
          }
          while (v50);
        }

        id v7 = v63;
        [v63 setObject:v48 forKeyedSubscript:@"logsArray"];

        uint64_t v4 = v61;
        id v6 = v62;
      }
      else
      {
        [v7 setObject:@"<No path>" forKeyedSubscript:@"logPath"];
        [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"logAvailableOnDiskPath"];
        [v7 setObject:&unk_26BE05760 forKeyedSubscript:@"logSizeBytes"];
      }
    }
    v59 = objc_msgSend(*(id *)(v15 + 2584), "numberWithBool:", -[DRSRequest hasBeenCountedByTelemetry](v4, "hasBeenCountedByTelemetry"));
    [v7 setObject:v59 forKeyedSubscript:@"hasBeenCountedByTelemetry"];
  }
LABEL_26:

  return v7;
}

+ (Class)_moClass
{
  return (Class)objc_opt_class();
}

+ (id)entityName
{
  return @"DRSRequestMO";
}

- (void)_addLogMOs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(DRSRequest *)self logs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = [DRSLogMO alloc];
        uint64_t v12 = [v4 managedObjectContext];
        uint64_t v13 = [(DRSLogMO *)v11 initWithContext:v12];

        [v10 _configureLogMO:v13];
        [v4 addLogsObject:v13];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_configureRequestMO:(id)a3
{
  id v18 = a3;
  id v4 = [(DRSRequest *)self teamID];
  [v18 setTeamID:v4];

  uint64_t v5 = [(DRSRequest *)self issueCategory];
  [v18 setIssueCategory:v5];

  uint64_t v6 = [(DRSRequest *)self issueDescription];
  [v18 setIssueDescription:v6];

  uint64_t v7 = [(DRSRequest *)self contextDictionaryData];
  [v18 setContextDictionaryData:v7];

  uint64_t v8 = [(DRSRequest *)self requestDate];
  [v18 setRequestDate:v8];

  uint64_t v9 = [(DRSRequest *)self requestID];
  [v18 setRequestID:v9];

  objc_msgSend(v18, "setRequestMCT:", -[DRSRequest requestMCT](self, "requestMCT"));
  objc_msgSend(v18, "setRequestState:", -[DRSRequest requestState](self, "requestState"));
  char v10 = [(DRSRequest *)self errorDescription];
  [v18 setErrorDescription:v10];

  uint64_t v11 = [(DRSRequest *)self build];
  [v18 setBuild:v11];

  objc_msgSend(v18, "setUploadAttemptCount:", (__int16)-[DRSRequest uploadAttemptCount](self, "uploadAttemptCount"));
  objc_msgSend(v18, "setDecisionServerDecision:", -[DRSRequest decisionServerDecision](self, "decisionServerDecision"));
  objc_msgSend(v18, "setHasBeenCountedByTelemetry:", -[DRSRequest hasBeenCountedByTelemetry](self, "hasBeenCountedByTelemetry"));
  objc_msgSend(v18, "setIsExpedited:", -[DRSRequest isExpedited](self, "isExpedited"));
  uint64_t v12 = [(DRSRequest *)self ckRecordID];
  [v18 setCkRecordID:v12];

  uint64_t v13 = [v18 logs];
  uint64_t v14 = [v13 count];
  long long v15 = [(DRSRequest *)self logs];
  uint64_t v16 = [v15 count];

  if (v14 != v16)
  {
    long long v17 = [v18 logs];
    [v18 removeLogs:v17];

    [(DRSRequest *)self _addLogMOs:v18];
  }
}

- (NSString)requestStateString
{
  uint64_t v2 = [(DRSRequest *)self requestState];

  return (NSString *)DRRequestStateWithOutcomeStringForState(v2);
}

- (NSString)requestOutcomeString
{
  unsigned int v2 = [(DRSRequest *)self requestOutcome] - 1;
  if (v2 > 2) {
    return (NSString *)@"In-Flight";
  }
  else {
    return &off_263FC9880[(char)v2]->isa;
  }
}

- (id)newRequestMOInContext_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_moClass")), "initWithContext:", v4);

  [(DRSRequest *)self _configureRequestMO:v5];
  return v5;
}

- (void)updateContextWithRequest_ON_MOC_QUEUE:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v6 = [(DRSRequest *)self requestID];
  uint64_t v7 = [v5 predicateWithFormat:@"requestID == %@", v6];

  uint64_t v8 = (void *)MEMORY[0x263EFF260];
  uint64_t v9 = [(id)objc_opt_class() entityName];
  char v10 = [v8 fetchRequestWithEntityName:v9];

  [v10 setFetchLimit:1];
  [v10 setPredicate:v7];
  id v19 = 0;
  uint64_t v11 = [v4 executeFetchRequest:v10 error:&v19];
  id v12 = v19;
  if (!v11 || ![v11 count])
  {
    if (v12)
    {
      uint64_t v14 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v14))
      {
        long long v15 = [(DRSRequest *)self debugDescription];
        uint64_t v16 = [v12 localizedDescription];
        long long v17 = (void *)v16;
        id v18 = @"Unknown";
        if (v16) {
          id v18 = (__CFString *)v16;
        }
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        __int16 v22 = 2114;
        unsigned int v23 = v18;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestMangedObjectFetchFailure", "Failed to fetch a request object for %{public}@ due to error: %{public}@", buf, 0x16u);

        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v14 = DPLogHandle_Request();
      if (os_signpost_enabled(v14))
      {
        long long v15 = [(DRSRequest *)self requestID];
        *(_DWORD *)buf = 138543362;
        v21 = v15;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestMangedObjectFetchMiss", "No cached request with ID %{public}@", buf, 0xCu);
LABEL_11:
      }
    }

    id v12 = [(DRSRequest *)self newRequestMOInContext_ON_MOC_QUEUE:v4];
    goto LABEL_13;
  }
  uint64_t v13 = [v11 firstObject];
  [(DRSRequest *)self _configureRequestMO:v13];

LABEL_13:
}

+ (id)requestForMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = xpc_dictionary_get_uint64(v3, "ClientMessageType") - 1;
  if (v4 <= 4 && ((0x1Bu >> v4) & 1) != 0) {
    uint64_t v5 = (void *)[objc_alloc(*off_263FC9898[v4]) initWithXPCDict:v3];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)addAutomatedDeviceGroupContext
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = +[DRSSystemProfile sharedInstance];
  uint64_t v4 = [v3 automatedDeviceGroup];

  if (v4)
  {
    uint64_t v5 = [(DRSRequest *)self contextDictionary];

    if (v5)
    {
      uint64_t v6 = [(DRSRequest *)self contextDictionary];
      id v7 = (id)[v6 mutableCopy];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    [v7 setObject:v4 forKeyedSubscript:kDRSRequestADGContextDictKey];
    uint64_t v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = 0;
      char v10 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v19];
      uint64_t v11 = v19;
      if (v11)
      {
        id v12 = DPLogHandle_RequestError();
        if (os_signpost_enabled(v12))
        {
          uint64_t v13 = [v11 localizedDescription];
          int v20 = 138543362;
          id v21 = v13;
          _os_signpost_emit_unreliably_with_name_impl();
        }
        id v14 = 0;
      }
      else
      {
        id v14 = v10;
      }
    }
    else
    {
      uint64_t v11 = DPLogHandle_RequestError();
      if (os_signpost_enabled(v11))
      {
        long long v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        int v20 = 138543362;
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        _os_signpost_emit_unreliably_with_name_impl();
      }
      id v14 = 0;
    }

    if (v14)
    {
      objc_storeStrong((id *)&self->_contextDictionary, v7);
      objc_storeStrong((id *)&self->_contextDictionaryData, v14);
      uint64_t v16 = DPLogHandle_Request();
      if (os_signpost_enabled(v16))
      {
        long long v17 = [(DRSRequest *)self requestID];
        id v18 = [v17 UUIDString];
        int v20 = 138543618;
        id v21 = v4;
        __int16 v22 = 2114;
        unsigned int v23 = v18;
LABEL_22:
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }
    else
    {
      uint64_t v16 = DPLogHandle_RequestError();
      if (os_signpost_enabled(v16))
      {
        long long v17 = [(DRSRequest *)self requestID];
        id v18 = [v17 UUIDString];
        int v20 = 138543362;
        id v21 = v18;
        goto LABEL_22;
      }
    }

    goto LABEL_24;
  }
  uint64_t v8 = DPLogHandle_Request();
  if (os_signpost_enabled(v8))
  {
    uint64_t v9 = [(DRSRequest *)self requestID];
    [v9 UUIDString];
    int v20 = 138543362;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    _os_signpost_emit_unreliably_with_name_impl();
  }
LABEL_24:
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DRSRequest *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(DRSRequest *)self isEqualToRequest:v5];

  return v6;
}

- (BOOL)isEqualToRequest:(id)a3
{
  uint64_t v4 = (DRSRequest *)a3;
  if (self == v4) {
    goto LABEL_40;
  }
  unint64_t v5 = [(DRSRequest *)self requestMCT];
  if (v5 == [(DRSRequest *)v4 requestMCT])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [(DRSRequest *)self teamID];
      id v7 = [(DRSRequest *)v4 teamID];
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        uint64_t v9 = [(DRSRequest *)self build];
        char v10 = [(DRSRequest *)v4 build];
        int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          id v12 = [(DRSRequest *)self issueCategory];
          uint64_t v13 = [(DRSRequest *)v4 issueCategory];
          int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            long long v15 = [(DRSRequest *)self issueDescription];
            uint64_t v16 = [(DRSRequest *)v4 issueDescription];
            int v17 = [v15 isEqualToString:v16];

            if (v17)
            {
              id v18 = [(DRSRequest *)self teamID];
              id v19 = [(DRSRequest *)v4 teamID];
              int v20 = [v18 isEqualToString:v19];

              if (v20)
              {
                id v21 = [(DRSRequest *)self logType];
                __int16 v22 = [(DRSRequest *)v4 logType];
                int v23 = [v21 isEqualToString:v22];

                if (v23)
                {
                  uint64_t v24 = [(DRSRequest *)self logPath];
                  v25 = [(DRSRequest *)v4 logPath];
                  char IsNil = _oneIsNil((uint64_t)v24, (uint64_t)v25);

                  if ((IsNil & 1) == 0)
                  {
                    uint64_t v27 = [(DRSRequest *)self logPath];
                    if (!v27) {
                      goto LABEL_13;
                    }
                    id v28 = (void *)v27;
                    v29 = [(DRSRequest *)self logPath];
                    uint64_t v30 = [(DRSRequest *)v4 logPath];
                    int v31 = [v29 isEqualToString:v30];

                    if (v31)
                    {
LABEL_13:
                      v32 = [(DRSRequest *)self contextDictionary];
                      v33 = [(DRSRequest *)v4 contextDictionary];
                      char v34 = _oneIsNil((uint64_t)v32, (uint64_t)v33);

                      if ((v34 & 1) == 0)
                      {
                        uint64_t v35 = [(DRSRequest *)self contextDictionary];
                        if (!v35) {
                          goto LABEL_44;
                        }
                        v36 = (void *)v35;
                        long long v37 = [(DRSRequest *)self contextDictionary];
                        v38 = [(DRSRequest *)v4 contextDictionary];
                        int v39 = [v37 isEqualToDictionary:v38];

                        if (v39)
                        {
LABEL_44:
                          v40 = [(DRSRequest *)self contextDictionaryData];
                          unint64_t v41 = [(DRSRequest *)v4 contextDictionaryData];
                          char v42 = _oneIsNil((uint64_t)v40, (uint64_t)v41);

                          if ((v42 & 1) == 0)
                          {
                            uint64_t v43 = [(DRSRequest *)self contextDictionaryData];
                            if (!v43) {
                              goto LABEL_45;
                            }
                            long long v44 = (void *)v43;
                            long long v45 = [(DRSRequest *)self contextDictionaryData];
                            long long v46 = [(DRSRequest *)v4 contextDictionaryData];
                            int v47 = [v45 isEqualToData:v46];

                            if (v47)
                            {
LABEL_45:
                              id v48 = [(DRSRequest *)self requestDate];
                              uint64_t v49 = [(DRSRequest *)v4 requestDate];
                              char v50 = _oneIsNil((uint64_t)v48, (uint64_t)v49);

                              if ((v50 & 1) == 0)
                              {
                                uint64_t v51 = [(DRSRequest *)self requestDate];
                                if (!v51) {
                                  goto LABEL_46;
                                }
                                v52 = (void *)v51;
                                __int16 v53 = [(DRSRequest *)self requestDate];
                                v54 = [(DRSRequest *)v4 requestDate];
                                int v55 = [v53 isEqualToDate:v54];

                                if (v55)
                                {
LABEL_46:
                                  unint64_t v56 = [(DRSRequest *)self requestID];
                                  v57 = [(DRSRequest *)v4 requestID];
                                  char v58 = _oneIsNil((uint64_t)v56, (uint64_t)v57);

                                  if ((v58 & 1) == 0)
                                  {
                                    uint64_t v59 = [(DRSRequest *)self requestID];
                                    if (!v59) {
                                      goto LABEL_47;
                                    }
                                    v60 = (void *)v59;
                                    v61 = [(DRSRequest *)self requestID];
                                    id v62 = [(DRSRequest *)v4 requestID];
                                    int v63 = [v61 isEqual:v62];

                                    if (v63)
                                    {
LABEL_47:
                                      v64 = [(DRSRequest *)self ckRecordID];
                                      long long v65 = [(DRSRequest *)v4 ckRecordID];
                                      char v66 = _oneIsNil((uint64_t)v64, (uint64_t)v65);

                                      if ((v66 & 1) == 0)
                                      {
                                        uint64_t v67 = [(DRSRequest *)self ckRecordID];
                                        if (!v67) {
                                          goto LABEL_48;
                                        }
                                        long long v68 = (void *)v67;
                                        v69 = [(DRSRequest *)self ckRecordID];
                                        v70 = [(DRSRequest *)v4 ckRecordID];
                                        int v71 = [v69 isEqualToString:v70];

                                        if (v71)
                                        {
LABEL_48:
                                          unint64_t v72 = [(DRSRequest *)self requestState];
                                          if (v72 == [(DRSRequest *)v4 requestState])
                                          {
                                            int v73 = [(DRSRequest *)self uploadAttemptCount];
                                            if (v73 == [(DRSRequest *)v4 uploadAttemptCount])
                                            {
                                              int v74 = [(DRSRequest *)self decisionServerDecision];
                                              if (v74 == [(DRSRequest *)v4 decisionServerDecision])
                                              {
                                                BOOL v75 = [(DRSRequest *)self hasBeenCountedByTelemetry];
                                                if (v75 == [(DRSRequest *)v4 hasBeenCountedByTelemetry])
                                                {
                                                  BOOL v76 = [(DRSRequest *)self isExpedited];
                                                  if (v76 == [(DRSRequest *)v4 isExpedited])
                                                  {
                                                    v77 = [(DRSRequest *)self errorDescription];
                                                    v78 = [(DRSRequest *)v4 errorDescription];
                                                    char v79 = _oneIsNil((uint64_t)v77, (uint64_t)v78);

                                                    if ((v79 & 1) == 0)
                                                    {
                                                      uint64_t v80 = [(DRSRequest *)self errorDescription];
                                                      if (!v80) {
                                                        goto LABEL_49;
                                                      }
                                                      v81 = (void *)v80;
                                                      v82 = [(DRSRequest *)self errorDescription];
                                                      v83 = [(DRSRequest *)v4 errorDescription];
                                                      int v84 = [v82 isEqualToString:v83];

                                                      if (v84)
                                                      {
LABEL_49:
                                                        v85 = [(DRSRequest *)self logs];
                                                        v86 = [(DRSRequest *)v4 logs];
                                                        char v87 = _oneIsNil((uint64_t)v85, (uint64_t)v86);

                                                        if ((v87 & 1) == 0)
                                                        {
                                                          uint64_t v89 = [(DRSRequest *)self logs];
                                                          if (v89)
                                                          {
                                                            v90 = (void *)v89;
                                                            v91 = [(DRSRequest *)self logs];
                                                            v92 = [(DRSRequest *)v4 logs];
                                                            char v88 = [v91 isEqualToArray:v92];

                                                            goto LABEL_41;
                                                          }
LABEL_40:
                                                          char v88 = 1;
                                                          goto LABEL_41;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  char v88 = 0;
LABEL_41:

  return v88;
}

+ (BOOL)isExpeditedTeamID:(id)a3 issueCategory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:kDRSDMRapidTeamID[0]]
    && ([v6 isEqualToString:kDRSDMRapidMicroDiagnosticIssueCategory[0]] & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    char v7 = [v5 isEqualToString:kDRSDMPPSTeamID[0]];
  }

  return v7;
}

- (BOOL)isNonPurgeableInFlightUntilUploadAttempt
{
  unsigned int v2 = [(DRSRequest *)self teamID];
  char v3 = [v2 isEqualToString:kDRSDMNandTeamID[0]];

  return v3;
}

- (DRSRequest)initWithXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_value(v4, "ClientMessageType");

  if (!v5) {
    goto LABEL_19;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "ClientMessageType");
  if (uint64 != [(DRSRequest *)self expectedType]) {
    goto LABEL_19;
  }
  v45.receiver = self;
  v45.super_class = (Class)DRSRequest;
  self = [(DRSRequest *)&v45 init];
  if (self)
  {
    string = xpc_dictionary_get_string(v4, "TeamID");
    if (!string) {
      goto LABEL_19;
    }
    int v8 = [NSString stringWithUTF8String:string];
    teamID = self->_teamID;
    self->_teamID = v8;

    char v10 = xpc_dictionary_get_string(v4, "Category");
    if (!v10) {
      goto LABEL_19;
    }
    int v11 = [NSString stringWithUTF8String:v10];
    issueCategory = self->_issueCategory;
    self->_issueCategory = v11;

    uint64_t v13 = xpc_dictionary_get_string(v4, "Description");
    if (!v13) {
      goto LABEL_19;
    }
    int v14 = [NSString stringWithUTF8String:v13];
    issueDescription = self->_issueDescription;
    self->_issueDescription = v14;

    uint64_t v16 = xpc_dictionary_get_string(v4, "LogType");
    if (!v16) {
      goto LABEL_19;
    }
    int v17 = [NSString stringWithUTF8String:v16];
    logType = self->_logType;
    self->_logType = v17;

    char v44 = 0;
    id v19 = xpc_dictionary_get_array(v4, "LogArray");
    int v20 = xpc_dictionary_get_array(v4, "SandboxExtensions");
    id v21 = xpc_dictionary_get_array(v4, "TransferOwnership");
    __int16 v22 = +[DRSSubmittedLogInfo submittedLogInfosFromPaths:v19 sandboxExtensions:v20 transferOwnerships:v21 successOut:&v44];
    submittedLogInfos = self->_submittedLogInfos;
    self->_submittedLogInfos = v22;

    if (v44)
    {
      uint64_t v24 = [MEMORY[0x263F08C38] UUID];
      requestID = self->_requestID;
      self->_requestID = v24;

      uint64_t v26 = [MEMORY[0x263EFF910] date];
      requestDate = self->_requestDate;
      self->_requestDate = v26;

      self->_requestState = 0;
      id v28 = +[DRSSystemProfile sharedInstance];
      v29 = [v28 build];
      build = self->_build;
      self->_build = v29;

      self->_uploadAttemptCount = 0;
      self->_decisionServerDecision = 0;
      size_t v43 = 0;
      data = xpc_dictionary_get_data(v4, "ContextDict", &v43);
      if (!data || !v43)
      {
LABEL_13:
        v38 = xpc_dictionary_get_value(v4, "RequestMCT");

        if (v38)
        {
          self->_requestMCT = xpc_dictionary_get_uint64(v4, "RequestMCT");
          int v39 = [(DRSRequest *)self teamID];
          v40 = [(DRSRequest *)self issueCategory];
          self->_isExpedited = +[DRSRequest isExpeditedTeamID:v39 issueCategory:v40];

          goto LABEL_15;
        }
LABEL_19:
        unint64_t v41 = 0;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", data);
      v32 = (NSData *)objc_claimAutoreleasedReturnValue();
      uint64_t v33 = DRSDictionaryForData((uint64_t)v32);
      if (v33)
      {
        char v34 = (NSDictionary *)v33;
        contextDictionaryData = self->_contextDictionaryData;
        self->_contextDictionaryData = v32;
        v36 = v32;

        contextDictionary = self->_contextDictionary;
        self->_contextDictionary = v34;

        goto LABEL_13;
      }
    }
    else
    {
      DPLogHandle_ServiceXPCError();
      v32 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(&v32->super))
      {
        LOWORD(v43) = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, &v32->super, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedDictionary", "Failed to extract log infos from XPC dictionary", (uint8_t *)&v43, 2u);
      }
    }

    goto LABEL_19;
  }
LABEL_15:
  self = self;
  unint64_t v41 = self;
LABEL_20:

  return v41;
}

- (id)replyForMessage:(id)a3
{
  return 0;
}

- (NSString)requestType
{
  return (NSString *)&stru_26BDF7DE8;
}

- (unint64_t)expectedType
{
  return 0;
}

- (id)_processSubmittedLogInfo:(id)a3 workingDirectory:(id)a4
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 path];
  uint64_t v9 = [v6 sandboxExtension];
  id v117 = 0;
  char v10 = [[DRSSandboxExtensionHelper alloc] initWithSandboxExtensionToken:v9 logPath:v8 errorOut:&v117];
  id v11 = v117;
  if (!v10)
  {
    id v23 = [NSString alloc];
    uint64_t v24 = [v11 localizedDescription];
    id v12 = (void *)v24;
    v25 = @"Unknown";
    if (v24) {
      v25 = (__CFString *)v24;
    }
    uint64_t v22 = [v23 initWithFormat:@"Failed to consume sandbox extension for file at '%@' due to error: %@", v8, v25];
    goto LABEL_13;
  }
  id v12 = [MEMORY[0x263F08850] defaultManager];
  char v116 = 0;
  if (([v12 fileExistsAtPath:v8 isDirectory:&v116] & 1) == 0)
  {
    uint64_t v26 = DPLogHandle_SubmitLogError();
    if (os_signpost_enabled(v26))
    {
      [(DRSRequest *)self requestID];
      uint64_t v27 = v111 = v12;
      id v28 = [(DRSRequest *)self teamID];
      [(DRSRequest *)self issueCategory];
      id v108 = v6;
      id v29 = v11;
      uint64_t v30 = v10;
      int v31 = v9;
      uint64_t v33 = v32 = v7;
      char v34 = [(DRSRequest *)self issueDescription];
      *(_DWORD *)buf = 138544386;
      v121 = v27;
      __int16 v122 = 2114;
      v123 = v8;
      __int16 v124 = 2114;
      v125 = v28;
      __int16 v126 = 2114;
      uint64_t v127 = (uint64_t)v33;
      __int16 v128 = 2114;
      uint64_t v129 = (uint64_t)v34;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubmittedLogMissing", "%{public, name=requestID}@: Log with path %{public}@ submitted by %{public}@/%{public}@/%{public}@ missing", buf, 0x34u);

      id v7 = v32;
      uint64_t v9 = v31;
      char v10 = v30;
      id v11 = v29;
      id v6 = v108;

      id v12 = v111;
    }

    uint64_t v22 = [[NSString alloc] initWithFormat:@"Specified file path '%@' missing", v8, v94];
    goto LABEL_13;
  }
  if (v116)
  {
    uint64_t v13 = DPLogHandle_SubmitLogError();
    if (os_signpost_enabled(v13))
    {
      [(DRSRequest *)self requestID];
      int v14 = v110 = v12;
      long long v15 = [(DRSRequest *)self teamID];
      [(DRSRequest *)self issueCategory];
      id v107 = v6;
      id v16 = v11;
      int v17 = v10;
      id v18 = v9;
      int v20 = v19 = v7;
      id v21 = [(DRSRequest *)self issueDescription];
      *(_DWORD *)buf = 138544386;
      v121 = v14;
      __int16 v122 = 2114;
      v123 = v8;
      __int16 v124 = 2114;
      v125 = v15;
      __int16 v126 = 2114;
      uint64_t v127 = (uint64_t)v20;
      __int16 v128 = 2114;
      uint64_t v129 = (uint64_t)v21;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SubmittedLogIsDirectory", "%{public, name=requestID}@: Log with path %{public}@ submitted by %{public}@/%{public}@/%{public}@ is a directory rather than a file", buf, 0x34u);

      id v7 = v19;
      uint64_t v9 = v18;
      char v10 = v17;
      id v11 = v16;
      id v6 = v107;

      id v12 = v110;
    }

    uint64_t v22 = [[NSString alloc] initWithFormat:@"Specified file path '%@' is a directory not a file", v8, v94];
LABEL_13:
    uint64_t v35 = (void *)v22;
    goto LABEL_14;
  }
  v112 = v12;
  id v37 = [NSString alloc];
  [(DRSRequest *)self requestID];
  v38 = v109 = v7;
  int v39 = [v38 UUIDString];
  v40 = [v8 lastPathComponent];
  uint64_t v41 = [v37 initWithFormat:@"submitLog%@_%@", v39, v40];

  id v7 = v109;
  v105 = (void *)v41;
  char v42 = [v109 stringByAppendingPathComponent:v41];
  v106 = v42;
  if ([v6 transferOwnership])
  {
    id v115 = 0;
    char v43 = [v112 moveItemAtPath:v8 toPath:v42 error:&v115];
    id v44 = v115;
    objc_super v45 = v44;
    if (v43)
    {
      v102 = v44;
      long long v46 = DPLogHandle_SubmitLog();
      if (!os_signpost_enabled(v46)) {
        goto LABEL_25;
      }
      v98 = [(DRSRequest *)self requestID];
      int v47 = [(DRSRequest *)self teamID];
      uint64_t v48 = [(DRSRequest *)self issueCategory];
      uint64_t v49 = [(DRSRequest *)self issueDescription];
      *(_DWORD *)buf = 138544642;
      v121 = v98;
      __int16 v122 = 2114;
      v123 = v8;
      __int16 v124 = 2114;
      v125 = v47;
      __int16 v126 = 2114;
      uint64_t v127 = v48;
      char v50 = (void *)v48;
      __int16 v128 = 2114;
      uint64_t v129 = v49;
      uint64_t v51 = (void *)v49;
      __int16 v130 = 2114;
      v131 = v106;
      v52 = "LogMove";
      __int16 v53 = "%{public, name=requestID}@: Moved %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@";
      goto LABEL_24;
    }
    char v66 = DPLogHandle_SubmitLogError();
    if (os_signpost_enabled(v66))
    {
      v99 = [(DRSRequest *)self requestID];
      uint64_t v67 = [(DRSRequest *)self teamID];
      [(DRSRequest *)self issueCategory];
      long long v68 = v103 = v45;
      v69 = [(DRSRequest *)self issueDescription];
      v70 = [v103 localizedDescription];
      *(_DWORD *)buf = 138544898;
      v121 = v99;
      __int16 v122 = 2114;
      v123 = v8;
      __int16 v124 = 2114;
      v125 = v67;
      __int16 v126 = 2114;
      uint64_t v127 = (uint64_t)v68;
      __int16 v128 = 2114;
      uint64_t v129 = (uint64_t)v69;
      __int16 v130 = 2114;
      v131 = v106;
      __int16 v132 = 2114;
      v133 = v70;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v66, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogMoveFailed", "%{public, name=requestID}@: Attempt to move %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@ failed due to error: %{public}@", buf, 0x48u);

      id v7 = v109;
      objc_super v45 = v103;
    }
    id v71 = [NSString alloc];
    uint64_t v72 = [v45 localizedDescription];
    int v73 = v45;
    id v62 = (id)v72;
    int v74 = @"Unknown";
    if (v72) {
      int v74 = (__CFString *)v72;
    }
    char v42 = v106;
    uint64_t v75 = [v71 initWithFormat:@"Moving '%@' to '%@' failed due to error: %@", v8, v106, v74];
  }
  else
  {
    id v114 = 0;
    char v54 = [v112 copyItemAtPath:v8 toPath:v42 error:&v114];
    id v55 = v114;
    unint64_t v56 = v55;
    if (v54)
    {
      v102 = v55;
      long long v46 = DPLogHandle_SubmitLog();
      if (!os_signpost_enabled(v46)) {
        goto LABEL_25;
      }
      v98 = [(DRSRequest *)self requestID];
      int v47 = [(DRSRequest *)self teamID];
      uint64_t v57 = [(DRSRequest *)self issueCategory];
      uint64_t v58 = [(DRSRequest *)self issueDescription];
      *(_DWORD *)buf = 138544642;
      v121 = v98;
      __int16 v122 = 2114;
      v123 = v8;
      __int16 v124 = 2114;
      v125 = v47;
      __int16 v126 = 2114;
      uint64_t v127 = v57;
      char v50 = (void *)v57;
      __int16 v128 = 2114;
      uint64_t v129 = v58;
      uint64_t v51 = (void *)v58;
      __int16 v130 = 2114;
      v131 = v106;
      v52 = "LogCopy";
      __int16 v53 = "%{public, name=requestID}@: Copied %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@";
LABEL_24:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v46, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v52, v53, buf, 0x3Eu);

      id v7 = v109;
      char v42 = v106;

LABEL_25:
      uint64_t v118 = *MEMORY[0x263F08078];
      v119 = &unk_26BE05778;
      uint64_t v59 = [NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      id v113 = 0;
      char v60 = [v112 setAttributes:v59 ofItemAtPath:v42 error:&v113];
      id v61 = v113;
      if (v60)
      {

        id v62 = -[DRSLog _initWithLogPath:transferOwnership:]([DRSLog alloc], "_initWithLogPath:transferOwnership:", v42, [v6 transferOwnership]);
        if (v62)
        {
          int v63 = [(DRSRequest *)self logs];

          if (!v63)
          {
            id v64 = objc_alloc_init(MEMORY[0x263EFF980]);
            [(DRSRequest *)self setLogs:v64];
          }
          long long v65 = [(DRSRequest *)self logs];
          [v65 addObject:v62];

          uint64_t v35 = 0;
        }
        else
        {
          v92 = DPLogHandle_SubmitLogError();
          if (os_signpost_enabled(v92))
          {
            v93 = [(DRSRequest *)self requestID];
            *(_DWORD *)buf = 138543618;
            v121 = v93;
            __int16 v122 = 2114;
            v123 = v42;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v92, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogSizeLookupFailed", "%{public, name=requestID}@: Attempt to lookup log size for %{public}@ failed", buf, 0x16u);

            id v7 = v109;
          }

          uint64_t v35 = (void *)[[NSString alloc] initWithFormat:@"Size lookup on '%@' failed", v42];
        }
        int v73 = v102;
      }
      else
      {
        v97 = v59;
        v101 = v61;
        int v84 = DPLogHandle_SubmitLogError();
        if (os_signpost_enabled(v84))
        {
          v96 = [(DRSRequest *)self requestID];
          v95 = [(DRSRequest *)self teamID];
          v85 = [(DRSRequest *)self issueCategory];
          v86 = [(DRSRequest *)self issueDescription];
          char v87 = [v101 localizedDescription];
          *(_DWORD *)buf = 138544898;
          v121 = v96;
          __int16 v122 = 2114;
          v123 = v8;
          __int16 v124 = 2114;
          v125 = v95;
          __int16 v126 = 2114;
          uint64_t v127 = (uint64_t)v85;
          __int16 v128 = 2114;
          uint64_t v129 = (uint64_t)v86;
          __int16 v130 = 2114;
          v131 = v106;
          __int16 v132 = 2112;
          v133 = v87;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v84, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogPermissionsUpdateFailed", "%{public, name=requestID}@: Attempt to set permissions to '600' on %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@ failed due to error: %@{public}", buf, 0x48u);
        }
        id v88 = [NSString alloc];
        int v73 = v102;
        uint64_t v89 = [v102 localizedDescription];
        v90 = (void *)v89;
        v91 = @"Unknown";
        if (v89) {
          v91 = (__CFString *)v89;
        }
        char v42 = v106;
        uint64_t v35 = (void *)[v88 initWithFormat:@"Updating permissions on '%@' failed due to error: %@", v106, v91];

        id v7 = v109;
        id v62 = v97;
      }
      goto LABEL_50;
    }
    BOOL v76 = DPLogHandle_SubmitLogError();
    if (os_signpost_enabled(v76))
    {
      v100 = [(DRSRequest *)self requestID];
      v77 = [(DRSRequest *)self teamID];
      [(DRSRequest *)self issueCategory];
      v78 = v104 = v56;
      char v79 = [(DRSRequest *)self issueDescription];
      uint64_t v80 = [v104 localizedDescription];
      *(_DWORD *)buf = 138544898;
      v121 = v100;
      __int16 v122 = 2114;
      v123 = v8;
      __int16 v124 = 2114;
      v125 = v77;
      __int16 v126 = 2114;
      uint64_t v127 = (uint64_t)v78;
      __int16 v128 = 2114;
      uint64_t v129 = (uint64_t)v79;
      __int16 v130 = 2114;
      v131 = v106;
      __int16 v132 = 2112;
      v133 = v80;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v76, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogCopyFailed", "%{public, name=requestID}@: Attempt to copy %{public}@ submitted by %{public}@/%{public}@/%{public}@ to %{public}@ failed due to error: %@{public}", buf, 0x48u);

      id v7 = v109;
      unint64_t v56 = v104;
    }
    id v81 = [NSString alloc];
    uint64_t v82 = [v56 localizedDescription];
    int v73 = v56;
    id v62 = (id)v82;
    v83 = @"Unknown";
    if (v82) {
      v83 = (__CFString *)v82;
    }
    char v42 = v106;
    uint64_t v75 = [v81 initWithFormat:@"Copying '%@' to '%@' failed due to error: %@", v8, v106, v83];
  }
  uint64_t v35 = (void *)v75;
LABEL_50:

  id v12 = v112;
LABEL_14:

  return v35;
}

- (BOOL)performOnReceiptWork:(id)a3 dampeningOutcome:(unint64_t)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[DRSSystemProfile sharedInstance];
  uint64_t v8 = [v7 isLogUploadEnabled];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v9 = [(DRSRequest *)self submittedLogInfos];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v9);
        }
        if ([*(id *)(*((void *)&v48 + 1) + 8 * i) transferOwnership])
        {

          goto LABEL_21;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (a4) {
    char v14 = 0;
  }
  else {
    char v14 = v8;
  }
  if (v14)
  {
LABEL_21:
    id v18 = [(DRSRequest *)self submittedLogInfos];
    submittedLogInfos = self->_submittedLogInfos;
    self->_submittedLogInfos = 0;

    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [(DRSRequest *)self _processSubmittedLogInfo:*(void *)(*((void *)&v44 + 1) + 8 * j) workingDirectory:v6];
          if (v26) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v23);
    }

    if ([v20 count])
    {
      id v39 = v21;
      id v27 = objc_alloc_init(MEMORY[0x263F089D8]);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v28 = v20;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v41;
        char v32 = 1;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v41 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v34 = *(void *)(*((void *)&v40 + 1) + 8 * k);
            if ((v32 & 1) == 0) {
              [v27 appendString:@", "];
            }
            [v27 appendString:v34];
            char v32 = 0;
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
          char v32 = 0;
        }
        while (v30);
      }

      [(DRSRequest *)self updateToState:4352 errorDescription:v27 errorOut:0];
      BOOL v17 = 0;
      id v21 = v39;
    }
    else
    {
      unint64_t v35 = [(DRSRequest *)self totalLogSizeBytes];
      unint64_t v36 = [(DRSRequest *)self totalLogSizeBytes];
      if (v36 <= [(DRSRequest *)self logSizeLimitBytes])
      {
        BOOL v17 = [(DRSRequest *)self _performPostClientLogWork:v6 dampeningOutcome:a4 isLogUploadEnabled:v8];
      }
      else
      {
        id v37 = objc_msgSend([NSString alloc], "initWithFormat:", @"Log(s) exceed size cap. Submitted size %zuB vs. cap %lluB", v35, -[DRSRequest logSizeLimitBytes](self, "logSizeLimitBytes"));
        [(DRSRequest *)self updateToState:4357 errorDescription:v37 errorOut:0];

        BOOL v17 = 0;
      }
    }
  }
  else
  {
    if (a4 - 1 >= 8) {
      unint64_t v15 = 0;
    }
    else {
      unint64_t v15 = a4 + 4095;
    }
    if (a4) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 4103;
    }
    BOOL v17 = [(DRSRequest *)self updateToState:v16 errorDescription:0 errorOut:0];
  }

  return v17;
}

- (BOOL)_performPostClientLogWork:(id)a3 dampeningOutcome:(unint64_t)a4 isLogUploadEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  switch(a4)
  {
    case 0uLL:
      if (v5)
      {
        uint64_t v9 = self;
        uint64_t v10 = 1;
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = @"Log upload is disabled";
        uint64_t v9 = self;
        uint64_t v10 = 4103;
      }
      goto LABEL_14;
    case 1uLL:
      uint64_t v10 = 4096;
      goto LABEL_13;
    case 2uLL:
      uint64_t v10 = 4097;
      goto LABEL_13;
    case 3uLL:
      uint64_t v10 = 4098;
      goto LABEL_13;
    case 4uLL:
      uint64_t v10 = 4099;
      goto LABEL_13;
    case 5uLL:
      uint64_t v10 = 4100;
      goto LABEL_13;
    case 6uLL:
      uint64_t v10 = 4101;
      goto LABEL_13;
    case 7uLL:
      uint64_t v10 = 4102;
      goto LABEL_13;
    case 8uLL:
      uint64_t v10 = 4103;
      goto LABEL_13;
    default:
      uint64_t v10 = 0;
LABEL_13:
      uint64_t v11 = @"Request denied due to dampening";
      uint64_t v9 = self;
LABEL_14:
      BOOL v12 = [(DRSRequest *)v9 updateToState:v10 errorDescription:v11 errorOut:0];

      return v12;
  }
}

- (BOOL)hasUploadableContent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v3 = [(DRSRequest *)self logs];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(DRSRequest *)self logs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![*(id *)(*((void *)&v12 + 1) + 8 * i) isAvailableOnDisk])
        {
          BOOL v10 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)_updateLogStateToExpectedState:(unsigned __int8)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0u:
      uint64_t v4 = DPLogHandle_RequestError();
      if (os_signpost_enabled(v4))
      {
        BOOL v5 = [(DRSRequest *)self debugDescription];
        int v8 = 138543362;
        uint64_t v9 = v5;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidLogStateUpdate", "Tried to update to non-purgeable state: %{public}@", (uint8_t *)&v8, 0xCu);
      }
      goto LABEL_5;
    case 1u:
      uint64_t v7 = 1024;
      goto LABEL_8;
    case 2u:
      uint64_t v7 = 512;
LABEL_8:
      BOOL result = [(DRSRequest *)self _markLogsAsPurgeableWithUrgencyWithDeleteFallback:v7];
      break;
    case 3u:
      BOOL result = [(DRSRequest *)self _deleteLogs];
      break;
    default:
LABEL_5:
      BOOL result = 0;
      break;
  }
  return result;
}

- (BOOL)_deleteLogs
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v3 = DPLogHandle_LogManagement();
  if (os_signpost_enabled(v3))
  {
    uint64_t v4 = [(DRSRequest *)self requestID];
    BOOL v5 = [(DRSRequest *)self logs];
    *(_DWORD *)buf = 138543618;
    id v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = [v5 count];
    _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "LogDelete", "Request ID %{public}@: Deleting %lu logs", buf, 0x16u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(DRSRequest *)self logs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= [*(id *)(*((void *)&v14 + 1) + 8 * v11++) _deleteOnDiskLog] ^ 1;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
    char v12 = v9 ^ 1;
  }
  else
  {
    char v12 = 1;
  }

  return v12 & 1;
}

- (BOOL)_updateLogFileStateForTransitionFromPreviousState:(unint64_t)a3
{
  int v4 = DRSRequestExpectedLogStateForState(a3, [(DRSRequest *)self isNonPurgeableInFlightUntilUploadAttempt], [(DRSRequest *)self uploadAttemptCount]);
  uint64_t v5 = DRSRequestExpectedLogStateForState([(DRSRequest *)self requestState], [(DRSRequest *)self isNonPurgeableInFlightUntilUploadAttempt], [(DRSRequest *)self uploadAttemptCount]);
  if (v4 == v5 || [(DRSRequest *)self _updateLogStateToExpectedState:v5]) {
    return 1;
  }
  self->_requestState = 4359;
  id v7 = [NSString alloc];
  uint64_t v8 = [(DRSRequest *)self logPath];
  int v9 = (void *)v8;
  uint64_t v10 = @"<Missing path>";
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  uint64_t v11 = (NSString *)[v7 initWithFormat:@"Failed to update log purgeability state or failed to delete file: %@", v10];
  errorDescription = self->_errorDescription;
  self->_errorDescription = v11;

  return 0;
}

- (BOOL)updateToState:(unint64_t)a3 errorDescription:(id)a4 errorOut:(id *)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  int v9 = (__CFString *)a4;
  unint64_t v10 = [(DRSRequest *)self requestState];
  if (!DRSRequestOutcomeForState([(DRSRequest *)self requestState]))
  {
    if (a3 != 2 || v10 == 1)
    {
      self->_requestState = a3;
      objc_storeStrong((id *)&self->_errorDescription, a4);
      if ([(DRSRequest *)self requestState] != 4352)
      {
LABEL_18:
        BOOL v19 = [(DRSRequest *)self _updateLogFileStateForTransitionFromPreviousState:v10];
        goto LABEL_19;
      }
      uint64_t v26 = DPLogHandle_RequestError();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[DRSRequest updateToState:errorDescription:errorOut:](v9, v26);
      }
    }
    else
    {
      if (a5)
      {
        id v20 = (void *)[[NSString alloc] initWithFormat:@"Cannot start upload if not awaiting upload"];
        __int16 v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v31 = *MEMORY[0x263F08320];
        char v32 = v20;
        uint64_t v22 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        *a5 = [v21 errorWithDomain:@"DRSRequestStateTransitionError" code:0 userInfo:v22];
      }
      uint64_t v23 = DPLogHandle_RequestError();
      if (os_signpost_enabled(v23))
      {
        uint64_t v24 = [(DRSRequest *)self debugDescription];
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = v24;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStateTransitionError", "Cannot start upload if not awaiting upload for request:%{public}@", buf, 0xCu);
      }
      self->_requestState = 4358;
      id v25 = [NSString alloc];
      uint64_t v26 = [(DRSRequest *)self requestStateString];
      id v27 = DRRequestStateWithOutcomeStringForState(2);
      id v28 = (NSString *)[v25 initWithFormat:@"Invalid state transition: %@ (%#llx) -> %@ (%#llx)", v26, v10, v27, 2];
      errorDescription = self->_errorDescription;
      self->_errorDescription = v28;
    }
    goto LABEL_18;
  }
  if (a5)
  {
    id v11 = [NSString alloc];
    char v12 = [(DRSRequest *)self requestStateString];
    long long v13 = (void *)[v11 initWithFormat:@"Cannot transition out of terminal state %@ (%#llx)", v12, -[DRSRequest requestState](self, "requestState")];

    long long v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40[0] = v13;
    long long v15 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    *a5 = [v14 errorWithDomain:@"DRSRequestStateTransitionError" code:0 userInfo:v15];
  }
  long long v16 = DPLogHandle_RequestError();
  if (os_signpost_enabled(v16))
  {
    long long v17 = [(DRSRequest *)self requestStateString];
    id v18 = [(DRSRequest *)self debugDescription];
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v17;
    __int16 v35 = 2048;
    unint64_t v36 = v10;
    __int16 v37 = 2114;
    v38 = v18;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestStateTransitionError", "Cannot transition out of terminal state %{public}@ (%#llx) for request: %{public}@", buf, 0x20u);
  }
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

- (BOOL)uploadStarted
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(DRSRequest *)self uploadID])
  {
    char v3 = DPLogHandle_RequestError();
    if (os_signpost_enabled(v3))
    {
      int v4 = [(DRSRequest *)self requestID];
      *(_DWORD *)buf = 138543362;
      long long v16 = v4;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidUploadID", "Request ID %{public}@: Trying to start an upload when we already have an upload ID", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
  else
  {
    self->_uploadID = atomic_fetch_add(&_uniqueSignpostID_nextSerialNumber, 1uLL);
    id v14 = 0;
    BOOL v5 = [(DRSRequest *)self updateToState:2 errorDescription:0 errorOut:&v14];
    char v3 = v14;
    if (v5)
    {
      uint64_t v6 = DPLogHandle_CKRecordUpload();
      unint64_t v7 = [(DRSRequest *)self uploadID];
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v8 = v7;
        if (os_signpost_enabled(v6))
        {
          int v9 = [(DRSRequest *)self requestID];
          unint64_t v10 = [(DRSRequest *)self teamID];
          id v11 = [(DRSRequest *)self issueCategory];
          char v12 = [(DRSRequest *)self issueDescription];
          *(_DWORD *)buf = 138413058;
          long long v16 = v9;
          __int16 v17 = 2114;
          id v18 = v10;
          __int16 v19 = 2114;
          id v20 = v11;
          __int16 v21 = 2114;
          uint64_t v22 = v12;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LogUpload", "Began upload of log with request ID %@, %{public, name=teamID}@/%{public, name=issueCategory}@/%{public, name=issueDescription}@", buf, 0x2Au);
        }
      }

      ++self->_uploadAttemptCount;
    }
  }

  return v5;
}

- (void)uploadFailedDueToReason:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = [(DRSRequest *)self uploadAttemptCount];
  uint64_t v6 = DPLogHandle_CKRecordUpload();
  os_signpost_id_t v7 = [(DRSRequest *)self uploadID];
  unint64_t v8 = v7 - 1;
  if (v5 < 3)
  {
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67240450;
      int v11 = 0;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_INTERVAL_END, v7, "LogUpload", "Upload failed. Will retry. %{public, name=uploadSuccess}u Error: %{public}@", buf, 0x12u);
    }

    [(DRSRequest *)self updateToState:1 errorDescription:0 errorOut:0];
  }
  else
  {
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_DWORD *)buf = 67240450;
      int v11 = 0;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_INTERVAL_END, v7, "LogUpload", "Upload failure. %{public, name=uploadSuccess}u Error: %{public}@", buf, 0x12u);
    }

    int v9 = (void *)[[NSString alloc] initWithFormat:@"Stopped trying to upload after %llu attempts. Upload error: %@", 3, v4];
    [(DRSRequest *)self updateToState:4355 errorDescription:v9 errorOut:0];
  }
}

- (void)uploadCompleteWithError:(id)a3 ckRecordID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (a3)
  {
    uint64_t v8 = [a3 localizedDescription];
    int v9 = (void *)v8;
    if (v8) {
      unint64_t v10 = (__CFString *)v8;
    }
    else {
      unint64_t v10 = @"Unknown";
    }
    [(DRSRequest *)self uploadFailedDueToReason:v10];
  }
  else
  {
    objc_storeStrong((id *)&self->_ckRecordID, a4);
    int v11 = DPLogHandle_CKRecordUpload();
    unint64_t v12 = [(DRSRequest *)self uploadID];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v13 = v12;
      if (os_signpost_enabled(v11))
      {
        v14[0] = 67240450;
        v14[1] = 1;
        __int16 v15 = 2114;
        id v16 = v7;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_INTERVAL_END, v13, "LogUpload", "Upload success. %{public, name=uploadSuccess}u CK Record ID: %{public}@", (uint8_t *)v14, 0x12u);
      }
    }

    [(DRSRequest *)self updateToState:0x2000 errorDescription:0 errorOut:0];
  }
}

- (void)makeTerminalDueToMissingLog
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v3 = DPLogHandle_CKRecordUpload();
  unint64_t v4 = [(DRSRequest *)self uploadID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      uint64_t v6 = [(DRSRequest *)self requestID];
      *(_DWORD *)buf = 138543362;
      os_signpost_id_t v13 = v6;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, v5, "MakingTerminalDueToLogsMissing", "Moving %{public}@ to terminal state due to missing uploadable content", buf, 0xCu);
    }
  }

  id v7 = [NSString alloc];
  uint64_t v8 = [(DRSRequest *)self logPath];
  int v9 = (void *)v8;
  unint64_t v10 = @"Unknown";
  if (v8) {
    unint64_t v10 = (__CFString *)v8;
  }
  int v11 = (void *)[v7 initWithFormat:@"Log file is missing (path: %@)", v10];

  [(DRSRequest *)self updateToState:4354 errorDescription:v11 errorOut:0];
}

- (void)uploadAbortedDueToLogSize
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = DPLogHandle_CKRecordUpload();
  unint64_t v4 = [(DRSRequest *)self uploadID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v5 = v4;
    if (os_signpost_enabled(v3))
    {
      uint64_t v6 = [(DRSRequest *)self requestID];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_INTERVAL_END, v5, "LogUpload", "Log size for %{public}@ exceeds cap", (uint8_t *)&v7, 0xCu);
    }
  }

  [(DRSRequest *)self updateToState:4357 errorDescription:@"Log size is too large or could not be determined" errorOut:0];
}

- (void)uploadDeniedByDecisionServerWithReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v4 = (__CFString *)a3;
  os_signpost_id_t v5 = DPLogHandle_CKRecordUpload();
  unint64_t v6 = [(DRSRequest *)self uploadID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      if (v4) {
        uint64_t v8 = v4;
      }
      else {
        uint64_t v8 = @"Unknown";
      }
      int v10 = 138543362;
      int v11 = v8;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_INTERVAL_END, v7, "LogUpload", "Upload denied by decision server due to reason %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }

  if (v4) {
    uint64_t v9 = v4;
  }
  else {
    uint64_t v9 = @"Unknown";
  }
  [(DRSRequest *)self updateToState:4353 errorDescription:v9 errorOut:0];
}

+ (id)_requestWithRequestMO_ON_MOC_QUEUE:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = [[DRSTailspinRequest alloc] _initWithTailspinRequestMO_ON_MOC_QUEUE:v3];
LABEL_9:
    os_signpost_id_t v5 = v4;
    goto LABEL_10;
  }
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = [[DRSSubmitLogRequest alloc] _initWithSubmitLogRequestMO_ON_MOC_QUEUE:v3];
    goto LABEL_9;
  }
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = [[DRSSubmitLogToCKContainerRequest alloc] _initWithSubmitLogToCKContainerRequestMO_ON_MOC_QUEUE:v3];
    goto LABEL_9;
  }
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    id v4 = [[DRSSubmitRapidLogRequest alloc] _initWithSubmitRapidLogRequestMO_ON_MOC_QUEUE:v3];
    goto LABEL_9;
  }
  os_signpost_id_t v7 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v7))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = 138543362;
    int v11 = v9;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnexpectedManagedObjectClass", "Tried to create a DRSRequest instance with an unknown ManagedObject class: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  os_signpost_id_t v5 = 0;
LABEL_10:

  return v5;
}

- (BOOL)_populateLogsArray_ON_MOC_QUEUE:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_signpost_id_t v5 = [v4 logs];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    os_signpost_id_t v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    logs = objc_msgSend(v4, "logs", 0);
    uint64_t v9 = [logs countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(logs);
          }
          os_signpost_id_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v14 = [[DRSLog alloc] _initWithLogMO_ON_MOC_QUEUE:v13];
          if (!v14)
          {
            uint64_t v17 = DPLogHandle_CoreDataError();
            if (os_signpost_enabled(v17))
            {
              id v18 = [v13 path];
              uint64_t v19 = [v13 size];
              *(_DWORD *)buf = 138412546;
              unint64_t v36 = v18;
              __int16 v37 = 2048;
              uint64_t v38 = v19;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSLogCreationFailure", "Failed to create a DRSLog from a DRSLogMO: Path: %@ Size: %llu", buf, 0x16u);
            }
            BOOL v16 = 0;
            goto LABEL_34;
          }
          __int16 v15 = v14;
          [(NSArray *)v7 addObject:v14];
        }
        uint64_t v10 = [logs countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    os_signpost_id_t v7 = v7;
    logs = self->_logs;
    self->_logs = v7;
    BOOL v16 = 1;
    goto LABEL_34;
  }
  id v20 = [v4 managedObjectContext];
  uint64_t v21 = [v20 persistentStoreCoordinator];
  os_signpost_id_t v7 = [(id)v21 managedObjectModel];

  uint64_t v22 = [(NSArray *)v7 versionIdentifiers];
  LOBYTE(v21) = [v22 containsObject:@"3"];

  if ((v21 & 1) == 0)
  {
    logs = [v4 valueForKey:@"logPath"];
    uint64_t v23 = [v4 valueForKey:@"cachedLogSize"];
    uint64_t v24 = [v4 valueForKey:@"transferOwnership"];
    if (!logs)
    {
      BOOL v16 = 1;
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    if (!v23) {
      uint64_t v23 = &unk_26BE05760;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = -[DRSLog _initWithLogPath:transferOwnership:size:]([DRSLog alloc], "_initWithLogPath:transferOwnership:size:", logs, [v24 BOOLValue], objc_msgSend(v23, "unsignedLongLongValue"));
          uint64_t v34 = v25;
          BOOL v16 = 1;
          uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
          id v27 = self->_logs;
          self->_logs = v26;

LABEL_32:
          goto LABEL_33;
        }
        id v25 = DPLogHandle_CoreDataError();
        if (os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          id v28 = "Unexpected class for 'transferOwnership'";
          goto LABEL_30;
        }
LABEL_31:
        BOOL v16 = 0;
        goto LABEL_32;
      }
      id v25 = DPLogHandle_CoreDataError();
      if (!os_signpost_enabled(v25)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      id v28 = "Unexpected class for 'cachedLogSize'";
    }
    else
    {
      id v25 = DPLogHandle_CoreDataError();
      if (!os_signpost_enabled(v25)) {
        goto LABEL_31;
      }
      *(_WORD *)buf = 0;
      id v28 = "Unexpected class for 'logPath'";
    }
LABEL_30:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSLogCreationFailure", v28, buf, 2u);
    goto LABEL_31;
  }
  BOOL v16 = 1;
LABEL_35:

  return v16;
}

+ (BOOL)_requestMOHasRequiredFields_ON_MOC_QUEUE:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    os_signpost_id_t v5 = [v3 issueCategory];

    if (v5)
    {
      os_signpost_id_t v5 = [v4 issueDescription];

      if (v5)
      {
        os_signpost_id_t v5 = [v4 requestDate];

        if (v5)
        {
          os_signpost_id_t v5 = [v4 requestID];

          if (v5)
          {
            uint64_t v6 = [v4 teamID];
            LOBYTE(v5) = v6 != 0;
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (id)_initWithRequestMO_ON_MOC_QUEUE:(id)a3
{
  id v4 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "_requestMOHasRequiredFields_ON_MOC_QUEUE:", v4)) {
    goto LABEL_13;
  }
  v31.receiver = self;
  v31.super_class = (Class)DRSRequest;
  os_signpost_id_t v5 = [(DRSRequest *)&v31 init];
  self = v5;
  if (!v5)
  {
LABEL_12:
    self = self;
    uint64_t v23 = self;
    goto LABEL_14;
  }
  if (![(DRSRequest *)v5 _populateLogsArray_ON_MOC_QUEUE:v4])
  {
LABEL_13:
    uint64_t v23 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [v4 teamID];
  teamID = self->_teamID;
  self->_teamID = v6;

  uint64_t v8 = [v4 issueCategory];
  issueCategory = self->_issueCategory;
  self->_issueCategory = v8;

  uint64_t v10 = [v4 issueDescription];
  issueDescription = self->_issueDescription;
  self->_issueDescription = v10;

  self->_requestMCT = [v4 requestMCT];
  uint64_t v12 = [v4 contextDictionaryData];
  contextDictionaryData = self->_contextDictionaryData;
  self->_contextDictionaryData = v12;

  id v14 = [v4 requestDate];
  requestDate = self->_requestDate;
  self->_requestDate = v14;

  uint64_t v16 = [v4 build];
  uint64_t v17 = (void *)v16;
  if (v16) {
    id v18 = (__CFString *)v16;
  }
  else {
    id v18 = @"Unknown";
  }
  objc_storeStrong((id *)&self->_build, v18);

  self->_uploadAttemptCount = [v4 uploadAttemptCount];
  self->_hasBeenCountedByTelemetry = [v4 hasBeenCountedByTelemetry];
  self->_decisionServerDecision = [v4 decisionServerDecision];
  uint64_t v19 = [(DRSRequest *)self contextDictionaryData];

  if (!v19) {
    goto LABEL_9;
  }
  id v20 = [(DRSRequest *)self contextDictionaryData];
  DRSDictionaryForData((uint64_t)v20);
  uint64_t v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  contextDictionary = self->_contextDictionary;
  self->_contextDictionary = v21;

  uint64_t v23 = [(DRSRequest *)self contextDictionary];

  if (v23)
  {
LABEL_9:
    uint64_t v24 = [v4 requestID];
    requestID = self->_requestID;
    self->_requestID = v24;

    self->_requestState = [v4 requestState];
    if ([(DRSRequest *)self requestState] == 4353) {
      self->_decisionServerDecision = 1;
    }
    uint64_t v26 = [v4 errorDescription];
    errorDescription = self->_errorDescription;
    self->_errorDescription = v26;

    self->_isExpedited = [v4 isExpedited];
    id v28 = [v4 ckRecordID];
    ckRecordID = self->_ckRecordID;
    self->_ckRecordID = v28;

    goto LABEL_12;
  }
LABEL_14:

  return v23;
}

+ (id)requestsForFilterPredicate:(id)a3 context:(id)a4 sortDescriptors:(id)a5 fetchLimit:(unint64_t)a6 errorOut:(id *)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  unint64_t v36 = __Block_byref_object_copy_;
  __int16 v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __85__DRSRequest_requestsForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke;
  v25[3] = &unk_263FC9728;
  id v31 = a1;
  id v16 = v12;
  id v26 = v16;
  id v17 = v14;
  id v27 = v17;
  unint64_t v32 = a6;
  id v18 = v13;
  id v28 = v18;
  long long v30 = &v33;
  id v19 = v15;
  id v29 = v19;
  [v18 performBlockAndWait:v25];
  if (v34[5])
  {

    id v20 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v20))
    {
      uint64_t v21 = [(id)v34[5] localizedDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v21;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestFetchFailure", "Failed to fetch requests due to error: %{public}@", buf, 0xCu);
    }
    id v19 = 0;
  }
  if (a7) {
    *a7 = (id) v34[5];
  }
  uint64_t v22 = v29;
  id v23 = v19;

  _Block_object_dispose(&v33, 8);

  return v23;
}

void __85__DRSRequest_requestsForFilterPredicate_context_sortDescriptors_fetchLimit_errorOut___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  unsigned int v2 = (void *)MEMORY[0x263EFF260];
  id v3 = [*(id *)(a1 + 72) entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setPredicate:*(void *)(a1 + 32)];
  [v4 setSortDescriptors:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 80)) {
    objc_msgSend(v4, "setFetchLimit:");
  }
  os_signpost_id_t v5 = *(void **)(a1 + 48);
  id v27 = 0;
  uint64_t v6 = [v5 executeFetchRequest:v4 error:&v27];
  id v7 = v27;
  uint64_t v8 = v7;
  if (v6)
  {
    if ([v6 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = +[DRSRequest _requestWithRequestMO_ON_MOC_QUEUE:](DRSRequest, "_requestWithRequestMO_ON_MOC_QUEUE:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
            if (!v14)
            {
              id v18 = (void *)MEMORY[0x263F087E8];
              uint64_t v28 = *MEMORY[0x263F08320];
              id v29 = @"Failed to create request for requestMO";
              id v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
              uint64_t v20 = [v18 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v19];
              uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
              uint64_t v22 = *(void **)(v21 + 40);
              *(void *)(v21 + 40) = v20;

              goto LABEL_18;
            }
            id v15 = (void *)v14;
            [*(id *)(a1 + 56) addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v30 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_18:
    }
  }
  else
  {
    if (!v7)
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v32[0] = @"Unknown fetch error";
      id v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      uint64_t v8 = [v16 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v17];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
  }
}

+ (id)unreportedTerminalRequestsFromContext:(id)a3 sortDescriptors:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  id v9 = (void *)MEMORY[0x263F08A98];
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_msgSend(v9, "predicateWithFormat:", @"(requestState >= %llu) AND (hasBeenCountedByTelemetry == NO)", 4096);
  id v13 = +[DRSRequest requestsForFilterPredicate:v12 context:v11 sortDescriptors:v10 fetchLimit:a5 errorOut:a6];

  return v13;
}

+ (id)uploadedBytesSinceDate:(id)a3 context:(id)a4 errorOut:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"(requestDate >= %@) AND (requestState == %llu)", a3, 0x2000];
  id v9 = +[DRSRequest requestsForFilterPredicate:v8 context:v7 sortDescriptors:0 fetchLimit:0 errorOut:a5];
  id v10 = v9;
  id v11 = 0;
  if (!*a5)
  {
    if ([v9 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = 0;
        uint64_t v16 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v16) {
              objc_enumerationMutation(v12);
            }
            v15 += [*(id *)(*((void *)&v19 + 1) + 8 * i) totalLogSizeBytes];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
      else
      {
        uint64_t v15 = 0;
      }

      id v11 = [NSNumber numberWithUnsignedLongLong:v15];
    }
    else
    {
      id v11 = &unk_26BE05760;
    }
  }

  return v11;
}

+ (unint64_t)requestCountForFilterPredicate:(id)a3 context:(id)a4 fetchLimit:(unint64_t)a5 errorOut:(id *)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)MEMORY[0x263EFF260];
  uint64_t v13 = [a1 entityName];
  uint64_t v14 = [v12 fetchRequestWithEntityName:v13];

  [v14 setPredicate:v10];
  [v14 setResultType:4];
  if (a5) {
    [v14 setFetchLimit:a5];
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v31 = 0;
  unint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy_;
  uint64_t v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  long long v25 = __73__DRSRequest_requestCountForFilterPredicate_context_fetchLimit_errorOut___block_invoke;
  long long v26 = &unk_263FC9750;
  id v29 = &v37;
  id v15 = v11;
  id v27 = v15;
  id v16 = v14;
  id v28 = v16;
  long long v30 = &v31;
  [v15 performBlockAndWait:&v23];
  if (a6) {
    *a6 = (id) v32[5];
  }
  if (v32[5])
  {
    id v17 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v17))
    {
      uint64_t v18 = objc_msgSend((id)v32[5], "localizedDescription", v23, v24, v25, v26, v27);
      long long v19 = (void *)v18;
      long long v20 = @"Unknown";
      if (v18) {
        long long v20 = (__CFString *)v18;
      }
      *(_DWORD *)buf = 138543362;
      long long v42 = v20;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequestCountFailure", "Encountered failure when fetching count: %{public}@", buf, 0xCu);
    }
    unint64_t v21 = 0;
  }
  else
  {
    unint64_t v21 = v38[3];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v21;
}

void __73__DRSRequest_requestCountForFilterPredicate_context_fetchLimit_errorOut___block_invoke(void *a1)
{
  unsigned int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id obj = 0;
  uint64_t v4 = [v2 countForFetchRequest:v3 error:&obj];
  id v5 = obj;
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v5);
}

+ (id)leastRecentDateFirstSortDescriptor
{
  if (leastRecentDateFirstSortDescriptor_onceToken != -1) {
    dispatch_once(&leastRecentDateFirstSortDescriptor_onceToken, &__block_literal_global);
  }
  unsigned int v2 = (void *)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor;

  return v2;
}

void __48__DRSRequest_leastRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"requestDate" ascending:1];
  v1 = (void *)leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor;
  leastRecentDateFirstSortDescriptor_leastRecentDateSortDescriptor = v0;
}

+ (id)mostRecentDateFirstSortDescriptor
{
  if (mostRecentDateFirstSortDescriptor_onceToken != -1) {
    dispatch_once(&mostRecentDateFirstSortDescriptor_onceToken, &__block_literal_global_443);
  }
  unsigned int v2 = (void *)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor;

  return v2;
}

void __47__DRSRequest_mostRecentDateFirstSortDescriptor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"requestDate" ascending:0];
  v1 = (void *)mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor;
  mostRecentDateFirstSortDescriptor_mostRecentDateSortDescriptor = v0;
}

+ (BOOL)cleanRequestRecordsFromPersistentContainer:(id)a3 removeFiles:(BOOL)a4 removeRecord:(BOOL)a5 matchingPredicate:(id)a6 errorOut:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a6;
  if (a4 || v9)
  {
    id v15 = (void *)[v12 newBackgroundContext];
    id v16 = (void *)MEMORY[0x263EFF260];
    id v17 = [a1 entityName];
    uint64_t v18 = [v16 fetchRequestWithEntityName:v17];

    [v18 setPredicate:v13];
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy_;
    unint64_t v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __109__DRSRequest_cleanRequestRecordsFromPersistentContainer_removeFiles_removeRecord_matchingPredicate_errorOut___block_invoke;
    v22[3] = &unk_263FC9798;
    id v19 = v15;
    id v23 = v19;
    id v20 = v18;
    id v24 = v20;
    long long v25 = &v28;
    BOOL v26 = a4;
    BOOL v27 = v9;
    [v19 performBlockAndWait:v22];
    if (a7) {
      *a7 = (id) v29[5];
    }
    BOOL v14 = v29[5] == 0;

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

void __109__DRSRequest_cleanRequestRecordsFromPersistentContainer_removeFiles_removeRecord_matchingPredicate_errorOut___block_invoke(uint64_t a1)
{
  v64[1] = *MEMORY[0x263EF8340];
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v52 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v52];
  id v5 = v52;
  uint64_t v6 = v5;
  if (v4)
  {
    id v40 = v5;
    uint64_t v41 = v4;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v49 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (*(unsigned char *)(a1 + 56))
          {
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v12 = [v11 logs];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v61 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v45;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v45 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * j), "path", v40);
                  _deleteFileWithPath(v17);
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v61 count:16];
              }
              while (v14);
            }
          }
          if (*(unsigned char *)(a1 + 57)) {
            [*(id *)(a1 + 32) deleteObject:v11];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v62 count:16];
      }
      while (v8);
    }

    if ([*(id *)(a1 + 32) hasChanges])
    {
      uint64_t v18 = *(void **)(a1 + 32);
      id v43 = 0;
      char v19 = [v18 save:&v43];
      id v20 = v43;
      if ((v19 & 1) == 0)
      {
        unint64_t v21 = DPLogHandle_CoreDataError();
        if (os_signpost_enabled(v21))
        {
          uint64_t v22 = [v20 localizedDescription];
          id v23 = (void *)v22;
          id v24 = @"Unknown";
          if (v22) {
            id v24 = (__CFString *)v22;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v54 = (uint64_t)v24;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearRecordsFailure", "Failed to save deletion of records due to error: %{public}@", buf, 0xCu);
        }
        if (!v20)
        {
          long long v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v59 = *MEMORY[0x263F08320];
          char v60 = @"Unknown save error";
          BOOL v26 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          id v20 = [v25 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v26];
        }
      }
    }
    BOOL v27 = DPLogHandle_CoreData();
    id v28 = v40;
    if (os_signpost_enabled(v27))
    {
      uint64_t v29 = [obj count];
      uint64_t v30 = @"YES";
      int v31 = *(unsigned __int8 *)(a1 + 57);
      if (*(unsigned char *)(a1 + 56)) {
        unint64_t v32 = @"YES";
      }
      else {
        unint64_t v32 = @"NO";
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v54 = v29;
      if (!v31) {
        uint64_t v30 = @"NO";
      }
      __int16 v55 = 2114;
      unint64_t v56 = v32;
      __int16 v57 = 2114;
      uint64_t v58 = v30;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearRecordsSuccess", "Cleaned %lu requests (Remove files: %{public}@, remove records: %{public}@", buf, 0x20u);
    }
    uint64_t v4 = v41;
  }
  else
  {
    id v33 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v33))
    {
      uint64_t v34 = [v6 localizedDescription];
      uint64_t v35 = (void *)v34;
      id v36 = @"Unknown";
      if (v34) {
        id v36 = (__CFString *)v34;
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = (uint64_t)v36;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearRecordsFailure", "Fetch records due to error: %{public}@", buf, 0xCu);
    }
    if (!v6)
    {
      uint64_t v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v63 = *MEMORY[0x263F08320];
      v64[0] = @"Unknown fetch error";
      id v38 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
      uint64_t v6 = [v37 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v38];
    }
    uint64_t v39 = *(void *)(*(void *)(a1 + 48) + 8);
    id v28 = v6;
    BOOL v27 = *(NSObject **)(v39 + 40);
    *(void *)(v39 + 40) = v28;
  }
}

+ (BOOL)cullOldRequestRecordsFromPersistentContainer:(id)a3 currentDate:(id)a4 errorOut:(id *)a5
{
  v35[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (objc_class *)MEMORY[0x263EFF910];
  id v9 = a4;
  id v10 = (void *)[[v8 alloc] initWithTimeInterval:v9 sinceDate:-259200.0];
  id v11 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeInterval:v9 sinceDate:-864000.0];
  id v12 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeInterval:v9 sinceDate:-2592000.0];

  uint64_t v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"requestDate < %@ AND requestState >= %llu", v11, 0x2000];
  BOOL v14 = +[DRSRequest cleanRequestRecordsFromPersistentContainer:v7 removeFiles:1 removeRecord:0 matchingPredicate:v13 errorOut:a5];

  BOOL v15 = 0;
  if (v14)
  {
    id v16 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"requestState >= %llu AND requestState < %llu", 4096, 0x2000);
    unint64_t v32 = v10;
    id v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"hasBeenCountedByTelemetry == YES AND requestDate < %@", v10];
    [MEMORY[0x263F08A98] predicateWithFormat:@"hasBeenCountedByTelemetry == YES AND requestDate < %@", v11];
    v19 = uint64_t v18 = v12;
    id v20 = (void *)MEMORY[0x263F08730];
    v35[0] = v17;
    v35[1] = v19;
    unint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    uint64_t v22 = [v20 orPredicateWithSubpredicates:v21];

    id v23 = (void *)MEMORY[0x263F08730];
    v34[0] = v16;
    v34[1] = v22;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    long long v25 = [v23 andPredicateWithSubpredicates:v24];

    id v12 = v18;
    BOOL v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"requestState >= %llu AND requestDate < %@", 0x2000, v18];
    BOOL v27 = (void *)MEMORY[0x263F08730];
    v33[0] = v25;
    v33[1] = v26;
    id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    uint64_t v29 = [v27 orPredicateWithSubpredicates:v28];

    LODWORD(v28) = +[DRSRequest cleanRequestRecordsFromPersistentContainer:v7 removeFiles:1 removeRecord:1 matchingPredicate:v29 errorOut:a5];
    if (v28)
    {
      uint64_t v30 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"requestState >= %llu AND requestState < %llu", 4096, 0x2000);
      BOOL v15 = +[DRSRequest cleanRequestRecordsFromPersistentContainer:v7 removeFiles:1 removeRecord:0 matchingPredicate:v30 errorOut:a5];
    }
    else
    {
      BOOL v15 = 0;
    }
    id v10 = v32;
  }

  return v15;
}

+ (id)migrateRequestDataStoreAtPath:(id)a3 errorOut:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = DRSRequestPersistentContainerForVersion(2, v6, 0, 1, a4);
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_11;
  }
  id v9 = (void *)[v7 newBackgroundContext];
  id v10 = (void *)MEMORY[0x263EFF260];
  id v11 = [a1 entityName];
  id v12 = [v10 fetchRequestWithEntityName:v11];

  *(void *)int v31 = 0;
  *(void *)&v31[8] = v31;
  *(void *)&v31[16] = 0x3032000000;
  unint64_t v32 = __Block_byref_object_copy_;
  id v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __53__DRSRequest_migrateRequestDataStoreAtPath_errorOut___block_invoke;
  v23[3] = &unk_263FC97C0;
  id v13 = v9;
  id v24 = v13;
  id v14 = v12;
  id v25 = v14;
  BOOL v26 = v31;
  [v13 performBlockAndWait:v23];
  BOOL v15 = *(void **)(*(void *)&v31[8] + 40);
  if (v15)
  {
    if (a4) {
      *a4 = v15;
    }
    id v16 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v16))
    {
      uint64_t v17 = [*(id *)(*(void *)&v31[8] + 40) localizedDescription];
      uint64_t v18 = (void *)v17;
      char v19 = @"Unknown error";
      if (v17) {
        char v19 = (__CFString *)v17;
      }
      *(_DWORD *)buf = 138543618;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = v19;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MigrationFailed", "Migration of '%{public}@' failed. Encountered error: %@", buf, 0x16u);
    }
  }

  _Block_object_dispose(v31, 8);
  if (!v15)
  {
    id v20 = DRSRequestPersistentContainerForVersion(3, v6, 0, 1, a4);
    unint64_t v21 = DPLogHandle_CoreData();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)int v31 = 138543618;
      *(void *)&v31[4] = v6;
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 3;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MigrationSucceeded", "Migration of '%{public}@' to version %hu succeeded", v31, 0x12u);
    }
  }
  else
  {
LABEL_11:
    id v20 = 0;
  }

  return v20;
}

void __53__DRSRequest_migrateRequestDataStoreAtPath_errorOut___block_invoke(void *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  unsigned int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v28 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v28];
  id v5 = v28;
  id v6 = v28;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v5);
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v13 = +[DRSRequest _requestWithRequestMO_ON_MOC_QUEUE:v12];
          if (!v13)
          {
            uint64_t v18 = (void *)MEMORY[0x263F087E8];
            uint64_t v29 = *MEMORY[0x263F08320];
            uint64_t v30 = @"Failed to create request for requestMO";
            char v19 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
            uint64_t v20 = [v18 errorWithDomain:@"DiagnosticPipelinePersistenceError" code:0 userInfo:v19];
            uint64_t v21 = *(void *)(a1[6] + 8);
            uint64_t v22 = *(void **)(v21 + 40);
            *(void *)(v21 + 40) = v20;

            goto LABEL_12;
          }
          id v14 = v13;
          [v13 _configureRequestMO:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    BOOL v15 = (void *)a1[4];
    id v23 = v6;
    [v15 save:&v23];
    id v16 = v23;

    uint64_t v17 = *(void *)(a1[6] + 8);
    id v6 = v16;
    id v7 = *(id *)(v17 + 40);
    *(void *)(v17 + 40) = v6;
LABEL_12:
  }
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (NSString)build
{
  return self->_build;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)issueCategory
{
  return self->_issueCategory;
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (NSData)contextDictionaryData
{
  return self->_contextDictionaryData;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (unint64_t)requestMCT
{
  return self->_requestMCT;
}

- (NSString)logType
{
  return self->_logType;
}

- (void)setLogType:(id)a3
{
}

- (NSArray)logs
{
  return self->_logs;
}

- (void)setLogs:(id)a3
{
}

- (unint64_t)requestState
{
  return self->_requestState;
}

- (void)setRequestState:(unint64_t)a3
{
  self->_requestState = a3;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (unsigned)uploadAttemptCount
{
  return self->_uploadAttemptCount;
}

- (void)setUploadAttemptCount:(unsigned __int16)a3
{
  self->_uploadAttemptCount = a3;
}

- (BOOL)hasBeenCountedByTelemetry
{
  return self->_hasBeenCountedByTelemetry;
}

- (void)setHasBeenCountedByTelemetry:(BOOL)a3
{
  self->_hasBeenCountedByTelemetry = a3;
}

- (unsigned)decisionServerDecision
{
  return self->_decisionServerDecision;
}

- (void)setDecisionServerDecision:(unsigned __int8)a3
{
  self->_decisionServerDecision = a3;
}

- (NSString)ckRecordID
{
  return self->_ckRecordID;
}

- (BOOL)isExpedited
{
  return self->_isExpedited;
}

- (unint64_t)uploadID
{
  return self->_uploadID;
}

- (NSArray)submittedLogInfos
{
  return self->_submittedLogInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submittedLogInfos, 0);
  objc_storeStrong((id *)&self->_ckRecordID, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_logs, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_contextDictionaryData, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueCategory, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

- (id)fileURLs
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(DRSRequest *)self filePaths];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[objc_alloc(NSURL) initFileURLWithPath:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)fileNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(DRSRequest *)self filePaths];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) lastPathComponent];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)filePaths
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(DRSRequest *)self logs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) path];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)targetContainerName
{
  return kDRSCloudKitContainerName;
}

- (id)fileAssets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(DRSRequest *)self fileURLs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithFileURL:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)recordRepresentation
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = [(DRSRequest *)self logs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"DPLog"];
    uint64_t v6 = +[DRSSystemProfile sharedInstance];
    uint64_t v7 = [v6 buildVariant];
    [v5 setObject:v7 forKeyedSubscript:@"buildVariant"];

    uint64_t v8 = [v6 deviceCategory];
    [v5 setObject:v8 forKeyedSubscript:@"deviceCategory"];

    uint64_t v9 = [v6 deviceModel];
    [v5 setObject:v9 forKeyedSubscript:@"deviceModel"];

    uint64_t v10 = [v6 platformString];
    [v5 setObject:v10 forKeyedSubscript:@"platform"];

    long long v11 = [(DRSRequest *)self build];
    [v5 setObject:v11 forKeyedSubscript:@"build"];

    long long v12 = [(DRSRequest *)self teamID];
    [v5 setObject:v12 forKeyedSubscript:@"teamID"];

    long long v13 = [(DRSRequest *)self issueCategory];
    [v5 setObject:v13 forKeyedSubscript:@"issueCategory"];

    long long v14 = [(DRSRequest *)self issueDescription];
    [v5 setObject:v14 forKeyedSubscript:@"issueDescription"];

    BOOL v15 = [(DRSRequest *)self logType];
    [v5 setObject:v15 forKeyedSubscript:@"logType"];

    uint64_t v16 = [(DRSRequest *)self requestDate];
    [v5 setObject:v16 forKeyedSubscript:@"requestDate"];

    uint64_t v17 = [(DRSRequest *)self contextDictionaryData];

    if (v17)
    {
      uint64_t v18 = [(DRSRequest *)self contextDictionaryData];
      [v5 setObject:v18 forKeyedSubscript:@"contextDictionaryData"];
    }
    char v19 = [(DRSRequest *)self fileAssets];
    [v5 setObject:v19 forKeyedSubscript:@"fileAssets"];

    uint64_t v20 = [(DRSRequest *)self fileNames];
    [v5 setObject:v20 forKeyedSubscript:@"fileNames"];

    uint64_t v21 = [(DRSRequest *)self requestID];
    uint64_t v22 = [v21 UUIDString];
    [v5 setObject:v22 forKeyedSubscript:@"requestID"];

    id v23 = DPLogHandle_CKRecord();
    if (os_signpost_enabled(v23))
    {
      long long v24 = [(DRSRequest *)self requestID];
      long long v25 = [(DRSRequest *)self requestType];
      int v27 = 138543618;
      id v28 = v24;
      __int16 v29 = 2114;
      uint64_t v30 = v25;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CKRecordCreation", "%{public, name=requestID}@ %{public, name=requestType}@", (uint8_t *)&v27, 0x16u);
    }
  }
  else
  {
    uint64_t v6 = DPLogHandle_CKRecordError();
    if (os_signpost_enabled(v6))
    {
      LOWORD(v27) = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MissingFilePaths", "No file paths found", (uint8_t *)&v27, 2u);
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)protoRequestDescription
{
  id v3 = objc_alloc_init(DRSProtoRequestDescription);
  uint64_t v4 = [(DRSRequest *)self teamID];
  [(DRSProtoRequestDescription *)v3 setTeamId:v4];

  uint64_t v5 = [(DRSRequest *)self issueCategory];
  [(DRSProtoRequestDescription *)v3 setIssueCategory:v5];

  uint64_t v6 = [(DRSRequest *)self contextDictionaryData];
  [(DRSProtoRequestDescription *)v3 setContextDictionaryData:v6];

  uint64_t v7 = [(DRSRequest *)self requestDate];
  [v7 timeIntervalSince1970];
  [(DRSProtoRequestDescription *)v3 setRequestTime:(unint64_t)v8];

  uint64_t v9 = [(DRSRequest *)self build];
  [(DRSProtoRequestDescription *)v3 setBuild:v9];

  return v3;
}

- (id)protoFileDescriptions
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [(DRSRequest *)self logs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138543618;
    long long v16 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "fileDescription", v16);
        if (v11)
        {
          [v3 addObject:v11];
        }
        else
        {
          long long v12 = DPLogHandle_CKRecord();
          if (os_signpost_enabled(v12))
          {
            long long v13 = [(DRSRequest *)self requestID];
            long long v14 = [v10 path];
            *(_DWORD *)buf = v16;
            uint64_t v22 = v13;
            __int16 v23 = 2114;
            long long v24 = v14;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProtoFileDescriptionFailure", "%{public, name=requestID}@ Failed to create description for path '%{public}@'", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)uploadRequest
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(DRSRequest *)self requestState] != 2)
  {
    uint64_t v9 = DPLogHandle_CKInvernessError();
    if (!os_signpost_enabled(v9)) {
      goto LABEL_12;
    }
    uint64_t v10 = [(DRSRequest *)self debugDescription];
    int v13 = 138543362;
    long long v14 = v10;
    long long v11 = "Tried to create an upload request for a request that was not in the middle of the upload flow (%{public}@)";
LABEL_11:
    _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UploadRequestCreationError", v11, (uint8_t *)&v13, 0xCu);

    goto LABEL_12;
  }
  id v3 = [(DRSRequest *)self logs];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v9 = DPLogHandle_CKInvernessError();
    if (!os_signpost_enabled(v9)) {
      goto LABEL_12;
    }
    uint64_t v10 = [(DRSRequest *)self debugDescription];
    int v13 = 138543362;
    long long v14 = v10;
    long long v11 = "Tried to create an upload request for a request with no file: %{public}@";
    goto LABEL_11;
  }
  if ([(DRSRequest *)self totalLogSizeBytes])
  {
    uint64_t v5 = [(DRSRequest *)self protoRequestDescription];
    long long v6 = objc_alloc_init(DRSProtoDiagnosticUploadRequest);
    [(DRSProtoDiagnosticUploadRequest *)v6 setRequestDescription:v5];
    uint64_t v7 = [(DRSRequest *)self issueDescription];
    [(DRSProtoDiagnosticUploadRequest *)v6 setIssueDescription:v7];

    uint64_t v8 = [(DRSRequest *)self protoFileDescriptions];
    [(DRSProtoDiagnosticUploadRequest *)v6 setLogs:v8];

    goto LABEL_13;
  }
  uint64_t v9 = DPLogHandle_CKInvernessError();
  if (os_signpost_enabled(v9))
  {
    uint64_t v10 = [(DRSRequest *)self debugDescription];
    int v13 = 138543362;
    long long v14 = v10;
    long long v11 = "Tried to create an upload request for a request with no net file size: %{public}@";
    goto LABEL_11;
  }
LABEL_12:

  long long v6 = 0;
LABEL_13:

  return v6;
}

- (DRSDecisionServerBatchRequest)pbBatchInstance
{
  unsigned int v2 = objc_alloc_init(DRSProtoDiagnosticUploadRequestBatch);

  return (DRSDecisionServerBatchRequest *)v2;
}

- (Class)pbBatchResponseClass
{
  return (Class)objc_opt_class();
}

- (NSString)functionName
{
  return (NSString *)@"shouldAllowDiagnosticUploadBatch";
}

- (void)updateToState:(__CFString *)a1 errorDescription:(NSObject *)a2 errorOut:.cold.1(__CFString *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  unsigned int v2 = @"Unknown";
  if (a1) {
    unsigned int v2 = a1;
  }
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_209E70000, a2, OS_LOG_TYPE_FAULT, "On-receipt error encountered: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end