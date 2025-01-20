@interface AKDeviceListRequester
- (AKDeviceListRequester)init;
- (AKDeviceListRequester)initWithStoreManager:(id)a3 cdpFactory:(id)a4 accountManager:(id)a5 client:(id)a6;
- (void)clearDeviceListCacheWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4;
- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4;
@end

@implementation AKDeviceListRequester

- (AKDeviceListRequester)initWithStoreManager:(id)a3 cdpFactory:(id)a4 accountManager:(id)a5 client:(id)a6
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_storeManager) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_cdpFactory) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_accountManager) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_client) = (Class)a6;
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for DeviceListRequester();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  return [(AKDeviceListRequester *)&v15 init];
}

- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271348;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271350;
  v14[5] = v13;
  objc_super v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271358, (uint64_t)v14);
  swift_release();
}

- (void)clearDeviceListCacheWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271338;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10026FD30;
  v14[5] = v13;
  objc_super v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_1002701D0, (uint64_t)v14);
  swift_release();
}

- (AKDeviceListRequester)init
{
  result = (AKDeviceListRequester *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKDeviceListRequester_client);
}

@end