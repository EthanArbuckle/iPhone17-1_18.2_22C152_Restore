@interface _SCNExportOperation
- (BOOL)canceled;
- (BOOL)succeded;
- (CGSize)size;
- (NSDictionary)attributes;
- (NSError)error;
- (NSURL)outputURL;
- (SCNNode)pointOfView;
- (SCNRenderer)renderer;
- (SCNScene)scene;
- (SEL)didEndSelector;
- (double)endTime;
- (double)progress;
- (double)startTime;
- (id)delegate;
- (unint64_t)antialiasingMode;
- (void)cancel;
- (void)dealloc;
- (void)setAntialiasingMode:(unint64_t)a3;
- (void)setAttributes:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEndSelector:(SEL)a3;
- (void)setEndTime:(double)a3;
- (void)setError:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setPointOfView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRenderer:(id)a3;
- (void)setScene:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setStartTime:(double)a3;
- (void)setSucceded:(BOOL)a3;
- (void)setUserInfo:(void *)a3;
- (void)userInfo;
@end

@implementation _SCNExportOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_SCNExportOperation;
  [(_SCNExportOperation *)&v3 dealloc];
}

- (void)cancel
{
}

- (SCNNode)pointOfView
{
  return self->_pointOfView;
}

- (void)setPointOfView:(id)a3
{
}

- (unint64_t)antialiasingMode
{
  return self->_antialiasingMode;
}

- (void)setAntialiasingMode:(unint64_t)a3
{
  self->_antialiasingMode = a3;
}

- (SCNRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (void)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(void *)a3
{
  self->_userInfo = a3;
}

- (SEL)didEndSelector
{
  if (self->_didEndSelector) {
    return self->_didEndSelector;
  }
  else {
    return 0;
  }
}

- (void)setDidEndSelector:(SEL)a3
{
  if (a3) {
    objc_super v3 = a3;
  }
  else {
    objc_super v3 = 0;
  }
  self->_didEndSelector = v3;
}

- (SCNScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)succeded
{
  return self->_succeded;
}

- (void)setSucceded:(BOOL)a3
{
  self->_succeded = a3;
}

@end