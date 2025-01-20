@interface BWIOSurfaceCompressionStatisticsAnalyticsPayload
- (float)averageRatio;
- (float)maxRatio;
- (float)minRatio;
- (float)standardDeviation;
- (id)eventDictionary;
- (id)eventName;
- (int)compressionType;
- (int)nodeType;
- (unint64_t)totalCompressedSize;
- (unint64_t)totalUncompressedSize;
- (unsigned)bufferHeight;
- (unsigned)numberOfSamples;
- (void)setAverageRatio:(float)a3;
- (void)setBufferHeight:(unsigned int)a3;
- (void)setCompressionType:(int)a3;
- (void)setMaxRatio:(float)a3;
- (void)setMinRatio:(float)a3;
- (void)setNodeType:(int)a3;
- (void)setNumberOfSamples:(unsigned int)a3;
- (void)setStandardDeviation:(float)a3;
- (void)setTotalCompressedSize:(unint64_t)a3;
- (void)setTotalUncompressedSize:(unint64_t)a3;
@end

@implementation BWIOSurfaceCompressionStatisticsAnalyticsPayload

- (id)eventName
{
  return @"com.apple.coremedia.camera.IOSurfaceStats";
}

- (id)eventDictionary
{
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_averageRatio;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v4), @"avgRatio");
  *(float *)&double v5 = self->_minRatio;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v5), @"minRatio");
  *(float *)&double v6 = self->_maxRatio;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"maxRatio");
  *(float *)&double v7 = self->_standardDeviation;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v7), @"stdDev");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_compressionType), @"compressionType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfSamples), @"numFrames");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_totalCompressedSize), @"totalCompressedSize");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_totalUncompressedSize), @"totalUncompressedSize");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_nodeType), @"nodeType");
  unsigned int bufferHeight = self->_bufferHeight;
  if (bufferHeight - 1080 < 0x438) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2 * (bufferHeight > 0x86F);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9), @"resolution");
  return v3;
}

- (float)averageRatio
{
  return self->_averageRatio;
}

- (void)setAverageRatio:(float)a3
{
  self->_averageRatio = a3;
}

- (float)minRatio
{
  return self->_minRatio;
}

- (void)setMinRatio:(float)a3
{
  self->_minRatio = a3;
}

- (float)maxRatio
{
  return self->_maxRatio;
}

- (void)setMaxRatio:(float)a3
{
  self->_maxRatio = a3;
}

- (float)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(float)a3
{
  self->_standardDeviation = a3;
}

- (int)compressionType
{
  return self->_compressionType;
}

- (void)setCompressionType:(int)a3
{
  self->_compressionType = a3;
}

- (unsigned)bufferHeight
{
  return self->_bufferHeight;
}

- (void)setBufferHeight:(unsigned int)a3
{
  self->_unsigned int bufferHeight = a3;
}

- (unsigned)numberOfSamples
{
  return self->_numberOfSamples;
}

- (void)setNumberOfSamples:(unsigned int)a3
{
  self->_numberOfSamples = a3;
}

- (unint64_t)totalCompressedSize
{
  return self->_totalCompressedSize;
}

- (void)setTotalCompressedSize:(unint64_t)a3
{
  self->_totalCompressedSize = a3;
}

- (unint64_t)totalUncompressedSize
{
  return self->_totalUncompressedSize;
}

- (void)setTotalUncompressedSize:(unint64_t)a3
{
  self->_totalUncompressedSize = a3;
}

- (int)nodeType
{
  return self->_nodeType;
}

- (void)setNodeType:(int)a3
{
  self->_nodeType = a3;
}

@end