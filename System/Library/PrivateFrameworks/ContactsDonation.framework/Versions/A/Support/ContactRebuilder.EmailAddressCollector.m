@interface ContactRebuilder.EmailAddressCollector
- (_TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector)init;
- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 imageData:(id)a4;
- (void)visitDonationValue:(id)a3 nameComponents:(id)a4;
- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6;
@end

@implementation ContactRebuilder.EmailAddressCollector

- (void)visitDonationValue:(id)a3 nameComponents:(id)a4
{
  uint64_t v6 = type metadata accessor for PersonNameComponents();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = (Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations);
  swift_beginAccess();
  id v12 = a3;
  v13 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_blacklistedEmailAddresses);
  id v11 = a3;
  id v12 = self;
  if ((sub_100027488(v7, v9, v10) & 1) == 0)
  {
    v13 = (Class *)((char *)&v12->super.isa
                  + OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations);
    swift_beginAccess();
    id v14 = v11;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
  }

  swift_bridgeObjectRelease();
}

- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5
{
  uint64_t v8 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations);
  swift_beginAccess();
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
}

- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6
{
  id v9 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations);
  swift_beginAccess();
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
}

- (void)visitDonationValue:(id)a3 imageData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  id v12 = (Class *)((char *)&v8->super.isa
                + OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations);
  swift_beginAccess();
  id v13 = v6;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_endAccess();
  sub_100009AA0(v9, v11);
}

- (_TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector)init
{
  result = (_TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end