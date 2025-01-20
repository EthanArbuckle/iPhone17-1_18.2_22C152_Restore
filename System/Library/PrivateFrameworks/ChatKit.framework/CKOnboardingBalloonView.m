@interface CKOnboardingBalloonView
- (UIImage)largeBalloonImage;
- (void)prepareForDisplay;
- (void)setLargeBalloonImage:(id)a3;
@end

@implementation CKOnboardingBalloonView

- (void)prepareForDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)CKOnboardingBalloonView;
  [(CKTextBalloonView *)&v4 prepareForDisplay];
  v3 = [(CKOnboardingBalloonView *)self largeBalloonImage];
  [(CKBalloonImageView *)self setImage:v3];
}

- (UIImage)largeBalloonImage
{
  return self->_largeBalloonImage;
}

- (void)setLargeBalloonImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end