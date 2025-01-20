@interface CPLCKUtilitiesOperation
+ (id)deleteAllZonesWithCompletionHandler:(id)a3;
+ (id)deleteZoneWithName:(id)a3 completionHandler:(id)a4;
- (CPLCKUtilitiesOperation)init;
@end

@implementation CPLCKUtilitiesOperation

+ (id)deleteZoneWithName:(id)a3 completionHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  v9 = (void *)_s22CloudKitImplementation23CPLCKUtilitiesOperationC10deleteZone8withName17completionHandlerSo010CKDatabaseE0CSS_ySb_s5Error_pSgtctFZ_0(v5, v7, (uint64_t)sub_100140424, v8);
  swift_bridgeObjectRelease();
  swift_release();
  return v9;
}

+ (id)deleteAllZonesWithCompletionHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = (void *)_s22CloudKitImplementation23CPLCKUtilitiesOperationC14deleteAllZones17completionHandlerSo010CKDatabaseE0CySb_s5Error_pSgtc_tFZ_0((uint64_t)sub_100140258, v4);
  swift_release();
  return v5;
}

- (CPLCKUtilitiesOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CPLCKUtilitiesOperation();
  return [(CPLCKUtilitiesOperation *)&v3 init];
}

@end