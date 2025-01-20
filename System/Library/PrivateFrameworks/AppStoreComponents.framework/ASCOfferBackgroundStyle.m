@interface ASCOfferBackgroundStyle
+ (id)defaultStyle;
+ (id)fixedCornerRadiusStyle:(double)a3;
- (ASCOfferBackgroundStyle)init;
- (double)cornerRadiusForImageSize:(CGSize)a3 stretchableArea:(double)a4;
- (id)_init;
@end

@implementation ASCOfferBackgroundStyle

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCOfferBackgroundStyle;
  return [(ASCOfferBackgroundStyle *)&v3 init];
}

- (ASCOfferBackgroundStyle)init
{
  return 0;
}

- (double)cornerRadiusForImageSize:(CGSize)a3 stretchableArea:(double)a4
{
  return 0.0;
}

+ (id)defaultStyle
{
  v2 = objc_alloc_init(ASCDefaultOfferBackgroundStyle);

  return v2;
}

+ (id)fixedCornerRadiusStyle:(double)a3
{
  objc_super v3 = [[ASCFixedCornerRadiusOfferBackgroundStyle alloc] initWithCornerRadius:a3];

  return v3;
}

@end