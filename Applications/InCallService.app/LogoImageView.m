@interface LogoImageView
- (_TtC13InCallService13LogoImageView)initWithCoder:(id)a3;
- (_TtC13InCallService13LogoImageView)initWithFrame:(CGRect)a3;
- (_TtC13InCallService13LogoImageView)initWithImage:(id)a3;
- (_TtC13InCallService13LogoImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (_TtC13InCallService13LogoImageView)initWithImage:(id)a3 style:(int64_t)a4;
- (void)layoutSubviews;
@end

@implementation LogoImageView

- (_TtC13InCallService13LogoImageView)initWithImage:(id)a3 style:(int64_t)a4
{
  return (_TtC13InCallService13LogoImageView *)sub_1001D0028(a3, a4);
}

- (_TtC13InCallService13LogoImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D00F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001D0180();
}

- (_TtC13InCallService13LogoImageView)initWithImage:(id)a3
{
  id v3 = a3;
  sub_1001D0294();
}

- (_TtC13InCallService13LogoImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1001D02D8();
}

- (_TtC13InCallService13LogoImageView)initWithFrame:(CGRect)a3
{
}

@end