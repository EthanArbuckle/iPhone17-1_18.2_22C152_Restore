@interface WKInterfaceSwitch
- (void)setAttributedTitle:(id)a3;
- (void)setColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setOn:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation WKInterfaceSwitch

- (void)setTitle:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"title"];
}

- (void)setAttributedTitle:(id)a3
{
  _WKValidatedAttributedString(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"title"];
}

- (void)setOn:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
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

@end