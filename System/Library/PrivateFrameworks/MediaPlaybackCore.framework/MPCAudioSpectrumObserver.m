@interface MPCAudioSpectrumObserver
+ (id)defaultObserver;
- (float)averagePowerOfBandAtIndex:(int64_t)a3 band:(MPCAudioSpectrumAnalyzerBand *)a4;
- (float)averagePowerOfFrequencyBandAtIndex:(int64_t)a3 frequencyBand:(MPCAudioFrequencyBand *)a4;
- (float)powerLevel;
- (id)onUpdate;
- (int64_t)addAnalysisBand:(MPCAudioSpectrumAnalyzerBand)a3;
- (int64_t)addFrequencyBand:(MPCAudioFrequencyBand)a3;
- (int64_t)numberOfBands;
- (void)_resizeBandStorage;
- (void)beginReport;
- (void)dealloc;
- (void)finishReport;
- (void)setOnUpdate:(id)a3;
- (void)setPowerLevel:(float)a3;
@end

@implementation MPCAudioSpectrumObserver

- (void).cxx_destruct
{
}

- (void)setOnUpdate:(id)a3
{
}

- (id)onUpdate
{
  return self->_onUpdate;
}

- (void)setPowerLevel:(float)a3
{
  self->_powerLevel = a3;
}

- (float)powerLevel
{
  return self->_powerLevel;
}

- (void)finishReport
{
  v3 = [(MPCAudioSpectrumObserver *)self onUpdate];

  if (v3)
  {
    v4 = [(MPCAudioSpectrumObserver *)self onUpdate];
    v4[2](v4, self);
  }
}

- (void)beginReport
{
  if (self->_numberOfBands)
  {
    unint64_t v2 = 0;
    p_var4 = &self->_bands->var4;
    do
    {
      unint64_t *p_var4 = 0;
      *((_DWORD *)p_var4 - 2) = 0;
      ++v2;
      p_var4 += 4;
    }
    while (v2 < self->_numberOfBands);
  }
  [(MPCAudioSpectrumObserver *)self setPowerLevel:0.0];
}

- (void)_resizeBandStorage
{
  unint64_t bandsStorageSize = self->_bandsStorageSize;
  if (bandsStorageSize < self->_numberOfBands + 1)
  {
    double v4 = (double)bandsStorageSize * 1.5;
    if (v4 < 3.0) {
      double v4 = 3.0;
    }
    unint64_t v5 = (unint64_t)v4;
    self->_bands = (_MPCAudioFrequencyBandInternal *)reallocf(self->_bands, 32 * (unint64_t)v4);
    self->_unint64_t bandsStorageSize = v5;
  }
}

- (float)averagePowerOfFrequencyBandAtIndex:(int64_t)a3 frequencyBand:(MPCAudioFrequencyBand *)a4
{
  p_var0 = &self->_bands[a3].var0;
  float result = p_var0[2].var0;
  if (a4) {
    *a4 = p_var0[1];
  }
  return result;
}

- (float)averagePowerOfBandAtIndex:(int64_t)a3 band:(MPCAudioSpectrumAnalyzerBand *)a4
{
  return self->_bands[a3].var3;
}

- (int64_t)addFrequencyBand:(MPCAudioFrequencyBand)a3
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  [(MPCAudioSpectrumObserver *)self _resizeBandStorage];
  v6 = &self->_bands[self->_numberOfBands];
  v6->var0.float var0 = var0;
  v6->var0.float var1 = var1;
  v6->float var1 = var0;
  v6->var2 = var1;
  *(void *)&v6->var3 = 0;
  v6->var4 = 0;
  int64_t result = self->_numberOfBands;
  self->_numberOfBands = result + 1;
  return result;
}

- (int64_t)addAnalysisBand:(MPCAudioSpectrumAnalyzerBand)a3
{
  BOOL v3 = a3.var0 > 600.0;
  a3.float var1 = 300.0;
  float v4 = 5000.0;
  if (a3.var0 <= 600.0) {
    float v4 = 300.0;
  }
  BOOL v5 = a3.var0 > 300.0;
  a3.float var0 = 20.0;
  if (v5)
  {
    a3.float var0 = v4;
    LODWORD(a3.var1) = dword_21BEF1448[v3];
  }
  return -[MPCAudioSpectrumObserver addFrequencyBand:](self, "addFrequencyBand:", *(double *)&a3, *(double *)&a3.var1);
}

- (int64_t)numberOfBands
{
  return self->_numberOfBands;
}

- (void)dealloc
{
  bands = self->_bands;
  if (bands) {
    free(bands);
  }
  v4.receiver = self;
  v4.super_class = (Class)MPCAudioSpectrumObserver;
  [(MPCAudioSpectrumObserver *)&v4 dealloc];
}

+ (id)defaultObserver
{
  id v2 = objc_alloc_init((Class)a1);
  LODWORD(v3) = 20.0;
  LODWORD(v4) = 1133903872;
  objc_msgSend(v2, "addFrequencyBand:", v3, v4);
  LODWORD(v5) = 1133903872;
  LODWORD(v6) = 1167867904;
  objc_msgSend(v2, "addFrequencyBand:", v5, v6);
  LODWORD(v7) = 1186693120;
  LODWORD(v8) = 1167867904;
  objc_msgSend(v2, "addFrequencyBand:", v8, v7);

  return v2;
}

@end