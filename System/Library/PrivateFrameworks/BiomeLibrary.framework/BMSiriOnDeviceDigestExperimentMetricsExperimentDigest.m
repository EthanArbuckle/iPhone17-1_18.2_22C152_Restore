@interface BMSiriOnDeviceDigestExperimentMetricsExperimentDigest
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithSystemBuild:(id)a3 dataSharingOptInStatus:(id)a4 viewInterface:(id)a5 audioInterfaceVendorId:(id)a6 audioInterfaceProductId:(id)a7 asrLocation:(id)a8 nlLocation:(id)a9 siriInputLocale:(id)a10 subDomain:(id)a11 responseCategory:(id)a12 experimentAllocationStatus:(id)a13 isTriggered:(id)a14 isFirstTriggerOrAfterFirstTrigger:(id)a15 codePathIdUUID:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 usdxSessionCount:(id)a30 tuples:(id)a31;
- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithSystemBuild:(id)a3 dataSharingOptInStatus:(id)a4 viewInterface:(id)a5 audioInterfaceVendorId:(id)a6 audioInterfaceProductId:(id)a7 asrLocation:(id)a8 nlLocation:(id)a9 siriInputLocale:(id)a10 subDomain:(id)a11 responseCategory:(id)a12 experimentAllocationStatus:(id)a13 isTriggered:(id)a14 isFirstTriggerOrAfterFirstTrigger:(id)a15 codePathIdUUID:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 usdxSessionCount:(id)a30 tuples:(id)a31 isIntelligenceEngineRequest:(id)a32 intelligenceEngineRouting:(id)a33 invocationSource:(id)a34;
- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)tuples;
- (BMSiriOnDeviceDigestExperimentMetricsISOLocale)siriInputLocale;
- (BOOL)hasAsrLocation;
- (BOOL)hasClientErrorCount;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasExperimentAllocationStatus;
- (BOOL)hasFailureResponseCount;
- (BOOL)hasFatalResponseCount;
- (BOOL)hasFlowTasksCompleted;
- (BOOL)hasFlowTasksStarted;
- (BOOL)hasInvocationSource;
- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger;
- (BOOL)hasIsIntelligenceEngineRequest;
- (BOOL)hasIsTriggered;
- (BOOL)hasNlLocation;
- (BOOL)hasReliabilityRequestCount;
- (BOOL)hasReliabilityTurnCount;
- (BOOL)hasResponseCategory;
- (BOOL)hasSiriTasksCompleted;
- (BOOL)hasSiriTasksStarted;
- (BOOL)hasSiriUnavailableResponseCount;
- (BOOL)hasTotalTurnCount;
- (BOOL)hasUndesiredResponseCount;
- (BOOL)hasUsdxSessionCount;
- (BOOL)hasValidTurnCount;
- (BOOL)hasViewInterface;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstTriggerOrAfterFirstTrigger;
- (BOOL)isIntelligenceEngineRequest;
- (BOOL)isTriggered;
- (NSArray)intelligenceEngineRouting;
- (NSString)audioInterfaceProductId;
- (NSString)audioInterfaceVendorId;
- (NSString)codePathIdUUID;
- (NSString)description;
- (NSString)subDomain;
- (NSString)systemBuild;
- (id)_intelligenceEngineRoutingJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)asrLocation;
- (int)dataSharingOptInStatus;
- (int)experimentAllocationStatus;
- (int)nlLocation;
- (int)responseCategory;
- (int)viewInterface;
- (unsigned)clientErrorCount;
- (unsigned)dataVersion;
- (unsigned)failureResponseCount;
- (unsigned)fatalResponseCount;
- (unsigned)flowTasksCompleted;
- (unsigned)flowTasksStarted;
- (unsigned)invocationSource;
- (unsigned)reliabilityRequestCount;
- (unsigned)reliabilityTurnCount;
- (unsigned)siriTasksCompleted;
- (unsigned)siriTasksStarted;
- (unsigned)siriUnavailableResponseCount;
- (unsigned)totalTurnCount;
- (unsigned)undesiredResponseCount;
- (unsigned)usdxSessionCount;
- (unsigned)validTurnCount;
- (void)setHasAsrLocation:(BOOL)a3;
- (void)setHasClientErrorCount:(BOOL)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasExperimentAllocationStatus:(BOOL)a3;
- (void)setHasFailureResponseCount:(BOOL)a3;
- (void)setHasFatalResponseCount:(BOOL)a3;
- (void)setHasFlowTasksCompleted:(BOOL)a3;
- (void)setHasFlowTasksStarted:(BOOL)a3;
- (void)setHasInvocationSource:(BOOL)a3;
- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3;
- (void)setHasIsIntelligenceEngineRequest:(BOOL)a3;
- (void)setHasIsTriggered:(BOOL)a3;
- (void)setHasNlLocation:(BOOL)a3;
- (void)setHasReliabilityRequestCount:(BOOL)a3;
- (void)setHasReliabilityTurnCount:(BOOL)a3;
- (void)setHasResponseCategory:(BOOL)a3;
- (void)setHasSiriTasksCompleted:(BOOL)a3;
- (void)setHasSiriTasksStarted:(BOOL)a3;
- (void)setHasSiriUnavailableResponseCount:(BOOL)a3;
- (void)setHasTotalTurnCount:(BOOL)a3;
- (void)setHasUndesiredResponseCount:(BOOL)a3;
- (void)setHasUsdxSessionCount:(BOOL)a3;
- (void)setHasValidTurnCount:(BOOL)a3;
- (void)setHasViewInterface:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestExperimentMetricsExperimentDigest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceEngineRouting, 0);
  objc_storeStrong((id *)&self->_tuples, 0);
  objc_storeStrong((id *)&self->_codePathIdUUID, 0);
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);

  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (void)setHasInvocationSource:(BOOL)a3
{
  self->_hasInvocationSource = a3;
}

- (BOOL)hasInvocationSource
{
  return self->_hasInvocationSource;
}

- (unsigned)invocationSource
{
  return self->_invocationSource;
}

- (NSArray)intelligenceEngineRouting
{
  return self->_intelligenceEngineRouting;
}

- (void)setHasIsIntelligenceEngineRequest:(BOOL)a3
{
  self->_hasIsIntelligenceEngineRequest = a3;
}

- (BOOL)hasIsIntelligenceEngineRequest
{
  return self->_hasIsIntelligenceEngineRequest;
}

- (BOOL)isIntelligenceEngineRequest
{
  return self->_isIntelligenceEngineRequest;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples)tuples
{
  return self->_tuples;
}

- (void)setHasUsdxSessionCount:(BOOL)a3
{
  self->_hasUsdxSessionCount = a3;
}

- (BOOL)hasUsdxSessionCount
{
  return self->_hasUsdxSessionCount;
}

- (unsigned)usdxSessionCount
{
  return self->_usdxSessionCount;
}

- (void)setHasSiriUnavailableResponseCount:(BOOL)a3
{
  self->_hasSiriUnavailableResponseCount = a3;
}

- (BOOL)hasSiriUnavailableResponseCount
{
  return self->_hasSiriUnavailableResponseCount;
}

- (unsigned)siriUnavailableResponseCount
{
  return self->_siriUnavailableResponseCount;
}

- (void)setHasFailureResponseCount:(BOOL)a3
{
  self->_hasFailureResponseCount = a3;
}

- (BOOL)hasFailureResponseCount
{
  return self->_hasFailureResponseCount;
}

- (unsigned)failureResponseCount
{
  return self->_failureResponseCount;
}

- (void)setHasFatalResponseCount:(BOOL)a3
{
  self->_hasFatalResponseCount = a3;
}

- (BOOL)hasFatalResponseCount
{
  return self->_hasFatalResponseCount;
}

- (unsigned)fatalResponseCount
{
  return self->_fatalResponseCount;
}

- (void)setHasUndesiredResponseCount:(BOOL)a3
{
  self->_hasUndesiredResponseCount = a3;
}

- (BOOL)hasUndesiredResponseCount
{
  return self->_hasUndesiredResponseCount;
}

- (unsigned)undesiredResponseCount
{
  return self->_undesiredResponseCount;
}

- (void)setHasClientErrorCount:(BOOL)a3
{
  self->_hasClientErrorCount = a3;
}

- (BOOL)hasClientErrorCount
{
  return self->_hasClientErrorCount;
}

- (unsigned)clientErrorCount
{
  return self->_clientErrorCount;
}

- (void)setHasReliabilityTurnCount:(BOOL)a3
{
  self->_hasReliabilityTurnCount = a3;
}

- (BOOL)hasReliabilityTurnCount
{
  return self->_hasReliabilityTurnCount;
}

- (unsigned)reliabilityTurnCount
{
  return self->_reliabilityTurnCount;
}

- (void)setHasReliabilityRequestCount:(BOOL)a3
{
  self->_hasReliabilityRequestCount = a3;
}

- (BOOL)hasReliabilityRequestCount
{
  return self->_hasReliabilityRequestCount;
}

- (unsigned)reliabilityRequestCount
{
  return self->_reliabilityRequestCount;
}

- (void)setHasFlowTasksCompleted:(BOOL)a3
{
  self->_hasFlowTasksCompleted = a3;
}

- (BOOL)hasFlowTasksCompleted
{
  return self->_hasFlowTasksCompleted;
}

- (unsigned)flowTasksCompleted
{
  return self->_flowTasksCompleted;
}

- (void)setHasFlowTasksStarted:(BOOL)a3
{
  self->_hasFlowTasksStarted = a3;
}

- (BOOL)hasFlowTasksStarted
{
  return self->_hasFlowTasksStarted;
}

- (unsigned)flowTasksStarted
{
  return self->_flowTasksStarted;
}

- (void)setHasSiriTasksCompleted:(BOOL)a3
{
  self->_hasSiriTasksCompleted = a3;
}

- (BOOL)hasSiriTasksCompleted
{
  return self->_hasSiriTasksCompleted;
}

- (unsigned)siriTasksCompleted
{
  return self->_siriTasksCompleted;
}

- (void)setHasSiriTasksStarted:(BOOL)a3
{
  self->_hasSiriTasksStarted = a3;
}

- (BOOL)hasSiriTasksStarted
{
  return self->_hasSiriTasksStarted;
}

- (unsigned)siriTasksStarted
{
  return self->_siriTasksStarted;
}

- (void)setHasValidTurnCount:(BOOL)a3
{
  self->_hasValidTurnCount = a3;
}

- (BOOL)hasValidTurnCount
{
  return self->_hasValidTurnCount;
}

- (unsigned)validTurnCount
{
  return self->_validTurnCount;
}

- (void)setHasTotalTurnCount:(BOOL)a3
{
  self->_hasTotalTurnCount = a3;
}

- (BOOL)hasTotalTurnCount
{
  return self->_hasTotalTurnCount;
}

- (unsigned)totalTurnCount
{
  return self->_totalTurnCount;
}

- (NSString)codePathIdUUID
{
  return self->_codePathIdUUID;
}

- (void)setHasIsFirstTriggerOrAfterFirstTrigger:(BOOL)a3
{
  self->_hasIsFirstTriggerOrAfterFirstTrigger = a3;
}

- (BOOL)hasIsFirstTriggerOrAfterFirstTrigger
{
  return self->_hasIsFirstTriggerOrAfterFirstTrigger;
}

- (BOOL)isFirstTriggerOrAfterFirstTrigger
{
  return self->_isFirstTriggerOrAfterFirstTrigger;
}

- (void)setHasIsTriggered:(BOOL)a3
{
  self->_hasIsTriggered = a3;
}

- (BOOL)hasIsTriggered
{
  return self->_hasIsTriggered;
}

- (BOOL)isTriggered
{
  return self->_isTriggered;
}

- (void)setHasExperimentAllocationStatus:(BOOL)a3
{
  self->_hasExperimentAllocationStatus = a3;
}

- (BOOL)hasExperimentAllocationStatus
{
  return self->_hasExperimentAllocationStatus;
}

- (int)experimentAllocationStatus
{
  return self->_experimentAllocationStatus;
}

- (void)setHasResponseCategory:(BOOL)a3
{
  self->_hasResponseCategory = a3;
}

- (BOOL)hasResponseCategory
{
  return self->_hasResponseCategory;
}

- (int)responseCategory
{
  return self->_responseCategory;
}

- (NSString)subDomain
{
  return self->_subDomain;
}

