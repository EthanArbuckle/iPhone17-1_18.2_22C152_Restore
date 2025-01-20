@interface BWInferenceSortedFusionTrackCropDescriptor
- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3;
- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4;
- (BWInferenceSortedFusionTrackCropDescriptor)initWithIdentifier:(char)a3 orderedFusionTrackIndex:(int)a4;
- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (char)identifier;
@end

@implementation BWInferenceSortedFusionTrackCropDescriptor

- (BWInferenceSortedFusionTrackCropDescriptor)initWithIdentifier:(char)a3 orderedFusionTrackIndex:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceSortedFusionTrackCropDescriptor;
  result = [(BWInferenceSortedFusionTrackCropDescriptor *)&v7 init];
  if (result)
  {
    result->_identifier = a3;
    result->_orderedFusionTrackIndex = a4;
  }
  return result;
}

- (char)identifier
{
  return self->_identifier;
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFArrayRef v4 = (const __CFArray *)CMGetAttachment(a3, @"SortedFusionTrackerCrops", 0);
  long long v9 = *MEMORY[0x1E4F1DB20];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  if (v4 && CFArrayGetCount(v4) > self->_orderedFusionTrackIndex) {
    FigCFArrayGetCGRectAtIndex();
  }
  double v6 = *((double *)&v9 + 1);
  double v5 = *(double *)&v9;
  double v8 = *((double *)&v10 + 1);
  double v7 = *(double *)&v10;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  CFArrayRef v5 = (const __CFArray *)CMGetAttachment(a3, @"SortedFusionTrackerCrops", 0);
  if (v5) {
    LOBYTE(v5) = CFArrayGetCount(v5) > self->_orderedFusionTrackIndex;
  }
  return (char)v5;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  return a3;
}

@end