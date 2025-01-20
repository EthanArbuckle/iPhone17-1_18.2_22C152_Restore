@interface PublisherImageView
- (_TtC18HealthExperienceUI18PublisherImageView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI18PublisherImageView)initWithFrame:(CGRect)a3;
- (_TtC18HealthExperienceUI18PublisherImageView)initWithImage:(id)a3;
- (_TtC18HealthExperienceUI18PublisherImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation PublisherImageView

- (_TtC18HealthExperienceUI18PublisherImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1AD7408D0()) {
    unint64_t v8 = sub_1AD275268(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v8 = MEMORY[0x1E4FBC870];
  }
  *(Class *)((char *)&v7->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18PublisherImageView_cancellables) = (Class)v8;

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for PublisherImageView();
  return -[PublisherImageView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI18PublisherImageView)initWithImage:(id)a3
{
  id v4 = a3;
  v5 = self;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1AD7408D0()) {
    unint64_t v6 = sub_1AD275268(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v6 = MEMORY[0x1E4FBC870];
  }
  *(Class *)((char *)&v5->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18PublisherImageView_cancellables) = (Class)v6;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for PublisherImageView();
  v7 = [(PublisherImageView *)&v9 initWithImage:v4];

  return v7;
}

- (_TtC18HealthExperienceUI18PublisherImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  if ((MEMORY[0x1E4FBC860] & 0xC000000000000000) != 0 && sub_1AD7408D0()) {
    unint64_t v9 = sub_1AD275268(MEMORY[0x1E4FBC860]);
  }
  else {
    unint64_t v9 = MEMORY[0x1E4FBC870];
  }
  *(Class *)((char *)&v8->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18PublisherImageView_cancellables) = (Class)v9;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for PublisherImageView();
  objc_super v10 = [(PublisherImageView *)&v12 initWithImage:v6 highlightedImage:v7];

  return v10;
}

- (_TtC18HealthExperienceUI18PublisherImageView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI18PublisherImageView *)PublisherImageView.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end