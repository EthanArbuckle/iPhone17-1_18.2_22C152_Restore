@interface ICDocCamThumbnailViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)renderBorder;
- (BOOL)renderShadow;
- (double)imageHeight;
- (double)imageWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setImageHeight:(double)a3;
- (void)setImageWidth:(double)a3;
- (void)setRenderBorder:(BOOL)a3;
- (void)setRenderShadow:(BOOL)a3;
@end

@implementation ICDocCamThumbnailViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICDocCamThumbnailViewLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [(ICDocCamThumbnailViewLayoutAttributes *)self imageWidth];
  objc_msgSend(v4, "setImageWidth:");
  [(ICDocCamThumbnailViewLayoutAttributes *)self imageHeight];
  objc_msgSend(v4, "setImageHeight:");
  objc_msgSend(v4, "setRenderShadow:", -[ICDocCamThumbnailViewLayoutAttributes renderShadow](self, "renderShadow"));
  objc_msgSend(v4, "setRenderBorder:", -[ICDocCamThumbnailViewLayoutAttributes renderBorder](self, "renderBorder"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [(ICDocCamThumbnailViewLayoutAttributes *)self imageWidth];
  double v6 = v5;
  [v4 imageWidth];
  if (v6 == v7
    && ([(ICDocCamThumbnailViewLayoutAttributes *)self imageHeight],
        double v9 = v8,
        [v4 imageHeight],
        v9 == v10)
    && (int v11 = [(ICDocCamThumbnailViewLayoutAttributes *)self renderShadow],
        v11 == [v4 renderShadow])
    && (int v12 = [(ICDocCamThumbnailViewLayoutAttributes *)self renderBorder],
        v12 == [v4 renderBorder]))
  {
    v15.receiver = self;
    v15.super_class = (Class)ICDocCamThumbnailViewLayoutAttributes;
    BOOL v13 = [(UICollectionViewLayoutAttributes *)&v15 isEqual:v4];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (BOOL)renderShadow
{
  return self->_renderShadow;
}

- (void)setRenderShadow:(BOOL)a3
{
  self->_renderShadow = a3;
}

- (BOOL)renderBorder
{
  return self->_renderBorder;
}

- (void)setRenderBorder:(BOOL)a3
{
  self->_renderBorder = a3;
}

@end