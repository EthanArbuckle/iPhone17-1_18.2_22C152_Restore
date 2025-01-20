@interface HDQuantitySampleAttenuationEngine
- ($A3DB90B81A8072650F44011264F9C29D)attenuateSample:(SEL)a3;
- (BOOL)delegateLoadingWasSuccessful:(id *)a3;
- (HDQuantitySampleAttenuationEngine)initWithAttenuationEngineDelegate:(id)a3;
- (HDQuantitySampleAttenuationEngineDelegate)attenuationEngineDelegate;
- (void)_loadSamplesFromDelegateAtLocation:(char *)a1;
- (void)setAttenuationEngineDelegate:(id)a3;
@end

@implementation HDQuantitySampleAttenuationEngine

- (HDQuantitySampleAttenuationEngine)initWithAttenuationEngineDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDQuantitySampleAttenuationEngine;
  v5 = [(HDQuantitySampleAttenuationEngine *)&v10 init];
  v6 = v5;
  if (v5)
  {
    p_sampleCountFromDelegate = &v5->_sampleCountFromDelegate;
    objc_storeWeak((id *)&v5->_attenuationEngineDelegate, v4);
    *(_OWORD *)p_sampleCountFromDelegate = xmmword_1BD32D1F0;
    v6->_noMoreDelegateSamples = 0;
    delegateLoadFirstError = v6->_delegateLoadFirstError;
    v6->_delegateLoadErrorCount = 0;
    v6->_delegateLoadFirstError = 0;
  }
  return v6;
}

- ($A3DB90B81A8072650F44011264F9C29D)attenuateSample:(SEL)a3
{
  v5 = self;
  if (self)
  {
    p_double var1 = (uint64_t *)&self[1024].var1;
    if (self[1024].var3)
    {
LABEL_3:
      long long v8 = *(_OWORD *)&a4->var2;
      *(_OWORD *)&retstr->double var0 = *(_OWORD *)&a4->var0;
      *(_OWORD *)&retstr->double var2 = v8;
      retstr->var4 = a4->var4;
      return self;
    }
    double var0 = a4->var0;
    uint64_t v10 = *p_var1;
    if (*p_var1 < 0)
    {
      -[HDQuantitySampleAttenuationEngine _loadSamplesFromDelegateAtLocation:]((char *)self, a4->var0);
      uint64_t v10 = *p_var1;
      if (!*p_var1)
      {
LABEL_22:
        v5[1024].var3 = 1;
        goto LABEL_3;
      }
    }
    double var2 = v5[1024].var2;
    for (double i = v5[*(void *)&var2].var2; var0 >= i; double i = v5[*(void *)&var2].var2)
    {
      ++*(void *)&var2;
      v5[1024].double var2 = var2;
      if (*(uint64_t *)&var2 >= v10)
      {
        -[HDQuantitySampleAttenuationEngine _loadSamplesFromDelegateAtLocation:]((char *)v5, i);
        uint64_t v10 = *p_var1;
        if (!*p_var1) {
          goto LABEL_22;
        }
        double var2 = v5[1024].var2;
      }
    }
    if ((*(void *)&var2 & 0x8000000000000000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    double var2 = 0.0;
  }
  p_double var0 = &v5[*(void *)&var2].var0;
  double v14 = p_var0[1];
  double var1 = a4->var1;
  if (var1 <= v14) {
    goto LABEL_3;
  }
  double v17 = p_var0[2];
  double v16 = p_var0[3];
  double v18 = a4->var0;
  if (a4->var0 < v14 || var1 > v17)
  {
    *(void *)&retstr->var3 = 0;
    retstr->double var0 = v18;
    if (v14 <= v18)
    {
      if (var1 >= v17) {
        double var1 = v17;
      }
      double v20 = a4->var2 - v16;
    }
    else
    {
      if (v14 < var1) {
        double var1 = v14;
      }
      double v20 = a4->var2;
    }
    retstr->double var1 = var1;
    retstr->double var2 = v20;
    retstr->var3 = a4->var3;
    retstr->var4 = 0;
  }
  else
  {
    retstr->double var0 = v18;
    retstr->double var1 = var1;
    retstr->double var2 = a4->var2 - v16;
    *(void *)&retstr->var3 = 0;
    retstr->var4 = 0;
  }
  return self;
}

- (void)_loadSamplesFromDelegateAtLocation:(char *)a1
{
  id v4 = (id *)(a1 + 40968);
  v5 = [a1 attenuationEngineDelegate];
  id v9 = 0;
  uint64_t v6 = [v5 loadAttenuationSamples:a1 + 8 anchorTime:&v9 errorOut:a2];
  id v7 = v9;
  id v8 = v9;

  if (v6 < 0)
  {
    if (!v4[4]) {
      objc_storeStrong(v4 + 4, v7);
    }
    v4[3] = (char *)v4[3] + 1;
  }
  else
  {
    *id v4 = (id)v6;
  }
  v4[1] = 0;
}

- (BOOL)delegateLoadingWasSuccessful:(id *)a3
{
  int64_t delegateLoadErrorCount = self->_delegateLoadErrorCount;
  if (delegateLoadErrorCount >= 1)
  {
    v5 = self->_delegateLoadFirstError;
    uint64_t v6 = v5;
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return delegateLoadErrorCount < 1;
}

- (HDQuantitySampleAttenuationEngineDelegate)attenuationEngineDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attenuationEngineDelegate);

  return (HDQuantitySampleAttenuationEngineDelegate *)WeakRetained;
}

- (void)setAttenuationEngineDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attenuationEngineDelegate);

  objc_storeStrong((id *)&self->_delegateLoadFirstError, 0);
}

@end