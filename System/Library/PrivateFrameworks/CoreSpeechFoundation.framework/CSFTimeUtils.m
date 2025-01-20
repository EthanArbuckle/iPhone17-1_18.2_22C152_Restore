@interface CSFTimeUtils
+ (BOOL)isReceivedTimeInterval:(double)a3 matchCurrentTimeInterval:(double)a4;
+ (double)getHostClockFrequency;
+ (double)hostTimeToTimeInterval:(unint64_t)a3;
+ (float)hostTimeToSeconds:(unint64_t)a3;
+ (unint64_t)absoluteHostTimeToContinuousHostTime:(unint64_t)a3;
+ (unint64_t)convertSampleCountToNs:(unint64_t)a3 sampleRate:(float)a4;
+ (unint64_t)hostTimeFromSampleCount:(unint64_t)a3 anchorHostTime:(unint64_t)a4 anchorSampleCount:(unint64_t)a5 sampleRate:(float)a6;
+ (unint64_t)hostTimeToNs:(unint64_t)a3;
+ (unint64_t)macHostTimeFromBridgeHostTime:(unint64_t)a3;
+ (unint64_t)millisecondsToNs:(float)a3;
+ (unint64_t)sampleCountFromHostTime:(unint64_t)a3 anchorHostTime:(unint64_t)a4 anchorSampleCount:(unint64_t)a5 sampleRate:(float)a6;
+ (unint64_t)secondsToHostTime:(float)a3;
+ (unint64_t)secondsToNs:(float)a3;
@end

@implementation CSFTimeUtils

+ (unint64_t)absoluteHostTimeToContinuousHostTime:(unint64_t)a3
{
  uint64_t v3 = mach_continuous_time() + a3;
  return v3 - mach_absolute_time();
}

+ (unint64_t)hostTimeToNs:(unint64_t)a3
{
  [a1 hostTimeToTimeInterval:a3];
  return (unint64_t)(v3 * 1000000000.0);
}

+ (unint64_t)millisecondsToNs:(float)a3
{
  return (unint64_t)(float)((float)(a3 / 1000.0) * 1000000000.0);
}

+ (unint64_t)secondsToNs:(float)a3
{
  return (unint64_t)(float)(a3 * 1000000000.0);
}

+ (unint64_t)convertSampleCountToNs:(unint64_t)a3 sampleRate:(float)a4
{
  return (unint64_t)((double)a3 / a4 * 1000000000.0);
}

+ (BOOL)isReceivedTimeInterval:(double)a3 matchCurrentTimeInterval:(double)a4
{
  return vabdd_f64(a3, a4) < 2.22044605e-16;
}

+ (unint64_t)macHostTimeFromBridgeHostTime:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315138;
    v7 = "+[CSFTimeUtils macHostTimeFromBridgeHostTime:]";
    _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Not supported on this platform", (uint8_t *)&v6, 0xCu);
  }
  return a3;
}

+ (unint64_t)sampleCountFromHostTime:(unint64_t)a3 anchorHostTime:(unint64_t)a4 anchorSampleCount:(unint64_t)a5 sampleRate:(float)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v9 = a6;
  [a1 getHostClockFrequency];
  int64_t v11 = llround(v9 / v10 * (double)(uint64_t)(a4 - a3));
  unint64_t result = a5 - v11;
  if ((uint64_t)a5 < v11)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "+[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:]";
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Delta is larger than anchorSampleCount", (uint8_t *)&v14, 0xCu);
    }
    return 0;
  }
  return result;
}

+ (unint64_t)hostTimeFromSampleCount:(unint64_t)a3 anchorHostTime:(unint64_t)a4 anchorSampleCount:(unint64_t)a5 sampleRate:(float)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [a1 getHostClockFrequency];
  int64_t v11 = llround(v10 / a6 * (double)(uint64_t)(a5 - a3));
  unint64_t result = a4 - v11;
  if ((uint64_t)a4 < v11)
  {
    v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315906;
      v15 = "+[CSFTimeUtils hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:]";
      __int16 v16 = 2050;
      unint64_t v17 = a5;
      __int16 v18 = 2050;
      unint64_t v19 = a3;
      __int16 v20 = 2050;
      unint64_t v21 = a4;
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Delta is larger than anchorHostTime: anchorSampleCount = %{public}lld, sampleTime = %{public}lld, anchorHostTime = %{public}lld", (uint8_t *)&v14, 0x2Au);
    }
    return 0;
  }
  return result;
}

+ (double)getHostClockFrequency
{
  if (getHostClockFrequency_onceToken != -1) {
    dispatch_once(&getHostClockFrequency_onceToken, &__block_literal_global_6633);
  }
  return *(double *)&getHostClockFrequency_frequency;
}

double __37__CSFTimeUtils_getHostClockFrequency__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if (info.numer)
  {
    LODWORD(result) = info.denom;
    double result = (double)*(unint64_t *)&result / (double)info.numer * 1000000000.0;
    getHostClockFrequency_frequency = *(void *)&result;
  }
  return result;
}

+ (double)hostTimeToTimeInterval:(unint64_t)a3
{
  double v3 = (double)a3;
  +[CSFTimeUtils getHostClockFrequency];
  return v3 / v4;
}

+ (float)hostTimeToSeconds:(unint64_t)a3
{
  double v3 = (double)a3;
  +[CSFTimeUtils getHostClockFrequency];
  return v3 / v4;
}

+ (unint64_t)secondsToHostTime:(float)a3
{
  double v3 = a3;
  +[CSFTimeUtils getHostClockFrequency];
  return (unint64_t)(v4 * v3);
}

@end