@interface CDRichComplicationCornerTextOnlyView
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationCornerTextOnlyView

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v4 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v4 transitionToMonochromeWithFraction:2 style:a3];
}

- (void)updateMonochromeColor
{
  id v2 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v2 updateMonochromeColorWithStyle:2];
}

@end