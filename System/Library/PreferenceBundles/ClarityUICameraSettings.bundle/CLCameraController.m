@interface CLCameraController
- (id)isCapturePhotosEnabled:(id)a3;
- (id)isCaptureSelfieEnabled:(id)a3;
- (id)isCaptureSelfieVideoEnabled:(id)a3;
- (id)isCaptureVideosEnabled:(id)a3;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)setCapturePhotosEnabled:(id)a3 specifier:(id)a4;
- (void)setCaptureSelfieEnabled:(id)a3 specifier:(id)a4;
- (void)setCaptureSelfieVideoEnabled:(id)a3 specifier:(id)a4;
- (void)setCaptureVideosEnabled:(id)a3 specifier:(id)a4;
@end

@implementation CLCameraController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(CLCameraController *)self loadSpecifiersFromPlistName:@"CLCameraController" target:self];
    id v6 = [v5 copy];
    v7 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)isCapturePhotosEnabled:(id)a3
{
  uint64_t v3 = +[CLFCameraSettings sharedInstance];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowPhotoCapture]);

  return v4;
}

- (void)setCapturePhotosEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFCameraSettings sharedInstance];
  [v5 setAllowPhotoCapture:v4];
}

- (id)isCaptureVideosEnabled:(id)a3
{
  uint64_t v3 = +[CLFCameraSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowVideoCapture]);

  return v4;
}

- (void)setCaptureVideosEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFCameraSettings sharedInstance];
  [v5 setAllowVideoCapture:v4];
}

- (id)isCaptureSelfieEnabled:(id)a3
{
  uint64_t v3 = +[CLFCameraSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowSelfieCapture]);

  return v4;
}

- (void)setCaptureSelfieEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFCameraSettings sharedInstance];
  [v5 setAllowSelfieCapture:v4];
}

- (id)isCaptureSelfieVideoEnabled:(id)a3
{
  uint64_t v3 = +[CLFCameraSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 allowSelfieVideoCapture]);

  return v4;
}

- (void)setCaptureSelfieVideoEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];
  id v5 = +[CLFCameraSettings sharedInstance];
  [v5 setAllowSelfieVideoCapture:v4];
}

@end