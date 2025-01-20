@interface MUHikingTipSectionController
- (BOOL)displayHikingTipWithViewModel:(id)a3;
- (BOOL)hasContent;
- (BOOL)hasContentBeforePersonalizedSuggestionArbitration;
- (BOOL)isImpressionable;
- (CLLocationCoordinate2D)coordinateForTooltip;
- (MUHikingTipSectionController)initWithMapItem:(id)a3;
- (MUHikingTipSectionController)initWithPlaceItem:(id)a3 tipDelegate:(id)a4;
- (NSArray)sectionViews;
- (int)analyticsModuleType;
- (void)fetchHikingTip;
- (void)requestHikingToolTipRegionIDForLocationCoordinate:(CLLocationCoordinate2D)a3;
- (void)tipTapped;
@end

@implementation MUHikingTipSectionController

- (NSArray)sectionViews
{
  sub_1932486A8();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (int)analyticsModuleType
{
  return 44;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUHikingTipSectionController)initWithPlaceItem:(id)a3 tipDelegate:(id)a4
{
  return (MUHikingTipSectionController *)HikingTipSectionController.init(placeItem:tipDelegate:)((uint64_t)a3);
}

- (BOOL)hasContentBeforePersonalizedSuggestionArbitration
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MUHikingTipSectionController__sectionViews);
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

- (BOOL)hasContent
{
  unint64_t v2 = self;
  uint64_t v3 = [(MUPlaceSectionController *)v2 personalizedSuggestionsArbiterDelegate];
  if (v3)
  {
    unsigned __int8 v4 = [(MUPersonalizedSuggestionSectionArbiterDelegate *)v3 shouldShowHikingTipSection];

    swift_unknownObjectRelease();
    return v4;
  }
  else
  {
    unint64_t v6 = *(unint64_t *)((char *)&v2->super.super.isa + OBJC_IVAR___MUHikingTipSectionController__sectionViews);
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_1933417D0();

      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    return v7 != 0;
  }
}

- (void)fetchHikingTip
{
  unint64_t v2 = self;
  HikingTipSectionController.fetchHikingTip()();
}

- (void)tipTapped
{
  uint64_t v3 = MEMORY[0x1996FC540]((char *)self + OBJC_IVAR___MUHikingTipSectionController_tipDelegate, a2);
  if (v3)
  {
    unsigned __int8 v4 = (void *)v3;
    v5 = self;
    objc_msgSend(v4, sel_didTapHikingTip_, v5);

    swift_unknownObjectRelease();
  }
}

- (MUHikingTipSectionController)initWithMapItem:(id)a3
{
  id v3 = a3;
  result = (MUHikingTipSectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUHikingTipSectionController_tipDelegate);
  swift_bridgeObjectRelease();
}

- (CLLocationCoordinate2D)coordinateForTooltip
{
  unint64_t v2 = self;
  id v3 = [(MUPlaceSectionController *)v2 mapItem];
  [(MKMapItem *)v3 _coordinate];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (BOOL)displayHikingTipWithViewModel:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_193247DC0((uint64_t)v4);

  return 1;
}

- (void)requestHikingToolTipRegionIDForLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v6 = MEMORY[0x1996FC540]((char *)self + OBJC_IVAR___MUHikingTipSectionController_tipDelegate, a2);
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = self;
    objc_msgSend(v7, sel_requestHikingToolTipRegionIDForLocationCoordinate_, latitude, longitude);

    swift_unknownObjectRelease();
  }
}

@end