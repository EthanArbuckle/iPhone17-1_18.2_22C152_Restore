@interface PurchaseArcadeBatchTask
- (ASDPurchaseResponse)purchaseResponse;
- (_TtC9appstored23PurchaseArcadeBatchTask)init;
- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemIDs:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6;
- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6;
- (_TtC9appstored23PurchaseArcadeBatchTask)initWithoutKeepAlive;
- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 purchase:(AMSPurchase *)a4 purchaseQueue:(AMSPurchaseQueue *)a5 completion:(id)a6;
- (void)mainWithCompletionHandler:(id)a3;
- (void)setPurchaseResponse:(id)a3;
@end

@implementation PurchaseArcadeBatchTask

- (ASDPurchaseResponse)purchaseResponse
{
  return (ASDPurchaseResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                        + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse));
}

- (void)setPurchaseResponse:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse) = (Class)a3;
  id v3 = a3;
}

- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemIDs:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a5)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_itemIDs) = v11;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_additionalBuyParams) = (Class)a4;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_client);
  uint64_t *v14 = v12;
  v14[1] = v13;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_logKey) = (Class)a6;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_itemMetadata) = 0;
  v17.receiver = self;
  v17.super_class = ObjectType;
  id v15 = a6;
  return [(Task *)&v17 init];
}

- (_TtC9appstored23PurchaseArcadeBatchTask)initWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 client:(id)a5 logKey:(id)a6
{
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a5)
  {
    a5 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a6;
  uint64_t v13 = (_TtC9appstored23PurchaseArcadeBatchTask *)sub_1000A9724(v9, (uint64_t)a4, (uint64_t)a5, v11, v12);

  return v13;
}

- (void)mainWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1005A5798;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1005A57A0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_1000DFAB0((uint64_t)v7, (uint64_t)&unk_1005A57A8, (uint64_t)v12);
  swift_release();
}

- (void)handleAuthenticateRequest:(AMSAuthenticateRequest *)a3 purchase:(AMSPurchase *)a4 purchaseQueue:(AMSPurchaseQueue *)a5 completion:(id)a6
{
  uint64_t v11 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  id v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  objc_super v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1005A5768;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1005A35A0;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1000DFAB0((uint64_t)v13, (uint64_t)&unk_1005A4930, (uint64_t)v18);
  swift_release();
}

- (_TtC9appstored23PurchaseArcadeBatchTask)init
{
  result = (_TtC9appstored23PurchaseArcadeBatchTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9appstored23PurchaseArcadeBatchTask)initWithoutKeepAlive
{
  result = (_TtC9appstored23PurchaseArcadeBatchTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_logKey));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9appstored23PurchaseArcadeBatchTask_purchaseResponse);
}

@end