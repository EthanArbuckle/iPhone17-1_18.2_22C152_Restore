@interface BWStereoVideoCaptureAnalyticsPayload
- (BOOL)stereoVideoCaptureEnabled;
- (BWStereoVideoCaptureAnalyticsPayload)init;
- (float)percentageOfFramesWithAggressiveFocusDistance;
- (float)percentageOfFramesWithAggressiveLuxLevel;
- (float)stereoVideoCaptureDuration;
- (id)eventDictionary;
- (id)eventName;
- (int)cameraPosture;
- (int)stereoVideoCaptureStatus;
- (int)videoOrientation;
- (void)reset;
- (void)setCameraPosture:(int)a3;
- (void)setPercentageOfFramesWithAggressiveFocusDistance:(float)a3;
- (void)setPercentageOfFramesWithAggressiveLuxLevel:(float)a3;
- (void)setStereoVideoCaptureDuration:(float)a3;
- (void)setStereoVideoCaptureEnabled:(BOOL)a3;
- (void)setStereoVideoCaptureStatus:(int)a3;
- (void)setVideoOrientation:(int)a3;
@end

@implementation BWStereoVideoCaptureAnalyticsPayload

- (BWStereoVideoCaptureAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWStereoVideoCaptureAnalyticsPayload;
  v2 = [(BWStereoVideoCaptureAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWStereoVideoCaptureAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.StereoVideoCapture";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (self->_videoOrientation) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"videoOrientation");
  }
  if (self->_cameraPosture) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"cameraPosture");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_stereoVideoCaptureEnabled), @"stereoVideoCaptureEnabled");
  if (self->_stereoVideoCaptureEnabled)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_stereoVideoCaptureStatus), @"stereoVideoCaptureStatus");
    *(float *)&double v4 = self->_stereoVideoCaptureDuration;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"stereoVideoCaptureDuration");
    *(float *)&double v5 = self->_percentageOfFramesWithAggressiveLuxLevel;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"percentageOfFramesWithAggressiveLuxLevel");
    *(float *)&double v6 = self->_percentageOfFramesWithAggressiveFocusDistance;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"percentageOfFramesWithAggressiveFocusDistance");
  }
  return v3;
}

- (void)reset
{
  self->_stereoVideoCaptureEnabled = 0;
  *(void *)&self->_videoOrientation = 0;
  self->_stereoVideoCaptureStatus = 1;
  *(void *)&self->_stereoVideoCaptureDuration = 0;
  self->_percentageOfFramesWithAggressiveFocusDistance = 0.0;
}

- (int)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int)a3
{
  self->_videoOrientation = a3;
}

- (int)cameraPosture
{
  return self->_cameraPosture;
}

- (void)setCameraPosture:(int)a3
{
  self->_cameraPosture = a3;
}

- (BOOL)stereoVideoCaptureEnabled
{
  return self->_stereoVideoCaptureEnabled;
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  self->_stereoVideoCaptureEnabled = a3;
}

- (int)stereoVideoCaptureStatus
{
  return self->_stereoVideoCaptureStatus;
}

- (void)setStereoVideoCaptureStatus:(int)a3
{
  self->_stereoVideoCaptureStatus = a3;
}

- (float)stereoVideoCaptureDuration
{
  return self->_stereoVideoCaptureDuration;
}

- (void)setStereoVideoCaptureDuration:(float)a3
{
  self->_stereoVideoCaptureDuration = a3;
}

- (float)percentageOfFramesWithAggressiveLuxLevel
{
  return self->_percentageOfFramesWithAggressiveLuxLevel;
}

- (void)setPercentageOfFramesWithAggressiveLuxLevel:(float)a3
{
  self->_percentageOfFramesWithAggressiveLuxLevel = a3;
}

- (float)percentageOfFramesWithAggressiveFocusDistance
{
  return self->_percentageOfFramesWithAggressiveFocusDistance;
}

- (void)setPercentageOfFramesWithAggressiveFocusDistance:(float)a3
{
  self->_percentageOfFramesWithAggressiveFocusDistance = a3;
}

@end