- (BMSiriOnDeviceDigestExperimentMetricsISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (void)setHasNlLocation:(BOOL)a3
{
  self->_hasNlLocation = a3;
}

- (BOOL)hasNlLocation
{
  return self->_hasNlLocation;
}

- (int)nlLocation
{
  return self->_nlLocation;
}

- (void)setHasAsrLocation:(BOOL)a3
{
  self->_hasAsrLocation = a3;
}

- (BOOL)hasAsrLocation
{
  return self->_hasAsrLocation;
}

- (int)asrLocation
{
  return self->_asrLocation;
}

- (NSString)audioInterfaceProductId
{
  return self->_audioInterfaceProductId;
}

- (NSString)audioInterfaceVendorId
{
  return self->_audioInterfaceVendorId;
}

- (void)setHasViewInterface:(BOOL)a3
{
  self->_hasViewInterface = a3;
}

- (BOOL)hasViewInterface
{
  return self->_hasViewInterface;
}

- (int)viewInterface
{
  return self->_viewInterface;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  self->_hasDataSharingOptInStatus = a3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return self->_hasDataSharingOptInStatus;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self systemBuild];
    uint64_t v7 = [v5 systemBuild];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self systemBuild];
      v10 = [v5 systemBuild];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasDataSharingOptInStatus](self, "hasDataSharingOptInStatus")|| [v5 hasDataSharingOptInStatus])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasDataSharingOptInStatus])goto LABEL_155; {
      if (![v5 hasDataSharingOptInStatus])
      }
        goto LABEL_155;
      int v13 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self dataSharingOptInStatus];
      if (v13 != [v5 dataSharingOptInStatus]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasViewInterface]
      || [v5 hasViewInterface])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasViewInterface]) {
        goto LABEL_155;
      }
      if (![v5 hasViewInterface]) {
        goto LABEL_155;
      }
      int v14 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self viewInterface];
      if (v14 != [v5 viewInterface]) {
        goto LABEL_155;
      }
    }
    v15 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceVendorId];
    uint64_t v16 = [v5 audioInterfaceVendorId];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      v17 = (void *)v16;
      v18 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceVendorId];
      v19 = [v5 audioInterfaceVendorId];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_155;
      }
    }
    v21 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceProductId];
    uint64_t v22 = [v5 audioInterfaceProductId];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceProductId];
      v25 = [v5 audioInterfaceProductId];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasAsrLocation]
      || [v5 hasAsrLocation])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasAsrLocation]) {
        goto LABEL_155;
      }
      if (![v5 hasAsrLocation]) {
        goto LABEL_155;
      }
      int v27 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self asrLocation];
      if (v27 != [v5 asrLocation]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasNlLocation]
      || [v5 hasNlLocation])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasNlLocation]) {
        goto LABEL_155;
      }
      if (![v5 hasNlLocation]) {
        goto LABEL_155;
      }
      int v28 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self nlLocation];
      if (v28 != [v5 nlLocation]) {
        goto LABEL_155;
      }
    }
    v29 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriInputLocale];
    uint64_t v30 = [v5 siriInputLocale];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriInputLocale];
      v33 = [v5 siriInputLocale];
      int v34 = [v32 isEqual:v33];

      if (!v34) {
        goto LABEL_155;
      }
    }
    v35 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self subDomain];
    uint64_t v36 = [v5 subDomain];
    if (v35 == (void *)v36)
    {
    }
    else
    {
      v37 = (void *)v36;
      v38 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self subDomain];
      v39 = [v5 subDomain];
      int v40 = [v38 isEqual:v39];

      if (!v40) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasResponseCategory]
      || [v5 hasResponseCategory])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasResponseCategory]) {
        goto LABEL_155;
      }
      if (![v5 hasResponseCategory]) {
        goto LABEL_155;
      }
      int v41 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self responseCategory];
      if (v41 != [v5 responseCategory]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasExperimentAllocationStatus](self, "hasExperimentAllocationStatus")|| [v5 hasExperimentAllocationStatus])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasExperimentAllocationStatus])goto LABEL_155; {
      if (![v5 hasExperimentAllocationStatus])
      }
        goto LABEL_155;
      int v42 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self experimentAllocationStatus];
      if (v42 != [v5 experimentAllocationStatus]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsTriggered]
      || [v5 hasIsTriggered])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsTriggered]) {
        goto LABEL_155;
      }
      if (![v5 hasIsTriggered]) {
        goto LABEL_155;
      }
      int v43 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self isTriggered];
      if (v43 != [v5 isTriggered]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsFirstTriggerOrAfterFirstTrigger](self, "hasIsFirstTriggerOrAfterFirstTrigger")|| [v5 hasIsFirstTriggerOrAfterFirstTrigger])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsFirstTriggerOrAfterFirstTrigger])goto LABEL_155; {
      if (![v5 hasIsFirstTriggerOrAfterFirstTrigger])
      }
        goto LABEL_155;
      int v44 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self isFirstTriggerOrAfterFirstTrigger];
      if (v44 != [v5 isFirstTriggerOrAfterFirstTrigger]) {
        goto LABEL_155;
      }
    }
    v45 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self codePathIdUUID];
    uint64_t v46 = [v5 codePathIdUUID];
    if (v45 == (void *)v46)
    {
    }
    else
    {
      v47 = (void *)v46;
      v48 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self codePathIdUUID];
      v49 = [v5 codePathIdUUID];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasTotalTurnCount]
      || [v5 hasTotalTurnCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasTotalTurnCount]) {
        goto LABEL_155;
      }
      if (![v5 hasTotalTurnCount]) {
        goto LABEL_155;
      }
      unsigned int v51 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self totalTurnCount];
      if (v51 != [v5 totalTurnCount]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasValidTurnCount]
      || [v5 hasValidTurnCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasValidTurnCount]) {
        goto LABEL_155;
      }
      if (![v5 hasValidTurnCount]) {
        goto LABEL_155;
      }
      unsigned int v52 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self validTurnCount];
      if (v52 != [v5 validTurnCount]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriTasksStarted]
      || [v5 hasSiriTasksStarted])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriTasksStarted]) {
        goto LABEL_155;
      }
      if (![v5 hasSiriTasksStarted]) {
        goto LABEL_155;
      }
      unsigned int v53 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriTasksStarted];
      if (v53 != [v5 siriTasksStarted]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriTasksCompleted]
      || [v5 hasSiriTasksCompleted])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriTasksCompleted])goto LABEL_155; {
      if (![v5 hasSiriTasksCompleted])
      }
        goto LABEL_155;
      unsigned int v54 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriTasksCompleted];
      if (v54 != [v5 siriTasksCompleted]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFlowTasksStarted]
      || [v5 hasFlowTasksStarted])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFlowTasksStarted]) {
        goto LABEL_155;
      }
      if (![v5 hasFlowTasksStarted]) {
        goto LABEL_155;
      }
      unsigned int v55 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self flowTasksStarted];
      if (v55 != [v5 flowTasksStarted]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFlowTasksCompleted]
      || [v5 hasFlowTasksCompleted])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFlowTasksCompleted])goto LABEL_155; {
      if (![v5 hasFlowTasksCompleted])
      }
        goto LABEL_155;
      unsigned int v56 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self flowTasksCompleted];
      if (v56 != [v5 flowTasksCompleted]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityRequestCount](self, "hasReliabilityRequestCount")|| [v5 hasReliabilityRequestCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasReliabilityRequestCount])goto LABEL_155; {
      if (![v5 hasReliabilityRequestCount])
      }
        goto LABEL_155;
      unsigned int v57 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self reliabilityRequestCount];
      if (v57 != [v5 reliabilityRequestCount]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasReliabilityTurnCount](self, "hasReliabilityTurnCount")|| [v5 hasReliabilityTurnCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasReliabilityTurnCount])goto LABEL_155; {
      if (![v5 hasReliabilityTurnCount])
      }
        goto LABEL_155;
      unsigned int v58 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self reliabilityTurnCount];
      if (v58 != [v5 reliabilityTurnCount]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasClientErrorCount]
      || [v5 hasClientErrorCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasClientErrorCount]) {
        goto LABEL_155;
      }
      if (![v5 hasClientErrorCount]) {
        goto LABEL_155;
      }
      unsigned int v59 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self clientErrorCount];
      if (v59 != [v5 clientErrorCount]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasUndesiredResponseCount](self, "hasUndesiredResponseCount")|| [v5 hasUndesiredResponseCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasUndesiredResponseCount])goto LABEL_155; {
      if (![v5 hasUndesiredResponseCount])
      }
        goto LABEL_155;
      unsigned int v60 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self undesiredResponseCount];
      if (v60 != [v5 undesiredResponseCount]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFatalResponseCount]
      || [v5 hasFatalResponseCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFatalResponseCount])goto LABEL_155; {
      if (![v5 hasFatalResponseCount])
      }
        goto LABEL_155;
      unsigned int v61 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self fatalResponseCount];
      if (v61 != [v5 fatalResponseCount]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasFailureResponseCount](self, "hasFailureResponseCount")|| [v5 hasFailureResponseCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFailureResponseCount])goto LABEL_155; {
      if (![v5 hasFailureResponseCount])
      }
        goto LABEL_155;
      unsigned int v62 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self failureResponseCount];
      if (v62 != [v5 failureResponseCount]) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasSiriUnavailableResponseCount](self, "hasSiriUnavailableResponseCount")|| [v5 hasSiriUnavailableResponseCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriUnavailableResponseCount])goto LABEL_155; {
      if (![v5 hasSiriUnavailableResponseCount])
      }
        goto LABEL_155;
      unsigned int v63 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriUnavailableResponseCount];
      if (v63 != [v5 siriUnavailableResponseCount]) {
        goto LABEL_155;
      }
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasUsdxSessionCount]
      || [v5 hasUsdxSessionCount])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasUsdxSessionCount]) {
        goto LABEL_155;
      }
      if (![v5 hasUsdxSessionCount]) {
        goto LABEL_155;
      }
      unsigned int v64 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self usdxSessionCount];
      if (v64 != [v5 usdxSessionCount]) {
        goto LABEL_155;
      }
    }
    v65 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self tuples];
    uint64_t v66 = [v5 tuples];
    if (v65 == (void *)v66)
    {
    }
    else
    {
      v67 = (void *)v66;
      v68 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self tuples];
      v69 = [v5 tuples];
      int v70 = [v68 isEqual:v69];

      if (!v70) {
        goto LABEL_155;
      }
    }
    if (-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest hasIsIntelligenceEngineRequest](self, "hasIsIntelligenceEngineRequest")|| [v5 hasIsIntelligenceEngineRequest])
    {
      if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsIntelligenceEngineRequest])goto LABEL_155; {
      if (![v5 hasIsIntelligenceEngineRequest])
      }
        goto LABEL_155;
      int v71 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self isIntelligenceEngineRequest];
      if (v71 != [v5 isIntelligenceEngineRequest]) {
        goto LABEL_155;
      }
    }
    v72 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self intelligenceEngineRouting];
    uint64_t v73 = [v5 intelligenceEngineRouting];
    if (v72 == (void *)v73)
    {
    }
    else
    {
      v74 = (void *)v73;
      v75 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self intelligenceEngineRouting];
      v76 = [v5 intelligenceEngineRouting];
      int v77 = [v75 isEqual:v76];

      if (!v77) {
        goto LABEL_155;
      }
    }
    if (![(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasInvocationSource]
      && ![v5 hasInvocationSource])
    {
      BOOL v12 = 1;
      goto LABEL_156;
    }
    if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasInvocationSource]
      && [v5 hasInvocationSource])
    {
      unsigned int v78 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self invocationSource];
      BOOL v12 = v78 == [v5 invocationSource];
LABEL_156:

      goto LABEL_157;
    }
LABEL_155:
    BOOL v12 = 0;
    goto LABEL_156;
  }
  BOOL v12 = 0;
LABEL_157:

  return v12;
}

