@interface MessageWithActionTileViewWithImage
- (_TtC18HealthExperienceUI25MessageWithActionTileView)messageTileView;
- (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation MessageWithActionTileViewWithImage

- (_TtC18HealthExperienceUI25MessageWithActionTileView)messageTileView
{
  return (_TtC18HealthExperienceUI25MessageWithActionTileView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileView);
}

- (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage *)MessageWithActionTileViewWithImage.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI34MessageWithActionTileViewWithImage)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI025MessageWithActionTileViewE5ImageC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)updateConstraints
{
  v2 = self;
  sub_1AD55A7C0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_messageTileViewLeadingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI34MessageWithActionTileViewWithImage_imageViewLeadingConstraint);
}

@end