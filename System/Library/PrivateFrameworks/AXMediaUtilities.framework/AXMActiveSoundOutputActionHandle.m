@interface AXMActiveSoundOutputActionHandle
- (AXMActiveSoundOutputActionHandleProvider)handleProvider;
- (float)pitch;
- (float)rate;
- (void)setHandleProvider:(id)a3;
- (void)setPitch:(float)a3;
- (void)setQuantizedRate:(int64_t)a3;
- (void)setRate:(float)a3;
- (void)stop;
@end

@implementation AXMActiveSoundOutputActionHandle

- (void)stop
{
  id v2 = [(AXMActiveSoundOutputActionHandle *)self handleProvider];
  [v2 stop];
}

- (float)pitch
{
  id v2 = [(AXMActiveSoundOutputActionHandle *)self handleProvider];
  [v2 pitch];
  float v4 = v3;

  return v4;
}

- (void)setPitch:(float)a3
{
  id v5 = [(AXMActiveSoundOutputActionHandle *)self handleProvider];
  *(float *)&double v4 = a3;
  [v5 setPitch:v4];
}

- (float)rate
{
  id v2 = [(AXMActiveSoundOutputActionHandle *)self handleProvider];
  [v2 rate];
  float v4 = v3;

  return v4;
}

- (void)setRate:(float)a3
{
  id v5 = [(AXMActiveSoundOutputActionHandle *)self handleProvider];
  *(float *)&double v4 = a3;
  [v5 setRate:v4];
}

- (void)setQuantizedRate:(int64_t)a3
{
  id v4 = [(AXMActiveSoundOutputActionHandle *)self handleProvider];
  [v4 setQuantizedRate:a3];
}

- (AXMActiveSoundOutputActionHandleProvider)handleProvider
{
  return self->_handleProvider;
}

- (void)setHandleProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end