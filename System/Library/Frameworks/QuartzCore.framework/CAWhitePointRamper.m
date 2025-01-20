@interface CAWhitePointRamper
- ($7FC4C79D0826BB61D2B795282A69B861)whitePointEnd;
- ($7FC4C79D0826BB61D2B795282A69B861)whitePointStart;
- (CAWhitePointRamper)initWithDisplay:(id)a3;
- (float)scaleEnd;
- (float)scaleStart;
- (void)rampCallback:(id)a3;
- (void)setScaleEnd:(float)a3;
- (void)setScaleStart:(float)a3;
- (void)setWhitePointEnd:(id *)a3;
- (void)setWhitePointStart:(id *)a3;
@end

@implementation CAWhitePointRamper

- (void)setScaleEnd:(float)a3
{
  self->_scaleEnd = a3;
}

- (float)scaleEnd
{
  return self->_scaleEnd;
}

- (void)setScaleStart:(float)a3
{
  self->_scaleStart = a3;
}

- (float)scaleStart
{
  return self->_scaleStart;
}

- (void)setWhitePointEnd:(id *)a3
{
}

- ($7FC4C79D0826BB61D2B795282A69B861)whitePointEnd
{
  objc_copyStruct(retstr, &self->_whitePointEnd, 36, 1, 0);
  return result;
}

- (void)setWhitePointStart:(id *)a3
{
}

- ($7FC4C79D0826BB61D2B795282A69B861)whitePointStart
{
  objc_copyStruct(retstr, &self->_whitePointStart, 36, 1, 0);
  return result;
}

- (void)rampCallback:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  [(CAWindowServerRamper *)self beginTime];
  if (v5 <= 0.0)
  {
    [a3 targetTimestamp];
    -[CAWindowServerRamper setBeginTime:](self, "setBeginTime:");
  }
  int v63 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  [a3 targetTimestamp];
  double v7 = v6;
  [(CAWindowServerRamper *)self beginTime];
  double v9 = v7 - v8;
  [(CAWindowServerRamper *)self duration];
  if (v9 / v10 > 1.0
    || ([a3 targetTimestamp],
        double v12 = v11,
        [(CAWindowServerRamper *)self beginTime],
        double v14 = v12 - v13,
        [(CAWindowServerRamper *)self duration],
        double v16 = 0.0,
        v14 / v15 >= 0.0))
  {
    [a3 targetTimestamp];
    double v18 = v17;
    [(CAWindowServerRamper *)self beginTime];
    double v20 = v18 - v19;
    [(CAWindowServerRamper *)self duration];
    double v16 = 1.0;
    if (v20 / v21 <= 1.0)
    {
      [a3 targetTimestamp];
      double v23 = v22;
      [(CAWindowServerRamper *)self beginTime];
      double v25 = v23 - v24;
      [(CAWindowServerRamper *)self duration];
      double v16 = v25 / v26;
    }
  }
  [(CAWhitePointRamper *)self scaleStart];
  float v28 = v27;
  [(CAWhitePointRamper *)self scaleEnd];
  float v30 = v29;
  [(CAWhitePointRamper *)self scaleStart];
  uint64_t v31 = 0;
  double v33 = v16 * (float)(v30 - v32);
  do
  {
    if (self)
    {
      [(CAWhitePointRamper *)self whitePointStart];
      float v34 = *(float *)&buf[v31];
      [(CAWhitePointRamper *)self whitePointEnd];
      float v35 = *(float *)((char *)v57 + v31);
      [(CAWhitePointRamper *)self whitePointStart];
    }
    else
    {
      int v60 = 0;
      memset(buf, 0, sizeof(buf));
      float v34 = *(float *)&buf[v31];
      int v58 = 0;
      memset(v57, 0, sizeof(v57));
      float v35 = *(float *)((char *)v57 + v31);
      int v56 = 0;
      memset(v55, 0, sizeof(v55));
    }
    float v36 = v34 + v16 * (float)(v35 - *(float *)((char *)v55 + v31));
    *(float *)((char *)&v61 + v31) = v36;
    v31 += 4;
  }
  while (v31 != 36);
  float v37 = v33 + v28;
  if ((LODWORD(v37) & 0x7FFFFFFFu) >= 0x7F800000) {
    float v38 = 1.0;
  }
  else {
    float v38 = v33 + v28;
  }
  v39 = [(CAWindowServerRamper *)self display];
  *(float *)&double v40 = v38;
  [(CAWindowServerDisplay *)v39 setWhitePointMatrix:&v61 scale:v40];
  *(void *)&v57[0] = 0;
  v41 = [(CAWindowServerRamper *)self display];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  long long v51 = v61;
  v50[2] = __35__CAWhitePointRamper_rampCallback___block_invoke;
  v50[3] = &unk_1E5273BC0;
  long long v52 = v62;
  int v53 = v63;
  v50[4] = self;
  float v54 = v38;
  if (![(CAWindowServerDisplay *)v41 commitBrightness:v57 withBlock:v50])
  {
    if (x_log_hook_p())
    {
      uint64_t v48 = [(CAWindowServerRamper *)self id];
      uint64_t v49 = objc_msgSend((id)objc_msgSend(*(id *)&v57[0], "localizedDescription"), "UTF8String");
      x_log_();
    }
    else
    {
      v42 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        int v43 = [(CAWindowServerRamper *)self id];
        uint64_t v44 = objc_msgSend((id)objc_msgSend(*(id *)&v57[0], "localizedDescription"), "UTF8String");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v44;
        _os_log_impl(&dword_184668000, v42, OS_LOG_TYPE_ERROR, "WhitePoint ramp %d: Error setting whitepoint: %s", buf, 0x12u);
      }
    }
    [(CADisplayLink *)[(CAWindowServerRamper *)self link] invalidate];
  }
  if (v16 == 1.0)
  {
    [a3 invalidate];
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (x_log_hook_p())
    {
      [(CAWindowServerRamper *)self id];
      x_log_();
    }
    else
    {
      v46 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        int v47 = [(CAWindowServerRamper *)self id];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v47;
        _os_log_impl(&dword_184668000, v46, OS_LOG_TYPE_DEFAULT, "WhitePoint ramp %d: Complete", buf, 8u);
      }
    }
  }
}

