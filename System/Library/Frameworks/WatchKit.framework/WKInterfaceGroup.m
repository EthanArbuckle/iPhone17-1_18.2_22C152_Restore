@interface WKInterfaceGroup
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageData:(id)a3;
- (void)setBackgroundImageNamed:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setCornerRadius:(double)a3;
- (void)startAnimating;
- (void)startAnimatingWithImagesInRange:(_NSRange)a3 duration:(double)a4 repeatCount:(int64_t)a5;
- (void)stopAnimating;
@end

@implementation WKInterfaceGroup

- (void)setCornerRadius:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"radius"];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  v13[4] = *MEMORY[0x263EF8340];
  v12[0] = @"top";
  v7 = [NSNumber numberWithDouble:a3.top];
  v13[0] = v7;
  v12[1] = @"left";
  v8 = [NSNumber numberWithDouble:left];
  v13[1] = v8;
  v12[2] = @"bottom";
  v9 = [NSNumber numberWithDouble:bottom];
  v13[2] = v9;
  v12[3] = @"right";
  v10 = [NSNumber numberWithDouble:right];
  v13[3] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  [(WKInterfaceObject *)self _sendValueChanged:v11 forProperty:@"contentInset"];
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
  [(WKInterfaceObject *)self _setImageData:v4 forProperty:&stru_26D3103D0];
}

- (void)setBackgroundImageNamed:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _setImageNamed:v4 forProperty:&stru_26D3103D0];
}

- (void)startAnimating
{
}

- (void)startAnimatingWithImagesInRange:(_NSRange)a3 duration:(double)a4 repeatCount:(int64_t)a5
{
  NSUInteger length = a3.length;
  v14[4] = *MEMORY[0x263EF8340];
  v9 = [NSNumber numberWithUnsignedInteger:a3.location];
  v14[0] = v9;
  v10 = [NSNumber numberWithUnsignedInteger:length];
  v14[1] = v10;
  v11 = [NSNumber numberWithDouble:a4];
  v14[2] = v11;
  v12 = [NSNumber numberWithInteger:a5];
  v14[3] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  [(WKInterfaceObject *)self _sendValueChanged:v13 forProperty:@".start"];
}

- (void)stopAnimating
{
}

@end