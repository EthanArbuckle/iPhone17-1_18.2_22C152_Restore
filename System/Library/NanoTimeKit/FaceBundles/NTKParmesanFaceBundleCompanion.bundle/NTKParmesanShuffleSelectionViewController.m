@interface NTKParmesanShuffleSelectionViewController
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (NTKParmesanShuffleSelectionViewController)initWithCoder:(id)a3;
- (NTKParmesanShuffleSelectionViewController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5;
- (unint64_t)selectedNumeralsOption;
- (unint64_t)selectedTypeface;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)passiveContentDataSourceAvailableTypesDidChange:(id)a3;
- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3;
- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3;
- (void)setSelectedNumeralsOption:(unint64_t)a3;
- (void)setSelectedTypeface:(unint64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NTKParmesanShuffleSelectionViewController

- (unint64_t)selectedTypeface
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_selectedTypeface);
}

- (void)setSelectedTypeface:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_selectedTypeface) = (Class)a3;
}

- (unint64_t)selectedNumeralsOption
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_selectedNumeralsOption);
}

- (void)setSelectedNumeralsOption:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_selectedNumeralsOption) = (Class)a3;
}

- (NTKParmesanShuffleSelectionViewController)initWithEditor:(id)a3 face:(id)a4 inGallery:(BOOL)a5
{
  return (NTKParmesanShuffleSelectionViewController *)sub_246B8143C(a3, a4, a5);
}

- (NTKParmesanShuffleSelectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246B8C2E0();
}

- (void)dealloc
{
  v2 = self;
  sub_246B81A9C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_collectionView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___peopleDataSource));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_diffableDataSource));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___NTKParmesanShuffleSelectionViewController_floatingButtonTray));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);
  uint64_t v4 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity
                  + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate
                  + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super._view
                  + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super._tabBarItem
                  + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super._tab
                  + OBJC_IVAR___NTKParmesanShuffleSelectionViewController____lazy_storage___trayConfiguration);

  sub_246B8BD80(v3, v4, v5, v6, v7, v8, v9);
}

- (void)loadView
{
  v2 = self;
  sub_246B81D60();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_246B8281C(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ParmesanShuffleSelectionViewController();
  id v2 = v3.receiver;
  [(NTKParmesanShuffleSelectionViewController *)&v3 viewDidLayoutSubviews];
  sub_246B85F70();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_246B837C8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_246B8D1DC);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_246B837C8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_246B8D24C);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)passiveContentDataSourceAvailableTypesDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_246B8EED4((uint64_t)&unk_26FB20438, (uint64_t)sub_246B8F238, (uint64_t)&unk_26FB20450);
}

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_246B8EED4((uint64_t)&unk_26FB203E8, (uint64_t)sub_246B8F1AC, (uint64_t)&unk_26FB20400);
}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  uint64_t v4 = qword_2691D6308;
  id v10 = a3;
  id v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_246C2C088();
  sub_246B8BE0C(v6, (uint64_t)qword_2691E0168);
  uint64_t v7 = sub_246C2C068();
  os_log_type_t v8 = sub_246C2CEC8();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_246B51000, v7, v8, "People picker data source did update", v9, 2u);
    MEMORY[0x24C545990](v9, -1, -1);
  }

  sub_246B8B17C(v10);
}

@end