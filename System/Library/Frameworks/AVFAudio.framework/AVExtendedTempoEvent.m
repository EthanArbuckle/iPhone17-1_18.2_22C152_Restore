@interface AVExtendedTempoEvent
- (AVExtendedTempoEvent)initWithTempo:(double)tempo;
- (double)tempo;
- (void)setTempo:(double)tempo;
@end

@implementation AVExtendedTempoEvent

- (void)setTempo:(double)tempo
{
  self->_bpm = tempo;
}

- (double)tempo
{
  return self->_bpm;
}

- (AVExtendedTempoEvent)initWithTempo:(double)tempo
{
  v5.receiver = self;
  v5.super_class = (Class)AVExtendedTempoEvent;
  result = [(AVExtendedTempoEvent *)&v5 init];
  if (result) {
    result->_bpm = tempo;
  }
  return result;
}

@end