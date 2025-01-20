@interface CNDonationValue.ValueCaster
- (_TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster)init;
- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 imageData:(id)a4;
- (void)visitDonationValue:(id)a3 nameComponents:(id)a4;
- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6;
@end

@implementation CNDonationValue.ValueCaster

- (void)visitDonationValue:(id)a3 nameComponents:(id)a4
{
  uint64_t v6 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v6 - 8, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PersonNameComponents();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v14, v10);
  uint64_t v15 = type metadata accessor for CNDonationValue.Value(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v9, 0, 1, v15);
  v16 = (char *)self
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  id v17 = a3;
  v18 = self;
  sub_10000D270((uint64_t)v9, (uint64_t)v16);
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
}

- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5
{
  uint64_t v7 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *uint64_t v10 = v11;
  v10[1] = v13;
  v10[2] = v14;
  v10[3] = v15;
  uint64_t v16 = type metadata accessor for CNDonationValue.Value(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 0, 1, v16);
  id v17 = (char *)self
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  id v18 = a3;
  uint64_t v19 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000D270((uint64_t)v10, (uint64_t)v17);
  swift_endAccess();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5
{
  uint64_t v8 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (uint64_t *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = self;
  id v18 = [v16 stringValue];
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;

  *uint64_t v11 = v19;
  v11[1] = v21;
  v11[2] = v12;
  v11[3] = v14;
  uint64_t v22 = type metadata accessor for CNDonationValue.Value(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v11, 0, 1, v22);
  uint64_t v23 = (uint64_t)v17
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_10000D270((uint64_t)v11, v23);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6
{
  uint64_t v10 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v10 - 8, v11);
  uint64_t v13 = (id *)((char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *uint64_t v13 = a4;
  v13[1] = (id)a5;
  v13[2] = (id)v14;
  v13[3] = v15;
  uint64_t v16 = type metadata accessor for CNDonationValue.Value(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(id *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 0, 1, v16);
  id v17 = (char *)self
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  id v18 = a4;
  id v19 = a3;
  uint64_t v20 = self;
  swift_bridgeObjectRetain();
  sub_10000D270((uint64_t)v13, (uint64_t)v17);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 imageData:(id)a4
{
  uint64_t v7 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  *uint64_t v10 = v14;
  v10[1] = v16;
  uint64_t v17 = type metadata accessor for CNDonationValue.Value(0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 0, 1, v17);
  uint64_t v18 = (uint64_t)v13
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  sub_10000CA24(v14, v16);
  sub_10000D270((uint64_t)v10, v18);
  swift_endAccess();
  sub_100009AA0(v14, v16);
}

- (_TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster)init
{
  result = (_TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end