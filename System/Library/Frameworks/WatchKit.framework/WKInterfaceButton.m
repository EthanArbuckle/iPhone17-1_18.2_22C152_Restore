@interface WKInterfaceButton
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageData:(id)a3;
- (void)setBackgroundImageNamed:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation WKInterfaceButton

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

- (void)setBackgroundColor:(id)a3
{
  id v4 = +[SPColorWrapper wrapperForColor:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"color"];
}

- (void)setBackgroundImage:(id)a3
{
}

- (void)setBackgroundImageData:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _setImageData:v4 forProperty:@"image"];
}

- (void)setBackgroundImageNamed:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _setImageNamed:v4 forProperty:@"image"];
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"enabled"];
}

@end