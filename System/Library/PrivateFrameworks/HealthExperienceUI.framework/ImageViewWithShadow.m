@interface ImageViewWithShadow
- (_TtC18HealthExperienceUI19ImageViewWithShadow)init;
- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithFrame:(CGRect)a3;
- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithImage:(id)a3;
- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)layoutSubviews;
@end

@implementation ImageViewWithShadow

- (_TtC18HealthExperienceUI19ImageViewWithShadow)init
{
  return (_TtC18HealthExperienceUI19ImageViewWithShadow *)ImageViewWithShadow.init()();
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ImageViewWithShadow();
  id v2 = v10.receiver;
  [(ImageViewWithShadow *)&v10 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v10.receiver, v10.super_class);
  objc_msgSend(v2, sel_bounds);
  id v8 = objc_msgSend(self, sel_bezierPathWithRect_, v4, v5, v6, v7);
  id v9 = objc_msgSend(v8, sel_CGPath);

  objc_msgSend(v3, sel_setShadowPath_, v9);
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI19ImageViewWithShadow)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI19ImageViewWithShadow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end