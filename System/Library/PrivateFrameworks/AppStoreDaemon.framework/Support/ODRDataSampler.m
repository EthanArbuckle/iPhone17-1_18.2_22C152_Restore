@interface ODRDataSampler
- (id)currentStatsString;
- (id)takeSample;
@end

@implementation ODRDataSampler

- (id)takeSample
{
  return 0;
}

- (id)currentStatsString
{
  v3 = sub_10034A538(self);
  v4 = sub_10034A5B8(self);
  v5 = sub_10034A4B8(self);
  v6 = +[NSString stringWithFormat:@"Min:%@, Max:%@, Avg:%@", v3, v4, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end