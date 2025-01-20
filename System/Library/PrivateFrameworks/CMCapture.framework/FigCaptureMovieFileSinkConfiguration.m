@interface FigCaptureMovieFileSinkConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)trueVideoCaptureEnabled;
- (FigCaptureMovieFileSinkConfiguration)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)sinkType;
- (void)setTrueVideoCaptureEnabled:(BOOL)a3;
@end

@implementation FigCaptureMovieFileSinkConfiguration

- (FigCaptureMovieFileSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4) {
    v4->_trueVideoCaptureEnabled = xpc_dictionary_get_BOOL(a3, "trueVideoCaptureEnabled");
  }
  return v4;
}

- (id)copyXPCEncoding
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v5 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "trueVideoCaptureEnabled", [(FigCaptureMovieFileSinkConfiguration *)self trueVideoCaptureEnabled]);
  return v3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  return (id)[NSString stringWithFormat:@"%@ trueVideo:%d", -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureMovieFileSinkConfiguration trueVideoCaptureEnabled](self, "trueVideoCaptureEnabled")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  id v4 = [(FigCaptureSinkConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setTrueVideoCaptureEnabled:", -[FigCaptureMovieFileSinkConfiguration trueVideoCaptureEnabled](self, "trueVideoCaptureEnabled"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FigCaptureMovieFileSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [(FigCaptureMovieFileSinkConfiguration *)self trueVideoCaptureEnabled];
      LOBYTE(v5) = v6 ^ [a3 trueVideoCaptureEnabled] ^ 1;
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
  return 4;
}

- (BOOL)trueVideoCaptureEnabled
{
  return self->_trueVideoCaptureEnabled;
}

- (void)setTrueVideoCaptureEnabled:(BOOL)a3
{
  self->_trueVideoCaptureEnabled = a3;
}

@end