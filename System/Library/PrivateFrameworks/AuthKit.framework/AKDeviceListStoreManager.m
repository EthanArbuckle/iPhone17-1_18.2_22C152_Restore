@interface AKDeviceListStoreManager
+ (AKDeviceListStoreManager)sharedManager;
- (AKDeviceListStoreManager)init;
- (void)clearDatabaseWithCompletionHandler:(id)a3;
- (void)clearStaleDevicesWithAccountManager:(AKAccountManager *)a3 completionHandler:(id)a4;
- (void)deleteDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4;
- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 cdpFactory:(AKCDPFactory *)a4 serviceController:(AKServiceControllerImpl *)a5 accountManager:(AKAccountManager *)a6 completionHandler:(id)a7;
- (void)updateCacheWithContext:(AKDeviceListRequestContext *)a3 deviceListResponse:(AKDeviceListResponse *)a4 completionHandler:(id)a5;
- (void)verifyCacheSyncStatusFromResponse:(AKDeviceListResponse *)a3 context:(AKDeviceListRequestContext *)a4 accountManager:(AKAccountManager *)a5 reporter:(AAFAnalyticsReporter *)a6 completionHandler:(id)a7;
@end

@implementation AKDeviceListStoreManager

+ (AKDeviceListStoreManager)sharedManager
{
  if (qword_10026F9D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1002744C0;

  return (AKDeviceListStoreManager *)v2;
}

- (void)clearDatabaseWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100271DD0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100271DD8;
  v12[5] = v11;
  v13 = self;
  sub_1001538E0((uint64_t)v7, (uint64_t)&unk_100271DE0, (uint64_t)v12);
  swift_release();
}

- (void)fetchDeviceListWithContext:(AKDeviceListRequestContext *)a3 cdpFactory:(AKCDPFactory *)a4 serviceController:(AKServiceControllerImpl *)a5 accountManager:(AKAccountManager *)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_100271DB0;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_100271DB8;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_1001538E0((uint64_t)v15, (uint64_t)&unk_100271DC0, (uint64_t)v20);
  swift_release();
}

- (void)deleteDeviceListWithContext:(AKDeviceListRequestContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271D90;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271D98;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271DA0, (uint64_t)v14);
  swift_release();
}

- (void)clearStaleDevicesWithAccountManager:(AKAccountManager *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100271D70;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100271D78;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1001538E0((uint64_t)v9, (uint64_t)&unk_100271D80, (uint64_t)v14);
  swift_release();
}

- (void)verifyCacheSyncStatusFromResponse:(AKDeviceListResponse *)a3 context:(AKDeviceListRequestContext *)a4 accountManager:(AKAccountManager *)a5 reporter:(AAFAnalyticsReporter *)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_100271D50;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_100271D58;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  sub_1001538E0((uint64_t)v15, (uint64_t)&unk_100271D60, (uint64_t)v20);
  swift_release();
}

- (void)updateCacheWithContext:(AKDeviceListRequestContext *)a3 deviceListResponse:(AKDeviceListResponse *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000D70C8(&qword_1002701B0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100271D40;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10026FD30;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_1001538E0((uint64_t)v11, (uint64_t)&unk_1002701D0, (uint64_t)v16);
  swift_release();
}

- (AKDeviceListStoreManager)init
{
  result = (AKDeviceListStoreManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end