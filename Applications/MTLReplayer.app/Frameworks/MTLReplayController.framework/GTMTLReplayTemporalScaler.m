@interface GTMTLReplayTemporalScaler
- (BOOL)isDepthReversed;
- (BOOL)reset;
- (GTMTLReplayTemporalScaler)initWithGPUScaler:(id)a3 ANEScaler:(id)a4 executionMode:(unsigned __int8)a5;
- (MTLFXEffectTracingDelegate)tracingDelegate;
- (MTLFence)fence;
- (MTLTexture)colorTexture;
- (MTLTexture)depthTexture;
- (MTLTexture)exposureTexture;
- (MTLTexture)motionTexture;
- (MTLTexture)outputTexture;
- (MTLTexture)reactiveMaskTexture;
- (float)inputContentMaxScale;
- (float)inputContentMinScale;
- (float)jitterOffsetX;
- (float)jitterOffsetY;
- (float)motionVectorScaleX;
- (float)motionVectorScaleY;
- (float)preExposure;
- (unint64_t)colorTextureFormat;
- (unint64_t)colorTextureUsage;
- (unint64_t)depthTextureFormat;
- (unint64_t)depthTextureUsage;
- (unint64_t)effectID;
- (unint64_t)inputContentHeight;
- (unint64_t)inputContentWidth;
- (unint64_t)inputHeight;
- (unint64_t)inputWidth;
- (unint64_t)motionTextureFormat;
- (unint64_t)motionTextureUsage;
- (unint64_t)outputHeight;
- (unint64_t)outputTextureFormat;
- (unint64_t)outputTextureUsage;
- (unint64_t)outputWidth;
- (unint64_t)reactiveTextureUsage;
- (unsigned)executionMode;
- (void)encodeToCommandBuffer:(id)a3;
- (void)setColorTexture:(id)a3;
- (void)setDepthReversed:(BOOL)a3;
- (void)setDepthTexture:(id)a3;
- (void)setExecutionMode:(unsigned __int8)a3;
- (void)setExposureTexture:(id)a3;
- (void)setFence:(id)a3;
- (void)setInputContentHeight:(unint64_t)a3;
- (void)setInputContentWidth:(unint64_t)a3;
- (void)setJitterOffsetX:(float)a3;
- (void)setJitterOffsetY:(float)a3;
- (void)setMotionTexture:(id)a3;
- (void)setMotionVectorScaleX:(float)a3;
- (void)setMotionVectorScaleY:(float)a3;
- (void)setOutputTexture:(id)a3;
- (void)setPreExposure:(float)a3;
- (void)setReactiveMaskTexture:(id)a3;
- (void)setReset:(BOOL)a3;
- (void)setTracingDelegate:(id)a3;
@end

@implementation GTMTLReplayTemporalScaler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneScaler, 0);

  objc_storeStrong((id *)&self->_gpuScaler, 0);
}

- (void)setExecutionMode:(unsigned __int8)a3
{
  self->_executionMode = a3;
}

- (unsigned)executionMode
{
  return self->_executionMode;
}

- (void)encodeToCommandBuffer:(id)a3
{
  id v4 = a3;
  if (self->_executionMode)
  {
    if (self->_executionMode != 1) {
      goto LABEL_6;
    }
    uint64_t v5 = 8;
  }
  else
  {
    uint64_t v5 = 16;
  }
  id v6 = v4;
  [*(id *)((char *)&self->super.isa + v5) encodeToCommandBuffer:v4];
  id v4 = v6;
LABEL_6:
}

- (void)setFence:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setFence:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setFence:v5];
}

- (MTLFence)fence
{
  return (MTLFence *)[(MTLFXTemporalScaler *)self->_gpuScaler fence];
}

- (float)inputContentMaxScale
{
  [(MTLFXTemporalScaler *)self->_gpuScaler inputContentMaxScale];
  return result;
}

- (float)inputContentMinScale
{
  [(MTLFXTemporalScaler *)self->_gpuScaler inputContentMinScale];
  return result;
}

