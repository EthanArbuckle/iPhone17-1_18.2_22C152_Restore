@interface AccessoryEventItemSelectionController
- (_TtC6HomeUI37AccessoryEventItemSelectionController)init;
@end

@implementation AccessoryEventItemSelectionController

- (_TtC6HomeUI37AccessoryEventItemSelectionController)init
{
  result = (_TtC6HomeUI37AccessoryEventItemSelectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_triggerBuilder));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_eventBuilderItem));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_stepIdentifier));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6HomeUI37AccessoryEventItemSelectionController_selectionCompleteFuture);
}

@end