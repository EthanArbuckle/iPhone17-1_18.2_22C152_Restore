@interface DiagnosticCase
+ (id)_arrayObjectRepresentationOfJSONString:(id)a3;
+ (id)_caseDampeningTypeString:(signed __int16)a3;
+ (id)_closureTypeString:(signed __int16)a3;
+ (id)_stringRepresentationOfJSONObject:(id)a3 prettyPrint:(BOOL)a4;
+ (id)attachmentsFromStringRepresentation:(id)a3;
+ (id)descriptionForClosureType:(signed __int16)a3;
+ (id)descriptionForDampeningType:(signed __int16)a3;
+ (id)generateCaseSummaryDictionaryFromCaseStorage:(id)a3;
+ (id)generateCaseSummaryFromCaseStorageDictionary:(id)a3;
+ (id)signatureForCaseStorage:(id)a3;
+ (id)signatureForCaseStorageDictionary:(id)a3;
+ (id)stringRepresentationOfAttachments:(id)a3;
- (BOOL)_parseCaseStorageIntoSignature:(id)a3;
- (BOOL)_parseSignatureIntoCaseStorage:(id)a3;
- (BOOL)isRemoteTrigger;
- (BOOL)isSnapshot;
- (BOOL)matchSignature:(id)a3;
- (BOOL)readyToEndSession;
- (BOOL)sendReports;
- (BOOL)wantsRemote;
- (BOOL)writeIPSFile;
- (DiagnosticCase)initWithCaseId:(id)a3 manager:(id)a4;
- (DiagnosticCase)initWithCaseStorage:(id)a3 manager:(id)a4;
- (DiagnosticCase)initWithCoder:(id)a3;
- (DiagnosticCase)initWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 manager:(id)a8;
- (DiagnosticCaseManager)manager;
- (DiagnosticCaseStorage)caseStorage;
- (NSDictionary)actions;
- (NSDictionary)requiredAttachments;
- (NSMutableArray)attachments;
- (NSMutableArray)caseOutlets;
- (NSMutableArray)caseReports;
- (NSMutableArray)events;
- (NSMutableArray)payloads;
- (NSMutableDictionary)attachmentsWithSize;
- (NSMutableDictionary)signature;
- (NSString)basebandChipset;
- (NSString)basebandFirmwareVersion;
- (NSString)buildVariant;
- (NSString)buildVersion;
- (NSString)caseDetectedProcess;
- (NSString)caseDomain;
- (NSString)caseEffectiveProcess;
- (NSString)caseGroupId;
- (NSString)caseSubType;
- (NSString)caseSubTypeContext;
- (NSString)caseSummaryFilepath;
- (NSString)caseType;
- (NSString)homeCarrier;
- (NSString)regulatoryDomainCountry;
- (NSUUID)caseId;
- (double)caseClosedTime;
- (double)caseOpenedTime;
- (double)preferredDuration;
- (id)_caseSummaryFileName;
- (id)_generateCaseSummaryDictionary;
- (id)_updatedPayloadPathForOriginalPath:(id)a3 sandboxExtensionToken:(id)a4;
- (id)addSizeInfoForAttachment:(id)a3;
- (id)caseClosureTypeString;
- (id)caseDampeningTypeString;
- (id)caseProcess;
- (id)caseStateString:(signed __int16)a3;
- (id)deParametersFromPayloads;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventsFromStringRepresentation;
- (id)payloadsFromStringRepresentation;
- (id)stringRepresentationOfAttachmentsWithSize;
- (id)stringRepresentationOfEvents;
- (id)stringRepresentationOfPayloads;
- (id)stringRepresentationOfSignature;
- (signed)caseState;
- (signed)caseStateFromString:(id)a3;
- (signed)closureType;
- (signed)dampeningType;
- (signed)dpSubmissionState;
- (unint64_t)attachmentsFileSize;
- (unint64_t)caseFlags;
- (void)_addToAttachments:(id)a3;
- (void)_updatePayloadDictionaryArray:(BOOL)a3;
- (void)addEvent:(id)a3;
- (void)addEvent:(id)a3 forced:(BOOL)a4;
- (void)addEvents:(id)a3;
- (void)addEvents:(id)a3 forced:(BOOL)a4;
- (void)addGroupIdentifierToSignature;
- (void)addPayload:(id)a3;
- (void)addRequiredAction:(id)a3 option:(id)a4 attachmentType:(id)a5 pattern:(id)a6;
- (void)addRequiredAttachmentType:(id)a3 pattern:(id)a4;
- (void)allowIPSFileOutput:(BOOL)a3;
- (void)collectLogs;
- (void)dealloc;
- (void)deserializeDiagnosticCaseStorageAttachments;
- (void)deserializeDiagnosticCaseStorageEvents;
- (void)deserializeDiagnosticCaseStoragePayloads;
- (void)finishCase;
- (void)finishedCollectingLogs;
- (void)fixupCaseSummaryFile:(id)a3;
- (void)markAttachmentsAsPurgeable:(BOOL)a3 urgency:(unint64_t)a4;
- (void)noteCaseClosedTime;
- (void)noteCaseClosedTime:(double)a3;
- (void)noteCaseOpenedTime;
- (void)noteCaseOpenedTime:(double)a3;
- (void)prepareAttachmentsForReporting;
- (void)prepareCase;
- (void)prepareForSaving;
- (void)recordDiagnosticCaseSummary;
- (void)removeRequiredAttachmentType:(id)a3 pattern:(id)a4;
- (void)reportGeneratorEnded:(id)a3 reportInfo:(id)a4 error:(id)a5 isFinalReportGenerator:(BOOL)a6;
- (void)serializeAttachmentsToDiagnosticCaseStorage;
- (void)serializeEventsToDiagnosticCaseStorage;
- (void)serializePayloadsToDiagnosticCaseStorage;
- (void)setAttachmentsWithSize:(id)a3;
- (void)setCaseFlags:(unint64_t)a3;
- (void)setCaseState:(signed __int16)a3;
- (void)setCaseSummaryFilepath:(id)a3;
- (void)setClosureType:(signed __int16)a3;
- (void)setDPSubmissionState:(signed __int16)a3;
- (void)setDampeningType:(signed __int16)a3;
- (void)setManager:(id)a3;
- (void)setPreferredDuration:(double)a3;
- (void)setReadyToEndSession:(BOOL)a3;
- (void)startCollectingAllReports;
- (void)startCollectingDiagnosticExtensions:(id)a3;
- (void)summarizeCaseReport;
- (void)validateAttachments;
@end

@implementation DiagnosticCase

- (DiagnosticCase)initWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7 manager:(id)a8
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v54.receiver = self;
  v54.super_class = (Class)DiagnosticCase;
  v20 = [(DiagnosticCase *)&v54 init];
  if (v20)
  {
    if (v15)
    {
      uint64_t v21 = [MEMORY[0x263F08C38] UUID];
      caseId = v20->_caseId;
      v20->_caseId = (NSUUID *)v21;

      uint64_t v23 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v15];
      signature = v20->_signature;
      v20->_signature = (NSMutableDictionary *)v23;

      v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      caseReports = v20->_caseReports;
      v20->_caseReports = v25;

      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      caseOutlets = v20->_caseOutlets;
      v20->_caseOutlets = v27;

      v20->_caseFlags = a4;
      v20->_allowIPSFileOutput = 1;
      [(DiagnosticCase *)v20 setManager:v19];
      uint64_t v29 = [v19 caseStorageForCaseID:v20->_caseId];
      caseStorage = v20->_caseStorage;
      v20->_caseStorage = (DiagnosticCaseStorage *)v29;

      v31 = v20->_caseStorage;
      if (v31)
      {
        [(DiagnosticCaseStorage *)v31 setCaseObjectVersion:@"1"];
        [(DiagnosticCase *)v20 _parseSignatureIntoCaseStorage:v15];
        v32 = [MEMORY[0x263EFF910] date];
        [(DiagnosticCaseStorage *)v20->_caseStorage setTimeStamp:v32];

        [(DiagnosticCaseStorage *)v20->_caseStorage setCaseClosedTime:0];
        [(DiagnosticCaseStorage *)v20->_caseStorage setCaseState:0];
        v33 = +[SystemProperties sharedInstance];
        v34 = [v33 buildVariant];
        [(DiagnosticCaseStorage *)v20->_caseStorage setBuildVariant:v34];

        v35 = [v33 buildVersion];
        [(DiagnosticCaseStorage *)v20->_caseStorage setBuildVersion:v35];

        v36 = [v33 basebandChipset];
        [(DiagnosticCaseStorage *)v20->_caseStorage setBasebandChipset:v36];

        v37 = [v33 basebandFirmwareVersion];
        [(DiagnosticCaseStorage *)v20->_caseStorage setBasebandFirmwareVersion:v37];

        v38 = +[WirelessTechnologyProfile sharedInstance];
        v39 = [v38 regulatoryDomainCountry];
        [(DiagnosticCaseStorage *)v20->_caseStorage setRegulatoryDomainCountry:v39];

        v40 = [v38 homeCarrier];
        [(DiagnosticCaseStorage *)v20->_caseStorage setHomeCarrier:v40];

        if ((a4 & 4) != 0) {
          [(DiagnosticCase *)v20 addGroupIdentifierToSignature];
        }
        [(DiagnosticCaseStorage *)v20->_caseStorage setRemoteTrigger:(a4 >> 1) & 1];
        *(_WORD *)&v20->eventsDirty = 0;
        v20->attachmentsDirty = 0;
        if ([v16 count])
        {
          v41 = diagcaseLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            v42 = [(NSUUID *)v20->_caseId UUIDString];
            *(_DWORD *)buf = 138543618;
            v56 = v42;
            __int16 v57 = 2112;
            id v58 = v16;
            _os_log_impl(&dword_209DBA000, v41, OS_LOG_TYPE_DEBUG, "Initializing session: %{public}@ with events:%@", buf, 0x16u);
          }
          uint64_t v43 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v16];
          events = v20->_events;
          v20->_events = (NSMutableArray *)v43;

          v20->eventsDirty = 1;
        }
        if ([v17 count])
        {
          v45 = diagcaseLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            v46 = [(NSUUID *)v20->_caseId UUIDString];
            *(_DWORD *)buf = 138543618;
            v56 = v46;
            __int16 v57 = 2112;
            id v58 = v17;
            _os_log_impl(&dword_209DBA000, v45, OS_LOG_TYPE_DEBUG, "Initializing session: %{public}@ with payload:%@", buf, 0x16u);
          }
          uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v17, 0);
          payloads = v20->_payloads;
          v20->_payloads = (NSMutableArray *)v47;

          v20->payloadsDirty = 1;
        }
        if ([v18 count])
        {
          v49 = diagcaseLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            v50 = [(NSUUID *)v20->_caseId UUIDString];
            *(_DWORD *)buf = 138543618;
            v56 = v50;
            __int16 v57 = 2112;
            id v58 = v17;
            _os_log_impl(&dword_209DBA000, v49, OS_LOG_TYPE_DEBUG, "Initializing session: %{public}@ with actions:%@", buf, 0x16u);
          }
          uint64_t v51 = [objc_alloc(NSDictionary) initWithDictionary:v18];
          actions = v20->_actions;
          v20->_actions = (NSDictionary *)v51;
        }
        goto LABEL_22;
      }
      v38 = diagcaseLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v38, OS_LOG_TYPE_ERROR, "failed to retrieve caseStorage", buf, 2u);
      }
    }
    else
    {
      v38 = [MEMORY[0x263F08690] currentHandler];
      [v38 handleFailureInMethod:a2 object:v20 file:@"DiagnosticCase.m" lineNumber:167 description:@"DiagnosticCase must be initialized with a signature."];
    }
    v33 = v20;
    v20 = 0;
LABEL_22:
  }
  return v20;
}

- (DiagnosticCase)initWithCaseStorage:(id)a3 manager:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
    v30 = v29;
    v31 = @"initWithCaseStorage requires a caseStorage.";
    SEL v32 = a2;
    v33 = self;
    uint64_t v34 = 178;
LABEL_12:
    [v29 handleFailureInMethod:v32 object:v33 file:@"DiagnosticCase.m" lineNumber:v34 description:v31];

    v12 = 0;
    goto LABEL_13;
  }
  if (!v9)
  {
    uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
    v30 = v29;
    v31 = @"initWithCaseStorage requires a manager.";
    SEL v32 = a2;
    v33 = self;
    uint64_t v34 = 181;
    goto LABEL_12;
  }
  v36.receiver = self;
  v36.super_class = (Class)DiagnosticCase;
  v11 = [(DiagnosticCase *)&v36 init];
  v12 = v11;
  if (v11)
  {
    [(DiagnosticCase *)v11 setManager:v10];
    objc_storeStrong((id *)&v12->_caseStorage, a3);
    id v13 = objc_alloc(MEMORY[0x263F08C38]);
    v14 = [v8 caseID];
    uint64_t v15 = [v13 initWithUUIDString:v14];
    caseId = v12->_caseId;
    v12->_caseId = (NSUUID *)v15;

    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    signature = v12->_signature;
    v12->_signature = v17;

    id v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    caseReports = v12->_caseReports;
    v12->_caseReports = v19;

    uint64_t v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    caseOutlets = v12->_caseOutlets;
    v12->_caseOutlets = v21;

    [(DiagnosticCase *)v12 _parseCaseStorageIntoSignature:v12->_signature];
    *(_WORD *)&v12->eventsDirty = 0;
    v12->attachmentsDirty = 0;
    uint64_t v23 = [(DiagnosticCase *)v12 caseStorage];
    v24 = [v23 caseEvents];

    if (v24) {
      [(DiagnosticCase *)v12 deserializeDiagnosticCaseStorageEvents];
    }
    v25 = [(DiagnosticCase *)v12 caseStorage];
    v26 = [v25 casePayloads];

    if (v26) {
      [(DiagnosticCase *)v12 deserializeDiagnosticCaseStoragePayloads];
    }
    v27 = [(DiagnosticCase *)v12 caseStorage];
    v28 = [v27 caseAttachments];

    if (v28) {
      [(DiagnosticCase *)v12 deserializeDiagnosticCaseStorageAttachments];
    }
  }
