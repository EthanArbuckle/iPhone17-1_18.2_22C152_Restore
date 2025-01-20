@interface WKSPInterfaceButton
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageData:(id)a3;
- (void)setBackgroundImageNamed:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation WKSPInterfaceButton

- (void)setTitle:(id)a3
{
}

- (void)setAttributedTitle:(id)a3
{
}

- (void)setBackgroundImage:(id)a3
{
}

- (void)setBackgroundImageData:(id)a3
{
}

- (void)setBackgroundImageNamed:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(WKSPInterfaceObject *)self _sendValueChanged:v4];
}

@end