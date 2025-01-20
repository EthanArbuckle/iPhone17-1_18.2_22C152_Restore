@interface HUGridFlowLayoutCellAttributes
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedWallpaperRect;
- (HUBackgroundEffectViewGrouping)backgroundEffectViewGrouper;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundEffectViewGrouper:(id)a3;
- (void)setNormalizedWallpaperRect:(CGRect)a3;
@end

@implementation HUGridFlowLayoutCellAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUGridFlowLayoutCellAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v7 copyWithZone:a3];
  [(HUGridFlowLayoutCellAttributes *)self normalizedWallpaperRect];
  objc_msgSend(v4, "setNormalizedWallpaperRect:");
  v5 = [(HUGridFlowLayoutCellAttributes *)self backgroundEffectViewGrouper];
  [v4 setBackgroundEffectViewGrouper:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HUGridFlowLayoutCellAttributes *)a3;
  if (v4 == self)
  {
    BOOL v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(HUGridFlowLayoutCellAttributes *)self normalizedWallpaperRect];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(HUGridFlowLayoutCellAttributes *)v5 normalizedWallpaperRect];
      v28.origin.x = v14;
      v28.origin.y = v15;
      v28.size.width = v16;
      v28.size.height = v17;
      v27.origin.x = v7;
      v27.origin.y = v9;
      v27.size.width = v11;
      v27.size.height = v13;
      if (CGRectEqualToRect(v27, v28))
      {
        v18 = [(HUGridFlowLayoutCellAttributes *)self backgroundEffectViewGrouper];
        uint64_t v19 = [(HUGridFlowLayoutCellAttributes *)v5 backgroundEffectViewGrouper];
        if (v18 == (void *)v19)
        {
        }
        else
        {
          v20 = (void *)v19;
          v21 = [(HUGridFlowLayoutCellAttributes *)self backgroundEffectViewGrouper];
          v22 = [(HUGridFlowLayoutCellAttributes *)v5 backgroundEffectViewGrouper];
          int v23 = [v21 isEqual:v22];

          if (!v23) {
            goto LABEL_6;
          }
        }
        v26.receiver = self;
        v26.super_class = (Class)HUGridFlowLayoutCellAttributes;
        BOOL v24 = [(UICollectionViewLayoutAttributes *)&v26 isEqual:v5];
        goto LABEL_11;
      }
LABEL_6:
      BOOL v24 = 0;
LABEL_11:

      goto LABEL_12;
    }
    BOOL v24 = 0;
  }
LABEL_12:

  return v24;
}

- (CGRect)normalizedWallpaperRect
{
  double x = self->_normalizedWallpaperRect.origin.x;
  double y = self->_normalizedWallpaperRect.origin.y;
  double width = self->_normalizedWallpaperRect.size.width;
  double height = self->_normalizedWallpaperRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedWallpaperRect:(CGRect)a3
{
  self->_normalizedWallpaperRect = a3;
}

- (HUBackgroundEffectViewGrouping)backgroundEffectViewGrouper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundEffectViewGrouper);

  return (HUBackgroundEffectViewGrouping *)WeakRetained;
}

- (void)setBackgroundEffectViewGrouper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end