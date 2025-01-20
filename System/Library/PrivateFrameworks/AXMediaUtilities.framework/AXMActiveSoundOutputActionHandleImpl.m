@interface AXMActiveSoundOutputActionHandleImpl
- (AXMActiveSound)activeSound;
- (AXMActiveSoundOutputActionHandleImpl)init;
- (AXMSoundComponent)soundComponent;
- (float)pitch;
- (float)rate;
- (void)setActiveSound:(id)a3;
- (void)setPitch:(float)a3;
- (void)setQuantizedRate:(int64_t)a3;
- (void)setRate:(float)a3;
- (void)setSoundComponent:(id)a3;
- (void)stop;
@end

@implementation AXMActiveSoundOutputActionHandleImpl

- (AXMActiveSoundOutputActionHandleImpl)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXMActiveSoundOutputActionHandleImpl;
  v2 = [(AXMActiveSoundOutputActionHandleImpl *)&v7 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1065353216;
    [(AXMActiveSoundOutputActionHandleImpl *)v2 setRate:v3];
    LODWORD(v5) = 0;
    [(AXMActiveSoundOutputActionHandleImpl *)v4 setPitch:v5];
  }
  return v4;
}

- (void)setRate:(float)a3
{
  if (a3 <= 0.03125) {
    a3 = 0.03125;
  }
  if (a3 >= 32.0) {
    float v3 = 32.0;
  }
  else {
    float v3 = a3;
  }
  self->_rate = v3;
  id v6 = [(AXMActiveSoundOutputActionHandleImpl *)self activeSound];
  v4 = [v6 timePitch];
  *(float *)&double v5 = v3;
  [v4 setRate:v5];
}

- (void)setPitch:(float)a3
{
  if (a3 <= -2400.0) {
    a3 = -2400.0;
  }
  if (a3 >= 2400.0) {
    float v3 = 2400.0;
  }
  else {
    float v3 = a3;
  }
  self->_pitch = v3;
  id v6 = [(AXMActiveSoundOutputActionHandleImpl *)self activeSound];
  v4 = [v6 timePitch];
  *(float *)&double v5 = v3;
  [v4 setPitch:v5];
}

- (void)setQuantizedRate:(int64_t)a3
{
  if ((unint64_t)a3 <= 0xA)
  {
    LODWORD(v3) = dword_1B58AD4C0[a3];
    [(AXMActiveSoundOutputActionHandleImpl *)self setRate:v3];
  }
}

- (void)stop
{
  id v4 = [(AXMActiveSoundOutputActionHandleImpl *)self soundComponent];
  double v3 = [(AXMActiveSoundOutputActionHandleImpl *)self activeSound];
  [v4 _stopActiveSound:v3];
}

- (AXMActiveSound)activeSound
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeSound);

  return (AXMActiveSound *)WeakRetained;
}

- (void)setActiveSound:(id)a3
{
}

- (AXMSoundComponent)soundComponent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_soundComponent);

  return (AXMSoundComponent *)WeakRetained;
}

- (void)setSoundComponent:(id)a3
{
}

- (float)rate
{
  return self->_rate;
}

- (float)pitch
{
  return self->_pitch;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_soundComponent);

  objc_destroyWeak((id *)&self->_activeSound);
}

@end