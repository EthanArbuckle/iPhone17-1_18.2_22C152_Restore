@interface ObservableRecentsController
- (_TtC11MobilePhone27ObservableRecentsController)init;
- (void)dealloc;
- (void)recentsController:(id)a3 didChangeCalls:(id)a4;
@end

@implementation ObservableRecentsController

- (void)dealloc
{
  v2 = self;
  ObservableRecentsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MobilePhone27ObservableRecentsController__recentCalls;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<[CHRecentCall]>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MobilePhone27ObservableRecentsController__filter;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ObservableRecentsController.Filter>);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MobilePhone27ObservableRecentsController__contactsChangedDate;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Date?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobilePhone27ObservableRecentsController_recentsController));
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  type metadata accessor for VMAccount(0, (unint64_t *)&lazy cache variable for type metadata for CHRecentCall);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  uint64_t v8 = self;
  specialized ObservableRecentsController.recentsController(_:didChange:)(v6);

  swift_bridgeObjectRelease();
}

- (_TtC11MobilePhone27ObservableRecentsController)init
{
  result = (_TtC11MobilePhone27ObservableRecentsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end