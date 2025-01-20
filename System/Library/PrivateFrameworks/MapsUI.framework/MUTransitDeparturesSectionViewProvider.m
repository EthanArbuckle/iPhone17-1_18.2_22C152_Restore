@interface MUTransitDeparturesSectionViewProvider
- (BOOL)needsRebuild;
- (MUTransitDeparturesSectionViewProvider)init;
- (MUTransitDeparturesSectionViewProvider)initWithDataSource:(id)a3 userInteractionDelegate:(id)a4;
- (id)sectionViewsForCurrentState;
- (void)filterView:(id)a3 didChangeSystemSelection:(id)a4;
- (void)setNeedsRebuild:(BOOL)a3;
@end

@implementation MUTransitDeparturesSectionViewProvider

- (BOOL)needsRebuild
{
  v2 = (BOOL *)self + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_needsRebuild;
  swift_beginAccess();
  return *v2;
}

- (void)setNeedsRebuild:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_needsRebuild;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (MUTransitDeparturesSectionViewProvider)initWithDataSource:(id)a3 userInteractionDelegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  v5 = (MUTransitDeparturesSectionViewProvider *)sub_1932577C4(v4);

  swift_unknownObjectRelease();
  return v5;
}

- (id)sectionViewsForCurrentState
{
  v2 = self;
  TransitDeparturesSectionViewProvider.sectionViewsForCurrentState()();

  sub_193259128();
  v3 = (void *)sub_193341450();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)filterView:(id)a3 didChangeSystemSelection:(id)a4
{
  swift_unknownObjectRetain_n();
  id v7 = a3;
  v8 = self;
  sub_1932498D0((uint64_t)a4);

  swift_unknownObjectRelease();
}

- (MUTransitDeparturesSectionViewProvider)init
{
  result = (MUTransitDeparturesSectionViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_userInteractionDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUTransitDeparturesSectionViewProvider_footerAttributionViewModel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MUTransitDeparturesSectionViewProvider____lazy_storage___systemFilterView));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___MUTransitDeparturesSectionViewProvider____lazy_storage___overallIncidentsView);
}

@end