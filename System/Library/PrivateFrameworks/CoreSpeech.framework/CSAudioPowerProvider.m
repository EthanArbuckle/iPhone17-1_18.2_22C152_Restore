@interface CSAudioPowerProvider
+ (CSAudioPowerProvider)sharedInstance;
- (CSAudioPowerProvider)init;
- (void)getAudioPowerUpdateWithCompletion:(id)a3;
- (void)processAudioChunk:(id)a3;
- (void)processAudioChunkForTV:(id)a3;
@end

@implementation CSAudioPowerProvider

- (void).cxx_destruct
{
}

- (void)getAudioPowerUpdateWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, float, float))a3 + 2))(a3, 0, self->_cachedAvgPower, self->_cachedPeakPower);
  }
}

- (void)processAudioChunkForTV:(id)a3
{
  id v4 = a3;
  [v4 avgPower];
  self->_cachedAvgPower = v5;
  [v4 peakPower];
  float v7 = v6;

  self->_cachedPeakPower = v7;
}

- (void)processAudioChunk:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[CSConfig inputRecordingIsFloat];
  powerMeter = self->_powerMeter;
  id v7 = [v4 data];
  id v8 = [v7 bytes];
  id v9 = [v4 numSamples];

  if (v5) {
    [(CSAudioPowerMeter *)powerMeter processFloatBuffer:v8 stride:1 inFrameToProcess:v9];
  }
  else {
    [(CSAudioPowerMeter *)powerMeter processShortBuffer:v8 stride:1 inFrameToProcess:v9];
  }

  [(CSAudioPowerMeter *)self->_powerMeter getAveragePowerDB];
  *(float *)&double v10 = v10;
  self->_cachedAvgPower = *(float *)&v10;
  [(CSAudioPowerMeter *)self->_powerMeter getPeakPowerDB];
  *(float *)&double v11 = v11;
  self->_cachedPeakPower = *(float *)&v11;
}

- (CSAudioPowerProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSAudioPowerProvider;
  v2 = [(CSAudioPowerProvider *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)CSAudioPowerMeter);
    +[CSConfig inputRecordingSampleRate];
    id v4 = (CSAudioPowerMeter *)objc_msgSend(v3, "initWithSampleRate:");
    powerMeter = v2->_powerMeter;
    v2->_powerMeter = v4;

    [(CSAudioPowerMeter *)v2->_powerMeter getAveragePowerDB];
    *(float *)&double v6 = v6;
    v2->_cachedAvgPower = *(float *)&v6;
    [(CSAudioPowerMeter *)v2->_powerMeter getPeakPowerDB];
    *(float *)&double v7 = v7;
    v2->_cachedPeakPower = *(float *)&v7;
  }
  return v2;
}

+ (CSAudioPowerProvider)sharedInstance
{
  if (qword_1002A3BC8 != -1) {
    dispatch_once(&qword_1002A3BC8, &stru_100252AB0);
  }
  v2 = (void *)qword_1002A3BC0;
  return (CSAudioPowerProvider *)v2;
}

@end