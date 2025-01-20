@interface WKInterfaceSeparator
- (void)setColor:(id)a3;
@end

@implementation WKInterfaceSeparator

- (void)setColor:(id)a3
{
  id v4 = +[SPColorWrapper wrapperForColor:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"color"];
}

@end