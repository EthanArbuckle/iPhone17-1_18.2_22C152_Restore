@interface CUIRenditionMetrics
- (BOOL)hasAlignmentEdgeMargins;
- (BOOL)hasOpaqueContentBounds;
- (BOOL)scalesHorizontally;
- (BOOL)scalesVertically;
- (CGRect)contentRect;
- (CGRect)edgeRect;
- (CGRect)insetContentRectWithMetrics:(CGRect)a3;
- (CGRect)insetRectWithMetrics:(CGRect)a3;
- (CGSize)auxiliary1BottomLeftMargin;
- (CGSize)auxiliary1TopRightMargin;
- (CGSize)auxiliary2BottomLeftMargin;
- (CGSize)auxiliary2TopRightMargin;
- (CGSize)contentBottomLeftMargin;
- (CGSize)contentTopRightMargin;
- (CGSize)defaultImageSize;
- (CGSize)edgeBottomLeftMargin;
- (CGSize)edgeTopRightMargin;
- (CGSize)imageSize;
- (double)baseline;
- (double)initwithImageSize:(double)a3 scale:(double)a4;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithImageSize:(int)a3 defaultImageSize:(double)a4 edgeBottomLeft:(double)a5 edgeTopRight:(double)a6 contentBottomLeft:(double)a7 contentTopRight:(double)a8 baseline:(double)a9 auxiliary1BottomLeft:(double)a10 auxiliary1TopRight:(double)a11 auxiliary2BottomLeft:(uint64_t)a12 auxiliary2TopRight:(uint64_t)a13 scalesVertically:(uint64_t)a14 scalesHorizontally:(uint64_t)a15 scale:(uint64_t)a16;
- (id)metricsByMirroringHorizontally;
@end

@implementation CUIRenditionMetrics

- (BOOL)hasAlignmentEdgeMargins
{
  BOOL v2 = self->_edgeBottomLeftMargin.height != 0.0 || self->_edgeTopRightMargin.height != 0.0;
  if (self->_edgeBottomLeftMargin.width != 0.0) {
    return 1;
  }
  if (self->_edgeTopRightMargin.width == 0.0) {
    return v2;
  }
  return 1;
}

- (id)initWithImageSize:(int)a3 defaultImageSize:(double)a4 edgeBottomLeft:(double)a5 edgeTopRight:(double)a6 contentBottomLeft:(double)a7 contentTopRight:(double)a8 baseline:(double)a9 auxiliary1BottomLeft:(double)a10 auxiliary1TopRight:(double)a11 auxiliary2BottomLeft:(uint64_t)a12 auxiliary2TopRight:(uint64_t)a13 scalesVertically:(uint64_t)a14 scalesHorizontally:(uint64_t)a15 scale:(uint64_t)a16
{
  if (result)
  {
    v42.receiver = result;
    v42.super_class = (Class)CUIRenditionMetrics;
    result = objc_msgSendSuper2(&v42, sel_init);
    if (result)
    {
      *((double *)result + 1) = a4;
      *((double *)result + 2) = a5;
      *((double *)result + 3) = a6;
      *((double *)result + 4) = a7;
      *((double *)result + 5) = a8;
      *((double *)result + 6) = a9;
      *((double *)result + 7) = a10;
      *((double *)result + 8) = a11;
      *((void *)result + 9) = a17;
      *((void *)result + 10) = a18;
      *((void *)result + 11) = a19;
      *((void *)result + 12) = a20;
      *((void *)result + 13) = a21;
      *((void *)result + 14) = a22;
      *((void *)result + 15) = a23;
      *((void *)result + 16) = a24;
      *((void *)result + 17) = a25;
      *((void *)result + 18) = a26;
      *((void *)result + 19) = a27;
      *((void *)result + 20) = a28;
      __int16 v40 = *((_WORD *)result + 92) & 0xFFFC;
      *((void *)result + 21) = a29;
      *((void *)result + 22) = a30;
      if (a3) {
        __int16 v41 = 2;
      }
      else {
        __int16 v41 = 0;
      }
      *((_WORD *)result + 92) = v41 | a2 | v40;
    }
  }
  return result;
}

