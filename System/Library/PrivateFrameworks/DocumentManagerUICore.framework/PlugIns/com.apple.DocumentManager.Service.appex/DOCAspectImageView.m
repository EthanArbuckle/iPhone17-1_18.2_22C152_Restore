@interface DOCAspectImageView
- (UIImage)image;
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithFrame:(CGRect)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithImage:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)setImage:(id)a3;
@end

@implementation DOCAspectImageView

- (UIImage)image
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCAspectImageView();
  v2 = [(DOCAspectImageView *)&v4 image];
  return v2;
}

- (void)setImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCAspectImageView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCAspectImageView *)&v6 setImage:v4];
  sub_100386310();
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithImage:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView_aspectConstraint) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCAspectImageView();
  id v4 = a3;
  id v5 = [(DOCAspectImageView *)&v7 initWithImage:v4];
  sub_100386310();

  return v5;
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView_aspectConstraint) = 0;
  id v4 = a3;

  result = (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_FF8FEF0715E7699D7C3880DD173B58EB18DOCAspectImageView_aspectConstraint));
}

@end