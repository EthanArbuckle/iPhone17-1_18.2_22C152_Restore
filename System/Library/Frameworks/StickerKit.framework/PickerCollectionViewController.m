@interface PickerCollectionViewController
- (BOOL)_canShowWhileLocked;
- (_TtC10StickerKit30PickerCollectionViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit30PickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
@end

@implementation PickerCollectionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2452B538C();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2452B96D8();
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_2453FCDC8();
  uint64_t v6 = sub_2453FFD18();
  id v7 = a3;
  v8 = self;
  sub_2452B9A78(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10StickerKit30PickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10StickerKit30PickerCollectionViewController *)PickerCollectionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit30PickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit30PickerCollectionViewController *)PickerCollectionViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit30PickerCollectionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit30PickerCollectionViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit30PickerCollectionViewController_categoryBarController));
  swift_release();

  swift_release();
}

@end