LABEL_13:

  return v12;
}

- (DiagnosticCase)initWithCaseId:(id)a3 manager:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    v28 = v27;
    uint64_t v29 = @"initWithCaseId requires a case identifier.";
    SEL v30 = a2;
    v31 = self;
    uint64_t v32 = 219;
LABEL_13:
    [v27 handleFailureInMethod:v30 object:v31 file:@"DiagnosticCase.m" lineNumber:v32 description:v29];
LABEL_14:

    self = 0;
    goto LABEL_15;
  }
  if (!v9)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    v28 = v27;
    uint64_t v29 = @"initWithCaseId requires a manager.";
    SEL v30 = a2;
    v31 = self;
    uint64_t v32 = 222;
    goto LABEL_13;
  }
  v35.receiver = self;
  v35.super_class = (Class)DiagnosticCase;
  v11 = [(DiagnosticCase *)&v35 init];
  self = v11;
  if (!v11) {
    goto LABEL_15;
  }
  [(DiagnosticCase *)v11 setManager:v10];
  objc_storeStrong((id *)&self->_caseId, a3);
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  signature = self->_signature;
  self->_signature = v12;

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  caseReports = self->_caseReports;
  self->_caseReports = v14;

  id v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  caseOutlets = self->_caseOutlets;
  self->_caseOutlets = v16;

  id v18 = [(DiagnosticCase *)self manager];
  id v19 = [v18 lookUpDiagnosticCaseStorageForUUID:self->_caseId];
  caseStorage = self->_caseStorage;
  self->_caseStorage = v19;

  if (!self->_caseStorage)
  {
    v28 = diagcaseLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [(NSUUID *)self->_caseId UUIDString];
      *(_DWORD *)buf = 138543362;
      v37 = v34;
      _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_ERROR, "Failed to retrieve caseStorage for case %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  [(DiagnosticCase *)self _parseCaseStorageIntoSignature:self->_signature];
  *(_WORD *)&self->eventsDirty = 0;
  self->attachmentsDirty = 0;
  uint64_t v21 = [(DiagnosticCase *)self caseStorage];
  v22 = [v21 caseEvents];

  if (v22) {
    [(DiagnosticCase *)self deserializeDiagnosticCaseStorageEvents];
  }
  uint64_t v23 = [(DiagnosticCase *)self caseStorage];
  v24 = [v23 casePayloads];

  if (v24) {
    [(DiagnosticCase *)self deserializeDiagnosticCaseStoragePayloads];
  }
  v25 = [(DiagnosticCase *)self caseStorage];
  v26 = [v25 caseAttachments];

  if (v26) {
    [(DiagnosticCase *)self deserializeDiagnosticCaseStorageAttachments];
  }
LABEL_15:

  return self;
}

- (DiagnosticCase)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DiagnosticCase;
  return [(DiagnosticCase *)&v4 init];
}

- (void)dealloc
{
  [(DiagnosticCase *)self setManager:0];
  caseStorage = self->_caseStorage;
  self->_caseStorage = 0;

  v4.receiver = self;
  v4.super_class = (Class)DiagnosticCase;
  [(DiagnosticCase *)&v4 dealloc];
}

- (id)description
{
  id v14 = [NSString alloc];
  id v16 = [(DiagnosticCase *)self caseId];
  id v17 = [v16 UUIDString];
  v3 = [(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"domain"];
  objc_super v4 = [(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"type"];
  v5 = [(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"subtype"];
  v6 = [(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"additional"];
  v7 = [(DiagnosticCase *)self caseStorage];
  id v8 = -[DiagnosticCase caseStateString:](self, "caseStateString:", [v7 caseState]);
  id v9 = [(DiagnosticCase *)self caseStorage];
  v10 = [v9 timeStamp];
  v11 = [(DiagnosticCase *)self caseStorage];
  v12 = +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", [v11 caseClosureType]);
  id v15 = (id)[v14 initWithFormat:@"Diagnostic case - ID:%@ Domain:%@ Type:%@, SubType:%@, STContext:%@, state:%@ opened time:%@ (closure:%@)", v17, v3, v4, v5, v6, v8, v10, v12];

  return v15;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  objc_super v4 = [(DiagnosticCase *)self _generateCaseSummaryDictionary];
  v5 = (void *)[v3 initWithDictionary:v4 copyItems:1];

  return v5;
}

- (NSUUID)caseId
{
  return self->_caseId;
}

- (signed)caseState
{
  v2 = [(DiagnosticCase *)self caseStorage];
  int v3 = [v2 caseState];

  if ((v3 - 1) >= 6) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)setCaseState:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(DiagnosticCase *)self caseStorage];
  int v6 = [v5 caseState];

  if (v6 != v3)
  {
    v7 = [(DiagnosticCase *)self caseStorage];
    int v8 = [v7 caseState];

    if (v8 <= (int)v3)
    {
      id v13 = [(DiagnosticCase *)self caseStorage];
      [v13 setCaseState:v3];

      id v14 = [(DiagnosticCase *)self caseStorage];
      LODWORD(v13) = [v14 caseState];

      switch((int)v13)
      {
        case 1:
          [(DiagnosticCase *)self prepareCase];
          break;
        case 3:
          [(DiagnosticCase *)self finishCase];
          break;
        case 4:
          [(DiagnosticCase *)self collectLogs];
          break;
        case 5:
          [(DiagnosticCase *)self noteCaseClosedTime];
          [(DiagnosticCase *)self prepareAttachmentsForReporting];
          [(DiagnosticCase *)self validateAttachments];
          [(DiagnosticCase *)self summarizeCaseReport];
          [(DiagnosticCase *)self recordDiagnosticCaseSummary];
          [(DiagnosticCase *)self sendReports];
          break;
        case 6:
          [(DiagnosticCase *)self noteCaseClosedTime];
          id v15 = [(DiagnosticCase *)self manager];
          [v15 closeCase:self];

          break;
        default:
          return;
      }
    }
    else
    {
      id v9 = diagcaseLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [(DiagnosticCase *)self caseStorage];
        v11 = -[DiagnosticCase caseStateString:](self, "caseStateString:", [v10 caseState]);
        v12 = [(DiagnosticCase *)self caseStateString:v3];
        *(_DWORD *)buf = 138412546;
        id v17 = v11;
        __int16 v18 = 2112;
        id v19 = v12;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Diagnostic case state should not return to a previous state! (current: %@ new: %@)", buf, 0x16u);
      }
    }
  }
}

- (void)noteCaseClosedTime
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DiagnosticCase *)self caseStorage];
  objc_super v4 = [v3 caseClosedTime];

  if (v4)
  {
    v5 = diagcaseLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [(DiagnosticCase *)self caseStorage];
      v7 = [v6 caseClosedTime];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Already noted caseClosedTime at: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(DiagnosticCase *)self noteCaseClosedTime:0.0];
  }
}

- (void)noteCaseClosedTime:(double)a3
{
  if (a3 <= 0.0) {
    [MEMORY[0x263EFF910] date];
  }
  else {
    objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [(DiagnosticCase *)self caseStorage];
  [v4 setCaseClosedTime:v5];
}

- (void)noteCaseOpenedTime
{
}

- (void)noteCaseOpenedTime:(double)a3
{
  if (a3 <= 0.0) {
    [MEMORY[0x263EFF910] date];
  }
  else {
    objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:");
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [(DiagnosticCase *)self caseStorage];
  [v4 setTimeStamp:v5];
}

- (double)caseOpenedTime
{
  v2 = [(DiagnosticCase *)self caseStorage];
  uint64_t v3 = [v2 timeStamp];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  return v5;
}

- (double)caseClosedTime
{
  v2 = [(DiagnosticCase *)self caseStorage];
  uint64_t v3 = [v2 caseClosedTime];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  return v5;
}

- (signed)closureType
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = [(DiagnosticCase *)self caseStorage];
  unsigned int v3 = [v2 caseClosureType];

  if (v3 >= 6)
  {
    double v4 = diagcaseLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "Unknown closure type %d", (uint8_t *)v6, 8u);
    }

    LOWORD(v3) = 0;
  }
  return v3;
}

- (void)setClosureType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(DiagnosticCase *)self caseStorage];
  [v4 setCaseClosureType:v3];
}

- (signed)dampeningType
{
  id v4 = [(DiagnosticCase *)self caseStorage];
  int v5 = [v4 caseDampeningType];

  if ((v5 + 2) < 0xB) {
    return v5;
  }
  uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"DiagnosticCase.m" lineNumber:511 description:@"Unhandled DiagnosticCaseDampeningType!"];

  int v8 = [(DiagnosticCase *)self caseStorage];
  signed __int16 v9 = [v8 caseDampeningType];

  return v9;
}

- (void)setDampeningType:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(DiagnosticCase *)self caseStorage];
  [v4 setCaseDampeningType:v3];
}

- (id)caseDampeningTypeString
{
  v2 = [(DiagnosticCase *)self caseStorage];
  uint64_t v3 = +[DiagnosticCase _caseDampeningTypeString:](DiagnosticCase, "_caseDampeningTypeString:", [v2 caseDampeningType]);

  return v3;
}

+ (id)_caseDampeningTypeString:(signed __int16)a3
{
  uint64_t v3 = a3 + 2;
  if (v3 > 0xA) {
    return @"Unknown Case Dampening Type";
  }
  else {
    return off_263FC4F98[v3];
  }
}

- (signed)dpSubmissionState
{
  id v4 = [(DiagnosticCase *)self caseStorage];
  unsigned int v5 = [v4 dpSubmissionState];

  if (v5 < 5) {
    return v5;
  }
  uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"DiagnosticCase.m" lineNumber:586 description:@"Unhandled DiagnosticCaseDPSubmissionState!"];

  int v8 = [(DiagnosticCase *)self caseStorage];
  signed __int16 v9 = [v8 dpSubmissionState];

  return v9;
}

- (void)setDPSubmissionState:(signed __int16)a3
{
  uint64_t v3 = a3;
  id v4 = [(DiagnosticCase *)self caseStorage];
  [v4 setDpSubmissionState:v3];
}

- (BOOL)isSnapshot
{
  return self->_caseFlags & 1;
}

- (BOOL)wantsRemote
{
  return (LOBYTE(self->_caseFlags) >> 2) & 1;
}

- (BOOL)isRemoteTrigger
{
  if ((self->_caseFlags & 2) != 0) {
    return 1;
  }
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 remoteTrigger];

  return v3;
}

- (BOOL)writeIPSFile
{
  return [(DiagnosticCase *)self dampeningType] < 1 || self->_allowIPSFileOutput;
}

- (void)allowIPSFileOutput:(BOOL)a3
{
  self->_allowIPSFileOutput = a3;
}

- (NSString)caseDomain
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"domain"];
}

- (NSString)caseType
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"type"];
}

- (NSString)caseSubType
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"subtype"];
}

- (NSString)caseSubTypeContext
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"additional"];
}

- (id)caseProcess
{
  return (id)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"detected"];
}

- (NSString)caseDetectedProcess
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"detected"];
}

- (NSString)caseEffectiveProcess
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"effective"];
}

- (NSString)caseGroupId
{
  return (NSString *)[(NSMutableDictionary *)self->_signature objectForKeyedSubscript:@"groupID"];
}

- (NSString)buildVariant
{
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 buildVariant];

  return (NSString *)v3;
}

- (NSString)buildVersion
{
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 buildVersion];

  return (NSString *)v3;
}

- (NSString)basebandChipset
{
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 basebandChipset];

  return (NSString *)v3;
}

- (NSString)basebandFirmwareVersion
{
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 basebandFirmwareVersion];

  return (NSString *)v3;
}

- (NSString)regulatoryDomainCountry
{
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 regulatoryDomainCountry];

  return (NSString *)v3;
}

- (NSString)homeCarrier
{
  v2 = [(DiagnosticCase *)self caseStorage];
  char v3 = [v2 homeCarrier];

  return (NSString *)v3;
}

- (id)caseStateString:(signed __int16)a3
{
  if (a3 > 6) {
    return @"UnsupportedState";
  }
  else {
    return off_263FC4FF0[a3];
  }
}

- (signed)caseStateFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Uninitialized"])
  {
    signed __int16 v4 = 0;
  }
  else if ([v3 isEqualToString:@"Preparing"])
  {
    signed __int16 v4 = 1;
  }
  else if ([v3 isEqualToString:@"Logging"])
  {
    signed __int16 v4 = 2;
  }
  else if ([v3 isEqualToString:@"Finalizing"])
  {
    signed __int16 v4 = 3;
  }
  else if ([v3 isEqualToString:@"Collecting"])
  {
    signed __int16 v4 = 4;
  }
  else if ([v3 isEqualToString:@"Reporting"])
  {
    signed __int16 v4 = 5;
  }
  else if ([v3 isEqualToString:@"Closed"])
  {
    signed __int16 v4 = 6;
  }
  else
  {
    signed __int16 v4 = 0;
  }

  return v4;
}

- (id)caseClosureTypeString
{
  v2 = [(DiagnosticCase *)self caseStorage];
  id v3 = +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", [v2 caseClosureType]);

  return v3;
}

+ (id)_closureTypeString:(signed __int16)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown Closure State: %d", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_263FC5028[a3];
  }

  return v3;
}

+ (id)_stringRepresentationOfJSONObject:(id)a3 prettyPrint:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = (void *)MEMORY[0x21050CEB0]();
  uint64_t v7 = sanitizedJSONCollectionObject(v5, 1);
  if ([MEMORY[0x263F08900] isValidJSONObject:v7])
  {
    id v15 = 0;
    int v8 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:v4 error:&v15];
    id v9 = v15;
    uint64_t v10 = v9;
    if (v8)
    {
      v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      goto LABEL_8;
    }
    if (v9)
    {
      id v14 = diagcaseLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v10;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "JSON serialization failed with error: %@ (object = %@)", buf, 0x16u);
      }
    }
  }
  else
  {
    int v8 = diagcaseLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Not a valid JSON object: %@", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }
  v11 = 0;
LABEL_8:

  id v12 = v11;

  return v12;
}

