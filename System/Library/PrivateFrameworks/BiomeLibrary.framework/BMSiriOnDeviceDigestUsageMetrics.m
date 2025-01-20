@interface BMSiriOnDeviceDigestUsageMetrics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29;
- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 asrTurnCount:(id)a30 siriResponseId:(id)a31 responseCategory:(id)a32;
- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 asrTurnCount:(id)a30 siriResponseId:(id)a31 responseCategory:(id)a32 isIntelligenceEngineRequest:(id)a33 intelligenceEngineRouting:(id)a34;
- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 asrTurnCount:(id)a30 siriResponseId:(id)a31 responseCategory:(id)a32 isIntelligenceEngineRequest:(id)a33 intelligenceEngineRouting:(id)a34 invocationSource:(id)a35;
- (BMSiriOnDeviceDigestUsageMetrics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestUsageMetricsEventMetadata)eventMetadata;
- (BMSiriOnDeviceDigestUsageMetricsISOLocale)dictationLocale;
- (BMSiriOnDeviceDigestUsageMetricsISOLocale)siriInputLocale;
- (BOOL)hasAsrLocation;
- (BOOL)hasAsrTurnCount;
- (BOOL)hasClientErrorCount;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasFailureResponseCount;
- (BOOL)hasFatalResponseCount;
- (BOOL)hasFlowTasksCompleted;
- (BOOL)hasFlowTasksStarted;
- (BOOL)hasInvocationSource;
- (BOOL)hasIsIntelligenceEngineRequest;
- (BOOL)hasNlLocation;
- (BOOL)hasProductId;
- (BOOL)hasProgramCode;
- (BOOL)hasReliabilityRequestCount;
- (BOOL)hasReliabilityTurnCount;
- (BOOL)hasResponseCategory;
- (BOOL)hasSiriTasksCompleted;
- (BOOL)hasSiriTasksStarted;
- (BOOL)hasSiriUnavailableResponseCount;
- (BOOL)hasTotalTurnCount;
- (BOOL)hasUndesiredResponseCount;
- (BOOL)hasValidTurnCount;
- (BOOL)hasViewInterface;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIntelligenceEngineRequest;
- (NSArray)intelligenceEngineRouting;
- (NSString)audioInterfaceProductId;
- (NSString)audioInterfaceVendorId;
- (NSString)description;
- (NSString)deviceType;
- (NSString)siriResponseId;
- (NSString)subDomain;
- (NSString)systemBuild;
- (id)_intelligenceEngineRoutingJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)asrLocation;
- (int)dataSharingOptInStatus;
- (int)nlLocation;
- (int)productId;
- (int)programCode;
- (int)viewInterface;
- (unsigned)asrTurnCount;
- (unsigned)clientErrorCount;
- (unsigned)dataVersion;
- (unsigned)failureResponseCount;
- (unsigned)fatalResponseCount;
- (unsigned)flowTasksCompleted;
- (unsigned)flowTasksStarted;
- (unsigned)invocationSource;
- (unsigned)reliabilityRequestCount;
- (unsigned)reliabilityTurnCount;
- (unsigned)responseCategory;
- (unsigned)siriTasksCompleted;
- (unsigned)siriTasksStarted;
- (unsigned)siriUnavailableResponseCount;
- (unsigned)totalTurnCount;
- (unsigned)undesiredResponseCount;
- (unsigned)validTurnCount;
- (void)setHasAsrLocation:(BOOL)a3;
- (void)setHasAsrTurnCount:(BOOL)a3;
- (void)setHasClientErrorCount:(BOOL)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasFailureResponseCount:(BOOL)a3;
- (void)setHasFatalResponseCount:(BOOL)a3;
- (void)setHasFlowTasksCompleted:(BOOL)a3;
- (void)setHasFlowTasksStarted:(BOOL)a3;
- (void)setHasInvocationSource:(BOOL)a3;
- (void)setHasIsIntelligenceEngineRequest:(BOOL)a3;
- (void)setHasNlLocation:(BOOL)a3;
- (void)setHasProductId:(BOOL)a3;
- (void)setHasProgramCode:(BOOL)a3;
- (void)setHasReliabilityRequestCount:(BOOL)a3;
- (void)setHasReliabilityTurnCount:(BOOL)a3;
- (void)setHasResponseCategory:(BOOL)a3;
- (void)setHasSiriTasksCompleted:(BOOL)a3;
- (void)setHasSiriTasksStarted:(BOOL)a3;
- (void)setHasSiriUnavailableResponseCount:(BOOL)a3;
- (void)setHasTotalTurnCount:(BOOL)a3;
- (void)setHasUndesiredResponseCount:(BOOL)a3;
- (void)setHasValidTurnCount:(BOOL)a3;
- (void)setHasViewInterface:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestUsageMetrics

+ (id)columns
{
  v37[33] = *MEMORY[0x1E4F143B8];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"eventMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_370];
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceType" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"programCode" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"productId" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemBuild" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dataSharingOptInStatus" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewInterface" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioInterfaceVendorId" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioInterfaceProductId" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"asrLocation" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:2 convertedType:0];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nlLocation" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:2 convertedType:0];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"siriInputLocale_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_372_45996];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"dictationLocale_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_374_45997];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subDomain" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalTurnCount" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"validTurnCount" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriTasksStarted" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:4 convertedType:0];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriTasksCompleted" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"flowTasksStarted" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"flowTasksCompleted" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reliabilityRequestCount" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"reliabilityTurnCount" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:4 convertedType:0];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientErrorCount" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"undesiredResponseCount" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:4 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fatalResponseCount" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"failureResponseCount" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:4 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriUnavailableResponseCount" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:4 convertedType:0];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"asrTurnCount" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:4 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriResponseId" dataType:2 requestOnly:0 fieldNumber:29 protoDataType:13 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"responseCategory" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:4 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isIntelligenceEngineRequest" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:12 convertedType:0];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"intelligenceEngineRouting_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_376_45998];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"invocationSource" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:4 convertedType:0];
  v37[0] = v14;
  v37[1] = v36;
  v37[2] = v35;
  v37[3] = v34;
  v37[4] = v33;
  v37[5] = v32;
  v37[6] = v31;
  v37[7] = v30;
  v37[8] = v29;
  v37[9] = v28;
  v37[10] = v27;
  v37[11] = v26;
  v37[12] = v25;
  v37[13] = v24;
  v37[14] = v23;
  v37[15] = v22;
  v37[16] = v21;
  v37[17] = v20;
  v37[18] = v19;
  v37[19] = v18;
  v37[20] = v17;
  v37[21] = v16;
  v37[22] = v15;
  v37[23] = v2;
  v37[24] = v3;
  v37[25] = v4;
  v37[26] = v13;
  v37[27] = v12;
  v37[28] = v5;
  v37[29] = v6;
  v37[30] = v7;
  v37[31] = v11;
  v37[32] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:33];

  return v10;
}

- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 asrTurnCount:(id)a30 siriResponseId:(id)a31 responseCategory:(id)a32 isIntelligenceEngineRequest:(id)a33 intelligenceEngineRouting:(id)a34
{
  return -[BMSiriOnDeviceDigestUsageMetrics initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:](self, "initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
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
           a32,
           a33,
           a34,
           0);
}

- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 asrTurnCount:(id)a30 siriResponseId:(id)a31 responseCategory:(id)a32
{
  return -[BMSiriOnDeviceDigestUsageMetrics initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:isIntelligenceEngineRequest:intelligenceEngineRouting:](self, "initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:isIntelligenceEngineRequest:intelligenceEngineRouting:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
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
           a32,
           0,
           MEMORY[0x1E4F1CBF0]);
}

- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29
{
  return -[BMSiriOnDeviceDigestUsageMetrics initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:](self, "initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
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
           0,
           0,
           0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intelligenceEngineRouting, 0);
  objc_storeStrong((id *)&self->_siriResponseId, 0);
  objc_storeStrong((id *)&self->_subDomain, 0);
  objc_storeStrong((id *)&self->_dictationLocale, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_audioInterfaceProductId, 0);
  objc_storeStrong((id *)&self->_audioInterfaceVendorId, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);

  objc_storeStrong((id *)&self->_eventMetadata, 0);
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

- (void)setHasResponseCategory:(BOOL)a3
{
  self->_hasResponseCategory = a3;
}

- (BOOL)hasResponseCategory
{
  return self->_hasResponseCategory;
}

- (unsigned)responseCategory
{
  return self->_responseCategory;
}

- (NSString)siriResponseId
{
  return self->_siriResponseId;
}

- (void)setHasAsrTurnCount:(BOOL)a3
{
  self->_hasAsrTurnCount = a3;
}

- (BOOL)hasAsrTurnCount
{
  return self->_hasAsrTurnCount;
}

- (unsigned)asrTurnCount
{
  return self->_asrTurnCount;
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

- (NSString)subDomain
{
  return self->_subDomain;
}

- (BMSiriOnDeviceDigestUsageMetricsISOLocale)dictationLocale
{
  return self->_dictationLocale;
}

- (BMSiriOnDeviceDigestUsageMetricsISOLocale)siriInputLocale
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

- (void)setHasProductId:(BOOL)a3
{
  self->_hasProductId = a3;
}

- (BOOL)hasProductId
{
  return self->_hasProductId;
}

- (int)productId
{
  return self->_productId;
}

- (void)setHasProgramCode:(BOOL)a3
{
  self->_hasProgramCode = a3;
}

- (BOOL)hasProgramCode
{
  return self->_hasProgramCode;
}

- (int)programCode
{
  return self->_programCode;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (BMSiriOnDeviceDigestUsageMetricsEventMetadata)eventMetadata
{
  return self->_eventMetadata;
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
    v6 = [(BMSiriOnDeviceDigestUsageMetrics *)self eventMetadata];
    uint64_t v7 = [v5 eventMetadata];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestUsageMetrics *)self eventMetadata];
      id v10 = [v5 eventMetadata];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_158;
      }
    }
    v13 = [(BMSiriOnDeviceDigestUsageMetrics *)self deviceType];
    uint64_t v14 = [v5 deviceType];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriOnDeviceDigestUsageMetrics *)self deviceType];
      v17 = [v5 deviceType];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasProgramCode]
      || [v5 hasProgramCode])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasProgramCode]) {
        goto LABEL_158;
      }
      if (![v5 hasProgramCode]) {
        goto LABEL_158;
      }
      int v19 = [(BMSiriOnDeviceDigestUsageMetrics *)self programCode];
      if (v19 != [v5 programCode]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasProductId]
      || [v5 hasProductId])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasProductId]) {
        goto LABEL_158;
      }
      if (![v5 hasProductId]) {
        goto LABEL_158;
      }
      int v20 = [(BMSiriOnDeviceDigestUsageMetrics *)self productId];
      if (v20 != [v5 productId]) {
        goto LABEL_158;
      }
    }
    v21 = [(BMSiriOnDeviceDigestUsageMetrics *)self systemBuild];
    uint64_t v22 = [v5 systemBuild];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      v24 = [(BMSiriOnDeviceDigestUsageMetrics *)self systemBuild];
      v25 = [v5 systemBuild];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasDataSharingOptInStatus]
      || [v5 hasDataSharingOptInStatus])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasDataSharingOptInStatus]) {
        goto LABEL_158;
      }
      if (![v5 hasDataSharingOptInStatus]) {
        goto LABEL_158;
      }
      int v27 = [(BMSiriOnDeviceDigestUsageMetrics *)self dataSharingOptInStatus];
      if (v27 != [v5 dataSharingOptInStatus]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasViewInterface]
      || [v5 hasViewInterface])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasViewInterface]) {
        goto LABEL_158;
      }
      if (![v5 hasViewInterface]) {
        goto LABEL_158;
      }
      int v28 = [(BMSiriOnDeviceDigestUsageMetrics *)self viewInterface];
      if (v28 != [v5 viewInterface]) {
        goto LABEL_158;
      }
    }
    v29 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceVendorId];
    uint64_t v30 = [v5 audioInterfaceVendorId];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceVendorId];
      v33 = [v5 audioInterfaceVendorId];
      int v34 = [v32 isEqual:v33];

      if (!v34) {
        goto LABEL_158;
      }
    }
    v35 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceProductId];
    uint64_t v36 = [v5 audioInterfaceProductId];
    if (v35 == (void *)v36)
    {
    }
    else
    {
      v37 = (void *)v36;
      v38 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceProductId];
      v39 = [v5 audioInterfaceProductId];
      int v40 = [v38 isEqual:v39];

      if (!v40) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasAsrLocation]
      || [v5 hasAsrLocation])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasAsrLocation]) {
        goto LABEL_158;
      }
      if (![v5 hasAsrLocation]) {
        goto LABEL_158;
      }
      int v41 = [(BMSiriOnDeviceDigestUsageMetrics *)self asrLocation];
      if (v41 != [v5 asrLocation]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasNlLocation]
      || [v5 hasNlLocation])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasNlLocation]) {
        goto LABEL_158;
      }
      if (![v5 hasNlLocation]) {
        goto LABEL_158;
      }
      int v42 = [(BMSiriOnDeviceDigestUsageMetrics *)self nlLocation];
      if (v42 != [v5 nlLocation]) {
        goto LABEL_158;
      }
    }
    v43 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriInputLocale];
    uint64_t v44 = [v5 siriInputLocale];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriInputLocale];
      v47 = [v5 siriInputLocale];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_158;
      }
    }
    v49 = [(BMSiriOnDeviceDigestUsageMetrics *)self dictationLocale];
    uint64_t v50 = [v5 dictationLocale];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMSiriOnDeviceDigestUsageMetrics *)self dictationLocale];
      v53 = [v5 dictationLocale];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_158;
      }
    }
    v55 = [(BMSiriOnDeviceDigestUsageMetrics *)self subDomain];
    uint64_t v56 = [v5 subDomain];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMSiriOnDeviceDigestUsageMetrics *)self subDomain];
      v59 = [v5 subDomain];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasTotalTurnCount]
      || [v5 hasTotalTurnCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasTotalTurnCount]) {
        goto LABEL_158;
      }
      if (![v5 hasTotalTurnCount]) {
        goto LABEL_158;
      }
      unsigned int v61 = [(BMSiriOnDeviceDigestUsageMetrics *)self totalTurnCount];
      if (v61 != [v5 totalTurnCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasValidTurnCount]
      || [v5 hasValidTurnCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasValidTurnCount]) {
        goto LABEL_158;
      }
      if (![v5 hasValidTurnCount]) {
        goto LABEL_158;
      }
      unsigned int v62 = [(BMSiriOnDeviceDigestUsageMetrics *)self validTurnCount];
      if (v62 != [v5 validTurnCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriTasksStarted]
      || [v5 hasSiriTasksStarted])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriTasksStarted]) {
        goto LABEL_158;
      }
      if (![v5 hasSiriTasksStarted]) {
        goto LABEL_158;
      }
      unsigned int v63 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriTasksStarted];
      if (v63 != [v5 siriTasksStarted]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriTasksCompleted]
      || [v5 hasSiriTasksCompleted])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriTasksCompleted]) {
        goto LABEL_158;
      }
      if (![v5 hasSiriTasksCompleted]) {
        goto LABEL_158;
      }
      unsigned int v64 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriTasksCompleted];
      if (v64 != [v5 siriTasksCompleted]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFlowTasksStarted]
      || [v5 hasFlowTasksStarted])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasFlowTasksStarted]) {
        goto LABEL_158;
      }
      if (![v5 hasFlowTasksStarted]) {
        goto LABEL_158;
      }
      unsigned int v65 = [(BMSiriOnDeviceDigestUsageMetrics *)self flowTasksStarted];
      if (v65 != [v5 flowTasksStarted]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFlowTasksCompleted]
      || [v5 hasFlowTasksCompleted])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasFlowTasksCompleted]) {
        goto LABEL_158;
      }
      if (![v5 hasFlowTasksCompleted]) {
        goto LABEL_158;
      }
      unsigned int v66 = [(BMSiriOnDeviceDigestUsageMetrics *)self flowTasksCompleted];
      if (v66 != [v5 flowTasksCompleted]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasReliabilityRequestCount]
      || [v5 hasReliabilityRequestCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasReliabilityRequestCount]) {
        goto LABEL_158;
      }
      if (![v5 hasReliabilityRequestCount]) {
        goto LABEL_158;
      }
      unsigned int v67 = [(BMSiriOnDeviceDigestUsageMetrics *)self reliabilityRequestCount];
      if (v67 != [v5 reliabilityRequestCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasReliabilityTurnCount]
      || [v5 hasReliabilityTurnCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasReliabilityTurnCount]) {
        goto LABEL_158;
      }
      if (![v5 hasReliabilityTurnCount]) {
        goto LABEL_158;
      }
      unsigned int v68 = [(BMSiriOnDeviceDigestUsageMetrics *)self reliabilityTurnCount];
      if (v68 != [v5 reliabilityTurnCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasClientErrorCount]
      || [v5 hasClientErrorCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasClientErrorCount]) {
        goto LABEL_158;
      }
      if (![v5 hasClientErrorCount]) {
        goto LABEL_158;
      }
      unsigned int v69 = [(BMSiriOnDeviceDigestUsageMetrics *)self clientErrorCount];
      if (v69 != [v5 clientErrorCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasUndesiredResponseCount]
      || [v5 hasUndesiredResponseCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasUndesiredResponseCount]) {
        goto LABEL_158;
      }
      if (![v5 hasUndesiredResponseCount]) {
        goto LABEL_158;
      }
      unsigned int v70 = [(BMSiriOnDeviceDigestUsageMetrics *)self undesiredResponseCount];
      if (v70 != [v5 undesiredResponseCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFatalResponseCount]
      || [v5 hasFatalResponseCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasFatalResponseCount]) {
        goto LABEL_158;
      }
      if (![v5 hasFatalResponseCount]) {
        goto LABEL_158;
      }
      unsigned int v71 = [(BMSiriOnDeviceDigestUsageMetrics *)self fatalResponseCount];
      if (v71 != [v5 fatalResponseCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFailureResponseCount]
      || [v5 hasFailureResponseCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasFailureResponseCount]) {
        goto LABEL_158;
      }
      if (![v5 hasFailureResponseCount]) {
        goto LABEL_158;
      }
      unsigned int v72 = [(BMSiriOnDeviceDigestUsageMetrics *)self failureResponseCount];
      if (v72 != [v5 failureResponseCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriUnavailableResponseCount]
      || [v5 hasSiriUnavailableResponseCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriUnavailableResponseCount]) {
        goto LABEL_158;
      }
      if (![v5 hasSiriUnavailableResponseCount]) {
        goto LABEL_158;
      }
      unsigned int v73 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriUnavailableResponseCount];
      if (v73 != [v5 siriUnavailableResponseCount]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasAsrTurnCount]
      || [v5 hasAsrTurnCount])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasAsrTurnCount]) {
        goto LABEL_158;
      }
      if (![v5 hasAsrTurnCount]) {
        goto LABEL_158;
      }
      unsigned int v74 = [(BMSiriOnDeviceDigestUsageMetrics *)self asrTurnCount];
      if (v74 != [v5 asrTurnCount]) {
        goto LABEL_158;
      }
    }
    v75 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriResponseId];
    uint64_t v76 = [v5 siriResponseId];
    if (v75 == (void *)v76)
    {
    }
    else
    {
      v77 = (void *)v76;
      v78 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriResponseId];
      v79 = [v5 siriResponseId];
      int v80 = [v78 isEqual:v79];

      if (!v80) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasResponseCategory]
      || [v5 hasResponseCategory])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasResponseCategory]) {
        goto LABEL_158;
      }
      if (![v5 hasResponseCategory]) {
        goto LABEL_158;
      }
      unsigned int v81 = [(BMSiriOnDeviceDigestUsageMetrics *)self responseCategory];
      if (v81 != [v5 responseCategory]) {
        goto LABEL_158;
      }
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasIsIntelligenceEngineRequest]
      || [v5 hasIsIntelligenceEngineRequest])
    {
      if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasIsIntelligenceEngineRequest]) {
        goto LABEL_158;
      }
      if (![v5 hasIsIntelligenceEngineRequest]) {
        goto LABEL_158;
      }
      int v82 = [(BMSiriOnDeviceDigestUsageMetrics *)self isIntelligenceEngineRequest];
      if (v82 != [v5 isIntelligenceEngineRequest]) {
        goto LABEL_158;
      }
    }
    v83 = [(BMSiriOnDeviceDigestUsageMetrics *)self intelligenceEngineRouting];
    uint64_t v84 = [v5 intelligenceEngineRouting];
    if (v83 == (void *)v84)
    {
    }
    else
    {
      v85 = (void *)v84;
      v86 = [(BMSiriOnDeviceDigestUsageMetrics *)self intelligenceEngineRouting];
      v87 = [v5 intelligenceEngineRouting];
      int v88 = [v86 isEqual:v87];

      if (!v88) {
        goto LABEL_158;
      }
    }
    if (![(BMSiriOnDeviceDigestUsageMetrics *)self hasInvocationSource]
      && ![v5 hasInvocationSource])
    {
      BOOL v12 = 1;
      goto LABEL_159;
    }
    if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasInvocationSource]
      && [v5 hasInvocationSource])
    {
      unsigned int v89 = [(BMSiriOnDeviceDigestUsageMetrics *)self invocationSource];
      BOOL v12 = v89 == [v5 invocationSource];
LABEL_159:

      goto LABEL_160;
    }
LABEL_158:
    BOOL v12 = 0;
    goto LABEL_159;
  }
  BOOL v12 = 0;
LABEL_160:

  return v12;
}

- (id)jsonDictionary
{
  v110[33] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriOnDeviceDigestUsageMetrics *)self eventMetadata];
  uint64_t v4 = [v3 jsonDictionary];

  uint64_t v5 = [(BMSiriOnDeviceDigestUsageMetrics *)self deviceType];
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasProgramCode])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics programCode](self, "programCode"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasProductId])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics productId](self, "productId"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [(BMSiriOnDeviceDigestUsageMetrics *)self systemBuild];
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasDataSharingOptInStatus])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics dataSharingOptInStatus](self, "dataSharingOptInStatus"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasViewInterface])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics viewInterface](self, "viewInterface"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v107 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceVendorId];
  v106 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceProductId];
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasAsrLocation])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics asrLocation](self, "asrLocation"));
    id v105 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v105 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasNlLocation])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics nlLocation](self, "nlLocation"));
    id v104 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v104 = 0;
  }
  int v11 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriInputLocale];
  v103 = [v11 jsonDictionary];

  BOOL v12 = [(BMSiriOnDeviceDigestUsageMetrics *)self dictationLocale];
  v102 = [v12 jsonDictionary];

  v101 = [(BMSiriOnDeviceDigestUsageMetrics *)self subDomain];
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasTotalTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics totalTurnCount](self, "totalTurnCount"));
    id v100 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v100 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasValidTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics validTurnCount](self, "validTurnCount"));
    id v99 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v99 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriTasksStarted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics siriTasksStarted](self, "siriTasksStarted"));
    id v98 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v98 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriTasksCompleted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics siriTasksCompleted](self, "siriTasksCompleted"));
    id v97 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v97 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFlowTasksStarted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics flowTasksStarted](self, "flowTasksStarted"));
    id v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v96 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFlowTasksCompleted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics flowTasksCompleted](self, "flowTasksCompleted"));
    id v95 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v95 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasReliabilityRequestCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics reliabilityRequestCount](self, "reliabilityRequestCount"));
    id v94 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v94 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasReliabilityTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics reliabilityTurnCount](self, "reliabilityTurnCount"));
    id v93 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v93 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasClientErrorCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics clientErrorCount](self, "clientErrorCount"));
    id v92 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v92 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasUndesiredResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics undesiredResponseCount](self, "undesiredResponseCount"));
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v91 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFatalResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics fatalResponseCount](self, "fatalResponseCount"));
    id v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v90 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasFailureResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics failureResponseCount](self, "failureResponseCount"));
    id v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v89 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasSiriUnavailableResponseCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v88 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasAsrTurnCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics asrTurnCount](self, "asrTurnCount"));
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v87 = 0;
  }
  v86 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriResponseId];
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasResponseCategory])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics responseCategory](self, "responseCategory"));
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v85 = 0;
  }
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasIsIntelligenceEngineRequest])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestUsageMetrics isIntelligenceEngineRequest](self, "isIntelligenceEngineRequest"));
    id v84 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v84 = 0;
  }
  v83 = [(BMSiriOnDeviceDigestUsageMetrics *)self _intelligenceEngineRoutingJSONArray];
  if ([(BMSiriOnDeviceDigestUsageMetrics *)self hasInvocationSource])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics invocationSource](self, "invocationSource"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  v109[0] = @"eventMetadata";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v75 = (void *)v14;
  v110[0] = v14;
  v109[1] = @"deviceType";
  uint64_t v15 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v74 = (void *)v15;
  v110[1] = v15;
  v109[2] = @"programCode";
  uint64_t v16 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v73 = (void *)v16;
  v110[2] = v16;
  v109[3] = @"productId";
  uint64_t v17 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v72 = (void *)v17;
  v110[3] = v17;
  v109[4] = @"systemBuild";
  uint64_t v18 = v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v71 = (void *)v18;
  v110[4] = v18;
  v109[5] = @"dataSharingOptInStatus";
  uint64_t v19 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v70 = (void *)v19;
  v110[5] = v19;
  v109[6] = @"viewInterface";
  uint64_t v20 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v69 = (void *)v20;
  v110[6] = v20;
  v109[7] = @"audioInterfaceVendorId";
  uint64_t v21 = (uint64_t)v107;
  if (!v107)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v110[7] = v21;
  v109[8] = @"audioInterfaceProductId";
  uint64_t v22 = (uint64_t)v106;
  if (!v106)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v110[8] = v22;
  v109[9] = @"asrLocation";
  uint64_t v23 = (uint64_t)v105;
  if (!v105)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v78 = (void *)v23;
  v110[9] = v23;
  v109[10] = @"nlLocation";
  uint64_t v24 = (uint64_t)v104;
  if (!v104)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = (void *)v24;
  v110[10] = v24;
  v109[11] = @"siriInputLocale";
  uint64_t v25 = (uint64_t)v103;
  if (!v103)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v108 = (void *)v25;
  v110[11] = v25;
  v109[12] = @"dictationLocale";
  uint64_t v26 = (uint64_t)v102;
  if (!v102)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v67 = (void *)v26;
  v110[12] = v26;
  v109[13] = @"subDomain";
  uint64_t v27 = (uint64_t)v101;
  if (!v101)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v66 = (void *)v27;
  v110[13] = v27;
  v109[14] = @"totalTurnCount";
  uint64_t v28 = (uint64_t)v100;
  if (!v100)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v65 = (void *)v28;
  v110[14] = v28;
  v109[15] = @"validTurnCount";
  uint64_t v29 = (uint64_t)v99;
  if (!v99)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v64 = (void *)v29;
  v110[15] = v29;
  v109[16] = @"siriTasksStarted";
  uint64_t v30 = (uint64_t)v98;
  if (!v98)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v63 = (void *)v30;
  v110[16] = v30;
  v109[17] = @"siriTasksCompleted";
  uint64_t v31 = (uint64_t)v97;
  if (!v97)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v62 = (void *)v31;
  v110[17] = v31;
  v109[18] = @"flowTasksStarted";
  uint64_t v32 = (uint64_t)v96;
  if (!v96)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v61 = (void *)v32;
  v110[18] = v32;
  v109[19] = @"flowTasksCompleted";
  uint64_t v33 = (uint64_t)v95;
  if (!v95)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  int v60 = (void *)v33;
  v110[19] = v33;
  v109[20] = @"reliabilityRequestCount";
  uint64_t v34 = (uint64_t)v94;
  if (!v94)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v34;
  v110[20] = v34;
  v109[21] = @"reliabilityTurnCount";
  uint64_t v35 = (uint64_t)v93;
  if (!v93)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v35;
  v110[21] = v35;
  v109[22] = @"clientErrorCount";
  uint64_t v36 = (uint64_t)v92;
  if (!v92)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v36;
  v110[22] = v36;
  v109[23] = @"undesiredResponseCount";
  uint64_t v37 = (uint64_t)v91;
  if (!v91)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v81 = (void *)v4;
  uint64_t v56 = (void *)v37;
  v110[23] = v37;
  v109[24] = @"fatalResponseCount";
  uint64_t v38 = (uint64_t)v90;
  if (!v90)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v38;
  v110[24] = v38;
  v109[25] = @"failureResponseCount";
  uint64_t v39 = (uint64_t)v89;
  if (!v89)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v79 = v10;
  int v54 = (void *)v39;
  v110[25] = v39;
  v109[26] = @"siriUnavailableResponseCount";
  uint64_t v40 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  int v80 = (void *)v5;
  v53 = (void *)v40;
  v110[26] = v40;
  v109[27] = @"asrTurnCount";
  uint64_t v41 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v68 = (void *)v21;
  uint64_t v51 = v41;
  v110[27] = v41;
  v109[28] = @"siriResponseId";
  int v42 = v86;
  if (!v86)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v41, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v21,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
    int v42 = v75);
  }
  int v82 = v13;
  v110[28] = v42;
  v109[29] = @"responseCategory";
  v43 = v85;
  if (!v85)
  {
    v43 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v44 = (void *)v8;
  v110[29] = v43;
  v109[30] = @"isIntelligenceEngineRequest";
  v45 = v84;
  if (!v84)
  {
    v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v22;
  v110[30] = v45;
  v109[31] = @"intelligenceEngineRouting";
  v47 = v83;
  if (!v83)
  {
    v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v110[31] = v47;
  v109[32] = @"invocationSource";
  int v48 = v82;
  if (!v82)
  {
    int v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v110[32] = v48;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v110, v109, 33, v51);
  id v76 = (id)objc_claimAutoreleasedReturnValue();
  if (!v82) {

  }
  v49 = v108;
  if (!v83)
  {

    v49 = v108;
  }
  if (!v84)
  {

    v49 = v108;
  }
  if (!v85)
  {

    v49 = v108;
  }
  if (!v86)
  {

    v49 = v108;
  }
  if (!v87)
  {

    v49 = v108;
  }
  if (!v88)
  {

    v49 = v108;
  }
  if (!v89)
  {

    v49 = v108;
  }
  if (!v90)
  {

    v49 = v108;
  }
  if (!v91)
  {

    v49 = v108;
  }
  if (!v92)
  {

    v49 = v108;
  }
  if (!v93)
  {

    v49 = v108;
  }
  if (!v94)
  {

    v49 = v108;
  }
  if (!v95)
  {

    v49 = v108;
  }
  if (!v96)
  {

    v49 = v108;
  }
  if (!v97)
  {

    v49 = v108;
  }
  if (!v98)
  {

    v49 = v108;
  }
  if (!v99)
  {

    v49 = v108;
  }
  if (!v100)
  {

    v49 = v108;
  }
  if (!v101)
  {

    v49 = v108;
  }
  if (!v102)
  {

    v49 = v108;
  }
  if (!v103) {

  }
  if (!v104) {
  if (!v105)
  }

  if (!v106) {
  if (v107)
  }
  {
    if (v79) {
      goto LABEL_188;
    }
  }
  else
  {

    if (v79)
    {
LABEL_188:
      if (v9) {
        goto LABEL_189;
      }
      goto LABEL_199;
    }
  }

  if (v9)
  {
LABEL_189:
    if (v44) {
      goto LABEL_190;
    }
    goto LABEL_200;
  }
LABEL_199:

  if (v44)
  {
LABEL_190:
    if (v7) {
      goto LABEL_191;
    }
    goto LABEL_201;
  }
LABEL_200:

  if (v7)
  {
LABEL_191:
    if (v6) {
      goto LABEL_192;
    }
    goto LABEL_202;
  }
LABEL_201:

  if (v6)
  {
LABEL_192:
    if (v80) {
      goto LABEL_193;
    }
LABEL_203:

    if (v81) {
      goto LABEL_194;
    }
    goto LABEL_204;
  }
LABEL_202:

  if (!v80) {
    goto LABEL_203;
  }
LABEL_193:
  if (v81) {
    goto LABEL_194;
  }
LABEL_204:

LABEL_194:

  return v76;
}

- (id)_intelligenceEngineRoutingJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMSiriOnDeviceDigestUsageMetrics *)self intelligenceEngineRouting];
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

