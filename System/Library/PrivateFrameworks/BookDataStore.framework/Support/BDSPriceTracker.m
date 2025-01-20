@interface BDSPriceTracker
- (BDSPriceTracker)init;
- (BDSPriceTracker)initWithPersistenceURL:(id)a3;
- (void)bdsctl_addTrackedItem:(BDSDistributedPriceTrackingConfigItemID *)a3 completion:(id)a4;
- (void)bdsctl_getStateWithCompletion:(id)a3;
- (void)bdsctl_updateReferencePrices:(NSDictionary *)a3 completion:(id)a4;
- (void)bdsdctl_updateTrackedPricesIgnoringScheduleForAllItemsWithCompletionHandler:(id)a3;
- (void)setConfiguration:(BDSDistributedPriceTrackingConfig *)a3 completion:(id)a4;
- (void)updateTrackedPricesIgnoringScheduleForNewItemsWithCompletionHandler:(id)a3;
@end

@implementation BDSPriceTracker

- (BDSPriceTracker)initWithPersistenceURL:(id)a3
{
  uint64_t v3 = sub_10007DC14(&qword_100293CC8);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1001EAF60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  v13 = (char *)&v21 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v21 - v14;
  sub_1001EAF10();
  v16 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v16(v13, v15, v6);
  v16(v10, v13, v6);
  sub_10017B87C((uint64_t)v10, 0, (uint64_t)v5);
  v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v13, v6);
  uint64_t v18 = _s11PersistenceVMa();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v5, 0, 1, v18);
  type metadata accessor for PriceTracker(0);
  swift_allocObject();
  v19 = (BDSPriceTracker *)sub_1001040E8((uint64_t)v5);
  v17(v15, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v19;
}

- (void)updateTrackedPricesIgnoringScheduleForNewItemsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293CB0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100293CB8;
  v12[5] = v11;
  swift_retain();
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293CC0, (uint64_t)v12);
  swift_release();
}

- (BDSPriceTracker)init
{
  swift_defaultActor_initialize();
  result = (BDSPriceTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)setConfiguration:(BDSDistributedPriceTrackingConfig *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100293C30;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100293C38;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100293C40, (uint64_t)v14);
  swift_release();
}

- (void)bdsctl_getStateWithCompletion:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293BC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1002942E0;
  v12[5] = v11;
  swift_retain();
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293BC8, (uint64_t)v12);
  swift_release();
}

- (void)bdsctl_addTrackedItem:(BDSDistributedPriceTrackingConfigItemID *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100293B98;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100293BA0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100293BA8, (uint64_t)v14);
  swift_release();
}

- (void)bdsctl_updateReferencePrices:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100293B40;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100293B48;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_100124BC8((uint64_t)v9, (uint64_t)&unk_100293B50, (uint64_t)v14);
  swift_release();
}

- (void)bdsdctl_updateTrackedPricesIgnoringScheduleForAllItemsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10007DC14(&qword_100293840);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1001EC6A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100293B30;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100291B00;
  v12[5] = v11;
  swift_retain();
  sub_100124BC8((uint64_t)v7, (uint64_t)&unk_100293860, (uint64_t)v12);
  swift_release();
}

@end