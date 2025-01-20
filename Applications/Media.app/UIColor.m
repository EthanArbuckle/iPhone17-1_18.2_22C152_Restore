@interface UIColor
+ (id)radio_carSystemFocusColor;
+ (id)radio_carSystemFocusLabelColor;
+ (id)radio_carSystemFocusSecondaryColor;
+ (id)radio_carSystemSecondaryColor;
@end

@implementation UIColor

+ (id)radio_carSystemFocusColor
{
  return _[a1 _carSystemFocusColor];
}

+ (id)radio_carSystemFocusLabelColor
{
  return _[a1 _carSystemFocusLabelColor];
}

+ (id)radio_carSystemSecondaryColor
{
  return _[a1 _carSystemSecondaryColor];
}

+ (id)radio_carSystemFocusSecondaryColor
{
  return _[a1 _carSystemFocusSecondaryColor];
}

@end