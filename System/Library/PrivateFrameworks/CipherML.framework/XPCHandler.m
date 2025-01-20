@interface XPCHandler
- (void)asyncResponseDataByKeywords:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)asyncResponseSimilarityScoresForElements:(NSArray *)a3 shardIndices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)configureUseCaseGroupWithName:(NSString *)a3 useCaseGroup:(CMLUseCaseGroup *)a4 reply:(id)a5;
- (void)constructPIRBatchRequestWithIndices:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)constructPIRBatchRequestWithKeywords:(NSArray *)a3 shardIds:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)constructPIRRequestWithIndex:(unint64_t)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)constructPIRRequestWithKeyword:(NSData *)a3 withEvaluationKey:(BOOL)a4 shardId:(NSString *)a5 pirConfig:(CMLPIRConfig *)a6 clientConfig:(CMLClientConfig *)a7 reply:(id)a8;
- (void)constructPIRRequestWithLatitude:(double)a3 longitude:(double)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)decryptBatchOfSimilarityScores:(NSData *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)decryptPIRBatchResponse:(NSData *)a3 indices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)decryptPIRBatchResponse:(NSData *)a3 keywords:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)decryptPIRResponse:(NSData *)a3 index:(unint64_t)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)decryptPIRResponse:(NSData *)a3 keyword:(NSData *)a4 shardId:(NSString *)a5 clientConfig:(CMLClientConfig *)a6 reply:(id)a7;
- (void)decryptPIRResponse:(NSData *)a3 latitude:(double)a4 longitude:(double)a5 clientConfig:(CMLClientConfig *)a6 reply:(id)a7;
- (void)encryptBatchOfElements:(NSArray *)a3 shardIndices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)encryptDifferentiallyPrivateFakes:(NSArray *)a3 shardIndex:(int64_t)a4 shardCount:(int64_t)a5 pecConfig:(CMLPECConfig *)a6 clientConfig:(CMLClientConfig *)a7 reply:(id)a8;
- (void)generateEvaluationKey:(CMLPIRConfig *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)listUseCaseGroupsWithReply:(id)a3;
- (void)queryStatusForClientConfig:(CMLClientConfig *)a3 options:(unint64_t)a4 reply:(id)a5;
- (void)removedCachedEntriesByKeywords:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)requestDataByIndex:(unint64_t)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)requestDataByIndices:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)requestDataByKeywords:(NSArray *)a3 shardIds:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)requestDataByLatitude:(double)a3 longitude:(double)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
- (void)setPECConfig:(CMLPECConfig *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)setPIRConfig:(CMLPIRConfig *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5;
- (void)similarityScoresForElements:(NSArray *)a3 shardIndices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6;
@end

@implementation XPCHandler

- (void)requestDataByIndex:(unint64_t)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.requestData(by:clientConfig:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_528Tu;
  v16[5] = v15;
  v17 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_533Tu, (uint64_t)v16);
  swift_release();
}

- (void)requestDataByIndices:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.requestData(byIndices:clientConfig:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_511Tu;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_516Tu, (uint64_t)v16);
  swift_release();
}

- (void)requestDataByKeywords:(NSArray *)a3 shardIds:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.requestData(byKeywords:shardIds:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_494Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_499Tu, (uint64_t)v18);
  swift_release();
}

- (void)requestDataByLatitude:(double)a3 longitude:(double)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(double *)(v15 + 16) = a3;
  *(double *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.requestData(byLatitude:longitude:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_479Tu;
  v18[5] = v17;
  uint64_t v19 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_484Tu, (uint64_t)v18);
  swift_release();
}

- (void)removedCachedEntriesByKeywords:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.removedCachedEntries(byKeywords:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_464Tu;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_469Tu, (uint64_t)v16);
  swift_release();
}

- (void)setPIRConfig:(CMLPIRConfig *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.setPIRConfig(_:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_449Tu;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_454Tu, (uint64_t)v16);
  swift_release();
}

- (void)generateEvaluationKey:(CMLPIRConfig *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.generateEvaluationKey(_:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_434Tu;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_439Tu, (uint64_t)v16);
  swift_release();
}

- (void)constructPIRRequestWithIndex:(unint64_t)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.constructPIRRequest(with:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_419Tu;
  v16[5] = v15;
  v17 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_424Tu, (uint64_t)v16);
  swift_release();
}

- (void)constructPIRBatchRequestWithIndices:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.constructPIRBatchRequest(withIndices:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_404Tu;
  v16[5] = v15;
  v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_409Tu, (uint64_t)v16);
  swift_release();
}

- (void)decryptPIRResponse:(NSData *)a3 index:(unint64_t)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.decryptPIRResponse(_:index:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_389Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_394Tu, (uint64_t)v18);
  swift_release();
}

- (void)decryptPIRBatchResponse:(NSData *)a3 indices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.decryptPIRBatchResponse(_:indices:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_372Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_377Tu, (uint64_t)v18);
  swift_release();
}

