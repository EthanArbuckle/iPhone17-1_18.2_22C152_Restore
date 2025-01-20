@interface VCPSaliencyRegion
+ (id)salientRegionsFromPixelBuffer:(__CVBuffer *)a3;
+ (void)attachSalientRegions:(id)a3 toPixelBuffer:(__CVBuffer *)a4;
- (CGRect)bound;
- (VCPSaliencyRegion)initWith:(CGRect)a3 confidence:(float)a4;
- (VCPSaliencyRegion)initWithPlistRepresentation:(id)a3;
- (float)confidence;
- (id)plistRepresentation;
- (void)setBound:(CGRect)a3;
- (void)setConfidence:(float)a3;
@end

@implementation VCPSaliencyRegion

- (VCPSaliencyRegion)initWith:(CGRect)a3 confidence:(float)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VCPSaliencyRegion;
  result = [(VCPSaliencyRegion *)&v10 init];
  if (result)
  {
    result->_bound.origin.CGFloat x = x;
    result->_bound.origin.CGFloat y = y;
    result->_bound.size.CGFloat width = width;
    result->_bound.size.CGFloat height = height;
    result->_confidence = a4;
  }
  return result;
}

- (VCPSaliencyRegion)initWithPlistRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"bound"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"confidence"];
  v7 = (void *)v6;
  if (!v5)
  {
    double x = 0.0;
    double y = 0.0;
    double width = 0.0;
    double height = 0.0;
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    double v13 = 0.0;
    goto LABEL_6;
  }
  NSRect v16 = NSRectFromString(v5);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  [v7 floatValue];
  LODWORD(v13) = v12;
LABEL_6:
  v14 = -[VCPSaliencyRegion initWith:confidence:](self, "initWith:confidence:", x, y, width, height, v13);

  return v14;
}

- (id)plistRepresentation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromRect(self->_bound);
  *(float *)&double v4 = self->_confidence;
  v5 = [NSNumber numberWithFloat:v4];
  v8[0] = @"bound";
  v8[1] = @"confidence";
  v9[0] = v3;
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (void)attachSalientRegions:(id)a3 toPixelBuffer:(__CVBuffer *)a4
{
  id v5 = [a3 valueForKey:@"plistRepresentation"];
  CVBufferSetAttachment(a4, @"SalientRegions", v5, kCVAttachmentMode_ShouldNotPropagate);
}

+ (id)salientRegionsFromPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = CVBufferGetAttachment(a3, @"SalientRegions", 0);
  double v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [VCPSaliencyRegion alloc];
        v11 = -[VCPSaliencyRegion initWithPlistRepresentation:](v10, "initWithPlistRepresentation:", v9, (void)v13);
        [v4 addObject:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (CGRect)bound
{
  objc_copyStruct(v6, &self->_bound, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBound:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_bound, &v3, 32, 1, 0);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end