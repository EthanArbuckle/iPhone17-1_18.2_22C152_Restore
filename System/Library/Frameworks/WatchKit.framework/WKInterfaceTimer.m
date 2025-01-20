@interface WKInterfaceTimer
- (void)setDate:(id)a3;
- (void)setTextColor:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation WKInterfaceTimer

- (void)setTextColor:(id)a3
{
  id v4 = +[SPColorWrapper wrapperForColor:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"color"];
}

- (void)setDate:(id)a3
{
}

- (void)start
{
}

- (void)stop
{
}

@end