@interface CallParticipantLabelDescriptor
- (BOOL)isDynamic;
- (NSArray)strings;
- (NSString)durationString;
- (NSString)localizedSenderIdentity;
- (NSString)secondaryString;
- (_TtC15ConversationKit30CallParticipantLabelDescriptor)init;
- (int64_t)layoutState;
- (void)setDurationString:(id)a3;
- (void)setIsDynamic:(BOOL)a3;
- (void)setLayoutState:(int64_t)a3;
- (void)setLocalizedSenderIdentity:(id)a3;
- (void)setSecondaryString:(id)a3;
- (void)setStrings:(id)a3;
@end

@implementation CallParticipantLabelDescriptor

- (NSArray)strings
{
  CallParticipantLabelDescriptor.strings.getter();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setStrings:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  CallParticipantLabelDescriptor.strings.setter(v4);
}

- (NSString)secondaryString
{
  return (NSString *)@objc CallParticipantLabelDescriptor.secondaryString.getter((uint64_t)self, (uint64_t)a2, CallParticipantLabelDescriptor.secondaryString.getter);
}

- (void)setSecondaryString:(id)a3
{
}

- (NSString)durationString
{
  return (NSString *)@objc CallParticipantLabelDescriptor.secondaryString.getter((uint64_t)self, (uint64_t)a2, CallParticipantLabelDescriptor.durationString.getter);
}

- (void)setDurationString:(id)a3
{
}

- (int64_t)layoutState
{
  return CallParticipantLabelDescriptor.layoutState.getter();
}

- (void)setLayoutState:(int64_t)a3
{
}

- (BOOL)isDynamic
{
  return CallParticipantLabelDescriptor.isDynamic.getter() & 1;
}

- (void)setIsDynamic:(BOOL)a3
{
}

- (NSString)localizedSenderIdentity
{
  return (NSString *)@objc CallParticipantLabelDescriptor.secondaryString.getter((uint64_t)self, (uint64_t)a2, CallParticipantLabelDescriptor.localizedSenderIdentity.getter);
}

- (void)setLocalizedSenderIdentity:(id)a3
{
}

- (_TtC15ConversationKit30CallParticipantLabelDescriptor)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end