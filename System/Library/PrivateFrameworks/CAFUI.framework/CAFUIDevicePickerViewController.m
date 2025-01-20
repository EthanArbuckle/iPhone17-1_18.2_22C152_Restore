@interface CAFUIDevicePickerViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)devicePickerButtonTapped;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4;
- (void)punchThroughController:(id)a3 didDismissPunchThroughWithIdentifier:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CAFUIDevicePickerViewController

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  v4 = (char *)v8.receiver;
  [(CAFUICollectionViewController *)&v8 viewWillDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_ptButton;
  v6 = *(void **)&v4[OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_ptButton];
  if (v6)
  {
    objc_msgSend(v6, sel_removeFromSuperview, v8.receiver, v8.super_class);
    v7 = *(void **)&v4[v5];
  }
  else
  {
    v7 = 0;
  }
  *(void *)&v4[v5] = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  id v4 = v5.receiver;
  [(CAFUIDevicePickerViewController *)&v5 viewWillAppear:v3];
  CAFUIDevicePickerViewController.updatePTButton()();
}

- (void)dealloc
{
  BOOL v3 = self;
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (void *)MEMORY[0x24C59F610](v6);
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_removeObserver_, v7);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  [(CAFUIDevicePickerViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_pairedDevices));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_limitedUIView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_ptButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_pageControlHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_carSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_spinnerTimer));
  outlined destroy of IndexPath?((uint64_t)self + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_spinningCellIndexPath);

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  CAFUIDevicePickerViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAFUIDevicePickerViewController();
  id v2 = v3.receiver;
  [(CAFUIDevicePickerViewController *)&v3 viewDidLayoutSubviews];
  CAFUIDevicePickerViewController.updateFlowLayout()();
  CAFUIDevicePickerViewController.updatePageControl()();
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  double v15 = CAFUIDevicePickerViewController.cellSize.getter();
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  char v10 = CAFUIDevicePickerViewController.isPortraitLayout.getter();

  double result = 60.0;
  if ((v10 & 1) == 0) {
    return 20.0;
  }
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = (void *)CAFUIDevicePickerViewController.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = (char *)a3;
  v11 = self;
  CAFUIDevicePickerViewController.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  double v10 = specialized CAFUIDevicePickerViewController.collectionView(_:layout:insetForSectionAt:)(v7);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = specialized CAFUIDevicePickerViewController.collectionView(_:numberOfItemsInSection:)();

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  int64_t v6 = specialized CAFUIDevicePickerViewController.numberOfSections(in:)();

  return v6;
}

- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  CAFUIDevicePickerViewController.pairedDevicesInformationService(_:didUpdatePairedDeviceList:)(v6, v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized CAFUIDevicePickerViewController.scrollViewDidScroll(_:)();
}

- (void)devicePickerButtonTapped
{
  id v2 = self;
  CAFUIDevicePickerViewController.devicePickerButtonTapped()();
}

- (void)punchThroughController:(id)a3 didDismissPunchThroughWithIdentifier:(id)a4
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5CAFUI31CAFUIDevicePickerViewController_punchThroughState) = 1;
  id v5 = a3;
  id v6 = self;
  CAFUIDevicePickerViewController.updatePTButton()();
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v14 = a3;
  id v7 = (_TtC5CAFUI31CAFUIDevicePickerViewController *)a4;
  id v8 = self;
  id v9 = [(CAFUIDevicePickerViewController *)v8 collectionView];
  if (v9)
  {
    double v10 = v9;
    id v11 = objc_msgSend(v9, sel_indexPathsForSelectedItems);

    if (v11)
    {
      type metadata accessor for IndexPath();
      uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      double v13 = v8;
      specialized Sequence.forEach(_:)(v12, v13);

      swift_bridgeObjectRelease();
      id v7 = v13;
    }
  }
  else
  {
    __break(1u);
  }
}

@end