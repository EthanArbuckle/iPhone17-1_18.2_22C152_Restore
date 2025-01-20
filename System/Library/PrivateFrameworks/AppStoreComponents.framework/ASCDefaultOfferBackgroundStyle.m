@interface ASCDefaultOfferBackgroundStyle
- (ASCDefaultOfferBackgroundStyle)init;
- (BOOL)isEqual:(id)a3;
- (double)cornerRadiusForImageSize:(CGSize)a3 stretchableArea:(double)a4;
- (unint64_t)hash;
@end

@implementation ASCDefaultOfferBackgroundStyle

- (ASCDefaultOfferBackgroundStyle)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASCDefaultOfferBackgroundStyle;
  return (ASCDefaultOfferBackgroundStyle *)[(ASCOfferBackgroundStyle *)&v3 _init];
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (double)cornerRadiusForImageSize:(CGSize)a3 stretchableArea:(double)a4
{
  return floor((a3.height - a4) * 0.5);
}

@end