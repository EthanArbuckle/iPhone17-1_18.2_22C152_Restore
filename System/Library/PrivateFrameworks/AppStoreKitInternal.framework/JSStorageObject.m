@interface JSStorageObject
- (_TtC19AppStoreKitInternal15JSStorageObject)init;
- (id)retrieveString:(id)a3;
- (void)storeString:(id)a3 :(id)a4;
@end

@implementation JSStorageObject

- (_TtC19AppStoreKitInternal15JSStorageObject)init
{
  return (_TtC19AppStoreKitInternal15JSStorageObject *)sub_1E1679750();
}

- (void)storeString:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E1CDB1EC();
}

- (id)retrieveString:(id)a3
{
  sub_1E15E9E84(0, (unint64_t *)&qword_1EBF368E8);
  id v5 = a3;
  id v6 = self;
  id v7 = (void *)sub_1E1D5CC88();
  v8 = (void *)sub_1E1D5CC98();

  return v8;
}

- (void).cxx_destruct
{
  sub_1E1693D84((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal15JSStorageObject_path);
  swift_bridgeObjectRelease();
}

@end