+ (id)_arrayObjectRepresentationOfJSONString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v5 = (void *)MEMORY[0x21050CEB0]();
    int v6 = [v3 dataUsingEncoding:4];
    if (v6)
    {
      id v12 = 0;
      uint64_t v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v12];
      int v8 = v12;
      id v9 = v8;
      if (v7)
      {
        [v4 addObjectsFromArray:v7];
      }
      else if (v8)
      {
        uint64_t v10 = diagcaseLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v14 = v3;
          __int16 v15 = 2112;
          id v16 = v9;
          _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "JSON deserialization for string:%@ failed with error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v9 = diagcaseLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v3;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "Encoding jsonString (%@) into NSData failed", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)addRequiredAction:(id)a3 option:(id)a4 attachmentType:(id)a5 pattern:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!self->_requiredActions)
  {
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
    requiredActions = self->_requiredActions;
    self->_requiredActions = v14;
  }
  if (![v10 length] || !objc_msgSend(v12, "length"))
  {
    uint64_t v17 = diagcaseLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      goto LABEL_17;
    }
    int v22 = 138543874;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v18 = "Invalid parameters adding required action %{public}@ with attachment type %{public}@ and pattern %@";
    id v19 = v17;
    uint32_t v20 = 32;
LABEL_11:
    _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v22, v20);
    goto LABEL_12;
  }
  id v16 = diagcaseLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v22 = 138543618;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v12;
    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "This case is requesting action '%{public}@' of type '%{public}@'", (uint8_t *)&v22, 0x16u);
  }

  if (v11)
  {
    [(NSMutableDictionary *)self->_requiredActions setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableDictionary *)self->_requiredActions setObject:v21 forKeyedSubscript:v10];
  }
  if (([v12 isEqualToString:@"diagext"] & 1) == 0)
  {
    if ([v13 length])
    {
      [(DiagnosticCase *)self addRequiredAttachmentType:v12 pattern:v13];
      goto LABEL_17;
    }
    uint64_t v17 = diagcaseLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    LOWORD(v22) = 0;
    __int16 v18 = "Any required action that's not DiagnoticExtensions should provide a valid filename pattern to match against";
    id v19 = v17;
    uint32_t v20 = 2;
    goto LABEL_11;
  }
LABEL_17:
}

- (void)addRequiredAttachmentType:(id)a3 pattern:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v6 = a3;
  id v7 = a4;
  if (!self->_requiredAttachments)
  {
    int v8 = [MEMORY[0x263EFF9A0] dictionary];
    requiredAttachments = self->_requiredAttachments;
    self->_requiredAttachments = v8;
  }
  if (-[NSObject length](v6, "length") && [v7 length])
  {
    id v10 = diagcaseLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "This case requires attachment type '%{public}@' - matching with filename pattern '%@'", buf, 0x16u);
    }

    id v11 = [(NSMutableDictionary *)self->_requiredAttachments objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v11, v7, 0);
      [(NSMutableDictionary *)self->_requiredAttachments setObject:v12 forKeyedSubscript:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        [v11 addObject:v7];
      }
      else if (v11)
      {
        id v13 = diagcaseLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = (objc_class *)objc_opt_class();
          __int16 v15 = NSStringFromClass(v14);
          *(_DWORD *)buf = 138412802;
          uint64_t v17 = v11;
          __int16 v18 = 2112;
          id v19 = v15;
          __int16 v20 = 2114;
          uint64_t v21 = v6;
          _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) when adding required attachments for type '%{public}@'", buf, 0x20u);
        }
      }
      else
      {
        [(NSMutableDictionary *)self->_requiredAttachments setObject:v7 forKeyedSubscript:v6];
      }
    }
  }
  else
  {
    id v11 = diagcaseLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameters for adding required attachment type %{public}@ and pattern %@.", buf, 0x16u);
    }
  }
}

- (void)removeRequiredAttachmentType:(id)a3 pattern:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v6 = a3;
  id v7 = a4;
  if ([(NSMutableDictionary *)self->_requiredAttachments count]
    && [v6 length]
    && [v7 length])
  {
    int v8 = diagcaseLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v16 = 138543618;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "Removing case requirement for attachment type '%{public}@' - matching with filename pattern '%@'", (uint8_t *)&v16, 0x16u);
    }

    id v9 = [(NSMutableDictionary *)self->_requiredAttachments objectForKeyedSubscript:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      if ([v10 isEqualToString:v7])
      {
        [(NSMutableDictionary *)self->_requiredAttachments setObject:0 forKeyedSubscript:v6];
        goto LABEL_19;
      }
      id v12 = diagcaseLogHandle();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      int v16 = 138412802;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      id v13 = "Did not remove existing pattern %@ for type %{public}@ because the requested removal pattern did not match: %@";
      id v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_INFO;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        id v10 = v9;
        [v10 count];
        [v10 removeObject:v7];
        goto LABEL_19;
      }
      if (!v9)
      {
LABEL_20:

        goto LABEL_21;
      }
      id v10 = diagcaseLogHandle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v16 = 138412802;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      id v13 = "Found unexpected object %@ (class %@) when adding required attachments for type '%{public}@'";
      id v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_209DBA000, v14, v15, v13, (uint8_t *)&v16, 0x20u);
    goto LABEL_18;
  }
LABEL_21:
}

- (void)addEvent:(id)a3
{
}

- (void)addEvent:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_events)
  {
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    events = self->_events;
    self->_events = v7;
  }
  id v9 = [(DiagnosticCase *)self caseStorage];
  if ([v9 caseState] != 2)
  {

    if (!v4) {
      goto LABEL_10;
    }
LABEL_7:
    if ([v6 count])
    {
      [(NSMutableArray *)self->_events addObject:v6];
      self->eventsDirty = 1;
    }
    goto LABEL_16;
  }
  id v10 = [(DiagnosticCase *)self caseId];
  if (v10)
  {

    goto LABEL_7;
  }

  if (v4) {
    goto LABEL_7;
  }
LABEL_10:
  id v11 = [(DiagnosticCase *)self caseId];

  id v12 = diagcaseLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      id v14 = [(DiagnosticCase *)self caseStorage];
      os_log_type_t v15 = -[DiagnosticCase caseStateString:](self, "caseStateString:", [v14 caseState]);
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "caseState is %@, expecting DiagnosticCaseStateLogging", (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v13)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "No case ID", (uint8_t *)&v16, 2u);
  }

LABEL_16:
}

- (void)addEvents:(id)a3
{
}

- (void)addEvents:(id)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!self->_events)
  {
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    events = self->_events;
    self->_events = v7;
  }
  id v9 = [(DiagnosticCase *)self caseStorage];
  if ([v9 caseState] != 2)
  {

    if (!v4) {
      goto LABEL_10;
    }
LABEL_7:
    if ([v6 count])
    {
      [(NSMutableArray *)self->_events addObjectsFromArray:v6];
      self->eventsDirty = 1;
    }
    goto LABEL_16;
  }
  id v10 = [(DiagnosticCase *)self caseId];
  if (v10)
  {

    goto LABEL_7;
  }

  if (v4) {
    goto LABEL_7;
  }
LABEL_10:
  id v11 = [(DiagnosticCase *)self caseId];

  id v12 = diagcaseLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      id v14 = [(DiagnosticCase *)self caseStorage];
      os_log_type_t v15 = -[DiagnosticCase caseStateString:](self, "caseStateString:", [v14 caseState]);
      int v16 = 138412290;
      uint64_t v17 = v15;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "caseState is %@, expecting DiagnosticCaseStateLogging", (uint8_t *)&v16, 0xCu);
    }
  }
  else if (v13)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "No case ID", (uint8_t *)&v16, 2u);
  }

LABEL_16:
}

- (id)stringRepresentationOfEvents
{
  if ([(NSMutableArray *)self->_events count])
  {
    id v3 = +[DiagnosticCase _stringRepresentationOfJSONObject:self->_events prettyPrint:0];
  }
  else
  {
    BOOL v4 = diagcaseLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "No events to represent", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

- (id)eventsFromStringRepresentation
{
  v2 = [(DiagnosticCase *)self caseStorage];
  id v3 = [v2 caseEvents];

  if ([v3 length])
  {
    BOOL v4 = +[DiagnosticCase _arrayObjectRepresentationOfJSONString:v3];
  }
  else
  {
    id v5 = diagcaseLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "No events (empty events string)", v7, 2u);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (void)serializeEventsToDiagnosticCaseStorage
{
  if (self->eventsDirty)
  {
    id v3 = [(DiagnosticCase *)self stringRepresentationOfEvents];
    BOOL v4 = [(DiagnosticCase *)self caseStorage];
    [v4 setCaseEvents:v3];

    self->eventsDirty = 0;
  }
}

- (void)deserializeDiagnosticCaseStorageEvents
{
  id v3 = [(DiagnosticCase *)self eventsFromStringRepresentation];
  events = self->_events;
  self->_events = v3;

  self->eventsDirty = 0;
}

- (void)addPayload:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_payloads)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    payloads = self->_payloads;
    self->_payloads = v5;
  }
  id v7 = [(DiagnosticCase *)self caseStorage];
  if ([v7 caseState] == 2)
  {
    int v8 = [(DiagnosticCase *)self caseId];

    if (v8)
    {
      if ([v4 count])
      {
        [(NSMutableArray *)self->_payloads addObject:v4];
        self->payloadsDirty = 1;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v9 = diagcaseLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(DiagnosticCase *)self caseStorage];
    id v11 = -[DiagnosticCase caseStateString:](self, "caseStateString:", [v10 caseState]);
    id v12 = [(DiagnosticCase *)self caseId];
    int v13 = 138412546;
    id v14 = v11;
    __int16 v15 = 2114;
    int v16 = v12;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Not in logging state (%@) or no caseId (%{public}@)", (uint8_t *)&v13, 0x16u);
  }
LABEL_11:
}

- (id)stringRepresentationOfPayloads
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_payloads count];
  id v4 = diagcaseLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      payloads = self->_payloads;
      int v9 = 138412290;
      id v10 = payloads;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "_payloads is %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = +[DiagnosticCase _stringRepresentationOfJSONObject:self->_payloads prettyPrint:0];
  }
  else
  {
    if (v5)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "No payloads to represent", (uint8_t *)&v9, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)payloadsFromStringRepresentation
{
  v2 = [(DiagnosticCase *)self caseStorage];
  uint64_t v3 = [v2 casePayloads];

  if ([v3 length])
  {
    id v4 = +[DiagnosticCase _arrayObjectRepresentationOfJSONString:v3];
  }
  else
  {
    BOOL v5 = diagcaseLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "No events (empty payloads string)", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (void)serializePayloadsToDiagnosticCaseStorage
{
  if (self->payloadsDirty)
  {
    uint64_t v3 = [(DiagnosticCase *)self stringRepresentationOfPayloads];
    id v4 = [(DiagnosticCase *)self caseStorage];
    [v4 setCasePayloads:v3];

    self->payloadsDirty = 0;
  }
}

- (void)deserializeDiagnosticCaseStoragePayloads
{
  uint64_t v3 = [(DiagnosticCase *)self payloadsFromStringRepresentation];
  payloads = self->_payloads;
  self->_payloads = v3;

  self->payloadsDirty = 0;
}

+ (id)stringRepresentationOfAttachments:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  BOOL v5 = diagcaseLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "attachments is %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = +[DiagnosticCase _stringRepresentationOfJSONObject:v3 prettyPrint:0];
  }
  else
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "No attachment to represent", (uint8_t *)&v9, 2u);
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)attachmentsFromStringRepresentation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v4 length])
  {
    BOOL v6 = (void *)MEMORY[0x21050CEB0]();
    id v7 = [v4 dataUsingEncoding:4];
    if (v7)
    {
      id v14 = 0;
      int v8 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:0 error:&v14];
      int v9 = v14;
      id v10 = v9;
      if (v8)
      {
        [v5 addObjectsFromArray:v8];
      }
      else if (v9)
      {
        id v12 = diagcaseLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v16 = a1;
          __int16 v17 = 2112;
          uint64_t v18 = v10;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "attachment deserialization for case:%@ failed with error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v10 = diagcaseLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "attachmentsString encoding failed", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v11 = diagcaseLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "No attachments to represent", buf, 2u);
    }
  }

  return v5;
}

- (void)_addToAttachments:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (!self->_attachments)
  {
    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    attachments = self->_attachments;
    self->_attachments = v5;

    id v4 = v12;
  }
  uint64_t v7 = [v4 length];
  id v8 = v12;
  if (v7)
  {
    if ([v12 hasPrefix:@"file://"])
    {
      id v9 = v12;
    }
    else
    {
      id v10 = [NSURL fileURLWithPath:v12];
      id v9 = [v10 absoluteString];
    }
    [(NSMutableArray *)self->_attachments addObject:v9];
    id v11 = [(DiagnosticCase *)self addSizeInfoForAttachment:v9];

    id v8 = v12;
  }
  self->attachmentsDirty = 1;

  MEMORY[0x270F9A758](v7, v8);
}

- (void)serializeAttachmentsToDiagnosticCaseStorage
{
  if (self->attachmentsDirty)
  {
    id v3 = [(DiagnosticCase *)self attachments];
    id v4 = +[DiagnosticCase stringRepresentationOfAttachments:v3];
    id v5 = [(DiagnosticCase *)self caseStorage];
    [v5 setCaseAttachments:v4];

    [(DiagnosticCase *)self markAttachmentsAsPurgeable:1 urgency:1024];
    self->attachmentsDirty = 0;
  }
}

- (void)deserializeDiagnosticCaseStorageAttachments
{
  id v3 = [(DiagnosticCase *)self caseStorage];
  id v4 = [v3 caseAttachments];
  id v5 = +[DiagnosticCase attachmentsFromStringRepresentation:v4];

  attachments = self->_attachments;
  self->_attachments = v5;

  self->attachmentsDirty = 0;
}

- (id)stringRepresentationOfSignature
{
  return +[DiagnosticCase _stringRepresentationOfJSONObject:self->_signature prettyPrint:0];
}

- (BOOL)matchSignature:(id)a3
{
  return [(NSMutableDictionary *)self->_signature isEqualToDictionary:a3];
}

