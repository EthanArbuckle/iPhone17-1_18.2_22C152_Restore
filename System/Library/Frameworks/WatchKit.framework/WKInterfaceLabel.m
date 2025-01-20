@interface WKInterfaceLabel
- (void)setAttributedText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation WKInterfaceLabel

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _sendValueChanged:v4];
}

- (void)setTextColor:(id)a3
{
  id v4 = +[SPColorWrapper wrapperForColor:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"color"];
}

- (void)setAttributedText:(id)a3
{
  _WKValidatedAttributedString(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WKInterfaceObject *)self _sendValueChanged:v4];
}

@end