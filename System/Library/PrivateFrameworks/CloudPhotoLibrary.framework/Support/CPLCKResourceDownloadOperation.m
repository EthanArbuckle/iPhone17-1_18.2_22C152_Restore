@interface CPLCKResourceDownloadOperation
+ (id)assetDownloadOperationFor:(id)a3 key:(id)a4 fingerPrint:(id)a5 downloadType:(int64_t)a6 timeRange:(id *)a7 completionBlock:(id)a8;
+ (id)downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 downloadType:(int64_t)a5 perRecordProgressBlock:(id)a6 perRecordCompletionBlock:(id)a7 completionBlock:(id)a8;
+ (id)fetchDerivativesUploadConfigurationWithCompletionBlock:(id)a3;
+ (id)fetchRawDerivativesUploadConfigurationWithCompletionBlock:(id)a3;
+ (id)inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 downloadType:(int64_t)a7 completionBlock:(id)a8;
+ (id)streamOperationForRecordID:(id)a3 key:(id)a4 downloadType:(int64_t)a5 filename:(id)a6 timeRange:(id *)a7 mediaRequestHints:(id)a8 completionBlock:(id)aBlock;
- (CPLCKResourceDownloadOperation)init;
@end

@implementation CPLCKResourceDownloadOperation

+ (id)downloadOperationWithRecordIDsAndTasks:(id)a3 keys:(id)a4 downloadType:(int64_t)a5 perRecordProgressBlock:(id)a6 perRecordCompletionBlock:(id)a7 completionBlock:(id)a8
{
  v12 = _Block_copy(a6);
  v13 = _Block_copy(a7);
  v14 = _Block_copy(a8);
  sub_1000E18FC(0, &qword_1002CA410);
  sub_1000E18FC(0, &qword_1002CA418);
  sub_1000E13E8();
  unint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v13;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v14;
  id v19 = a4;
  sub_1000DEE44(v15, (uint64_t)v19, a5, (uint64_t)sub_1000E1450, v16, (uint64_t)sub_1000E1464, v17, (uint64_t)sub_1000E148C, v18);
  v21 = v20;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return v21;
}

+ (id)streamOperationForRecordID:(id)a3 key:(id)a4 downloadType:(int64_t)a5 filename:(id)a6 timeRange:(id *)a7 mediaRequestHints:(id)a8 completionBlock:(id)aBlock
{
  int64_t var3 = a7->var1.var3;
  v24[0] = a7->var0.var0;
  v24[1] = *(void *)&a7->var0.var1;
  long long v25 = *(_OWORD *)&a7->var0.var3;
  uint64_t v26 = *(void *)&a7->var1.var1;
  int64_t v27 = var3;
  v13 = _Block_copy(aBlock);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (a8) {
    a8 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v13;
  id v21 = a3;
  v22 = sub_1000DFF54(v21, v14, v16, a5, v17, v19, (uint64_t)v24, (uint64_t)a8, (uint64_t)sub_1000E13E0, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v22;
}

+ (id)inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 downloadType:(int64_t)a7 completionBlock:(id)a8
{
  v13 = _Block_copy(a8);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = _s22CloudKitImplementation30CPLCKResourceDownloadOperationC08inMemoryeF03for8resource6record4keys12downloadType15completionBlockSo010CKDatabaseF0CSo10CKRecordIDC_So11CPLResourceCSo20CPLPlaceholderRecordCSo08CPLCloudB12ResourceKeysCSo0deN0Vy10Foundation4DataVSg_SSSgSbs5Error_pSgtctFZ_0(v15, v16, (uint64_t)v17, v18, a7, (uint64_t)sub_1000E13D8, v14);

  swift_release();
  return v19;
}

+ (id)fetchDerivativesUploadConfigurationWithCompletionBlock:(id)a3
{
  return sub_1000DC848((int)a1, (int)a2, a3, (uint64_t)&unk_10027C068, (uint64_t)sub_1000E13BC, _s22CloudKitImplementation30CPLCKResourceDownloadOperationC35fetchDerivativesUploadConfiguration15completionBlockSo010CKDatabaseF0CySo20CPLDerivativesFilterCSg_s5Error_pSgtc_tFZ_0);
}

+ (id)assetDownloadOperationFor:(id)a3 key:(id)a4 fingerPrint:(id)a5 downloadType:(int64_t)a6 timeRange:(id *)a7 completionBlock:(id)a8
{
  int64_t var3 = a7->var1.var3;
  v22[0] = a7->var0.var0;
  v22[1] = *(void *)&a7->var0.var1;
  long long v23 = *(_OWORD *)&a7->var0.var3;
  uint64_t v24 = *(void *)&a7->var1.var1;
  int64_t v25 = var3;
  v11 = _Block_copy(a8);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v11;
  id v19 = a3;
  uint64_t v20 = sub_1000E0CCC(v19, v12, v14, v15, v17, a6, (uint64_t)v22, (uint64_t)sub_1000E28AC, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v20;
}

+ (id)fetchRawDerivativesUploadConfigurationWithCompletionBlock:(id)a3
{
  return sub_1000DC848((int)a1, (int)a2, a3, (uint64_t)&unk_10027C018, (uint64_t)sub_1000E13B4, _s22CloudKitImplementation30CPLCKResourceDownloadOperationC38fetchRawDerivativesUploadConfiguration15completionBlockSo010CKDatabaseF0CySSSg_s5Error_pSgtc_tFZ_0);
}

- (CPLCKResourceDownloadOperation)init
{
  result = (CPLCKResourceDownloadOperation *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end