- (BMSiriOnDeviceDigestUsageMetrics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v565[1] = *MEMORY[0x1E4F143B8];
  id v487 = a3;
  v486 = [v487 objectForKeyedSubscript:@"eventMetadata"];
  if (v486 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v564 = *MEMORY[0x1E4F28568];
        uint64_t v6 = (BMSiriOnDeviceDigestUsageMetricsEventMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"eventMetadata"];
        v565[0] = v6;
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v565 forKeys:&v564 count:1];
        uint64_t v36 = v33;
        id v8 = (id)v35;
        uint64_t v32 = 0;
        *a4 = (id)[v36 initWithDomain:v34 code:2 userInfo:v35];
        goto LABEL_335;
      }
      uint64_t v32 = 0;
      goto LABEL_336;
    }
    id v8 = v486;
    id v494 = 0;
    uint64_t v6 = [[BMSiriOnDeviceDigestUsageMetricsEventMetadata alloc] initWithJSONDictionary:v8 error:&v494];
    id v30 = v494;
    if (v30)
    {
      uint64_t v31 = v30;
      if (a4) {
        *a4 = v30;
      }

      uint64_t v32 = 0;
      goto LABEL_335;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v487 objectForKeyedSubscript:@"deviceType"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v38 = a4;
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v562 = *MEMORY[0x1E4F28568];
        id v485 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceType"];
        id v563 = v485;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v563 forKeys:&v562 count:1];
        id v40 = (id)[v37 initWithDomain:v39 code:2 userInfo:v9];
        id v8 = 0;
        uint64_t v32 = 0;
        id *v38 = v40;
        goto LABEL_333;
      }
      id v8 = 0;
      uint64_t v32 = 0;
      goto LABEL_334;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v487 objectForKeyedSubscript:@"programCode"];
  v484 = self;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        uint64_t v41 = v9;
        id v42 = v8;
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = a4;
        v45 = v6;
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v560 = *MEMORY[0x1E4F28568];
        v47 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"programCode"];
        v561 = v47;
        long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v561 forKeys:&v560 count:1];
        int v48 = v43;
        id v8 = v42;
        id v9 = v41;
        uint64_t v49 = v46;
        uint64_t v6 = v45;
        a4 = v47;
        id v485 = 0;
        uint64_t v32 = 0;
        *uint64_t v44 = (id)[v48 initWithDomain:v49 code:2 userInfo:v10];
        goto LABEL_332;
      }
      id v485 = 0;
      uint64_t v32 = 0;
      goto LABEL_333;
    }
    id v485 = v9;
  }
  else
  {
    id v485 = 0;
  }
  long long v10 = [v487 objectForKeyedSubscript:@"productId"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v53 = v8;
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        v55 = v6;
        uint64_t v56 = *MEMORY[0x1E4F502C8];
        uint64_t v558 = *MEMORY[0x1E4F28568];
        v57 = a4;
        id v483 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"productId"];
        id v559 = v483;
        uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v559 forKeys:&v558 count:1];
        v59 = v54;
        id v8 = v53;
        uint64_t v60 = v56;
        uint64_t v6 = v55;
        long long v11 = (void *)v58;
        a4 = 0;
        uint64_t v32 = 0;
        id *v57 = (id)[v59 initWithDomain:v60 code:2 userInfo:v58];
        goto LABEL_331;
      }
      uint64_t v32 = 0;
      goto LABEL_332;
    }
    v482 = v10;
  }
  else
  {
    v482 = 0;
  }
  long long v11 = [v487 objectForKeyedSubscript:@"systemBuild"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v483 = 0;
        uint64_t v32 = 0;
        a4 = v482;
        goto LABEL_331;
      }
      v471 = v7;
      id v61 = objc_alloc(MEMORY[0x1E4F28C58]);
      v476 = a4;
      uint64_t v62 = *MEMORY[0x1E4F502C8];
      uint64_t v556 = *MEMORY[0x1E4F28568];
      id v481 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemBuild"];
      id v557 = v481;
      long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v557 forKeys:&v556 count:1];
      unsigned int v63 = v61;
      uint64_t v7 = v471;
      id v483 = 0;
      uint64_t v32 = 0;
      id *v476 = (id)[v63 initWithDomain:v62 code:2 userInfo:v12];
      goto LABEL_163;
    }
    id v483 = v11;
  }
  else
  {
    id v483 = 0;
  }
  long long v12 = [v487 objectForKeyedSubscript:@"dataSharingOptInStatus"];
  id v480 = v8;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v481 = v12;
        goto LABEL_19;
      }
      if (a4)
      {
        v459 = v11;
        unsigned int v64 = v7;
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        unsigned int v66 = a4;
        uint64_t v67 = *MEMORY[0x1E4F502C8];
        uint64_t v554 = *MEMORY[0x1E4F28568];
        unsigned int v68 = v10;
        unsigned int v69 = v6;
        id v70 = [NSString alloc];
        uint64_t v386 = objc_opt_class();
        unsigned int v71 = v70;
        uint64_t v6 = v69;
        long long v10 = v68;
        id v479 = (id)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v386, @"dataSharingOptInStatus"];
        id v555 = v479;
        uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v555 forKeys:&v554 count:1];
        unsigned int v73 = v65;
        long long v13 = (void *)v72;
        uint64_t v7 = v64;
        long long v11 = v459;
        id v481 = 0;
        uint64_t v32 = 0;
        *unsigned int v66 = (id)[v73 initWithDomain:v67 code:2 userInfo:v72];
        goto LABEL_169;
      }
      id v481 = 0;
      uint64_t v32 = 0;
LABEL_163:
      a4 = v482;
      goto LABEL_330;
    }
  }
  id v481 = 0;
LABEL_19:
  long long v13 = [v487 objectForKeyedSubscript:@"viewInterface"];
  v478 = v13;
  v475 = a4;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v479 = v13;
        goto LABEL_22;
      }
      if (a4)
      {
        v460 = v11;
        unsigned int v74 = v12;
        v75 = v7;
        id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
        v77 = a4;
        uint64_t v78 = *MEMORY[0x1E4F502C8];
        uint64_t v552 = *MEMORY[0x1E4F28568];
        v79 = v10;
        int v80 = v6;
        id v81 = [NSString alloc];
        uint64_t v387 = objc_opt_class();
        int v82 = v81;
        uint64_t v6 = v80;
        long long v10 = v79;
        id v469 = (id)[v82 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v387, @"viewInterface"];
        id v553 = v469;
        uint64_t v83 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v553 forKeys:&v552 count:1];
        id v84 = v76;
        long long v13 = v478;
        uint64_t v7 = v75;
        long long v12 = v74;
        long long v11 = v460;
        v474 = (void *)v83;
        id v479 = 0;
        uint64_t v32 = 0;
        id *v77 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v78, 2);
        a4 = v482;
        goto LABEL_328;
      }
      id v479 = 0;
      uint64_t v32 = 0;
LABEL_169:
      a4 = v482;
      goto LABEL_329;
    }
  }
  id v479 = 0;
LABEL_22:
  uint64_t v14 = [v487 objectForKeyedSubscript:@"audioInterfaceVendorId"];
  v474 = (void *)v14;
  if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v50 = v11;
    uint64_t v51 = v10;
    v52 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v475)
      {
        id v469 = 0;
        uint64_t v32 = 0;
        long long v10 = v51;
        a4 = v482;
        long long v11 = v50;
        long long v13 = v478;
        goto LABEL_328;
      }
      v472 = v7;
      id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v91 = *MEMORY[0x1E4F502C8];
      uint64_t v550 = *MEMORY[0x1E4F28568];
      id v467 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"audioInterfaceVendorId"];
      id v551 = v467;
      uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v551 forKeys:&v550 count:1];
      id v93 = v90;
      uint64_t v7 = v472;
      v468 = (void *)v92;
      id v469 = 0;
      uint64_t v32 = 0;
      id *v475 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2);
      goto LABEL_179;
    }
    id v469 = v15;
    long long v10 = v51;
    long long v11 = v50;
    long long v13 = v478;
  }
  else
  {
    id v469 = 0;
  }
  uint64_t v16 = [v487 objectForKeyedSubscript:@"audioInterfaceProductId"];
  v468 = (void *)v16;
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v50 = v11;
      uint64_t v51 = v10;
      v52 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v467 = v17;
        long long v10 = v51;
        long long v11 = v50;
        long long v13 = v478;
        goto LABEL_28;
      }
      if (v475)
      {
        v473 = v7;
        id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v95 = *MEMORY[0x1E4F502C8];
        uint64_t v548 = *MEMORY[0x1E4F28568];
        id v465 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"audioInterfaceProductId"];
        id v549 = v465;
        uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v549 forKeys:&v548 count:1];
        id v97 = v94;
        uint64_t v7 = v473;
        v466 = (void *)v96;
        id v467 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v95, 2);
        long long v10 = v51;
        a4 = v482;
        long long v11 = v50;
        long long v13 = v478;
        goto LABEL_326;
      }
      id v467 = 0;
      uint64_t v32 = 0;
LABEL_179:
      uint64_t v6 = v52;
      long long v10 = v51;
      a4 = v482;
      long long v11 = v50;
      long long v13 = v478;
      goto LABEL_327;
    }
  }
  id v467 = 0;
