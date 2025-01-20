@interface AppEventSearchResultCollectionViewCell
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC18ASMessagesProvider12AppEventView)accessibilityAppEventView;
- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView;
- (_TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventSearchResultCollectionViewCell

- (_TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell *)sub_5D0EB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_5D29C8();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_appEventTapGestureRecognizer);
  id v3 = self;
  [v2 removeTarget:v3 action:0];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AppEventSearchResultCollectionViewCell();
  [(AppEventSearchResultCollectionViewCell *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_appEventView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_appEventTapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_appEventViewTappedAction);

  sub_13308(v3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_5D125C();
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_appEventViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_13318((uint64_t)v3);
    v3(v6);
    sub_13308((uint64_t)v3);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_5D2AC8(v7);

  return v9 & 1;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_5D17CC();
}

- (_TtC18ASMessagesProvider21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC18ASMessagesProvider21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_lockupView);
}

- (_TtC18ASMessagesProvider12AppEventView)accessibilityAppEventView
{
  return (_TtC18ASMessagesProvider12AppEventView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                           + OBJC_IVAR____TtC18ASMessagesProvider38AppEventSearchResultCollectionViewCell_appEventView));
}

@end