@interface AppEventSearchResultCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC22SubscribePageExtension12AppEventView)accessibilityAppEventView;
- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventSearchResultCollectionViewCell

- (_TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell *)sub_100142EF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100143E34();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventTapGestureRecognizer);
  id v3 = self;
  [v2 removeTarget:v3 action:0];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AppEventSearchResultCollectionViewCell();
  [(AppEventSearchResultCollectionViewCell *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventTapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction);

  sub_10001A4D0(v3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100143294();
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_10001A4E0((uint64_t)v3);
    v3(v6);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100143F34(v7);

  return v9 & 1;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100143804();
}

- (_TtC22SubscribePageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC22SubscribePageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_lockupView);
}

- (_TtC22SubscribePageExtension12AppEventView)accessibilityAppEventView
{
  return (_TtC22SubscribePageExtension12AppEventView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                               + OBJC_IVAR____TtC22SubscribePageExtension38AppEventSearchResultCollectionViewCell_appEventView));
}

@end