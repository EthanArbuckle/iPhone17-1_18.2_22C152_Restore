@interface EspressoTrainingConvolutionWeightsForMPS
- (BOOL)ready;
- (EspressoTrainingConvolutionWeightsForMPS)initWithParams:(convolution_uniforms *)a3 forMode:(BOOL)a4;
- (MTLBuffer)biasesBuffer;
- (MTLBuffer)weightsBuffer;
- (float)biasTerms;
- (unsigned)weightsLayout;
- (void)setBiasesBuffer:(id)a3;
- (void)setWeightsBuffer:(id)a3;
- (void)weights;
@end

@implementation EspressoTrainingConvolutionWeightsForMPS

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightsBuffer, 0);

  objc_storeStrong((id *)&self->is_training, 0);
}

- (void)setBiasesBuffer:(id)a3
{
}

- (MTLBuffer)biasesBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 304, 1);
}

- (void)setWeightsBuffer:(id)a3
{
}

- (MTLBuffer)weightsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 296, 1);
}

- (unsigned)weightsLayout
{
  return *((unsigned char *)&self->super.data_type + 4) == 0;
}

- (BOOL)ready
{
  return 1;
}

- (float)biasTerms
{
  return (float *)[(MTLBuffer *)self->_weightsBuffer contents];
}

- (void)weights
{
  return (void *)[*(id *)&self->is_training contents];
}

- (EspressoTrainingConvolutionWeightsForMPS)initWithParams:(convolution_uniforms *)a3 forMode:(BOOL)a4
{
  long long v5 = *(_OWORD *)&a3->low_precision_accumulation;
  v12[8] = *(_OWORD *)&a3->total_channel_bottom;
  v12[9] = v5;
  uint64_t v13 = *(void *)&a3->disable_bnns_client_ptr;
  long long v6 = *(_OWORD *)&a3->pad.l;
  v12[4] = *(_OWORD *)&a3->fused_activation_alpha;
  v12[5] = v6;
  long long v7 = *(_OWORD *)&a3->has_batch_norm;
  v12[6] = *(_OWORD *)&a3->dilation_x;
  v12[7] = v7;
  long long v8 = *(_OWORD *)&a3->start_channel_low_priority_split;
  v12[0] = *(_OWORD *)&a3->W;
  v12[1] = v8;
  long long v9 = *(_OWORD *)&a3->Nx;
  v12[2] = *(_OWORD *)&a3->has_biases;
  v12[3] = v9;
  v11.receiver = self;
  v11.super_class = (Class)EspressoTrainingConvolutionWeightsForMPS;
  result = [(EspressoConvolutionWeightsForMPS *)&v11 initWithParams:v12];
  *((unsigned char *)&result->super.data_type + 4) = a4;
  return result;
}

@end