- (void)addGroupIdentifierToSignature
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [(NSUUID *)self->_caseId UUIDString];
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v5 = [v4 UUIDString];
  BOOL v6 = [v3 stringByAppendingFormat:@"_%@", v5];

  uint64_t v7 = diagcaseLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Adding group identifier to case: %{public}@", buf, 0xCu);
  }

  if ([v6 length])
  {
    [(NSMutableDictionary *)self->_signature setObject:v6 forKeyedSubscript:@"groupID"];
    id v8 = [(DiagnosticCase *)self caseStorage];
    [v8 setCaseGroupID:v6];
  }
}

- (void)prepareCase
{
}

- (void)finishCase
{
  if ([(DiagnosticCase *)self closureType] != 4)
  {
    [(DiagnosticCase *)self setCaseState:4];
  }
}

- (void)collectLogs
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = [(DiagnosticCase *)self caseStorage];
  int v4 = [v3 caseState];

  id v5 = [(DiagnosticCase *)self caseStorage];
  int v6 = [v5 caseDampeningType];

  if (*(_OWORD *)&self->completedDiagnosticActions != 0)
  {
    uint64_t v7 = diagcaseLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t completedDiagnosticActions = self->completedDiagnosticActions;
      unint64_t expectedDiagnosticActions = self->expectedDiagnosticActions;
      int v27 = 134218240;
      unint64_t v28 = expectedDiagnosticActions;
      __int16 v29 = 2048;
      unint64_t v30 = completedDiagnosticActions;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Did collectLogs get called more than once? Observing non-zero values for expected actions (%lu) and completed actions (%lu).", (uint8_t *)&v27, 0x16u);
    }
  }
  self->unint64_t completedDiagnosticActions = 0;
  self->unint64_t expectedDiagnosticActions = 0;
  id v10 = [(DiagnosticCase *)self manager];
  uint64_t v11 = [v10 configManager];
  int v12 = [v11 autoBugCaptureRegularPayloads];

  if (v12 && v4 == 4 && v6 <= 0)
  {
    int v13 = diagcaseLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(DiagnosticCase *)self caseId];
      int v27 = 138543362;
      unint64_t v28 = (unint64_t)v14;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "Starting collectLogs for case ID: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    [(DiagnosticCase *)self _updatePayloadDictionaryArray:1];
    __int16 v15 = [(NSMutableDictionary *)self->_requiredActions objectForKeyedSubscript:@"diagext"];

    if (v15)
    {
      id v16 = [(NSMutableDictionary *)self->_requiredActions objectForKeyedSubscript:@"diagext"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v18 = [(NSMutableDictionary *)self->_requiredActions objectForKeyedSubscript:@"diagext"];
        uint64_t v19 = diagcaseLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v27 = 138412290;
          unint64_t v28 = (unint64_t)v18;
          _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEBUG, "Found diagnostic extension options: %@", (uint8_t *)&v27, 0xCu);
        }
      }
      else
      {
        uint64_t v18 = 0;
      }
      [(DiagnosticCase *)self startCollectingDiagnosticExtensions:v18];
    }
    else
    {
      __int16 v26 = diagcaseLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, "DiagnosticExtensions action was requested to be disabled", (uint8_t *)&v27, 2u);
      }

      [(DiagnosticCase *)self startCollectingAllReports];
    }
  }
  else
  {
    [(DiagnosticCase *)self _updatePayloadDictionaryArray:0];
    __int16 v20 = +[SystemProperties sharedInstance];
    uint64_t v21 = diagcaseLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      if ([v20 internalBuild]) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      if ([v20 carrierSeedBuild]) {
        id v23 = @"YES";
      }
      else {
        id v23 = @"NO";
      }
      int v27 = 138413058;
      unint64_t v28 = (unint64_t)v22;
      if (v4 == 4) {
        __int16 v24 = @"YES";
      }
      else {
        __int16 v24 = @"NO";
      }
      __int16 v29 = 2112;
      if (v6 >= 1) {
        id v25 = @"NO";
      }
      else {
        id v25 = @"YES";
      }
      unint64_t v30 = (unint64_t)v23;
      __int16 v31 = 2112;
      uint64_t v32 = v24;
      __int16 v33 = 2112;
      uint64_t v34 = v25;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "Not collecting logs : internalBuild %@, carrierSeedBuild %@, State collecting %@, accepted case %@", (uint8_t *)&v27, 0x2Au);
    }

    [(DiagnosticCase *)self setCaseState:5];
  }
}

- (void)startCollectingDiagnosticExtensions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  int v6 = [(DiagnosticCase *)self deParametersFromPayloads];
  objc_initWeak(&location, self);
  uint64_t v7 = [(DiagnosticCase *)self manager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke;
  v11[3] = &unk_263FC4F00;
  v11[4] = self;
  objc_copyWeak(&v13, &location);
  id v8 = v5;
  id v12 = v8;
  uint64_t v9 = [v7 collectDiagnosticExtensionLogsWithParameters:v6 options:v4 diagCase:self reply:v11];

  ++self->expectedDiagnosticActions;
  id v10 = diagcaseLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v9;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Started collection from %ld diagnostic extensions", buf, 0xCu);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = diagcaseLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = [v3 count];
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "Ready to attach %ld results from DiagnosticExtensions", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke_157;
  v10[3] = &unk_263FC4ED8;
  v10[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v11 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v10];
  ++*(void *)(*(void *)(a1 + 32) + 16);
  id v5 = diagcaseLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v7 = *(void *)(v6 + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Finished running diagnostic extensions. (%lu of %lu completed)", buf, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained startCollectingAllReports];

  objc_destroyWeak(&v12);
}

void __54__DiagnosticCase_startCollectingDiagnosticExtensions___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [*(id *)(a1 + 32) removeRequiredAttachmentType:@"diagext" pattern:v7];
      }
      else
      {
        id v12 = diagcaseLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = (objc_class *)objc_opt_class();
          uint64_t v14 = NSStringFromClass(v13);
          *(_DWORD *)buf = 138412546;
          uint64_t v51 = (uint64_t)v6;
          __int16 v52 = 2112;
          uint64_t v53 = (uint64_t)v14;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ as diag extension attachments", buf, 0x16u);
        }
      }
      id v8 = 0;
    }
    id v42 = v6;
    __int16 v15 = diagcaseLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v8 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v51 = v16;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v7;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Processing %ld attachments from %@", buf, 0x16u);
    }
    v41 = v7;
    id v43 = v5;

    uint64_t v40 = a1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (!v19)
    {
      uint64_t v21 = 0;
      goto LABEL_31;
    }
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v45;
    while (1)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v18);
        }
        __int16 v24 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = [v24 absoluteString];
          [WeakRetained _addToAttachments:v25];

LABEL_23:
          ++v21;
          continue;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [WeakRetained _addToAttachments:v24];
          goto LABEL_23;
        }
        __int16 v26 = diagcaseLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          int v27 = (objc_class *)objc_opt_class();
          unint64_t v28 = NSStringFromClass(v27);
          *(_DWORD *)buf = 138412546;
          uint64_t v51 = (uint64_t)v28;
          __int16 v52 = 2112;
          uint64_t v53 = (uint64_t)v24;
          _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_ERROR, "Found attachment of unexpected class (%@) {%@}", buf, 0x16u);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
      if (!v20)
      {
LABEL_31:

        __int16 v29 = diagcaseLogHandle();
        uint64_t v30 = v40;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          if (v18) {
            __int16 v31 = "success";
          }
          else {
            __int16 v31 = "failed";
          }
          uint64_t v32 = objc_msgSend(v18, "count", v40);
          uint64_t v33 = *(void *)(v30 + 40);
          *(_DWORD *)buf = 136315906;
          uint64_t v51 = (uint64_t)v31;
          __int16 v52 = 2048;
          uint64_t v53 = v32;
          __int16 v54 = 2048;
          uint64_t v55 = v21;
          __int16 v56 = 2112;
          uint64_t v57 = v33;
          _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_INFO, "Processing diagnostic extension result into events (result:%s, total count:%ld, attached count:%ld, timestamp:%@)", buf, 0x2Au);
        }

        v48[0] = @"type";
        v48[1] = @"name";
        uint64_t v9 = v41;
        v49[0] = @"DiagnosticExtension";
        v49[1] = v41;
        uint64_t v34 = MEMORY[0x263EFFA88];
        if (!v18) {
          uint64_t v34 = MEMORY[0x263EFFA80];
        }
        v49[2] = v34;
        v48[2] = @"result";
        v48[3] = @"value";
        uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v21, v40);
        v49[3] = v35;
        v48[4] = @"count";
        objc_super v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
        v49[4] = v36;
        v48[5] = @"timestamp";
        v37 = NSNumber;
        [*(id *)(v30 + 40) timeIntervalSince1970];
        uint64_t v38 = objc_msgSend(v37, "numberWithDouble:");
        v49[5] = v38;
        v39 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:6];

        [WeakRetained addEvent:v39 forced:1];
        id v6 = v42;
        id v5 = v43;
        goto LABEL_39;
      }
    }
  }
  uint64_t v9 = diagcaseLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138412546;
    uint64_t v51 = (uint64_t)v5;
    __int16 v52 = 2112;
    uint64_t v53 = (uint64_t)v11;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ as diag extension identifier. (Expecting NSString)", buf, 0x16u);
  }
LABEL_39:
}

- (id)deParametersFromPayloads
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v2 = [(DiagnosticCase *)self payloads];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v3)
  {
    id v20 = 0;
    goto LABEL_27;
  }
  uint64_t v4 = v3;
  id v20 = 0;
  uint64_t v5 = *(void *)v22;
  do
  {
    uint64_t v6 = 0;
    do
    {
      if (*(void *)v22 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
        uint64_t v9 = [v8 objectForKeyedSubscript:@"deparams"];
        id v10 = diagcaseLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v26 = (uint64_t)v9;
          _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Potential DE parameter dictionary: %@", buf, 0xCu);
        }

        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v20)
            {
              [v20 addEntriesFromDictionary:v9];
            }
            else
            {
              id v20 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v9];
            }
            goto LABEL_20;
          }
          id v13 = diagcaseLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            uint64_t v14 = (objc_class *)objc_opt_class();
            __int16 v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = (uint64_t)v9;
            __int16 v27 = 2112;
            id v28 = v15;
            _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Found object %@ of class %@ as diag extension parameters. (Expecting NSDictionary)", buf, 0x16u);
          }
        }
        else
        {
          id v13 = diagcaseLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "No diag extension parameters in this payload dictionary.", buf, 2u);
          }
        }

LABEL_20:
        goto LABEL_21;
      }
      id v8 = diagcaseLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = (uint64_t)v7;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "Found object %@ of class %@ in payloads array. (Expecting NSDictionary)", buf, 0x16u);
      }
LABEL_21:

      ++v6;
    }
    while (v4 != v6);
    uint64_t v16 = [v2 countByEnumeratingWithState:&v21 objects:v29 count:16];
    uint64_t v4 = v16;
  }
  while (v16);
LABEL_27:

  if ([v20 count])
  {
    uint64_t v17 = diagcaseLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [v20 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_INFO, "Found %lu DE parameters: %@", buf, 0x16u);
    }
  }

  return v20;
}

- (void)startCollectingAllReports
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  requiredActions = self->_requiredActions;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__DiagnosticCase_startCollectingAllReports__block_invoke;
  v10[3] = &unk_263FC4F28;
  v10[4] = self;
  void v10[5] = &v11;
  [(NSMutableDictionary *)requiredActions enumerateKeysAndObjectsUsingBlock:v10];
  uint64_t v4 = v12;
  self->expectedDiagnosticActions += v12[3];
  if (v4[3])
  {
    uint64_t v5 = diagcaseLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (DiagnosticCase *)v12[3];
      uint64_t v7 = "s";
      if (!v6) {
        uint64_t v7 = "";
      }
      *(_DWORD *)buf = 134218498;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      uint64_t v18 = v7;
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Collecting %lu report%s for case: %@", buf, 0x20u);
    }

    id v8 = [(DiagnosticCase *)self manager];
    [v8 startCollectingNextReportForDiagnosticCase:self];
  }
  else
  {
    uint64_t v9 = diagcaseLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = self;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "There are no reports to collect for %@", buf, 0xCu);
    }

    [(DiagnosticCase *)self finishedCollectingLogs];
  }
  _Block_object_dispose(&v11, 8);
}

void __43__DiagnosticCase_startCollectingAllReports__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = casemanagementLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Ready to collect report name: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [*(id *)(a1 + 32) manager];
    uint64_t v9 = v8;
    id v10 = v5;
    id v11 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [*(id *)(a1 + 32) manager];
    uint64_t v9 = v8;
    id v10 = v5;
    id v11 = 0;
LABEL_7:
    int v12 = [v8 requestReportGenerator:v10 options:v11];

    if (v12) {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    goto LABEL_12;
  }
  uint64_t v13 = casemanagementLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = (objc_class *)objc_opt_class();
    __int16 v15 = NSStringFromClass(v14);
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = v15;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ in report dictionary", (uint8_t *)&v16, 0x16u);
  }
LABEL_12:
}

- (void)reportGeneratorEnded:(id)a3 reportInfo:(id)a4 error:(id)a5 isFinalReportGenerator:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  ++self->completedDiagnosticActions;
  uint64_t v13 = diagcaseLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t completedDiagnosticActions = self->completedDiagnosticActions;
    unint64_t expectedDiagnosticActions = self->expectedDiagnosticActions;
    int v19 = 134218240;
    unint64_t v20 = completedDiagnosticActions;
    __int16 v21 = 2048;
    unint64_t v22 = expectedDiagnosticActions;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "Finished collecting a diagnostic report. (%lu of %lu completed)", (uint8_t *)&v19, 0x16u);
  }

  if (v11)
  {
    int v16 = diagcaseLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      unint64_t v20 = (unint64_t)v11;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "Adding case report:%@", (uint8_t *)&v19, 0xCu);
    }

    id v17 = [(DiagnosticCase *)self caseReports];
    [v17 addObject:v11];
  }
  if (v12)
  {
    __int16 v18 = diagcaseLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412546;
      unint64_t v20 = (unint64_t)v12;
      __int16 v21 = 2112;
      unint64_t v22 = (unint64_t)v10;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, "Error %@ from %@", (uint8_t *)&v19, 0x16u);
    }
  }
  if (v6) {
    [(DiagnosticCase *)self finishedCollectingLogs];
  }
}

