@interface ASCOfferButtonBackgroundImageView
- (BOOL)isBackgroundForText;
- (void)setIsBackgroundForText:(BOOL)a3;
@end

@implementation ASCOfferButtonBackgroundImageView

- (BOOL)isBackgroundForText
{
  return self->_isBackgroundForText;
}

- (void)setIsBackgroundForText:(BOOL)a3
{
  self->_isBackgroundForText = a3;
}

@end