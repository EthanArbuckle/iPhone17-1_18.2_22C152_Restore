@interface FigCameraCalibrationDataCaptureConnectionConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)mirroringEnabled;
- (FigCameraCalibrationDataCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)orientation;
- (void)setMirroringEnabled:(BOOL)a3;
- (void)setOrientation:(int)a3;
@end

@implementation FigCameraCalibrationDataCaptureConnectionConfiguration

- (FigCameraCalibrationDataCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
    if (v4)
    {
      *(&v4->super._enabled + 1) = xpc_dictionary_get_BOOL(a3, "mirroringEnabled");
      *((_DWORD *)&v4->super._enabled + 1) = xpc_dictionary_get_int64(a3, "orientation");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)copyXPCEncoding
{
  v5.receiver = self;
  v5.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
  id v3 = [(FigCaptureConnectionConfiguration *)&v5 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "mirroringEnabled", [(FigCameraCalibrationDataCaptureConnectionConfiguration *)self mirroringEnabled]);
  xpc_dictionary_set_int64(v3, "orientation", [(FigCameraCalibrationDataCaptureConnectionConfiguration *)self orientation]);
  return v3;
}

- (id)description
{
  int v3 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
  if (v3 == [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType])v4 = &stru_1EFA403E0; {
  else
  }
    v4 = (__CFString *)[NSString stringWithFormat:@" (SUB-DEVICE:%@)", +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"))];
  objc_super v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"CaCC %p: <%@>%@ -> <%@>", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration")];
  [v5 appendFormat:@", E:%d, M:%d, O:%d", -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[FigCameraCalibrationDataCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"), -[FigCameraCalibrationDataCaptureConnectionConfiguration orientation](self, "orientation")];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
  id v4 = [(FigCaptureConnectionConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setMirroringEnabled:", -[FigCameraCalibrationDataCaptureConnectionConfiguration mirroringEnabled](self, "mirroringEnabled"));
  objc_msgSend(v4, "setOrientation:", -[FigCameraCalibrationDataCaptureConnectionConfiguration orientation](self, "orientation"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FigCameraCalibrationDataCaptureConnectionConfiguration;
  BOOL v5 = -[FigCaptureConnectionConfiguration isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v6 = [(FigCameraCalibrationDataCaptureConnectionConfiguration *)self mirroringEnabled],
          v6 == [a3 mirroringEnabled]))
    {
      int v7 = [(FigCameraCalibrationDataCaptureConnectionConfiguration *)self orientation];
      LOBYTE(v5) = v7 == [a3 orientation];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)mirroringEnabled
{
  return *(&self->super._enabled + 1);
}

- (void)setMirroringEnabled:(BOOL)a3
{
  *(&self->super._enabled + 1) = a3;
}

- (int)orientation
{
  return *((_DWORD *)&self->super._enabled + 1);
}

- (void)setOrientation:(int)a3
{
  *((_DWORD *)&self->super._enabled + 1) = a3;
}

@end