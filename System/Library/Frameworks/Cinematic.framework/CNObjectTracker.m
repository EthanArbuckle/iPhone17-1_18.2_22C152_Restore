@interface CNObjectTracker
+ (BOOL)isSupported;
- (BOOL)startTrackingAt:(CMTime *)time within:(CGRect)normalizedBounds sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity;
- (CNBoundsPrediction)continueTrackingAt:(CMTime *)time sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity;
- (CNBoundsPrediction)findObjectAtPoint:(CGPoint)point sourceImage:(CVPixelBufferRef)sourceImage;
- (CNDetectionTrack)finishDetectionTrack;
- (CNObjectTracker)initWithCommandQueue:(id)commandQueue;
- (PTTapToTrack)internalTapToTrack;
- (void)resetDetectionTrack;
- (void)setInternalTapToTrack:(id)a3;
@end

@implementation CNObjectTracker

+ (BOOL)isSupported
{
  return [MEMORY[0x263F5F2F8] isSupported];
}

- (CNObjectTracker)initWithCommandQueue:(id)commandQueue
{
  id v4 = commandQueue;
  v10.receiver = self;
  v10.super_class = (Class)CNObjectTracker;
  v5 = [(CNObjectTracker *)&v10 init];
  if (v5
    && (uint64_t v6 = [objc_alloc(MEMORY[0x263F5F2F8]) initWithCommandQueue:v4],
        internalTapToTrack = v5->_internalTapToTrack,
        v5->_internalTapToTrack = (PTTapToTrack *)v6,
        internalTapToTrack,
        !v5->_internalTapToTrack))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (CNBoundsPrediction)findObjectAtPoint:(CGPoint)point sourceImage:(CVPixelBufferRef)sourceImage
{
  id v4 = -[PTTapToTrack getRectForPoint:colorBuffer:](self->_internalTapToTrack, "getRectForPoint:colorBuffer:", sourceImage, point.x, point.y);
  v5 = +[CNBoundsPrediction _predictionFromInternal:v4];

  return (CNBoundsPrediction *)v5;
}

- (BOOL)startTrackingAt:(CMTime *)time within:(CGRect)normalizedBounds sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity
{
  internalTapToTrack = self->_internalTapToTrack;
  CMTime v8 = *time;
  return -[PTTapToTrack addDetectionAndStartTrackingRect:time:colorBuffer:disparityBuffer:](internalTapToTrack, "addDetectionAndStartTrackingRect:time:colorBuffer:disparityBuffer:", &v8, sourceImage, sourceDisparity, normalizedBounds.origin.x, normalizedBounds.origin.y, normalizedBounds.size.width, normalizedBounds.size.height);
}

- (CNBoundsPrediction)continueTrackingAt:(CMTime *)time sourceImage:(CVPixelBufferRef)sourceImage sourceDisparity:(CVPixelBufferRef)sourceDisparity
{
  internalTapToTrack = self->_internalTapToTrack;
  CMTime v9 = *time;
  uint64_t v6 = [(PTTapToTrack *)internalTapToTrack addDetectionForNextFrameAt:&v9 colorBuffer:sourceImage disparityBuffer:sourceDisparity];
  v7 = +[CNBoundsPrediction _predictionFromInternal:v6];

  return (CNBoundsPrediction *)v7;
}

- (CNDetectionTrack)finishDetectionTrack
{
  v2 = [(PTTapToTrack *)self->_internalTapToTrack finalizeTrack];
  v3 = +[CNDetectionTrack _trackFromInternal:v2];

  return (CNDetectionTrack *)v3;
}

- (void)resetDetectionTrack
{
}

- (PTTapToTrack)internalTapToTrack
{
  return (PTTapToTrack *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternalTapToTrack:(id)a3
{
}

- (void).cxx_destruct
{
}

@end