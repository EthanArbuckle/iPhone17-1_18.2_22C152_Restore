@interface OriginalSwitchesState
- (float)volume;
- (int)listeningMode;
- (void)setListeningMode:(int)a3;
- (void)setVolume:(float)a3;
@end

@implementation OriginalSwitchesState

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (int)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(int)a3
{
  self->_listeningMode = a3;
}

@end