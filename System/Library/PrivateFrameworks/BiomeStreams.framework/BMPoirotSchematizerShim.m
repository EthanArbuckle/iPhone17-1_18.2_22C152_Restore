@interface BMPoirotSchematizerShim
+ (BOOL)setSQLiteValueIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 convertedTypeRawValue:(int64_t)a6 sqliteContext:(void *)a7 error:(id *)a8;
+ (BOOL)setSQLiteValueIn:(id)a3 withFieldPath:(id)a4 typeRawValue:(int64_t)a5 convertedTypeRawValue:(int64_t)a6 sqliteContext:(void *)a7 error:(id *)a8;
+ (id)searchValueIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 error:(id *)a6;
+ (id)searchValueIn:(id)a3 withFieldPath:(id)a4 typeRawValue:(int64_t)a5 error:(id *)a6;
+ (id)searchValuesIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 error:(id *)a6;
- (_TtC12BiomeStreams23BMPoirotSchematizerShim)init;
@end

@implementation BMPoirotSchematizerShim

+ (id)searchValueIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 error:(id *)a6
{
  id v8 = a3;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  swift_getObjCClassMetadata();
  static BMPoirotSchematizerShim.searchValue(in:withFieldNumber:typeRawValue:error:)(v9, v11, a4, a5, &v19);
  outlined consume of Data._Representation(v9, v11);
  uint64_t v12 = v20;
  if (v20)
  {
    v13 = __swift_project_boxed_opaque_existential_1(&v19, v20);
    uint64_t v14 = *(void *)(v12 - 8);
    MEMORY[0x1F4188790](v13);
    v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v14 + 16))(v16);
    v17 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v19);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)searchValueIn:(id)a3 withFieldPath:(id)a4 typeRawValue:(int64_t)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  static BMPoirotSchematizerShim.searchValue(in:withFieldPath:typeRawValue:error:)(v10, v12, v13, a5, &v21);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v10, v12);
  uint64_t v14 = v22;
  if (v22)
  {
    uint64_t v15 = __swift_project_boxed_opaque_existential_1(&v21, v22);
    uint64_t v16 = *(void *)(v14 - 8);
    MEMORY[0x1F4188790](v15);
    v18 = (char *)&v21 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v18);
    long long v19 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v21);
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

+ (id)searchValuesIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  swift_getObjCClassMetadata();
  id v13 = static BMPoirotSchematizerShim.searchValues(in:withFieldNumber:typeRawValue:error:)(v10, v12, a4, a5, (uint64_t)a6);
  outlined consume of Data._Representation(v10, v12);

  return v13;
}

+ (BOOL)setSQLiteValueIn:(id)a3 withFieldNumber:(int64_t)a4 typeRawValue:(int64_t)a5 convertedTypeRawValue:(int64_t)a6 sqliteContext:(void *)a7 error:(id *)a8
{
  swift_getObjCClassMetadata();
  id v13 = a3;
  static BMPoirotSchematizerShim.setSQLiteValue(in:withFieldNumber:typeRawValue:convertedTypeRawValue:sqliteContext:)(v13, a4, a5, a6, (uint64_t)a7);

  return 1;
}

+ (BOOL)setSQLiteValueIn:(id)a3 withFieldPath:(id)a4 typeRawValue:(int64_t)a5 convertedTypeRawValue:(int64_t)a6 sqliteContext:(void *)a7 error:(id *)a8
{
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v13 = a3;
  static BMPoirotSchematizerShim.setSQLiteValue(in:withFieldPath:typeRawValue:convertedTypeRawValue:sqliteContext:)(v13, v12, a5, a6, (uint64_t)a7);
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC12BiomeStreams23BMPoirotSchematizerShim)init
{
  return (_TtC12BiomeStreams23BMPoirotSchematizerShim *)BMPoirotSchematizerShim.init()();
}

@end