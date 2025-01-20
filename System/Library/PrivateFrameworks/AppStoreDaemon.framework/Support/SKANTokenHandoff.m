@interface SKANTokenHandoff
+ (void)handoffTokenWithTokenData:(id)a3 advertisedItemID:(unint64_t)a4 environment:(id)a5;
- (_TtC9appstored16SKANTokenHandoff)init;
@end

@implementation SKANTokenHandoff

+ (void)handoffTokenWithTokenData:(id)a3 advertisedItemID:(unint64_t)a4 environment:(id)a5
{
  uint64_t v8 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a5;
  v17[5] = v13;
  v17[6] = v15;
  v17[7] = a4;
  id v18 = v12;
  sub_10001EC28(v13, v15);
  sub_1000056F0((uint64_t)v10, (uint64_t)&unk_1005A6990, (uint64_t)v17);
  swift_release();
  sub_10001EC80(v13, v15);
}

- (_TtC9appstored16SKANTokenHandoff)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SKANTokenHandoff();
  return [(SKANTokenHandoff *)&v3 init];
}

@end