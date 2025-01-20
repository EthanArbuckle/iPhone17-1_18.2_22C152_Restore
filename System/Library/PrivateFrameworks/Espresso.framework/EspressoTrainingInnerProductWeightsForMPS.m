@interface EspressoTrainingInnerProductWeightsForMPS
- (BOOL)ready;
- (EspressoTrainingInnerProductWeightsForMPS)initWithParams:(inner_product_uniforms *)a3 forMode:(BOOL)a4;
- (MTLBuffer)biasesBuffer;
- (MTLBuffer)weightsBuffer;
- (float)biasTerms;
- (void)setBiasesBuffer:(id)a3;
- (void)setWeightsBuffer:(id)a3;
- (void)weights;
@end

@implementation EspressoTrainingInnerProductWeightsForMPS

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesBuffer, 0);

  objc_storeStrong((id *)&self->_weightsBuffer, 0);
}

- (void)setBiasesBuffer:(id)a3
{
}

- (MTLBuffer)biasesBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 256, 1);
}

- (void)setWeightsBuffer:(id)a3
{
}

- (MTLBuffer)weightsBuffer
{
  return (MTLBuffer *)objc_getProperty(self, a2, 248, 1);
}

- (BOOL)ready
{
  return 1;
}

- (float)biasTerms
{
  return (float *)[(MTLBuffer *)self->_biasesBuffer contents];
}

- (void)weights
{
  return (void *)[(MTLBuffer *)self->_weightsBuffer contents];
}

- (EspressoTrainingInnerProductWeightsForMPS)initWithParams:(inner_product_uniforms *)a3 forMode:(BOOL)a4
{
  long long v4 = *(_OWORD *)&a3->sparse_block_size_y;
  v10[6] = *(_OWORD *)&a3->n8_splitk;
  v10[7] = v4;
  int disable_bnns_client_ptr = a3->disable_bnns_client_ptr;
  long long v5 = *(_OWORD *)&a3->use_raw_buffers;
  v10[2] = *(_OWORD *)&a3->is_lookup;
  v10[3] = v5;
  long long v6 = *(_OWORD *)&a3->Bbytes;
  v10[4] = *(_OWORD *)&a3->m;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&a3->has_tanh;
  v10[0] = *(_OWORD *)&a3->nC;
  v10[1] = v7;
  v9.receiver = self;
  v9.super_class = (Class)EspressoTrainingInnerProductWeightsForMPS;
  return -[EspressoInnerProductWeightsForMPS initWithParams:](&v9, sel_initWithParams_, v10, a4);
}

@end