- (id)_updatedPayloadPathForOriginalPath:(id)a3 sandboxExtensionToken:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    [v7 UTF8String];
    if (sandbox_extension_consume() == -1)
    {
      long long v24 = diagcaseLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = [(DiagnosticCase *)self caseId];
        uint64_t v26 = __error();
        __int16 v27 = strerror(*v26);
        id v28 = "Unknown";
        *(_DWORD *)buf = 138543874;
        long long v44 = v25;
        if (v27) {
          id v28 = v27;
        }
        __int16 v45 = 2112;
        id v46 = v6;
        __int16 v47 = 2080;
        v48 = v28;
        _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_ERROR, "Case: %{public}@: Failed to consume extension token for '%@' due to error: %s", buf, 0x20u);
      }
      uint64_t v23 = 0;
    }
    else
    {
      id v9 = v6;
      uint64_t v10 = [v9 lastPathComponent];
      id v11 = NSString;
      id v12 = [(DiagnosticCase *)self caseId];
      v41 = (void *)v10;
      uint64_t v13 = [v11 stringWithFormat:@"Case%@_%@", v12, v10];

      uint64_t v14 = +[ABCAdministrator sharedInstance];
      __int16 v15 = [v14 configurationManager];
      int v16 = [v15 logArchivePath];
      id v17 = [v16 stringByAppendingPathComponent:v13];

      __int16 v18 = diagcaseLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = [(DiagnosticCase *)self caseId];
        *(_DWORD *)buf = 138543874;
        long long v44 = v19;
        __int16 v45 = 2112;
        id v46 = v9;
        __int16 v47 = 2112;
        v48 = v17;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_INFO, "Case: %{public}@: Attempting to copy %@ to %@", buf, 0x20u);
      }
      unint64_t v20 = [MEMORY[0x263F08850] defaultManager];
      id v42 = 0;
      char v21 = [v20 copyItemAtPath:v9 toPath:v17 error:&v42];
      id v22 = v42;

      if (v21)
      {
        uint64_t v23 = v17;
      }
      else
      {
        __int16 v29 = diagcaseLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          [(DiagnosticCase *)self caseId];
          uint64_t v30 = v40 = v13;
          uint64_t v31 = [v22 localizedDescription];
          uint64_t v32 = (void *)v31;
          *(_DWORD *)buf = 138544130;
          uint64_t v33 = @"Unknown";
          long long v44 = v30;
          if (v31) {
            uint64_t v33 = (__CFString *)v31;
          }
          __int16 v45 = 2112;
          id v46 = v9;
          __int16 v47 = 2112;
          v48 = v17;
          __int16 v49 = 2112;
          v50 = v33;
          _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_ERROR, "Case: %{public}@: Failed to copy %@ to %@ due to error: %@", buf, 0x2Au);

          uint64_t v13 = v40;
        }

        uint64_t v23 = 0;
      }

      if (sandbox_extension_release() == -1)
      {
        uint64_t v34 = diagcaseLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = [(DiagnosticCase *)self caseId];
          objc_super v36 = __error();
          v37 = strerror(*v36);
          uint64_t v38 = "Unknown";
          *(_DWORD *)buf = 138543874;
          long long v44 = v35;
          if (v37) {
            uint64_t v38 = v37;
          }
          __int16 v45 = 2112;
          id v46 = v9;
          __int16 v47 = 2080;
          v48 = v38;
          _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_ERROR, "Case: %{public}@: Failed to release sandbox extension handle for %@ due to error: %s", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    uint64_t v23 = (char *)v6;
  }

  return v23;
}

- (void)_updatePayloadDictionaryArray:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v42 = [MEMORY[0x263EFF980] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v5 = [(DiagnosticCase *)self payloads];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v52;
    id v9 = @"path";
    BOOL v39 = v3;
    v41 = v5;
    uint64_t v38 = *(void *)v52;
    v37 = @"path";
    do
    {
      uint64_t v10 = 0;
      uint64_t v40 = v7;
      do
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
        if (v3)
        {
          long long v44 = [*(id *)(*((void *)&v51 + 1) + 8 * v10) objectForKeyedSubscript:v9];
          if (v44)
          {
            uint64_t v43 = v10;
            id v12 = diagcaseLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              [(DiagnosticCase *)self caseId];
              v14 = uint64_t v13 = v5;
              *(_DWORD *)buf = 138543618;
              uint64_t v57 = v14;
              __int16 v58 = 2112;
              uint64_t v59 = v44;
              _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "Case: %{public}@: Moving files from payload path array into working dir: %@", buf, 0x16u);

              id v5 = v13;
            }

            __int16 v15 = [v11 objectForKeyedSubscript:@"sandbox_ext_token_dict"];
            if (v15)
            {
              int v16 = [v11 mutableCopy];
              [v16 removeObjectForKey:@"sandbox_ext_token_dict"];
              id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v18 = v44;
              uint64_t v46 = [v18 countByEnumeratingWithState:&v47 objects:v55 count:16];
              if (v46)
              {
                uint64_t v19 = *(void *)v48;
                uint64_t v45 = *(void *)v48;
                do
                {
                  for (uint64_t i = 0; i != v46; ++i)
                  {
                    if (*(void *)v48 != v19) {
                      objc_enumerationMutation(v18);
                    }
                    char v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                    id v22 = objc_msgSend(v15, "objectForKeyedSubscript:", v21, v37);
                    uint64_t v23 = [(DiagnosticCase *)self _updatedPayloadPathForOriginalPath:v21 sandboxExtensionToken:v22];

                    if ([v23 length])
                    {
                      [v17 addObject:v23];
                    }
                    else
                    {
                      long long v24 = diagcaseLogHandle();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                      {
                        [(DiagnosticCase *)self caseId];
                        id v25 = v18;
                        uint64_t v26 = v15;
                        id v27 = v17;
                        id v28 = v16;
                        v30 = __int16 v29 = self;
                        *(_DWORD *)buf = 138543618;
                        uint64_t v57 = v30;
                        __int16 v58 = 2112;
                        uint64_t v59 = v21;
                        _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_DEFAULT, "Case: %{public}@: Failed to copy %@ due to sandbox or file error. Dropping payload.", buf, 0x16u);

                        self = v29;
                        int v16 = v28;
                        id v17 = v27;
                        __int16 v15 = v26;
                        id v18 = v25;
                        uint64_t v19 = v45;
                      }
                    }
                  }
                  uint64_t v46 = [v18 countByEnumeratingWithState:&v47 objects:v55 count:16];
                }
                while (v46);
              }

              id v9 = v37;
              [v16 setObject:v17 forKeyedSubscript:v37];
              [(NSMutableArray *)v42 addObject:v16];

              BOOL v3 = v39;
              uint64_t v7 = v40;
              id v5 = v41;
              uint64_t v8 = v38;
            }
            else
            {
              int v16 = diagcaseLogHandle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                uint64_t v32 = [(DiagnosticCase *)self caseId];
                *(_DWORD *)buf = 138543618;
                uint64_t v57 = v32;
                __int16 v58 = 2112;
                uint64_t v59 = v11;
                _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, "Case: %{public}@: No sandbox extension token dictionary found. Dropping payload %@", buf, 0x16u);

                id v5 = v41;
              }
            }
            uint64_t v31 = v44;

            uint64_t v10 = v43;
          }
          else
          {
            [(NSMutableArray *)v42 addObject:v11];
            uint64_t v31 = 0;
          }
        }
        else
        {
          uint64_t v31 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * v10) mutableCopy];
          [v31 removeObjectForKey:@"sandbox_ext_token_dict"];
          [v31 removeObjectForKey:v9];
        }

        ++v10;
      }
      while (v10 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
    }
    while (v7);
  }

  payloads = self->_payloads;
  self->_payloads = v42;

  uint64_t v34 = diagcaseLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = [(DiagnosticCase *)self caseId];
    objc_super v36 = [(DiagnosticCase *)self payloads];
    *(_DWORD *)buf = 138543618;
    uint64_t v57 = v35;
    __int16 v58 = 2112;
    uint64_t v59 = v36;
    _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_DEBUG, "Case: %{public}@: Updated payloads array: %@", buf, 0x16u);
  }
}

- (void)finishedCollectingLogs
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = diagcaseLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [(DiagnosticCase *)self caseId];
    int v11 = 138412290;
    unint64_t v12 = (unint64_t)v4;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "Finished collecting all diagnostic reports for case %@.", (uint8_t *)&v11, 0xCu);
  }
  unint64_t completedDiagnosticActions = self->completedDiagnosticActions;
  unint64_t expectedDiagnosticActions = self->expectedDiagnosticActions;
  uint64_t v7 = diagcaseLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (completedDiagnosticActions >= expectedDiagnosticActions)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Finished collecting all diagnostic reports.", (uint8_t *)&v11, 2u);
    }

    [(DiagnosticCase *)self setCaseState:5];
  }
  else
  {
    if (v8)
    {
      unint64_t v9 = self->completedDiagnosticActions;
      unint64_t v10 = self->expectedDiagnosticActions;
      int v11 = 134218240;
      unint64_t v12 = v9;
      __int16 v13 = 2048;
      unint64_t v14 = v10;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEFAULT, "Waiting for collection of diagnostic reports (finished %lu of %lu)", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)prepareAttachmentsForReporting
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DiagnosticCase *)self caseStorage];
  int v4 = [v3 caseState];

  if (v4 == 5)
  {
    id v5 = [(DiagnosticCase *)self payloads];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = diagcaseLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        BOOL v8 = [(DiagnosticCase *)self payloads];
        *(_DWORD *)buf = 138412290;
        uint64_t v81 = (uint64_t)v8;
        _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Extracting payloads %@ to attachments.", buf, 0xCu);
      }
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      obuint64_t j = [(DiagnosticCase *)self payloads];
      uint64_t v9 = [obj countByEnumeratingWithState:&v74 objects:v93 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v60 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v75 != v60) {
              objc_enumerationMutation(obj);
            }
            unint64_t v12 = [*(id *)(*((void *)&v74 + 1) + 8 * i) objectForKeyedSubscript:@"path"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v12;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v73 = 0u;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v92 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v71;
                do
                {
                  for (uint64_t j = 0; j != v15; ++j)
                  {
                    if (*(void *)v71 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    id v18 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                    if ([v18 length]) {
                      [(DiagnosticCase *)self _addToAttachments:v18];
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v70 objects:v92 count:16];
                }
                while (v15);
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_25;
              }
              id v19 = v12;
              if ([v19 length]) {
                [(DiagnosticCase *)self _addToAttachments:v19];
              }
            }

LABEL_25:
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v74 objects:v93 count:16];
        }
        while (v10);
      }
    }
    unint64_t v20 = [(DiagnosticCase *)self caseReports];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      long long v53 = [MEMORY[0x263EFF980] array];
      id v22 = diagcaseLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = [(DiagnosticCase *)self caseReports];
        uint64_t v24 = [v23 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v81 = v24;
        _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_DEBUG, "Extracting %ld reports to attachments.", buf, 0xCu);
      }
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v54 = [(DiagnosticCase *)self caseReports];
      uint64_t v57 = [v54 countByEnumeratingWithState:&v66 objects:v91 count:16];
      if (v57)
      {
        uint64_t v56 = *(void *)v67;
        do
        {
          for (uint64_t k = 0; k != v57; ++k)
          {
            if (*(void *)v67 != v56) {
              objc_enumerationMutation(v54);
            }
            uint64_t v26 = *(void **)(*((void *)&v66 + 1) + 8 * k);
            id v27 = diagcaseLogHandle();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v81 = (uint64_t)v26;
              _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_INFO, "Report: %@", buf, 0xCu);
            }

            id v28 = [v26 objectForKeyedSubscript:@"attachments"];
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v62 objects:v90 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v63;
              do
              {
                for (uint64_t m = 0; m != v30; ++m)
                {
                  if (*(void *)v63 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  uint64_t v33 = *(void **)(*((void *)&v62 + 1) + 8 * m);
                  if ([v33 length]) {
                    [(DiagnosticCase *)self _addToAttachments:v33];
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v62 objects:v90 count:16];
              }
              while (v30);
            }
            uint64_t v34 = [v26 objectForKeyedSubscript:@"reportCreator"];
            uint64_t v35 = [v26 objectForKeyedSubscript:@"reportStart"];
            objc_super v36 = [v26 objectForKeyedSubscript:@"reportEnd"];
            uint64_t v61 = [v26 objectForKeyedSubscript:@"reportEndStatus"];
            if ([v61 isEqualToString:@"Error"])
            {
              v37 = [v26 objectForKeyedSubscript:@"Error"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v38 = v37;
                goto LABEL_53;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v38 = [v37 description];
LABEL_53:
                id obja = v38;
              }
              else
              {
                uint64_t v40 = diagcaseLogHandle();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  v41 = (objc_class *)objc_opt_class();
                  id v42 = NSStringFromClass(v41);
                  *(_DWORD *)buf = 138412546;
                  uint64_t v81 = (uint64_t)v42;
                  __int16 v82 = 2112;
                  v83 = v37;
                  _os_log_impl(&dword_209DBA000, v40, OS_LOG_TYPE_INFO, "Found unexpected class %@ as error payload: %@", buf, 0x16u);
                }
                id obja = 0;
              }
              BOOL v39 = v61;

              goto LABEL_58;
            }
            id obja = 0;
            BOOL v39 = v61;
LABEL_58:
            uint64_t v43 = diagcaseLogHandle();
            BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);
            if (v34 && v35 && v36 && v39)
            {
              if (v44)
              {
                uint64_t v45 = [v28 count];
                *(_DWORD *)buf = 138413314;
                uint64_t v81 = (uint64_t)v34;
                __int16 v82 = 2112;
                v83 = v35;
                __int16 v84 = 2112;
                v85 = v36;
                __int16 v86 = 2112;
                v87 = v39;
                __int16 v88 = 2048;
                uint64_t v89 = v45;
                _os_log_impl(&dword_209DBA000, v43, OS_LOG_TYPE_DEBUG, "Processing report result from %@ into events (start:%@, end:%@, result:%@, %ld attachments)", buf, 0x34u);
              }

              v78[0] = @"type";
              v78[1] = @"name";
              v79[0] = @"report";
              v79[1] = v34;
              v79[2] = @"Start";
              v78[2] = @"status";
              v78[3] = @"timestamp";
              uint64_t v46 = NSNumber;
              [v35 timeIntervalSince1970];
              long long v47 = objc_msgSend(v46, "numberWithDouble:");
              v79[3] = v47;
              uint64_t v55 = v35;
              uint64_t v43 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:4];

              [v53 addObject:v43];
              long long v48 = NSDictionary;
              long long v49 = NSNumber;
              [v36 timeIntervalSince1970];
              long long v50 = objc_msgSend(v49, "numberWithDouble:");
              long long v51 = obja;
              long long v52 = objc_msgSend(v48, "dictionaryWithObjectsAndKeys:", @"report", @"type", v34, @"name", @"End", @"status", v61, @"result", v50, @"timestamp", obja, @"context", 0);

              uint64_t v35 = v55;
              BOOL v39 = v61;
              [v53 addObject:v52];
            }
            else
            {
              if (v44)
              {
                *(_DWORD *)buf = 138413058;
                uint64_t v81 = (uint64_t)v34;
                __int16 v82 = 2112;
                v83 = v35;
                __int16 v84 = 2112;
                v85 = v36;
                __int16 v86 = 2112;
                v87 = v39;
                _os_log_impl(&dword_209DBA000, v43, OS_LOG_TYPE_DEBUG, "Report result contains missing values - creator:%@ startDate:%@ endDate:%@ result:%@", buf, 0x2Au);
              }
              long long v51 = obja;
            }
          }
          uint64_t v57 = [v54 countByEnumeratingWithState:&v66 objects:v91 count:16];
        }
        while (v57);
      }

      if ([v53 count]) {
        [(DiagnosticCase *)self addEvents:v53 forced:1];
      }
    }
  }
}

