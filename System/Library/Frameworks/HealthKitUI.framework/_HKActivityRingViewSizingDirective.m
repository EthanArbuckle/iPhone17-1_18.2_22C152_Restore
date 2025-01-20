@interface _HKActivityRingViewSizingDirective
+ (id)activityRingSizingDirectiveWithIdentifier:(id)a3 width:(double)a4 outerRingOffset:(double)a5 ringThickness:(double)a6 ringInterspacing:(double)a7;
+ (id)sortedRingRatioDirectives;
- (NSString)identifier;
- (double)outerRingOffset;
- (double)ringInterspacing;
- (double)ringThickness;
- (double)width;
- (id)description;
- (void)setIdentifier:(id)a3;
- (void)setOuterRingOffset:(double)a3;
- (void)setRingInterspacing:(double)a3;
- (void)setRingThickness:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation _HKActivityRingViewSizingDirective

+ (id)sortedRingRatioDirectives
{
  if (sortedRingRatioDirectives_onceToken != -1) {
    dispatch_once(&sortedRingRatioDirectives_onceToken, &__block_literal_global);
  }
  v2 = (void *)sortedRingRatioDirectives_sortedRingRatioDirectives;

  return v2;
}

+ (id)activityRingSizingDirectiveWithIdentifier:(id)a3 width:(double)a4 outerRingOffset:(double)a5 ringThickness:(double)a6 ringInterspacing:(double)a7
{
  id v11 = a3;
  v12 = objc_opt_new();
  [v12 setIdentifier:v11];

  [v12 setWidth:a4];
  [v12 setOuterRingOffset:a5];
  [v12 setRingThickness:a6];
  [v12 setRingInterspacing:a7];

  return v12;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void)setOuterRingOffset:(double)a3
{
  self->_outerRingOffset = a3;
}

- (void)setRingThickness:(double)a3
{
  self->_ringThickness = a3;
}

- (void)setRingInterspacing:(double)a3
{
  self->_ringInterspacing = a3;
}

- (double)width
{
  return self->_width;
}

- (double)ringThickness
{
  return self->_ringThickness;
}

- (double)ringInterspacing
{
  return self->_ringInterspacing;
}

- (double)outerRingOffset
{
  return self->_outerRingOffset;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_HKActivityRingViewSizingDirective *)self identifier];
  [(_HKActivityRingViewSizingDirective *)self outerRingOffset];
  uint64_t v8 = v7;
  [(_HKActivityRingViewSizingDirective *)self ringThickness];
  uint64_t v10 = v9;
  [(_HKActivityRingViewSizingDirective *)self ringInterspacing];
  v12 = [v3 stringWithFormat:@"<%@ %p %@ outerRingOffset: %f ringThickness: %f ringInterspacing: %f>", v5, self, v6, v8, v10, v11];

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end