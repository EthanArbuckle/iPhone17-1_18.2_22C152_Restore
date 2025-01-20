@interface AVTimeRangeForInterstitial
- (AVInterstitialTimeRange)interstice;
- (AVTimeRangeForInterstitial)initWithInterstice:(id)a3;
@end

@implementation AVTimeRangeForInterstitial

- (void).cxx_destruct
{
}

- (AVInterstitialTimeRange)interstice
{
  return (AVInterstitialTimeRange *)objc_getProperty(self, a2, 32, 1);
}

- (AVTimeRangeForInterstitial)initWithInterstice:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5) {
    [v5 timeRange];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  v11.receiver = self;
  v11.super_class = (Class)AVTimeRangeForInterstitial;
  v7 = [(AVTimeRange *)&v11 initWithCMTimeRange:v12];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interstice, a3);
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 startDate];
      if (v9)
      {
        [(AVTimeRange *)v8 startTime];
        -[AVTimeRange setMapTime:toDate:](v8, "setMapTime:toDate:", v9);
      }
    }
  }

  return v8;
}

@end