- (void)validateAttachments
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  BOOL v3 = diagcaseLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    requiredAttachments = self->_requiredAttachments;
    *(_DWORD *)buf = 138412290;
    id v17 = (DiagnosticCase *)requiredAttachments;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "Ready to validate attachments with requirements: %@", buf, 0xCu);
  }

  id v5 = self->_requiredAttachments;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__DiagnosticCase_validateAttachments__block_invoke;
  v11[3] = &unk_263FC4F28;
  v11[4] = self;
  void v11[5] = &v12;
  [(NSMutableDictionary *)v5 enumerateKeysAndObjectsUsingBlock:v11];
  if (*((unsigned char *)v13 + 24))
  {
    if ([(NSMutableDictionary *)self->_requiredAttachments count])
    {
      uint64_t v6 = diagcaseLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "All attachments validated successfully.";
        BOOL v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_209DBA000, v8, v9, v7, buf, 2u);
      }
    }
    else
    {
      uint64_t v6 = diagcaseLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v7 = "No attachments to validate.";
        BOOL v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_INFO;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  uint64_t v10 = diagcaseLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = self;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "This case has one or more missing required attachments. Marking as ineligible. (%@)", buf, 0xCu);
  }

  [(DiagnosticCase *)self setDampeningType:4294967294];
LABEL_14:
  _Block_object_dispose(&v12, 8);
}

void __37__DiagnosticCase_validateAttachments__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v35 = 0;
  objc_super v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5;
  uint64_t v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  uint64_t v7 = diagcaseLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v40 = v5;
    __int16 v41 = 2112;
    id v42 = v6;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Validating we have attachment type '%@' with pattern '%@'", buf, 0x16u);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__DiagnosticCase_validateAttachments__block_invoke_185;
  aBlock[3] = &unk_263FC4F50;
  id v27 = &v29;
  id v8 = v5;
  id v26 = v8;
  id v28 = &v35;
  os_log_type_t v9 = _Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong(v30 + 5, a3);
    [*(id *)(*(void *)(a1 + 32) + 112) enumerateObjectsUsingBlock:v9];
    if (!*((unsigned char *)v36 + 24))
    {
      uint64_t v10 = diagcaseLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v30[5];
        *(_DWORD *)buf = 138543618;
        id v40 = v8;
        __int16 v41 = 2112;
        id v42 = v11;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Missing attachment for type '%{public}@' (matching pattern '%@')", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v6;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __37__DiagnosticCase_validateAttachments__block_invoke_187;
      v19[3] = &unk_263FC4F78;
      uint64_t v13 = *(void *)(a1 + 32);
      id v22 = &v29;
      v19[4] = v13;
      id v21 = v9;
      uint64_t v23 = &v35;
      id v14 = v8;
      uint64_t v15 = *(void *)(a1 + 40);
      id v20 = v14;
      uint64_t v24 = v15;
      [v12 enumerateObjectsUsingBlock:v19];
    }
    else
    {
      uint64_t v16 = diagcaseLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138412802;
        id v40 = v6;
        __int16 v41 = 2112;
        id v42 = v18;
        __int16 v43 = 2114;
        id v44 = v8;
        _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, "Found unexpected pattern object %@ (class %@) when validating required attachments for type '%{public}@'", buf, 0x20u);
      }
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

void __37__DiagnosticCase_validateAttachments__block_invoke_185(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if ([v6 containsString:*(void *)(*(void *)(a1[5] + 8) + 40)])
  {
    uint64_t v7 = diagcaseLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[4];
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Validated attachment for type '%@': %@", (uint8_t *)&v9, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __37__DiagnosticCase_validateAttachments__block_invoke_187(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    [*(id *)(a1[4] + 112) enumerateObjectsUsingBlock:a1[6]];
    if (!*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
    {
      id v5 = diagcaseLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (void *)a1[5];
        uint64_t v7 = *(void **)(*(void *)(a1[7] + 8) + 40);
        int v12 = 138543618;
        id v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Missing attachment for type '%{public}@' (matching pattern '%@')", (uint8_t *)&v12, 0x16u);
      }

      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v8 = diagcaseLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = a1[5];
      int v12 = 138412802;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "Found unexpected pattern object %@ (class %@) when validating required attachments for type '%{public}@'", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (id)addSizeInfoForAttachment:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(NSURL) initWithString:v4];
  id v6 = [v5 path];

  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  id v20 = 0;
  uint64_t v8 = [v7 attributesOfItemAtPath:v6 error:&v20];
  id v9 = v20;

  if (v9)
  {
    uint64_t v10 = diagcaseLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v9 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v11;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: Error getting fileSize for '%@': %@", buf, 0x16u);
    }
    int v12 = &stru_26BDE2C70;
  }
  else
  {
    uint64_t v13 = [v8 fileSize];
    uint64_t v10 = [v4 lastPathComponent];
    __int16 v14 = [(DiagnosticCase *)self attachmentsWithSize];

    if (!v14)
    {
      uint64_t v15 = objc_opt_new();
      [(DiagnosticCase *)self setAttachmentsWithSize:v15];
    }
    __int16 v16 = [NSNumber numberWithUnsignedLongLong:v13];
    uint64_t v17 = [(DiagnosticCase *)self attachmentsWithSize];
    [v17 setObject:v16 forKeyedSubscript:v10];

    int v12 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", v13);
    uint64_t v18 = summaryLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Adding attachment %@, size: %llu bytes", buf, 0x16u);
    }

    self->_attachmentsFileSize += v13;
  }

  return v12;
}

- (id)stringRepresentationOfAttachmentsWithSize
{
  v2 = [(DiagnosticCase *)self attachmentsWithSize];
  BOOL v3 = +[DiagnosticCaseSummaryAnalytics stringRepresentationOfAttachmentsWithSize:v2];

  return v3;
}

+ (id)generateCaseSummaryDictionaryFromCaseStorage:(id)a3
{
  v38[7] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  context = (void *)MEMORY[0x21050CEB0]();
  id v5 = [v3 timeStamp];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v3 caseClosedTime];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v33 = v6;
  uint64_t v32 = iso8601date_string_from_NSDate(v6);
  uint64_t v31 = iso8601date_string_from_NSDate(v8);
  id v9 = [v3 caseID];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setObject:v10 forKeyedSubscript:@"case_identifier"];

  uint64_t v11 = +[DiagnosticCase signatureForCaseStorage:v3];
  [v4 setObject:v11 forKeyedSubscript:@"signature"];

  int v12 = [v3 caseEvents];
  uint64_t v13 = +[DiagnosticCase _arrayObjectRepresentationOfJSONString:v12];
  [v4 setObject:v13 forKeyedSubscript:@"events"];

  v37[0] = @"case_opened_timestamp";
  __int16 v14 = NSNumber;
  [v6 timeIntervalSince1970];
  uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  v38[0] = v15;
  v38[1] = v32;
  v37[1] = @"case_opened_time";
  v37[2] = @"case_closed_timestamp";
  __int16 v16 = NSNumber;
  [v8 timeIntervalSince1970];
  uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
  v38[2] = v17;
  v38[3] = v31;
  v37[3] = @"case_closed_time";
  v37[4] = @"dampening_type";
  uint64_t v18 = +[DiagnosticCase _caseDampeningTypeString:](DiagnosticCase, "_caseDampeningTypeString:", [v3 caseDampeningType]);
  v38[4] = v18;
  v37[5] = @"closure_type";
  id v19 = +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", [v3 caseClosureType]);
  v38[5] = v19;
  v37[6] = @"remote_trigger";
  id v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "remoteTrigger"));
  v38[6] = v20;
  id v21 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:7];
  [v4 setObject:v21 forKeyedSubscript:@"case_status"];

  id v22 = [v3 caseAttachments];
  __int16 v23 = +[DiagnosticCase _arrayObjectRepresentationOfJSONString:v22];
  [v4 setObject:v23 forKeyedSubscript:@"attachments"];

  uint64_t v24 = +[SystemProperties sharedInstance];
  v35[0] = @"product_type";
  uint64_t v25 = [v24 productType];
  v36[0] = v25;
  v35[1] = @"product_name";
  id v26 = [v24 productName];
  v36[1] = v26;
  v35[2] = @"product_version";
  id v27 = [v24 productVersion];
  v36[2] = v27;
  v35[3] = @"build_version";
  id v28 = [v24 buildVersion];
  v36[3] = v28;
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  [v4 setObject:v29 forKeyedSubscript:@"system_properties"];

  return v4;
}

+ (id)generateCaseSummaryFromCaseStorageDictionary:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = (void *)MEMORY[0x21050CEB0]();
  id v6 = [v3 objectForKeyedSubscript:@"timeStamp"];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v3 objectForKeyedSubscript:@"caseClosedTime"];
  id v9 = (id)[v8 copy];

  if (v7)
  {
    if (!v9)
    {
      uint64_t v10 = diagcaseLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v3;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Fixing up case dictionary with missing key caseClosedTime: %@", buf, 0xCu);
      }

      id v9 = v7;
    }
    context = v5;
    uint64_t v11 = iso8601date_string_from_NSDate(v7);
    uint64_t v12 = iso8601date_string_from_NSDate(v9);
    uint64_t v13 = [v3 objectForKeyedSubscript:@"caseID"];
    __int16 v14 = (void *)[v13 copy];
    [v4 setObject:v14 forKeyedSubscript:@"case_identifier"];

    uint64_t v15 = +[DiagnosticCase signatureForCaseStorageDictionary:v3];
    [v4 setObject:v15 forKeyedSubscript:@"signature"];

    __int16 v16 = [v3 objectForKeyedSubscript:@"caseEvents"];
    uint64_t v17 = +[DiagnosticCase _arrayObjectRepresentationOfJSONString:v16];
    [v4 setObject:v17 forKeyedSubscript:@"events"];

    v54[0] = @"case_opened_timestamp";
    uint64_t v18 = NSNumber;
    long long v50 = v7;
    [v7 timeIntervalSince1970];
    id v19 = objc_msgSend(v18, "numberWithDouble:");
    v55[0] = v19;
    v55[1] = v11;
    long long v48 = (void *)v11;
    v54[1] = @"case_opened_time";
    v54[2] = @"case_closed_timestamp";
    id v20 = NSNumber;
    long long v49 = v9;
    [v9 timeIntervalSince1970];
    id v21 = objc_msgSend(v20, "numberWithDouble:");
    v55[2] = v21;
    v55[3] = v12;
    long long v47 = (void *)v12;
    v54[3] = @"case_closed_time";
    v54[4] = @"dampening_type";
    id v22 = [v3 objectForKeyedSubscript:@"caseDampeningType"];
    __int16 v23 = +[DiagnosticCase _caseDampeningTypeString:](DiagnosticCase, "_caseDampeningTypeString:", (__int16)[v22 intValue]);
    v55[4] = v23;
    v54[5] = @"closure_type";
    uint64_t v24 = [v3 objectForKeyedSubscript:@"caseClosureType"];
    uint64_t v25 = +[DiagnosticCase _closureTypeString:](DiagnosticCase, "_closureTypeString:", (__int16)[v24 intValue]);
    v55[5] = v25;
    v54[6] = @"remote_trigger";
    id v26 = [v3 objectForKeyedSubscript:@"remoteTrigger"];
    v55[6] = v26;
    id v27 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:7];
    [v4 setObject:v27 forKeyedSubscript:@"case_status"];

    id v28 = [v3 objectForKeyedSubscript:@"caseAttachments"];
    uint64_t v29 = +[DiagnosticCase _arrayObjectRepresentationOfJSONString:v28];
    [v4 setObject:v29 forKeyedSubscript:@"attachments"];

    uint64_t v30 = [v3 objectForKeyedSubscript:@"dpSubmissionState"];
    [v4 setObject:v30 forKeyedSubscript:@"dp_submission"];

    uint64_t v31 = +[SystemProperties sharedInstance];
    uint64_t v32 = [v3 objectForKeyedSubscript:@"buildVariant"];
    uint64_t v33 = v32;
    if (v32)
    {
      id v34 = v32;
    }
    else
    {
      id v34 = [v31 buildVariant];
    }
    uint64_t v37 = v34;

    char v38 = [v3 objectForKeyedSubscript:@"buildVersion"];
    BOOL v39 = v38;
    if (v38)
    {
      id v40 = v38;
    }
    else
    {
      id v40 = [v31 buildVersion];
    }
    __int16 v41 = v40;

    v52[0] = @"product_type";
    id v42 = [v31 productType];
    v53[0] = v42;
    v52[1] = @"product_name";
    __int16 v43 = [v31 productName];
    v53[1] = v43;
    v52[2] = @"product_version";
    id v44 = [v31 productVersion];
    v53[2] = v44;
    v53[3] = v41;
    v52[3] = @"build_version";
    v52[4] = @"build_variant";
    v53[4] = v37;
    uint64_t v45 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:5];
    [v4 setObject:v45 forKeyedSubscript:@"system_properties"];

    id v36 = v4;
  }
  else
  {
    uint64_t v35 = diagcaseLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v3;
      _os_log_impl(&dword_209DBA000, v35, OS_LOG_TYPE_ERROR, "Missing required key timeStamp (case open time) from case dictionary: %@", buf, 0xCu);
    }

    id v36 = 0;
  }

  return v36;
}

