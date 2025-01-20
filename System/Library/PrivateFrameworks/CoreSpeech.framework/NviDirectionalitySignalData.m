@interface NviDirectionalitySignalData
+ (id)headerString;
- (NSArray)spatialSpectrumData;
- (NSDictionary)azDistribution;
- (NviDirectionalitySignalData)initWithStartSample:(unint64_t)a3 endSample:(unint64_t)a4 confidence:(float)a5 azimuth:(float)a6 estimatedAzimuth:(float)a7;
- (double)processedAudioDurMs;
- (float)azimuth;
- (float)confidence;
- (float)estimatedAzimuth;
- (float)mostSampledAzimuth;
- (id)_spatialSpectrumLogStr;
- (id)description;
- (id)stringForLogging;
- (unint64_t)endSample;
- (unint64_t)startSample;
- (void)setAzDistribution:(id)a3;
- (void)setAzimuth:(float)a3;
- (void)setConfidence:(float)a3;
- (void)setEndSample:(unint64_t)a3;
- (void)setEstimatedAzimuth:(float)a3;
- (void)setProcessedAudioDurMs:(double)a3;
- (void)setSpatialSpectrumData:(id)a3;
- (void)setStartSample:(unint64_t)a3;
@end

@implementation NviDirectionalitySignalData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_azDistribution, 0);
  objc_storeStrong((id *)&self->_spatialSpectrumData, 0);
}

- (void)setAzDistribution:(id)a3
{
}

- (NSDictionary)azDistribution
{
  return self->_azDistribution;
}

- (void)setSpatialSpectrumData:(id)a3
{
}

- (NSArray)spatialSpectrumData
{
  return self->_spatialSpectrumData;
}

- (void)setProcessedAudioDurMs:(double)a3
{
  self->_processedAudioDurMs = a3;
}

- (double)processedAudioDurMs
{
  return self->_processedAudioDurMs;
}

- (void)setEstimatedAzimuth:(float)a3
{
  self->_estimatedAzimuth = a3;
}

- (float)estimatedAzimuth
{
  return self->_estimatedAzimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setEndSample:(unint64_t)a3
{
  self->_endSample = a3;
}

- (unint64_t)endSample
{
  return self->_endSample;
}

- (void)setStartSample:(unint64_t)a3
{
  self->_startSample = a3;
}

- (unint64_t)startSample
{
  return self->_startSample;
}

- (id)_spatialSpectrumLogStr
{
  NSUInteger v3 = [(NSArray *)self->_spatialSpectrumData count];
  uint64_t v4 = [NSString stringWithFormat:@",%d, ", v3];
  v5 = (void *)v4;
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v7 = [(NSArray *)self->_spatialSpectrumData objectAtIndex:i];
      [v7 floatValue];
      v9 = [v5 stringByAppendingFormat:@"%f, ", v8];

      v5 = v9;
    }
  }
  else
  {
    v9 = (void *)v4;
  }
  return v9;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)NviDirectionalitySignalData;
  NSUInteger v3 = [(NviSignalData *)&v6 description];
  uint64_t v4 = [NSString stringWithFormat:@"{%@, {start=%lu, end=%lu, conf=%f, az=%f, estAz=%fdist=%@}", v3, self->_startSample, self->_endSample, self->_confidence, self->_azimuth, self->_estimatedAzimuth, self->_azDistribution];

  return v4;
}

- (id)stringForLogging
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu,%f,%lu,%lu,%f,%f,%f,", -[NviSignalData sigGenTs](self, "sigGenTs"), *(void *)&self->_processedAudioDurMs, self->_startSample, self->_endSample, self->_azimuth, self->_estimatedAzimuth, self->_confidence);
}

- (float)mostSampledAzimuth
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  NSUInteger v3 = self->_azDistribution;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = -[NSDictionary objectForKeyedSubscript:](self->_azDistribution, "objectForKeyedSubscript:", v10, (void)v15);
        unint64_t v12 = [v11 unsignedIntegerValue];

        if (v12 > v6)
        {
          [v10 floatValue];
          float v8 = v13;
          unint64_t v6 = v12;
        }
      }
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    float v8 = 0.0;
  }

  return v8;
}

- (NviDirectionalitySignalData)initWithStartSample:(unint64_t)a3 endSample:(unint64_t)a4 confidence:(float)a5 azimuth:(float)a6 estimatedAzimuth:(float)a7
{
  uint64_t v13 = mach_absolute_time();
  v19.receiver = self;
  v19.super_class = (Class)NviDirectionalitySignalData;
  v14 = [(NviSignalData *)&v19 initWithSignalType:4 timestamp:v13];
  long long v15 = v14;
  if (v14)
  {
    v14->_startSample = a3;
    v14->_endSample = a4;
    v14->_confidence = a5;
    v14->_azimuth = a6;
    v14->_estimatedAzimuth = a7;
    long long v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    spatialSpectrumData = v15->_spatialSpectrumData;
    v15->_spatialSpectrumData = v16;
  }
  return v15;
}

+ (id)headerString
{
  return (id)[NSString stringWithFormat:@"SignalTs, ProcessedAudioMs, StartSample, EndSample, Azimuth, EmaAzimuth, Confidence, SpatialSpreadSpectrum\n"];
}

@end