- (id)jsonDictionary
{
  v105[32] = *MEMORY[0x1E4F143B8];
  v79 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self systemBuild];
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasDataSharingOptInStatus])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest dataSharingOptInStatus](self, "dataSharingOptInStatus"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasViewInterface])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest viewInterface](self, "viewInterface"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceVendorId];
  uint64_t v6 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceProductId];
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasAsrLocation])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest asrLocation](self, "asrLocation"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasNlLocation])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest nlLocation](self, "nlLocation"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  v9 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriInputLocale];
  v103 = [v9 jsonDictionary];

  v102 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self subDomain];
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasResponseCategory])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest responseCategory](self, "responseCategory"));
    id v101 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v101 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasExperimentAllocationStatus])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest experimentAllocationStatus](self, "experimentAllocationStatus"));
    id v100 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v100 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsTriggered])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isTriggered](self, "isTriggered"));
    id v99 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v99 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsFirstTriggerOrAfterFirstTrigger])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
    id v98 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v98 = 0;
  }
  v97 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self codePathIdUUID];
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasTotalTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest totalTurnCount](self, "totalTurnCount"));
    id v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v96 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasValidTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest validTurnCount](self, "validTurnCount"));
    id v95 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v95 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriTasksStarted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksStarted](self, "siriTasksStarted"));
    id v94 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v94 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriTasksCompleted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksCompleted](self, "siriTasksCompleted"));
    id v93 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v93 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFlowTasksStarted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksStarted](self, "flowTasksStarted"));
    id v92 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v92 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFlowTasksCompleted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksCompleted](self, "flowTasksCompleted"));
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v91 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasReliabilityRequestCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityRequestCount](self, "reliabilityRequestCount"));
    id v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v90 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasReliabilityTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityTurnCount](self, "reliabilityTurnCount"));
    id v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v89 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasClientErrorCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest clientErrorCount](self, "clientErrorCount"));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v88 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasUndesiredResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest undesiredResponseCount](self, "undesiredResponseCount"));
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v87 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFatalResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest fatalResponseCount](self, "fatalResponseCount"));
    id v86 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v86 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasFailureResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest failureResponseCount](self, "failureResponseCount"));
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v85 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasSiriUnavailableResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
    id v84 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v84 = 0;
  }
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasUsdxSessionCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest usdxSessionCount](self, "usdxSessionCount"));
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v83 = 0;
  }
  v10 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self tuples];
  v82 = [v10 jsonDictionary];

  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasIsIntelligenceEngineRequest])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isIntelligenceEngineRequest](self, "isIntelligenceEngineRequest"));
    id v81 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v81 = 0;
  }
  v80 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self _intelligenceEngineRoutingJSONArray];
  if ([(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self hasInvocationSource])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest invocationSource](self, "invocationSource"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  v104[0] = @"systemBuild";
  uint64_t v12 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  int v71 = (void *)v12;
  v105[0] = v12;
  v104[1] = @"dataSharingOptInStatus";
  uint64_t v13 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v70 = (void *)v13;
  v105[1] = v13;
  v104[2] = @"viewInterface";
  uint64_t v14 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v14;
  v105[2] = v14;
  v104[3] = @"audioInterfaceVendorId";
  uint64_t v15 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v15;
  v105[3] = v15;
  v104[4] = @"audioInterfaceProductId";
  uint64_t v16 = v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = (void *)v16;
  v105[4] = v16;
  v104[5] = @"asrLocation";
  uint64_t v17 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v66 = (void *)v17;
  v105[5] = v17;
  v104[6] = @"nlLocation";
  uint64_t v18 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = (void *)v18;
  v105[6] = v18;
  v104[7] = @"siriInputLocale";
  uint64_t v19 = (uint64_t)v103;
  if (!v103)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v105[7] = v19;
  v104[8] = @"subDomain";
  uint64_t v20 = (uint64_t)v102;
  if (!v102)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v105[8] = v20;
  v104[9] = @"responseCategory";
  uint64_t v21 = (uint64_t)v101;
  if (!v101)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v62 = (void *)v21;
  v105[9] = v21;
  v104[10] = @"experimentAllocationStatus";
  uint64_t v22 = (uint64_t)v100;
  if (!v100)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v74 = (void *)v22;
  v105[10] = v22;
  v104[11] = @"isTriggered";
  uint64_t v23 = (uint64_t)v99;
  if (!v99)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v73 = (void *)v23;
  v105[11] = v23;
  v104[12] = @"isFirstTriggerOrAfterFirstTrigger";
  uint64_t v24 = (uint64_t)v98;
  if (!v98)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v24;
  v105[12] = v24;
  v104[13] = @"codePathIdUUID";
  uint64_t v26 = (uint64_t)v97;
  if (!v97)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v61 = (void *)v26;
  v105[13] = v26;
  v104[14] = @"totalTurnCount";
  uint64_t v27 = (uint64_t)v96;
  if (!v96)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v60 = (void *)v27;
  v105[14] = v27;
  v104[15] = @"validTurnCount";
  uint64_t v28 = (uint64_t)v95;
  if (!v95)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v59 = (void *)v28;
  v105[15] = v28;
  v104[16] = @"siriTasksStarted";
  uint64_t v29 = (uint64_t)v94;
  if (!v94)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v58 = (void *)v29;
  v105[16] = v29;
  v104[17] = @"siriTasksCompleted";
  uint64_t v30 = (uint64_t)v93;
  if (!v93)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v57 = (void *)v30;
  v105[17] = v30;
  v104[18] = @"flowTasksStarted";
  uint64_t v31 = (uint64_t)v92;
  if (!v92)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v56 = (void *)v31;
  v105[18] = v31;
  v104[19] = @"flowTasksCompleted";
  uint64_t v32 = (uint64_t)v91;
  if (!v91)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v55 = (void *)v32;
  v105[19] = v32;
  v104[20] = @"reliabilityRequestCount";
  uint64_t v33 = (uint64_t)v90;
  if (!v90)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v54 = (void *)v33;
  v105[20] = v33;
  v104[21] = @"reliabilityTurnCount";
  uint64_t v34 = (uint64_t)v89;
  if (!v89)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v53 = (void *)v34;
  v105[21] = v34;
  v104[22] = @"clientErrorCount";
  uint64_t v35 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v76 = (void *)v6;
  unsigned int v52 = (void *)v35;
  v105[22] = v35;
  v104[23] = @"undesiredResponseCount";
  uint64_t v36 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v51 = (void *)v36;
  v105[23] = v36;
  v104[24] = @"fatalResponseCount";
  uint64_t v37 = (uint64_t)v86;
  if (!v86)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  int v77 = (void *)v5;
  int v50 = (void *)v37;
  v105[24] = v37;
  v104[25] = @"failureResponseCount";
  uint64_t v38 = (uint64_t)v85;
  if (!v85)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v64 = (void *)v19;
  unsigned int v78 = v4;
  uint64_t v48 = v38;
  v105[25] = v38;
  v104[26] = @"siriUnavailableResponseCount";
  v39 = v84;
  if (!v84)
  {
    v39 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v38, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62);
  }
  v75 = v3;
  v105[26] = v39;
  v104[27] = @"usdxSessionCount";
  int v40 = v83;
  if (!v83)
  {
    int v40 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v63 = (void *)v20;
  v105[27] = v40;
  v104[28] = @"tuples";
  int v41 = v82;
  if (!v82)
  {
    int v41 = [MEMORY[0x1E4F1CA98] null];
  }
  int v42 = v8;
  v105[28] = v41;
  v104[29] = @"isIntelligenceEngineRequest";
  int v43 = v81;
  if (!v81)
  {
    int v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v105[29] = v43;
  v104[30] = @"intelligenceEngineRouting";
  int v44 = v80;
  if (!v80)
  {
    int v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v105[30] = v44;
  v104[31] = @"invocationSource";
  v45 = v11;
  if (!v11)
  {
    v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v105[31] = v45;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v105, v104, 32, v48);
  id v72 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11) {

  }
  uint64_t v46 = v25;
  if (!v80)
  {

    uint64_t v46 = v25;
  }
  if (!v81)
  {

    uint64_t v46 = v25;
  }
  if (!v82)
  {

    uint64_t v46 = v25;
  }
  if (!v83)
  {

    uint64_t v46 = v25;
  }
  if (!v84)
  {

    uint64_t v46 = v25;
  }
  if (!v85)
  {

    uint64_t v46 = v25;
  }
  if (!v86)
  {

    uint64_t v46 = v25;
  }
  if (!v87)
  {

    uint64_t v46 = v25;
  }
  if (!v88)
  {

    uint64_t v46 = v25;
  }
  if (!v89)
  {

    uint64_t v46 = v25;
  }
  if (!v90)
  {

    uint64_t v46 = v25;
  }
  if (!v91)
  {

    uint64_t v46 = v25;
  }
  if (!v92)
  {

    uint64_t v46 = v25;
  }
  if (!v93)
  {

    uint64_t v46 = v25;
  }
  if (!v94)
  {

    uint64_t v46 = v25;
  }
  if (!v95)
  {

    uint64_t v46 = v25;
  }
  if (!v96)
  {

    uint64_t v46 = v25;
  }
  if (!v97)
  {

    uint64_t v46 = v25;
  }
  if (!v98) {

  }
  if (!v99) {
  if (!v100)
  }

  if (!v101) {
  if (!v102)
  }

  if (v103)
  {
    if (v42) {
      goto LABEL_187;
    }
  }
  else
  {

    if (v42)
    {
LABEL_187:
      if (v7) {
        goto LABEL_188;
      }
      goto LABEL_198;
    }
  }

  if (v7)
  {
LABEL_188:
    if (v76) {
      goto LABEL_189;
    }
    goto LABEL_199;
  }
LABEL_198:

  if (v76)
  {
LABEL_189:
    if (v77) {
      goto LABEL_190;
    }
    goto LABEL_200;
  }
LABEL_199:

  if (v77)
  {
LABEL_190:
    if (v78) {
      goto LABEL_191;
    }
    goto LABEL_201;
  }
LABEL_200:

  if (v78)
  {
LABEL_191:
    if (v75) {
      goto LABEL_192;
    }
LABEL_202:

    if (v79) {
      goto LABEL_193;
    }
    goto LABEL_203;
  }
LABEL_201:

  if (!v75) {
    goto LABEL_202;
  }
LABEL_192:
  if (v79) {
    goto LABEL_193;
  }
LABEL_203:

LABEL_193:

  return v72;
}

- (id)_intelligenceEngineRoutingJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self intelligenceEngineRouting];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v445[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"systemBuild"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v369 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v369 = v7;
LABEL_4:
    v370 = [v6 objectForKeyedSubscript:@"dataSharingOptInStatus"];
    if (!v370 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v368 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v368 = v370;
LABEL_7:
      id v8 = [v6 objectForKeyedSubscript:@"viewInterface"];
      v367 = v8;
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v365 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v365 = v8;
LABEL_10:
        uint64_t v9 = [v6 objectForKeyedSubscript:@"audioInterfaceVendorId"];
        v366 = (void *)v9;
        if (!v9 || (long long v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v362 = 0;
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v362 = v10;
LABEL_13:
          uint64_t v11 = [v6 objectForKeyedSubscript:@"audioInterfaceProductId"];
          v364 = (void *)v11;
          if (!v11 || (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v363 = 0;
            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v363 = v12;
LABEL_16:
            uint64_t v13 = [v6 objectForKeyedSubscript:@"asrLocation"];
            v361 = (void *)v13;
            if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v360 = 0;
              goto LABEL_19;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v360 = v14;
LABEL_19:
              uint64_t v15 = [v6 objectForKeyedSubscript:@"nlLocation"];
              v359 = (void *)v15;
              if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v358 = 0;
                goto LABEL_22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v358 = v16;
LABEL_22:
                uint64_t v17 = [v6 objectForKeyedSubscript:@"siriInputLocale"];
                if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v355 = v17;
                  uint64_t v18 = 0;
                  goto LABEL_25;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v82 = v17;
                  id v376 = 0;
                  uint64_t v18 = [[BMSiriOnDeviceDigestExperimentMetricsISOLocale alloc] initWithJSONDictionary:v82 error:&v376];
                  id v83 = v376;
                  if (v83)
                  {
                    id v84 = v83;
                    v80 = v362;
                    if (a4) {
                      *a4 = v83;
                    }

                    v68 = 0;
                    uint64_t v22 = v18;
                    goto LABEL_321;
                  }
                  v355 = v17;

LABEL_25:
                  uint64_t v19 = [v6 objectForKeyedSubscript:@"subDomain"];
                  v357 = (void *)v19;
                  if (v19 && (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (!a4)
                      {
                        id v356 = 0;
                        v68 = 0;
                        v80 = v362;
                        id v82 = v355;
                        uint64_t v22 = v18;
LABEL_320:

                        goto LABEL_321;
                      }
                      id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v121 = *MEMORY[0x1E4F502C8];
                      uint64_t v428 = *MEMORY[0x1E4F28568];
                      v122 = v7;
                      v123 = a4;
                      v124 = self;
                      id v125 = [NSString alloc];
                      uint64_t v267 = objc_opt_class();
                      v126 = v125;
                      self = v124;
                      uint64_t v22 = v18;
                      id v353 = (id)[v126 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v267, @"subDomain"];
                      id v429 = v353;
                      v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v429 forKeys:&v428 count:1];
                      id v128 = (id)[v120 initWithDomain:v121 code:2 userInfo:v127];
                      id v356 = 0;
                      v68 = 0;
                      id *v123 = v128;
                      uint64_t v7 = v122;
                      id v8 = v367;
                      v80 = v362;
                      id v82 = v355;
                      goto LABEL_319;
                    }
                    id v356 = v20;
                  }
                  else
                  {
                    id v356 = 0;
                  }
                  uint64_t v21 = [v6 objectForKeyedSubscript:@"responseCategory"];
                  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v348 = v21;
                    id v353 = 0;
                    goto LABEL_31;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v348 = v21;
                    id v353 = v21;
LABEL_31:
                    [v6 objectForKeyedSubscript:@"experimentAllocationStatus"];
                    v23 = uint64_t v22 = v18;
                    if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v345 = v23;
                      uint64_t v24 = v22;
                      id v349 = 0;
LABEL_34:
                      uint64_t v25 = [v6 objectForKeyedSubscript:@"isTriggered"];
                      v347 = (void *)v25;
                      if (v25 && (uint64_t v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!a4)
                          {
                            id v346 = 0;
                            v68 = 0;
                            v80 = v362;
                            id v82 = v355;
                            v127 = v348;
                            uint64_t v22 = v24;
                            goto LABEL_316;
                          }
                          id v352 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v141 = *MEMORY[0x1E4F502C8];
                          uint64_t v422 = *MEMORY[0x1E4F28568];
                          v142 = self;
                          id v143 = [NSString alloc];
                          uint64_t v270 = objc_opt_class();
                          v144 = v143;
                          self = v142;
                          uint64_t v22 = v24;
                          id v344 = (id)[v144 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v270, @"isTriggered"];
                          id v423 = v344;
                          uint64_t v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v423 forKeys:&v422 count:1];
                          v146 = v352;
                          v350 = (void *)v145;
                          id v346 = 0;
                          v68 = 0;
                          *a4 = (id)objc_msgSend(v146, "initWithDomain:code:userInfo:", v141, 2);
                          goto LABEL_193;
                        }
                        id v346 = v26;
                      }
                      else
                      {
                        id v346 = 0;
                      }
                      [v6 objectForKeyedSubscript:@"isFirstTriggerOrAfterFirstTrigger"];
                      v350 = uint64_t v22 = v24;
                      if (!v350 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v344 = 0;
                        goto LABEL_40;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v344 = v350;
LABEL_40:
                        uint64_t v27 = [v6 objectForKeyedSubscript:@"codePathIdUUID"];
                        v343 = (void *)v27;
                        if (!v27 || (uint64_t v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v342 = 0;
                          goto LABEL_43;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v342 = v28;
LABEL_43:
                          uint64_t v29 = [v6 objectForKeyedSubscript:@"totalTurnCount"];
                          v341 = (void *)v29;
                          if (!v29 || (uint64_t v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v339 = 0;
                            goto LABEL_46;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v339 = v30;
LABEL_46:
                            uint64_t v31 = [v6 objectForKeyedSubscript:@"validTurnCount"];
                            v338 = (void *)v31;
                            if (!v31 || (uint64_t v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v319 = 0;
                              goto LABEL_49;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v319 = v32;
LABEL_49:
                              uint64_t v33 = [v6 objectForKeyedSubscript:@"siriTasksStarted"];
                              v318 = (void *)v33;
                              if (!v33 || (uint64_t v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v317 = 0;
                                goto LABEL_52;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v317 = v34;
LABEL_52:
                                uint64_t v35 = [v6 objectForKeyedSubscript:@"siriTasksCompleted"];
                                v316 = (void *)v35;
                                if (!v35 || (uint64_t v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v315 = 0;
                                  goto LABEL_55;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v315 = v36;
LABEL_55:
                                  uint64_t v37 = [v6 objectForKeyedSubscript:@"flowTasksStarted"];
                                  v314 = (void *)v37;
                                  if (!v37
                                    || (uint64_t v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v313 = 0;
                                    goto LABEL_58;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v313 = v38;
LABEL_58:
                                    uint64_t v39 = [v6 objectForKeyedSubscript:@"flowTasksCompleted"];
                                    v312 = (void *)v39;
                                    if (!v39
                                      || (int v40 = (void *)v39, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v311 = 0;
                                      goto LABEL_61;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v311 = v40;
LABEL_61:
                                      uint64_t v41 = [v6 objectForKeyedSubscript:@"reliabilityRequestCount"];
                                      v310 = (void *)v41;
                                      if (!v41
                                        || (int v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v309 = 0;
                                        goto LABEL_64;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v309 = v42;
LABEL_64:
                                        uint64_t v43 = [v6 objectForKeyedSubscript:@"reliabilityTurnCount"];
                                        v308 = (void *)v43;
                                        if (!v43
                                          || (int v44 = (void *)v43, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v307 = 0;
                                          goto LABEL_67;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v307 = v44;
LABEL_67:
                                          uint64_t v45 = [v6 objectForKeyedSubscript:@"clientErrorCount"];
                                          v306 = (void *)v45;
                                          if (!v45
                                            || (uint64_t v46 = (void *)v45, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v305 = 0;
                                            goto LABEL_70;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v305 = v46;
LABEL_70:
                                            uint64_t v47 = [v6 objectForKeyedSubscript:@"undesiredResponseCount"];
                                            v303 = (void *)v47;
                                            if (!v47
                                              || (uint64_t v48 = (void *)v47,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v302 = 0;
                                              goto LABEL_73;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v302 = v48;
LABEL_73:
                                              uint64_t v49 = [v6 objectForKeyedSubscript:@"fatalResponseCount"];
                                              v300 = (void *)v49;
                                              if (!v49
                                                || (int v50 = (void *)v49,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v304 = 0;
LABEL_76:
                                                uint64_t v51 = [v6 objectForKeyedSubscript:@"failureResponseCount"];
                                                v298 = (void *)v51;
                                                if (v51
                                                  && (unsigned int v52 = (void *)v51,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                  {
                                                    if (a4)
                                                    {
                                                      id v332 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v210 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v394 = *MEMORY[0x1E4F28568];
                                                      v211 = self;
                                                      id v212 = [NSString alloc];
                                                      uint64_t v284 = objc_opt_class();
                                                      v213 = v212;
                                                      self = v211;
                                                      v200 = v304;
                                                      id v297 = (id)[v213 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v284, @"failureResponseCount"];
                                                      id v395 = v297;
                                                      v296 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v395 forKeys:&v394 count:1];
                                                      id v299 = 0;
                                                      v68 = 0;
                                                      *a4 = (id)objc_msgSend(v332, "initWithDomain:code:userInfo:", v210, 2);
                                                      v80 = v362;
                                                      id v82 = v355;
                                                      v127 = v348;
                                                      goto LABEL_301;
                                                    }
                                                    id v299 = 0;
                                                    v68 = 0;
                                                    v80 = v362;
                                                    id v82 = v355;
                                                    v127 = v348;
                                                    v200 = v304;
                                                    goto LABEL_302;
                                                  }
                                                  id v299 = v52;
                                                }
                                                else
                                                {
                                                  id v299 = 0;
                                                }
                                                uint64_t v53 = [v6 objectForKeyedSubscript:@"siriUnavailableResponseCount"];
                                                v296 = (void *)v53;
                                                if (v53
                                                  && (unsigned int v54 = (void *)v53,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                  {
                                                    if (a4)
                                                    {
                                                      id v333 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v214 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v392 = *MEMORY[0x1E4F28568];
                                                      v215 = self;
                                                      id v216 = [NSString alloc];
                                                      uint64_t v285 = objc_opt_class();
                                                      v217 = v216;
                                                      self = v215;
                                                      v200 = v304;
                                                      id v295 = (id)[v217 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v285, @"siriUnavailableResponseCount"];
                                                      id v393 = v295;
                                                      v294 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v393 forKeys:&v392 count:1];
                                                      id v297 = 0;
                                                      v68 = 0;
                                                      *a4 = (id)objc_msgSend(v333, "initWithDomain:code:userInfo:", v214, 2);
                                                      v80 = v362;
                                                      id v82 = v355;
                                                      v127 = v348;
                                                      goto LABEL_300;
                                                    }
                                                    id v297 = 0;
                                                    v68 = 0;
                                                    v80 = v362;
                                                    id v82 = v355;
                                                    v127 = v348;
                                                    v200 = v304;
                                                    goto LABEL_301;
                                                  }
                                                  id v297 = v54;
                                                }
                                                else
                                                {
                                                  id v297 = 0;
                                                }
                                                uint64_t v55 = [v6 objectForKeyedSubscript:@"usdxSessionCount"];
                                                v294 = (void *)v55;
                                                if (v55
                                                  && (unsigned int v56 = (void *)v55,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                {
                                                  objc_opt_class();
                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                  {
                                                    if (!a4)
                                                    {
                                                      id v295 = 0;
                                                      v68 = 0;
                                                      v80 = v362;
                                                      id v82 = v355;
                                                      v127 = v348;
                                                      v200 = v304;
                                                      goto LABEL_300;
                                                    }
                                                    id v334 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v218 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v390 = *MEMORY[0x1E4F28568];
                                                    v219 = self;
                                                    id v220 = [NSString alloc];
                                                    uint64_t v286 = objc_opt_class();
                                                    v221 = v220;
                                                    self = v219;
                                                    uint64_t v205 = [v221 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v286, @"usdxSessionCount"];
                                                    uint64_t v391 = v205;
                                                    v293 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v391 forKeys:&v390 count:1];
                                                    id v295 = 0;
                                                    v68 = 0;
                                                    *a4 = (id)objc_msgSend(v334, "initWithDomain:code:userInfo:", v218, 2);
                                                    goto LABEL_258;
                                                  }
                                                  id v295 = v56;
                                                }
                                                else
                                                {
                                                  id v295 = 0;
                                                }
                                                uint64_t v57 = [v6 objectForKeyedSubscript:@"tuples"];
                                                v292 = (void *)v57;
                                                if (!v57
                                                  || (unsigned int v58 = (void *)v57,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  v293 = 0;
LABEL_88:
                                                  uint64_t v59 = [v6 objectForKeyedSubscript:@"isIntelligenceEngineRequest"];
                                                  v290 = (void *)v59;
                                                  if (v59
                                                    && (unsigned int v60 = (void *)v59,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                  {
                                                    objc_opt_class();
                                                    if ((objc_opt_isKindOfClass() & 1) == 0)
                                                    {
                                                      if (a4)
                                                      {
                                                        id v337 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v246 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v386 = *MEMORY[0x1E4F28568];
                                                        v247 = self;
                                                        id v248 = [NSString alloc];
                                                        uint64_t v288 = objc_opt_class();
                                                        v249 = v248;
                                                        self = v247;
                                                        id obj = (id)[v249 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v288, @"isIntelligenceEngineRequest"];
                                                        id v387 = obj;
                                                        v229 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v387 forKeys:&v386 count:1];
                                                        id v291 = 0;
                                                        v68 = 0;
                                                        *a4 = (id)objc_msgSend(v337, "initWithDomain:code:userInfo:", v246, 2);
                                                        v80 = v362;
                                                        id v82 = v355;
                                                        v127 = v348;
                                                        goto LABEL_295;
                                                      }
                                                      id v291 = 0;
                                                      v68 = 0;
                                                      v80 = v362;
                                                      id v82 = v355;
                                                      v127 = v348;
                                                      goto LABEL_297;
                                                    }
                                                    id v291 = v60;
                                                  }
                                                  else
                                                  {
                                                    id v291 = 0;
                                                  }
                                                  unsigned int v61 = [v6 objectForKeyedSubscript:@"intelligenceEngineRouting"];
                                                  unsigned int v62 = [MEMORY[0x1E4F1CA98] null];
                                                  int v63 = [v61 isEqual:v62];

                                                  if (v63)
                                                  {
                                                    unsigned int v64 = self;
                                                  }
                                                  else
                                                  {
                                                    if (v61)
                                                    {
                                                      objc_opt_class();
                                                      id obj = v61;
                                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                                      {
                                                        if (!a4)
                                                        {
                                                          v68 = 0;
                                                          v80 = v362;
                                                          id v82 = v355;
                                                          v127 = v348;
                                                          goto LABEL_296;
                                                        }
                                                        id v250 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v251 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v384 = *MEMORY[0x1E4F28568];
                                                        v229 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"intelligenceEngineRouting"];
                                                        v385 = v229;
                                                        uint64_t v252 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v385 forKeys:&v384 count:1];
                                                        id v253 = (id)[v250 initWithDomain:v251 code:2 userInfo:v252];
                                                        v68 = 0;
                                                        *a4 = v253;
                                                        v245 = (void *)v252;
                                                        goto LABEL_287;
                                                      }
                                                      unsigned int v64 = self;
                                                      v201 = v61;
LABEL_263:
                                                      v229 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v201, "count"));
                                                      long long v371 = 0u;
                                                      long long v372 = 0u;
                                                      long long v373 = 0u;
                                                      long long v374 = 0u;
                                                      id v230 = v201;
                                                      uint64_t v231 = [v230 countByEnumeratingWithState:&v371 objects:v383 count:16];
                                                      id obj = v230;
                                                      if (!v231) {
                                                        goto LABEL_272;
                                                      }
                                                      uint64_t v232 = v231;
                                                      uint64_t v335 = *(void *)v372;
LABEL_265:
                                                      uint64_t v233 = 0;
                                                      while (1)
                                                      {
                                                        if (*(void *)v372 != v335) {
                                                          objc_enumerationMutation(obj);
                                                        }
                                                        v234 = *(void **)(*((void *)&v371 + 1) + 8 * v233);
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass()) {
                                                          break;
                                                        }
                                                        objc_opt_class();
                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                        {
                                                          if (a4)
                                                          {
                                                            id v243 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v244 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v379 = *MEMORY[0x1E4F28568];
                                                            v336 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"intelligenceEngineRouting"];
                                                            v380 = v336;
                                                            v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v380 forKeys:&v379 count:1];
                                                            v241 = v243;
                                                            uint64_t v242 = v244;
                                                            goto LABEL_279;
                                                          }
                                                          goto LABEL_280;
                                                        }
                                                        id v235 = v234;
                                                        [v229 addObject:v235];

                                                        if (v232 == ++v233)
                                                        {
                                                          id v230 = obj;
                                                          uint64_t v232 = [obj countByEnumeratingWithState:&v371 objects:v383 count:16];
                                                          if (v232) {
                                                            goto LABEL_265;
                                                          }
LABEL_272:

                                                          id v236 = [v6 objectForKeyedSubscript:@"invocationSource"];
                                                          v336 = v236;
                                                          if (v236)
                                                          {
                                                            v237 = v236;
                                                            objc_opt_class();
                                                            self = v64;
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v236 = 0;
                                                              goto LABEL_291;
                                                            }
                                                            objc_opt_class();
                                                            id v8 = v367;
                                                            v80 = v362;
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v236 = v237;
                                                              goto LABEL_292;
                                                            }
                                                            if (a4)
                                                            {
                                                              id v256 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v257 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v377 = *MEMORY[0x1E4F28568];
                                                              v258 = self;
                                                              v259 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"invocationSource"];
                                                              v378 = v259;
                                                              v260 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1];
                                                              uint64_t v261 = v257;
                                                              v80 = v362;
                                                              *a4 = (id)[v256 initWithDomain:v261 code:2 userInfo:v260];

                                                              self = v258;
                                                              id v8 = v367;
                                                            }
                                                            id v289 = 0;
                                                            v68 = 0;
                                                          }
                                                          else
                                                          {
                                                            self = v64;
LABEL_291:
                                                            id v8 = v367;
                                                            v80 = v362;
LABEL_292:
                                                            id v289 = v236;
                                                            self = objc_retain(-[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest initWithSystemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:subDomain:responseCategory:experimentAllocationStatus:isTriggered:isFirstTriggerOrAfterFirstTrigger:codePathIdUUID:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:usdxSessionCount:tuples:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:](self, "initWithSystemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:subDomain:responseCategory:experimentAllocationStatus:isTriggered:isFirstTriggerOrAfterFirstTrigger:codePathIdUUID:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:usdxSessionCount:tuples:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:", v369, v368, v365, v80,
                                                                       v363,
                                                                       v360,
                                                                       v358,
                                                                       v22,
                                                                       v356,
                                                                       v353,
                                                                       v349,
                                                                       v346,
                                                                       v344,
                                                                       v342,
                                                                       v339,
                                                                       v319,
                                                                       v317,
                                                                       v315,
                                                                       v313,
                                                                       v311,
                                                                       v309,
                                                                       v307,
                                                                       v305,
                                                                       v302,
                                                                       v304,
                                                                       v299,
                                                                       v297,
                                                                       v295,
                                                                       v293,
                                                                       v291,
                                                                       v229,
                                                                       v236));
                                                            v68 = self;
                                                          }
LABEL_293:
                                                          id v82 = v355;
                                                          v127 = v348;

                                                          v245 = v289;
LABEL_294:

LABEL_295:
LABEL_296:

LABEL_297:
                                                          uint64_t v205 = (uint64_t)v292;
LABEL_298:

                                                          v254 = (void *)v205;
                                                          v200 = v304;
LABEL_299:

LABEL_300:
LABEL_301:

LABEL_302:
LABEL_303:

LABEL_304:
LABEL_305:

LABEL_306:
LABEL_307:

LABEL_308:
LABEL_309:

LABEL_310:
LABEL_311:

LABEL_312:
LABEL_313:

LABEL_314:
LABEL_315:

LABEL_316:
                                                          uint64_t v23 = v345;
LABEL_317:

                                                          goto LABEL_318;
                                                        }
                                                      }
                                                      if (a4)
                                                      {
                                                        id v238 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v239 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v381 = *MEMORY[0x1E4F28568];
                                                        v336 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"intelligenceEngineRouting"];
                                                        v382 = v336;
                                                        v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v382 forKeys:&v381 count:1];
                                                        v241 = v238;
                                                        uint64_t v242 = v239;
LABEL_279:
                                                        self = v64;
                                                        *a4 = (id)[v241 initWithDomain:v242 code:2 userInfo:v240];

                                                        v68 = 0;
                                                        id v289 = obj;
                                                        id v8 = v367;
                                                        v80 = v362;
                                                        goto LABEL_293;
                                                      }
LABEL_280:
                                                      v68 = 0;
                                                      v245 = obj;
                                                      self = v64;
                                                      id v8 = v367;
LABEL_287:
                                                      v80 = v362;
                                                      id v82 = v355;
                                                      v127 = v348;
                                                      goto LABEL_294;
                                                    }
                                                    unsigned int v64 = self;
                                                  }
                                                  v201 = 0;
                                                  goto LABEL_263;
                                                }
                                                v330 = v7;
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v202 = v58;
                                                  id v375 = 0;
                                                  v293 = [[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples alloc] initWithJSONDictionary:v202 error:&v375];
                                                  id v203 = v375;
                                                  if (!v203)
                                                  {

                                                    uint64_t v7 = v330;
                                                    goto LABEL_88;
                                                  }
                                                  v204 = v203;
                                                  if (a4) {
                                                    *a4 = v203;
                                                  }

                                                  v68 = 0;
                                                  uint64_t v205 = (uint64_t)v202;
                                                  uint64_t v7 = v330;
                                                }
                                                else
                                                {
                                                  if (!a4)
                                                  {
                                                    v68 = 0;
                                                    v80 = v362;
                                                    id v82 = v355;
                                                    v127 = v348;
                                                    v200 = v304;
                                                    v254 = v292;
                                                    goto LABEL_299;
                                                  }
                                                  id v222 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v223 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v388 = *MEMORY[0x1E4F28568];
                                                  v224 = v22;
                                                  v225 = self;
                                                  id v226 = [NSString alloc];
                                                  uint64_t v287 = objc_opt_class();
                                                  v227 = v226;
                                                  self = v225;
                                                  uint64_t v22 = v224;
                                                  v293 = (BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)[v227 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v287, @"tuples"];
                                                  v389 = v293;
                                                  v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v389 forKeys:&v388 count:1];
                                                  *a4 = (id)[v222 initWithDomain:v223 code:2 userInfo:v228];

                                                  v68 = 0;
                                                  uint64_t v205 = (uint64_t)v292;
                                                }
LABEL_258:
                                                v80 = v362;
                                                id v82 = v355;
                                                v127 = v348;
                                                goto LABEL_298;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v304 = v50;
                                                goto LABEL_76;
                                              }
                                              if (a4)
                                              {
                                                id v331 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v206 = *MEMORY[0x1E4F502C8];
                                                uint64_t v396 = *MEMORY[0x1E4F28568];
                                                v207 = self;
                                                id v208 = [NSString alloc];
                                                uint64_t v283 = objc_opt_class();
                                                v209 = v208;
                                                self = v207;
                                                id v299 = (id)[v209 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v283, @"fatalResponseCount"];
                                                id v397 = v299;
                                                v298 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v397 forKeys:&v396 count:1];
                                                v200 = 0;
                                                v68 = 0;
                                                *a4 = (id)objc_msgSend(v331, "initWithDomain:code:userInfo:", v206, 2);
                                                v80 = v362;
                                                id v82 = v355;
                                                v127 = v348;
                                                goto LABEL_302;
                                              }
                                              v200 = 0;
                                              v68 = 0;
LABEL_284:
                                              v80 = v362;
                                              id v82 = v355;
                                              v127 = v348;
                                              goto LABEL_303;
                                            }
                                            if (a4)
                                            {
                                              id v329 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v196 = *MEMORY[0x1E4F502C8];
                                              uint64_t v398 = *MEMORY[0x1E4F28568];
                                              v197 = self;
                                              id v198 = [NSString alloc];
                                              uint64_t v282 = objc_opt_class();
                                              v199 = v198;
                                              self = v197;
                                              v200 = (void *)[v199 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v282, @"undesiredResponseCount"];
                                              v399 = v200;
                                              v300 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v399 forKeys:&v398 count:1];
                                              id v302 = 0;
                                              v68 = 0;
                                              *a4 = (id)objc_msgSend(v329, "initWithDomain:code:userInfo:", v196, 2);
                                              goto LABEL_284;
                                            }
                                            id v302 = 0;
                                            v68 = 0;
LABEL_260:
                                            v80 = v362;
                                            id v82 = v355;
                                            v127 = v348;
                                            goto LABEL_304;
                                          }
                                          if (a4)
                                          {
                                            id v328 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v192 = *MEMORY[0x1E4F502C8];
                                            uint64_t v400 = *MEMORY[0x1E4F28568];
                                            v193 = self;
                                            id v194 = [NSString alloc];
                                            uint64_t v281 = objc_opt_class();
                                            v195 = v194;
                                            self = v193;
                                            id v302 = (id)[v195 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v281, @"clientErrorCount"];
                                            id v401 = v302;
                                            v303 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v401 forKeys:&v400 count:1];
                                            id v305 = 0;
                                            v68 = 0;
                                            *a4 = (id)objc_msgSend(v328, "initWithDomain:code:userInfo:", v192, 2);
                                            goto LABEL_260;
                                          }
                                          id v305 = 0;
                                          v68 = 0;
LABEL_255:
                                          v80 = v362;
                                          id v82 = v355;
                                          v127 = v348;
                                          goto LABEL_305;
                                        }
                                        if (a4)
                                        {
                                          id v327 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v188 = *MEMORY[0x1E4F502C8];
                                          uint64_t v402 = *MEMORY[0x1E4F28568];
                                          v189 = self;
                                          id v190 = [NSString alloc];
                                          uint64_t v280 = objc_opt_class();
                                          v191 = v190;
                                          self = v189;
                                          id v305 = (id)[v191 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v280, @"reliabilityTurnCount"];
                                          id v403 = v305;
                                          v306 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v403 forKeys:&v402 count:1];
                                          id v307 = 0;
                                          v68 = 0;
                                          *a4 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v188, 2);
                                          goto LABEL_255;
                                        }
                                        id v307 = 0;
                                        v68 = 0;
LABEL_251:
                                        v80 = v362;
                                        id v82 = v355;
                                        v127 = v348;
                                        goto LABEL_306;
                                      }
                                      if (a4)
                                      {
                                        id v326 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v184 = *MEMORY[0x1E4F502C8];
                                        uint64_t v404 = *MEMORY[0x1E4F28568];
                                        v185 = self;
                                        id v186 = [NSString alloc];
                                        uint64_t v279 = objc_opt_class();
                                        v187 = v186;
                                        self = v185;
                                        id v307 = (id)[v187 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v279, @"reliabilityRequestCount"];
                                        id v405 = v307;
                                        v308 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v405 forKeys:&v404 count:1];
                                        id v309 = 0;
                                        v68 = 0;
                                        *a4 = (id)objc_msgSend(v326, "initWithDomain:code:userInfo:", v184, 2);
                                        goto LABEL_251;
                                      }
                                      id v309 = 0;
                                      v68 = 0;
LABEL_247:
                                      v80 = v362;
                                      id v82 = v355;
                                      v127 = v348;
                                      goto LABEL_307;
                                    }
                                    if (a4)
                                    {
                                      id v325 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v180 = *MEMORY[0x1E4F502C8];
                                      uint64_t v406 = *MEMORY[0x1E4F28568];
                                      v181 = self;
                                      id v182 = [NSString alloc];
                                      uint64_t v278 = objc_opt_class();
                                      v183 = v182;
                                      self = v181;
                                      id v309 = (id)[v183 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v278, @"flowTasksCompleted"];
                                      id v407 = v309;
                                      v310 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v407 forKeys:&v406 count:1];
                                      id v311 = 0;
                                      v68 = 0;
                                      *a4 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v180, 2);
                                      goto LABEL_247;
                                    }
                                    id v311 = 0;
                                    v68 = 0;
LABEL_241:
                                    v80 = v362;
                                    id v82 = v355;
                                    v127 = v348;
                                    goto LABEL_308;
                                  }
                                  if (a4)
                                  {
                                    id v324 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v176 = *MEMORY[0x1E4F502C8];
                                    uint64_t v408 = *MEMORY[0x1E4F28568];
                                    v177 = self;
                                    id v178 = [NSString alloc];
                                    uint64_t v277 = objc_opt_class();
                                    v179 = v178;
                                    self = v177;
                                    id v311 = (id)[v179 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v277, @"flowTasksStarted"];
                                    id v409 = v311;
                                    v312 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v409 forKeys:&v408 count:1];
                                    id v313 = 0;
                                    v68 = 0;
                                    *a4 = (id)objc_msgSend(v324, "initWithDomain:code:userInfo:", v176, 2);
                                    goto LABEL_241;
                                  }
                                  id v313 = 0;
                                  v68 = 0;
