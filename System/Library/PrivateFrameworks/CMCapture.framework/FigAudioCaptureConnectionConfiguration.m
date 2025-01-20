@interface FigAudioCaptureConnectionConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)windNoiseRemovalEnabled;
- (FigAudioCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3;
- (double)builtInMicrophoneRequiredSampleRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)audioCaptureMode;
- (int)builtInMicrophonePosition;
- (void)setAudioCaptureMode:(int)a3;
- (void)setBuiltInMicrophonePosition:(int)a3;
- (void)setBuiltInMicrophoneRequiredSampleRate:(double)a3;
- (void)setWindNoiseRemovalEnabled:(BOOL)a3;
@end

@implementation FigAudioCaptureConnectionConfiguration

- (id)copyXPCEncoding
{
  v6.receiver = self;
  v6.super_class = (Class)FigAudioCaptureConnectionConfiguration;
  id v3 = [(FigCaptureConnectionConfiguration *)&v6 copyXPCEncoding];
  xpc_dictionary_set_int64(v3, "audioCaptureMode", [(FigAudioCaptureConnectionConfiguration *)self audioCaptureMode]);
  xpc_dictionary_set_int64(v3, "windNoiseRemovalEnabled", [(FigAudioCaptureConnectionConfiguration *)self windNoiseRemovalEnabled]);
  xpc_dictionary_set_int64(v3, "builtInMicrophonePosition", [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophonePosition]);
  [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophoneRequiredSampleRate];
  xpc_dictionary_set_double(v3, "builtInMicrophoneRequiredSampleRate", v4);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)FigAudioCaptureConnectionConfiguration;
  BOOL v5 = -[FigCaptureConnectionConfiguration isEqual:](&v13, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v6 = [(FigAudioCaptureConnectionConfiguration *)self audioCaptureMode],
          v6 == [a3 audioCaptureMode])
      && (int v7 = [(FigAudioCaptureConnectionConfiguration *)self windNoiseRemovalEnabled],
          v7 == [a3 windNoiseRemovalEnabled])
      && (int v8 = [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophonePosition],
          v8 == [a3 builtInMicrophonePosition]))
    {
      [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophoneRequiredSampleRate];
      double v10 = v9;
      [a3 builtInMicrophoneRequiredSampleRate];
      LOBYTE(v5) = v10 == v11;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAudioCaptureConnectionConfiguration;
  id v4 = [(FigCaptureConnectionConfiguration *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setAudioCaptureMode:", -[FigAudioCaptureConnectionConfiguration audioCaptureMode](self, "audioCaptureMode"));
  objc_msgSend(v4, "setWindNoiseRemovalEnabled:", -[FigAudioCaptureConnectionConfiguration windNoiseRemovalEnabled](self, "windNoiseRemovalEnabled"));
  objc_msgSend(v4, "setBuiltInMicrophonePosition:", -[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition"));
  [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophoneRequiredSampleRate];
  objc_msgSend(v4, "setBuiltInMicrophoneRequiredSampleRate:");
  return v4;
}

- (int)audioCaptureMode
{
  return *((_DWORD *)&self->super._enabled + 1);
}

- (double)builtInMicrophoneRequiredSampleRate
{
  return *(double *)&self->_builtInMicrophonePosition;
}

- (BOOL)windNoiseRemovalEnabled
{
  return self->_audioCaptureMode;
}

- (void)setBuiltInMicrophonePosition:(int)a3
{
  *(_DWORD *)&self->_windNoiseRemovalEnabled = a3;
}

- (void)setWindNoiseRemovalEnabled:(BOOL)a3
{
  LOBYTE(self->_audioCaptureMode) = a3;
}

- (void)setAudioCaptureMode:(int)a3
{
  *((_DWORD *)&self->super._enabled + 1) = a3;
}

- (void)setBuiltInMicrophoneRequiredSampleRate:(double)a3
{
  *(double *)&self->_builtInMicrophonePosition = a3;
}

- (id)description
{
  int v3 = [(FigAudioCaptureConnectionConfiguration *)self audioCaptureMode];
  if (v3 > 6) {
    id v4 = &stru_1EFA403E0;
  }
  else {
    id v4 = *(&off_1E5C29590 + v3);
  }
  if ([(FigAudioCaptureConnectionConfiguration *)self builtInMicrophonePosition]) {
    BOOL v5 = (__CFString *)[NSString stringWithFormat:@" (POSITION:%@)", +[FigCaptureSourceConfiguration stringForSourcePosition:](FigCaptureSourceConfiguration, "stringForSourcePosition:", -[FigAudioCaptureConnectionConfiguration builtInMicrophonePosition](self, "builtInMicrophonePosition"))];
  }
  else {
    BOOL v5 = &stru_1EFA403E0;
  }
  [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophoneRequiredSampleRate];
  if (v6 <= 0.0)
  {
    double v9 = &stru_1EFA403E0;
  }
  else
  {
    int v7 = NSString;
    [(FigAudioCaptureConnectionConfiguration *)self builtInMicrophoneRequiredSampleRate];
    double v9 = (__CFString *)[v7 stringWithFormat:@", SampleRate:%.2fHz", v8];
  }
  if ([(FigAudioCaptureConnectionConfiguration *)self windNoiseRemovalEnabled]) {
    double v10 = @"YES";
  }
  else {
    double v10 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"AC %p: <%@>%@ -> <%@>, E:%d%@, ACM:%@, WNR:%@", self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v5, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), v9, v4, v10];
}

- (int)builtInMicrophonePosition
{
  return *(_DWORD *)&self->_windNoiseRemovalEnabled;
}

- (FigAudioCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FigAudioCaptureConnectionConfiguration;
    id v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
    if (v4)
    {
      *((_DWORD *)&v4->super._enabled + 1) = xpc_dictionary_get_int64(a3, "audioCaptureMode");
      LOBYTE(v4->_audioCaptureMode) = xpc_dictionary_get_int64(a3, "windNoiseRemovalEnabled") != 0;
      *(_DWORD *)&v4->_windNoiseRemovalEnabled = xpc_dictionary_get_int64(a3, "builtInMicrophonePosition");
      *(double *)&v4->_builtInMicrophonePosition = xpc_dictionary_get_double(a3, "builtInMicrophoneRequiredSampleRate");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

@end