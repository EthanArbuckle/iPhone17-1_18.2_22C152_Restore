@interface DOCProgressCollectionIndicatorView
- (BOOL)isHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)didMoveToWindow;
- (void)didTap;
- (void)setHidden:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 40.0;
  double v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didTap
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v4 = Strong;
    if ([Strong respondsToSelector:"progressIndicatorViewDidReceiveTap:"])
    {
      v5 = self;
      [v4 progressIndicatorViewDidReceiveTap:v5];
    }
    swift_unknownObjectRelease();
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_1000DCF1C();

  return v9;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorView();
  id v2 = v4.receiver;
  [(DOCProgressCollectionIndicatorView *)&v4 didMoveToWindow];
  double v3 = (char *)v2;
  sub_1000DD250(v3, (unsigned __int8 *)v3);
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorView();
  return [(DOCProgressCollectionIndicatorView *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCProgressCollectionIndicatorView();
  v9.receiver = self;
  v9.super_class = v5;
  id v6 = self;
  char v7 = [(DOCProgressCollectionIndicatorView *)&v9 isHidden];
  v8.receiver = v6;
  v8.super_class = v5;
  [(DOCProgressCollectionIndicatorView *)&v8 setHidden:v3];
  sub_1000DAF6C(v7);
}

- (_TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView_preferredIconColor));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView____lazy_storage___didTapGestureRecognizer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView_pointerInteraction));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service34DOCProgressCollectionIndicatorView_aggregateIndicatorView);
}

@end