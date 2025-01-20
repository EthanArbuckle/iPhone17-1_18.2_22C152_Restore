@interface AMDVectorDBManager
+ (id)clearVectorsHandlerWithClearVectorDBPayload:(id)a3 error:(id *)a4;
+ (id)createVectorDBDirectoryWithDbName:(id)a3 error:(id *)a4;
+ (id)createVectorDBWithCreateDBPayload:(id)a3 error:(id *)a4;
+ (id)deleteVectorDatabaseWithDeletionPayload:(id)a3 error:(id *)a4;
+ (id)insertVectorsHandlerWithInsertVectorsPayload:(id)a3 error:(id *)a4;
+ (id)runVectorDBSearchWithSearchPayload:(id)a3 error:(id *)a4;
- (_TtC19AppleMediaDiscovery18AMDVectorDBManager)init;
- (_TtC19AppleMediaDiscovery18AMDVectorDBManager)initWithVectorDBConfig:(id)a3 error:(id *)a4;
- (id)deleteVectorsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)insertVectorsWithVectorDict:(id)a3 error:(id *)a4;
- (id)searchVectorDBWithQueryDict:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation AMDVectorDBManager

- (_TtC19AppleMediaDiscovery18AMDVectorDBManager)initWithVectorDBConfig:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_20ACD4F80();
  v7 = (_TtC19AppleMediaDiscovery18AMDVectorDBManager *)AMDVectorDBManager.init(vectorDBConfig:)(v5);

  return v7;
}

- (void)dealloc
{
  v2 = self;
  AMDVectorDBManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (id)insertVectorsWithVectorDict:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676810A8);
  uint64_t v11 = sub_20ACD4F80();
  sub_20ACC561C(v11);
  v8 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)searchVectorDBWithQueryDict:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v11 = sub_20ACD4F80();
  sub_20ACC6408(v11);
  v8 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

- (id)deleteVectorsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = self;
  if (a3)
  {
    uint64_t v8 = sub_20ACD50E0();

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  sub_20ACC793C(v9);
  v7 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)createVectorDBDirectoryWithDbName:(id)a3 error:(id *)a4
{
  id v18 = a1;
  id v17 = a3;
  v12 = a4;
  swift_getObjCClassMetadata();
  uint64_t v13 = sub_20ACD49D0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v13 - 8;
  unint64_t v16 = (*(void *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v19 = (char *)&v8 - v16;
  id v4 = (id)MEMORY[0x270FA5388](v17);
  uint64_t v21 = sub_20ACD4FF0();
  uint64_t v20 = v5;
  swift_getObjCClassMetadata();
  sub_20ACC7EF8(v21, v20, v19);
  uint64_t v22 = 0;
  uint64_t v10 = sub_20ACD49A0();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  uint64_t v11 = v10;
  uint64_t v9 = (void *)v10;
  swift_bridgeObjectRelease();

  v6 = v9;

  return v6;
}

+ (id)deleteVectorDatabaseWithDeletionPayload:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  uint64_t v8 = sub_20ACD4F80();
  swift_getObjCClassMetadata();
  sub_20ACC9448(v8);
  v6 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)insertVectorsHandlerWithInsertVectorsPayload:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  uint64_t v8 = sub_20ACD4F80();
  swift_getObjCClassMetadata();
  sub_20ACCAD74(v8);
  v6 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)clearVectorsHandlerWithClearVectorDBPayload:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  uint64_t v8 = sub_20ACD4F80();
  swift_getObjCClassMetadata();
  sub_20ACCB9F8(v8);
  v6 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)runVectorDBSearchWithSearchPayload:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  uint64_t v8 = sub_20ACD4F80();
  swift_getObjCClassMetadata();
  sub_20ACCC1C4(v8);
  v6 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

+ (id)createVectorDBWithCreateDBPayload:(id)a3 error:(id *)a4
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  uint64_t v8 = sub_20ACD4F80();
  swift_getObjCClassMetadata();
  sub_20ACCCA24(v8);
  v6 = (void *)sub_20ACD4F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC19AppleMediaDiscovery18AMDVectorDBManager)init
{
  return (_TtC19AppleMediaDiscovery18AMDVectorDBManager *)AMDVectorDBManager.init()();
}

@end