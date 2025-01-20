@interface FigVisionDataCaptureConnectionConfiguration
- (FigVisionDataCaptureConnectionConfiguration)init;
- (id)description;
@end

@implementation FigVisionDataCaptureConnectionConfiguration

- (FigVisionDataCaptureConnectionConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)FigVisionDataCaptureConnectionConfiguration;
  v2 = [(FigCaptureConnectionConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FigVideoCaptureConnectionConfiguration *)v2 setOutputFormat:1278226488];
    [(FigVideoCaptureConnectionConfiguration *)v3 setOutputWidth:128];
    [(FigVideoCaptureConnectionConfiguration *)v3 setOutputHeight:128];
  }
  return v3;
}

- (id)description
{
  int v3 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
  if (v3 == [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType])v4 = &stru_1EFA403E0; {
  else
  }
    v4 = (__CFString *)[NSString stringWithFormat:@" (SUB-DEVICE:%@)", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"))];
  objc_super v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"VsnC %p: <%@>%@ -> <%@>", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration")];
  [v5 appendFormat:@", %@/%dx%d, E:%d", BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight"), -[FigCaptureConnectionConfiguration enabled](self, "enabled")];
  return v5;
}

@end