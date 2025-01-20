@interface AppEventSearchResultContentView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC20ProductPageExtension12AppEventView)accessibilityAppEventView;
- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension31AppEventSearchResultContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31AppEventSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
@end

@implementation AppEventSearchResultContentView

- (_TtC20ProductPageExtension31AppEventSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31AppEventSearchResultContentView *)sub_10001C5A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31AppEventSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100021688();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventTapGestureRecognizer);
  id v3 = self;
  [v2 removeTarget:v3 action:0];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for AppEventSearchResultContentView();
  [(AppEventSearchResultContentView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventTapGestureRecognizer));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventViewTappedAction));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_impressionsUpdateBlock);

  sub_1000194B0(v3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10001C954();
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventViewTappedAction);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_1000194C0((uint64_t)v3);
    v3(v6);
    sub_1000194B0((uint64_t)v3);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000217A4(v7);

  return v9 & 1;
}

- (_TtC20ProductPageExtension21SmallSearchLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension21SmallSearchLockupView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_lockupView);
}

- (_TtC20ProductPageExtension12AppEventView)accessibilityAppEventView
{
  return (_TtC20ProductPageExtension12AppEventView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                             + OBJC_IVAR____TtC20ProductPageExtension31AppEventSearchResultContentView_appEventView));
}

@end