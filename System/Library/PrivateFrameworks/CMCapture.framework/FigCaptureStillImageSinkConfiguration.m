@interface FigCaptureStillImageSinkConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)quadraHighResCaptureEnabled;
- (BOOL)zeroShutterLagEnabled;
- (FigCaptureStillImageSinkConfiguration)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sinkType;
- (void)setQuadraHighResCaptureEnabled:(BOOL)a3;
- (void)setZeroShutterLagEnabled:(BOOL)a3;
@end

@implementation FigCaptureStillImageSinkConfiguration

- (FigCaptureStillImageSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_quadraHighResCaptureEnabled = xpc_dictionary_get_BOOL(a3, "stillImageQuadraHighResCaptureEnabled");
    v4->_zeroShutterLagEnabled = xpc_dictionary_get_BOOL(a3, "stillImageZeroShutterLagEnabled");
  }
  return v4;
}

- (id)copyXPCEncoding
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v5 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "stillImageQuadraHighResCaptureEnabled", [(FigCaptureStillImageSinkConfiguration *)self quadraHighResCaptureEnabled]);
  xpc_dictionary_set_BOOL(v3, "stillImageZeroShutterLagEnabled", [(FigCaptureStillImageSinkConfiguration *)self zeroShutterLagEnabled]);
  return v3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  return (id)[NSString stringWithFormat:@"%@ quadraHighRes:%d zeroShutterLag:%d", -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureStillImageSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"), -[FigCaptureStillImageSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setQuadraHighResCaptureEnabled:", -[FigCaptureStillImageSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"));
  objc_msgSend(v4, "setZeroShutterLagEnabled:", -[FigCaptureStillImageSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FigCaptureStillImageSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v9, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v6 = [(FigCaptureStillImageSinkConfiguration *)self quadraHighResCaptureEnabled],
          v6 == [a3 quadraHighResCaptureEnabled]))
    {
      BOOL v7 = [(FigCaptureStillImageSinkConfiguration *)self zeroShutterLagEnabled];
      LOBYTE(v5) = v7 ^ [a3 zeroShutterLagEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (int)sinkType
{
  return 3;
}

- (BOOL)quadraHighResCaptureEnabled
{
  return self->_quadraHighResCaptureEnabled;
}

- (void)setQuadraHighResCaptureEnabled:(BOOL)a3
{
  self->_quadraHighResCaptureEnabled = a3;
}

- (BOOL)zeroShutterLagEnabled
{
  return self->_zeroShutterLagEnabled;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  self->_zeroShutterLagEnabled = a3;
}

@end