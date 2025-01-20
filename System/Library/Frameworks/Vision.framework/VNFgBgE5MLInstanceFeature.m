@interface VNFgBgE5MLInstanceFeature
- (CGRect)bbox;
- (CGSize)mapSize;
- (NSString)cocoCategoryName;
- (NSString)miyoshiCategoryName;
- (VNFgBgE5MLInstanceFeature)initWithQueryID:(int)a3 miyoshiConfidence:(float)a4 cocoConfidence:(float)a5 IoU:(float)a6 stabilityScore:(float)a7 miyoshiCategory:(int)a8 cocoCategory:(int)a9 miyoshiCategoryName:(id)a10 cocoCategoryName:(id)a11 bbox:(CGRect)a12 mapSize:(CGSize)a13 segmentation:()vector<CGPoint;
- (float)IoU;
- (float)cocoConfidence;
- (float)miyoshiConfidence;
- (float)stabilityScore;
- (id).cxx_construct;
- (int)cocoCategory;
- (int)miyoshiCategory;
- (int)queryID;
- (vector<CGPoint,)segmentation;
- (void)setBbox:(CGRect)a3;
- (void)setCocoCategory:(int)a3;
- (void)setCocoCategoryName:(id)a3;
- (void)setCocoConfidence:(float)a3;
- (void)setIoU:(float)a3;
- (void)setMapSize:(CGSize)a3;
- (void)setMiyoshiCategory:(int)a3;
- (void)setMiyoshiCategoryName:(id)a3;
- (void)setMiyoshiConfidence:(float)a3;
- (void)setQueryID:(int)a3;
- (void)setSegmentation:()vector<CGPoint;
- (void)setStabilityScore:(float)a3;
@end

@implementation VNFgBgE5MLInstanceFeature

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_segmentation.__begin_;
  if (begin)
  {
    self->_segmentation.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_cocoCategoryName, 0);

  objc_storeStrong((id *)&self->_miyoshiCategoryName, 0);
}

- (void)setSegmentation:()vector<CGPoint
{
}

- (vector<CGPoint,)segmentation
{
  objc_copyCppObjectAtomic(retstr, &self->_segmentation, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)setMapSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_mapSize, &v3, 16, 1, 0);
}

- (CGSize)mapSize
{
  objc_copyStruct(v4, &self->_mapSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBbox:(CGRect)a3
{
  self->_bbox = a3;
}

- (CGRect)bbox
{
  double x = self->_bbox.origin.x;
  double y = self->_bbox.origin.y;
  double width = self->_bbox.size.width;
  double height = self->_bbox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCocoCategoryName:(id)a3
{
}

- (NSString)cocoCategoryName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMiyoshiCategoryName:(id)a3
{
}

- (NSString)miyoshiCategoryName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCocoCategory:(int)a3
{
  self->_cocoCategordouble y = a3;
}

- (int)cocoCategory
{
  return self->_cocoCategory;
}

- (void)setMiyoshiCategory:(int)a3
{
  self->_miyoshiCategordouble y = a3;
}

- (int)miyoshiCategory
{
  return self->_miyoshiCategory;
}

- (void)setStabilityScore:(float)a3
{
  self->_stabilityScore = a3;
}

- (float)stabilityScore
{
  return self->_stabilityScore;
}

- (void)setIoU:(float)a3
{
  self->_IoU = a3;
}

- (float)IoU
{
  return self->_IoU;
}

- (void)setCocoConfidence:(float)a3
{
  self->_cocoConfidence = a3;
}

- (float)cocoConfidence
{
  return self->_cocoConfidence;
}

- (void)setMiyoshiConfidence:(float)a3
{
  self->_miyoshiConfidence = a3;
}

- (float)miyoshiConfidence
{
  return self->_miyoshiConfidence;
}

- (void)setQueryID:(int)a3
{
  self->_queryID = a3;
}

- (int)queryID
{
  return self->_queryID;
}

- (VNFgBgE5MLInstanceFeature)initWithQueryID:(int)a3 miyoshiConfidence:(float)a4 cocoConfidence:(float)a5 IoU:(float)a6 stabilityScore:(float)a7 miyoshiCategory:(int)a8 cocoCategory:(int)a9 miyoshiCategoryName:(id)a10 cocoCategoryName:(id)a11 bbox:(CGRect)a12 mapSize:(CGSize)a13 segmentation:()vector<CGPoint
{
  uint64_t v15 = v14;
  CGFloat height = a12.size.height;
  CGFloat width = a12.size.width;
  CGFloat y = a12.origin.y;
  CGFloat x = a12.origin.x;
  id v30 = a10;
  id v31 = a11;
  v35.receiver = self;
  v35.super_class = (Class)VNFgBgE5MLInstanceFeature;
  v32 = [(VNFgBgE5MLInstanceFeature *)&v35 init];
  v33 = v32;
  if (v32)
  {
    v32->_queryID = a3;
    v32->_miyoshiConfidence = a4;
    v32->_cocoConfidence = a5;
    v32->_IoU = a6;
    v32->_stabilityScore = a7;
    v32->_miyoshiCategorCGFloat y = a8;
    v32->_cocoCategorCGFloat y = a9;
    objc_storeStrong((id *)&v32->_miyoshiCategoryName, a10);
    objc_storeStrong((id *)&v33->_cocoCategoryName, a11);
    v33->_bbox.origin.CGFloat x = x;
    v33->_bbox.origin.CGFloat y = y;
    v33->_bbox.size.CGFloat width = width;
    v33->_bbox.size.CGFloat height = height;
    v33->_mapSize = a13;
    if (&v33->_segmentation != (vector<CGPoint, std::allocator<CGPoint>> *)v15) {
      std::vector<CGPoint>::__assign_with_size[abi:ne180100]<CGPoint*,CGPoint*>((char *)&v33->_segmentation, *(char **)v15, *(void *)(v15 + 8), (uint64_t)(*(void *)(v15 + 8) - *(void *)v15) >> 4);
    }
  }

  return v33;
}

@end