@interface IFConcreteImage
- (BOOL)placeholder;
- (CGImage)CGImage;
- (CGImage)_CGImage;
- (CGSize)iconSize;
- (CGSize)minimumSize;
- (CGSize)size;
- (IFConcreteImage)initWithCGImage:(CGImage *)a3 scale:(double)a4;
- (double)scale;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)validationFlags;
- (void)dealloc;
- (void)setIconSize:(CGSize)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)setPlaceholder:(BOOL)a3;
- (void)setValidationFlags:(unint64_t)a3;
@end

@implementation IFConcreteImage

- (BOOL)placeholder
{
  return self->_validationFlags & 1;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_validationFlags = self->_validationFlags & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (void)dealloc
{
  CGImage = self->_CGImage;
  if (CGImage) {
    CFRelease(CGImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)IFConcreteImage;
  [(IFConcreteImage *)&v4 dealloc];
}

- (CGSize)iconSize
{
  objc_copyStruct(v4, &self->_iconSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)minimumSize
{
  objc_copyStruct(v4, &self->_minimumSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGImage)CGImage
{
  double v3 = +[IFImage escapingCGImageWithCGImage:self->_CGImage];
  CGImage = self->_CGImage;
  if (v3 != CGImage)
  {
    CFAutorelease(CGImage);
    CFRetain(v3);
    self->_CGImage = v3;
  }
  return v3;
}

- (void)setMinimumSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_minimumSize, &v3, 16, 1, 0);
}

- (void)setIconSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_iconSize, &v3, 16, 1, 0);
}

- (IFConcreteImage)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  v14.receiver = self;
  v14.super_class = (Class)IFConcreteImage;
  v6 = [(IFImage *)&v14 _init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v8 = (CGImage *)CFRetain(a3);
      v7->_CGImage = v8;
      CGFloat v9 = (double)CGImageGetWidth(v8) / a4;
      size_t Height = CGImageGetHeight(v7->_CGImage);
      v7->_size.width = v9;
      v7->_size.height = (double)Height / a4;
      v7->_scale = a4;
      v7->_minimumSize = (CGSize)*MEMORY[0x1E4F1DB30];
      v7->_placeholder = 0;
      v7->_validationFlags = 0;
      CGFloat v11 = (double)CGImageGetWidth(a3) / a4;
      size_t v12 = CGImageGetHeight(a3);
      v7->_iconSize.width = v11;
      v7->_iconSize.height = (double)v12 / a4;
    }
    else
    {
      v6->_iconSize = (CGSize)*MEMORY[0x1E4F1DB30];
    }
  }
  return v7;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)IFConcreteImage;
  return [(IFImage *)&v3 _init];
}

- (CGImage)_CGImage
{
  return self->_CGImage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init((Class)objc_opt_class());
  if ([(IFConcreteImage *)self CGImage])
  {
    v5 = [(IFConcreteImage *)self CGImage];
    v4[5] = v5;
    CFRetain(v5);
  }
  [(IFConcreteImage *)self size];
  v4[8] = v6;
  v4[9] = v7;
  [(IFConcreteImage *)self scale];
  v4[6] = v8;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<IFImage 0x%lx>  CGImage: %@", self, self->_CGImage];
}

- (unint64_t)validationFlags
{
  return self->_validationFlags;
}

- (void)setValidationFlags:(unint64_t)a3
{
  self->_validationFlags = a3;
}

@end