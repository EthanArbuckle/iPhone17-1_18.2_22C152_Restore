@interface HKAudiogramChartPoint
+ (double)axisValueFromFrequency:(double)a3;
+ (double)frequencyFromAxisValue:(double)a3;
+ (id)_chartPointFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4;
+ (id)chartPointsFromSensitivityPoints:(id)a3 isLeftEar:(BOOL)a4;
- (HKAudiogramChartData)chartData;
- (HKAudiogramChartPoint)initWithChartData:(id)a3;
- (NSNumber)xValue;
- (NSNumber)yValue;
- (id)allYValues;
@end

@implementation HKAudiogramChartPoint

- (HKAudiogramChartPoint)initWithChartData:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HKAudiogramChartPoint;
  v6 = [(HKAudiogramChartPoint *)&v22 init];
  if (v6)
  {
    v7 = NSNumber;
    [v5 frequencyHertz];
    +[HKAudiogramChartPoint axisValueFromFrequency:](HKAudiogramChartPoint, "axisValueFromFrequency:");
    uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
    xValue = v6->_xValue;
    v6->_xValue = (NSNumber *)v8;

    v10 = [MEMORY[0x1E4F2B860] sharedBehavior];
    v11 = [v10 features];
    if ([v11 yodel])
    {
      v12 = [v5 clampedSensitivityDBHL];

      if (v12)
      {
        v13 = NSNumber;
        v14 = [v5 clampedSensitivityDBHL];
        [v14 doubleValue];
        uint64_t v16 = [v13 numberWithDouble:-v15];
        yValue = v6->_yValue;
        v6->_yValue = (NSNumber *)v16;

LABEL_7:
        objc_storeStrong((id *)&v6->_chartData, a3);
        goto LABEL_8;
      }
    }
    else
    {
    }
    v18 = NSNumber;
    [v5 sensitivityDBHL];
    uint64_t v20 = [v18 numberWithDouble:-v19];
    v14 = v6->_yValue;
    v6->_yValue = (NSNumber *)v20;
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

+ (double)axisValueFromFrequency:(double)a3
{
  return (log(a3) + -4.82831374) / 0.693147181;
}

+ (double)frequencyFromAxisValue:(double)a3
{
  return exp2(a3) * 125.0;
}

+ (id)chartPointsFromSensitivityPoints:(id)a3 isLeftEar:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__HKAudiogramChartPoint_chartPointsFromSensitivityPoints_isLeftEar___block_invoke;
  v6[3] = &__block_descriptor_41_e37__16__0__HKAudiogramSensitivityPoint_8l;
  v6[4] = a1;
  BOOL v7 = a4;
  v4 = objc_msgSend(a3, "hk_map:", v6);
  return v4;
}

uint64_t __68__HKAudiogramChartPoint_chartPointsFromSensitivityPoints_isLeftEar___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _chartPointFromSensitivityPoint:a2 isLeftEar:*(unsigned __int8 *)(a1 + 40)];
}

- (id)allYValues
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HKAudiogramChartPoint *)self yValue];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_chartPointFromSensitivityPoint:(id)a3 isLeftEar:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 frequency];
  BOOL v7 = [MEMORY[0x1E4F2B618] hertzUnit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  v10 = [v5 tests];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__HKAudiogramChartPoint__chartPointFromSensitivityPoint_isLeftEar___block_invoke;
  v16[3] = &__block_descriptor_40_e36_B16__0__HKAudiogramSensitivityTest_8l;
  v16[4] = !v4;
  v11 = objc_msgSend(v10, "hk_filter:", v16);
  v12 = [v11 firstObject];

  if (v12)
  {
    v13 = [[HKAudiogramChartData alloc] initWithFrequency:v12 test:v9];
    v14 = [[HKAudiogramChartPoint alloc] initWithChartData:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

BOOL __67__HKAudiogramChartPoint__chartPointFromSensitivityPoint_isLeftEar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 side] == *(void *)(a1 + 32);
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (HKAudiogramChartData)chartData
{
  return self->_chartData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end