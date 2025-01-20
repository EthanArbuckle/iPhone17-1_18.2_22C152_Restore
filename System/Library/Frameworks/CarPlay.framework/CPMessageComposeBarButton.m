@interface CPMessageComposeBarButton
- (CPMessageComposeBarButton)init;
- (CPMessageComposeBarButton)initWithImage:(UIImage *)image;
@end

@implementation CPMessageComposeBarButton

- (CPMessageComposeBarButton)init
{
  return [(CPMessageComposeBarButton *)self initWithImage:0];
}

- (CPMessageComposeBarButton)initWithImage:(UIImage *)image
{
  v4.receiver = self;
  v4.super_class = (Class)CPMessageComposeBarButton;
  return [(CPBarButton *)&v4 initWithImage:image handler:0];
}

@end