LABEL_28:
  uint64_t v18 = [v487 objectForKeyedSubscript:@"asrLocation"];
  v466 = (void *)v18;
  if (v18 && (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v475)
      {
        v461 = v11;
        v102 = v12;
        v103 = v7;
        id v104 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v105 = *MEMORY[0x1E4F502C8];
        uint64_t v546 = *MEMORY[0x1E4F28568];
        v106 = v10;
        v107 = v6;
        id v108 = [NSString alloc];
        uint64_t v388 = objc_opt_class();
        v109 = v108;
        uint64_t v6 = v107;
        long long v10 = v106;
        id v463 = (id)[v109 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v388, @"asrLocation"];
        id v547 = v463;
        uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v547 forKeys:&v546 count:1];
        v111 = v104;
        long long v13 = v478;
        uint64_t v7 = v103;
        long long v12 = v102;
        long long v11 = v461;
        v464 = (void *)v110;
        id v465 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v105, 2);
        a4 = v482;
        goto LABEL_325;
      }
      id v465 = 0;
      uint64_t v32 = 0;
      a4 = v482;
      goto LABEL_326;
    }
    uint64_t v20 = v6;
    uint64_t v21 = v9;
    uint64_t v22 = v12;
    id v465 = v19;
  }
  else
  {
    uint64_t v20 = v6;
    uint64_t v21 = v9;
    uint64_t v22 = v12;
    id v465 = 0;
  }
  uint64_t v23 = [v487 objectForKeyedSubscript:@"nlLocation"];
  v470 = v7;
  v462 = v21;
  v464 = (void *)v23;
  if (v23 && (uint64_t v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v475)
      {
        id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v113 = *MEMORY[0x1E4F502C8];
        uint64_t v544 = *MEMORY[0x1E4F28568];
        id v25 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nlLocation"];
        id v545 = v25;
        uint64_t v114 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v545 forKeys:&v544 count:1];
        uint64_t v115 = v113;
        uint64_t v6 = v20;
        long long v12 = v22;
        id v89 = (void *)v114;
        id v463 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)[v112 initWithDomain:v115 code:2 userInfo:v114];
        a4 = v482;
        goto LABEL_323;
      }
      id v463 = 0;
      uint64_t v32 = 0;
      a4 = v482;
      long long v12 = v22;
      id v9 = v21;
      uint64_t v6 = v20;
      goto LABEL_325;
    }
    id v463 = v24;
  }
  else
  {
    id v463 = 0;
  }
  id v25 = [v487 objectForKeyedSubscript:@"siriInputLocale"];
  long long v12 = v22;
  if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v438 = v22;
    v456 = v10;
    id v85 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = v20;
      if (v475)
      {
        id v156 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v157 = *MEMORY[0x1E4F502C8];
        uint64_t v542 = *MEMORY[0x1E4F28568];
        v158 = v6;
        id v159 = [NSString alloc];
        uint64_t v389 = objc_opt_class();
        v160 = v159;
        uint64_t v6 = v158;
        uint64_t v161 = [v160 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v389, @"siriInputLocale"];
        uint64_t v543 = v161;
        v162 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v543 forKeys:&v542 count:1];
        uint64_t v163 = v157;
        id v89 = (void *)v161;
        id *v475 = (id)[v156 initWithDomain:v163 code:2 userInfo:v162];

        uint64_t v32 = 0;
        id v25 = v85;
        long long v10 = v456;
        a4 = v482;
        long long v12 = v438;
        goto LABEL_323;
      }
      uint64_t v32 = 0;
      a4 = v482;
      long long v12 = v22;
      goto LABEL_324;
    }
    id v25 = v25;
    v86 = [BMSiriOnDeviceDigestUsageMetricsISOLocale alloc];
    id v493 = 0;
    uint64_t v457 = [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)v86 initWithJSONDictionary:v25 error:&v493];
    id v87 = v493;
    uint64_t v6 = v20;
    if (v87)
    {
      id v88 = v87;
      a4 = v482;
      if (v475) {
        id *v475 = v87;
      }

      uint64_t v32 = 0;
      long long v12 = v22;
      id v89 = (void *)v457;
      goto LABEL_323;
    }

    long long v12 = v22;
    id v25 = v85;
  }
  else
  {
    uint64_t v457 = 0;
  }
  uint64_t v26 = [v487 objectForKeyedSubscript:@"dictationLocale"];
  v458 = (void *)v26;
  if (!v26 || (uint64_t v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v455 = 0;
    goto LABEL_40;
  }
  id v447 = v25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v475)
    {
      uint64_t v32 = 0;
      a4 = v482;
      id v89 = (void *)v457;
      uint64_t v6 = v20;
      goto LABEL_322;
    }
    id v454 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v164 = *MEMORY[0x1E4F502C8];
    uint64_t v540 = *MEMORY[0x1E4F28568];
    id v165 = [NSString alloc];
    uint64_t v390 = objc_opt_class();
    v166 = v165;
    uint64_t v6 = v20;
    v455 = (BMSiriOnDeviceDigestUsageMetricsISOLocale *)[v166 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v390, @"dictationLocale"];
    v541 = v455;
    uint64_t v167 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v541 forKeys:&v540 count:1];
    v168 = v454;
    id v453 = (id)v167;
    uint64_t v32 = 0;
    id *v475 = (id)objc_msgSend(v168, "initWithDomain:code:userInfo:", v164, 2);
    a4 = v482;
LABEL_174:
    id v25 = v447;
    id v89 = (void *)v457;
    goto LABEL_321;
  }
  id v98 = v27;
  id v99 = [BMSiriOnDeviceDigestUsageMetricsISOLocale alloc];
  id v492 = 0;
  v455 = [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)v99 initWithJSONDictionary:v98 error:&v492];
  id v100 = v492;
  if (v100)
  {
    v101 = v100;
    id v453 = v98;
    a4 = v482;
    uint64_t v6 = v20;
    if (v475) {
      id *v475 = v100;
    }

    uint64_t v32 = 0;
    goto LABEL_174;
  }

  id v25 = v447;
LABEL_40:
  uint64_t v28 = [v487 objectForKeyedSubscript:@"subDomain"];
  v452 = (void *)v28;
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    objc_opt_class();
    uint64_t v6 = v20;
    if (objc_opt_isKindOfClass())
    {
      id v453 = 0;
    }
    else
    {
      id v448 = v25;
      v116 = v11;
      v117 = v10;
      v118 = v20;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v475)
        {
          id v453 = 0;
          uint64_t v32 = 0;
          uint64_t v6 = v20;
          long long v10 = v117;
          a4 = v482;
          long long v11 = v116;
          id v25 = v448;
          id v89 = (void *)v457;
          goto LABEL_320;
        }
        id v169 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v170 = *MEMORY[0x1E4F502C8];
        uint64_t v538 = *MEMORY[0x1E4F28568];
        v171 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subDomain"];
        v539 = v171;
        v451 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v539 forKeys:&v538 count:1];
        id v453 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v169, "initWithDomain:code:userInfo:", v170, 2);
        uint64_t v6 = v118;
        long long v10 = v117;
        a4 = v482;
        long long v11 = v116;
        id v25 = v448;
        goto LABEL_216;
      }
      id v453 = v29;
      uint64_t v6 = v20;
      long long v10 = v117;
      long long v11 = v116;
      id v25 = v448;
    }
  }
  else
  {
    id v453 = 0;
    uint64_t v6 = v20;
  }
  uint64_t v119 = [v487 objectForKeyedSubscript:@"totalTurnCount"];
  v451 = (void *)v119;
  if (v119)
  {
    v120 = (void *)v119;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v445 = v120;
        goto LABEL_112;
      }
      if (v475)
      {
        id v172 = v25;
        id v173 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v174 = *MEMORY[0x1E4F502C8];
        uint64_t v536 = *MEMORY[0x1E4F28568];
        v175 = v12;
        v176 = v11;
        v177 = v10;
        v178 = v6;
        id v179 = [NSString alloc];
        uint64_t v391 = objc_opt_class();
        v180 = v179;
        uint64_t v6 = v178;
        long long v10 = v177;
        long long v11 = v176;
        long long v12 = v175;
        id v446 = (id)[v180 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v391, @"totalTurnCount"];
        id v537 = v446;
        uint64_t v181 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v537 forKeys:&v536 count:1];
        v182 = v173;
        id v25 = v172;
        v450 = (void *)v181;
        v171 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v174, 2);
        a4 = v482;
        id v89 = (void *)v457;
        goto LABEL_318;
      }
      v171 = 0;
      uint64_t v32 = 0;
      a4 = v482;
LABEL_216:
      id v89 = (void *)v457;
      goto LABEL_319;
    }
  }
  id v445 = 0;
LABEL_112:
  uint64_t v121 = [v487 objectForKeyedSubscript:@"validTurnCount"];
  v450 = (void *)v121;
  if (v121 && (v122 = (void *)v121, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v475)
      {
        id v446 = 0;
        uint64_t v32 = 0;
        a4 = v482;
        id v89 = (void *)v457;
        v171 = v445;
        goto LABEL_318;
      }
      id v183 = v25;
      id v184 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v185 = *MEMORY[0x1E4F502C8];
      uint64_t v534 = *MEMORY[0x1E4F28568];
      v186 = v12;
      v187 = v11;
      v188 = v10;
      v189 = v6;
      id v190 = [NSString alloc];
      uint64_t v392 = objc_opt_class();
      v191 = v190;
      uint64_t v6 = v189;
      long long v10 = v188;
      long long v11 = v187;
      long long v12 = v186;
      id v443 = (id)[v191 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v392, @"validTurnCount"];
      id v535 = v443;
      uint64_t v192 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v535 forKeys:&v534 count:1];
      v193 = v184;
      id v25 = v183;
      v444 = (void *)v192;
      id v446 = 0;
      uint64_t v32 = 0;
      id *v475 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v185, 2);
      goto LABEL_227;
    }
    id v446 = v122;
  }
  else
  {
    id v446 = 0;
  }
  uint64_t v123 = [v487 objectForKeyedSubscript:@"siriTasksStarted"];
  v444 = (void *)v123;
  if (v123)
  {
    v124 = (void *)v123;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v443 = v124;
        goto LABEL_118;
      }
      if (v475)
      {
        id v194 = v25;
        id v195 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v196 = *MEMORY[0x1E4F502C8];
        uint64_t v532 = *MEMORY[0x1E4F28568];
        v197 = v12;
        v198 = v11;
        v199 = v10;
        v200 = v6;
        id v201 = [NSString alloc];
        uint64_t v393 = objc_opt_class();
        v202 = v201;
        uint64_t v6 = v200;
        long long v10 = v199;
        long long v11 = v198;
        long long v12 = v197;
        id v441 = (id)[v202 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v393, @"siriTasksStarted"];
        id v533 = v441;
        uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v533 forKeys:&v532 count:1];
        v204 = v195;
        id v25 = v194;
        v442 = (void *)v203;
        id v443 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v196, 2);
        goto LABEL_233;
      }
      id v443 = 0;
      uint64_t v32 = 0;
LABEL_227:
      a4 = v482;
      id v89 = (void *)v457;
      v171 = v445;
      goto LABEL_317;
    }
  }
  id v443 = 0;
LABEL_118:
  uint64_t v125 = [v487 objectForKeyedSubscript:@"siriTasksCompleted"];
  v442 = (void *)v125;
  if (v125)
  {
    v126 = (void *)v125;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v441 = v126;
        goto LABEL_121;
      }
      if (v475)
      {
        id v205 = v25;
        id v206 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v207 = *MEMORY[0x1E4F502C8];
        uint64_t v530 = *MEMORY[0x1E4F28568];
        v208 = v12;
        v209 = v11;
        v210 = v10;
        v211 = v6;
        id v212 = [NSString alloc];
        uint64_t v394 = objc_opt_class();
        v213 = v212;
        uint64_t v6 = v211;
        long long v10 = v210;
        long long v11 = v209;
        long long v12 = v208;
        id v436 = (id)[v213 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v394, @"siriTasksCompleted"];
        id v531 = v436;
        uint64_t v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v531 forKeys:&v530 count:1];
        v215 = v206;
        id v25 = v205;
        v437 = (void *)v214;
        id v441 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v207, 2);
        goto LABEL_239;
      }
      id v441 = 0;
      uint64_t v32 = 0;
LABEL_233:
      a4 = v482;
      id v89 = (void *)v457;
      v171 = v445;
      goto LABEL_316;
    }
  }
  id v441 = 0;
LABEL_121:
  uint64_t v127 = [v487 objectForKeyedSubscript:@"flowTasksStarted"];
  v437 = (void *)v127;
  if (v127)
  {
    v128 = (void *)v127;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v436 = v128;
        goto LABEL_124;
      }
      if (v475)
      {
        id v216 = v25;
        id v217 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v218 = *MEMORY[0x1E4F502C8];
        uint64_t v528 = *MEMORY[0x1E4F28568];
        v219 = v12;
        v220 = v11;
        v221 = v10;
        v222 = v6;
        id v223 = [NSString alloc];
        uint64_t v395 = objc_opt_class();
        v224 = v223;
        uint64_t v6 = v222;
        long long v10 = v221;
        long long v11 = v220;
        long long v12 = v219;
        id v434 = (id)[v224 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v395, @"flowTasksStarted"];
        id v529 = v434;
        uint64_t v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v529 forKeys:&v528 count:1];
        v226 = v217;
        id v25 = v216;
        v435 = (void *)v225;
        id v436 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v226, "initWithDomain:code:userInfo:", v218, 2);
        goto LABEL_259;
      }
      id v436 = 0;
      uint64_t v32 = 0;
LABEL_239:
      a4 = v482;
      id v89 = (void *)v457;
      v171 = v445;
      goto LABEL_315;
    }
  }
  id v436 = 0;
LABEL_124:
  uint64_t v129 = [v487 objectForKeyedSubscript:@"flowTasksCompleted"];
  v435 = (void *)v129;
  if (v129)
  {
    v130 = (void *)v129;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v434 = v130;
        goto LABEL_127;
      }
      if (v475)
      {
        id v227 = v25;
        id v228 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v229 = *MEMORY[0x1E4F502C8];
        uint64_t v526 = *MEMORY[0x1E4F28568];
        v230 = v12;
        v231 = v11;
        v232 = v10;
        v233 = v6;
        id v234 = [NSString alloc];
        uint64_t v396 = objc_opt_class();
        v235 = v234;
        uint64_t v6 = v233;
        long long v10 = v232;
        long long v11 = v231;
        long long v12 = v230;
        id v432 = (id)[v235 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v396, @"flowTasksCompleted"];
        id v527 = v432;
        uint64_t v236 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v527 forKeys:&v526 count:1];
        v237 = v228;
        id v25 = v227;
        v433 = (void *)v236;
        id v434 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v237, "initWithDomain:code:userInfo:", v229, 2);
        goto LABEL_265;
      }
      id v434 = 0;
      uint64_t v32 = 0;
LABEL_259:
      a4 = v482;
      id v89 = (void *)v457;
      v171 = v445;
      goto LABEL_314;
    }
  }
  id v434 = 0;