LABEL_229:
                                  v80 = v362;
                                  id v82 = v355;
                                  v127 = v348;
                                  goto LABEL_309;
                                }
                                if (a4)
                                {
                                  id v323 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v172 = *MEMORY[0x1E4F502C8];
                                  uint64_t v410 = *MEMORY[0x1E4F28568];
                                  v173 = self;
                                  id v174 = [NSString alloc];
                                  uint64_t v276 = objc_opt_class();
                                  v175 = v174;
                                  self = v173;
                                  id v313 = (id)[v175 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v276, @"siriTasksCompleted"];
                                  id v411 = v313;
                                  v314 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v411 forKeys:&v410 count:1];
                                  id v315 = 0;
                                  v68 = 0;
                                  *a4 = (id)objc_msgSend(v323, "initWithDomain:code:userInfo:", v172, 2);
                                  goto LABEL_229;
                                }
                                id v315 = 0;
                                v68 = 0;
LABEL_223:
                                v80 = v362;
                                id v82 = v355;
                                v127 = v348;
                                goto LABEL_310;
                              }
                              if (a4)
                              {
                                id v322 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v168 = *MEMORY[0x1E4F502C8];
                                uint64_t v412 = *MEMORY[0x1E4F28568];
                                v169 = self;
                                id v170 = [NSString alloc];
                                uint64_t v275 = objc_opt_class();
                                v171 = v170;
                                self = v169;
                                id v315 = (id)[v171 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v275, @"siriTasksStarted"];
                                id v413 = v315;
                                v316 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v413 forKeys:&v412 count:1];
                                id v317 = 0;
                                v68 = 0;
                                *a4 = (id)objc_msgSend(v322, "initWithDomain:code:userInfo:", v168, 2);
                                goto LABEL_223;
                              }
                              id v317 = 0;
                              v68 = 0;
