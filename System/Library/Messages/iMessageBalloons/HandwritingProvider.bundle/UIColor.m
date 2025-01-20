@interface UIColor
+ (UIColor)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (id)DKNamedColor:(id)a3;
+ (id)advancePageButtonEnabledColor;
+ (id)cellHighlightColor;
+ (id)colorPickerLabelColor;
+ (id)disabledButtonColor;
+ (id)drawingCanvasBackgroundColor;
+ (id)enabledButtonColor;
+ (id)favoritesGlobeButtonTintColor;
+ (id)favoritesLabelColor;
+ (id)favoritesPickerBackgroundColor;
+ (id)favoritesPickerBorderColor;
+ (id)favoritesPickerItemSelectedBackgroundColor;
+ (id)forcedInkColor:(BOOL)a3;
+ (id)handwritingBrowserBackgroundColor;
+ (id)inkColor;
+ (id)keyboardButtonTintColor;
+ (id)previewBubbleBorderColor;
@end

@implementation UIColor

+ (id)DKNamedColor:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle hw_handwritingPluginBundle];
  v5 = +[UIColor colorNamed:v3 inBundle:v4 compatibleWithTraitCollection:0];

  return v5;
}

+ (id)favoritesPickerBackgroundColor
{
  return [a1 DKNamedColor:@"favoritesPickerBackgroundColor"];
}

+ (id)favoritesPickerBorderColor
{
  return [a1 DKNamedColor:@"favoritesPickerBorderColor"];
}

+ (id)favoritesPickerItemSelectedBackgroundColor
{
  return [a1 DKNamedColor:@"favoritesPickerItemSelectedBackgroundColor"];
}

+ (id)favoritesGlobeButtonTintColor
{
  return [a1 DKNamedColor:@"favoritesGlobeButtonTintColor"];
}

+ (id)favoritesLabelColor
{
  return [a1 DKNamedColor:@"favoritesLabelColor"];
}

+ (id)drawingCanvasBackgroundColor
{
  return [a1 DKNamedColor:@"drawingCanvasBackgroundColor"];
}

+ (id)handwritingBrowserBackgroundColor
{
  return [a1 DKNamedColor:@"handwritingBrowserBackgroundColor"];
}

+ (id)disabledButtonColor
{
  return +[UIColor colorWithCalibratedRed:0.898039216 green:0.898039216 blue:0.917647059 alpha:1.0];
}

+ (id)enabledButtonColor
{
  return +[UIColor systemBlueColor];
}

+ (id)keyboardButtonTintColor
{
  return +[UIColor colorWithCalibratedRed:0.439215686 green:0.470588235 blue:0.537254902 alpha:1.0];
}

+ (id)colorPickerLabelColor
{
  return [a1 DKNamedColor:@"colorPickerLabelColor"];
}

+ (id)previewBubbleBorderColor
{
  return [a1 DKNamedColor:@"previewBubbleBorderColor"];
}

+ (id)cellHighlightColor
{
  return [a1 DKNamedColor:@"cellHighlightColor"];
}

+ (id)inkColor
{
  return [a1 DKNamedColor:@"inkColor"];
}

+ (id)forcedInkColor:(BOOL)a3
{
  return [a1 DKNamedColor:@"inkColor"];
}

+ (id)advancePageButtonEnabledColor
{
  return [a1 DKNamedColor:@"advancePageButtonEnabledColor"];
}

+ (UIColor)colorWithCalibratedRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return +[UIColor colorWithRed:a3 green:a4 blue:a5 alpha:a6];
}

@end