LABEL_127:
  uint64_t v131 = [v487 objectForKeyedSubscript:@"reliabilityRequestCount"];
  v433 = (void *)v131;
  if (v131)
  {
    v132 = (void *)v131;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v432 = v132;
        goto LABEL_130;
      }
      if (v475)
      {
        id v238 = v25;
        id v239 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v240 = *MEMORY[0x1E4F502C8];
        uint64_t v524 = *MEMORY[0x1E4F28568];
        v241 = v12;
        v242 = v11;
        v243 = v10;
        v244 = v6;
        id v245 = [NSString alloc];
        uint64_t v397 = objc_opt_class();
        v246 = v245;
        uint64_t v6 = v244;
        long long v10 = v243;
        long long v11 = v242;
        long long v12 = v241;
        id v430 = (id)[v246 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v397, @"reliabilityRequestCount"];
        id v525 = v430;
        uint64_t v247 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v525 forKeys:&v524 count:1];
        v248 = v239;
        id v25 = v238;
        v431 = (void *)v247;
        id v432 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v248, "initWithDomain:code:userInfo:", v240, 2);
        goto LABEL_271;
      }
      id v432 = 0;
      uint64_t v32 = 0;
LABEL_265:
      a4 = v482;
      id v89 = (void *)v457;
      v171 = v445;
      goto LABEL_313;
    }
  }
  id v432 = 0;
LABEL_130:
  uint64_t v133 = [v487 objectForKeyedSubscript:@"reliabilityTurnCount"];
  v431 = (void *)v133;
  if (v133)
  {
    v134 = (void *)v133;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v430 = v134;
        goto LABEL_133;
      }
      if (v475)
      {
        id v249 = v25;
        id v250 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v251 = *MEMORY[0x1E4F502C8];
        uint64_t v522 = *MEMORY[0x1E4F28568];
        v252 = v12;
        v253 = v11;
        v254 = v10;
        v255 = v6;
        id v256 = [NSString alloc];
        uint64_t v398 = objc_opt_class();
        v257 = v256;
        uint64_t v6 = v255;
        long long v10 = v254;
        long long v11 = v253;
        long long v12 = v252;
        v258 = (void *)[v257 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v398, @"reliabilityTurnCount"];
        v523 = v258;
        uint64_t v259 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v523 forKeys:&v522 count:1];
        v260 = v250;
        id v25 = v249;
        v429 = (void *)v259;
        id v430 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v260, "initWithDomain:code:userInfo:", v251, 2);
        goto LABEL_275;
      }
      id v430 = 0;
      uint64_t v32 = 0;
LABEL_271:
      a4 = v482;
      id v89 = (void *)v457;
      v171 = v445;
      goto LABEL_312;
    }
  }
  id v430 = 0;
LABEL_133:
  uint64_t v135 = [v487 objectForKeyedSubscript:@"clientErrorCount"];
  v429 = (void *)v135;
  if (v135)
  {
    v136 = (void *)v135;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v427 = v136;
        goto LABEL_136;
      }
      if (v475)
      {
        id v261 = v25;
        id v262 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v263 = *MEMORY[0x1E4F502C8];
        uint64_t v520 = *MEMORY[0x1E4F28568];
        v264 = v12;
        v265 = v11;
        v266 = v10;
        v267 = v6;
        id v268 = [NSString alloc];
        uint64_t v399 = objc_opt_class();
        v269 = v268;
        uint64_t v6 = v267;
        long long v10 = v266;
        long long v11 = v265;
        long long v12 = v264;
        uint64_t v270 = [v269 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v399, @"clientErrorCount"];
        uint64_t v521 = v270;
        uint64_t v271 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v521 forKeys:&v520 count:1];
        v272 = v262;
        id v25 = v261;
        v273 = (void *)v270;
        v428 = (void *)v271;
        v258 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v272, "initWithDomain:code:userInfo:", v263, 2);
        a4 = v482;
        id v89 = (void *)v457;
        goto LABEL_310;
      }
      v258 = 0;
      uint64_t v32 = 0;
LABEL_275:
      a4 = v482;
      id v89 = (void *)v457;
      goto LABEL_311;
    }
  }
  id v427 = 0;
LABEL_136:
  uint64_t v137 = [v487 objectForKeyedSubscript:@"undesiredResponseCount"];
  v428 = (void *)v137;
  if (v137 && (v138 = (void *)v137, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v475)
      {
        id v274 = v25;
        id v275 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v276 = *MEMORY[0x1E4F502C8];
        uint64_t v518 = *MEMORY[0x1E4F28568];
        v277 = v12;
        v278 = v11;
        v279 = v10;
        v280 = v6;
        id v281 = [NSString alloc];
        uint64_t v400 = objc_opt_class();
        v282 = v281;
        uint64_t v6 = v280;
        long long v10 = v279;
        long long v11 = v278;
        long long v12 = v277;
        id v425 = (id)[v282 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v400, @"undesiredResponseCount"];
        id v519 = v425;
        uint64_t v283 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v519 forKeys:&v518 count:1];
        v284 = v275;
        id v25 = v274;
        v426 = (void *)v283;
        v273 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v284, "initWithDomain:code:userInfo:", v276, 2);
        a4 = v482;
        id v89 = (void *)v457;
        v258 = v427;
        goto LABEL_309;
      }
      v273 = 0;
      uint64_t v32 = 0;
      a4 = v482;
      id v89 = (void *)v457;
      v258 = v427;
      goto LABEL_310;
    }
    id v424 = v138;
  }
  else
  {
    id v424 = 0;
  }
  uint64_t v139 = [v487 objectForKeyedSubscript:@"fatalResponseCount"];
  v426 = (void *)v139;
  if (v139 && (v140 = (void *)v139, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v475)
      {
        id v425 = 0;
        uint64_t v32 = 0;
        a4 = v482;
        id v89 = (void *)v457;
        v258 = v427;
        v273 = v424;
        goto LABEL_309;
      }
      id v285 = v25;
      id v286 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v287 = *MEMORY[0x1E4F502C8];
      uint64_t v516 = *MEMORY[0x1E4F28568];
      v288 = v12;
      v289 = v11;
      v290 = v10;
      v291 = v6;
      id v292 = [NSString alloc];
      uint64_t v401 = objc_opt_class();
      v293 = v292;
      uint64_t v6 = v291;
      long long v10 = v290;
      long long v11 = v289;
      long long v12 = v288;
      id v423 = (id)[v293 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v401, @"fatalResponseCount"];
      id v517 = v423;
      uint64_t v294 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v517 forKeys:&v516 count:1];
      v295 = v286;
      id v25 = v285;
      v422 = (void *)v294;
      id v425 = 0;
      uint64_t v32 = 0;
      id *v475 = (id)objc_msgSend(v295, "initWithDomain:code:userInfo:", v287, 2);
      goto LABEL_291;
    }
    id v425 = v140;
  }
  else
  {
    id v425 = 0;
  }
  uint64_t v141 = [v487 objectForKeyedSubscript:@"failureResponseCount"];
  v422 = (void *)v141;
  if (v141)
  {
    v142 = (void *)v141;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v423 = v142;
        goto LABEL_145;
      }
      if (v475)
      {
        id v307 = v25;
        id v308 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v309 = *MEMORY[0x1E4F502C8];
        uint64_t v514 = *MEMORY[0x1E4F28568];
        v310 = v12;
        v311 = v11;
        v312 = v10;
        v313 = v6;
        id v314 = [NSString alloc];
        uint64_t v402 = objc_opt_class();
        v315 = v314;
        uint64_t v6 = v313;
        long long v10 = v312;
        long long v11 = v311;
        long long v12 = v310;
        id v421 = (id)[v315 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v402, @"failureResponseCount"];
        id v515 = v421;
        uint64_t v316 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v515 forKeys:&v514 count:1];
        v317 = v308;
        id v25 = v307;
        v420 = (void *)v316;
        id v423 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v317, "initWithDomain:code:userInfo:", v309, 2);
        goto LABEL_296;
      }
      id v423 = 0;
      uint64_t v32 = 0;
LABEL_291:
      a4 = v482;
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_308;
    }
  }
  id v423 = 0;
LABEL_145:
  uint64_t v143 = [v487 objectForKeyedSubscript:@"siriUnavailableResponseCount"];
  v420 = (void *)v143;
  if (v143)
  {
    v144 = (void *)v143;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v421 = v144;
        goto LABEL_148;
      }
      if (v475)
      {
        id v318 = v25;
        id v319 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v320 = *MEMORY[0x1E4F502C8];
        uint64_t v512 = *MEMORY[0x1E4F28568];
        v321 = v12;
        v322 = v11;
        v323 = v10;
        v324 = v6;
        id v325 = [NSString alloc];
        uint64_t v403 = objc_opt_class();
        v326 = v325;
        uint64_t v6 = v324;
        long long v10 = v323;
        long long v11 = v322;
        long long v12 = v321;
        id v419 = (id)[v326 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v403, @"siriUnavailableResponseCount"];
        id v513 = v419;
        uint64_t v327 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v513 forKeys:&v512 count:1];
        v328 = v319;
        id v25 = v318;
        v418 = (void *)v327;
        id v421 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v328, "initWithDomain:code:userInfo:", v320, 2);
        goto LABEL_338;
      }
      id v421 = 0;
      uint64_t v32 = 0;
LABEL_296:
      a4 = v482;
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_307;
    }
  }
  id v421 = 0;
LABEL_148:
  uint64_t v145 = [v487 objectForKeyedSubscript:@"asrTurnCount"];
  v418 = (void *)v145;
  if (v145)
  {
    v146 = (void *)v145;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v419 = v146;
        goto LABEL_151;
      }
      if (v475)
      {
        id v329 = v25;
        id v330 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v331 = *MEMORY[0x1E4F502C8];
        uint64_t v510 = *MEMORY[0x1E4F28568];
        v332 = v12;
        v333 = v11;
        v334 = v10;
        v335 = v6;
        id v336 = [NSString alloc];
        uint64_t v404 = objc_opt_class();
        v337 = v336;
        uint64_t v6 = v335;
        long long v10 = v334;
        long long v11 = v333;
        long long v12 = v332;
        id v416 = (id)[v337 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v404, @"asrTurnCount"];
        id v511 = v416;
        uint64_t v338 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v511 forKeys:&v510 count:1];
        v339 = v330;
        id v25 = v329;
        v415 = (void *)v338;
        id v419 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v339, "initWithDomain:code:userInfo:", v331, 2);
        a4 = v482;
        goto LABEL_342;
      }
      id v419 = 0;
      uint64_t v32 = 0;
LABEL_338:
      a4 = v482;
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_306;
    }
  }
  id v419 = 0;
LABEL_151:
  uint64_t v147 = [v487 objectForKeyedSubscript:@"siriResponseId"];
  id v449 = v25;
  v415 = (void *)v147;
  if (v147)
  {
    v148 = (void *)v147;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v416 = v148;
        goto LABEL_154;
      }
      if (v475)
      {
        id v346 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v347 = *MEMORY[0x1E4F502C8];
        uint64_t v508 = *MEMORY[0x1E4F28568];
        id v414 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"siriResponseId"];
        id v509 = v414;
        v413 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v509 forKeys:&v508 count:1];
        id v416 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v346, "initWithDomain:code:userInfo:", v347, 2);
        a4 = v482;
        goto LABEL_344;
      }
      id v416 = 0;
      uint64_t v32 = 0;
      a4 = v482;
LABEL_342:
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_305;
    }
  }
  id v416 = 0;
LABEL_154:
  uint64_t v149 = [v487 objectForKeyedSubscript:@"responseCategory"];
  v413 = (void *)v149;
  if (v149)
  {
    v150 = (void *)v149;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v414 = v150;
        goto LABEL_157;
      }
      if (v475)
      {
        id v349 = v25;
        id v350 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v351 = *MEMORY[0x1E4F502C8];
        uint64_t v506 = *MEMORY[0x1E4F28568];
        v352 = v12;
        v353 = v11;
        v354 = v10;
        v355 = v6;
        id v356 = [NSString alloc];
        uint64_t v405 = objc_opt_class();
        v357 = v356;
        uint64_t v6 = v355;
        long long v10 = v354;
        long long v11 = v353;
        long long v12 = v352;
        id v412 = (id)[v357 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v405, @"responseCategory"];
        id v507 = v412;
        uint64_t v358 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v507 forKeys:&v506 count:1];
        v359 = v350;
        id v25 = v349;
        v411 = (void *)v358;
        id v414 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v359, "initWithDomain:code:userInfo:", v351, 2);
        goto LABEL_346;
      }
      id v414 = 0;
      uint64_t v32 = 0;
      a4 = v482;
LABEL_344:
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_304;
    }
  }
  id v414 = 0;
LABEL_157:
  uint64_t v151 = [v487 objectForKeyedSubscript:@"isIntelligenceEngineRequest"];
  v411 = (void *)v151;
  if (v151)
  {
    v152 = (void *)v151;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v412 = v152;
        goto LABEL_160;
      }
      if (v475)
      {
        id v361 = v25;
        id v362 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v363 = *MEMORY[0x1E4F502C8];
        uint64_t v504 = *MEMORY[0x1E4F28568];
        v364 = v12;
        v365 = v11;
        v366 = v10;
        v367 = v6;
        id v368 = [NSString alloc];
        uint64_t v406 = objc_opt_class();
        v369 = v368;
        uint64_t v6 = v367;
        long long v10 = v366;
        long long v11 = v365;
        long long v12 = v364;
        id obj = (id)[v369 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v406, @"isIntelligenceEngineRequest"];
        id v505 = obj;
        uint64_t v370 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v505 forKeys:&v504 count:1];
        v371 = v362;
        id v25 = v361;
        v410 = (void *)v370;
        id v412 = 0;
        uint64_t v32 = 0;
        id *v475 = (id)objc_msgSend(v371, "initWithDomain:code:userInfo:", v363, 2);
        a4 = v482;
        id v89 = (void *)v457;
        v258 = v427;
        v273 = v424;

        goto LABEL_302;
      }
      id v412 = 0;
      uint64_t v32 = 0;
LABEL_346:
      a4 = v482;
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_303;
    }
  }
  id v412 = 0;
LABEL_160:
  v153 = [v487 objectForKeyedSubscript:@"intelligenceEngineRouting"];
  v154 = [MEMORY[0x1E4F1CA98] null];
  int v155 = [v153 isEqual:v154];

  id v89 = (void *)v457;
  if (v155)
  {

    v153 = 0;
  }
  else if (v153)
  {
    objc_opt_class();
    id obj = v153;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v475)
      {
        uint64_t v32 = 0;
        a4 = v482;
        id v25 = v449;
        id v89 = (void *)v457;
        v258 = v427;
        v273 = v424;
        goto LABEL_302;
      }
      id v372 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v373 = *MEMORY[0x1E4F502C8];
      uint64_t v502 = *MEMORY[0x1E4F28568];
      v409 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"intelligenceEngineRouting"];
      v503 = v409;
      uint64_t v374 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v503 forKeys:&v502 count:1];
      id v375 = (id)[v372 initWithDomain:v373 code:2 userInfo:v374];
      uint64_t v32 = 0;
      id *v475 = v375;
      v360 = (void *)v374;