- (unint64_t)outputHeight
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler outputHeight];
}

- (unint64_t)outputWidth
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler outputWidth];
}

- (unint64_t)inputHeight
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler inputHeight];
}

- (unint64_t)inputWidth
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler inputWidth];
}

- (unint64_t)outputTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler outputTextureFormat];
}

- (unint64_t)motionTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler motionTextureFormat];
}

- (unint64_t)depthTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler depthTextureFormat];
}

- (unint64_t)colorTextureFormat
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler colorTextureFormat];
}

- (void)setDepthReversed:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTLFXTemporalScaler setDepthReversed:](self->_gpuScaler, "setDepthReversed:");
  aneScaler = self->_aneScaler;

  [(MTLFXTemporalScaler *)aneScaler setDepthReversed:v3];
}

- (BOOL)isDepthReversed
{
  return [(MTLFXTemporalScaler *)self->_gpuScaler isDepthReversed];
}

- (void)setReset:(BOOL)a3
{
  BOOL v3 = a3;
  -[MTLFXTemporalScaler setReset:](self->_gpuScaler, "setReset:");
  aneScaler = self->_aneScaler;

  [(MTLFXTemporalScaler *)aneScaler setReset:v3];
}

- (BOOL)reset
{
  return [(MTLFXTemporalScaler *)self->_gpuScaler reset];
}

- (void)setMotionVectorScaleY:(float)a3
{
  -[MTLFXTemporalScaler setMotionVectorScaleY:](self->_gpuScaler, "setMotionVectorScaleY:");
  aneScaler = self->_aneScaler;
  *(float *)&double v6 = a3;

  [(MTLFXTemporalScaler *)aneScaler setMotionVectorScaleY:v6];
}

- (float)motionVectorScaleY
{
  [(MTLFXTemporalScaler *)self->_gpuScaler motionVectorScaleY];
  return result;
}

- (void)setMotionVectorScaleX:(float)a3
{
  -[MTLFXTemporalScaler setMotionVectorScaleX:](self->_gpuScaler, "setMotionVectorScaleX:");
  aneScaler = self->_aneScaler;
  *(float *)&double v6 = a3;

  [(MTLFXTemporalScaler *)aneScaler setMotionVectorScaleX:v6];
}

- (float)motionVectorScaleX
{
  [(MTLFXTemporalScaler *)self->_gpuScaler motionVectorScaleX];
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  -[MTLFXTemporalScaler setJitterOffsetY:](self->_gpuScaler, "setJitterOffsetY:");
  aneScaler = self->_aneScaler;
  *(float *)&double v6 = a3;

  [(MTLFXTemporalScaler *)aneScaler setJitterOffsetY:v6];
}

- (float)jitterOffsetY
{
  [(MTLFXTemporalScaler *)self->_gpuScaler jitterOffsetY];
  return result;
}

- (void)setJitterOffsetX:(float)a3
{
  -[MTLFXTemporalScaler setJitterOffsetX:](self->_gpuScaler, "setJitterOffsetX:");
  aneScaler = self->_aneScaler;
  *(float *)&double v6 = a3;

  [(MTLFXTemporalScaler *)aneScaler setJitterOffsetX:v6];
}

- (float)jitterOffsetX
{
  [(MTLFXTemporalScaler *)self->_gpuScaler jitterOffsetX];
  return result;
}

- (void)setPreExposure:(float)a3
{
  -[MTLFXTemporalScaler setPreExposure:](self->_gpuScaler, "setPreExposure:");
  aneScaler = self->_aneScaler;
  *(float *)&double v6 = a3;

  [(MTLFXTemporalScaler *)aneScaler setPreExposure:v6];
}

- (float)preExposure
{
  [(MTLFXTemporalScaler *)self->_gpuScaler preExposure];
  return result;
}

- (void)setReactiveMaskTexture:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setReactiveMaskTexture:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setReactiveMaskTexture:v5];
}