void __35__CAWhitePointRamper_rampCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  float v3 = *(float *)(a1 + 40);
  float v4 = *(float *)(a1 + 48);
  float v14 = *(float *)(a1 + 52);
  float v15 = *(float *)(a1 + 44);
  float v6 = *(float *)(a1 + 56);
  float v5 = *(float *)(a1 + 60);
  float v8 = *(float *)(a1 + 64);
  float v7 = *(float *)(a1 + 68);
  float v9 = *(float *)(a1 + 72);
  double v10 = CATimeWithHostTime(objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"brightnessTransactionPresentationTime"), "unsignedLongLongValue"));
  if (x_log_hook_p())
  {
    [*(id *)(a1 + 32) id];
    x_log_();
  }
  else
  {
    double v11 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [*(id *)(a1 + 32) id];
      double v13 = *(float *)(a1 + 76);
      *(_DWORD *)buf = 67111936;
      int v17 = v12;
      __int16 v18 = 2048;
      double v19 = v13;
      __int16 v20 = 2048;
      double v21 = v3;
      __int16 v22 = 2048;
      double v23 = v15;
      __int16 v24 = 2048;
      double v25 = v4;
      __int16 v26 = 2048;
      double v27 = v14;
      __int16 v28 = 2048;
      double v29 = v6;
      __int16 v30 = 2048;
      double v31 = v5;
      __int16 v32 = 2048;
      double v33 = v8;
      __int16 v34 = 2048;
      double v35 = v7;
      __int16 v36 = 2048;
      double v37 = v9;
      __int16 v38 = 2048;
      double v39 = v10;
      _os_log_impl(&dword_184668000, v11, OS_LOG_TYPE_DEFAULT, "Whitepoint ramp %d\n\t scale %g\n [%g %g %g]\n\t[%g %g %g]\n\t[%g %g %g]\n\tHit glass at time %.3f\n", buf, 0x76u);
    }
  }
}

- (CAWhitePointRamper)initWithDisplay:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAWhitePointRamper;
  float v3 = [(CAWindowServerRamper *)&v8 initWithDisplay:a3];
  float v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 2143289344;
    [(CAWhitePointRamper *)v3 setScaleEnd:v4];
    LODWORD(v6) = 2143289344;
    [(CAWhitePointRamper *)v5 setScaleStart:v6];
  }
  return v5;
}

@end