@interface ATXRelevantShortcutCandidate
- (ATXRelevantShortcutCandidate)init;
- (ATXRelevantShortcutCandidate)initWithWidgetDescriptor:(id)a3 donationBundleIdentifier:(id)a4 intent:(id)a5 relevantContexts:(id)a6;
- (CHSWidgetDescriptor)widgetDescriptor;
- (INIntent)intent;
- (NSArray)relevantContexts;
- (NSString)description;
- (NSString)donationBundleIdentifier;
@end

@implementation ATXRelevantShortcutCandidate

- (CHSWidgetDescriptor)widgetDescriptor
{
  return (CHSWidgetDescriptor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___ATXRelevantShortcutCandidate_widgetDescriptor));
}

- (NSString)donationBundleIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D13F2678();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (INIntent)intent
{
  return (INIntent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___ATXRelevantShortcutCandidate_intent));
}

- (NSArray)relevantContexts
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23538);
  v2 = (void *)sub_1D13F2738();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (ATXRelevantShortcutCandidate)initWithWidgetDescriptor:(id)a3 donationBundleIdentifier:(id)a4 intent:(id)a5 relevantContexts:(id)a6
{
  uint64_t v9 = sub_1D13F2688();
  uint64_t v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23538);
  v12 = (objc_class *)sub_1D13F2748();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXRelevantShortcutCandidate_widgetDescriptor) = (Class)a3;
  v13 = (uint64_t *)((char *)self + OBJC_IVAR___ATXRelevantShortcutCandidate_donationBundleIdentifier);
  uint64_t *v13 = v9;
  v13[1] = v11;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXRelevantShortcutCandidate_intent) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXRelevantShortcutCandidate_relevantContexts) = v12;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for RelevantShortcutCandidate();
  id v14 = a3;
  id v15 = a5;
  return [(ATXRelevantShortcutCandidate *)&v17 init];
}

- (NSString)description
{
  v2 = self;
  sub_1D1396844();

  v3 = (void *)sub_1D13F2678();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (ATXRelevantShortcutCandidate)init
{
  result = (ATXRelevantShortcutCandidate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end