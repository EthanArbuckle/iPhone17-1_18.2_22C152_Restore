@interface MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell
- (NSArray)accessibilityElements;
- (_TtC20ProductPageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)a3;
@end

@implementation MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell

- (_TtC20ProductPageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *)sub_100654E60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell();
  id v2 = v4.receiver;
  [(BaseTodayCardCollectionViewCell *)&v4 layoutSubviews];
  id v3 = sub_1006550B8();
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell();
  id v2 = v4.receiver;
  [(BaseTodayCardCollectionViewCell *)&v4 prepareForReuse];
  id v3 = sub_1006550B8();
}

- (NSArray)accessibilityElements
{
  sub_10000D280(&qword_10094C640);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10078DF90;
  objc_super v4 = self;
  v5 = (char *)sub_1006550B8();
  id v6 = *(id *)&v5[OBJC_IVAR____TtC20ProductPageExtension43MediumAdLockupWithScreenshotsBackgroundView_lockupView];

  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v6;

  v7.super.isa = sub_10077BEC0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)setAccessibilityElements:(id)a3
{
  if (a3)
  {
    sub_10077BED0();
    objc_super v4 = self;
    v5.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell();
  [(MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell *)&v7 setAccessibilityElements:v5.super.isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension66MediumAdLockupWithScreenshotsBackgroundTodayCardCollectionViewCell____lazy_storage___mediumAdLockupWithScreenshotsBackgroundView));
}

@end