@interface DADiagnosticResponder
- (void)enableVolumeHUD:(BOOL)a3;
- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4;
@end

@implementation DADiagnosticResponder

- (void)enableVolumeHUD:(BOOL)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015E68;
  block[3] = &unk_10014BB10;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  v6 = dispatch_queue_create("com.apple.Diagnostics.brightnessQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016048;
  block[3] = &unk_10014BB50;
  BOOL v9 = a4;
  float v8 = a3;
  dispatch_async(v6, block);
}

@end