@interface _CDComplicationImageViewProviderImageView
- (CGSize)maxSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)setMaxSize:(CGSize)a3;
- (void)sizeToFit;
@end

@implementation _CDComplicationImageViewProviderImageView

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(_CDComplicationImageViewProviderImageView *)self image];
  [v3 size];

  v4 = [MEMORY[0x263EFD1F0] sharedRenderingContext];
  v5 = [v4 device];

  CLKFloorForDevice();
  double v7 = v6;
  CLKFloorForDevice();
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)sizeToFit
{
  v3 = [MEMORY[0x263EFD1F0] sharedRenderingContext];
  v4 = [v3 device];

  [(_CDComplicationImageViewProviderImageView *)self transform];
  if (CGAffineTransformIsIdentity(&v9))
  {
    [(_CDComplicationImageViewProviderImageView *)self frame];
    -[_CDComplicationImageViewProviderImageView sizeThatFits:](self, "sizeThatFits:", v5, v6);
    CLKPixelAlignRectForDevice();
    -[_CDComplicationImageViewProviderImageView setFrame:](self, "setFrame:");
  }
  else
  {
    [(_CDComplicationImageViewProviderImageView *)self bounds];
    -[_CDComplicationImageViewProviderImageView sizeThatFits:](self, "sizeThatFits:", v7, v8);
    CLKPixelAlignRectForDevice();
    -[_CDComplicationImageViewProviderImageView setBounds:](self, "setBounds:");
  }
}

- (CGSize)maxSize
{
  double width = self->_maxSize.width;
  double height = self->_maxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

@end