- (double)initwithImageSize:(double)a3 scale:(double)a4
{
  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)CUIRenditionMetrics;
    result = (double *)objc_msgSendSuper2(&v7, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
      result[3] = a2;
      result[4] = a3;
      result[22] = a4;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  *(CGSize *)((char *)result + 8) = self->_imageSize;
  *(CGSize *)((char *)result + 24) = self->_defaultImageSize;
  *(CGSize *)((char *)result + 40) = self->_edgeBottomLeftMargin;
  *(CGSize *)((char *)result + 56) = self->_edgeTopRightMargin;
  *(CGSize *)((char *)result + 72) = self->_contentBottomLeftMargin;
  *(CGSize *)((char *)result + 88) = self->_contentTopRightMargin;
  *((void *)result + 13) = *(void *)&self->_baseline;
  *((_OWORD *)result + 7) = self->_auxiliary1BottomLeftMargin;
  *((_OWORD *)result + 8) = self->_auxiliary1TopRightMargin;
  *((_OWORD *)result + 9) = self->_auxiliary2BottomLeftMargin;
  *((_OWORD *)result + 10) = self->_auxiliary2TopRightMargin;
  *((void *)result + 22) = *(void *)&self->_scale;
  *((_DWORD *)result + 46) = self->_crmFlags;
  return result;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)defaultImageSize
{
  double width = self->_defaultImageSize.width;
  double height = self->_defaultImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)edgeBottomLeftMargin
{
  double width = self->_edgeBottomLeftMargin.width;
  double height = self->_edgeBottomLeftMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)edgeTopRightMargin
{
  double width = self->_edgeTopRightMargin.width;
  double height = self->_edgeTopRightMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentBottomLeftMargin
{
  double width = self->_contentBottomLeftMargin.width;
  double height = self->_contentBottomLeftMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentTopRightMargin
{
  double width = self->_contentTopRightMargin.width;
  double height = self->_contentTopRightMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)baseline
{
  return self->_baseline;
}

- (CGSize)auxiliary1BottomLeftMargin
{
  double width = self->_auxiliary1BottomLeftMargin.width;
  double height = self->_auxiliary1BottomLeftMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)auxiliary1TopRightMargin
{
  double width = self->_auxiliary1TopRightMargin.width;
  double height = self->_auxiliary1TopRightMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)auxiliary2BottomLeftMargin
{
  double width = self->_auxiliary2BottomLeftMargin.width;
  double height = self->_auxiliary2BottomLeftMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)auxiliary2TopRightMargin
{
  double width = self->_auxiliary2TopRightMargin.width;
  double height = self->_auxiliary2TopRightMargin.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)scalesVertically
{
  return *(_WORD *)&self->_crmFlags & 1;
}

- (BOOL)scalesHorizontally
{
  return (*(_WORD *)&self->_crmFlags >> 1) & 1;
}

- (id)metricsByMirroringHorizontally
{
  v3 = (CGFloat *)[(CUIRenditionMetrics *)self copy];
  v3[5] = self->_edgeTopRightMargin.width;
  v3[7] = self->_edgeBottomLeftMargin.width;
  v3[9] = self->_contentTopRightMargin.width;
  v3[11] = self->_contentBottomLeftMargin.width;
  v3[14] = self->_auxiliary1TopRightMargin.width;
  v3[16] = self->_auxiliary1BottomLeftMargin.width;
  v3[18] = self->_auxiliary2TopRightMargin.width;
  v3[20] = self->_auxiliary2BottomLeftMargin.width;
  return v3;
}

- (CGRect)edgeRect
{
  double width = self->_edgeBottomLeftMargin.width;
  double height = self->_edgeBottomLeftMargin.height;
  double v4 = self->_imageSize.width - width - self->_edgeTopRightMargin.width;
  double v5 = self->_imageSize.height - height - self->_edgeTopRightMargin.height;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = height;
  result.origin.x = width;
  return result;
}

- (CGRect)contentRect
{
  double width = self->_contentBottomLeftMargin.width;
  double height = self->_contentBottomLeftMargin.height;
  double v4 = self->_imageSize.width - width - self->_contentTopRightMargin.width;
  double v5 = self->_imageSize.height - height - self->_contentTopRightMargin.height;
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = height;
  result.origin.x = width;
  return result;
}

- (CGRect)insetRectWithMetrics:(CGRect)a3
{
  double v3 = a3.origin.x + a3.size.width - self->_edgeTopRightMargin.width - (a3.origin.x + self->_edgeBottomLeftMargin.width);
  double v4 = a3.origin.y
     + a3.size.height
     - self->_edgeTopRightMargin.height
     - (a3.origin.y
      + self->_edgeBottomLeftMargin.height);
  double v5 = a3.origin.x + self->_edgeBottomLeftMargin.width;
  double v6 = a3.origin.y + self->_edgeBottomLeftMargin.height;
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)insetContentRectWithMetrics:(CGRect)a3
{
  double v3 = a3.origin.x
     + a3.size.width
     - self->_contentTopRightMargin.width
     - (a3.origin.x
      + self->_contentBottomLeftMargin.width);
  double v4 = a3.origin.y
     + a3.size.height
     - self->_contentTopRightMargin.height
     - (a3.origin.y
      + self->_contentBottomLeftMargin.height);
  double v5 = a3.origin.x + self->_contentBottomLeftMargin.width;
  double v6 = a3.origin.y + self->_contentBottomLeftMargin.height;
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)hasOpaqueContentBounds
{
  return 1;
}

@end