@interface DCNotesTextureView
- (CGSize)phase;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setPhase:(CGSize)a3;
@end

@implementation DCNotesTextureView

- (void)setImage:(id)a3
{
  v4 = (UIImage *)a3;
  id v6 = [MEMORY[0x263F1C550] colorWithPatternImage:v4];
  [(DCNotesTextureView *)self setBackgroundColor:v6];
  image = self->_image;
  self->_image = v4;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)phase
{
  objc_copyStruct(v4, &self->_phase, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPhase:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_phase, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
}

@end