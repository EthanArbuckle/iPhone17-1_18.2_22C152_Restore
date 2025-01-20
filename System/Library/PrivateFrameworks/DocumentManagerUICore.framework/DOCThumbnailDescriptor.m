@interface DOCThumbnailDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)isFolded;
- (BOOL)isInteractive;
- (CGSize)size;
- (DOCThumbnailDescriptor)initWithScale:(double)a3 style:(unint64_t)a4 isFolded:(BOOL)a5 isInteractive:(BOOL)a6 isFolder:(BOOL)a7;
- (DOCThumbnailDescriptor)initWithSize:(CGSize)a3 minimumSize:(double)a4 scale:(double)a5 style:(unint64_t)a6 isFolded:(BOOL)a7 isInteractive:(BOOL)a8 isFolder:(BOOL)a9;
- (DOCThumbnailDescriptor)initWithSize:(CGSize)a3 scale:(double)a4 style:(unint64_t)a5 isFolded:(BOOL)a6 isInteractive:(BOOL)a7 isFolder:(BOOL)a8;
- (double)minimumSize;
- (double)scale;
- (id)description;
- (unint64_t)hash;
- (unint64_t)style;
@end

@implementation DOCThumbnailDescriptor

- (unint64_t)hash
{
  double v2 = (double)(31
              * (unint64_t)(self->_minimumSize
                                 + (double)(31
                                          * (unint64_t)(self->_size.height
                                                             + (double)(31 * (unint64_t)self->_size.width)))))
     + self->_scale * 100.0;
  unint64_t v3 = 100 * self->_style - (unint64_t)v2 + 32 * (unint64_t)v2;
  return 100 * self->_interactive - v3 + 32 * v3;
}

- (unint64_t)style
{
  return self->_style;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)isFolded
{
  return self->_folded;
}

- (double)minimumSize
{
  return self->_minimumSize;
}

- (DOCThumbnailDescriptor)initWithSize:(CGSize)a3 minimumSize:(double)a4 scale:(double)a5 style:(unint64_t)a6 isFolded:(BOOL)a7 isInteractive:(BOOL)a8 isFolder:(BOOL)a9
{
  BOOL v9 = a9;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v19.receiver = self;
  v19.super_class = (Class)DOCThumbnailDescriptor;
  CGSize result = [(DOCThumbnailDescriptor *)&v19 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_minimumSize = a4;
    result->_scale = a5;
    result->_folded = a7;
    result->_interactive = a8;
    if (v9) {
      unint64_t v18 = a6;
    }
    else {
      unint64_t v18 = 1;
    }
    result->_style = v18;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DOCThumbnailDescriptor *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && (self->_size.width == v4->_size.width ? (BOOL v5 = self->_size.height == v4->_size.height) : (BOOL v5 = 0),
          v5
       && self->_minimumSize == v4->_minimumSize
       && self->_scale == v4->_scale
       && self->_style == v4->_style
       && self->_folded == v4->_folded)
      && self->_interactive == v4->_interactive;
  }

  return v6;
}

- (DOCThumbnailDescriptor)initWithSize:(CGSize)a3 scale:(double)a4 style:(unint64_t)a5 isFolded:(BOOL)a6 isInteractive:(BOOL)a7 isFolder:(BOOL)a8
{
  return -[DOCThumbnailDescriptor initWithSize:minimumSize:scale:style:isFolded:isInteractive:isFolder:](self, "initWithSize:minimumSize:scale:style:isFolded:isInteractive:isFolder:", a5, a6, a7, a8, a3.width, a3.height, 0.0, a4);
}

- (DOCThumbnailDescriptor)initWithScale:(double)a3 style:(unint64_t)a4 isFolded:(BOOL)a5 isInteractive:(BOOL)a6 isFolder:(BOOL)a7
{
  return -[DOCThumbnailDescriptor initWithSize:scale:style:isFolded:isInteractive:isFolder:](self, "initWithSize:scale:style:isFolded:isInteractive:isFolder:", a4, a5, a6, a7, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), a3);
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DOCThumbnailDescriptor;
  v4 = [(DOCThumbnailDescriptor *)&v8 description];
  BOOL v5 = NSStringFromCGSize(self->_size);
  BOOL v6 = [v3 stringWithFormat:@"%@ size=%@, minimumSize=%f, scale=%f, style=%lu, folded=%d, interactive=%d", v4, v5, *(void *)&self->_minimumSize, *(void *)&self->_scale, self->_style, self->_folded, self->_interactive];

  return v6;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

@end