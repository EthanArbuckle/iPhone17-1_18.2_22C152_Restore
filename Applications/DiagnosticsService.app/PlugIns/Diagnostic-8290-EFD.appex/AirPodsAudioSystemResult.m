@interface AirPodsAudioSystemResult
- (NSArray)energyValues;
- (NSNumber)xCorrCenter;
- (NSNumber)xCorrPNR;
- (NSNumber)xCorrPeak;
- (id)dictionaryValue;
- (int64_t)audioTestType;
- (void)setAudioTestType:(int64_t)a3;
- (void)setEnergyValues:(id)a3;
- (void)setXCorrCenter:(id)a3;
- (void)setXCorrPNR:(id)a3;
- (void)setXCorrPeak:(id)a3;
@end

@implementation AirPodsAudioSystemResult

- (id)dictionaryValue
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  v17.receiver = self;
  v17.super_class = (Class)AirPodsAudioSystemResult;
  v4 = [(AudioSystemResult *)&v17 dictionaryValue];
  id v5 = [v3 initWithDictionary:v4];

  v6 = [(AirPodsAudioSystemResult *)self energyValues];
  if (v6)
  {
    [v5 setObject:v6 forKeyedSubscript:@"energyValues"];
  }
  else
  {
    v7 = +[NSNull null];
    [v5 setObject:v7 forKeyedSubscript:@"energyValues"];
  }
  v8 = [(AirPodsAudioSystemResult *)self xCorrPNR];
  if (v8)
  {
    [v5 setObject:v8 forKeyedSubscript:@"xCoorPNR"];
  }
  else
  {
    v9 = +[NSNull null];
    [v5 setObject:v9 forKeyedSubscript:@"xCoorPNR"];
  }
  v10 = [(AirPodsAudioSystemResult *)self xCorrPeak];
  if (v10)
  {
    [v5 setObject:v10 forKeyedSubscript:@"xCoorPeak"];
  }
  else
  {
    v11 = +[NSNull null];
    [v5 setObject:v11 forKeyedSubscript:@"xCoorPeak"];
  }
  v12 = [(AirPodsAudioSystemResult *)self xCorrCenter];
  if (v12)
  {
    [v5 setObject:v12 forKeyedSubscript:@"xCoorCenter"];
  }
  else
  {
    v13 = +[NSNull null];
    [v5 setObject:v13 forKeyedSubscript:@"xCoorCenter"];
  }
  v14 = +[NSNumber numberWithInteger:[(AirPodsAudioSystemResult *)self audioTestType]];
  [v5 setObject:v14 forKeyedSubscript:@"audioTestType"];

  id v15 = [v5 copy];

  return v15;
}

- (NSArray)energyValues
{
  return self->_energyValues;
}

- (void)setEnergyValues:(id)a3
{
}

- (NSNumber)xCorrPNR
{
  return self->_xCorrPNR;
}

- (void)setXCorrPNR:(id)a3
{
}

- (NSNumber)xCorrPeak
{
  return self->_xCorrPeak;
}

- (void)setXCorrPeak:(id)a3
{
}

- (NSNumber)xCorrCenter
{
  return self->_xCorrCenter;
}

- (void)setXCorrCenter:(id)a3
{
}

- (int64_t)audioTestType
{
  return self->_audioTestType;
}

- (void)setAudioTestType:(int64_t)a3
{
  self->_audioTestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xCorrCenter, 0);
  objc_storeStrong((id *)&self->_xCorrPeak, 0);
  objc_storeStrong((id *)&self->_xCorrPNR, 0);

  objc_storeStrong((id *)&self->_energyValues, 0);
}

@end