LABEL_217:
                              v80 = v362;
                              id v82 = v355;
                              v127 = v348;
                              goto LABEL_311;
                            }
                            if (a4)
                            {
                              id v321 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v164 = *MEMORY[0x1E4F502C8];
                              uint64_t v414 = *MEMORY[0x1E4F28568];
                              v165 = self;
                              id v166 = [NSString alloc];
                              uint64_t v274 = objc_opt_class();
                              v167 = v166;
                              self = v165;
                              id v317 = (id)[v167 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v274, @"validTurnCount"];
                              id v415 = v317;
                              v318 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v415 forKeys:&v414 count:1];
                              id v319 = 0;
                              v68 = 0;
                              *a4 = (id)objc_msgSend(v321, "initWithDomain:code:userInfo:", v164, 2);
                              goto LABEL_217;
                            }
                            id v319 = 0;
                            v68 = 0;
LABEL_211:
                            v80 = v362;
                            id v82 = v355;
                            v127 = v348;
                            goto LABEL_312;
                          }
                          if (a4)
                          {
                            id v340 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v159 = *MEMORY[0x1E4F502C8];
                            uint64_t v416 = *MEMORY[0x1E4F28568];
                            v160 = self;
                            id v161 = [NSString alloc];
                            uint64_t v273 = objc_opt_class();
                            v162 = v161;
                            self = v160;
                            id v319 = (id)[v162 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v273, @"totalTurnCount"];
                            id v417 = v319;
                            v338 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v417 forKeys:&v416 count:1];
                            id v163 = (id)objc_msgSend(v340, "initWithDomain:code:userInfo:", v159, 2);
                            id v339 = 0;
                            v68 = 0;
                            *a4 = v163;
                            goto LABEL_211;
                          }
                          id v339 = 0;
                          v68 = 0;
LABEL_205:
                          v80 = v362;
                          id v82 = v355;
                          v127 = v348;
                          goto LABEL_313;
                        }
                        if (a4)
                        {
                          id v152 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v153 = *MEMORY[0x1E4F502C8];
                          uint64_t v418 = *MEMORY[0x1E4F28568];
                          v154 = v7;
                          v155 = self;
                          id v156 = [NSString alloc];
                          uint64_t v272 = objc_opt_class();
                          v157 = v156;
                          self = v155;
                          uint64_t v7 = v154;
                          id v339 = (id)[v157 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v272, @"codePathIdUUID"];
                          id v419 = v339;
                          v341 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v419 forKeys:&v418 count:1];
                          id v158 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v153, 2);
                          id v342 = 0;
                          v68 = 0;
                          *a4 = v158;
                          id v8 = v367;
                          goto LABEL_205;
                        }
                        id v342 = 0;
                        v68 = 0;
LABEL_199:
                        v80 = v362;
                        id v82 = v355;
                        v127 = v348;
                        goto LABEL_314;
                      }
                      if (a4)
                      {
                        id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v148 = *MEMORY[0x1E4F502C8];
                        uint64_t v420 = *MEMORY[0x1E4F28568];
                        v149 = self;
                        id v150 = [NSString alloc];
                        uint64_t v271 = objc_opt_class();
                        v151 = v150;
                        self = v149;
                        id v342 = (id)[v151 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v271, @"isFirstTriggerOrAfterFirstTrigger"];
                        id v421 = v342;
                        v343 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v421 forKeys:&v420 count:1];
                        id v344 = 0;
                        v68 = 0;
                        *a4 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v148, 2);
                        goto LABEL_199;
                      }
                      id v344 = 0;
                      v68 = 0;
LABEL_193:
                      v80 = v362;
                      id v82 = v355;
                      v127 = v348;
                      goto LABEL_315;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v112 = v23;
                      uint64_t v24 = v22;
                      v345 = v112;
                      id v349 = v112;
                      goto LABEL_34;
                    }
                    if (a4)
                    {
                      id v351 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v137 = *MEMORY[0x1E4F502C8];
                      uint64_t v424 = *MEMORY[0x1E4F28568];
                      v138 = self;
                      id v139 = [NSString alloc];
                      uint64_t v269 = objc_opt_class();
                      v140 = v139;
                      self = v138;
                      id v346 = (id)[v140 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v269, @"experimentAllocationStatus"];
                      id v425 = v346;
                      v347 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v425 forKeys:&v424 count:1];
                      id v349 = 0;
                      v68 = 0;
                      *a4 = (id)objc_msgSend(v351, "initWithDomain:code:userInfo:", v137, 2);
                      v80 = v362;
                      id v82 = v355;
                      v127 = v348;
                      goto LABEL_317;
                    }
                    id v349 = 0;
                    v68 = 0;
                    v80 = v362;
                    id v82 = v355;
                    v127 = v348;
LABEL_318:

                    goto LABEL_319;
                  }
                  if (a4)
                  {
                    id v354 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v129 = *MEMORY[0x1E4F502C8];
                    uint64_t v426 = *MEMORY[0x1E4F28568];
                    v130 = v7;
                    v131 = a4;
                    v132 = self;
                    id v133 = [NSString alloc];
                    uint64_t v268 = objc_opt_class();
                    v134 = v133;
                    self = v132;
                    v127 = v21;
                    uint64_t v22 = v18;
                    v135 = v130;
                    id v8 = v367;
                    id v349 = (id)[v134 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v268, @"responseCategory"];
                    id v427 = v349;
                    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v427 forKeys:&v426 count:1];
                    id v136 = (id)[v354 initWithDomain:v129 code:2 userInfo:v23];
                    id v353 = 0;
                    v68 = 0;
                    id *v131 = v136;
                    uint64_t v7 = v135;
                    v80 = v362;
                    id v82 = v355;
                    goto LABEL_318;
                  }
                  id v353 = 0;
                  v68 = 0;
                  v80 = v362;
                  id v82 = v355;
                  v127 = v21;
                  uint64_t v22 = v18;
LABEL_319:

                  goto LABEL_320;
                }
                if (!a4)
                {
                  v68 = 0;
                  v80 = v362;
                  id v82 = v17;
LABEL_322:

                  int v71 = v365;
                  goto LABEL_323;
                }
                id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
                v320 = v7;
                v114 = a4;
                v115 = self;
                uint64_t v116 = *MEMORY[0x1E4F502C8];
                uint64_t v430 = *MEMORY[0x1E4F28568];
                uint64_t v117 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"siriInputLocale"];
                uint64_t v431 = v117;
                v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v431 forKeys:&v430 count:1];
                uint64_t v119 = v116;
                self = v115;
                id *v114 = (id)[v113 initWithDomain:v119 code:2 userInfo:v118];
                uint64_t v7 = v320;

                v68 = 0;
                id v82 = v17;
                uint64_t v22 = (void *)v117;
LABEL_136:
                v80 = v362;
LABEL_321:

                goto LABEL_322;
              }
              if (a4)
              {
                id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v104 = *MEMORY[0x1E4F502C8];
                uint64_t v432 = *MEMORY[0x1E4F28568];
                v105 = v7;
                v106 = a4;
                v107 = self;
                id v108 = [NSString alloc];
                uint64_t v266 = objc_opt_class();
                v109 = v108;
                self = v107;
                v110 = v105;
                id v8 = v367;
                id v82 = (id)[v109 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v266, @"nlLocation"];
                id v433 = v82;
                uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v433 forKeys:&v432 count:1];
                id v111 = (id)[v103 initWithDomain:v104 code:2 userInfo:v22];
                id v358 = 0;
                v68 = 0;
                id *v106 = v111;
                uint64_t v7 = v110;
                goto LABEL_136;
              }
              id v358 = 0;
              v68 = 0;
LABEL_161:
              int v71 = v365;
              v80 = v362;
LABEL_323:

              goto LABEL_324;
            }
            if (a4)
            {
              id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v98 = *MEMORY[0x1E4F502C8];
              uint64_t v434 = *MEMORY[0x1E4F28568];
              id v99 = self;
              id v100 = [NSString alloc];
              uint64_t v265 = objc_opt_class();
              id v101 = v100;
              self = v99;
              id v358 = (id)[v101 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v265, @"asrLocation"];
              id v435 = v358;
              v359 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v435 forKeys:&v434 count:1];
              id v102 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v98, 2);
              id v360 = 0;
              v68 = 0;
              *a4 = v102;
              goto LABEL_161;
            }
            id v360 = 0;
            v68 = 0;
