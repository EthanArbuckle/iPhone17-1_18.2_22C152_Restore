@interface GameCenterReengagementCollectionViewCell
- (BOOL)canBecomeFocused;
- (_TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation GameCenterReengagementCollectionViewCell

- (_TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell *)sub_100136930(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100138858();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100137648();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_100138430(x, y, width, height);

  sub_10000D280((uint64_t *)&unk_100952C70);
  v8.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_itemLayoutContext);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_badgeGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_badge));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_subtitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_heroContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_lockup));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_button));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_visualEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension40GameCenterReengagementCollectionViewCell_backgroundImage));

  swift_bridgeObjectRelease();
}

@end