LABEL_294:
      a4 = v482;
      id v25 = v449;
      id v89 = (void *)v457;
      v258 = v427;
      v273 = v424;
      goto LABEL_301;
    }
  }
  uint64_t v296 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v153, "count"));
  long long v488 = 0u;
  long long v489 = 0u;
  long long v490 = 0u;
  long long v491 = 0u;
  id v297 = v153;
  v298 = (void *)v296;
  id obj = v297;
  uint64_t v299 = [v297 countByEnumeratingWithState:&v488 objects:v501 count:16];
  v409 = (void *)v296;
  if (!v299) {
    goto LABEL_255;
  }
  uint64_t v300 = v299;
  uint64_t v439 = *(void *)v489;
  v407 = v6;
  while (2)
  {
    for (uint64_t i = 0; i != v300; ++i)
    {
      if (*(void *)v489 != v439) {
        objc_enumerationMutation(obj);
      }
      v302 = *(void **)(*((void *)&v488 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v340 = v475;
        if (v475)
        {
          id v341 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v342 = *MEMORY[0x1E4F502C8];
          uint64_t v499 = *MEMORY[0x1E4F28568];
          v408 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"intelligenceEngineRouting"];
          v500 = v408;
          v343 = (void *)MEMORY[0x1E4F1C9E8];
          v344 = &v500;
          v345 = &v499;
LABEL_282:
          v348 = [v343 dictionaryWithObjects:v344 forKeys:v345 count:1];
          uint64_t v6 = v407;
          v273 = v424;
          id *v340 = (id)[v341 initWithDomain:v342 code:2 userInfo:v348];

          uint64_t v32 = 0;
          id v477 = obj;
          a4 = v482;
          id v25 = v449;
          id v89 = (void *)v457;
          v258 = v427;
          goto LABEL_300;
        }
        goto LABEL_286;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v340 = v475;
        if (v475)
        {
          id v341 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v342 = *MEMORY[0x1E4F502C8];
          uint64_t v497 = *MEMORY[0x1E4F28568];
          v408 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"intelligenceEngineRouting"];
          v498 = v408;
          v343 = (void *)MEMORY[0x1E4F1C9E8];
          v344 = &v498;
          v345 = &v497;
          goto LABEL_282;
        }
LABEL_286:
        uint64_t v32 = 0;
        v360 = obj;
        uint64_t v6 = v407;
        goto LABEL_294;
      }
      id v303 = v302;
      [v298 addObject:v303];
    }
    uint64_t v300 = [obj countByEnumeratingWithState:&v488 objects:v501 count:16];
    uint64_t v6 = v407;
    id v89 = (void *)v457;
    if (v300) {
      continue;
    }
    break;
  }
LABEL_255:

  id v304 = [v487 objectForKeyedSubscript:@"invocationSource"];
  v408 = v304;
  if (v304)
  {
    v305 = v304;
    objc_opt_class();
    id v25 = v449;
    if (objc_opt_isKindOfClass())
    {
      id v304 = 0;
      a4 = v482;
      id v306 = v480;
      goto LABEL_298;
    }
    objc_opt_class();
    a4 = v482;
    v258 = v427;
    v273 = v424;
    if (objc_opt_isKindOfClass())
    {
      id v304 = v305;
      id v306 = v480;
      goto LABEL_299;
    }
    if (v475)
    {
      id v377 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v378 = *MEMORY[0x1E4F502C8];
      uint64_t v495 = *MEMORY[0x1E4F28568];
      v440 = v12;
      v379 = v11;
      v380 = v10;
      v381 = v6;
      v382 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"invocationSource"];
      v496 = v382;
      v383 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v496 forKeys:&v495 count:1];
      v384 = v377;
      id v25 = v449;
      v273 = v424;
      uint64_t v385 = v378;
      a4 = v482;
      id *v475 = (id)[v384 initWithDomain:v385 code:2 userInfo:v383];

      uint64_t v6 = v381;
      long long v10 = v380;
      long long v11 = v379;
      long long v12 = v440;
    }
    id v477 = 0;
    uint64_t v32 = 0;
    id v89 = (void *)v457;
  }
  else
  {
    id v306 = v480;
    a4 = v482;
    id v25 = v449;
LABEL_298:
    v258 = v427;
    v273 = v424;
LABEL_299:
    id v477 = v304;
    uint64_t v32 = objc_retain(-[BMSiriOnDeviceDigestUsageMetrics initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:](v484, "initWithEventMetadata:deviceType:programCode:productId:systemBuild:dataSharingOptInStatus:viewInterface:audioInterfaceVendorId:audioInterfaceProductId:asrLocation:nlLocation:siriInputLocale:dictationLocale:subDomain:totalTurnCount:validTurnCount:siriTasksStarted:siriTasksCompleted:flowTasksStarted:flowTasksCompleted:reliabilityRequestCount:reliabilityTurnCount:clientErrorCount:undesiredResponseCount:fatalResponseCount:failureResponseCount:siriUnavailableResponseCount:asrTurnCount:siriResponseId:responseCategory:isIntelligenceEngineRequest:intelligenceEngineRouting:invocationSource:", v6, v306, v485, a4, v483, v481, v479, v469, v467, v465, v463,
              v89,
              v455,
              v453,
              v445,
              v446,
              v443,
              v441,
              v436,
              v434,
              v432,
              v430,
              v258,
              v273,
              v425,
              v423,
              v421,
              v419,
              v416,
              v414,
              v412,
              v409,
              v304));
    v484 = v32;
  }
LABEL_300:

  v360 = v477;
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
  v171 = v445;

LABEL_312:
LABEL_313:

LABEL_314:
LABEL_315:

LABEL_316:
LABEL_317:

LABEL_318:
LABEL_319:

LABEL_320:
LABEL_321:

LABEL_322:
LABEL_323:

LABEL_324:
  id v9 = v462;
  uint64_t v7 = v470;
  long long v13 = v478;
LABEL_325:

LABEL_326:
LABEL_327:

LABEL_328:
LABEL_329:

  id v8 = v480;
LABEL_330:

LABEL_331:
LABEL_332:

  self = v484;
LABEL_333:

LABEL_334:
LABEL_335:

LABEL_336:
  return v32;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestUsageMetrics *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_eventMetadata)
  {
    uint64_t v14 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestUsageMetricsEventMetadata *)self->_eventMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_deviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasProgramCode) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasProductId) {
    PBDataWriterWriteInt32Field();
  }
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
    [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self->_siriInputLocale writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_dictationLocale)
  {
    uint64_t v14 = 0;
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestUsageMetricsISOLocale *)self->_dictationLocale writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_subDomain) {
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
  if (self->_hasAsrTurnCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_siriResponseId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasResponseCategory) {
    PBDataWriterWriteUint32Field();
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
  v159.receiver = self;
  v159.super_class = (Class)BMSiriOnDeviceDigestUsageMetrics;
  uint64_t v5 = [(BMEventBase *)&v159 init];
  if (!v5)
  {
LABEL_309:
    uint64_t v157 = v5;
    goto LABEL_310;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_307:
    uint64_t v154 = [v6 copy];
    intelligenceEngineRouting = v5->_intelligenceEngineRouting;
    v5->_intelligenceEngineRouting = (NSArray *)v154;

    int v156 = v4[*v9];
    if (v156) {
      goto LABEL_308;
    }
    goto LABEL_309;
  }
  long long v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v9]) {
      goto LABEL_307;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v7;
      unint64_t v15 = *(void *)&v4[v14];
      if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
      *(void *)&v4[v14] = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_13;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = v4[*v9];
        goto LABEL_15;
      }
    }
    v4[*v9] = 1;
LABEL_13:
    int v18 = v4[*v9];
    if (v4[*v9]) {
      unint64_t v13 = 0;
    }
