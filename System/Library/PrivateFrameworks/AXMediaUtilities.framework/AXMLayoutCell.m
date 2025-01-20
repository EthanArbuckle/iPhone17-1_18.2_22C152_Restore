@interface AXMLayoutCell
+ (id)sequence:(id)a3;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (id)feature;
@end

@implementation AXMLayoutCell

+ (id)sequence:(id)a3
{
  v3 = (AXMVisionFeature *)a3;
  v4 = objc_alloc_init(AXMLayoutCell);
  feature = v4->_feature;
  v4->_feature = v3;

  return v4;
}

- (CGRect)frame
{
  [(AXMVisionFeature *)self->_feature frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)normalizedFrame
{
  [(AXMVisionFeature *)self->_feature normalizedFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)feature
{
  return self->_feature;
}

- (void).cxx_destruct
{
}

@end