- (id)_generateCaseSummaryDictionary
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  context = (void *)MEMORY[0x21050CEB0]();
  id v4 = (void *)MEMORY[0x263EFF910];
  [(DiagnosticCase *)self caseOpenedTime];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  id v57 = iso8601date_string_from_NSDate(v5);

  id v6 = (void *)MEMORY[0x263EFF910];
  [(DiagnosticCase *)self caseClosedTime];
  uint64_t v7 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  uint64_t v56 = iso8601date_string_from_NSDate(v7);

  uint64_t v8 = [(DiagnosticCase *)self caseId];
  id v9 = [v8 UUIDString];
  [v3 setObject:v9 forKeyedSubscript:@"case_identifier"];

  uint64_t v10 = [(DiagnosticCase *)self signature];
  [v3 setObject:v10 forKeyedSubscript:@"signature"];

  uint64_t v11 = [(DiagnosticCase *)self events];
  [v3 setObject:v11 forKeyedSubscript:@"events"];

  long long v53 = NSDictionary;
  uint64_t v12 = NSNumber;
  [(DiagnosticCase *)self caseOpenedTime];
  uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
  __int16 v14 = NSNumber;
  [(DiagnosticCase *)self caseClosedTime];
  uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  __int16 v16 = [(DiagnosticCase *)self caseDampeningTypeString];
  uint64_t v17 = [(DiagnosticCase *)self caseClosureTypeString];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[DiagnosticCase isRemoteTrigger](self, "isRemoteTrigger"));
  id v19 = objc_msgSend(v53, "dictionaryWithObjectsAndKeys:", v13, @"case_opened_timestamp", v57, @"case_opened_time", v15, @"case_closed_timestamp", v56, @"case_closed_time", v16, @"dampening_type", v17, @"closure_type", v18, @"remote_trigger", 0);
  [v3 setObject:v19 forKeyedSubscript:@"case_status"];

  id v20 = [(DiagnosticCase *)self attachments];
  [v3 setObject:v20 forKeyedSubscript:@"attachments"];

  id v21 = +[SystemProperties sharedInstance];
  id v22 = +[WirelessTechnologyProfile sharedInstance];
  long long v51 = (void *)MEMORY[0x263EFF9A0];
  long long v50 = [v21 productType];
  long long v49 = [v21 productName];
  __int16 v23 = [v21 productVersion];
  uint64_t v24 = [v21 buildVersion];
  uint64_t v25 = [v21 buildVariant];
  id v26 = [v22 regulatoryDomainCountry];
  id v54 = v22;
  id v27 = [v22 homeCarrier];
  id v28 = objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v50, @"product_type", v49, @"product_name", v23, @"product_version", v24, @"build_version", v25, @"build_variant", v26, @"regulatory_domain_country", v27, @"home_carrier", 0);

  uint64_t v29 = [v21 serialNumber];
  uint64_t v30 = [v29 length];

  if (v30)
  {
    uint64_t v31 = [v21 serialNumber];
    [v28 setObject:v31 forKeyedSubscript:@"serial_number"];
  }
  [v3 setObject:v28 forKeyedSubscript:@"system_properties"];
  uint64_t v32 = +[PrimaryInterfaceUtils sharedInstance];
  uint64_t v33 = diagcaseLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = [v32 primaryInterfaceType];
    uint64_t v35 = [v32 interfaceBecamePrimaryDate];
    int v36 = [v32 hasPrimaryInterface];
    uint64_t v37 = "NO";
    *(_DWORD *)buf = 134218498;
    uint64_t v59 = v34;
    if (v36) {
      uint64_t v37 = "YES";
    }
    __int16 v60 = 2112;
    uint64_t v61 = v35;
    __int16 v62 = 2080;
    long long v63 = v37;
    _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEBUG, "InterfaceUtils reports type:%ld date:%@ hasPrimary:%s", buf, 0x20u);
  }
  long long v52 = v28;

  if ([v32 hasPrimaryInterface])
  {
    char v38 = [v32 primaryInterfaceTypeString];
    BOOL v39 = [v32 interfaceBecamePrimaryDate];
    id v40 = NSNumber;
    [v39 timeIntervalSince1970];
    __int16 v41 = objc_msgSend(v40, "numberWithDouble:");
    if (v39)
    {
      id v42 = iso8601date_string_from_NSDate(v39);
    }
    else
    {
      id v42 = 0;
    }
    uint64_t v45 = [v32 estimatedInterfaceBecamePrimaryDate];
    uint64_t v46 = NSNumber;
    [v45 timeIntervalSince1970];
    __int16 v43 = objc_msgSend(v46, "numberWithDouble:");
    if (v45)
    {
      id v44 = iso8601date_string_from_NSDate(v45);
    }
    else
    {
      id v44 = 0;
    }
  }
  else
  {
    __int16 v41 = 0;
    __int16 v43 = 0;
    id v42 = 0;
    id v44 = 0;
    char v38 = @"None";
  }
  long long v47 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v38, @"primary_interface_type", v41, @"primary_interface_timestamp", v42, @"primary_interface_time", v43, @"primary_interface_timestamp_estimated", v44, @"primary_interface_time_estimated", 0);
  [v3 setObject:v47 forKeyedSubscript:@"network_properties"];

  return v3;
}

- (id)_caseSummaryFileName
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  [v3 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  id v4 = (void *)MEMORY[0x263EFF910];
  [(DiagnosticCase *)self caseOpenedTime];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  id v6 = [v3 stringFromDate:v5];

  if (![v6 length])
  {
    uint64_t v7 = diagcaseLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(DiagnosticCase *)self caseOpenedTime];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v8;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "formattedDate is nil for case opened time %f", buf, 0xCu);
    }

    id v9 = [NSString alloc];
    [(DiagnosticCase *)self caseOpenedTime];
    uint64_t v11 = objc_msgSend(v9, "initWithFormat:", @"%.3f", v10);

    id v6 = (void *)v11;
  }
  uint64_t v12 = [(DiagnosticCase *)self manager];
  uint64_t v13 = [v12 configManager];
  __int16 v14 = [v13 logArchivePath];
  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"case_summary_%@.json", v6];
  __int16 v16 = [v14 stringByAppendingPathComponent:v15];

  return v16;
}

- (void)summarizeCaseReport
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(DiagnosticCase *)self caseStorage];
  int v4 = [v3 caseDampeningType];

  if (v4 < 1)
  {
    id v5 = [(DiagnosticCase *)self _generateCaseSummaryDictionary];
    if (!v5)
    {
      id v6 = diagcaseLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_ERROR, "Case summary dictionary is nil", buf, 2u);
      }
      goto LABEL_23;
    }
    id v6 = +[DiagnosticCase _stringRepresentationOfJSONObject:v5 prettyPrint:1];
    if ([v6 length])
    {
      uint64_t v7 = [(DiagnosticCase *)self _caseSummaryFileName];
      if (v7)
      {
        id v16 = 0;
        int v12 = [v6 writeToFile:v7 atomically:0 encoding:4 error:&v16];
        uint64_t v13 = v16;
        if (v12)
        {
          [(DiagnosticCase *)self fixupCaseSummaryFile:v7];
          __int16 v14 = diagcaseLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v7;
            _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Case summary wrote to %@, adding to attachment", buf, 0xCu);
          }

          [(DiagnosticCase *)self _addToAttachments:v7];
          [(DiagnosticCase *)self setCaseSummaryFilepath:v7];
        }
        else
        {
          uint64_t v15 = diagcaseLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v18 = v13;
            _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_ERROR, "Writing of case summary failed with error %@", buf, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v13 = diagcaseLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Case summary file name is nil", buf, 2u);
        }
      }

      goto LABEL_22;
    }
    uint64_t v7 = diagcaseLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v5;
    uint64_t v8 = "Pretty case summary is empty (case summary dict = %@)";
    id v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
LABEL_4:
    _os_log_impl(&dword_209DBA000, v9, v10, v8, buf, v11);
    goto LABEL_22;
  }
  id v5 = diagcaseLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(DiagnosticCase *)self caseId];
    uint64_t v7 = [(DiagnosticCase *)self caseDampeningTypeString];
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    uint64_t v8 = "Skip creating a case summary for %{public}@ (dampening = %@)";
    id v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    uint32_t v11 = 22;
    goto LABEL_4;
  }
LABEL_24:
}

- (void)fixupCaseSummaryFile:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 UTF8String];
  if (v4)
  {
    id v5 = (const char *)v4;
    id v6 = +[ABCAdministrator sharedInstance];
    uint64_t v7 = [v6 configurationManager];

    if (chown(v5, [v7 logArchiveUID], [v7 logArchiveGID]))
    {
      uint64_t v8 = diagcaseLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uid_t v9 = getuid();
        gid_t v10 = getgid();
        int v11 = *__error();
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = v5;
        __int16 v36 = 1024;
        *(_DWORD *)uint64_t v37 = v9;
        *(_WORD *)&v37[4] = 1024;
        *(_DWORD *)&v37[6] = v10;
        LOWORD(v38[0]) = 1024;
        *(_DWORD *)((char *)v38 + 2) = v11;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "failed to chown for file: %s, uid: %u, gid: %u  %{errno}d", buf, 0x1Eu);
      }
    }
    ssize_t v12 = listxattr(v5, 0, 0, 1);
    uint64_t v13 = (char *)malloc_type_malloc(v12, 0xD3B3FCCuLL);
    if (v13)
    {
      __int16 v14 = v13;
      uint64_t v15 = (void *)listxattr(v5, v13, v12, 1);
      id v27 = v7;
      id v28 = v3;
      if (v15)
      {
        id v16 = (void *)[[NSString alloc] initWithBytes:v14 length:v15 encoding:4];
        uint64_t v15 = [v16 componentsSeparatedByString:&stru_26BDE7350];
      }
      free(v14);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (objc_msgSend(v22, "length", v27, v28))
            {
              __int16 v23 = (const char *)[v22 UTF8String];
              if (v23)
              {
                uint64_t v24 = v23;
                if (removexattr(v5, v23, 1))
                {
                  uint64_t v25 = diagcaseLogHandle();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                  {
                    int v26 = *__error();
                    *(_DWORD *)buf = 136315650;
                    uint64_t v35 = v24;
                    __int16 v36 = 2080;
                    *(void *)uint64_t v37 = v5;
                    *(_WORD *)&v37[8] = 1024;
                    v38[0] = v26;
                    _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_ERROR, "failed to removexattr %s for file: %s, %{errno}d", buf, 0x1Cu);
                  }
                }
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v19);
      }

      uint64_t v7 = v27;
      id v3 = v28;
    }
  }
  else
  {
    uint64_t v7 = diagcaseLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (const char *)v3;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "failed to get UTF8 string for %@", buf, 0xCu);
    }
  }
}

- (void)recordDiagnosticCaseSummary
{
  id v3 = [(DiagnosticCase *)self manager];
  uint64_t v4 = [v3 configManager];
  int v5 = [v4 caseSummaryEnabled];

  if (v5)
  {
    id v6 = [(DiagnosticCase *)self manager];
    [v6 recordDiagnosticCaseSummaryForCase:self];
  }
}

- (BOOL)sendReports
{
  id v3 = [(DiagnosticCase *)self caseStorage];
  int v4 = [v3 caseState];

  if (v4 == 5)
  {
    int v5 = [(DiagnosticCase *)self manager];
    char v6 = [v5 sendReportsForCase:self];
  }
  else
  {
    char v6 = 1;
  }
  [(DiagnosticCase *)self setCaseState:6];
  return v6;
}

- (void)prepareForSaving
{
  id v3 = [(DiagnosticCase *)self manager];
  int v4 = [v3 configManager];
  int v5 = [v4 autoBugCaptureRegularPayloads];

  if (v5) {
    [(DiagnosticCase *)self serializePayloadsToDiagnosticCaseStorage];
  }
  [(DiagnosticCase *)self serializeAttachmentsToDiagnosticCaseStorage];

  [(DiagnosticCase *)self serializeEventsToDiagnosticCaseStorage];
}

