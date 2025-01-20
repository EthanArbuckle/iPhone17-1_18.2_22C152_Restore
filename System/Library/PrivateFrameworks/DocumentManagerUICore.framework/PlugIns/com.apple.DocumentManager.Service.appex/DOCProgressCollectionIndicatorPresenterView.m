@interface DOCProgressCollectionIndicatorPresenterView
- (_TtC33com_apple_DocumentManager_Service43DOCProgressCollectionIndicatorPresenterView)initWithFrame:(CGRect)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
@end

@implementation DOCProgressCollectionIndicatorPresenterView

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100413B08(v4);
}

- (_TtC33com_apple_DocumentManager_Service43DOCProgressCollectionIndicatorPresenterView)initWithFrame:(CGRect)a3
{
  result = (_TtC33com_apple_DocumentManager_Service43DOCProgressCollectionIndicatorPresenterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service43DOCProgressCollectionIndicatorPresenterView_preferredIconColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service43DOCProgressCollectionIndicatorPresenterView_progressIndicatorView);
}

@end