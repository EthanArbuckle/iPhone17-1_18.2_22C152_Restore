@interface BSBrandServiceImplementation
- (BSBrandServiceImplementation)init;
- (void)assetDataForBrandURI:(NSString *)a3 URL:(NSURL *)a4 type:(int64_t)a5 usingSim:(NSString *)a6 cachingEnabled:(BOOL)a7 completion:(id)a8;
- (void)clearCachedAssetsForBrandURI:(NSString *)a3 completion:(id)a4;
- (void)clearUnusedCachedLogos:(id)a3;
- (void)fetchAssetWithURL:(NSURL *)a3 assetType:(int64_t)a4 completion:(id)a5;
- (void)logoFileURLForBrandURI:(id)a3 remoteURL:(id)a4 completion:(id)a5;
@end

@implementation BSBrandServiceImplementation

- (void)assetDataForBrandURI:(NSString *)a3 URL:(NSURL *)a4 type:(int64_t)a5 usingSim:(NSString *)a6 cachingEnabled:(BOOL)a7 completion:(id)a8
{
  uint64_t v15 = sub_100002810(&qword_1000222C0);
  __chkstk_darwin(v15 - 8);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a3;
  *(void *)(v19 + 24) = a4;
  *(void *)(v19 + 32) = a5;
  *(void *)(v19 + 40) = a6;
  *(unsigned char *)(v19 + 48) = a7;
  *(void *)(v19 + 56) = v18;
  *(void *)(v19 + 64) = self;
  uint64_t v20 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1000223E0;
  v21[5] = v19;
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1000223E8;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = self;
  sub_100009DC0((uint64_t)v17, (uint64_t)&unk_1000223F0, (uint64_t)v22);
  swift_release();
}

- (void)logoFileURLForBrandURI:(id)a3 remoteURL:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  uint64_t v15 = self;
  sub_10000CD3C(v12, v14, (uint64_t)v10, (char *)v15, v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchAssetWithURL:(NSURL *)a3 assetType:(int64_t)a4 completion:(id)a5
{
  uint64_t v9 = sub_100002810(&qword_1000222C0);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000223B8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000223C0;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_100009DC0((uint64_t)v11, (uint64_t)&unk_1000223C8, (uint64_t)v16);
  swift_release();
}

- (void)clearCachedAssetsForBrandURI:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100002810(&qword_1000222C0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100022398;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1000223A0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_100009DC0((uint64_t)v9, (uint64_t)&unk_1000223A8, (uint64_t)v14);
  swift_release();
}

- (void)clearUnusedCachedLogos:(id)a3
{
  uint64_t v5 = sub_100002810(&qword_1000222C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100022358;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100022368;
  v12[5] = v11;
  unint64_t v13 = self;
  sub_100009DC0((uint64_t)v7, (uint64_t)&unk_100022378, (uint64_t)v12);
  swift_release();
}

- (BSBrandServiceImplementation)init
{
  result = (BSBrandServiceImplementation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100003D94((uint64_t)self + OBJC_IVAR___BSBrandServiceImplementation_businessConnectAssetDataSource);
  sub_100003D38((uint64_t)self + OBJC_IVAR___BSBrandServiceImplementation_rcsChatbotAssetDataSource, &qword_100022268);
  swift_release();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandServiceImplementation_queue);
}

@end