@interface ContactBuilder.DonationVisitor
- (_TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor)init;
- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 imageData:(id)a4;
- (void)visitDonationValue:(id)a3 nameComponents:(id)a4;
- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6;
@end

@implementation ContactBuilder.DonationVisitor

- (_TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_visitedValues) = (Class)_swiftEmptyArrayStorage;
  id v3 = objc_allocWithZone((Class)CNMutableContact);
  v4 = self;
  v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for ContactBuilder.DonationVisitor();
  return [(ContactBuilder.DonationVisitor *)&v7 init];
}

- (void)visitDonationValue:(id)a3 nameComponents:(id)a4
{
  uint64_t v6 = type metadata accessor for PersonNameComponents();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  sub_100022F98();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  sub_100022440(v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_100022874(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_100023168(v9, v10);

  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 imageData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  id v11 = *(Class *)((char *)&v13->super.isa
                 + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [v11 setImageData:isa];

  sub_100009AA0(v8, v10);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact));

  swift_bridgeObjectRelease();
}

@end