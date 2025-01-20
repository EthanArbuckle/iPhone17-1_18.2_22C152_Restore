@interface MPAVController
- (BOOL)isPlaying;
- (BOOL)shouldDisplayAsPlaying;
- (MPAVItem)currentItem;
- (double)currentTime;
- (float)rate;
- (id)addPeriodicTimeObserverForInterval:(double)a3 usingBlock:(id)a4;
- (int64_t)state;
- (void)setCurrentItem:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setShouldDisplayAsPlaying:(BOOL)a3;
- (void)setState:(int64_t)a3;
@end

@implementation MPAVController

- (void).cxx_destruct
{
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rate
{
  return self->_rate;
}

- (void)setShouldDisplayAsPlaying:(BOOL)a3
{
  self->_shouldDisplayAsPlaying = a3;
}

- (BOOL)shouldDisplayAsPlaying
{
  return self->_shouldDisplayAsPlaying;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setCurrentItem:(id)a3
{
}

- (MPAVItem)currentItem
{
  return self->_currentItem;
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 usingBlock:(id)a4
{
  return 0;
}

@end