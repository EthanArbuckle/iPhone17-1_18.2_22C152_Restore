@interface NSValue(NSValueCMTimeExtensions)
+ (CMTimeAsValue)valueWithCMTime:()NSValueCMTimeExtensions;
+ (CMTimeMappingAsValue)valueWithCMTimeMapping:()NSValueCMTimeExtensions;
+ (CMTimeRangeAsValue)valueWithCMTimeRange:()NSValueCMTimeExtensions;
- (CMTime)CMTimeValue;
- (uint64_t)CMTimeMappingValue;
- (uint64_t)CMTimeRangeValue;
@end

@implementation NSValue(NSValueCMTimeExtensions)

+ (CMTimeRangeAsValue)valueWithCMTimeRange:()NSValueCMTimeExtensions
{
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  v5[2] = a3[2];
  return +[CMTimeRangeAsValue valueWithCMTimeRange:v5];
}

+ (CMTimeAsValue)valueWithCMTime:()NSValueCMTimeExtensions
{
  long long v4 = *a3;
  uint64_t v5 = *((void *)a3 + 2);
  return +[CMTimeAsValue valueWithCMTime:&v4];
}

- (CMTime)CMTimeValue
{
  long long v4 = (const char *)[a1 objCType];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (strcmp("{?=qiIq}", v4))
  {
    if (!strcmp("d", v4))
    {
      double v10 = 0.0;
      [a1 getValue:&v10];
      double v8 = v10;
    }
    else
    {
      result = (CMTime *)strcmp("f", v4);
      if (result)
      {
        uint64_t v6 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)a2 = *MEMORY[0x1E4F1F9F8];
        CMTimeEpoch epoch = *(void *)(v6 + 16);
LABEL_11:
        a2[2] = epoch;
        return result;
      }
      LODWORD(v10) = 0;
      [a1 getValue:&v10];
      double v8 = *(float *)&v10;
    }
    result = CMTimeMakeWithSeconds(&v9, v8, 1000000);
    *(_OWORD *)a2 = *(_OWORD *)&v9.value;
    CMTimeEpoch epoch = v9.epoch;
    goto LABEL_11;
  }
  return (CMTime *)[a1 getValue:a2];
}

- (uint64_t)CMTimeRangeValue
{
  long long v4 = (const char *)[a1 objCType];
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  uint64_t result = strcmp("{?={?=qiIq}{?=qiIq}}", v4);
  if (result)
  {
    uint64_t v6 = MEMORY[0x1E4F1FA20];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *a2 = *MEMORY[0x1E4F1FA20];
    a2[1] = v7;
    a2[2] = *(_OWORD *)(v6 + 32);
  }
  else
  {
    return [a1 getValue:a2];
  }
  return result;
}

+ (CMTimeMappingAsValue)valueWithCMTimeMapping:()NSValueCMTimeExtensions
{
  long long v3 = a3[3];
  v7[2] = a3[2];
  v7[3] = v3;
  long long v4 = a3[5];
  v7[4] = a3[4];
  v7[5] = v4;
  long long v5 = a3[1];
  v7[0] = *a3;
  v7[1] = v5;
  return +[CMTimeMappingAsValue valueWithCMTimeMapping:v7];
}

- (uint64_t)CMTimeMappingValue
{
  long long v4 = (const char *)[a1 objCType];
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  uint64_t result = strcmp("{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}", v4);
  if (result)
  {
    uint64_t v6 = MEMORY[0x1E4F1FA20];
    long long v7 = *MEMORY[0x1E4F1FA20];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *a2 = *MEMORY[0x1E4F1FA20];
    a2[1] = v8;
    long long v9 = *(_OWORD *)(v6 + 32);
    a2[2] = v9;
    a2[3] = v7;
    a2[4] = v8;
    a2[5] = v9;
  }
  else
  {
    return [a1 getValue:a2];
  }
  return result;
}

@end