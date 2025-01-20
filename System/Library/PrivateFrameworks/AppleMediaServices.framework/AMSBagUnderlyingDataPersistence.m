@interface AMSBagUnderlyingDataPersistence
+ (id)persistenceWithDefaultDirectory;
- (AMSBagUnderlyingDataPersistence)init;
- (AMSBagUnderlyingDataPersistence)initWithDirectoryURL:(id)a3;
- (BOOL)persist:(id)a3 error:(id *)a4;
- (BOOL)removeUnderlyingDataFor:(id)a3 error:(id *)a4;
- (id)underlyingDataFor:(id)a3 error:(id *)a4;
@end

@implementation AMSBagUnderlyingDataPersistence

- (id)underlyingDataFor:(id)a3 error:(id *)a4
{
  sub_18DD4DEB0();
  v5 = self;
  v6 = (void *)BagUnderlyingDataPersistence.underlyingData(for:)();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)persist:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  BagUnderlyingDataPersistence.persist(_:)();

  return 1;
}

+ (id)persistenceWithDefaultDirectory
{
  swift_getObjCClassMetadata();
  v2 = (void *)static BagUnderlyingDataPersistence.persistenceWithDefaultDirectory()();
  return v2;
}

- (AMSBagUnderlyingDataPersistence)initWithDirectoryURL:(id)a3
{
  uint64_t v3 = sub_18DD4D820();
  MEMORY[0x1F4188790](v3 - 8);
  sub_18DD4D770();
  return (AMSBagUnderlyingDataPersistence *)BagUnderlyingDataPersistence.init(directoryURL:)();
}

- (BOOL)removeUnderlyingDataFor:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_18DD4DEB0();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  BagUnderlyingDataPersistence.removeUnderlyingData(for:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_18DD4D6D0();

      id v13 = v12;
      *a4 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (AMSBagUnderlyingDataPersistence)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___AMSBagUnderlyingDataPersistence_directoryURL;
  uint64_t v3 = sub_18DD4D820();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end