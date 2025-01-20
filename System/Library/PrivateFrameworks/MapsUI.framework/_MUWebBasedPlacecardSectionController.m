@interface _MUWebBasedPlacecardSectionController
- (MUWebBasedPlacecardSectionController)sectionController;
- (MUWebBasedPlacecardSectionControllerConfiguration)configuration;
- (_TtC6MapsUI23MUPlaceActionDispatcher)actionDispatcher;
- (_TtC6MapsUI37_MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3;
- (_TtC6MapsUI37_MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3 placeActionDispatcher:(id)a4 configuration:(id)a5 sectionController:(id)a6;
- (void)didReceiveMessageFromWebContentViewController:(id)a3 replyHandler:(id)a4;
- (void)setSectionController:(id)a3;
@end

@implementation _MUWebBasedPlacecardSectionController

- (MUWebBasedPlacecardSectionControllerConfiguration)configuration
{
  return (MUWebBasedPlacecardSectionControllerConfiguration *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_configuration);
}

- (_TtC6MapsUI23MUPlaceActionDispatcher)actionDispatcher
{
  return (_TtC6MapsUI23MUPlaceActionDispatcher *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                         + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_actionDispatcher));
}

- (MUWebBasedPlacecardSectionController)sectionController
{
  v2 = (char *)self + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_sectionController;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1996FC540](v2);
  return (MUWebBasedPlacecardSectionController *)v3;
}

- (void)setSectionController:(id)a3
{
}

- (_TtC6MapsUI37_MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3 placeActionDispatcher:(id)a4 configuration:(id)a5 sectionController:(id)a6
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_actionDispatcher) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_configuration) = (Class)a5;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for _MUWebBasedPlacecardSectionController();
  id v10 = a4;
  id v11 = a5;
  return [(MUPlaceSectionController *)&v13 initWithMapItem:a3];
}

- (_TtC6MapsUI37_MUWebBasedPlacecardSectionController)initWithMapItem:(id)a3
{
  id v3 = a3;
  result = (_TtC6MapsUI37_MUWebBasedPlacecardSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_configuration));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC6MapsUI37_MUWebBasedPlacecardSectionController_actionDispatcher));
  swift_unknownObjectWeakDestroy();
}

- (void)didReceiveMessageFromWebContentViewController:(id)a3 replyHandler:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  id v11 = self;
  uint64_t v8 = sub_193340E70();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_19325FD6C(v8, v10, v11, v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_193260478(v8, v10);
}

@end