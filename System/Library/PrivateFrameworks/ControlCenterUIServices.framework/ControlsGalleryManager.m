@interface ControlsGalleryManager
- (BOOL)addWidgetSheetConfigurationManager:(id)a3 isDescriptorSupported:(id)a4;
- (BOOL)controlHostViewControllerShouldPerformPrimaryAction:(id)a3;
- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)iconViewDisplaysLabel:(id)a3;
- (SBHWidgetDragHandling)widgetDragHandler;
- (_TtC23ControlCenterUIServices22ControlsGalleryManager)init;
- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4;
- (id)addWidgetSheetViewController:(id)a3 widgetIconForGalleryItem:(id)a4;
- (id)customApplicationWidgetCollectionsForAddWidgetSheetConfigurationManager:(id)a3;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)gridSizeClassDomainForIconView:(id)a3;
- (id)recycledViewsContainerProviderForViewMap:(id)a3;
- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4;
@end

@implementation ControlsGalleryManager

- (_TtC23ControlCenterUIServices22ControlsGalleryManager)init
{
  result = (_TtC23ControlCenterUIServices22ControlsGalleryManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics);
}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return 32;
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A7DBE40();
  v7 = v6;

  return v7;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_24A7D8038(v4);

  return v6;
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  return 0;
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  return 1;
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (id)gridSizeClassDomainForIconView:(id)a3
{
  id v3 = objc_msgSend(self, sel_controlCenterDomain);
  return v3;
}

- (BOOL)controlHostViewControllerShouldPerformPrimaryAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24A7D86DC(v4);

  return 0;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4
{
  id v4 = (void *)sub_24A7DCA10();
  return v4;
}

- (id)customApplicationWidgetCollectionsForAddWidgetSheetConfigurationManager:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_24A7DBEEC();

  if (v6)
  {
    sub_24A7CAA58(0, &qword_2697BDBF0);
    v7 = (void *)sub_24A7DCAC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)addWidgetSheetConfigurationManager:(id)a3 isDescriptorSupported:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24A7DBFA8(v7);
  char v10 = v9;

  return v10 & 1;
}

- (SBHWidgetDragHandling)widgetDragHandler
{
  return (SBHWidgetDragHandling *)0;
}

- (id)addWidgetSheetViewController:(id)a3 widgetIconForGalleryItem:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = sub_24A7DC378((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

@end