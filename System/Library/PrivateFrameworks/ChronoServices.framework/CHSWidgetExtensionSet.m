@interface CHSWidgetExtensionSet
- (CHSWidgetExtensionSet)init;
- (CHSWidgetExtensionSet)initWithExtensions:(id)a3 equivalentBundleIdentifierResolver:(id)a4 iconResolver:(id)a5;
- (NSArray)widgetExtensionContainers;
- (NSSet)allExtensions;
- (id)copyWithZone:(void *)a3;
- (id)widgetExtensionContainerForContainerBundleIdentifier:(id)a3;
- (id)widgetExtensionContainerForExtensionBundleIdentifier:(id)a3;
- (id)widgetExtensionForExtensionIdentity:(id)a3;
- (void)setAllExtensions:(id)a3;
- (void)setWidgetExtensionContainers:(id)a3;
@end

@implementation CHSWidgetExtensionSet

- (NSSet)allExtensions
{
  sub_190C72C5C(0, (unint64_t *)&qword_1E92AA8A0);
  sub_190C73688();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190D41C98();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_190C72A84(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_190D422C8();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (NSArray)widgetExtensionContainers
{
  type metadata accessor for CHSWidgetExtensionContainer(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_190D41BD8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (id)widgetExtensionContainerForContainerBundleIdentifier:(id)a3
{
  return sub_190C72774(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_190C72C98);
}

- (void)setWidgetExtensionContainers:(id)a3
{
  type metadata accessor for CHSWidgetExtensionContainer(0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionSet_widgetExtensionContainers) = (Class)sub_190D41BE8();
  swift_bridgeObjectRelease();
}

- (void)setAllExtensions:(id)a3
{
  sub_190C72C5C(0, (unint64_t *)&qword_1E92AA8A0);
  sub_190C73688();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSWidgetExtensionSet_allExtensions) = (Class)sub_190D41CA8();
  swift_bridgeObjectRelease();
}

- (CHSWidgetExtensionSet)init
{
  return (CHSWidgetExtensionSet *)sub_190D0F5A8();
}

- (CHSWidgetExtensionSet)initWithExtensions:(id)a3 equivalentBundleIdentifierResolver:(id)a4 iconResolver:(id)a5
{
  sub_190C72C5C(0, (unint64_t *)&qword_1E92AA8A0);
  sub_190C73688();
  uint64_t v7 = sub_190D41CA8();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (CHSWidgetExtensionSet *)sub_190D0F6E4(v7, a4, (uint64_t)a5);
}

- (id)widgetExtensionContainerForExtensionBundleIdentifier:(id)a3
{
  return sub_190C72774(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_190D0FFA0);
}

- (id)widgetExtensionForExtensionIdentity:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(CHSWidgetExtensionSet *)v5 widgetExtensionContainers];
  type metadata accessor for CHSWidgetExtensionContainer(0);
  unint64_t v7 = sub_190D41BE8();

  v8 = v4;
  v9 = sub_190D10288(v7, v8);
  swift_bridgeObjectRelease();

  id v10 = objc_msgSend(v9, sel_extensionForExtensionIdentity_, v8);
  return v10;
}

@end