LABEL_155:
            int v71 = v365;
            v80 = v362;
LABEL_324:

            goto LABEL_325;
          }
          if (a4)
          {
            id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v92 = *MEMORY[0x1E4F502C8];
            uint64_t v436 = *MEMORY[0x1E4F28568];
            id v93 = self;
            id v94 = [NSString alloc];
            uint64_t v264 = objc_opt_class();
            id v95 = v94;
            self = v93;
            id v360 = (id)[v95 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v264, @"audioInterfaceProductId"];
            id v437 = v360;
            v361 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v437 forKeys:&v436 count:1];
            id v96 = (id)objc_msgSend(v91, "initWithDomain:code:userInfo:", v92, 2);
            id v363 = 0;
            v68 = 0;
            *a4 = v96;
            goto LABEL_155;
          }
          id v363 = 0;
          v68 = 0;
          int v71 = v365;
          v80 = v362;
LABEL_325:

          goto LABEL_326;
        }
        if (a4)
        {
          id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v86 = *MEMORY[0x1E4F502C8];
          uint64_t v438 = *MEMORY[0x1E4F28568];
          id v87 = self;
          id v88 = [NSString alloc];
          uint64_t v263 = objc_opt_class();
          id v89 = v88;
          self = v87;
          id v363 = (id)[v89 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v263, @"audioInterfaceVendorId"];
          id v439 = v363;
          v364 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v439 forKeys:&v438 count:1];
          id v90 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2);
          v80 = 0;
          v68 = 0;
          *a4 = v90;
          int v71 = v365;
          goto LABEL_325;
        }
        v80 = 0;
        v68 = 0;
        int v71 = v365;
LABEL_326:

        goto LABEL_327;
      }
      if (a4)
      {
        id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v74 = *MEMORY[0x1E4F502C8];
        uint64_t v440 = *MEMORY[0x1E4F28568];
        id v75 = [NSString alloc];
        uint64_t v262 = objc_opt_class();
        v76 = v75;
        id v8 = v367;
        uint64_t v77 = [v76 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v262, @"viewInterface"];
        uint64_t v441 = v77;
        uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v441 forKeys:&v440 count:1];
        uint64_t v79 = v74;
        v80 = (void *)v77;
        v366 = (void *)v78;
        id v81 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v79, 2);
        int v71 = 0;
        v68 = 0;
        *a4 = v81;
        goto LABEL_326;
      }
      int v71 = 0;
      v68 = 0;
LABEL_327:

      goto LABEL_328;
    }
    if (a4)
    {
      id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v70 = *MEMORY[0x1E4F502C8];
      uint64_t v442 = *MEMORY[0x1E4F28568];
      int v71 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"dataSharingOptInStatus"];
      v443 = v71;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v443 forKeys:&v442 count:1];
      id v72 = (id)[v69 initWithDomain:v70 code:2 userInfo:v8];
      id v368 = 0;
      v68 = 0;
      *a4 = v72;
      goto LABEL_327;
    }
    id v368 = 0;
    v68 = 0;
LABEL_328:

    goto LABEL_329;
  }
  if (a4)
  {
    id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v66 = *MEMORY[0x1E4F502C8];
    uint64_t v444 = *MEMORY[0x1E4F28568];
    id v368 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemBuild"];
    v445[0] = v368;
    v370 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v445 forKeys:&v444 count:1];
    id v67 = (id)objc_msgSend(v65, "initWithDomain:code:userInfo:", v66, 2);
    id v369 = 0;
    v68 = 0;
    *a4 = v67;
    goto LABEL_328;
  }
  id v369 = 0;
  v68 = 0;
