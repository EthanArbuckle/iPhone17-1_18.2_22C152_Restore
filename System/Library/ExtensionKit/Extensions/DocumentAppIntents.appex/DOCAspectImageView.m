@interface DOCAspectImageView
- (UIImage)image;
- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithFrame:(CGRect)a3;
- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithImage:(id)a3;
- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
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
  sub_100428CB4();
}

- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithImage:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView_aspectConstraint) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCAspectImageView();
  id v4 = a3;
  id v5 = [(DOCAspectImageView *)&v7 initWithImage:v4];
  sub_100428CB4();

  return v5;
}

- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView_aspectConstraint) = 0;
  id v4 = a3;

  result = (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_4B4B60590F5E6428796A006052D5B07C18DOCAspectImageView_aspectConstraint));
}

@end