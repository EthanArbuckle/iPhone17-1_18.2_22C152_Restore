@interface _ATXNeuralNetwork
- (_ATXNeuralNetwork)initWithData:(id)a3;
- (double)_predict:(float *)a3 freeInputsAfterUse:(BOOL)a4;
- (double)predict32:(const float *)a3;
- (double)predict:(const double *)a3;
- (float)_runOnInputs:(float *)a3 freeInputsAfterUse:(BOOL)a4;
- (unint64_t)inputSize;
- (unint64_t)outputSize;
- (void)forInputs:(const float *)a3 computeOutputLayer:(float *)a4;
@end

@implementation _ATXNeuralNetwork

- (_ATXNeuralNetwork)initWithData:(id)a3
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ATXNeuralNetwork;
  v7 = [(_ATXNeuralNetwork *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v9 = (unsigned int *)[v6 bytes];
    unint64_t v10 = *v9;
    v8->_dataBytes = (const char *)v9;
    v8->_nlayers = v10;
    if (!v10)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v8, @"_ATXNeuralNetwork.m", 51, @"Invalid parameter not satisfying: %@", @"_nlayers > 0" object file lineNumber description];
    }
    v8->_layers = (const $278F8F5807AB85F6E7DDBD32FD86D511 *)(v9 + 1);
  }

  return v8;
}

- (unint64_t)inputSize
{
  return self->_layers->var0;
}

- (unint64_t)outputSize
{
  return self->_layers[self->_nlayers - 1].var1;
}

- (double)predict:(const double *)a3
{
  v5 = (float *)malloc_type_malloc(4 * self->_layers->var0, 0x100004052888210uLL);
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v11);
  }
  uint64_t var0 = self->_layers->var0;
  if (var0)
  {
    v7 = v5;
    do
    {
      double v8 = *a3++;
      float v9 = v8;
      *v7++ = v9;
      --var0;
    }
    while (var0);
  }
  [(_ATXNeuralNetwork *)self _predict:v5 freeInputsAfterUse:1];
  return result;
}

- (double)predict32:(const float *)a3
{
  [(_ATXNeuralNetwork *)self _predict:a3 freeInputsAfterUse:0];
  return result;
}

- (float)_runOnInputs:(float *)a3 freeInputsAfterUse:(BOOL)a4
{
  v4 = a3;
  if (!self->_nlayers) {
    return a3;
  }
  BOOL v5 = a4;
  unint64_t v7 = 0;
  do
  {
    layers = self->_layers;
    float v9 = &layers[v7];
    if (v9->var5) {
      unsigned int var0 = layers[v7].var0;
    }
    else {
      unsigned int var0 = 0;
    }
    id v11 = (float *)malloc_type_malloc(4 * (var0 + v9->var1), 0x100004052888210uLL);
    if (!v11)
    {
      id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v22);
    }
    v12 = v11;
    memcpy(v11, &self->_dataBytes[self->_layers[v7].var3], 4 * self->_layers[v7].var1);
    cblas_sgemv_NEWLAPACK();
    objc_super v13 = self->_layers;
    int var4 = v13[v7].var4;
    if (v13[v7].var4)
    {
      if (var4 == 1)
      {
        uint64_t var1 = v13[v7].var1;
        v20 = v12;
        if (var1)
        {
          do
          {
            float *v20 = tanhf(*v20);
            ++v20;
            --var1;
          }
          while (var1);
        }
      }
      else if (var4 == 2)
      {
        uint64_t v15 = v13[v7].var1;
        v16 = v12;
        if (v15)
        {
          do
          {
            float *v16 = fmaxf(*v16, 0.0);
            ++v16;
            --v15;
          }
          while (v15);
        }
      }
    }
    else
    {
      uint64_t v17 = v13[v7].var1;
      if (v17)
      {
        v18 = v12;
        do
        {
          float *v18 = 1.0 / (float)(expf(-*v18) + 1.0);
          ++v18;
          --v17;
        }
        while (v17);
      }
    }
    if (v13[v7].var5) {
      memcpy(&v12[v13[v7].var1], v4, 4 * v13[v7].var0);
    }
    if (v7 || v5) {
      free(v4);
    }
    ++v7;
    v4 = v12;
  }
  while (v7 < self->_nlayers);
  return v12;
}

- (double)_predict:(float *)a3 freeInputsAfterUse:(BOOL)a4
{
  BOOL v4 = a4;
  layers = self->_layers;
  unint64_t v8 = self->_nlayers - 1;
  unsigned int var1 = layers[v8].var1;
  if (var1 != 1 && (var1 != 2 || !layers[v8].var6))
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_ATXNeuralNetwork.m", 133, @"Invalid parameter not satisfying: %@", @"_layers[_nlayers-1].outsz == 1 || (_layers[_nlayers-1].outsz == 2 && _layers[_nlayers-1].softmax)" object file lineNumber description];
  }
  v12 = [(_ATXNeuralNetwork *)self _runOnInputs:a3 freeInputsAfterUse:v4];
  objc_super v13 = v12;
  double v14 = *v12;
  if (self->_layers[self->_nlayers - 1].var6)
  {
    double v15 = exp(*v12);
    double v14 = v15 / (v15 + exp(v13[1]));
  }
  free(v13);
  return v14;
}

- (void)forInputs:(const float *)a3 computeOutputLayer:(float *)a4
{
  id v6 = [(_ATXNeuralNetwork *)self _runOnInputs:a3 freeInputsAfterUse:0];
  unint64_t v7 = &self->_layers[self->_nlayers];
  uint64_t var1 = (int)v7[-1].var1;
  int v13 = v7[-1].var1;
  if (v7[-1].var6)
  {
    vvexpf(a4, v6, &v13);
    double v9 = 0.0;
    if (v13 >= 1)
    {
      uint64_t v10 = v13;
      id v11 = a4;
      do
      {
        float v12 = *v11++;
        double v9 = v9 + v12;
        --v10;
      }
      while (v10);
    }
    cblas_sscal_NEWLAPACK();
  }
  else
  {
    memcpy(a4, v6, 4 * var1);
  }
  free(v6);
}

- (void).cxx_destruct
{
}

@end