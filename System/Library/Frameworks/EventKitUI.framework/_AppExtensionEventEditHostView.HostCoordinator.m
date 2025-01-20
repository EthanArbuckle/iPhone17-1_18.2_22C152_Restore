@interface _AppExtensionEventEditHostView.HostCoordinator
- (_TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator)init;
- (void)didCompleteWithAction:(int64_t)a3 oldToNewObjectIDMap:(id)a4 waitUntilTimestamp:(id)a5 serializedDictionary:(id)a6 objectIDToChangeSetDictionaryMap:(id)a7 objectIDToPersistentDictionaryMap:(id)a8 eventConstraints:(id)a9;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5;
@end

@implementation _AppExtensionEventEditHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B4106898(v4);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  v6 = (void *)MEMORY[0x1E4FBC8C8];
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x90);
  id v8 = a3;
  v9 = self;
  id v11 = a4;
  v10 = (void *)v7();
  objc_msgSend(v10, sel_invalidate);

  (*(void (**)(void))((*v6 & (uint64_t)v9->super.isa) + 0x98))(0);
}

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5
{
  uint64_t v7 = sub_1B411E8C8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B411E8C8();
  uint64_t v12 = v11;
  v13 = self;
  sub_1B4108094(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didCompleteWithAction:(int64_t)a3 oldToNewObjectIDMap:(id)a4 waitUntilTimestamp:(id)a5 serializedDictionary:(id)a6 objectIDToChangeSetDictionaryMap:(id)a7 objectIDToPersistentDictionaryMap:(id)a8 eventConstraints:(id)a9
{
  uint64_t v13 = (uint64_t)a4;
  if (a4)
  {
    sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
    sub_1B40F9D30();
    uint64_t v13 = sub_1B411E888();
  }
  if (a6) {
    a6 = (id)sub_1B411E888();
  }
  if (a7)
  {
    sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
    sub_1B40F9D30();
    a7 = (id)sub_1B411E888();
  }
  if (a8)
  {
    sub_1B40E1BC8(0, (unint64_t *)&qword_1E9CFC760);
    sub_1B40F9D30();
    a8 = (id)sub_1B411E888();
  }
  id v16 = a5;
  id v17 = a9;
  v18 = self;
  if (v17)
  {
    uint64_t v19 = sub_1B411E478();
    unint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v21 = 0xF000000000000000;
  }
  sub_1B4108480(a3, v13, v16, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, v19, v21);
  sub_1B40FFEF8(v19, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator)init
{
  result = (_TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent
                              + 8];
  uint64_t v4 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_parent
                              + 24];
  swift_release();
  sub_1B40DA270(v3);
  sub_1B40DA270(v4);
  sub_1B40E1C58((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_identity, &qword_1E9CFC168);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI30_AppExtensionEventEditHostView15HostCoordinator_conn));

  swift_release();
}

@end