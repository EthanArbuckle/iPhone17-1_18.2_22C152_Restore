@interface FigCaptureSessionPreviewSinkPipeline
- (BOOL)imageQueueUpdatedNotificationSent;
- (BOOL)previewRunning;
- (BOOL)previewSinkEnabled;
- (NSString)sourceID;
- (void)dealloc;
- (void)setImageQueueUpdatedNotificationSent:(BOOL)a3;
- (void)setPreviewRunning:(BOOL)a3;
- (void)setPreviewSinkEnabled:(BOOL)a3;
- (void)setSourceID:(id)a3;
@end

@implementation FigCaptureSessionPreviewSinkPipeline

- (void)setImageQueueUpdatedNotificationSent:(BOOL)a3
{
  self->_imageQueueUpdatedNotificationSent = a3;
}

- (BOOL)imageQueueUpdatedNotificationSent
{
  return self->_imageQueueUpdatedNotificationSent;
}

- (void)setPreviewSinkEnabled:(BOOL)a3
{
  self->_previewSinkEnabled = a3;
}

- (BOOL)previewSinkEnabled
{
  return self->_previewSinkEnabled;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (BOOL)previewRunning
{
  return self->_previewRunning;
}

- (void)setPreviewRunning:(BOOL)a3
{
  self->_previewRunning = a3;
}

- (void)setSourceID:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionPreviewSinkPipeline;
  [(FigCapturePreviewSinkPipeline *)&v3 dealloc];
}

@end