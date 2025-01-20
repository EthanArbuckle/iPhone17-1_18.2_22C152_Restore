@interface AmbientCompactMatchingFlowView
- (_TtC16MusicRecognition30AmbientCompactMatchingFlowView)initWithCoder:(id)a3;
- (_TtC16MusicRecognition30AmbientCompactMatchingFlowView)initWithFrame:(CGRect)a3;
@end

@implementation AmbientCompactMatchingFlowView

- (_TtC16MusicRecognition30AmbientCompactMatchingFlowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView;
  id v10 = objc_allocWithZone((Class)UIImageView);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)[v10 initWithFrame:0.0, 0.0, 0.0, 0.0];

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[AmbientCompactMatchingFlowView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  sub_1000F4ED8();

  return v12;
}

- (_TtC16MusicRecognition30AmbientCompactMatchingFlowView)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition30AmbientCompactMatchingFlowView *)sub_1000F524C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition30AmbientCompactMatchingFlowView_imageView));
}

@end