@interface AVCaptureRotationHelperLayer
- (AVCaptureRotationHelperLayer)initWithDelegate:(id)a3;
- (void)dealloc;
- (void)layerDidBecomeVisible:(BOOL)a3;
@end

@implementation AVCaptureRotationHelperLayer

- (AVCaptureRotationHelperLayer)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureRotationHelperLayer;
  v4 = [(AVCaptureRotationHelperLayer *)&v6 init];
  if (v4) {
    v4->_delegate = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureRotationHelperLayer;
  [(AVCaptureRotationHelperLayer *)&v3 dealloc];
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)[(AVWeakReference *)self->_delegate referencedObject];
  if (v5)
  {
    [v5 layer:self didBecomeVisible:v3];
  }
}

@end