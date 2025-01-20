@interface ASUIClientManager
+ (_TtC17AccessorySetupKit17ASUIClientManager)shared;
- (_TtC17AccessorySetupKit17ASUIClientManager)init;
- (void)activateConnectionWithSession:(id)a3 with:(id)a4 for:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)failWithAccessory:(id)a3 completionHandler:(id)a4;
- (void)updateWithAccessory:(id)a3 options:(unint64_t)a4 for:(id)a5 completionHandler:(id)a6;
@end

@implementation ASUIClientManager

+ (_TtC17AccessorySetupKit17ASUIClientManager)shared
{
  if (qword_268D5B630 != -1) {
    swift_once();
  }
  v2 = (void *)qword_268D5B638;

  return (_TtC17AccessorySetupKit17ASUIClientManager *)v2;
}

- (void)activateConnectionWithSession:(id)a3 with:(id)a4 for:(id)a5 completionHandler:(id)a6
{
  v9 = _Block_copy(a6);
  sub_242F1655C(0, &qword_268D5B698);
  unint64_t v10 = sub_242F16A18();
  if (a5)
  {
    uint64_t v11 = sub_242F169C8();
    a5 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  unint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  id v14 = a3;
  v15 = self;
  sub_242F116A4((uint64_t)v14, v10, v11, (char **)a5, (uint64_t)sub_242F167F0, v13);

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)failWithAccessory:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_242F126A0(v8, (uint64_t)sub_242F167F0, v7);

  swift_release();
}

- (void)updateWithAccessory:(id)a3 options:(unint64_t)a4 for:(id)a5 completionHandler:(id)a6
{
  unint64_t v10 = _Block_copy(a6);
  if (a5)
  {
    uint64_t v11 = sub_242F169C8();
    a5 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  id v14 = a3;
  v15 = self;
  sub_242F128B8(v14, a4, v11, (uint64_t)a5, (uint64_t)sub_242F1641C, v13);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection);
  v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ASUIClientManager();
  [(ASUIClientManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();

  sub_242F12500(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler));

  swift_unknownObjectRelease();
}

- (_TtC17AccessorySetupKit17ASUIClientManager)init
{
  return (_TtC17AccessorySetupKit17ASUIClientManager *)ASUIClientManager.init()();
}

@end