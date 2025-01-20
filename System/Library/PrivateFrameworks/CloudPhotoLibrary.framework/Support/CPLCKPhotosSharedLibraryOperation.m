@interface CPLCKPhotosSharedLibraryOperation
+ (id)exitSharedLibraryOperationWithZoneID:(id)a3 retentionPolicy:(int64_t)a4 exitType:(int64_t)a5 exitSource:(int64_t)a6 stopAt:(int64_t)a7 participantUserIDsToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10;
+ (id)getNextBatchToMoveOperationWithZoneID:(id)a3 batchSize:(int64_t)a4 completionHandler:(id)a5;
+ (id)moveBatchSharedLibraryOperationWithZoneID:(id)a3 batchSize:(int)a4 operationID:(id)a5 completionHandler:(id)a6;
+ (id)sendExitMoveBatchFeedbackWithMoveBatchOperationID:(id)a3 moveBatchID:(id)a4 exitZoneID:(id)a5 feedbackItems:(id)a6 completionHandler:(id)a7;
+ (id)sendExitStatusFeedbackWithOperationID:(id)a3 shareID:(id)a4 status:(int64_t)a5 completionHandler:(id)a6;
+ (id)silentMoverServerRampOperationWithOperationID:(id)a3 completionHandler:(id)a4;
- (CPLCKPhotosSharedLibraryOperation)init;
@end

@implementation CPLCKPhotosSharedLibraryOperation

+ (id)silentMoverServerRampOperationWithOperationID:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v5;
  v9 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC021silentMoverServerRampG004withG2ID17completionHandlerSo010CKDatabaseG0CSSSg_ySb_AIs5Int64VSbs5Int32VS6bs5Error_pSgtctFZ_0(v6, (uint64_t)a3, (uint64_t)sub_10014A4B0, v8);
  swift_release();
  swift_bridgeObjectRelease();
  return v9;
}

+ (id)getNextBatchToMoveOperationWithZoneID:(id)a3 batchSize:(int64_t)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  _s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC18getNextBatchToMove4with9batchSize17completionHandlerSo010CKDatabaseG0CSo14CKRecordZoneIDC_SiySaySSGSg_SSSgANSbs5Error_pSgtctFZ_0(v9, a4, (uint64_t)sub_10014A4A8, v8);
  v11 = v10;

  swift_release();
  return v11;
}

+ (id)moveBatchSharedLibraryOperationWithZoneID:(id)a3 batchSize:(int)a4 operationID:(id)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  if (a5)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = a3;
  v14 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC09moveBatchefG04with9batchSize11operationID17completionHandlerSo010CKDatabaseG0CSo012CKRecordZoneN0C_s5Int32VSSSgySb_SbA2Os5Int64VSaySSGSgs5Error_pSgtctFZ_0(v13, a4, v10, (uint64_t)a5, (uint64_t)sub_10014A47C, v12);

  swift_release();
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)exitSharedLibraryOperationWithZoneID:(id)a3 retentionPolicy:(int64_t)a4 exitType:(int64_t)a5 exitSource:(int64_t)a6 stopAt:(int64_t)a7 participantUserIDsToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10
{
  v15 = _Block_copy(a10);
  uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v15;
  id v19 = a3;
  sub_100149788(v19, a4, a5, a6, a7, v16, v17, (uint64_t)sub_10014A474, v18);
  v21 = v20;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v21;
}

+ (id)sendExitMoveBatchFeedbackWithMoveBatchOperationID:(id)a3 moveBatchID:(id)a4 exitZoneID:(id)a5 feedbackItems:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = _Block_copy(a7);
  if (a3)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v12;
    if (a4)
    {
LABEL_3:
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a4 = v14;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
LABEL_6:
  sub_1000D0514(&qword_1002CD4F8);
  uint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  id v17 = a5;
  uint64_t v18 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC25sendExitMoveBatchFeedback04withjkG2ID04movekN008exitZoneN013feedbackItems17completionHandlerSo010CKDatabaseG0CSSSg_ALSo08CKRecordqN0CSaySo0defijkL4Item_pGySb_s5Error_pSgtctFZ_0(v11, (unint64_t)a3, v13, (uint64_t)a4, v17, v15, (uint64_t)sub_100140424, v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v18;
}

+ (id)sendExitStatusFeedbackWithOperationID:(id)a3 shareID:(id)a4 status:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = a4;
  v14 = (void *)_s22CloudKitImplementation33CPLCKPhotosSharedLibraryOperationC22sendExitStatusFeedback04withG2ID5share6status17completionHandlerSo010CKDatabaseG0CSSSg_So012CKRecordZoneM0CSo011CPLCKSharedfiJ0VySb_s5Error_pSgtctFZ_0(v10, (unint64_t)a3, v13, a5, (uint64_t)sub_100140258, v12);

  swift_release();
  swift_bridgeObjectRelease();
  return v14;
}

- (CPLCKPhotosSharedLibraryOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CPLCKPhotosSharedLibraryOperation();
  return [(CPLCKPhotosSharedLibraryOperation *)&v3 init];
}

@end