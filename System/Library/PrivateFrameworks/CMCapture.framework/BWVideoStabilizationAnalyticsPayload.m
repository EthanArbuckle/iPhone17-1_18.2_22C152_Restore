@interface BWVideoStabilizationAnalyticsPayload
- (BWVideoStabilizationAnalyticsPayload)init;
- (NSString)videoType;
- (float)maxUIZoom;
- (float)minUIZoom;
- (float)startingUIZoom;
- (id)eventDictionary;
- (id)eventName;
- (int)devicePosition;
- (int)height;
- (int)width;
- (unsigned)averageLuxValue;
- (void)dealloc;
- (void)reset;
- (void)setAverageLuxValue:(unsigned int)a3;
- (void)setDevicePosition:(int)a3;
- (void)setHeight:(int)a3;
- (void)setMaxUIZoom:(float)a3;
- (void)setMinUIZoom:(float)a3;
- (void)setOverscanHistogram:(id)a3 BinningFactor:(int)a4 Histogram:(id)a5;
- (void)setSigmaHistogram:(id)a3;
- (void)setStartingUIZoom:(float)a3;
- (void)setVideoType:(id)a3;
- (void)setWidth:(int)a3;
@end

@implementation BWVideoStabilizationAnalyticsPayload

- (BWVideoStabilizationAnalyticsPayload)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWVideoStabilizationAnalyticsPayload;
  v2 = [(BWVideoStabilizationAnalyticsPayload *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BWVideoStabilizationAnalyticsPayload *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  uint64_t v3 = 0;
  portType = self->_portType;
  do
  {

    portType[v3++] = 0;
  }
  while (v3 != 6);
  *(_OWORD *)&self->_overscanHistogram[0][0] = 0u;
  overscanHistogram = self->_overscanHistogram;
  (*overscanHistogram)[-26] = 0.0;
  *(void *)&(*overscanHistogram)[43] = 0;
  *(void *)&(*overscanHistogram)[-11] = 0;
  *(void *)&(*overscanHistogram)[-13] = 0;
  *(void *)&(*overscanHistogram)[-7] = 0;
  *(void *)&(*overscanHistogram)[-9] = 0;
  *(void *)&(*overscanHistogram)[-3] = 0;
  *(void *)&(*overscanHistogram)[-5] = 0;
  (*overscanHistogram)[-1] = 0.0;
  *(_OWORD *)&(*overscanHistogram)[4] = 0u;
  *(_OWORD *)&(*overscanHistogram)[8] = 0u;
  *(_OWORD *)&(*overscanHistogram)[12] = 0u;
  *(_OWORD *)&(*overscanHistogram)[16] = 0u;
  *(_OWORD *)&(*overscanHistogram)[20] = 0u;
  *(_OWORD *)&(*overscanHistogram)[24] = 0u;
  *(_OWORD *)&(*overscanHistogram)[28] = 0u;
  *(_OWORD *)&(*overscanHistogram)[32] = 0u;
  *(_OWORD *)&(*overscanHistogram)[36] = 0u;
  *(void *)&(*overscanHistogram)[40] = 0;
}

- (void)dealloc
{
  for (uint64_t i = 40; i != 88; i += 8)

  v4.receiver = self;
  v4.super_class = (Class)BWVideoStabilizationAnalyticsPayload;
  [(BWVideoStabilizationAnalyticsPayload *)&v4 dealloc];
}

- (void)setSigmaHistogram:(id)a3
{
  if ((unint64_t)[a3 count] > 6)
  {
    uint64_t v5 = 7;
  }
  else
  {
    uint64_t v5 = [a3 count];
    if (!v5) {
      return;
    }
  }
  uint64_t v6 = 0;
  sigmaHistogram = self->_sigmaHistogram;
  do
  {
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v6), "floatValue");
    sigmaHistogram[v6++] = v8;
  }
  while (v5 != v6);
}

- (void)setOverscanHistogram:(id)a3 BinningFactor:(int)a4 Histogram:(id)a5
{
  uint64_t count = self->_count;
  if (count <= 5)
  {
    self->_portType[count] = (NSString *)a3;
    self->_binningFactor[count] = a4;
    if ((unint64_t)[a5 count] > 6)
    {
      uint64_t v8 = 7;
    }
    else
    {
      uint64_t v8 = [a5 count];
      if (!v8)
      {
        unsigned int v9 = self->_count;
LABEL_8:
        self->_uint64_t count = v9 + 1;
        return;
      }
    }
    for (uint64_t i = 0; i != v8; ++i)
    {
      objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", i), "floatValue");
      unsigned int v9 = self->_count;
      self->_overscanHistogram[v9][i] = v11;
    }
    goto LABEL_8;
  }
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.VideoStabilizationAnalytics";
}

- (id)eventDictionary
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_devicePosition), @"devicePosition");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_height), @"height");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_width), @"width");
  *(float *)&double v4 = self->_startingUIZoom;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"startingUIZoom");
  *(float *)&double v5 = self->_minUIZoom;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"minUIZoom");
  *(float *)&double v6 = self->_maxUIZoom;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"maxUIZoom");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_averageLuxValue), @"averageLuxValue");
  [v3 setObject:self->_videoType forKeyedSubscript:@"videoType"];
  for (uint64_t i = 0; i != 7; ++i)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"sigmaHist%d", i);
    *(float *)&double v9 = self->_sigmaHistogram[i];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v9), v8);
  }
  if (self->_count)
  {
    unint64_t v10 = 0;
    overscanHistogram = self->_overscanHistogram;
    do
    {
      uint64_t v12 = 0;
      v13 = self->_portType[v10];
      uint64_t v14 = LOWORD(self->_binningFactor[v10]);
      do
      {
        uint64_t v15 = [(NSString *)v13 stringByAppendingFormat:@"%doverscanHist%d", v14, v12];
        *(float *)&double v16 = (*overscanHistogram)[v12];
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v16), v15);
        ++v12;
      }
      while (v12 != 7);
      ++v10;
      ++overscanHistogram;
    }
    while (v10 < self->_count);
  }
  return v3;
}

- (int)devicePosition
{
  return self->_devicePosition;
}

- (void)setDevicePosition:(int)a3
{
  self->_devicePosition = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (float)startingUIZoom
{
  return self->_startingUIZoom;
}

- (void)setStartingUIZoom:(float)a3
{
  self->_startingUIZoom = a3;
}

- (float)minUIZoom
{
  return self->_minUIZoom;
}

- (void)setMinUIZoom:(float)a3
{
  self->_minUIZoom = a3;
}

- (float)maxUIZoom
{
  return self->_maxUIZoom;
}

- (void)setMaxUIZoom:(float)a3
{
  self->_maxUIZoom = a3;
}

- (unsigned)averageLuxValue
{
  return self->_averageLuxValue;
}

- (void)setAverageLuxValue:(unsigned int)a3
{
  self->_averageLuxValue = a3;
}

- (NSString)videoType
{
  return self->_videoType;
}

- (void)setVideoType:(id)a3
{
}

@end