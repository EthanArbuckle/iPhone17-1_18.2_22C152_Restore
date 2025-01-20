@interface CanvasAssetAccessoryView
- (_TtC16MomentsUIService24CanvasAssetAccessoryView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService24CanvasAssetAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation CanvasAssetAccessoryView

- (_TtC16MomentsUIService24CanvasAssetAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService24CanvasAssetAccessoryView *)CanvasAssetAccessoryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService24CanvasAssetAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CanvasAssetAccessoryView.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService24CanvasAssetAccessoryView_keyColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService24CanvasAssetAccessoryView_accessoryButton);
}

@end