@interface CNKCallParticipantLabelDescriptorFactory
- (CNKCallParticipantLabelDescriptorFactory)init;
- (id)labelDescriptorWithStringsForCall:(id)a3 callCount:(int64_t)a4 alertAvailable:(BOOL)a5 allowsDuration:(BOOL)a6;
- (id)labelDescriptorWithStringsForCall:(id)a3 callCount:(int64_t)a4 callCenter:(id)a5 alertAvailable:(BOOL)a6 allowsDuration:(BOOL)a7;
- (id)makeLabel;
- (id)makeLabelWithString:(id)a3;
- (id)makeLabelWithString:(id)a3 secondaryString:(id)a4 layoutState:(int64_t)a5;
- (id)organizationNameProvider;
- (void)setOrganizationNameProvider:(id)a3;
@end

@implementation CNKCallParticipantLabelDescriptorFactory

- (id)organizationNameProvider
{
  v5[4] = static CallParticipantLabelDescriptor.organizationNameProvider.getter(self, a2);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1107296256;
  v5[2] = thunk for @escaping @callee_guaranteed (@guaranteed TUCall) -> (@owned String?);
  v5[3] = &block_descriptor_78;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (void)setOrganizationNameProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  static CallParticipantLabelDescriptor.organizationNameProvider.setter(partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned TUCall) -> (@autoreleased NSString?), v5);
}

- (id)makeLabel
{
  uint64_t v2 = self;
  id v3 = CNKCallParticipantLabelDescriptorFactory.makeLabel()();

  return v3;
}

- (id)makeLabelWithString:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  v8 = (void *)CNKCallParticipantLabelDescriptorFactory.makeLabel(using:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)makeLabelWithString:(id)a3 secondaryString:(id)a4 layoutState:(int64_t)a5
{
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  uint64_t v9 = 0;
  if (a4) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_5:
  v10 = self;
  id v11 = CNKCallParticipantLabelDescriptorFactory.makeLabel(using:secondaryString:layoutState:)(v7, v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)labelDescriptorWithStringsForCall:(id)a3 callCount:(int64_t)a4 alertAvailable:(BOOL)a5 allowsDuration:(BOOL)a6
{
  unsigned int v6 = a6;
  id v10 = a3;
  id v11 = self;
  v12 = CNKCallParticipantLabelDescriptorFactory.labelDescriptor(call:callCount:alertAvailable:allowsDuration:)(v10, a4, a5, v6);

  return v12;
}

- (id)labelDescriptorWithStringsForCall:(id)a3 callCount:(int64_t)a4 callCenter:(id)a5 alertAvailable:(BOOL)a6 allowsDuration:(BOOL)a7
{
  unsigned int v7 = a7;
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  v15 = CNKCallParticipantLabelDescriptorFactory.labelDescriptor(call:callCount:callCenter:alertAvailable:allowsDuration:)(v12, a4, v13, a6, v7);

  return v15;
}

- (CNKCallParticipantLabelDescriptorFactory)init
{
  return (CNKCallParticipantLabelDescriptorFactory *)CNKCallParticipantLabelDescriptorFactory.init()();
}

@end