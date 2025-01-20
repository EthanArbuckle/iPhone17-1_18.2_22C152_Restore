@interface FavoriteColorPickerView.Coordinator
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (_TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator)init;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)showDeleteCallout:(id)a3;
@end

@implementation FavoriteColorPickerView.Coordinator

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100049980();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049960();
  id v10 = a3;
  v11 = self;
  sub_1000288A4();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  uint64_t v4 = sub_100049980();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100049960();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)showDeleteCallout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10001F600(v4);
}

- (_TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator)init
{
  result = (_TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV27com_apple_UIKit_ColorPicker23FavoriteColorPickerView11Coordinator_collectionView));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end