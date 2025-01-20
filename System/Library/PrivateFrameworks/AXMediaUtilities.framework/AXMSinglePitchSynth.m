@interface AXMSinglePitchSynth
- (AXMSinglePitchSynth)initWithFrequency:(double)a3 sampleRate:(double)a4 envelope:(id)a5;
- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4;
@end

@implementation AXMSinglePitchSynth

- (AXMSinglePitchSynth)initWithFrequency:(double)a3 sampleRate:(double)a4 envelope:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)AXMSinglePitchSynth;
  v9 = [(AXMSynth *)&v12 initWithSampleRate:v8 envelope:a4];
  v10 = v9;
  if (v9) {
    [(AXMSynth *)v9 setBaseFrequency:a3];
  }

  return v10;
}

- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4
{
  v7 = [(AXMSynth *)self envelope];
  [v7 lengthMS];
  double v9 = v8;
  [(AXMSynth *)self sampleRate];
  double v11 = (double)a4 + v9 / 1000.0 * v10;
  double v12 = (double)(unint64_t)((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  if (v11 < v12)
  {
    v13 = [(AXMSynth *)self envelope];
    [v13 lengthMS];
    double v15 = v14;
    [(AXMSynth *)self sampleRate];
    double v12 = (double)a4 + v15 / 1000.0 * v16;
  }
  v17 = [(AXMSynth *)self mainOscillator];
  [v17 updateCache];

  v18 = [(AXMSynth *)self mainOscillator];
  char v19 = [v18 isBypassed];
  unint64_t v20 = (unint64_t)v12;

  if ((unint64_t)v12 <= a4) {
    char v21 = 1;
  }
  else {
    char v21 = v19;
  }
  if ((v21 & 1) == 0)
  {
    do
    {
      v22 = [(AXMSynth *)self mainOscillator];
      [v22 getNextSample];
      double v24 = v23;

      [(AXMSynth *)self gain];
      *(_DWORD *)(*(void *)a3 + 4 * a4++) += (int)(v24 * 32500.0 * v25);
    }
    while (v20 != a4);
  }
}

@end