- (MTLTexture)reactiveMaskTexture
{
  return (MTLTexture *)[(MTLFXTemporalScaler *)self->_gpuScaler reactiveMaskTexture];
}

- (void)setExposureTexture:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setExposureTexture:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setExposureTexture:v5];
}

- (MTLTexture)exposureTexture
{
  return (MTLTexture *)[(MTLFXTemporalScaler *)self->_gpuScaler exposureTexture];
}

- (void)setOutputTexture:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setOutputTexture:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setOutputTexture:v5];
}

- (MTLTexture)outputTexture
{
  return (MTLTexture *)[(MTLFXTemporalScaler *)self->_gpuScaler outputTexture];
}

- (void)setMotionTexture:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setMotionTexture:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setMotionTexture:v5];
}

- (MTLTexture)motionTexture
{
  return (MTLTexture *)[(MTLFXTemporalScaler *)self->_gpuScaler motionTexture];
}

- (void)setDepthTexture:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setDepthTexture:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setDepthTexture:v5];
}

- (MTLTexture)depthTexture
{
  return (MTLTexture *)[(MTLFXTemporalScaler *)self->_gpuScaler depthTexture];
}

- (void)setColorTexture:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setColorTexture:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setColorTexture:v5];
}

- (MTLTexture)colorTexture
{
  return (MTLTexture *)[(MTLFXTemporalScaler *)self->_gpuScaler colorTexture];
}

- (void)setInputContentHeight:(unint64_t)a3
{
  -[MTLFXTemporalScaler setInputContentHeight:](self->_gpuScaler, "setInputContentHeight:");
  aneScaler = self->_aneScaler;

  [(MTLFXTemporalScaler *)aneScaler setInputContentHeight:a3];
}

- (unint64_t)inputContentHeight
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler inputContentHeight];
}

- (void)setInputContentWidth:(unint64_t)a3
{
  -[MTLFXTemporalScaler setInputContentWidth:](self->_gpuScaler, "setInputContentWidth:");
  aneScaler = self->_aneScaler;

  [(MTLFXTemporalScaler *)aneScaler setInputContentWidth:a3];
}

- (unint64_t)inputContentWidth
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler inputContentWidth];
}

- (unint64_t)reactiveTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler reactiveTextureUsage];
}

- (unint64_t)outputTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler outputTextureUsage];
}

- (unint64_t)motionTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler motionTextureUsage];
}

- (unint64_t)depthTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler depthTextureUsage];
}

- (unint64_t)colorTextureUsage
{
  return (unint64_t)[(MTLFXTemporalScaler *)self->_gpuScaler colorTextureUsage];
}

- (unint64_t)effectID
{
  if (*(unsigned char *)(self + 24))
  {
    if (*(unsigned char *)(self + 24) != 1) {
      return self;
    }
    uint64_t v2 = 8;
  }
  else
  {
    uint64_t v2 = 16;
  }
  return (unint64_t)[*(id *)(self + v2) effectID];
}

- (void)setTracingDelegate:(id)a3
{
  gpuScaler = self->_gpuScaler;
  id v5 = a3;
  [(MTLFXTemporalScaler *)gpuScaler setTracingDelegate:v5];
  [(MTLFXTemporalScaler *)self->_aneScaler setTracingDelegate:v5];
}

- (MTLFXEffectTracingDelegate)tracingDelegate
{
  return (MTLFXEffectTracingDelegate *)[(MTLFXTemporalScaler *)self->_gpuScaler tracingDelegate];
}

- (GTMTLReplayTemporalScaler)initWithGPUScaler:(id)a3 ANEScaler:(id)a4 executionMode:(unsigned __int8)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTMTLReplayTemporalScaler;
  v11 = [(GTMTLReplayTemporalScaler *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_gpuScaler, a3);
    objc_storeStrong((id *)&v12->_aneScaler, a4);
    v12->_executionMode = a5;
  }

  return v12;
}

@end