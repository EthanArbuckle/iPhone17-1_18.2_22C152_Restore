@interface AXMOutputManagerConfiguration
- (BOOL)hapticEngineUsesAutoShutdown;
- (BOOL)hapticEngineUsesHapticsOnly;
- (BOOL)usesPrivateAudioSession;
- (double)hapticEngineAutoShutdownTimeout;
- (id)description;
- (unint64_t)components;
- (void)setComponents:(unint64_t)a3;
- (void)setHapticEngineAutoShutdownTimeout:(double)a3;
- (void)setHapticEngineUsesAutoShutdown:(BOOL)a3;
- (void)setHapticEngineUsesHapticsOnly:(BOOL)a3;
- (void)setUsesPrivateAudioSession:(BOOL)a3;
@end

@implementation AXMOutputManagerConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  unint64_t components = self->_components;
  if (components)
  {
    [v3 addObject:@"Speech"];
    unint64_t components = self->_components;
    if ((components & 2) == 0)
    {
LABEL_3:
      if ((components & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((components & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"Sounds"];
  if ((self->_components & 4) != 0) {
LABEL_4:
  }
    [v4 addObject:@"Haptics"];
LABEL_5:
  v6 = NSString;
  v7 = [v4 componentsJoinedByString:@", "];
  v8 = [v6 stringWithFormat:@"[%@] usesPrivateAudioSession=%ld hapticEngineUsesAutoShutdown=%ld hapticEngineAutoShutdownTimeout=%.2f hapticEngineUsesHapticsOnly=%ld", v7, self->_usesPrivateAudioSession, self->_hapticEngineUsesAutoShutdown, *(void *)&self->_hapticEngineAutoShutdownTimeout, self->_hapticEngineUsesHapticsOnly];

  return v8;
}

- (unint64_t)components
{
  return self->_components;
}

- (void)setComponents:(unint64_t)a3
{
  self->_unint64_t components = a3;
}

- (BOOL)usesPrivateAudioSession
{
  return self->_usesPrivateAudioSession;
}

- (void)setUsesPrivateAudioSession:(BOOL)a3
{
  self->_usesPrivateAudioSession = a3;
}

- (BOOL)hapticEngineUsesAutoShutdown
{
  return self->_hapticEngineUsesAutoShutdown;
}

- (void)setHapticEngineUsesAutoShutdown:(BOOL)a3
{
  self->_hapticEngineUsesAutoShutdown = a3;
}

- (double)hapticEngineAutoShutdownTimeout
{
  return self->_hapticEngineAutoShutdownTimeout;
}

- (void)setHapticEngineAutoShutdownTimeout:(double)a3
{
  self->_hapticEngineAutoShutdownTimeout = a3;
}

- (BOOL)hapticEngineUsesHapticsOnly
{
  return self->_hapticEngineUsesHapticsOnly;
}

- (void)setHapticEngineUsesHapticsOnly:(BOOL)a3
{
  self->_hapticEngineUsesHapticsOnly = a3;
}

@end