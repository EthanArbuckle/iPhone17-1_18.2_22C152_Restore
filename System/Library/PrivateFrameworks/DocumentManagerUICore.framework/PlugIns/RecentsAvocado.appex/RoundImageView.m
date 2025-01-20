@interface RoundImageView
- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithFrame:(CGRect)a3;
- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithImage:(id)a3;
- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)layoutSubviews;
@end

@implementation RoundImageView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundImageView();
  id v2 = v5.receiver;
  [(RoundImageView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, "layer", v5.receiver, v5.super_class);
  [v3 setMasksToBounds:1];

  id v4 = [v2 layer];
  [v2 bounds];
  [v4 setCornerRadius:CGRectGetHeight(v6) * 0.5];
}

- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundImageView();
  return [(RoundImageView *)&v5 initWithImage:a3];
}

- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RoundImageView();
  return [(RoundImageView *)&v7 initWithImage:a3 highlightedImage:a4];
}

- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundImageView();
  return -[RoundImageView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC14RecentsAvocadoP33_97C545F5D78513C51AD2ED5443DD77FF14RoundImageView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundImageView();
  return [(RoundImageView *)&v5 initWithCoder:a3];
}

@end