@interface AKFormFeatureSegmented
+ (id)segments:(id)a3 withEnclosingRect:(CGRect)a4 baseline:(id)a5 onPage:(id)a6;
- (AKFormFeatureLine)baseline;
- (AKFormFeatureSegmented)initWithCharacterSegments:(id)a3 enclosingRect:(CGRect)a4 baseline:(id)a5 onPage:(id)a6;
- (CGRect)enclosingRegionRect;
- (NSArray)characterSegmentRects;
- (void)setBaseline:(id)a3;
- (void)setCharacterSegmentRects:(id)a3;
- (void)setEnclosingRegionRect:(CGRect)a3;
@end

@implementation AKFormFeatureSegmented

+ (id)segments:(id)a3 withEnclosingRect:(CGRect)a4 baseline:(id)a5 onPage:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = objc_msgSend(objc_alloc((Class)a1), "initWithCharacterSegments:enclosingRect:baseline:onPage:", v15, v14, v13, x, y, width, height);

  return v16;
}

- (AKFormFeatureSegmented)initWithCharacterSegments:(id)a3 enclosingRect:(CGRect)a4 baseline:(id)a5 onPage:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a3;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AKFormFeatureSegmented;
  v16 = -[AKFormFeature initWithRect:onPage:](&v19, sel_initWithRect_onPage_, a6, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_characterSegmentRects, a3);
    v17->_enclosingRegionRect.origin.double x = x;
    v17->_enclosingRegionRect.origin.double y = y;
    v17->_enclosingRegionRect.size.double width = width;
    v17->_enclosingRegionRect.size.double height = height;
    objc_storeStrong((id *)&v17->_baseline, a5);
  }

  return v17;
}

- (AKFormFeatureLine)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(id)a3
{
}

- (CGRect)enclosingRegionRect
{
  double x = self->_enclosingRegionRect.origin.x;
  double y = self->_enclosingRegionRect.origin.y;
  double width = self->_enclosingRegionRect.size.width;
  double height = self->_enclosingRegionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEnclosingRegionRect:(CGRect)a3
{
  self->_enclosingRegionRect = a3;
}

- (NSArray)characterSegmentRects
{
  return self->_characterSegmentRects;
}

- (void)setCharacterSegmentRects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSegmentRects, 0);

  objc_storeStrong((id *)&self->_baseline, 0);
}

@end