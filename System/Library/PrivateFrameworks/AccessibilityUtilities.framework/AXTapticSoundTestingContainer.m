@interface AXTapticSoundTestingContainer
- (NSString)sound;
- (double)delay;
- (id)description;
- (void)setDelay:(double)a3;
- (void)setSound:(id)a3;
@end

@implementation AXTapticSoundTestingContainer

- (id)description
{
  v3 = NSString;
  v4 = [(AXTapticSoundTestingContainer *)self sound];
  [(AXTapticSoundTestingContainer *)self delay];
  v6 = [v3 stringWithFormat:@"%@ [delay: %f]", v4, v5];

  return v6;
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (void).cxx_destruct
{
}

@end