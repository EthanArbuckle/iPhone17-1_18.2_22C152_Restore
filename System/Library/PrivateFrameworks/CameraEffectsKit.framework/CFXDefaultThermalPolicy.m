@interface CFXDefaultThermalPolicy
- (unint64_t)priority;
- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6;
@end

@implementation CFXDefaultThermalPolicy

- (unint64_t)priority
{
  return -1;
}

- (void)cameraFPSForThermalLevel:(int)a3 deviceType:(id)a4 minRate:(int *)a5 maxRate:(int *)a6
{
  if (a3 > 0x32) {
    goto LABEL_9;
  }
  if (((1 << a3) & 0x4010040100000) != 0)
  {
    int v8 = 15;
  }
  else if (a3)
  {
    if (a3 != 10) {
      goto LABEL_9;
    }
    int v8 = 24;
  }
  else
  {
    int v8 = 30;
  }
  *a6 = v8;
LABEL_9:
  v9 = +[JFXVideoCameraController sharedInstance];
  uint64_t v10 = [v9 cameraMode];

  if (JFXIsVideoCameraMode(v10)) {
    int v11 = *a6;
  }
  else {
    int v11 = 15;
  }
  *a5 = v11;
}

@end