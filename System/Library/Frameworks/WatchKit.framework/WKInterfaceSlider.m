@interface WKInterfaceSlider
- (void)setColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setNumberOfSteps:(int64_t)a3;
- (void)setValue:(float)a3;
@end

@implementation WKInterfaceSlider

- (void)setValue:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"#value"];
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"enabled"];
}

- (void)setColor:(id)a3
{
  id v4 = +[SPColorWrapper wrapperForColor:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"color"];
}

- (void)setNumberOfSteps:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"steps"];
}

@end