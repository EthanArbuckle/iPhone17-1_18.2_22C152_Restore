@interface AKFormFeatureBox
+ (id)boxWithRect:(CGRect)a3 onPage:(id)a4 flags:(unint64_t)a5 baseline:(id)a6;
- (AKFormFeatureBox)initWithRect:(CGRect)a3 onPage:(id)a4 flags:(unint64_t)a5 baseline:(id)a6;
- (AKFormFeatureLine)baseline;
- (BOOL)isMultiline;
- (BOOL)widthExpands;
- (CGRect)enclosingRegionRect;
- (unint64_t)alignment;
- (unint64_t)flags;
- (void)setAlignment:(unint64_t)a3;
- (void)setBaseline:(id)a3;
- (void)setEnclosingRegionRect:(CGRect)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setMultiline:(BOOL)a3;
- (void)setWidthExpands:(BOOL)a3;
@end

@implementation AKFormFeatureBox

+ (id)boxWithRect:(CGRect)a3 onPage:(id)a4 flags:(unint64_t)a5 baseline:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  id v14 = a4;
  v15 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:onPage:flags:baseline:", v14, a5, v13, x, y, width, height);

  return v15;
}

- (AKFormFeatureBox)initWithRect:(CGRect)a3 onPage:(id)a4 flags:(unint64_t)a5 baseline:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AKFormFeatureBox;
  id v14 = -[AKFormFeature initWithRect:onPage:](&v19, sel_initWithRect_onPage_, a4, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_flags = a5;
    v14->_widthExpands = a5 & 1;
    v14->_multiline = (a5 & 2) != 0;
    uint64_t v16 = [v13 copy];
    baseline = v15->_baseline;
    v15->_baseline = (AKFormFeatureLine *)v16;

    if ((a5 & 4) != 0 || (a5 & 8) == 0) {
      v15->_alignment = 0;
    }
    else {
      v15->_alignment = 2;
    }
  }

  return v15;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (BOOL)widthExpands
{
  return self->_widthExpands;
}

- (void)setWidthExpands:(BOOL)a3
{
  self->_widthExpands = a3;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (void)setMultiline:(BOOL)a3
{
  self->_multiline = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
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

- (void).cxx_destruct
{
}

@end