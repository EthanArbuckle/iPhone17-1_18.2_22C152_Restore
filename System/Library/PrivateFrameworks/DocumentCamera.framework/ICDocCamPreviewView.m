@interface ICDocCamPreviewView
+ (Class)layerClass;
- (AVCaptureSession)session;
- (void)setSession:(id)a3;
@end

@implementation ICDocCamPreviewView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVCaptureSession)session
{
  v2 = [(ICDocCamPreviewView *)self layer];
  v3 = [v2 session];

  return (AVCaptureSession *)v3;
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDocCamPreviewView *)self layer];
  [v5 setSession:v4];
}

@end