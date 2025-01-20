@interface ASDTUtils
+ (id)latencyFramesForSamplingRate:(id)a3 andMicroseconds:(id)a4;
+ (unsigned)latencyFramesIntForSamplingRate:(double)a3 andMicroseconds:(unsigned int)a4;
@end

@implementation ASDTUtils

+ (unsigned)latencyFramesIntForSamplingRate:(double)a3 andMicroseconds:(unsigned int)a4
{
  return vcvtpd_u64_f64((double)a4 * a3 / 1000000.0);
}

+ (id)latencyFramesForSamplingRate:(id)a3 andMicroseconds:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = NSNumber;
  [v5 doubleValue];
  v9 = objc_msgSend(v7, "numberWithUnsignedInt:", +[ASDTUtils latencyFramesIntForSamplingRate:andMicroseconds:](ASDTUtils, "latencyFramesIntForSamplingRate:andMicroseconds:", objc_msgSend(v6, "unsignedIntValue"), v8));

  return v9;
}

@end