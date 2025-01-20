@interface AXMContinuousSynth
- (AXMContinuousSynth)initWithSampleRate:(double)a3 envelope:(id)a4 keyPitches:(id)a5;
- (BOOL)muted;
- (BOOL)releasing;
- (double)phase;
- (unint64_t)_bufferFrameForKeyPitch:(id)a3;
- (unint64_t)framesRendered;
- (unint64_t)releaseFrame;
- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4;
- (void)setFramesRendered:(unint64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setReleaseFrame:(unint64_t)a3;
- (void)setReleasing:(BOOL)a3;
@end

@implementation AXMContinuousSynth

- (AXMContinuousSynth)initWithSampleRate:(double)a3 envelope:(id)a4 keyPitches:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AXMContinuousSynth;
  v10 = [(AXMSynth *)&v13 initWithSampleRate:a4 envelope:a3];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_keyPitches, a5);
  }

  return v11;
}

- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4
{
  id v41 = [(AXMSynth *)self envelope];
  [v41 lengthMS];
  double v7 = v6;
  [(AXMSynth *)self sampleRate];
  double v9 = (double)a4 + v7 / 1000.0 * v8;
  double v10 = (double)(unint64_t)((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
  if (v9 < v10)
  {
    v11 = [(AXMSynth *)self envelope];
    [v11 lengthMS];
    double v13 = v12;
    [(AXMSynth *)self sampleRate];
    double v10 = (double)a4 + v13 / 1000.0 * v14;
  }
  id v42 = (id)[(NSArray *)self->_keyPitches mutableCopy];
  v15 = [v42 firstObject];
  v16 = v42;
  if (v15)
  {
    [v42 removeObjectAtIndex:0];
    v16 = v42;
  }
  v17 = [v16 firstObject];
  unint64_t v18 = [(AXMContinuousSynth *)self _bufferFrameForKeyPitch:v15];
  unint64_t v19 = [(AXMContinuousSynth *)self _bufferFrameForKeyPitch:v17];
  [v15 frequency];
  -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:");
  [(AXMSynth *)self bypassEnvelopes];
  v20 = [(AXMSynth *)self mainOscillator];
  [v20 updateCache];

  v21 = [(AXMSynth *)self mainOscillator];
  char v22 = [v21 isBypassed];

  unint64_t v23 = (unint64_t)v10 - a4;
  if ((unint64_t)v10 <= a4) {
    char v24 = 1;
  }
  else {
    char v24 = v22;
  }
  if (v24)
  {
    v25 = v15;
  }
  else
  {
    uint64_t v26 = 0;
    unint64_t v27 = 4 * a4;
    v25 = v15;
    do
    {
      if (v26 == v19)
      {
        id v28 = v17;

        if (v28) {
          [v42 removeObjectAtIndex:0];
        }
        v17 = [v42 firstObject];

        unint64_t v29 = [(AXMContinuousSynth *)self _bufferFrameForKeyPitch:v17];
        [v28 frequency];
        -[AXMSynth setBaseFrequency:](self, "setBaseFrequency:");
        v25 = v28;
        unint64_t v18 = v19;
        unint64_t v19 = v29;
      }
      else
      {
        double v30 = (double)(v26 - v18) / (double)(v19 - v18);
        if (v30 > 0.0)
        {
          [v25 frequency];
          double v32 = v31;
          [v17 frequency];
          double v34 = v33;
          [v25 frequency];
          [(AXMSynth *)self setBaseFrequency:v32 + v30 * (v34 - v35)];
        }
      }
      v36 = [(AXMSynth *)self mainOscillator];
      [v36 getNextSample];
      double v38 = v37;

      [(AXMSynth *)self gain];
      *(_DWORD *)(*(void *)a3 + v27 + 4 * v26++) += (int)(v38 * 32500.0 * v39);
    }
    while (v23 != v26);
  }
}

- (unint64_t)_bufferFrameForKeyPitch:(id)a3
{
  id v4 = a3;
  [v4 timeOffsetMS];
  double v6 = v5;
  [(AXMSynth *)self sampleRate];
  unint64_t v8 = (unint64_t)(v6 / 1000.0 * v7);

  return v8;
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (double)phase
{
  return self->_phase;
}

- (unint64_t)framesRendered
{
  return self->_framesRendered;
}

- (void)setFramesRendered:(unint64_t)a3
{
  self->_framesRendered = a3;
}

- (BOOL)releasing
{
  return self->_releasing;
}

- (void)setReleasing:(BOOL)a3
{
  self->_releasing = a3;
}

- (unint64_t)releaseFrame
{
  return self->_releaseFrame;
}

- (void)setReleaseFrame:(unint64_t)a3
{
  self->_releaseFrame = a3;
}

- (void).cxx_destruct
{
}

@end