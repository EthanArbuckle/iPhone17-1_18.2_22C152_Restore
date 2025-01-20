@interface PHCarPlayNumberPadButton
+ (BOOL)isCarPlay;
+ (double)highlightedCircleViewAlpha;
+ (double)horizontalPadding;
+ (double)outerCircleDiameter;
+ (double)unhighlightedCircleViewAlpha;
+ (double)verticalPadding;
- (BOOL)canBecomeFocused;
- (id)buttonColor;
- (id)highlightedButtonColor;
@end

@implementation PHCarPlayNumberPadButton

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)buttonColor
{
  if ([(PHCarPlayNumberPadButton *)self isFocused])
  {
    v2 = +[UIColor dynamicCarFocusedColor];
  }
  else
  {
    if ([(id)objc_opt_class() currentStyle] == (id)2) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    +[TPNumberPadDynamicButton unhighlightedCircleViewAlpha];
    v2 = +[UIColor colorWithWhite:v3 alpha:v4];
  }

  return v2;
}

- (id)highlightedButtonColor
{
  if ([(PHCarPlayNumberPadButton *)self isFocused])
  {
    v2 = +[UIColor dynamicCarFocusedColor];
  }
  else
  {
    if ([(id)objc_opt_class() currentStyle] == (id)2) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
    +[TPNumberPadDynamicButton highlightedCircleViewAlpha];
    v2 = +[UIColor colorWithWhite:v3 alpha:v4];
  }

  return v2;
}

+ (double)unhighlightedCircleViewAlpha
{
  return 1.0;
}

+ (double)highlightedCircleViewAlpha
{
  return 1.0;
}

+ (double)outerCircleDiameter
{
  return 40.0;
}

+ (double)verticalPadding
{
  return 3.0;
}

+ (double)horizontalPadding
{
  return 6.0;
}

+ (BOOL)isCarPlay
{
  return 1;
}

@end