LABEL_15:
    if (v18 || (v13 & 7) == 4) {
      goto LABEL_307;
    }
    switch((v13 >> 3))
    {
      case 1u:
        uint64_t v160 = 0;
        uint64_t v161 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_311;
        }
        uint64_t v20 = [[BMSiriOnDeviceDigestUsageMetricsEventMetadata alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_311;
        }
        uint64_t v21 = 136;
        goto LABEL_77;
      case 2u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 144;
        goto LABEL_178;
      case 3u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        v5->_hasProgramCode = 1;
        while (2)
        {
          uint64_t v27 = *v7;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 == -1 || v28 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v28);
            *(void *)&v4[v27] = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              BOOL v17 = v25++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_210;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_210:
        uint64_t v151 = 44;
        goto LABEL_305;
      case 4u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v26 = 0;
        v5->_hasProductId = 1;
        while (2)
        {
          uint64_t v32 = *v7;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 == -1 || v33 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)&v4[*v10] + v33);
            *(void *)&v4[v32] = v33 + 1;
            v26 |= (unint64_t)(v34 & 0x7F) << v30;
            if (v34 < 0)
            {
              v30 += 7;
              BOOL v17 = v31++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_214;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_214:
        uint64_t v151 = 48;
        goto LABEL_305;
      case 5u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 152;
        goto LABEL_178;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v26 = 0;
        v5->_hasDataSharingOptInStatus = 1;
        while (2)
        {
          uint64_t v37 = *v7;
          unint64_t v38 = *(void *)&v4[v37];
          if (v38 == -1 || v38 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v39 = *(unsigned char *)(*(void *)&v4[*v10] + v38);
            *(void *)&v4[v37] = v38 + 1;
            v26 |= (unint64_t)(v39 & 0x7F) << v35;
            if (v39 < 0)
            {
              v35 += 7;
              BOOL v17 = v36++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_218;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_218:
        uint64_t v151 = 52;
        goto LABEL_305;
      case 7u:
        char v40 = 0;
        unsigned int v41 = 0;
        uint64_t v26 = 0;
        v5->_hasViewInterface = 1;
        while (2)
        {
          uint64_t v42 = *v7;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 == -1 || v43 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v44 = *(unsigned char *)(*(void *)&v4[*v10] + v43);
            *(void *)&v4[v42] = v43 + 1;
            v26 |= (unint64_t)(v44 & 0x7F) << v40;
            if (v44 < 0)
            {
              v40 += 7;
              BOOL v17 = v41++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_222;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_222:
        uint64_t v151 = 56;
        goto LABEL_305;
      case 8u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 160;
        goto LABEL_178;
      case 9u:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 168;
        goto LABEL_178;
      case 0xAu:
        char v45 = 0;
        unsigned int v46 = 0;
        uint64_t v26 = 0;
        v5->_hasAsrLocation = 1;
        while (2)
        {
          uint64_t v47 = *v7;
          unint64_t v48 = *(void *)&v4[v47];
          if (v48 == -1 || v48 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)&v4[*v10] + v48);
            *(void *)&v4[v47] = v48 + 1;
            v26 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              BOOL v17 = v46++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_226;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_226:
        uint64_t v151 = 60;
        goto LABEL_305;
      case 0xBu:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v26 = 0;
        v5->_hasNlLocation = 1;
        while (2)
        {
          uint64_t v52 = *v7;
          unint64_t v53 = *(void *)&v4[v52];
          if (v53 == -1 || v53 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)&v4[*v10] + v53);
            *(void *)&v4[v52] = v53 + 1;
            v26 |= (unint64_t)(v54 & 0x7F) << v50;
            if (v54 < 0)
            {
              v50 += 7;
              BOOL v17 = v51++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_230;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_230:
        uint64_t v151 = 64;
        goto LABEL_305;
      case 0xCu:
        uint64_t v160 = 0;
        uint64_t v161 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_311;
        }
        uint64_t v20 = [[BMSiriOnDeviceDigestUsageMetricsISOLocale alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_311;
        }
        uint64_t v21 = 176;
        goto LABEL_77;
      case 0xDu:
        uint64_t v160 = 0;
        uint64_t v161 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_311;
        }
        uint64_t v20 = [[BMSiriOnDeviceDigestUsageMetricsISOLocale alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_311;
        }
        uint64_t v21 = 184;
LABEL_77:
        v55 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = v20;

        PBReaderRecallMark();
        goto LABEL_306;
      case 0xEu:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 192;
        goto LABEL_178;
      case 0xFu:
        char v56 = 0;
        unsigned int v57 = 0;
        uint64_t v26 = 0;
        v5->_hasTotalTurnCount = 1;
        while (2)
        {
          uint64_t v58 = *v7;
          unint64_t v59 = *(void *)&v4[v58];
          if (v59 == -1 || v59 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v60 = *(unsigned char *)(*(void *)&v4[*v10] + v59);
            *(void *)&v4[v58] = v59 + 1;
            v26 |= (unint64_t)(v60 & 0x7F) << v56;
            if (v60 < 0)
            {
              v56 += 7;
              BOOL v17 = v57++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_234;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_234:
        uint64_t v151 = 68;
        goto LABEL_305;
      case 0x10u:
        char v61 = 0;
        unsigned int v62 = 0;
        uint64_t v26 = 0;
        v5->_hasValidTurnCount = 1;
        while (2)
        {
          uint64_t v63 = *v7;
          unint64_t v64 = *(void *)&v4[v63];
          if (v64 == -1 || v64 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v65 = *(unsigned char *)(*(void *)&v4[*v10] + v64);
            *(void *)&v4[v63] = v64 + 1;
            v26 |= (unint64_t)(v65 & 0x7F) << v61;
            if (v65 < 0)
            {
              v61 += 7;
              BOOL v17 = v62++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_238;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_238:
        uint64_t v151 = 72;
        goto LABEL_305;
      case 0x11u:
        char v66 = 0;
        unsigned int v67 = 0;
        uint64_t v26 = 0;
        v5->_hasSiriTasksStarted = 1;
        while (2)
        {
          uint64_t v68 = *v7;
          unint64_t v69 = *(void *)&v4[v68];
          if (v69 == -1 || v69 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v70 = *(unsigned char *)(*(void *)&v4[*v10] + v69);
            *(void *)&v4[v68] = v69 + 1;
            v26 |= (unint64_t)(v70 & 0x7F) << v66;
            if (v70 < 0)
            {
              v66 += 7;
              BOOL v17 = v67++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_242;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_242:
        uint64_t v151 = 76;
        goto LABEL_305;
      case 0x12u:
        char v71 = 0;
        unsigned int v72 = 0;
        uint64_t v26 = 0;
        v5->_hasSiriTasksCompleted = 1;
        while (2)
        {
          uint64_t v73 = *v7;
          unint64_t v74 = *(void *)&v4[v73];
          if (v74 == -1 || v74 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v75 = *(unsigned char *)(*(void *)&v4[*v10] + v74);
            *(void *)&v4[v73] = v74 + 1;
            v26 |= (unint64_t)(v75 & 0x7F) << v71;
            if (v75 < 0)
            {
              v71 += 7;
              BOOL v17 = v72++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_246;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_246:
        uint64_t v151 = 80;
        goto LABEL_305;
      case 0x13u:
        char v76 = 0;
        unsigned int v77 = 0;
        uint64_t v26 = 0;
        v5->_hasFlowTasksStarted = 1;
        while (2)
        {
          uint64_t v78 = *v7;
          unint64_t v79 = *(void *)&v4[v78];
          if (v79 == -1 || v79 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v80 = *(unsigned char *)(*(void *)&v4[*v10] + v79);
            *(void *)&v4[v78] = v79 + 1;
            v26 |= (unint64_t)(v80 & 0x7F) << v76;
            if (v80 < 0)
            {
              v76 += 7;
              BOOL v17 = v77++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_250;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_250:
        uint64_t v151 = 84;
        goto LABEL_305;
      case 0x14u:
        char v81 = 0;
        unsigned int v82 = 0;
        uint64_t v26 = 0;
        v5->_hasFlowTasksCompleted = 1;
        while (2)
        {
          uint64_t v83 = *v7;
          unint64_t v84 = *(void *)&v4[v83];
          if (v84 == -1 || v84 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v85 = *(unsigned char *)(*(void *)&v4[*v10] + v84);
            *(void *)&v4[v83] = v84 + 1;
            v26 |= (unint64_t)(v85 & 0x7F) << v81;
            if (v85 < 0)
            {
              v81 += 7;
              BOOL v17 = v82++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_254;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_254:
        uint64_t v151 = 88;
        goto LABEL_305;
      case 0x15u:
        char v86 = 0;
        unsigned int v87 = 0;
        uint64_t v26 = 0;
        v5->_hasReliabilityRequestCount = 1;
        while (2)
        {
          uint64_t v88 = *v7;
          unint64_t v89 = *(void *)&v4[v88];
          if (v89 == -1 || v89 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v90 = *(unsigned char *)(*(void *)&v4[*v10] + v89);
            *(void *)&v4[v88] = v89 + 1;
            v26 |= (unint64_t)(v90 & 0x7F) << v86;
            if (v90 < 0)
            {
              v86 += 7;
              BOOL v17 = v87++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_258;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_258:
        uint64_t v151 = 92;
        goto LABEL_305;
      case 0x16u:
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v26 = 0;
        v5->_hasReliabilityTurnCount = 1;
        while (2)
        {
          uint64_t v93 = *v7;
          unint64_t v94 = *(void *)&v4[v93];
          if (v94 == -1 || v94 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v95 = *(unsigned char *)(*(void *)&v4[*v10] + v94);
            *(void *)&v4[v93] = v94 + 1;
            v26 |= (unint64_t)(v95 & 0x7F) << v91;
            if (v95 < 0)
            {
              v91 += 7;
              BOOL v17 = v92++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_262;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_262:
        uint64_t v151 = 96;
        goto LABEL_305;
      case 0x17u:
        char v96 = 0;
        unsigned int v97 = 0;
        uint64_t v26 = 0;
        v5->_hasClientErrorCount = 1;
        while (2)
        {
          uint64_t v98 = *v7;
          unint64_t v99 = *(void *)&v4[v98];
          if (v99 == -1 || v99 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v100 = *(unsigned char *)(*(void *)&v4[*v10] + v99);
            *(void *)&v4[v98] = v99 + 1;
            v26 |= (unint64_t)(v100 & 0x7F) << v96;
            if (v100 < 0)
            {
              v96 += 7;
              BOOL v17 = v97++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_266;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_266:
        uint64_t v151 = 100;
        goto LABEL_305;
      case 0x18u:
        char v101 = 0;
        unsigned int v102 = 0;
        uint64_t v26 = 0;
        v5->_hasUndesiredResponseCount = 1;
        while (2)
        {
          uint64_t v103 = *v7;
          unint64_t v104 = *(void *)&v4[v103];
          if (v104 == -1 || v104 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v105 = *(unsigned char *)(*(void *)&v4[*v10] + v104);
            *(void *)&v4[v103] = v104 + 1;
            v26 |= (unint64_t)(v105 & 0x7F) << v101;
            if (v105 < 0)
            {
              v101 += 7;
              BOOL v17 = v102++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_270;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_270:
        uint64_t v151 = 104;
        goto LABEL_305;
      case 0x19u:
        char v106 = 0;
        unsigned int v107 = 0;
        uint64_t v26 = 0;
        v5->_hasFatalResponseCount = 1;
        while (2)
        {
          uint64_t v108 = *v7;
          unint64_t v109 = *(void *)&v4[v108];
          if (v109 == -1 || v109 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v110 = *(unsigned char *)(*(void *)&v4[*v10] + v109);
            *(void *)&v4[v108] = v109 + 1;
            v26 |= (unint64_t)(v110 & 0x7F) << v106;
            if (v110 < 0)
            {
              v106 += 7;
              BOOL v17 = v107++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_274;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_274:
        uint64_t v151 = 108;
        goto LABEL_305;
      case 0x1Au:
        char v111 = 0;
        unsigned int v112 = 0;
        uint64_t v26 = 0;
        v5->_hasFailureResponseCount = 1;
        while (2)
        {
          uint64_t v113 = *v7;
          unint64_t v114 = *(void *)&v4[v113];
          if (v114 == -1 || v114 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v115 = *(unsigned char *)(*(void *)&v4[*v10] + v114);
            *(void *)&v4[v113] = v114 + 1;
            v26 |= (unint64_t)(v115 & 0x7F) << v111;
            if (v115 < 0)
            {
              v111 += 7;
              BOOL v17 = v112++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_278;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_278:
        uint64_t v151 = 112;
        goto LABEL_305;
      case 0x1Bu:
        char v116 = 0;
        unsigned int v117 = 0;
        uint64_t v26 = 0;
        v5->_hasSiriUnavailableResponseCount = 1;
        while (2)
        {
          uint64_t v118 = *v7;
          unint64_t v119 = *(void *)&v4[v118];
          if (v119 == -1 || v119 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v120 = *(unsigned char *)(*(void *)&v4[*v10] + v119);
            *(void *)&v4[v118] = v119 + 1;
            v26 |= (unint64_t)(v120 & 0x7F) << v116;
            if (v120 < 0)
            {
              v116 += 7;
              BOOL v17 = v117++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_282;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_282:
        uint64_t v151 = 116;
        goto LABEL_305;
      case 0x1Cu:
        char v121 = 0;
        unsigned int v122 = 0;
        uint64_t v26 = 0;
        v5->_hasAsrTurnCount = 1;
        while (2)
        {
          uint64_t v123 = *v7;
          unint64_t v124 = *(void *)&v4[v123];
          if (v124 == -1 || v124 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v125 = *(unsigned char *)(*(void *)&v4[*v10] + v124);
            *(void *)&v4[v123] = v124 + 1;
            v26 |= (unint64_t)(v125 & 0x7F) << v121;
            if (v125 < 0)
            {
              v121 += 7;
              BOOL v17 = v122++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_286;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_286:
        uint64_t v151 = 120;
        goto LABEL_305;
      case 0x1Du:
        uint64_t v22 = PBReaderReadString();
        uint64_t v23 = 200;
LABEL_178:
        v126 = *(Class *)((char *)&v5->super.super.isa + v23);
        *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

        goto LABEL_306;
      case 0x1Eu:
        char v127 = 0;
        unsigned int v128 = 0;
        uint64_t v26 = 0;
        v5->_hasResponseCategory = 1;
        while (2)
        {
          uint64_t v129 = *v7;
          unint64_t v130 = *(void *)&v4[v129];
          if (v130 == -1 || v130 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v131 = *(unsigned char *)(*(void *)&v4[*v10] + v130);
            *(void *)&v4[v129] = v130 + 1;
            v26 |= (unint64_t)(v131 & 0x7F) << v127;
            if (v131 < 0)
            {
              v127 += 7;
              BOOL v17 = v128++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_290;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_290:
        uint64_t v151 = 124;
        goto LABEL_305;
      case 0x1Fu:
        char v132 = 0;
        unsigned int v133 = 0;
        uint64_t v134 = 0;
        v5->_hasIsIntelligenceEngineRequest = 1;
        while (2)
        {
          uint64_t v135 = *v7;
          unint64_t v136 = *(void *)&v4[v135];
          if (v136 == -1 || v136 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v137 = *(unsigned char *)(*(void *)&v4[*v10] + v136);
            *(void *)&v4[v135] = v136 + 1;
            v134 |= (unint64_t)(v137 & 0x7F) << v132;
            if (v137 < 0)
            {
              v132 += 7;
              BOOL v17 = v133++ >= 9;
              if (v17)
              {
                uint64_t v134 = 0;
                goto LABEL_294;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v134 = 0;
        }
LABEL_294:
        v5->_isIntelligenceEngineRequest = v134 != 0;
        goto LABEL_306;
      case 0x20u:
        char v138 = 0;
        unsigned int v139 = 0;
        uint64_t v140 = 0;
        uint64_t v141 = NSNumber;
        while (2)
        {
          uint64_t v142 = *v7;
          unint64_t v143 = *(void *)&v4[v142];
          if (v143 == -1 || v143 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v144 = *(unsigned char *)(*(void *)&v4[*v10] + v143);
            *(void *)&v4[v142] = v143 + 1;
            v140 |= (unint64_t)(v144 & 0x7F) << v138;
            if (v144 < 0)
            {
              v138 += 7;
              BOOL v17 = v139++ >= 9;
              if (v17)
              {
                uint64_t v145 = 0;
                goto LABEL_299;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          uint64_t v145 = 0;
        }
        else {
          uint64_t v145 = v140;
        }
LABEL_299:
        uint64_t v152 = [v141 numberWithUnsignedInt:v145];
        if (v152)
        {
          v153 = (void *)v152;
          [v6 addObject:v152];

LABEL_306:
          if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
            goto LABEL_307;
          }
          continue;
        }
LABEL_311:

LABEL_308:
        uint64_t v157 = 0;
LABEL_310:

        return v157;
      case 0x21u:
        char v146 = 0;
        unsigned int v147 = 0;
        uint64_t v26 = 0;
        v5->_hasInvocationSource = 1;
        while (2)
        {
          uint64_t v148 = *v7;
          unint64_t v149 = *(void *)&v4[v148];
          if (v149 == -1 || v149 >= *(void *)&v4[*v8])
          {
            v4[*v9] = 1;
          }
          else
          {
            char v150 = *(unsigned char *)(*(void *)&v4[*v10] + v149);
            *(void *)&v4[v148] = v149 + 1;
            v26 |= (unint64_t)(v150 & 0x7F) << v146;
            if (v150 < 0)
            {
              v146 += 7;
              BOOL v17 = v147++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_304;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v9]) {
          LODWORD(v26) = 0;
        }
LABEL_304:
        uint64_t v151 = 128;
LABEL_305:
        *(_DWORD *)((char *)&v5->super.super.isa + v151) = v26;
        goto LABEL_306;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_311;
        }
        goto LABEL_306;
    }
  }
}

- (NSString)description
{
  id v18 = [NSString alloc];
  unint64_t v38 = [(BMSiriOnDeviceDigestUsageMetrics *)self eventMetadata];
  char v35 = [(BMSiriOnDeviceDigestUsageMetrics *)self deviceType];
  uint64_t v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics programCode](self, "programCode"));
  unint64_t v33 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics productId](self, "productId"));
  unsigned int v36 = [(BMSiriOnDeviceDigestUsageMetrics *)self systemBuild];
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics dataSharingOptInStatus](self, "dataSharingOptInStatus"));
  char v34 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics viewInterface](self, "viewInterface"));
  char v30 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceVendorId];
  unsigned int v31 = [(BMSiriOnDeviceDigestUsageMetrics *)self audioInterfaceProductId];
  unint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics asrLocation](self, "asrLocation"));
  char v29 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestUsageMetrics nlLocation](self, "nlLocation"));
  uint64_t v27 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriInputLocale];
  unsigned int v25 = [(BMSiriOnDeviceDigestUsageMetrics *)self dictationLocale];
  uint64_t v26 = [(BMSiriOnDeviceDigestUsageMetrics *)self subDomain];
  BOOL v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics totalTurnCount](self, "totalTurnCount"));
  char v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics validTurnCount](self, "validTurnCount"));
  char v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics siriTasksStarted](self, "siriTasksStarted"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics siriTasksCompleted](self, "siriTasksCompleted"));
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics flowTasksStarted](self, "flowTasksStarted"));
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics flowTasksCompleted](self, "flowTasksCompleted"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics reliabilityRequestCount](self, "reliabilityRequestCount"));
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics reliabilityTurnCount](self, "reliabilityTurnCount"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics clientErrorCount](self, "clientErrorCount"));
  unsigned int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics undesiredResponseCount](self, "undesiredResponseCount"));
  unint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics fatalResponseCount](self, "fatalResponseCount"));
  char v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics failureResponseCount](self, "failureResponseCount"));
  long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics siriUnavailableResponseCount](self, "siriUnavailableResponseCount"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics asrTurnCount](self, "asrTurnCount"));
  v3 = [(BMSiriOnDeviceDigestUsageMetrics *)self siriResponseId];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics responseCategory](self, "responseCategory"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriOnDeviceDigestUsageMetrics isIntelligenceEngineRequest](self, "isIntelligenceEngineRequest"));
  uint64_t v6 = [(BMSiriOnDeviceDigestUsageMetrics *)self intelligenceEngineRouting];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSiriOnDeviceDigestUsageMetrics invocationSource](self, "invocationSource"));
  uint64_t v19 = objc_msgSend(v18, "initWithFormat:", @"BMSiriOnDeviceDigestUsageMetrics with eventMetadata: %@, deviceType: %@, programCode: %@, productId: %@, systemBuild: %@, dataSharingOptInStatus: %@, viewInterface: %@, audioInterfaceVendorId: %@, audioInterfaceProductId: %@, asrLocation: %@, nlLocation: %@, siriInputLocale: %@, dictationLocale: %@, subDomain: %@, totalTurnCount: %@, validTurnCount: %@, siriTasksStarted: %@, siriTasksCompleted: %@, flowTasksStarted: %@, flowTasksCompleted: %@, reliabilityRequestCount: %@, reliabilityTurnCount: %@, clientErrorCount: %@, undesiredResponseCount: %@, fatalResponseCount: %@, failureResponseCount: %@, siriUnavailableResponseCount: %@, asrTurnCount: %@, siriResponseId: %@, responseCategory: %@, isIntelligenceEngineRequest: %@, intelligenceEngineRouting: %@, invocationSource: %@", v38, v35, v37, v33, v36, v32, v34, v30, v31, v28, v29, v27, v25, v26, v17, v24,
                  v16,
                  v23,
                  v15,
                  v22,
                  v21,
                  v20,
                  v14,
                  v12,
                  v13,
                  v11,
                  v10,
                  v9,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (BMSiriOnDeviceDigestUsageMetrics)initWithEventMetadata:(id)a3 deviceType:(id)a4 programCode:(id)a5 productId:(id)a6 systemBuild:(id)a7 dataSharingOptInStatus:(id)a8 viewInterface:(id)a9 audioInterfaceVendorId:(id)a10 audioInterfaceProductId:(id)a11 asrLocation:(id)a12 nlLocation:(id)a13 siriInputLocale:(id)a14 dictationLocale:(id)a15 subDomain:(id)a16 totalTurnCount:(id)a17 validTurnCount:(id)a18 siriTasksStarted:(id)a19 siriTasksCompleted:(id)a20 flowTasksStarted:(id)a21 flowTasksCompleted:(id)a22 reliabilityRequestCount:(id)a23 reliabilityTurnCount:(id)a24 clientErrorCount:(id)a25 undesiredResponseCount:(id)a26 fatalResponseCount:(id)a27 failureResponseCount:(id)a28 siriUnavailableResponseCount:(id)a29 asrTurnCount:(id)a30 siriResponseId:(id)a31 responseCategory:(id)a32 isIntelligenceEngineRequest:(id)a33 intelligenceEngineRouting:(id)a34 invocationSource:(id)a35
{
  id v78 = a3;
  id v67 = a4;
  id v77 = a4;
  id v39 = a5;
  id v93 = a6;
  id v76 = a7;
  id v99 = a8;
  id v89 = a9;
  id v75 = a10;
  id v74 = a11;
  id v96 = a12;
  id v97 = a13;
  id v73 = a14;
  id v72 = a15;
  id v71 = a16;
  id v95 = a17;
  id v94 = a18;
  id v92 = a19;
  id v91 = a20;
  id v90 = a21;
  id v88 = a22;
  id v87 = a23;
  id v86 = a24;
  id v85 = a25;
  id v84 = a26;
  id v83 = a27;
  id v82 = a28;
  id v81 = a29;
  id v80 = a30;
  id v70 = a31;
  id v79 = a32;
  id v40 = a33;
  id v69 = a34;
  id v41 = a35;
  v100.receiver = self;
  v100.super_class = (Class)BMSiriOnDeviceDigestUsageMetrics;
  uint64_t v42 = [(BMEventBase *)&v100 init];
  if (v42)
  {
    v42->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v42->_eventMetadata, a3);
    objc_storeStrong((id *)&v42->_deviceType, v67);
    if (v39)
    {
      v42->_hasProgramCode = 1;
      int v43 = [v39 intValue];
    }
    else
    {
      id v39 = 0;
      v42->_hasProgramCode = 0;
      int v43 = -1;
    }
    v42->_programCode = v43;
    if (v93)
    {
      v42->_hasProductId = 1;
      int v44 = [v93 intValue];
    }
    else
    {
      v42->_hasProductId = 0;
      int v44 = -1;
    }
    v42->_productId = v44;
    objc_storeStrong((id *)&v42->_systemBuild, a7);
    if (v99)
    {
      v42->_hasDataSharingOptInStatus = 1;
      int v45 = [v99 intValue];
    }
    else
    {
      v42->_hasDataSharingOptInStatus = 0;
      int v45 = -1;
    }
    v42->_dataSharingOptInStatus = v45;
    if (v89)
    {
      v42->_hasViewInterface = 1;
      int v46 = [v89 intValue];
    }
    else
    {
      v42->_hasViewInterface = 0;
      int v46 = -1;
    }
    v42->_viewInterface = v46;
    objc_storeStrong((id *)&v42->_audioInterfaceVendorId, a10);
    objc_storeStrong((id *)&v42->_audioInterfaceProductId, a11);
    if (v96)
    {
      v42->_hasAsrLocation = 1;
      int v47 = [v96 intValue];
    }
    else
    {
      v42->_hasAsrLocation = 0;
      int v47 = -1;
    }
    v42->_asrLocation = v47;
    if (v97)
    {
      v42->_hasNlLocation = 1;
      int v48 = [v97 intValue];
    }
    else
    {
      v42->_hasNlLocation = 0;
      int v48 = -1;
    }
    v42->_nlLocation = v48;
    objc_storeStrong((id *)&v42->_siriInputLocale, a14);
    objc_storeStrong((id *)&v42->_dictationLocale, a15);
    objc_storeStrong((id *)&v42->_subDomain, a16);
    if (v95)
    {
      v42->_hasTotalTurnCount = 1;
      unsigned int v49 = [v95 unsignedIntValue];
    }
    else
    {
      unsigned int v49 = 0;
      v42->_hasTotalTurnCount = 0;
    }
    v42->_totalTurnCount = v49;
    unsigned int v50 = v94;
    if (v94)
    {
      v42->_hasValidTurnCount = 1;
      unsigned int v50 = [v94 unsignedIntValue];
    }
    else
    {
      v42->_hasValidTurnCount = 0;
    }
    v42->_validTurnCount = v50;
    unsigned int v51 = v92;
    if (v92)
    {
      v42->_hasSiriTasksStarted = 1;
      unsigned int v51 = [v92 unsignedIntValue];
    }
    else
    {
      v42->_hasSiriTasksStarted = 0;
    }
    v42->_siriTasksStarted = v51;
    unsigned int v52 = v91;
    if (v91)
    {
      v42->_hasSiriTasksCompleted = 1;
      unsigned int v52 = [v91 unsignedIntValue];
    }
    else
    {
      v42->_hasSiriTasksCompleted = 0;
    }
    v42->_siriTasksCompleted = v52;
    unsigned int v53 = v90;
    if (v90)
    {
      v42->_hasFlowTasksStarted = 1;
      unsigned int v53 = [v90 unsignedIntValue];
    }
    else
    {
      v42->_hasFlowTasksStarted = 0;
    }
    v42->_flowTasksStarted = v53;
    unsigned int v54 = v88;
    if (v88)
    {
      v42->_hasFlowTasksCompleted = 1;
      unsigned int v54 = [v88 unsignedIntValue];
    }
    else
    {
      v42->_hasFlowTasksCompleted = 0;
    }
    v42->_flowTasksCompleted = v54;
    unsigned int v55 = v87;
    if (v87)
    {
      v42->_hasReliabilityRequestCount = 1;
      unsigned int v55 = [v87 unsignedIntValue];
    }
    else
    {
      v42->_hasReliabilityRequestCount = 0;
    }
    v42->_reliabilityRequestCount = v55;
    unsigned int v56 = v86;
    if (v86)
    {
      v42->_hasReliabilityTurnCount = 1;
      unsigned int v56 = [v86 unsignedIntValue];
    }
    else
    {
      v42->_hasReliabilityTurnCount = 0;
    }
    v42->_reliabilityTurnCount = v56;
    unsigned int v57 = v85;
    if (v85)
    {
      v42->_hasClientErrorCount = 1;
      unsigned int v57 = [v85 unsignedIntValue];
    }
    else
    {
      v42->_hasClientErrorCount = 0;
    }
    v42->_clientErrorCount = v57;
    unsigned int v58 = v84;
    if (v84)
    {
      v42->_hasUndesiredResponseCount = 1;
      unsigned int v58 = [v84 unsignedIntValue];
    }
    else
    {
      v42->_hasUndesiredResponseCount = 0;
    }
    v42->_undesiredResponseCount = v58;
    unsigned int v59 = v83;
    if (v83)
    {
      v42->_hasFatalResponseCount = 1;
      unsigned int v59 = [v83 unsignedIntValue];
    }
    else
    {
      v42->_hasFatalResponseCount = 0;
    }
    v42->_fatalResponseCount = v59;
    unsigned int v60 = v82;
    if (v82)
    {
      v42->_hasFailureResponseCount = 1;
      unsigned int v60 = [v82 unsignedIntValue];
    }
    else
    {
      v42->_hasFailureResponseCount = 0;
    }
    v42->_failureResponseCount = v60;
    unsigned int v61 = v81;
    if (v81)
    {
      v42->_hasSiriUnavailableResponseCount = 1;
      unsigned int v61 = [v81 unsignedIntValue];
    }
    else
    {
      v42->_hasSiriUnavailableResponseCount = 0;
    }
    v42->_siriUnavailableResponseCount = v61;
    unsigned int v62 = v80;
    if (v80)
    {
      v42->_hasAsrTurnCount = 1;
      unsigned int v62 = [v80 unsignedIntValue];
    }
    else
    {
      v42->_hasAsrTurnCount = 0;
    }
    v42->_asrTurnCount = v62;
    objc_storeStrong((id *)&v42->_siriResponseId, a31);
    unsigned int v63 = v79;
    if (v79)
    {
      v42->_hasResponseCategory = 1;
      unsigned int v63 = [v79 unsignedIntValue];
    }
    else
    {
      v42->_hasResponseCategory = 0;
    }
    v42->_responseCategory = v63;
    if (v40)
    {
      v42->_hasIsIntelligenceEngineRequest = 1;
      v42->_isIntelligenceEngineRequest = [v40 BOOLValue];
    }
    else
    {
      v42->_hasIsIntelligenceEngineRequest = 0;
      v42->_isIntelligenceEngineRequest = 0;
    }
    objc_storeStrong((id *)&v42->_intelligenceEngineRouting, a34);
    if (v41)
    {
      v42->_hasInvocationSource = 1;
      unsigned int v64 = [v41 unsignedIntValue];
    }
    else
    {
      unsigned int v64 = 0;
      v42->_hasInvocationSource = 0;
    }
    v42->_invocationSource = v64;
  }

  return v42;
}

+ (id)protoFields
{
  v37[33] = *MEMORY[0x1E4F143B8];
  unsigned int v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventMetadata" number:1 type:14 subMessageClass:objc_opt_class()];
  v37[0] = v36;
  char v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceType" number:2 type:13 subMessageClass:0];
  v37[1] = v35;
  char v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"programCode" number:3 type:2 subMessageClass:0];
  v37[2] = v34;
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"productId" number:4 type:2 subMessageClass:0];
  v37[3] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemBuild" number:5 type:13 subMessageClass:0];
  v37[4] = v32;
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dataSharingOptInStatus" number:6 type:2 subMessageClass:0];
  v37[5] = v31;
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewInterface" number:7 type:2 subMessageClass:0];
  v37[6] = v30;
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioInterfaceVendorId" number:8 type:13 subMessageClass:0];
  v37[7] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioInterfaceProductId" number:9 type:13 subMessageClass:0];
  v37[8] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"asrLocation" number:10 type:2 subMessageClass:0];
  v37[9] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nlLocation" number:11 type:2 subMessageClass:0];
  v37[10] = v26;
  unsigned int v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriInputLocale" number:12 type:14 subMessageClass:objc_opt_class()];
  v37[11] = v25;
  char v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dictationLocale" number:13 type:14 subMessageClass:objc_opt_class()];
  v37[12] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subDomain" number:14 type:13 subMessageClass:0];
  v37[13] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalTurnCount" number:15 type:4 subMessageClass:0];
  v37[14] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"validTurnCount" number:16 type:4 subMessageClass:0];
  v37[15] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriTasksStarted" number:17 type:4 subMessageClass:0];
  v37[16] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriTasksCompleted" number:18 type:4 subMessageClass:0];
  v37[17] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flowTasksStarted" number:19 type:4 subMessageClass:0];
  v37[18] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"flowTasksCompleted" number:20 type:4 subMessageClass:0];
  v37[19] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reliabilityRequestCount" number:21 type:4 subMessageClass:0];
  v37[20] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"reliabilityTurnCount" number:22 type:4 subMessageClass:0];
  v37[21] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientErrorCount" number:23 type:4 subMessageClass:0];
  v37[22] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"undesiredResponseCount" number:24 type:4 subMessageClass:0];
  v37[23] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fatalResponseCount" number:25 type:4 subMessageClass:0];
  v37[24] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"failureResponseCount" number:26 type:4 subMessageClass:0];
  v37[25] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriUnavailableResponseCount" number:27 type:4 subMessageClass:0];
  v37[26] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"asrTurnCount" number:28 type:4 subMessageClass:0];
  v37[27] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriResponseId" number:29 type:13 subMessageClass:0];
  v37[28] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"responseCategory" number:30 type:4 subMessageClass:0];
  v37[29] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isIntelligenceEngineRequest" number:31 type:12 subMessageClass:0];
  v37[30] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"intelligenceEngineRouting" number:32 type:4 subMessageClass:0];
  v37[31] = v10;
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"invocationSource" number:33 type:4 subMessageClass:0];
  v37[32] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:33];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF54D8;
}

id __43__BMSiriOnDeviceDigestUsageMetrics_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _intelligenceEngineRoutingJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMSiriOnDeviceDigestUsageMetrics_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 dictationLocale];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __43__BMSiriOnDeviceDigestUsageMetrics_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 siriInputLocale];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __43__BMSiriOnDeviceDigestUsageMetrics_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 eventMetadata];
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

    uint64_t v8 = [[BMSiriOnDeviceDigestUsageMetrics alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end