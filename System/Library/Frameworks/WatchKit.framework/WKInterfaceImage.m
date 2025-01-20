@interface WKInterfaceImage
- (void)setImage:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageNamed:(id)a3;
- (void)setTintColor:(id)a3;
- (void)startAnimating;
- (void)startAnimatingWithImagesInRange:(_NSRange)a3 duration:(double)a4 repeatCount:(int64_t)a5;
- (void)stopAnimating;
@end

@implementation WKInterfaceImage

- (void)setImage:(id)a3
{
}

- (void)setImageData:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _setImageData:v4 forProperty:&stru_26D3103D0];
}

- (void)setImageNamed:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WKInterfaceObject *)self _setImageNamed:v4 forProperty:&stru_26D3103D0];
}

- (void)setTintColor:(id)a3
{
  id v4 = +[SPColorWrapper wrapperForColor:a3];
  [(WKInterfaceObject *)self _sendValueChanged:v4 forProperty:@"tintColor"];
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