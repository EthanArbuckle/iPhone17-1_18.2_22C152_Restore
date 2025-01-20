@interface HUDashboardLayoutManager
- (BOOL)isAdaptiveTileStyleInSectionIdentifier:(id)a3 context:(id)a4;
- (HUDashboardLayoutManager)init;
- (HUDashboardLayoutManager)initWithDelegate:(id)a3;
- (HUGridSize)favoritesSectionGridSize;
- (id)buildCamerasMosaicSectionFor:(id)a3 layoutEnvironment:(id)a4 cameraLayoutOptions:(id)a5;
- (id)buildNowPlayingSectionFor:(id)a3 sectionIdentifier:(id)a4 :(id)a5;
- (id)buildResponsiveGridCamerasSectionFor:(id)a3 layoutEnvironment:(id)a4 cameraLayoutOptions:(id)a5;
- (id)buildSectionWithIdentifier:(id)a3 context:(id)a4 layoutEnvironment:(id)a5;
- (id)configurationWithContext:(id)a3 traitCollection:(id)a4;
- (id)generateCameraLayoutOptionsFor:(id)a3;
- (void)registerSectionDecorationViewsWithLayout:(id)a3;
@end

@implementation HUDashboardLayoutManager

- (HUDashboardLayoutManager)initWithDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUDashboardLayoutManager_adaptiveTileDragInteractionLayouts) = 0;
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition);
  v3[1] = 0;
  v3[2] = 0;
  void *v3 = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardLayoutManager();
  swift_unknownObjectRetain();
  v4 = [(HUCollectionLayoutManager *)&v6 init];
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

- (id)configurationWithContext:(id)a3 traitCollection:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_defaultConfiguration);
  objc_msgSend(v11, sel_setContentInsetsReference_, 3);
  objc_msgSend(v11, sel_setInterSectionSpacing_, 20.0);

  return v11;
}

- (id)buildSectionWithIdentifier:(id)a3 context:(id)a4 layoutEnvironment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  id v11 = sub_1BE3B5F80(v8, (uint64_t)v9, a5);

  swift_unknownObjectRelease();

  return v11;
}

- (BOOL)isAdaptiveTileStyleInSectionIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  BOOL v9 = sub_1BE3B7614((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (id)buildNowPlayingSectionFor:(id)a3 sectionIdentifier:(id)a4 :(id)a5
{
  uint64_t v7 = sub_1BE9C49F8();
  uint64_t v9 = v8;
  swift_unknownObjectRetain();
  v10 = self;
  id v11 = sub_1BE3B7114(v7, v9, a5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v11;
}

- (void)registerSectionDecorationViewsWithLayout:(id)a3
{
  type metadata accessor for TransparentBlackBackgroundDecorationView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = (id)sub_1BE9C49B8();
  objc_msgSend(v6, sel_registerClass_forDecorationViewOfKind_, ObjCClassFromMetadata, v8);
}

- (HUGridSize)favoritesSectionGridSize
{
  int64_t v2 = 1;
  int64_t v3 = 2;
  result.columnsAcross = v3;
  result.rowsDown = v2;
  return result;
}

- (HUDashboardLayoutManager)init
{
  HUGridSize result = (HUDashboardLayoutManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HUDashboardLayoutManager_hoveringGridPosition);
}

- (id)buildCamerasMosaicSectionFor:(id)a3 layoutEnvironment:(id)a4 cameraLayoutOptions:(id)a5
{
  return sub_1BE579F5C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, id))sub_1BE5791A8);
}

- (id)buildResponsiveGridCamerasSectionFor:(id)a3 layoutEnvironment:(id)a4 cameraLayoutOptions:(id)a5
{
  return sub_1BE579F5C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t (*)(uint64_t, uint64_t, id))sub_1BE579728);
}

- (id)generateCameraLayoutOptionsFor:(id)a3
{
  if (a3)
  {
    v4 = self;
    id v5 = a3;
    uint64_t v6 = HUCellSizeSubclassForViewSizeSubclass((unint64_t)objc_msgSend(v5, sel_viewSizeSubclass));
    id v7 = objc_msgSend(self, sel_defaultOptionsForCellSizeSubclass_viewSizeSubclass_, v6, objc_msgSend(v5, sel_viewSizeSubclass));
  }
  else
  {
    id v7 = objc_msgSend(self, sel_defaultOptionsForCellSizeSubclass_viewSizeSubclass_, 1, 1);
  }

  return v7;
}

@end