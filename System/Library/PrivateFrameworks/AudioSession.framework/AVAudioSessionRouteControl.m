@interface AVAudioSessionRouteControl
- (NSNumber)constantOutputVolumeLeveldB;
- (unint64_t)routeControlOptions;
- (void)setConstantOutputVolumeLeveldB:(id)a3;
- (void)setRouteControlOptions:(unint64_t)a3;
@end

@implementation AVAudioSessionRouteControl

- (unint64_t)routeControlOptions
{
  return self->routeControlOptions;
}

- (void)setRouteControlOptions:(unint64_t)a3
{
  self->routeControlOptions = a3;
}

- (NSNumber)constantOutputVolumeLeveldB
{
  return self->constantOutputVolumeLeveldB;
}

- (void)setConstantOutputVolumeLeveldB:(id)a3
{
}

- (void).cxx_destruct
{
}

@end