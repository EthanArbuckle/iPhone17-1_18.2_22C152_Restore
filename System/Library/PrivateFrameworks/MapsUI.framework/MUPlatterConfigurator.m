@interface MUPlatterConfigurator
+ (void)configureView:(id)a3;
@end

@implementation MUPlatterConfigurator

+ (void)configureView:(id)a3
{
  id v3 = a3;
  [v3 _setContinuousCornerRadius:10.0];
  id v4 = +[MUInfoCardStyle cardBackgroundColor];
  objc_msgSend(v3, "_mapsui_setBackgroundColor:", v4);
}

@end