@interface VCPCNNFullConnectionBlockScalar
- (int)forward;
- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6;
@end

@implementation VCPCNNFullConnectionBlockScalar

- (int)forward
{
  unint64_t v3 = 0;
  p_inputSize = &self->super.super._inputSize;
  int v5 = 1;
  while (1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_inputSize);
    unint64_t v7 = [WeakRetained count];

    if (v7 <= v3) {
      break;
    }
    id v8 = objc_loadWeakRetained((id *)p_inputSize);
    v9 = [v8 objectAtIndexedSubscript:v3];
    v5 *= [v9 intValue];

    ++v3;
  }
  v10 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
  int v11 = [v10 intValue];

  v12 = [(VCPCNNData *)self->super.super._output data];
  id v13 = objc_loadWeakRetained((id *)&self->super.super._input);
  uint64_t v14 = [v13 data];

  if (v11 >= 1)
  {
    uint64_t v15 = 0;
    weight = self->super._weight;
    bias = self->super._bias;
    int neuronType = self->super._neuronType;
    do
    {
      v12[v15] = 0.0;
      float v19 = 0.0;
      if (v5 >= 1)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          float v19 = v19 + (float)(*(float *)(v14 + i * 4) * weight[i]);
          v12[v15] = v19;
        }
      }
      float v21 = bias[v15] + v19;
      float v22 = fmaxf(v21, 0.0);
      if (neuronType == 1) {
        float v21 = v22;
      }
      v12[v15++] = v21;
      weight += v5;
    }
    while (v15 != v11);
  }
  return 0;
}

- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6
{
  return [(VCPCNNFullConnectionBlock *)self readWeightsBias:a3 weights:self->super._weight bias:self->super._bias inputDim:*(void *)&a4 outputDim:*(void *)&a5 quantFactor:*(void *)&a6];
}

@end