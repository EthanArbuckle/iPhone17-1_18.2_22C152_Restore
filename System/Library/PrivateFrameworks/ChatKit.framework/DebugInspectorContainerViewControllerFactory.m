@interface DebugInspectorContainerViewControllerFactory
+ (id)debugMenuViewController;
+ (id)inspectorViewControllerForChatItems:(id)a3 parallelIndexes:(id)a4;
+ (id)inspectorViewControllerForConversations:(id)a3;
+ (id)inspectorViewControllerForMessage:(id)a3;
- (_TtC7ChatKit44DebugInspectorContainerViewControllerFactory)init;
@end

@implementation DebugInspectorContainerViewControllerFactory

+ (id)inspectorViewControllerForConversations:(id)a3
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922B620);
  sub_18F7B99C0();
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E923D700));
  v4 = (void *)sub_18F7B7D30();

  return v4;
}

+ (id)inspectorViewControllerForMessage:(id)a3
{
  id v3 = a3;
  v4 = (void *)sub_18F61B73C(v3);

  return v4;
}

+ (id)inspectorViewControllerForChatItems:(id)a3 parallelIndexes:(id)a4
{
  sub_18EF3528C(0, (unint64_t *)&qword_1E922BBE0);
  uint64_t v4 = sub_18F7B99C0();
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C110);
  uint64_t v5 = sub_18F7B99C0();
  sub_18F619AF4(v4, v5);
  id v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E923D708));
  v7 = (void *)sub_18F7B7D30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v7;
}

+ (id)debugMenuViewController
{
  uint64_t v2 = type metadata accessor for DebugMenuView();
  uint64_t v3 = v2 - 8;
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v6);
  v8 = (char *)&v13 - v7;
  *uint64_t v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E923C8E0);
  swift_storeEnumTagMultiPayload();
  v9 = (char *)v5 + *(int *)(v3 + 28);
  *(void *)v9 = sub_18F59528C;
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  sub_18F61B85C((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for DebugMenuView);
  id v10 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E923D710));
  v11 = (void *)sub_18F7B7D30();

  return v11;
}

- (_TtC7ChatKit44DebugInspectorContainerViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DebugInspectorContainerViewControllerFactory();
  return [(DebugInspectorContainerViewControllerFactory *)&v3 init];
}

@end