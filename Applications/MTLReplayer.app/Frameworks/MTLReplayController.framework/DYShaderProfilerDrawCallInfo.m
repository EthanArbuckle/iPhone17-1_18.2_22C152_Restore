@interface DYShaderProfilerDrawCallInfo
- (DYShaderProfilerDrawCallInfo)init;
- (DYShaderProfilerProgramInfo)programInfo;
- (DYShaderProfilerTiming)computeTiming;
- (DYShaderProfilerTiming)fragmentTiming;
- (DYShaderProfilerTiming)timing;
- (DYShaderProfilerTiming)vertexTiming;
- (NSArray)allShaderKeys;
- (id).cxx_construct;
- (int)subCommandIndex;
- (unint64_t)encoderFunctionIndex;
- (unint64_t)encoderStateId;
- (unint64_t)pipelineStateFunctionIndex;
- (unint64_t)pipelineStateId;
- (unsigned)commandBufferIndex;
- (unsigned)drawCallIndex;
- (unsigned)encoderIndex;
- (unsigned)functionIndex;
- (unsigned)pipelineStateIndex;
- (void)setAllShaderKeys:(id)a3;
- (void)setCommandBufferIndex:(unsigned int)a3;
- (void)setDrawCallIndex:(unsigned int)a3;
- (void)setEncoderFunctionIndex:(unint64_t)a3;
- (void)setEncoderIndex:(unsigned int)a3;
- (void)setEncoderStateId:(unint64_t)a3;
- (void)setFunctionIndex:(unsigned int)a3;
- (void)setPipelineStateFunctionIndex:(unint64_t)a3;
- (void)setPipelineStateId:(unint64_t)a3;
- (void)setPipelineStateIndex:(unsigned int)a3;
- (void)setProgramInfo:(id)a3;
- (void)setSubCommandIndex:(int)a3;
@end

@implementation DYShaderProfilerDrawCallInfo

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programInfo, 0);
  objc_storeStrong((id *)&self->_allShaderKeys, 0);
  objc_storeStrong((id *)&self->_computeKernelKey, 0);
  objc_storeStrong((id *)&self->_fragmentShaderKey, 0);

  objc_storeStrong((id *)&self->_vertexShaderKey, 0);
}

- (void)setProgramInfo:(id)a3
{
}

- (DYShaderProfilerProgramInfo)programInfo
{
  return self->_programInfo;
}

- (void)setSubCommandIndex:(int)a3
{
  self->_subCommandIndex = a3;
}

- (int)subCommandIndex
{
  return self->_subCommandIndex;
}

- (void)setAllShaderKeys:(id)a3
{
}

- (NSArray)allShaderKeys
{
  return self->_allShaderKeys;
}

- (DYShaderProfilerTiming)timing
{
  long long v3 = *(_OWORD *)&self[4]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[3]._time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[4]._time.average;
  return self;
}

- (DYShaderProfilerTiming)computeTiming
{
  long long v3 = *(_OWORD *)&self[3]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[2]._time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[3]._time.average;
  return self;
}

- (DYShaderProfilerTiming)fragmentTiming
{
  long long v3 = *(_OWORD *)&self[2]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self[1]._time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[2]._time.average;
  return self;
}

- (DYShaderProfilerTiming)vertexTiming
{
  long long v3 = *(_OWORD *)&self[1]._cycle.min;
  *(_OWORD *)&retstr->_cycle.average = *(_OWORD *)&self->_time.max;
  *(_OWORD *)&retstr->_cycle.max = v3;
  *(_OWORD *)&retstr->_time.min = *(_OWORD *)&self[1]._time.average;
  return self;
}

- (void)setPipelineStateFunctionIndex:(unint64_t)a3
{
  self->_pipelineStateFunctionIndex = a3;
}

- (unint64_t)pipelineStateFunctionIndex
{
  return self->_pipelineStateFunctionIndex;
}

- (void)setPipelineStateId:(unint64_t)a3
{
  self->_pipelineStateId = a3;
}

- (unint64_t)pipelineStateId
{
  return self->_pipelineStateId;
}

- (void)setPipelineStateIndex:(unsigned int)a3
{
  self->_pipelineStateIndex = a3;
}

- (unsigned)pipelineStateIndex
{
  return self->_pipelineStateIndex;
}

- (void)setCommandBufferIndex:(unsigned int)a3
{
  self->_commandBufferIndex = a3;
}

- (unsigned)commandBufferIndex
{
  return self->_commandBufferIndex;
}

- (void)setFunctionIndex:(unsigned int)a3
{
  self->_functionIndex = a3;
}

- (unsigned)functionIndex
{
  return self->_functionIndex;
}

- (void)setEncoderFunctionIndex:(unint64_t)a3
{
  self->_encoderFunctionIndex = a3;
}

- (unint64_t)encoderFunctionIndex
{
  return self->_encoderFunctionIndex;
}

- (void)setEncoderStateId:(unint64_t)a3
{
  self->_encoderStateId = a3;
}

- (unint64_t)encoderStateId
{
  return self->_encoderStateId;
}

- (void)setEncoderIndex:(unsigned int)a3
{
  self->_encoderIndex = a3;
}

- (unsigned)encoderIndex
{
  return self->_encoderIndex;
}

- (void)setDrawCallIndex:(unsigned int)a3
{
  self->_drawCallIndex = a3;
}

- (unsigned)drawCallIndex
{
  return self->_drawCallIndex;
}

- (DYShaderProfilerDrawCallInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)DYShaderProfilerDrawCallInfo;
  v2 = [(DYShaderProfilerDrawCallInfo *)&v6 init];
  long long v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

@end