LABEL_329:

  return v68;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_systemBuild) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasDataSharingOptInStatus) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasViewInterface) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_audioInterfaceVendorId) {
    PBDataWriterWriteStringField();
  }
  if (self->_audioInterfaceProductId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasAsrLocation) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNlLocation) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_siriInputLocale)
  {
    uint64_t v14 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestExperimentMetricsISOLocale *)self->_siriInputLocale writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_subDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasResponseCategory) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasExperimentAllocationStatus) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsTriggered) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFirstTriggerOrAfterFirstTrigger) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_codePathIdUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasTotalTurnCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasValidTurnCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSiriTasksStarted) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSiriTasksCompleted) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFlowTasksStarted) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFlowTasksCompleted) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasReliabilityRequestCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasReliabilityTurnCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasClientErrorCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasUndesiredResponseCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFatalResponseCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFailureResponseCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSiriUnavailableResponseCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasUsdxSessionCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_tuples)
  {
    uint64_t v14 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples *)self->_tuples writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasIsIntelligenceEngineRequest) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_intelligenceEngineRouting;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "unsignedIntValue", (void)v10);
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_hasInvocationSource) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v194.receiver = self;
  v194.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigest;
  uint64_t v5 = [(BMEventBase *)&v194 init];
  if (!v5)
  {
LABEL_317:
    uint64_t v192 = v5;
    goto LABEL_318;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_315:
    uint64_t v189 = [v6 copy];
    intelligenceEngineRouting = v5->_intelligenceEngineRouting;
    v5->_intelligenceEngineRouting = (NSArray *)v189;

    int v191 = v4[*v9];
    if (v191) {
      goto LABEL_316;
    }
    goto LABEL_317;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_315;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v7;
      uint64_t v15 = *(void *)&v4[v14];
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
      *(void *)&v4[v14] = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_13;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        int v19 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    int v19 = v4[*v9];
    if (v4[*v9]) {
      unint64_t v13 = 0;
    }
LABEL_15:
    if (v19 || (v13 & 7) == 4) {
      goto LABEL_315;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 136;
        goto LABEL_86;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        v5->_hasDataSharingOptInStatus = 1;
        while (2)
        {
          uint64_t v26 = *v7;
          uint64_t v27 = *(void *)&v4[v26];
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if (v29 < 0)
            {
              v23 += 7;
              BOOL v18 = v24++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_213;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_213:
        uint64_t v184 = 48;
        goto LABEL_313;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v25 = 0;
        v5->_hasViewInterface = 1;
        while (2)
        {
          uint64_t v32 = *v7;
          uint64_t v33 = *(void *)&v4[v32];
          unint64_t v34 = v33 + 1;
          if (v33 == -1 || v34 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v35 = *(unsigned char *)(*(void *)&v4[*v10] + v33);
            *(void *)&v4[v32] = v34;
            v25 |= (unint64_t)(v35 & 0x7F) << v30;
            if (v35 < 0)
            {
              v30 += 7;
              BOOL v18 = v31++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_217;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_217:
        uint64_t v184 = 52;
        goto LABEL_313;
      case 4u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 144;
        goto LABEL_86;
      case 5u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 152;
        goto LABEL_86;
      case 6u:
        char v36 = 0;
        unsigned int v37 = 0;
        uint64_t v25 = 0;
        v5->_hasAsrLocation = 1;
        while (2)
        {
          uint64_t v38 = *v7;
          uint64_t v39 = *(void *)&v4[v38];
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)&v4[*v10] + v39);
            *(void *)&v4[v38] = v40;
            v25 |= (unint64_t)(v41 & 0x7F) << v36;
            if (v41 < 0)
            {
              v36 += 7;
              BOOL v18 = v37++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_221;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_221:
        uint64_t v184 = 56;
        goto LABEL_313;
      case 7u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v25 = 0;
        v5->_hasNlLocation = 1;
        while (2)
        {
          uint64_t v44 = *v7;
          uint64_t v45 = *(void *)&v4[v44];
          unint64_t v46 = v45 + 1;
          if (v45 == -1 || v46 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v47 = *(unsigned char *)(*(void *)&v4[*v10] + v45);
            *(void *)&v4[v44] = v46;
            v25 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              BOOL v18 = v43++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_225;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_225:
        uint64_t v184 = 60;
        goto LABEL_313;
      case 8u:
        uint64_t v195 = 0;
        uint64_t v196 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_319;
        }
        uint64_t v48 = [[BMSiriOnDeviceDigestExperimentMetricsISOLocale alloc] initByReadFrom:v4];
        if (!v48) {
          goto LABEL_319;
        }
        uint64_t v49 = 160;
        goto LABEL_188;
      case 9u:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 168;
        goto LABEL_86;
      case 0xAu:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v25 = 0;
        v5->_hasResponseCategory = 1;
        while (2)
        {
          uint64_t v52 = *v7;
          uint64_t v53 = *(void *)&v4[v52];
          unint64_t v54 = v53 + 1;
          if (v53 == -1 || v54 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v55 = *(unsigned char *)(*(void *)&v4[*v10] + v53);
            *(void *)&v4[v52] = v54;
            v25 |= (unint64_t)(v55 & 0x7F) << v50;
            if (v55 < 0)
            {
              v50 += 7;
              BOOL v18 = v51++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_229;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_229:
        uint64_t v184 = 64;
        goto LABEL_313;
      case 0xBu:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v25 = 0;
        v5->_hasExperimentAllocationStatus = 1;
        while (2)
        {
          uint64_t v58 = *v7;
          uint64_t v59 = *(void *)&v4[v58];
          unint64_t v60 = v59 + 1;
          if (v59 == -1 || v60 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)&v4[*v10] + v59);
            *(void *)&v4[v58] = v60;
            v25 |= (unint64_t)(v61 & 0x7F) << v56;
            if (v61 < 0)
            {
              v56 += 7;
              BOOL v18 = v57++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_233;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_233:
        uint64_t v184 = 68;
        goto LABEL_313;
      case 0xCu:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v64 = 0;
        v5->_hasIsTriggered = 1;
        while (2)
        {
          uint64_t v65 = *v7;
          uint64_t v66 = *(void *)&v4[v65];
          unint64_t v67 = v66 + 1;
          if (v66 == -1 || v67 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v68 = *(unsigned char *)(*(void *)&v4[*v10] + v66);
            *(void *)&v4[v65] = v67;
            v64 |= (unint64_t)(v68 & 0x7F) << v62;
            if (v68 < 0)
            {
              v62 += 7;
              BOOL v18 = v63++ >= 9;
              if (v18)
              {
                uint64_t v64 = 0;
                goto LABEL_237;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v64 = 0;
        }
LABEL_237:
        BOOL v185 = v64 != 0;
        uint64_t v186 = 22;
        goto LABEL_302;
      case 0xDu:
        char v69 = 0;
        unsigned int v70 = 0;
        uint64_t v71 = 0;
        v5->_hasIsFirstTriggerOrAfterFirstTrigger = 1;
        while (2)
        {
          uint64_t v72 = *v7;
          uint64_t v73 = *(void *)&v4[v72];
          unint64_t v74 = v73 + 1;
          if (v73 == -1 || v74 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)&v4[*v10] + v73);
            *(void *)&v4[v72] = v74;
            v71 |= (unint64_t)(v75 & 0x7F) << v69;
            if (v75 < 0)
            {
              v69 += 7;
              BOOL v18 = v70++ >= 9;
              if (v18)
              {
                uint64_t v71 = 0;
                goto LABEL_241;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v71 = 0;
        }
LABEL_241:
        BOOL v185 = v71 != 0;
        uint64_t v186 = 24;
        goto LABEL_302;
      case 0xEu:
        uint64_t v21 = PBReaderReadString();
        uint64_t v22 = 176;
LABEL_86:
        v76 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;

        goto LABEL_314;
      case 0xFu:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v25 = 0;
        v5->_hasTotalTurnCount = 1;
        while (2)
        {
          uint64_t v79 = *v7;
          uint64_t v80 = *(void *)&v4[v79];
          unint64_t v81 = v80 + 1;
          if (v80 == -1 || v81 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v82 = *(unsigned char *)(*(void *)&v4[*v10] + v80);
            *(void *)&v4[v79] = v81;
            v25 |= (unint64_t)(v82 & 0x7F) << v77;
            if (v82 < 0)
            {
              v77 += 7;
              BOOL v18 = v78++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_245;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_245:
        uint64_t v184 = 72;
        goto LABEL_313;
      case 0x10u:
        char v83 = 0;
        unsigned int v84 = 0;
        uint64_t v25 = 0;
        v5->_hasValidTurnCount = 1;
        while (2)
        {
          uint64_t v85 = *v7;
          uint64_t v86 = *(void *)&v4[v85];
          unint64_t v87 = v86 + 1;
          if (v86 == -1 || v87 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v88 = *(unsigned char *)(*(void *)&v4[*v10] + v86);
            *(void *)&v4[v85] = v87;
            v25 |= (unint64_t)(v88 & 0x7F) << v83;
            if (v88 < 0)
            {
              v83 += 7;
              BOOL v18 = v84++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_249;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_249:
        uint64_t v184 = 76;
        goto LABEL_313;
      case 0x11u:
        char v89 = 0;
        unsigned int v90 = 0;
        uint64_t v25 = 0;
        v5->_hasSiriTasksStarted = 1;
        while (2)
        {
          uint64_t v91 = *v7;
          uint64_t v92 = *(void *)&v4[v91];
          unint64_t v93 = v92 + 1;
          if (v92 == -1 || v93 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v94 = *(unsigned char *)(*(void *)&v4[*v10] + v92);
            *(void *)&v4[v91] = v93;
            v25 |= (unint64_t)(v94 & 0x7F) << v89;
            if (v94 < 0)
            {
              v89 += 7;
              BOOL v18 = v90++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_253;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_253:
        uint64_t v184 = 80;
        goto LABEL_313;
      case 0x12u:
        char v95 = 0;
        unsigned int v96 = 0;
        uint64_t v25 = 0;
        v5->_hasSiriTasksCompleted = 1;
        while (2)
        {
          uint64_t v97 = *v7;
          uint64_t v98 = *(void *)&v4[v97];
          unint64_t v99 = v98 + 1;
          if (v98 == -1 || v99 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v100 = *(unsigned char *)(*(void *)&v4[*v10] + v98);
            *(void *)&v4[v97] = v99;
            v25 |= (unint64_t)(v100 & 0x7F) << v95;
            if (v100 < 0)
            {
              v95 += 7;
              BOOL v18 = v96++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_257;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_257:
        uint64_t v184 = 84;
        goto LABEL_313;
      case 0x13u:
        char v101 = 0;
        unsigned int v102 = 0;
        uint64_t v25 = 0;
        v5->_hasFlowTasksStarted = 1;
        while (2)
        {
          uint64_t v103 = *v7;
          uint64_t v104 = *(void *)&v4[v103];
          unint64_t v105 = v104 + 1;
          if (v104 == -1 || v105 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v106 = *(unsigned char *)(*(void *)&v4[*v10] + v104);
            *(void *)&v4[v103] = v105;
            v25 |= (unint64_t)(v106 & 0x7F) << v101;
            if (v106 < 0)
            {
              v101 += 7;
              BOOL v18 = v102++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_261;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_261:
        uint64_t v184 = 88;
        goto LABEL_313;
      case 0x14u:
        char v107 = 0;
        unsigned int v108 = 0;
        uint64_t v25 = 0;
        v5->_hasFlowTasksCompleted = 1;
        while (2)
        {
          uint64_t v109 = *v7;
          uint64_t v110 = *(void *)&v4[v109];
          unint64_t v111 = v110 + 1;
          if (v110 == -1 || v111 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v112 = *(unsigned char *)(*(void *)&v4[*v10] + v110);
            *(void *)&v4[v109] = v111;
            v25 |= (unint64_t)(v112 & 0x7F) << v107;
            if (v112 < 0)
            {
              v107 += 7;
              BOOL v18 = v108++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_265;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_265:
        uint64_t v184 = 92;
        goto LABEL_313;
      case 0x15u:
        char v113 = 0;
        unsigned int v114 = 0;
        uint64_t v25 = 0;
        v5->_hasReliabilityRequestCount = 1;
        while (2)
        {
          uint64_t v115 = *v7;
          uint64_t v116 = *(void *)&v4[v115];
          unint64_t v117 = v116 + 1;
          if (v116 == -1 || v117 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v118 = *(unsigned char *)(*(void *)&v4[*v10] + v116);
            *(void *)&v4[v115] = v117;
            v25 |= (unint64_t)(v118 & 0x7F) << v113;
            if (v118 < 0)
            {
              v113 += 7;
              BOOL v18 = v114++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_269;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_269:
        uint64_t v184 = 96;
        goto LABEL_313;
      case 0x16u:
        char v119 = 0;
        unsigned int v120 = 0;
        uint64_t v25 = 0;
        v5->_hasReliabilityTurnCount = 1;
        while (2)
        {
          uint64_t v121 = *v7;
          uint64_t v122 = *(void *)&v4[v121];
          unint64_t v123 = v122 + 1;
          if (v122 == -1 || v123 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v124 = *(unsigned char *)(*(void *)&v4[*v10] + v122);
            *(void *)&v4[v121] = v123;
            v25 |= (unint64_t)(v124 & 0x7F) << v119;
            if (v124 < 0)
            {
              v119 += 7;
              BOOL v18 = v120++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_273;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_273:
        uint64_t v184 = 100;
        goto LABEL_313;
      case 0x17u:
        char v125 = 0;
        unsigned int v126 = 0;
        uint64_t v25 = 0;
        v5->_hasClientErrorCount = 1;
        while (2)
        {
          uint64_t v127 = *v7;
          uint64_t v128 = *(void *)&v4[v127];
          unint64_t v129 = v128 + 1;
          if (v128 == -1 || v129 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v130 = *(unsigned char *)(*(void *)&v4[*v10] + v128);
            *(void *)&v4[v127] = v129;
            v25 |= (unint64_t)(v130 & 0x7F) << v125;
            if (v130 < 0)
            {
              v125 += 7;
              BOOL v18 = v126++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_277;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_277:
        uint64_t v184 = 104;
        goto LABEL_313;
      case 0x18u:
        char v131 = 0;
        unsigned int v132 = 0;
        uint64_t v25 = 0;
        v5->_hasUndesiredResponseCount = 1;
        while (2)
        {
          uint64_t v133 = *v7;
          uint64_t v134 = *(void *)&v4[v133];
          unint64_t v135 = v134 + 1;
          if (v134 == -1 || v135 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v136 = *(unsigned char *)(*(void *)&v4[*v10] + v134);
            *(void *)&v4[v133] = v135;
            v25 |= (unint64_t)(v136 & 0x7F) << v131;
            if (v136 < 0)
            {
              v131 += 7;
              BOOL v18 = v132++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_281;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_281:
        uint64_t v184 = 108;
        goto LABEL_313;
      case 0x19u:
        char v137 = 0;
        unsigned int v138 = 0;
        uint64_t v25 = 0;
        v5->_hasFatalResponseCount = 1;
        while (2)
        {
          uint64_t v139 = *v7;
          uint64_t v140 = *(void *)&v4[v139];
          unint64_t v141 = v140 + 1;
          if (v140 == -1 || v141 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v142 = *(unsigned char *)(*(void *)&v4[*v10] + v140);
            *(void *)&v4[v139] = v141;
            v25 |= (unint64_t)(v142 & 0x7F) << v137;
            if (v142 < 0)
            {
              v137 += 7;
              BOOL v18 = v138++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_285;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_285:
        uint64_t v184 = 112;
        goto LABEL_313;
      case 0x1Au:
        char v143 = 0;
        unsigned int v144 = 0;
        uint64_t v25 = 0;
        v5->_hasFailureResponseCount = 1;
        while (2)
        {
          uint64_t v145 = *v7;
          uint64_t v146 = *(void *)&v4[v145];
          unint64_t v147 = v146 + 1;
          if (v146 == -1 || v147 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v148 = *(unsigned char *)(*(void *)&v4[*v10] + v146);
            *(void *)&v4[v145] = v147;
            v25 |= (unint64_t)(v148 & 0x7F) << v143;
            if (v148 < 0)
            {
              v143 += 7;
              BOOL v18 = v144++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_289;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_289:
        uint64_t v184 = 116;
        goto LABEL_313;
      case 0x1Bu:
        char v149 = 0;
        unsigned int v150 = 0;
        uint64_t v25 = 0;
        v5->_hasSiriUnavailableResponseCount = 1;
        while (2)
        {
          uint64_t v151 = *v7;
          uint64_t v152 = *(void *)&v4[v151];
          unint64_t v153 = v152 + 1;
          if (v152 == -1 || v153 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v154 = *(unsigned char *)(*(void *)&v4[*v10] + v152);
            *(void *)&v4[v151] = v153;
            v25 |= (unint64_t)(v154 & 0x7F) << v149;
            if (v154 < 0)
            {
              v149 += 7;
              BOOL v18 = v150++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_293;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_293:
        uint64_t v184 = 120;
        goto LABEL_313;
      case 0x1Cu:
        char v155 = 0;
        unsigned int v156 = 0;
        uint64_t v25 = 0;
        v5->_hasUsdxSessionCount = 1;
        while (2)
        {
          uint64_t v157 = *v7;
          uint64_t v158 = *(void *)&v4[v157];
          unint64_t v159 = v158 + 1;
          if (v158 == -1 || v159 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v160 = *(unsigned char *)(*(void *)&v4[*v10] + v158);
            *(void *)&v4[v157] = v159;
            v25 |= (unint64_t)(v160 & 0x7F) << v155;
            if (v160 < 0)
            {
              v155 += 7;
              BOOL v18 = v156++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_297;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_297:
        uint64_t v184 = 124;
        goto LABEL_313;
      case 0x1Du:
        uint64_t v195 = 0;
        uint64_t v196 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_319;
        }
        uint64_t v48 = [[BMSiriOnDeviceDigestExperimentMetricsExperimentDigestExperimentTuples alloc] initByReadFrom:v4];
        if (!v48) {
          goto LABEL_319;
        }
        uint64_t v49 = 184;
LABEL_188:
        id v161 = *(Class *)((char *)&v5->super.super.isa + v49);
        *(Class *)((char *)&v5->super.super.isa + v49) = v48;

        PBReaderRecallMark();
        goto LABEL_314;
      case 0x1Eu:
        char v162 = 0;
        unsigned int v163 = 0;
        uint64_t v164 = 0;
        v5->_hasIsIntelligenceEngineRequest = 1;
        while (2)
        {
          uint64_t v165 = *v7;
          uint64_t v166 = *(void *)&v4[v165];
          unint64_t v167 = v166 + 1;
          if (v166 == -1 || v167 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v168 = *(unsigned char *)(*(void *)&v4[*v10] + v166);
            *(void *)&v4[v165] = v167;
            v164 |= (unint64_t)(v168 & 0x7F) << v162;
            if (v168 < 0)
            {
              v162 += 7;
              BOOL v18 = v163++ >= 9;
              if (v18)
              {
                uint64_t v164 = 0;
                goto LABEL_301;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v164 = 0;
        }
LABEL_301:
        BOOL v185 = v164 != 0;
        uint64_t v186 = 40;
LABEL_302:
        *((unsigned char *)&v5->super.super.isa + v186) = v185;
        goto LABEL_314;
      case 0x1Fu:
        char v169 = 0;
        unsigned int v170 = 0;
        uint64_t v171 = 0;
        uint64_t v172 = NSNumber;
        while (2)
        {
          uint64_t v173 = *v7;
          uint64_t v174 = *(void *)&v4[v173];
          unint64_t v175 = v174 + 1;
          if (v174 == -1 || v175 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v176 = *(unsigned char *)(*(void *)&v4[*v10] + v174);
            *(void *)&v4[v173] = v175;
            v171 |= (unint64_t)(v176 & 0x7F) << v169;
            if (v176 < 0)
            {
              v169 += 7;
              BOOL v18 = v170++ >= 9;
              if (v18)
              {
                uint64_t v177 = 0;
                goto LABEL_307;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v177 = 0;
        }
        else {
          uint64_t v177 = v171;
        }
LABEL_307:
        uint64_t v187 = [v172 numberWithUnsignedInt:v177];
        if (v187)
        {
          uint64_t v188 = (void *)v187;
          [v6 addObject:v187];

LABEL_314:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_315;
          }
          continue;
        }
LABEL_319:

LABEL_316:
        uint64_t v192 = 0;
LABEL_318:

        return v192;
      case 0x20u:
        char v178 = 0;
        unsigned int v179 = 0;
        uint64_t v25 = 0;
        v5->_hasInvocationSource = 1;
        while (2)
        {
          uint64_t v180 = *v7;
          uint64_t v181 = *(void *)&v4[v180];
          unint64_t v182 = v181 + 1;
          if (v181 == -1 || v182 > *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v183 = *(unsigned char *)(*(void *)&v4[*v10] + v181);
            *(void *)&v4[v180] = v182;
            v25 |= (unint64_t)(v183 & 0x7F) << v178;
            if (v183 < 0)
            {
              v178 += 7;
              BOOL v18 = v179++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_312;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v25) = 0;
        }
LABEL_312:
        uint64_t v184 = 128;
LABEL_313:
        *(_DWORD *)((char *)&v5->super.super.isa + v184) = v25;
        goto LABEL_314;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_319;
        }
        goto LABEL_314;
    }
  }
}

- (NSString)description
{
  id v17 = [NSString alloc];
  unsigned int v37 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self systemBuild];
  char v35 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest dataSharingOptInStatus](self, "dataSharingOptInStatus"));
  char v36 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest viewInterface](self, "viewInterface"));
  uint64_t v33 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceVendorId];
  unint64_t v34 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self audioInterfaceProductId];
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest asrLocation](self, "asrLocation"));
  char v30 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest nlLocation](self, "nlLocation"));
  unsigned int v31 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self siriInputLocale];
  unint64_t v28 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self subDomain];
  char v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest responseCategory](self, "responseCategory"));
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest experimentAllocationStatus](self, "experimentAllocationStatus"));
  uint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isTriggered](self, "isTriggered"));
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isFirstTriggerOrAfterFirstTrigger](self, "isFirstTriggerOrAfterFirstTrigger"));
  unint64_t v16 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self codePathIdUUID];
  unsigned int v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest totalTurnCount](self, "totalTurnCount"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest validTurnCount](self, "validTurnCount"));
  char v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksStarted](self, "siriTasksStarted"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriTasksCompleted](self, "siriTasksCompleted"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksStarted](self, "flowTasksStarted"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest flowTasksCompleted](self, "flowTasksCompleted"));
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityRequestCount](self, "reliabilityRequestCount"));
  unint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest reliabilityTurnCount](self, "reliabilityTurnCount"));
  int v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest clientErrorCount](self, "clientErrorCount"));
  unsigned int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest undesiredResponseCount](self, "undesiredResponseCount"));
  char v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest fatalResponseCount](self, "fatalResponseCount"));
  long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest failureResponseCount](self, "failureResponseCount"));
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest usdxSessionCount](self, "usdxSessionCount"));
  uint64_t v5 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self tuples];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest isIntelligenceEngineRequest](self, "isIntelligenceEngineRequest"));
  uint64_t v7 = [(BMSiriOnDeviceDigestExperimentMetricsExperimentDigest *)self intelligenceEngineRouting];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest invocationSource](self, "invocationSource"));
  BOOL v18 = objc_msgSend(v17, "initWithFormat:", @"BMSiriOnDeviceDigestExperimentMetricsExperimentDigest with systemBuild: %@, dataSharingOptInStatus: %@, viewInterface: %@, audioInterfaceVendorId: %@, audioInterfaceProductId: %@, asrLocation: %@, nlLocation: %@, siriInputLocale: %@, subDomain: %@, responseCategory: %@, experimentAllocationStatus: %@, isTriggered: %@, isFirstTriggerOrAfterFirstTrigger: %@, codePathIdUUID: %@, totalTurnCount: %@, validTurnCount: %@, siriTasksStarted: %@, siriTasksCompleted: %@, flowTasksStarted: %@, flowTasksCompleted: %@, reliabilityRequestCount: %@, reliabilityTurnCount: %@, clientErrorCount: %@, undesiredResponseCount: %@, fatalResponseCount: %@, failureResponseCount: %@, siriUnavailableResponseCount: %@, usdxSessionCount: %@, tuples: %@, isIntelligenceEngineRequest: %@, intelligenceEngineRouting: %@, invocationSource: %@", v37, v35, v36, v33, v34, v32, v30, v31, v28, v29, v27, v25, v26, v16, v24, v15,
                  v23,
                  v14,
                  v22,
                  v21,
                  v20,
                  v13,
                  v19,
                  v12,
                  v11,
                  v10,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v18;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithSystemBuild:(id)a3 dataSharingOptInStatus:(id)a4 viewInterface:(id)a5 audioInterfaceVendorId:(id)a6 audioInterfaceProductId:(id)a7 asrLocation:(id)a8 nlLocation:(id)a9 siriInputLocale:(id)a10 subDomain:(id)a11 responseCategory:(id)a12 experimentAllocationStatus:(id)a13 isTriggered:(id)a14 isFirstTriggerOrAfterFirstTrigger:(id)a15 codePathIdUUID:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 usdxSessionCount:(id)a30 tuples:(id)a31 isIntelligenceEngineRequest:(id)a32 intelligenceEngineRouting:(id)a33 invocationSource:(id)a34
{
  id v88 = a3;
  id v104 = a4;
  id v105 = a5;
  id v78 = a6;
  id v87 = a6;
  id v79 = a7;
  id v86 = a7;
  id v101 = a8;
  id v103 = a9;
  id v85 = a10;
  id v84 = a11;
  id v102 = a12;
  id v39 = a13;
  id v100 = a14;
  id v99 = a15;
  id v40 = a16;
  id v98 = a17;
  id v41 = a18;
  id v42 = a19;
  id v43 = a20;
  id v44 = a21;
  id v45 = a22;
  id v46 = a23;
  id v97 = a24;
  id v96 = a25;
  id v95 = a26;
  id v94 = a27;
  id v93 = a28;
  id v92 = a29;
  id v91 = a30;
  id v83 = a31;
  id v90 = a32;
  id v82 = a33;
  id v89 = a34;
  v106.receiver = self;
  v106.super_class = (Class)BMSiriOnDeviceDigestExperimentMetricsExperimentDigest;
  char v47 = [(BMEventBase *)&v106 init];
  if (v47)
  {
    v47->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v47->_systemBuild, a3);
    if (v104)
    {
      v47->_hasDataSharingOptInStatus = 1;
      int v48 = [v104 intValue];
    }
    else
    {
      v47->_hasDataSharingOptInStatus = 0;
      int v48 = -1;
    }
    v47->_dataSharingOptInStatus = v48;
    if (v105)
    {
      v47->_hasViewInterface = 1;
      int v49 = [v105 intValue];
    }
    else
    {
      v47->_hasViewInterface = 0;
      int v49 = -1;
    }
    unint64_t v81 = v46;
    v47->_viewInterface = v49;
    objc_storeStrong((id *)&v47->_audioInterfaceVendorId, v78);
    objc_storeStrong((id *)&v47->_audioInterfaceProductId, v79);
    id v50 = v45;
    if (v101)
    {
      v47->_hasAsrLocation = 1;
      int v51 = [v101 intValue];
    }
    else
    {
      v47->_hasAsrLocation = 0;
      int v51 = -1;
    }
    id v52 = v44;
    v47->_asrLocation = v51;
    id v53 = v43;
    if (v103)
    {
      v47->_hasNlLocation = 1;
      int v54 = [v103 intValue];
    }
    else
    {
      v47->_hasNlLocation = 0;
      int v54 = -1;
    }
    id v55 = v42;
    v47->_nlLocation = v54;
    objc_storeStrong((id *)&v47->_siriInputLocale, a10);
    objc_storeStrong((id *)&v47->_subDomain, a11);
    char v56 = v41;
    if (v102)
    {
      v47->_hasResponseCategory = 1;
      int v57 = [v102 intValue];
    }
    else
    {
      v47->_hasResponseCategory = 0;
      int v57 = -1;
    }
    id v58 = v40;
    v47->_responseCategory = v57;
    if (v39)
    {
      v47->_hasExperimentAllocationStatus = 1;
      id v59 = v39;
      int v60 = [v39 intValue];
    }
    else
    {
      id v59 = 0;
      v47->_hasExperimentAllocationStatus = 0;
      int v60 = -1;
    }
    v47->_experimentAllocationStatus = v60;
    if (v100)
    {
      v47->_hasIsTriggered = 1;
      v47->_isTriggered = [v100 BOOLValue];
    }
    else
    {
      v47->_hasIsTriggered = 0;
      v47->_isTriggered = 0;
    }
    if (v99)
    {
      v47->_hasIsFirstTriggerOrAfterFirstTrigger = 1;
      v47->_isFirstTriggerOrAfterFirstTrigger = [v99 BOOLValue];
    }
    else
    {
      v47->_hasIsFirstTriggerOrAfterFirstTrigger = 0;
      v47->_isFirstTriggerOrAfterFirstTrigger = 0;
    }
    objc_storeStrong((id *)&v47->_codePathIdUUID, a16);
    id v39 = v59;
    unsigned int v61 = v98;
    if (v98)
    {
      v47->_hasTotalTurnCount = 1;
      unsigned int v61 = [v98 unsignedIntValue];
    }
    else
    {
      v47->_hasTotalTurnCount = 0;
    }
    id v40 = v58;
    v47->_totalTurnCount = v61;
    id v41 = v56;
    if (v56)
    {
      v47->_hasValidTurnCount = 1;
      unsigned int v62 = [v56 unsignedIntValue];
    }
    else
    {
      unsigned int v62 = 0;
      v47->_hasValidTurnCount = 0;
    }
    id v42 = v55;
    v47->_validTurnCount = v62;
    id v43 = v53;
    if (v42)
    {
      v47->_hasSiriTasksStarted = 1;
      unsigned int v63 = [v42 unsignedIntValue];
    }
    else
    {
      unsigned int v63 = 0;
      v47->_hasSiriTasksStarted = 0;
    }
    id v44 = v52;
    v47->_siriTasksStarted = v63;
    id v45 = v50;
    if (v43)
    {
      v47->_hasSiriTasksCompleted = 1;
      unsigned int v64 = [v43 unsignedIntValue];
    }
    else
    {
      unsigned int v64 = 0;
      v47->_hasSiriTasksCompleted = 0;
    }
    id v46 = v81;
    v47->_siriTasksCompleted = v64;
    if (v44)
    {
      v47->_hasFlowTasksStarted = 1;
      unsigned int v65 = [v44 unsignedIntValue];
    }
    else
    {
      unsigned int v65 = 0;
      v47->_hasFlowTasksStarted = 0;
    }
    v47->_flowTasksStarted = v65;
    if (v45)
    {
      v47->_hasFlowTasksCompleted = 1;
      unsigned int v66 = [v45 unsignedIntValue];
    }
    else
    {
      unsigned int v66 = 0;
      v47->_hasFlowTasksCompleted = 0;
    }
    v47->_flowTasksCompleted = v66;
    if (v81)
    {
      v47->_hasReliabilityRequestCount = 1;
      unsigned int v67 = [v81 unsignedIntValue];
    }
    else
    {
      unsigned int v67 = 0;
      v47->_hasReliabilityRequestCount = 0;
    }
    v47->_reliabilityRequestCount = v67;
    unsigned int v68 = v97;
    if (v97)
    {
      v47->_hasReliabilityTurnCount = 1;
      unsigned int v68 = [v97 unsignedIntValue];
    }
    else
    {
      v47->_hasReliabilityTurnCount = 0;
    }
    v47->_reliabilityTurnCount = v68;
    unsigned int v69 = v96;
    if (v96)
    {
      v47->_hasClientErrorCount = 1;
      unsigned int v69 = [v96 unsignedIntValue];
    }
    else
    {
      v47->_hasClientErrorCount = 0;
    }
    v47->_clientErrorCount = v69;
    unsigned int v70 = v95;
    if (v95)
    {
      v47->_hasUndesiredResponseCount = 1;
      unsigned int v70 = [v95 unsignedIntValue];
    }
    else
    {
      v47->_hasUndesiredResponseCount = 0;
    }
    v47->_undesiredResponseCount = v70;
    unsigned int v71 = v94;
    if (v94)
    {
      v47->_hasFatalResponseCount = 1;
      unsigned int v71 = [v94 unsignedIntValue];
    }
    else
    {
      v47->_hasFatalResponseCount = 0;
    }
    v47->_fatalResponseCount = v71;
    unsigned int v72 = v93;
    if (v93)
    {
      v47->_hasFailureResponseCount = 1;
      unsigned int v72 = [v93 unsignedIntValue];
    }
    else
    {
      v47->_hasFailureResponseCount = 0;
    }
    v47->_failureResponseCount = v72;
    unsigned int v73 = v92;
    if (v92)
    {
      v47->_hasSiriUnavailableResponseCount = 1;
      unsigned int v73 = [v92 unsignedIntValue];
    }
    else
    {
      v47->_hasSiriUnavailableResponseCount = 0;
    }
    v47->_siriUnavailableResponseCount = v73;
    unsigned int v74 = v91;
    if (v91)
    {
      v47->_hasUsdxSessionCount = 1;
      unsigned int v74 = [v91 unsignedIntValue];
    }
    else
    {
      v47->_hasUsdxSessionCount = 0;
    }
    v47->_usdxSessionCount = v74;
    objc_storeStrong((id *)&v47->_tuples, a31);
    if (v90)
    {
      v47->_hasIsIntelligenceEngineRequest = 1;
      v47->_isIntelligenceEngineRequest = [v90 BOOLValue];
    }
    else
    {
      v47->_hasIsIntelligenceEngineRequest = 0;
      v47->_isIntelligenceEngineRequest = 0;
    }
    objc_storeStrong((id *)&v47->_intelligenceEngineRouting, a33);
    unsigned int v75 = v89;
    if (v89)
    {
      v47->_hasInvocationSource = 1;
      unsigned int v75 = [v89 unsignedIntValue];
    }
    else
    {
      v47->_hasInvocationSource = 0;
    }
    v47->_invocationSource = v75;
  }

  return v47;
}

+ (id)protoFields
{
  v36[32] = *MEMORY[0x1E4F143B8];
  char v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemBuild" number:1 type:13 subMessageClass:0];
  v36[0] = v35;
  unint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dataSharingOptInStatus" number:2 type:2 subMessageClass:0];
  v36[1] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewInterface" number:3 type:2 subMessageClass:0];
  v36[2] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioInterfaceVendorId" number:4 type:13 subMessageClass:0];
  v36[3] = v32;
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioInterfaceProductId" number:5 type:13 subMessageClass:0];
  v36[4] = v31;
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"asrLocation" number:6 type:2 subMessageClass:0];
  v36[5] = v30;
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nlLocation" number:7 type:2 subMessageClass:0];
  v36[6] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriInputLocale" number:8 type:14 subMessageClass:objc_opt_class()];
  v36[7] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subDomain" number:9 type:13 subMessageClass:0];
  v36[8] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"responseCategory" number:10 type:2 subMessageClass:0];
  v36[9] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"experimentAllocationStatus" number:11 type:2 subMessageClass:0];
  v36[10] = v25;
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTriggered" number:12 type:12 subMessageClass:0];
  v36[11] = v24;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFirstTriggerOrAfterFirstTrigger" number:13 type:12 subMessageClass:0];
  v36[12] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"codePathIdUUID" number:14 type:13 subMessageClass:0];
  v36[13] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalTurnCount" number:15 type:4 subMessageClass:0];
  v36[14] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"validTurnCount" number:16 type:4 subMessageClass:0];
  v36[15] = v20;
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriTasksStarted" number:17 type:4 subMessageClass:0];
  v36[16] = v19;
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriTasksCompleted" number:18 type:4 subMessageClass:0];
  v36[17] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flowTasksStarted" number:19 type:4 subMessageClass:0];
  v36[18] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flowTasksCompleted" number:20 type:4 subMessageClass:0];
  v36[19] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reliabilityRequestCount" number:21 type:4 subMessageClass:0];
  v36[20] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reliabilityTurnCount" number:22 type:4 subMessageClass:0];
  v36[21] = v14;
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientErrorCount" number:23 type:4 subMessageClass:0];
  v36[22] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"undesiredResponseCount" number:24 type:4 subMessageClass:0];
  v36[23] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fatalResponseCount" number:25 type:4 subMessageClass:0];
  v36[24] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"failureResponseCount" number:26 type:4 subMessageClass:0];
  v36[25] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriUnavailableResponseCount" number:27 type:4 subMessageClass:0];
  v36[26] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usdxSessionCount" number:28 type:4 subMessageClass:0];
  v36[27] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tuples" number:29 type:14 subMessageClass:objc_opt_class()];
  v36[28] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isIntelligenceEngineRequest" number:30 type:12 subMessageClass:0];
  v36[29] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intelligenceEngineRouting" number:31 type:4 subMessageClass:0];
  v36[30] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"invocationSource" number:32 type:4 subMessageClass:0];
  v36[31] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:32];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5B50;
}

+ (id)columns
{
  v36[32] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemBuild" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  char v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dataSharingOptInStatus" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  unint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewInterface" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioInterfaceVendorId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioInterfaceProductId" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"asrLocation" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nlLocation" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"siriInputLocale_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_445];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subDomain" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"responseCategory" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:2 convertedType:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"experimentAllocationStatus" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTriggered" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFirstTriggerOrAfterFirstTrigger" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"codePathIdUUID" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalTurnCount" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"validTurnCount" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriTasksStarted" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:4 convertedType:0];
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriTasksCompleted" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  BOOL v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"flowTasksStarted" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"flowTasksCompleted" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reliabilityRequestCount" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reliabilityTurnCount" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientErrorCount" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"undesiredResponseCount" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fatalResponseCount" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:4 convertedType:0];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"failureResponseCount" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:4 convertedType:0];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriUnavailableResponseCount" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:4 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"usdxSessionCount" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"tuples_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_447];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isIntelligenceEngineRequest" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:12 convertedType:0];
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"intelligenceEngineRouting_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_449_53374];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"invocationSource" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:4 convertedType:0];
  v36[0] = v14;
  v36[1] = v35;
  v36[2] = v34;
  v36[3] = v33;
  v36[4] = v32;
  v36[5] = v31;
  v36[6] = v30;
  v36[7] = v29;
  v36[8] = v28;
  v36[9] = v27;
  v36[10] = v26;
  v36[11] = v25;
  v36[12] = v24;
  v36[13] = v23;
  v36[14] = v22;
  v36[15] = v21;
  v36[16] = v20;
  v36[17] = v19;
  v36[18] = v18;
  v36[19] = v17;
  v36[20] = v16;
  v36[21] = v15;
  v36[22] = v2;
  v36[23] = v3;
  v36[24] = v4;
  v36[25] = v13;
  v36[26] = v12;
  v36[27] = v5;
  v36[28] = v6;
  v36[29] = v7;
  v36[30] = v11;
  v36[31] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:32];

  return v10;
}

id __64__BMSiriOnDeviceDigestExperimentMetricsExperimentDigest_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _intelligenceEngineRoutingJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __64__BMSiriOnDeviceDigestExperimentMetricsExperimentDigest_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 tuples];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __64__BMSiriOnDeviceDigestExperimentMetricsExperimentDigest_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 siriInputLocale];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[11] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSiriOnDeviceDigestExperimentMetricsExperimentDigest)initWithSystemBuild:(id)a3 dataSharingOptInStatus:(id)a4 viewInterface:(id)a5 audioInterfaceVendorId:(id)a6 audioInterfaceProductId:(id)a7 asrLocation:(id)a8 nlLocation:(id)a9 siriInputLocale:(id)a10 subDomain:(id)a11 responseCategory:(id)a12 experimentAllocationStatus:(id)a13 isTriggered:(id)a14 isFirstTriggerOrAfterFirstTrigger:(id)a15 codePathIdUUID:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 usdxSessionCount:(id)a30 tuples:(id)a31
{
  return -[BMSiriOnDeviceDigestExperimentMetricsExperimentDigest initWithSystemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:subDomain:responseCategory:experimentAllocationStatus:isTriggered:isFirstTriggerOrAfterFirstTrigger:codePathIdUUID:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:usdxSessionCount:tuples:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:](self, "initWithSystemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:subDomain:responseCategory:experimentAllocationStatus:isTriggered:isFirstTriggerOrAfterFirstTrigger:codePathIdUUID:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:usdxSessionCount:tuples:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           0,
           MEMORY[0x1E4F1CBF0],
           0);
}

@end