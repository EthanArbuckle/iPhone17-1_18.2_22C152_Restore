@interface CenterTickSlider
- (_TtC5CAFUI16CenterTickSlider)initWithCoder:(id)a3;
- (_TtC5CAFUI16CenterTickSlider)initWithFrame:(CGRect)a3;
- (id)createThumbView;
- (void)layoutSubviews;
@end

@implementation CenterTickSlider

- (id)createThumbView
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CenterTickSlider();
  v2 = (char *)v8.receiver;
  id v3 = [(CenterTickSlider *)&v8 createThumbView];
  uint64_t v4 = OBJC_IVAR____TtC5CAFUI16CenterTickSlider_thumbImageView;
  v5 = *(void **)&v2[OBJC_IVAR____TtC5CAFUI16CenterTickSlider_thumbImageView];
  *(void *)&v2[OBJC_IVAR____TtC5CAFUI16CenterTickSlider_thumbImageView] = v3;

  id v6 = *(id *)&v2[v4];
  return v6;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CenterTickSlider();
  id v2 = v3.receiver;
  [(CenterTickSlider *)&v3 layoutSubviews];
  CenterTickSlider.setupOverlayView()();
}

- (_TtC5CAFUI16CenterTickSlider)initWithFrame:(CGRect)a3
{
  return (_TtC5CAFUI16CenterTickSlider *)CenterTickSlider.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5CAFUI16CenterTickSlider)initWithCoder:(id)a3
{
  return (_TtC5CAFUI16CenterTickSlider *)CenterTickSlider.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI16CenterTickSlider_tickmarkView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5CAFUI16CenterTickSlider_thumbImageView);
}

@end