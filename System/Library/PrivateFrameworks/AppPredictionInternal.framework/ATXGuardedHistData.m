@interface ATXGuardedHistData
- (ATXGuardedHistData)initWithHistogramData:(id)a3 bucketCount:(unsigned __int16)a4 filter:(BOOL)a5;
@end

@implementation ATXGuardedHistData

- (ATXGuardedHistData)initWithHistogramData:(id)a3 bucketCount:(unsigned __int16)a4 filter:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXGuardedHistData;
  v9 = [(ATXGuardedHistData *)&v13 init];
  if (v9)
  {
    if (v8) {
      v10 = (ATXHistogramData *)v8;
    }
    else {
      v10 = (ATXHistogramData *)objc_opt_new();
    }
    histogramData = v9->_histogramData;
    v9->_histogramData = v10;

    v9->_bucketCount = a4;
    v9->_filter = a5;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end