- (BOOL)_parseSignatureIntoCaseStorage:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(DiagnosticCase *)self caseStorage],
        int v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    char v6 = [v4 objectForKeyedSubscript:@"domain"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [(DiagnosticCase *)self caseStorage];
        [v7 setCaseDomain:v6];
      }
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"type"];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uid_t v9 = [(DiagnosticCase *)self caseStorage];
        [v9 setCaseType:v8];
      }
    }
    gid_t v10 = [v4 objectForKeyedSubscript:@"subtype"];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = [(DiagnosticCase *)self caseStorage];
        [v11 setCaseSubtype:v10];
      }
    }
    ssize_t v12 = [v4 objectForKeyedSubscript:@"additional"];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [(DiagnosticCase *)self caseStorage];
        [v13 setCaseSubtypeContext:v12];
      }
    }
    __int16 v14 = [v4 objectForKeyedSubscript:@"detected"];

    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [(DiagnosticCase *)self caseStorage];
        [v15 setCaseDetectedProcess:v14];
      }
    }
    id v16 = [v4 objectForKeyedSubscript:@"effective"];

    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = [(DiagnosticCase *)self caseStorage];
        [v17 setCaseEffectiveProcess:v16];
      }
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"related"];

    if (v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = [(DiagnosticCase *)self caseStorage];
        [v19 setCaseRelatedProcesses:v18];
      }
    }
    uint64_t v20 = [v4 objectForKeyedSubscript:@"threshval"];

    if (v20)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [(DiagnosticCase *)self caseStorage];
        [v21 setCaseThresholdValues:v20];
      }
    }
    id v22 = [v4 objectForKeyedSubscript:@"context"];

    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v23 = [(DiagnosticCase *)self caseStorage];
        [v23 setCaseContext:v22];
      }
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"groupID"];

    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = [(DiagnosticCase *)self caseStorage];
        [v25 setCaseGroupID:v24];
      }
    }

    BOOL v26 = 1;
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)_parseCaseStorageIntoSignature:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(DiagnosticCase *)self caseStorage],
        int v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    char v6 = [(DiagnosticCase *)self caseStorage];
    uint64_t v7 = [v6 caseDomain];

    if (v7)
    {
      uint64_t v8 = [(DiagnosticCase *)self caseStorage];
      uid_t v9 = [v8 caseDomain];
      [v4 setObject:v9 forKeyedSubscript:@"domain"];
    }
    gid_t v10 = [(DiagnosticCase *)self caseStorage];
    int v11 = [v10 caseType];

    if (v11)
    {
      ssize_t v12 = [(DiagnosticCase *)self caseStorage];
      uint64_t v13 = [v12 caseType];
      [v4 setObject:v13 forKeyedSubscript:@"type"];
    }
    __int16 v14 = [(DiagnosticCase *)self caseStorage];
    uint64_t v15 = [v14 caseSubtype];

    if (v15)
    {
      id v16 = [(DiagnosticCase *)self caseStorage];
      id v17 = [v16 caseSubtype];
      [v4 setObject:v17 forKeyedSubscript:@"subtype"];
    }
    uint64_t v18 = [(DiagnosticCase *)self caseStorage];
    uint64_t v19 = [v18 caseSubtypeContext];

    if (v19)
    {
      uint64_t v20 = [(DiagnosticCase *)self caseStorage];
      uint64_t v21 = [v20 caseSubtypeContext];
      [v4 setObject:v21 forKeyedSubscript:@"additional"];
    }
    id v22 = [(DiagnosticCase *)self caseStorage];
    __int16 v23 = [v22 caseDetectedProcess];

    if (v23)
    {
      uint64_t v24 = [(DiagnosticCase *)self caseStorage];
      uint64_t v25 = [v24 caseDetectedProcess];
      [v4 setObject:v25 forKeyedSubscript:@"detected"];
    }
    BOOL v26 = [(DiagnosticCase *)self caseStorage];
    id v27 = [v26 caseEffectiveProcess];

    if (v27)
    {
      id v28 = [(DiagnosticCase *)self caseStorage];
      long long v29 = [v28 caseEffectiveProcess];
      [v4 setObject:v29 forKeyedSubscript:@"effective"];
    }
    long long v30 = [(DiagnosticCase *)self caseStorage];
    long long v31 = [v30 caseRelatedProcesses];

    if (v31)
    {
      long long v32 = [(DiagnosticCase *)self caseStorage];
      uint64_t v33 = [v32 caseRelatedProcesses];
      [v4 setObject:v33 forKeyedSubscript:@"related"];
    }
    uint64_t v34 = [(DiagnosticCase *)self caseStorage];
    uint64_t v35 = [v34 caseThresholdValues];

    if (v35)
    {
      __int16 v36 = [(DiagnosticCase *)self caseStorage];
      uint64_t v37 = [v36 caseThresholdValues];
      [v4 setObject:v37 forKeyedSubscript:@"threshval"];
    }
    char v38 = [(DiagnosticCase *)self caseStorage];
    uint64_t v39 = [v38 caseContext];

    if (v39)
    {
      id v40 = [(DiagnosticCase *)self caseStorage];
      __int16 v41 = [v40 caseContext];
      [v4 setObject:v41 forKeyedSubscript:@"context"];
    }
    id v42 = [(DiagnosticCase *)self caseStorage];
    __int16 v43 = [v42 caseGroupID];

    if (v43)
    {
      id v44 = [(DiagnosticCase *)self caseStorage];
      uint64_t v45 = [v44 caseGroupID];
      [v4 setObject:v45 forKeyedSubscript:@"groupID"];
    }
    BOOL v46 = 1;
  }
  else
  {
    BOOL v46 = 0;
  }

  return v46;
}

+ (id)signatureForCaseStorage:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = [v3 caseDomain];

    if (v7)
    {
      uint64_t v8 = [v3 caseDomain];
      uid_t v9 = (void *)[v8 copy];
      [v5 setObject:v9 forKeyedSubscript:@"domain"];
    }
    gid_t v10 = [v3 caseType];

    if (v10)
    {
      int v11 = [v3 caseType];
      ssize_t v12 = (void *)[v11 copy];
      [v5 setObject:v12 forKeyedSubscript:@"type"];
    }
    uint64_t v13 = [v3 caseSubtype];

    if (v13)
    {
      __int16 v14 = [v3 caseSubtype];
      uint64_t v15 = (void *)[v14 copy];
      [v5 setObject:v15 forKeyedSubscript:@"subtype"];
    }
    id v16 = [v3 caseSubtypeContext];

    if (v16)
    {
      id v17 = [v3 caseSubtypeContext];
      uint64_t v18 = (void *)[v17 copy];
      [v5 setObject:v18 forKeyedSubscript:@"additional"];
    }
    uint64_t v19 = [v3 caseDetectedProcess];

    if (v19)
    {
      uint64_t v20 = [v3 caseDetectedProcess];
      uint64_t v21 = (void *)[v20 copy];
      [v5 setObject:v21 forKeyedSubscript:@"detected"];
    }
    id v22 = [v3 caseEffectiveProcess];

    if (v22)
    {
      __int16 v23 = [v3 caseEffectiveProcess];
      uint64_t v24 = (void *)[v23 copy];
      [v5 setObject:v24 forKeyedSubscript:@"effective"];
    }
    uint64_t v25 = [v3 caseRelatedProcesses];

    if (v25)
    {
      BOOL v26 = [v3 caseRelatedProcesses];
      id v27 = (void *)[v26 copy];
      [v5 setObject:v27 forKeyedSubscript:@"related"];
    }
    id v28 = [v3 caseThresholdValues];

    if (v28)
    {
      long long v29 = [v3 caseThresholdValues];
      long long v30 = (void *)[v29 copy];
      [v5 setObject:v30 forKeyedSubscript:@"threshval"];
    }
    long long v31 = [v3 caseContext];

    if (v31)
    {
      long long v32 = [v3 caseContext];
      uint64_t v33 = (void *)[v32 copy];
      [v5 setObject:v33 forKeyedSubscript:@"context"];
    }
    uint64_t v34 = [v3 caseGroupID];

    if (v34)
    {
      uint64_t v35 = [v3 caseGroupID];
      __int16 v36 = (void *)[v35 copy];
      [v5 setObject:v36 forKeyedSubscript:@"groupID"];
    }
    id v6 = v5;
  }

  return v6;
}

+ (id)signatureForCaseStorageDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"caseDomain"];

    if (v7)
    {
      uint64_t v8 = [v3 objectForKeyedSubscript:@"caseDomain"];
      uid_t v9 = (void *)[v8 copy];
      [v5 setObject:v9 forKeyedSubscript:@"domain"];
    }
    gid_t v10 = [v3 objectForKeyedSubscript:@"caseType"];

    if (v10)
    {
      int v11 = [v3 objectForKeyedSubscript:@"caseType"];
      ssize_t v12 = (void *)[v11 copy];
      [v5 setObject:v12 forKeyedSubscript:@"type"];
    }
    uint64_t v13 = [v3 objectForKeyedSubscript:@"caseSubtype"];

    if (v13)
    {
      __int16 v14 = [v3 objectForKeyedSubscript:@"caseSubtype"];
      uint64_t v15 = (void *)[v14 copy];
      [v5 setObject:v15 forKeyedSubscript:@"subtype"];
    }
    id v16 = [v3 objectForKeyedSubscript:@"caseSubtypeContext"];

    if (v16)
    {
      id v17 = [v3 objectForKeyedSubscript:@"caseSubtypeContext"];
      uint64_t v18 = (void *)[v17 copy];
      [v5 setObject:v18 forKeyedSubscript:@"additional"];
    }
    uint64_t v19 = [v3 objectForKeyedSubscript:@"caseDetectedProcess"];

    if (v19)
    {
      uint64_t v20 = [v3 objectForKeyedSubscript:@"caseDetectedProcess"];
      uint64_t v21 = (void *)[v20 copy];
      [v5 setObject:v21 forKeyedSubscript:@"detected"];
    }
    id v22 = [v3 objectForKeyedSubscript:@"caseEffectiveProcess"];

    if (v22)
    {
      __int16 v23 = [v3 objectForKeyedSubscript:@"caseEffectiveProcess"];
      uint64_t v24 = (void *)[v23 copy];
      [v5 setObject:v24 forKeyedSubscript:@"effective"];
    }
    uint64_t v25 = [v3 objectForKeyedSubscript:@"caseRelatedProcesses"];

    if (v25)
    {
      BOOL v26 = [v3 objectForKeyedSubscript:@"caseRelatedProcesses"];
      id v27 = (void *)[v26 copy];
      [v5 setObject:v27 forKeyedSubscript:@"related"];
    }
    id v28 = [v3 objectForKeyedSubscript:@"caseThresholdValues"];

    if (v28)
    {
      long long v29 = [v3 objectForKeyedSubscript:@"caseThresholdValues"];
      long long v30 = (void *)[v29 copy];
      [v5 setObject:v30 forKeyedSubscript:@"threshval"];
    }
    long long v31 = [v3 objectForKeyedSubscript:@"caseContext"];

    if (v31)
    {
      long long v32 = [v3 objectForKeyedSubscript:@"caseContext"];
      uint64_t v33 = (void *)[v32 copy];
      [v5 setObject:v33 forKeyedSubscript:@"context"];
    }
    uint64_t v34 = [v3 objectForKeyedSubscript:@"caseGroupID"];

    if (v34)
    {
      uint64_t v35 = [v3 objectForKeyedSubscript:@"caseGroupID"];
      __int16 v36 = (void *)[v35 copy];
      [v5 setObject:v36 forKeyedSubscript:@"groupID"];
    }
    id v6 = v5;
  }

  return v6;
}

+ (id)descriptionForClosureType:(signed __int16)a3
{
  if (a3 >= 6) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"ClosureTypeUnknown: %d", a3);
  }
  else {
    id v3 = off_263FC5028[a3];
  }

  return v3;
}

+ (id)descriptionForDampeningType:(signed __int16)a3
{
  uint64_t v3 = a3 + 2;
  if (v3 >= 0xB) {
    id v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"DampeningTypeUnknown: %d", a3);
  }
  else {
    id v4 = off_263FC5058[v3];
  }

  return v4;
}

- (void)markAttachmentsAsPurgeable:(BOOL)a3 urgency:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0x10000;
  if (!a3) {
    uint64_t v5 = 0;
  }
  unint64_t v23 = v5 | a4 | 5;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [(DiagnosticCase *)self attachments];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v28 count:16];
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
        ssize_t v12 = (void *)[objc_alloc(NSURL) initWithString:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        uint64_t v13 = [v12 path];
        int v14 = [v6 fileExistsAtPath:v13];

        if (v14)
        {
          id v15 = v12;
          int v16 = fsctl((const char *)[v15 fileSystemRepresentation], 0xC0084A44uLL, &v23, 0);
          if (v16)
          {
            int v17 = v16;
            uint64_t v18 = storageLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v25 = v15;
              __int16 v26 = 1024;
              int v27 = v17;
              _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, "Failed to mark ABC file purgeable: %{public}@, %{errno}d", buf, 0x12u);
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v9);
  }
}

- (DiagnosticCaseStorage)caseStorage
{
  return self->_caseStorage;
}

- (NSMutableArray)caseReports
{
  return self->_caseReports;
}

- (NSMutableArray)caseOutlets
{
  return self->_caseOutlets;
}

- (NSMutableDictionary)signature
{
  return self->_signature;
}

- (NSDictionary)requiredAttachments
{
  return &self->_requiredAttachments->super;
}

- (NSMutableArray)events
{
  return self->_events;
}

- (NSMutableArray)payloads
{
  return self->_payloads;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (NSString)caseSummaryFilepath
{
  return self->_caseSummaryFilepath;
}

- (void)setCaseSummaryFilepath:(id)a3
{
}

- (unint64_t)attachmentsFileSize
{
  return self->_attachmentsFileSize;
}

- (unint64_t)caseFlags
{
  return self->_caseFlags;
}

- (void)setCaseFlags:(unint64_t)a3
{
  self->_caseFlags = a3;
}

- (double)preferredDuration
{
  return self->_preferredDuration;
}

- (void)setPreferredDuration:(double)a3
{
  self->_preferredDuration = a3;
}

- (BOOL)readyToEndSession
{
  return self->_readyToEndSession;
}

- (void)setReadyToEndSession:(BOOL)a3
{
  self->_readyToEndSession = a3;
}

- (DiagnosticCaseManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NSMutableDictionary)attachmentsWithSize
{
  return self->_attachmentsWithSize;
}

- (void)setAttachmentsWithSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsWithSize, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_caseSummaryFilepath, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_caseOutlets, 0);
  objc_storeStrong((id *)&self->_caseReports, 0);
  objc_storeStrong((id *)&self->_caseStorage, 0);
  objc_storeStrong((id *)&self->_caseId, 0);
  objc_storeStrong((id *)&self->_requiredAttachments, 0);

  objc_storeStrong((id *)&self->_requiredActions, 0);
}

@end