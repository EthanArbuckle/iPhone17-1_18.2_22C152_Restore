@interface MUEVChargingSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (MUEVChargingSectionController)initWithMapItem:(id)a3;
- (MUEVChargingSectionController)initWithMapItem:(id)a3 availabilityProvider:(id)a4;
- (MUPlaceSectionControllerDelegate)delegate;
- (NSArray)sectionViews;
- (int)analyticsModuleType;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MUEVChargingSectionController

- (BOOL)isActive
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MUPlaceSectionController *)&v3 isActive];
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(MUPlaceSectionController *)&v6 setActive:v3];
  v5 = (unsigned char *)(*(void *)&v4[OBJC_IVAR___MUEVChargingSectionController_viewModel]
               + OBJC_IVAR____TtC6MapsUI21MUEVChargingViewModel_isActive);
  swift_beginAccess();
  unsigned char *v5 = v3;
}

- (MUEVChargingSectionController)initWithMapItem:(id)a3 availabilityProvider:(id)a4
{
  return (MUEVChargingSectionController *)EVChargingSectionController.init(mapItem:availabilityProvider:)(a3, a4);
}

- (NSArray)sectionViews
{
  sub_1932486A8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)hasContent
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MUEVChargingSectionController__sectionViews);
  if (v2 >> 62)
  {
    v5 = self;
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1933417D0();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v3 != 0;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (int)analyticsModuleType
{
  return 42;
}

- (MUPlaceSectionControllerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  unint64_t v2 = [(MUPlaceSectionController *)&v4 delegate];
  return v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_19326A4A4((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (MUEVChargingSectionController)initWithMapItem:(id)a3
{
  id v3 = a3;
  result = (MUEVChargingSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MUEVChargingSectionController_viewModel);
}

@end