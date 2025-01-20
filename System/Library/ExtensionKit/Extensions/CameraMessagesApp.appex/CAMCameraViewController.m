@interface CAMCameraViewController
- (CAMCameraViewControllerUberDelegate)uberDelegate;
- (void)setUberDelegate:(id)a3;
@end

@implementation CAMCameraViewController

- (CAMCameraViewControllerUberDelegate)uberDelegate
{
  return (CAMCameraViewControllerUberDelegate *)[(CAMCameraViewController *)self captureDelegate];
}

- (void)setUberDelegate:(id)a3
{
  id v4 = a3;
  [(CAMCameraViewController *)self setCaptureDelegate:v4];
  [(CAMCameraViewController *)self setCameraSessionDelegate:v4];
  [(CAMCameraViewController *)self setPresentationDelegate:v4];
  [(CAMCameraViewController *)self setCreativeCameraDelegate:v4];
}

@end