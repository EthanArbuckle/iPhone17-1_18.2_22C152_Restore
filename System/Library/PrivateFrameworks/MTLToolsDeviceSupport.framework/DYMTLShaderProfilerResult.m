@interface DYMTLShaderProfilerResult
- (DYMTLShaderProfilerResult)init;
- (NSArray)encoderTilerParamBufBytesUsedArray;
- (NSDictionary)parameterBufferPercentFullDict;
- (NSDictionary)softwareCounterInfo;
- (NSMutableData)unknownUSCSamples;
- (NSMutableDictionary)perRingPerFrameLimiterData;
- (NSNumber)parameterBufferMaxSize;
- (NSNumber)parameterBufferMaxSizeEverMemless;
- (NSNumber)parameterBufferMaxSizeNeverMemless;
- (void)setEncoderTilerParamBufBytesUsedArray:(id)a3;
- (void)setParameterBufferMaxSize:(id)a3;
- (void)setParameterBufferMaxSizeEverMemless:(id)a3;
- (void)setParameterBufferMaxSizeNeverMemless:(id)a3;
- (void)setParameterBufferPercentFullDict:(id)a3;
- (void)setPerRingPerFrameLimiterData:(id)a3;
- (void)setSoftwareCounterInfo:(id)a3;
- (void)setUnknownUSCSamples:(id)a3;
@end

@implementation DYMTLShaderProfilerResult

- (DYMTLShaderProfilerResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)DYMTLShaderProfilerResult;
  v2 = [(DYShaderProfilerResult *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1024];
    [(DYShaderProfilerResult *)v2 setShaderProfilingFrameTimes:v3];

    v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1024];
    [(DYShaderProfilerResult *)v2 setBlitEncoderTimeInfo:v4];

    v5 = v2;
  }

  return v2;
}

- (NSArray)encoderTilerParamBufBytesUsedArray
{
  return self->_encoderTilerParamBufBytesUsedArray;
}

- (void)setEncoderTilerParamBufBytesUsedArray:(id)a3
{
}

- (NSNumber)parameterBufferMaxSize
{
  return self->_parameterBufferMaxSize;
}

- (void)setParameterBufferMaxSize:(id)a3
{
}

- (NSNumber)parameterBufferMaxSizeEverMemless
{
  return self->_parameterBufferMaxSizeEverMemless;
}

- (void)setParameterBufferMaxSizeEverMemless:(id)a3
{
}

- (NSNumber)parameterBufferMaxSizeNeverMemless
{
  return self->_parameterBufferMaxSizeNeverMemless;
}

- (void)setParameterBufferMaxSizeNeverMemless:(id)a3
{
}

- (NSDictionary)parameterBufferPercentFullDict
{
  return self->_parameterBufferPercentFullDict;
}

- (void)setParameterBufferPercentFullDict:(id)a3
{
}

- (NSDictionary)softwareCounterInfo
{
  return self->_softwareCounterInfo;
}

- (void)setSoftwareCounterInfo:(id)a3
{
}

- (NSMutableData)unknownUSCSamples
{
  return self->_unknownUSCSamples;
}

- (void)setUnknownUSCSamples:(id)a3
{
}

- (NSMutableDictionary)perRingPerFrameLimiterData
{
  return self->_perRingPerFrameLimiterData;
}

- (void)setPerRingPerFrameLimiterData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perRingPerFrameLimiterData, 0);
  objc_storeStrong((id *)&self->_unknownUSCSamples, 0);
  objc_storeStrong((id *)&self->_softwareCounterInfo, 0);
  objc_storeStrong((id *)&self->_parameterBufferPercentFullDict, 0);
  objc_storeStrong((id *)&self->_parameterBufferMaxSizeNeverMemless, 0);
  objc_storeStrong((id *)&self->_parameterBufferMaxSizeEverMemless, 0);
  objc_storeStrong((id *)&self->_parameterBufferMaxSize, 0);
  objc_storeStrong((id *)&self->_encoderTilerParamBufBytesUsedArray, 0);
}

@end