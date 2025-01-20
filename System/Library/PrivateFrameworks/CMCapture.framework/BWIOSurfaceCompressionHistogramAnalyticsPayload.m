@interface BWIOSurfaceCompressionHistogramAnalyticsPayload
- (BOOL)pixelFormatIsTenBit;
- (NSString)portType;
- (id)eventDictionary;
- (id)eventName;
- (int)nodeType;
- (unsigned)bufferHeight;
- (unsigned)numberOfSamples;
- (void)dealloc;
- (void)reset;
- (void)setBufferHeight:(unsigned int)a3;
- (void)setChromaCompressionHistogram:(unint64_t)a3[16];
- (void)setLumaCompressionHistogram:(unint64_t)a3[16];
- (void)setNodeType:(int)a3;
- (void)setNumberOfSamples:(unsigned int)a3;
- (void)setPixelFormatIsTenBit:(BOOL)a3;
- (void)setPortType:(id)a3;
@end

@implementation BWIOSurfaceCompressionHistogramAnalyticsPayload

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIOSurfaceCompressionHistogramAnalyticsPayload;
  [(BWIOSurfaceCompressionHistogramAnalyticsPayload *)&v3 dealloc];
}

- (void)reset
{
  self->_portType = 0;
  *(_OWORD *)self->_lumaCompressionHistogram = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[2] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[4] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[6] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[8] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[10] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[12] = 0u;
  *(_OWORD *)&self->_lumaCompressionHistogram[14] = 0u;
  *(_OWORD *)self->_chromaCompressionHistogram = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[2] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[4] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[6] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[8] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[10] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[12] = 0u;
  *(_OWORD *)&self->_chromaCompressionHistogram[14] = 0u;
}

- (void)setLumaCompressionHistogram:(unint64_t)a3[16]
{
  long long v3 = *(_OWORD *)a3;
  long long v4 = *((_OWORD *)a3 + 1);
  long long v5 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->_lumaCompressionHistogram[4] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->_lumaCompressionHistogram[6] = v5;
  *(_OWORD *)self->_lumaCompressionHistogram = v3;
  *(_OWORD *)&self->_lumaCompressionHistogram[2] = v4;
  long long v6 = *((_OWORD *)a3 + 4);
  long long v7 = *((_OWORD *)a3 + 5);
  long long v8 = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self->_lumaCompressionHistogram[12] = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self->_lumaCompressionHistogram[14] = v8;
  *(_OWORD *)&self->_lumaCompressionHistogram[8] = v6;
  *(_OWORD *)&self->_lumaCompressionHistogram[10] = v7;
}

- (void)setChromaCompressionHistogram:(unint64_t)a3[16]
{
  long long v3 = *(_OWORD *)a3;
  long long v4 = *((_OWORD *)a3 + 1);
  long long v5 = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->_chromaCompressionHistogram[4] = *((_OWORD *)a3 + 2);
  *(_OWORD *)&self->_chromaCompressionHistogram[6] = v5;
  *(_OWORD *)self->_chromaCompressionHistogram = v3;
  *(_OWORD *)&self->_chromaCompressionHistogram[2] = v4;
  long long v6 = *((_OWORD *)a3 + 4);
  long long v7 = *((_OWORD *)a3 + 5);
  long long v8 = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self->_chromaCompressionHistogram[12] = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self->_chromaCompressionHistogram[14] = v8;
  *(_OWORD *)&self->_chromaCompressionHistogram[8] = v6;
  *(_OWORD *)&self->_chromaCompressionHistogram[10] = v7;
}

- (id)eventName
{
  return @"com.apple.coremedia.camera.IOSurfaceCompressionHistogram";
}

- (id)eventDictionary
{
  long long v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_portType forKeyedSubscript:@"portType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->_nodeType), @"nodeType");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_pixelFormatIsTenBit), @"pixelFormatIsTenBit");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_numberOfSamples), @"numberOfSamples");
  unsigned int bufferHeight = self->_bufferHeight;
  if (bufferHeight - 1080 < 0x438) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (bufferHeight > 0x86F);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5), @"resolution");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", vaddvq_s64(vaddq_s64(*(int64x2_t *)self->_lumaCompressionHistogram, *(int64x2_t *)&self->_lumaCompressionHistogram[2]))), @"luma_128_to_512");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lumaCompressionHistogram[4]), @"luma_640");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lumaCompressionHistogram[5]), @"luma_768");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lumaCompressionHistogram[6]), @"luma_896");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lumaCompressionHistogram[7]), @"luma_1024");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lumaCompressionHistogram[8]), @"luma_1152");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_lumaCompressionHistogram[9]), @"luma_1280");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_chromaCompressionHistogram[1] + self->_chromaCompressionHistogram[0]), @"chroma_128_to_256");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_chromaCompressionHistogram[2]), @"chroma_384");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_chromaCompressionHistogram[3]), @"chroma_512");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", self->_chromaCompressionHistogram[4]), @"chroma_640");
  return v3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (unsigned)bufferHeight
{
  return self->_bufferHeight;
}

- (void)setBufferHeight:(unsigned int)a3
{
  self->_unsigned int bufferHeight = a3;
}

- (int)nodeType
{
  return self->_nodeType;
}

- (void)setNodeType:(int)a3
{
  self->_nodeType = a3;
}

- (BOOL)pixelFormatIsTenBit
{
  return self->_pixelFormatIsTenBit;
}

- (void)setPixelFormatIsTenBit:(BOOL)a3
{
  self->_pixelFormatIsTenBit = a3;
}

- (unsigned)numberOfSamples
{
  return self->_numberOfSamples;
}

- (void)setNumberOfSamples:(unsigned int)a3
{
  self->_numberOfSamples = a3;
}

@end