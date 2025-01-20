@interface AXMLiveContinuousSynth
- (BOOL)muted;
- (BOOL)releasing;
- (unint64_t)framesRendered;
- (unint64_t)releaseFrame;
- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4 numSamples:(unint64_t)a5;
- (void)setFramesRendered:(unint64_t)a3;
- (void)setMuted:(BOOL)a3;
- (void)setReleaseFrame:(unint64_t)a3;
- (void)setReleasing:(BOOL)a3;
- (void)startRelease;
@end

@implementation AXMLiveContinuousSynth

- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4 numSamples:(unint64_t)a5
{
  [(AXMSynth *)self bypassEnvelopes];
  v9 = [(AXMSynth *)self mainOscillator];
  [v9 updateCache];

  v10 = [(AXMSynth *)self mainOscillator];
  char v11 = [v10 isBypassed];

  if ((v11 & 1) == 0 && a5 + a4 > a4)
  {
    do
    {
      v12 = [(AXMSynth *)self mainOscillator];
      [v12 getNextSample];
      double v14 = v13;

      unint64_t v15 = [(AXMLiveContinuousSynth *)self framesRendered];
      [(AXMSynth *)self sampleRate];
      double v17 = v16;
      v18 = [(AXMSynth *)self envelope];
      [v18 attackMS];
      double v20 = v19;
      double v21 = (double)v15 / v17 * 1000.0;

      if (v21 < v20)
      {
        v22 = [(AXMSynth *)self envelope];
        [v22 levelForTime:v21];
        double v14 = v14 * v23;
      }
      if ([(AXMLiveContinuousSynth *)self releasing])
      {
        unint64_t v24 = [(AXMLiveContinuousSynth *)self framesRendered];
        unint64_t v25 = [(AXMLiveContinuousSynth *)self releaseFrame];
        [(AXMSynth *)self sampleRate];
        double v27 = v26;
        v28 = [(AXMSynth *)self envelope];
        [v28 releaseMS];
        double v30 = v29;
        double v31 = (double)(v24 - v25) / v27 * 1000.0;

        double v32 = 0.0;
        if (v31 <= v30)
        {
          v33 = [(AXMSynth *)self envelope];
          [v33 attackMS];
          double v35 = v34;
          v36 = [(AXMSynth *)self envelope];
          [v36 decayMS];
          double v38 = v37;
          v39 = [(AXMSynth *)self envelope];
          [v39 sustainMS];
          double v41 = v35 + v38 + v40;

          v42 = [(AXMSynth *)self envelope];
          [v42 levelForTime:v31 + v41];
          double v32 = v14 * v43;
        }
      }
      else if ([(AXMLiveContinuousSynth *)self muted])
      {
        double v32 = 0.0;
      }
      else
      {
        double v32 = v14;
      }
      unint64_t v44 = a4 % ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2);
      [(AXMSynth *)self gain];
      *(_DWORD *)(*(void *)a3 + 4 * v44) += (int)(v32 * 32500.0 * v45);
      if (![(AXMLiveContinuousSynth *)self muted] || [(AXMLiveContinuousSynth *)self releasing]) {
        [(AXMLiveContinuousSynth *)self setFramesRendered:[(AXMLiveContinuousSynth *)self framesRendered] + 1];
      }
      ++a4;
      --a5;
    }
    while (a5);
  }
}

- (void)startRelease
{
  if (![(AXMLiveContinuousSynth *)self muted])
  {
    self->_releaseFrame = [(AXMLiveContinuousSynth *)self framesRendered];
    self->_releasing = 1;
  }
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
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

@end