@interface WKSPInterfaceSlider
- (void)setEnabled:(BOOL)a3;
- (void)setValue:(float)a3;
@end

@implementation WKSPInterfaceSlider

- (void)setValue:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WKSPInterfaceObject *)self _sendValueChanged:v4];
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKSPInterfaceObject *)self _sendValueChanged:v4 forProperty:@"enabled"];
}

@end