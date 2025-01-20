@interface AXElementVision__generated__Input
- (AXElementVision__generated__Input)initWithImage:(__CVBuffer *)a3 iouThreshold:(double)a4 confidenceThreshold:(double)a5;
- (NSSet)featureNames;
- (__CVBuffer)image;
- (double)confidenceThreshold;
- (double)iouThreshold;
- (id)featureValueForName:(id)a3;
- (void)setConfidenceThreshold:(double)a3;
- (void)setImage:(__CVBuffer *)a3;
- (void)setIouThreshold:(double)a3;
@end

@implementation AXElementVision__generated__Input

- (AXElementVision__generated__Input)initWithImage:(__CVBuffer *)a3 iouThreshold:(double)a4 confidenceThreshold:(double)a5
{
  if (self)
  {
    self->_image = a3;
    self->_iouThreshold = a4;
    self->_confidenceThreshold = a5;
  }
  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E94140];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"image"])
  {
    uint64_t v5 = [MEMORY[0x1E4F1E950] featureValueWithPixelBuffer:self->_image];
LABEL_8:
    v8 = (void *)v5;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"iouThreshold"])
  {
    v6 = (void *)MEMORY[0x1E4F1E950];
    double iouThreshold = self->_iouThreshold;
LABEL_7:
    uint64_t v5 = [v6 featureValueWithDouble:iouThreshold];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"confidenceThreshold"])
  {
    v6 = (void *)MEMORY[0x1E4F1E950];
    double iouThreshold = self->_confidenceThreshold;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (__CVBuffer)image
{
  return self->_image;
}

- (void)setImage:(__CVBuffer *)a3
{
  self->_image = a3;
}

- (double)iouThreshold
{
  return self->_iouThreshold;
}

- (void)setIouThreshold:(double)a3
{
  self->_double iouThreshold = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

@end