@interface HKAudiogramChartData
+ (id)_clampedSensitivityDBHLForSensitivityTest:(id)a3;
+ (id)_lowerClampedSensitivityDBHLForSensitivityTest:(id)a3;
+ (id)_upperClampedSensitivityDBHLForSensitivityTest:(id)a3;
- (BOOL)isLeftEar;
- (BOOL)isMasked;
- (HKAudiogramChartData)initWithFrequency:(double)a3 sensitivity:(double)a4 isLeftEar:(BOOL)a5;
- (HKAudiogramChartData)initWithFrequency:(double)a3 test:(id)a4;
- (NSNumber)clampedSensitivityDBHL;
- (NSNumber)lowerClampedSensitivityDBHL;
- (NSNumber)upperClampedSensitivityDBHL;
- (double)frequencyHertz;
- (double)sensitivityDBHL;
@end

@implementation HKAudiogramChartData

- (HKAudiogramChartData)initWithFrequency:(double)a3 sensitivity:(double)a4 isLeftEar:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HKAudiogramChartData;
  result = [(HKAudiogramChartData *)&v9 init];
  if (result)
  {
    result->_frequencyHertz = a3;
    result->_sensitivityDBHL = a4;
    result->_isLeftEar = a5;
  }
  return result;
}

- (HKAudiogramChartData)initWithFrequency:(double)a3 test:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKAudiogramChartData;
  v7 = [(HKAudiogramChartData *)&v19 init];
  v8 = v7;
  if (v7)
  {
    v7->_frequencyHertz = a3;
    objc_super v9 = [v6 sensitivity];
    v10 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
    [v9 doubleValueForUnit:v10];
    v8->_sensitivityDBHL = v11;

    uint64_t v12 = +[HKAudiogramChartData _clampedSensitivityDBHLForSensitivityTest:v6];
    clampedSensitivityDBHL = v8->_clampedSensitivityDBHL;
    v8->_clampedSensitivityDBHL = (NSNumber *)v12;

    uint64_t v14 = +[HKAudiogramChartData _upperClampedSensitivityDBHLForSensitivityTest:v6];
    upperClampedSensitivityDBHL = v8->_upperClampedSensitivityDBHL;
    v8->_upperClampedSensitivityDBHL = (NSNumber *)v14;

    uint64_t v16 = +[HKAudiogramChartData _lowerClampedSensitivityDBHLForSensitivityTest:v6];
    lowerClampedSensitivityDBHL = v8->_lowerClampedSensitivityDBHL;
    v8->_lowerClampedSensitivityDBHL = (NSNumber *)v16;

    v8->_isMasked = [v6 masked];
    v8->_isLeftEar = [v6 side] == 0;
  }

  return v8;
}

+ (id)_clampedSensitivityDBHLForSensitivityTest:(id)a3
{
  v3 = [a3 clampedSensitivity];
  if (v3)
  {
    v4 = NSNumber;
    v5 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
    [v3 doubleValueForUnit:v5];
    id v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_upperClampedSensitivityDBHLForSensitivityTest:(id)a3
{
  v3 = [a3 clampingRange];
  v4 = [v3 upperBound];

  if (v4)
  {
    v5 = NSNumber;
    id v6 = [v3 upperBound];
    v7 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
    [v6 doubleValueForUnit:v7];
    v4 = objc_msgSend(v5, "numberWithDouble:");
  }
  return v4;
}

+ (id)_lowerClampedSensitivityDBHLForSensitivityTest:(id)a3
{
  v3 = [a3 clampingRange];
  v4 = [v3 lowerBound];

  if (v4)
  {
    v5 = NSNumber;
    id v6 = [v3 lowerBound];
    v7 = [MEMORY[0x1E4F2B618] decibelHearingLevelUnit];
    [v6 doubleValueForUnit:v7];
    v4 = objc_msgSend(v5, "numberWithDouble:");
  }
  return v4;
}

- (double)frequencyHertz
{
  return self->_frequencyHertz;
}

- (double)sensitivityDBHL
{
  return self->_sensitivityDBHL;
}

- (NSNumber)clampedSensitivityDBHL
{
  return self->_clampedSensitivityDBHL;
}

- (NSNumber)upperClampedSensitivityDBHL
{
  return self->_upperClampedSensitivityDBHL;
}

- (NSNumber)lowerClampedSensitivityDBHL
{
  return self->_lowerClampedSensitivityDBHL;
}

- (BOOL)isMasked
{
  return self->_isMasked;
}

- (BOOL)isLeftEar
{
  return self->_isLeftEar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowerClampedSensitivityDBHL, 0);
  objc_storeStrong((id *)&self->_upperClampedSensitivityDBHL, 0);
  objc_storeStrong((id *)&self->_clampedSensitivityDBHL, 0);
}

@end