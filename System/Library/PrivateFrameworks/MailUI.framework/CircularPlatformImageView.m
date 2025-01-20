@interface CircularPlatformImageView
- (_TtC6MailUI25CircularPlatformImageView)initWithCoder:(id)a3;
- (_TtC6MailUI25CircularPlatformImageView)initWithFrame:(CGRect)a3;
- (_TtC6MailUI25CircularPlatformImageView)initWithImage:(id)a3;
- (_TtC6MailUI25CircularPlatformImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)layoutSubviews;
@end

@implementation CircularPlatformImageView

- (void)layoutSubviews
{
  v2 = self;
  CircularPlatformImageView.layoutSubviews()();
}

- (_TtC6MailUI25CircularPlatformImageView)initWithImage:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI25CircularPlatformImageView *)CircularPlatformImageView.init(image:)(a3);
}

- (_TtC6MailUI25CircularPlatformImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  return (_TtC6MailUI25CircularPlatformImageView *)CircularPlatformImageView.init(image:highlightedImage:)(a3, a4);
}

- (_TtC6MailUI25CircularPlatformImageView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI25CircularPlatformImageView *)CircularPlatformImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI25CircularPlatformImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC6MailUI25CircularPlatformImageView *)CircularPlatformImageView.init(coder:)(a3);
}

@end