- (void)constructPIRRequestWithKeyword:(NSData *)a3 withEvaluationKey:(BOOL)a4 shardId:(NSString *)a5 pirConfig:(CMLPIRConfig *)a6 clientConfig:(CMLClientConfig *)a7 reply:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v15 - 8);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(unsigned char *)(v19 + 24) = a4;
  *(void *)(v19 + 32) = a5;
  *(void *)(v19 + 40) = a6;
  *(void *)(v19 + 48) = a7;
  *(void *)(v19 + 56) = v18;
  *(void *)(v19 + 64) = self;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.constructPIRRequest(withKeyword:withEvaluationKey:shardId:pirConfig:clientConfig:);
  v21[5] = v19;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &_sIeghH_IeAgH_TRTA_357Tu;
  v22[5] = v21;
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v17, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_362Tu, (uint64_t)v22);
  swift_release();
}

- (void)constructPIRBatchRequestWithKeywords:(NSArray *)a3 shardIds:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.constructPIRBatchRequest(withKeywords:shardIds:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_342Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_347Tu, (uint64_t)v18);
  swift_release();
}

- (void)decryptPIRResponse:(NSData *)a3 keyword:(NSData *)a4 shardId:(NSString *)a5 clientConfig:(CMLClientConfig *)a6 reply:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.decryptPIRResponse(_:keyword:shardId:clientConfig:);
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &_sIeghH_IeAgH_TRTA_327Tu;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  v23 = a5;
  v24 = a6;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v15, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_332Tu, (uint64_t)v20);
  swift_release();
}

- (void)decryptPIRBatchResponse:(NSData *)a3 keywords:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.decryptPIRBatchResponse(_:keywords:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_310Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_315Tu, (uint64_t)v18);
  swift_release();
}

- (void)constructPIRRequestWithLatitude:(double)a3 longitude:(double)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(double *)(v15 + 16) = a3;
  *(double *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.constructPIRRequest(withLatitude:longitude:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_295Tu;
  v18[5] = v17;
  uint64_t v19 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_300Tu, (uint64_t)v18);
  swift_release();
}

- (void)decryptPIRResponse:(NSData *)a3 latitude:(double)a4 longitude:(double)a5 clientConfig:(CMLClientConfig *)a6 reply:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(double *)(v17 + 24) = a4;
  *(double *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.decryptPIRResponse(_:latitude:longitude:clientConfig:);
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &_sIeghH_IeAgH_TRTA_280Tu;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a6;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v15, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_285Tu, (uint64_t)v20);
  swift_release();
}

- (void)asyncResponseDataByKeywords:(NSArray *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.asyncResponseData(byKeywords:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_263Tu;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_268Tu, (uint64_t)v16);
  swift_release();
}

- (void)similarityScoresForElements:(NSArray *)a3 shardIndices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.similarityScores(forElements:shardIndices:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_246Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_251Tu, (uint64_t)v18);
  swift_release();
}

- (void)setPECConfig:(CMLPECConfig *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.setPECConfig(_:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_231Tu;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_236Tu, (uint64_t)v16);
  swift_release();
}

- (void)encryptBatchOfElements:(NSArray *)a3 shardIndices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.encryptBatch(ofElements:shardIndices:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_216Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_221Tu, (uint64_t)v18);
  swift_release();
}

- (void)encryptDifferentiallyPrivateFakes:(NSArray *)a3 shardIndex:(int64_t)a4 shardCount:(int64_t)a5 pecConfig:(CMLPECConfig *)a6 clientConfig:(CMLClientConfig *)a7 reply:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.encryptDifferentiallyPrivateFakes(_:shardIndex:shardCount:pecConfig:clientConfig:);
  v21[5] = v19;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &_sIeghH_IeAgH_TRTA_199Tu;
  v22[5] = v21;
  uint64_t v23 = a3;
  v24 = a6;
  uint64_t v25 = a7;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v17, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_204Tu, (uint64_t)v22);
  swift_release();
}

- (void)decryptBatchOfSimilarityScores:(NSData *)a3 clientConfig:(CMLClientConfig *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.decryptBatch(ofSimilarityScores:clientConfig:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_182Tu;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_187Tu, (uint64_t)v16);
  swift_release();
}

- (void)asyncResponseSimilarityScoresForElements:(NSArray *)a3 shardIndices:(NSArray *)a4 clientConfig:(CMLClientConfig *)a5 reply:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.asyncResponseSimilarityScores(forElements:shardIndices:clientConfig:);
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTA_165Tu;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_170Tu, (uint64_t)v18);
  swift_release();
}

- (void)queryStatusForClientConfig:(CMLClientConfig *)a3 options:(unint64_t)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.queryStatus(for:options:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_150Tu;
  v16[5] = v15;
  uint64_t v17 = a3;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_155Tu, (uint64_t)v16);
  swift_release();
}

- (void)listUseCaseGroupsWithReply:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.listUseCaseGroups();
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTA_135Tu;
  v12[5] = v11;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_140Tu, (uint64_t)v12);
  swift_release();
}

- (void)configureUseCaseGroupWithName:(NSString *)a3 useCaseGroup:(CMLUseCaseGroup *)a4 reply:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in XPCHandler.configureUseCaseGroup(withName:useCaseGroup:);
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTATu;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v16);
  swift_release();
}

@end