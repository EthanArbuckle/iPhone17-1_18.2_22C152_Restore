@interface AVTStickerGeneratorPosterOptions
- (AVTStickerGeneratorPosterOptions)init;
- (BOOL)growsForExtraTallContent;
- (CGSize)size;
- (double)minimumHorizontalMargin;
- (double)scaleFactor;
- (void)setGrowsForExtraTallContent:(BOOL)a3;
- (void)setMinimumHorizontalMargin:(double)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation AVTStickerGeneratorPosterOptions

- (AVTStickerGeneratorPosterOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVTStickerGeneratorPosterOptions;
  result = [(AVTStickerGeneratorPosterOptions *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_minimumHorizontalMargin = xmmword_20B88FF00;
    result->_size = (CGSize)vdupq_n_s64(0x4061800000000000uLL);
    result->_growsForExtraTallContent = 1;
  }
  return result;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)minimumHorizontalMargin
{
  return self->_minimumHorizontalMargin;
}

- (void)setMinimumHorizontalMargin:(double)a3
{
  self->_minimumHorizontalMargin = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

- (BOOL)growsForExtraTallContent
{
  return self->_growsForExtraTallContent;
}

- (void)setGrowsForExtraTallContent:(BOOL)a3
{
  self->_growsForExtraTallContent = a3;
}

@end