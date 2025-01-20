@interface EmojiSkinToneControlViewController
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (_TtC10StickerKit34EmojiSkinToneControlViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit34EmojiSkinToneControlViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation EmojiSkinToneControlViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_2452BDDB8();
}

- (_TtC10StickerKit34EmojiSkinToneControlViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2452BEC24();
}

- (_TtC10StickerKit34EmojiSkinToneControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10StickerKit34EmojiSkinToneControlViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit34EmojiSkinToneControlViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34EmojiSkinToneControlViewController_collectionView));

  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10StickerKit34EmojiSkinToneControlViewController_colors);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_2454009D8();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_2453FCDC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  id v10 = a3;
  v11 = self;
  v12 = (void *)EmojiSkinToneControlViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_2453FCDC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  id v10 = a3;
  v11 = self;
  sub_2452BEF28();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  double v6 = 15.0;
  double v7 = 0.0;
  double v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

@end