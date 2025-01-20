@interface CLBContentBackgroundView
- (CLBContentBackgroundView)initWithCoder:(id)a3;
- (CLBContentBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation CLBContentBackgroundView

- (CLBContentBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ContentBackgroundView();
  v7 = -[CLBContentBackgroundView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_100063CF0();
  v8 = v7;
  v9 = (void *)static UIColor.clarityUIContentBackground.getter();
  [(CLBContentBackgroundView *)v8 setBackgroundColor:v9];

  return v8;
}

- (CLBContentBackgroundView)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ContentBackgroundView();
  id v4 = a3;
  v5 = [(CLBContentBackgroundView *)&v9 initWithCoder:v4];
  if (v5)
  {
    sub_100063CF0();
    v6 = v5;
    uint64_t v7 = static UIColor.clarityUIContentBackground.getter();
    -[CLBContentBackgroundView setBackgroundColor:](v6, "setBackgroundColor:", v7, v9.receiver, v9.super_class);

    id v4 = (id)v7;
  }

  return v5;
}

@end