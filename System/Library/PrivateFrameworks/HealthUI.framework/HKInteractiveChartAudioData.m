@interface HKInteractiveChartAudioData
- (HKInteractiveChartAudioData)overviewData;
- (NSString)description;
- (double)averageLEQ;
- (double)duration;
- (id)_durationString:(double)a3;
- (void)setAverageLEQ:(double)a3;
- (void)setDuration:(double)a3;
- (void)setOverviewData:(id)a3;
@end

@implementation HKInteractiveChartAudioData

- (NSString)description
{
  [(HKInteractiveChartAudioData *)self duration];
  v3 = -[HKInteractiveChartAudioData _durationString:](self, "_durationString:");
  v4 = [(HKInteractiveChartAudioData *)self overviewData];
  if (v4)
  {
    v5 = [(HKInteractiveChartAudioData *)self overviewData];
    v6 = [v5 description];
  }
  else
  {
    v6 = @"nil";
  }

  v7 = NSString;
  [(HKInteractiveChartAudioData *)self averageLEQ];
  v9 = [v7 stringWithFormat:@"HKInteractiveChartAudioData(%p, average %.2f, duration %@, overview %@)", self, v8, v3, v6];

  return (NSString *)v9;
}

- (id)_durationString:(double)a3
{
  double v3 = floor(a3 / 3600.0);
  double v4 = a3 - v3 * 3600.0;
  double v5 = floor(v4 / 60.0);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%02.0f:%02.0f:%02.2f", *(void *)&v3, *(void *)&v5, v4 - v5 * 60.0);
}

- (double)averageLEQ
{
  return self->_averageLEQ;
}

- (void)setAverageLEQ:(double)a3
{
  self->_averageLEQ = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (HKInteractiveChartAudioData)overviewData
{
  return self->_overviewData;
}

- (void)setOverviewData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end