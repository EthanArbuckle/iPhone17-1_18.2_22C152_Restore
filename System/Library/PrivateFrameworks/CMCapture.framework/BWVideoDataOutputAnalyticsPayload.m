@interface BWVideoDataOutputAnalyticsPayload
- (BOOL)hdrVideo;
- (BOOL)proresVideo;
- (BOOL)videoMirrored;
- (BWVideoDataOutputAnalyticsPayload)init;
- (NSString)clientApplicationID;
- (double)duration;
- (float)nominalFramerate;
- (id)eventDictionary;
- (id)eventName;
- (int)colorSpace;
- (int)deviceMask;
- (int)devicePosition;
- (int)height;
- (int)width;
- (unint64_t)numberOfFrames;
- (unint64_t)numberOfFramesDropped;
- (unint64_t)numberOfISPFramesDropped;
- (void)dealloc;
- (void)reset;
- (void)setClientApplicationID:(id)a3;
- (void)setColorSpace:(int)a3;
- (void)setDeviceMask:(int)a3;
- (void)setDevicePosition:(int)a3;
- (void)setDuration:(double)a3;
- (void)setHdrVideo:(BOOL)a3;
- (void)setHeight:(int)a3;
- (void)setNominalFramerate:(float)a3;
- (void)setNumberOfFrames:(unint64_t)a3;
- (void)setNumberOfFramesDropped:(unint64_t)a3;
- (void)setNumberOfISPFramesDropped:(unint64_t)a3;
- (void)setProresVideo:(BOOL)a3;
- (void)setVideoMirrored:(BOOL)a3;
- (void)setWidth:(int)a3;
@end

@implementation BWVideoDataOutputAnalyticsPayload

- (void)setDeviceMask:(int)a3
{
  self->_deviceMask = a3;
}

- (int)deviceMask
{
  return self->_deviceMask;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (void)setHdrVideo:(BOOL)a3
{
  self->_hdrVideo = a3;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (void)setColorSpace:(int)a3
{
  self->_colorSpace = a3;
}

- (void)setClientApplicationID:(id)a3
{
}

- (BWVideoDataOutputAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWVideoDataOutputAnalyticsPayload;
  v2 = [(BWVideoDataOutputAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWVideoDataOutputAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_duration = 0.0;
  *(void *)&self->_deviceMask = 0;
  self->_videoMirrored = 0;
  self->_nominalFramerate = 3.4028e38;
  *(void *)&self->_height = 0x8000000080000000;

  self->_clientApplicationID = 0;
  *(_WORD *)&self->_hdrVideo = 0;
  self->_colorSpace = -1;
  self->_numberOfISPFramesDropped = 0;
  self->_numberOfFrames = 0;
  self->_numberOfFramesDropped = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDataOutputAnalyticsPayload;
  [(BWVideoDataOutputAnalyticsPayload *)&v3 dealloc];
}

- (id)eventName
{
  if (self->_proresVideo) {
    return @"com.apple.coremedia.camera.ProResVideoDataOutput";
  }
  else {
    return @"com.apple.coremedia.camera.VideoDataOutput";
  }
}

- (id)eventDictionary
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", +[BWCoreAnalyticsReporter clientApplicationIDType:](BWCoreAnalyticsReporter, "clientApplicationIDType:", self->_clientApplicationID)), @"clientIDType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_videoMirrored), @"videoMirrored");
  if (self->_deviceMask) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"deviceMask");
  }
  if (self->_devicePosition) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"devicePosition");
  }
  if (self->_duration != 0.0) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"duration");
  }
  if (self->_nominalFramerate != 3.4028e38) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:"), @"nominalFramerate");
  }
  if (self->_height != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"height");
  }
  if (self->_width != 0x7FFFFFFF) {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"width");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_hdrVideo), @"hdrVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfFramesDropped), @"numberOfFramesDropped");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfISPFramesDropped), @"numberOfISPFramesDropped");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_numberOfFrames), @"numberOfFrames");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_proresVideo), @"proresVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_colorSpace), @"colorSpace");
  return v3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (BOOL)videoMirrored
{
  return self->_videoMirrored;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (float)nominalFramerate
{
  return self->_nominalFramerate;
}

- (void)setNominalFramerate:(float)a3
{
  self->_nominalFramerate = a3;
}

- (int)height
{
  return self->_height;
}

- (int)width
{
  return self->_width;
}

- (BOOL)hdrVideo
{
  return self->_hdrVideo;
}

- (BOOL)proresVideo
{
  return self->_proresVideo;
}

- (void)setProresVideo:(BOOL)a3
{
  self->_proresVideo = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (unint64_t)numberOfFramesDropped
{
  return self->_numberOfFramesDropped;
}

- (void)setNumberOfFramesDropped:(unint64_t)a3
{
  self->_numberOfFramesDropped = a3;
}

- (unint64_t)numberOfISPFramesDropped
{
  return self->_numberOfISPFramesDropped;
}

- (void)setNumberOfISPFramesDropped:(unint64_t)a3
{
  self->_numberOfISPFramesDropped = a3;
}

- (unint64_t)numberOfFrames
{
  return self->_numberOfFrames;
}

- (void)setNumberOfFrames:(unint64_t)a3
{
  self->_numberOfFrames = a3;
}

@end