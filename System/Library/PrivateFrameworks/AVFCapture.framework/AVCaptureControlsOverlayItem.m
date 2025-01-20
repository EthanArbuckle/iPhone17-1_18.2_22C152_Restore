@interface AVCaptureControlsOverlayItem
- (AVCaptureControl)control;
- (AVCaptureControlsOverlayItem)initWithControl:(id)a3 overlayControl:(id)a4;
- (CAMAbstractOverlayServiceControl)overlayControl;
- (NSString)identifier;
- (void)dealloc;
@end

@implementation AVCaptureControlsOverlayItem

- (NSString)identifier
{
  v2 = (void *)[(NSString *)[(AVCaptureControl *)self->_control identifier] copy];

  return (NSString *)v2;
}

- (AVCaptureControlsOverlayItem)initWithControl:(id)a3 overlayControl:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureControlsOverlayItem;
  v6 = [(AVCaptureControlsOverlayItem *)&v8 init];
  if (v6)
  {
    v6->_control = (AVCaptureControl *)a3;
    v6->_overlayControl = (CAMAbstractOverlayServiceControl *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureControlsOverlayItem;
  [(AVCaptureControlsOverlayItem *)&v3 dealloc];
}

- (AVCaptureControl)control
{
  return self->_control;
}

- (CAMAbstractOverlayServiceControl)overlayControl
{
  return self->_overlayControl;
}

@end