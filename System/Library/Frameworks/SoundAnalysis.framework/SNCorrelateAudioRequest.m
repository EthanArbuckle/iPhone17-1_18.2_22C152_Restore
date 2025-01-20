@interface SNCorrelateAudioRequest
- (SNCorrelateAudioRequest)init;
- (SNCorrelateAudioRequest)initWithAudioFile:(id)a3;
- (SNCorrelateAudioRequest)initWithAudioFile:(id)a3 overlapFactor:(double)a4;
- (double)overlapFactor;
- (void)setOverlapFactor:(double)a3;
@end

@implementation SNCorrelateAudioRequest

- (double)overlapFactor
{
  return sub_1DC92F9E0();
}

- (void)setOverlapFactor:(double)a3
{
  v4 = self;
  sub_1DC92FA4C(a3);
}

- (SNCorrelateAudioRequest)initWithAudioFile:(id)a3 overlapFactor:(double)a4
{
  return (SNCorrelateAudioRequest *)sub_1DC92FC14((uint64_t)a3, a4);
}

- (SNCorrelateAudioRequest)initWithAudioFile:(id)a3
{
  return (SNCorrelateAudioRequest *)sub_1DC92FCB0((uint64_t)a3);
}

- (SNCorrelateAudioRequest)init
{
}

- (void).cxx_destruct
{
}

@end