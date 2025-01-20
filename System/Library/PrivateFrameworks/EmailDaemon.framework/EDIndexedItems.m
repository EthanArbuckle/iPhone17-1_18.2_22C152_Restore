@interface EDIndexedItems
- (EDIndexedItems)init;
- (EDIndexedItems)initWithIndexedItems:(id)a3;
- (NSArray)attachments;
- (NSArray)dataDetectionItems;
- (NSArray)messages;
- (NSArray)richLinks;
- (NSArray)updatedMessages;
- (int64_t)count;
@end

@implementation EDIndexedItems

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___EDIndexedItems_count);
}

- (NSArray)messages
{
  return (NSArray *)sub_1DB5A69E8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___EDIndexedItems_messages, (void (*)(void))type metadata accessor for EDIndexedMessage);
}

- (NSArray)updatedMessages
{
  return (NSArray *)sub_1DB5A69E8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___EDIndexedItems_updatedMessages, (void (*)(void))type metadata accessor for EDIndexedMessage);
}

- (NSArray)dataDetectionItems
{
  return (NSArray *)sub_1DB5A69E8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___EDIndexedItems_dataDetectionItems, (void (*)(void))type metadata accessor for EDIndexedMessage);
}

- (NSArray)attachments
{
  return (NSArray *)sub_1DB5A69E8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___EDIndexedItems_attachments, (void (*)(void))type metadata accessor for EDIndexedAttachment);
}

- (NSArray)richLinks
{
  return (NSArray *)sub_1DB5A69E8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___EDIndexedItems_richLinks, (void (*)(void))type metadata accessor for EDIndexedRichLink);
}

- (EDIndexedItems)initWithIndexedItems:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB5F5450);
  unint64_t v3 = sub_1DB5E19F8();
  return (EDIndexedItems *)sub_1DB5A6AA8(v3);
}

- (EDIndexedItems)init
{
  result = (EDIndexedItems *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end