@interface FigDepthDataCaptureConnectionConfiguration
- (id)description;
@end

@implementation FigDepthDataCaptureConnectionConfiguration

- (id)description
{
  int v3 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
  if (v3 == [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType])v4 = &stru_1EFA403E0; {
  else
  }
    v4 = (__CFString *)[NSString stringWithFormat:@" (SUB-DEVICE:%@)", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"))];
  v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"DC %p: <%@>%@ -> <%@>", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration")];
  [v5 appendFormat:@", %@/%dx%d", BWStringForOSType(-[FigVideoCaptureConnectionConfiguration outputFormat](self, "outputFormat")), -[FigVideoCaptureConnectionConfiguration outputWidth](self, "outputWidth"), -[FigVideoCaptureConnectionConfiguration outputHeight](self, "outputHeight")];
  [v5 appendFormat:@", E:%d, VIS:%d, M:%d, O:%d, RBC:%d", -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigVideoCaptureConnectionConfiguration videoStabilizationMethod](self, "videoStabilizationMethod"), -[FigVideoCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"), -[FigVideoCaptureConnectionConfiguration orientation](self, "orientation"), -[FigVideoCaptureConnectionConfiguration retainedBufferCount](self, "retainedBufferCount")];
  return v5;
}

@end