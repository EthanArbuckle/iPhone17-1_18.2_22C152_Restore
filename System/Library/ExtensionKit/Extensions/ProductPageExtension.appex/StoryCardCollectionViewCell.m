@interface StoryCardCollectionViewCell
- (NSArray)accessibilityElements;
- (_TtC20ProductPageExtension27StoryCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation StoryCardCollectionViewCell

- (_TtC20ProductPageExtension27StoryCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27StoryCardCollectionViewCell *)sub_100345D08(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003468FC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100346BB0();
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_100346DCC();

  if (v3)
  {
    v4.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3)
  {
    sub_10077BED0();
    NSArray v4 = self;
    v5.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StoryCardCollectionViewCell();
  [(StoryCardCollectionViewCell *)&v7 setAccessibilityElements:v5.super.isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27StoryCardCollectionViewCell_mediaBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27StoryCardCollectionViewCell_mediaBackgroundViewMirror));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27StoryCardCollectionViewCell_infoLayer));
  swift_weakDestroy();

  swift_weakDestroy();
}

@end