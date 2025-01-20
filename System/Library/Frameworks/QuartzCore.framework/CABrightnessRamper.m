@interface CABrightnessRamper
- (CABrightnessRamper)initWithDisplay:(id)a3;
- (double)contrastEnhancerBegin;
- (double)contrastEnhancerEnd;
- (double)headroomBegin;
- (double)headroomEnd;
- (double)highAmbientStrengthBegin;
- (double)highAmbientStrengthEnd;
- (double)indicatorLimitBegin;
- (double)indicatorLimitEnd;
- (double)indicatorNitsBegin;
- (double)indicatorNitsEnd;
- (double)limitBegin;
- (double)limitEnd;
- (double)lowAmbientStrengthBegin;
- (double)lowAmbientStrengthEnd;
- (double)sdrNitsBegin;
- (double)sdrNitsEnd;
- (void)rampCallback:(id)a3;
- (void)setContrastEnhancerBegin:(double)a3;
- (void)setContrastEnhancerEnd:(double)a3;
- (void)setHeadroomBegin:(double)a3;
- (void)setHeadroomEnd:(double)a3;
- (void)setHighAmbientStrengthBegin:(double)a3;
- (void)setHighAmbientStrengthEnd:(double)a3;
- (void)setIndicatorLimitBegin:(double)a3;
- (void)setIndicatorLimitEnd:(double)a3;
- (void)setIndicatorNitsBegin:(double)a3;
- (void)setIndicatorNitsEnd:(double)a3;
- (void)setLimitBegin:(double)a3;
- (void)setLimitEnd:(double)a3;
- (void)setLowAmbientStrengthBegin:(double)a3;
- (void)setLowAmbientStrengthEnd:(double)a3;
- (void)setSdrNitsBegin:(double)a3;
- (void)setSdrNitsEnd:(double)a3;
@end

@implementation CABrightnessRamper

- (void)setIndicatorLimitEnd:(double)a3
{
  self->_indicatorLimitEnd = a3;
}

- (double)indicatorLimitEnd
{
  return self->_indicatorLimitEnd;
}

- (void)setIndicatorLimitBegin:(double)a3
{
  self->_indicatorLimitBegin = a3;
}

- (double)indicatorLimitBegin
{
  return self->_indicatorLimitBegin;
}

- (void)setIndicatorNitsEnd:(double)a3
{
  self->_indicatorNitsEnd = a3;
}

- (double)indicatorNitsEnd
{
  return self->_indicatorNitsEnd;
}

- (void)setIndicatorNitsBegin:(double)a3
{
  self->_indicatorNitsBegin = a3;
}

- (double)indicatorNitsBegin
{
  return self->_indicatorNitsBegin;
}

- (void)setHighAmbientStrengthEnd:(double)a3
{
  self->_highAmbientStrengthEnd = a3;
}

- (double)highAmbientStrengthEnd
{
  return self->_highAmbientStrengthEnd;
}

- (void)setHighAmbientStrengthBegin:(double)a3
{
  self->_highAmbientStrengthBegin = a3;
}

- (double)highAmbientStrengthBegin
{
  return self->_highAmbientStrengthBegin;
}

- (void)setLowAmbientStrengthEnd:(double)a3
{
  self->_lowAmbientStrengthEnd = a3;
}

- (double)lowAmbientStrengthEnd
{
  return self->_lowAmbientStrengthEnd;
}

- (void)setLowAmbientStrengthBegin:(double)a3
{
  self->_lowAmbientStrengthBegin = a3;
}

- (double)lowAmbientStrengthBegin
{
  return self->_lowAmbientStrengthBegin;
}

- (void)setContrastEnhancerEnd:(double)a3
{
  self->_contrastEnhancerEnd = a3;
}

- (double)contrastEnhancerEnd
{
  return self->_contrastEnhancerEnd;
}

- (void)setContrastEnhancerBegin:(double)a3
{
  self->_contrastEnhancerBegin = a3;
}

- (double)contrastEnhancerBegin
{
  return self->_contrastEnhancerBegin;
}

- (void)setLimitEnd:(double)a3
{
  self->_limitEnd = a3;
}

- (double)limitEnd
{
  return self->_limitEnd;
}

- (void)setLimitBegin:(double)a3
{
  self->_limitBegin = a3;
}

- (double)limitBegin
{
  return self->_limitBegin;
}

- (void)setHeadroomEnd:(double)a3
{
  self->_headroomEnd = a3;
}

- (double)headroomEnd
{
  return self->_headroomEnd;
}

- (void)setHeadroomBegin:(double)a3
{
  self->_headroomBegin = a3;
}

- (double)headroomBegin
{
  return self->_headroomBegin;
}

- (void)setSdrNitsEnd:(double)a3
{
  self->_sdrNitsEnd = a3;
}

- (double)sdrNitsEnd
{
  return self->_sdrNitsEnd;
}

- (void)setSdrNitsBegin:(double)a3
{
  self->_sdrNitsBegin = a3;
}

- (double)sdrNitsBegin
{
  return self->_sdrNitsBegin;
}

- (void)rampCallback:(id)a3
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  [(CABrightnessRamper *)self sdrNitsBegin];
  double v6 = v5;
  [(CABrightnessRamper *)self sdrNitsEnd];
  double v8 = v7;
  [(CABrightnessRamper *)self headroomBegin];
  double v10 = v9;
  [(CABrightnessRamper *)self headroomEnd];
  double v101 = v11;
  [(CABrightnessRamper *)self limitBegin];
  double v13 = v12;
  [(CABrightnessRamper *)self limitEnd];
  double v103 = v14;
  [(CABrightnessRamper *)self contrastEnhancerBegin];
  double v105 = v15;
  [(CABrightnessRamper *)self contrastEnhancerEnd];
  double v102 = v16;
  [(CABrightnessRamper *)self lowAmbientStrengthBegin];
  double v18 = v17;
  [(CABrightnessRamper *)self lowAmbientStrengthEnd];
  double v100 = v19;
  [(CABrightnessRamper *)self highAmbientStrengthBegin];
  double v99 = v20;
  [(CABrightnessRamper *)self highAmbientStrengthEnd];
  double v98 = v21;
  [(CABrightnessRamper *)self indicatorNitsBegin];
  double v97 = v22;
  [(CABrightnessRamper *)self indicatorNitsEnd];
  double v96 = v23;
  [(CABrightnessRamper *)self indicatorLimitBegin];
  double v95 = v24;
  [(CABrightnessRamper *)self indicatorLimitEnd];
  double v94 = v25;
  [(CAWindowServerRamper *)self beginTime];
  if (v26 <= 0.0)
  {
    [a3 targetTimestamp];
    -[CAWindowServerRamper setBeginTime:](self, "setBeginTime:");
  }
  id v108 = 0;
  [a3 targetTimestamp];
  double v28 = v27;
  [(CAWindowServerRamper *)self beginTime];
  double v30 = v28 - v29;
  [(CAWindowServerRamper *)self duration];
  if (v30 / v31 > 1.0
    || ([a3 targetTimestamp],
        double v33 = v32,
        [(CAWindowServerRamper *)self beginTime],
        double v35 = v33 - v34,
        [(CAWindowServerRamper *)self duration],
        double v37 = 0.0,
        v35 / v36 >= 0.0))
  {
    [a3 targetTimestamp];
    double v39 = v38;
    [(CAWindowServerRamper *)self beginTime];
    double v41 = v39 - v40;
    [(CAWindowServerRamper *)self duration];
    double v37 = 1.0;
    if (v41 / v42 <= 1.0)
    {
      [a3 targetTimestamp];
      double v44 = v43;
      [(CAWindowServerRamper *)self beginTime];
      double v46 = v44 - v45;
      [(CAWindowServerRamper *)self duration];
      double v37 = v46 / v47;
    }
  }
  double v48 = pow(v6 / v8, 2.22044605e-16 - v37) * v6;
  double v49 = pow(v10 / v101, 2.22044605e-16 - v37) * v10;
  double v50 = pow(v13 / v103, 2.22044605e-16 - v37) * v13;
  double v51 = v105 + v37 * (v102 - v105);
  double v52 = v18 + v37 * (v100 - v18);
  double v53 = v99 + v37 * (v98 - v99);
  double v54 = v97 + v37 * (v96 - v97);
  double v104 = v37;
  double v55 = v95 + v37 * (v94 - v95);
  double v106 = v55;
  if (x_log_hook_p())
  {
    double v92 = v54;
    double v93 = v55;
    double v90 = v52;
    double v91 = v53;
    double v88 = v50;
    double v89 = v51;
    double v56 = v50;
    uint64_t v86 = *(void *)&v48;
    double v87 = v49;
    uint64_t v85 = [(CAWindowServerRamper *)self id];
    x_log_();
    double v57 = v54;
    double v58 = v53;
  }
  else
  {
    double v56 = v50;
    v59 = x_log_category_windowserver;
    double v57 = v54;
    double v58 = v53;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67111168;
      int v110 = [(CAWindowServerRamper *)self id];
      __int16 v111 = 2048;
      double v112 = v48;
      __int16 v113 = 2048;
      double v114 = v49;
      __int16 v115 = 2048;
      double v116 = v56;
      __int16 v117 = 2048;
      double v118 = v51;
      __int16 v119 = 2048;
      double v120 = v52;
      __int16 v121 = 2048;
      double v122 = v53;
      __int16 v123 = 2048;
      double v124 = v57;
      __int16 v125 = 2048;
      double v126 = v106;
      _os_log_impl(&dword_184668000, v59, OS_LOG_TYPE_DEFAULT, "Ramp %d: Setting SDR brightness to %g nits, headroom to %g, limit to %g, contrast enhancer to %g, low_amb_str to %g, high_amb_str to %g indicator_nits to %g indicator_limit to %g", buf, 0x58u);
    }
  }
  if ((*(void *)&v48 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v60 = [(CAWindowServerRamper *)self display];
    *(float *)&double v61 = v48;
    [(CAWindowServerDisplay *)v60 setSDRBrightness:v61];
  }
  if ((*(void *)&v49 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v62 = [(CAWindowServerRamper *)self display];
    *(float *)&double v63 = v49;
    [(CAWindowServerDisplay *)v62 setHeadroom:v63];
  }
  if ((*(void *)&v56 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v64 = [(CAWindowServerRamper *)self display];
    *(float *)&double v65 = v56;
    [(CAWindowServerDisplay *)v64 setBrightnessLimit:v65];
  }
  if ((*(void *)&v51 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v66 = [(CAWindowServerRamper *)self display];
    *(float *)&double v67 = v51;
    [(CAWindowServerDisplay *)v66 setContrastEnhancer:v67];
  }
  if ((*(void *)&v52 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v68 = [(CAWindowServerRamper *)self display];
    *(float *)&double v69 = v52;
    [(CAWindowServerDisplay *)v68 setLowAmbientAdaptation:v69];
  }
  if ((*(void *)&v58 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v70 = [(CAWindowServerRamper *)self display];
    *(float *)&double v71 = v58;
    [(CAWindowServerDisplay *)v70 setHighAmbientAdaptation:v71];
  }
  if ((*(void *)&v57 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v72 = [(CAWindowServerRamper *)self display];
    *(float *)&double v73 = v57;
    [(CAWindowServerDisplay *)v72 setIndicatorBrightness:v73];
  }
  if ((*(void *)&v106 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v74 = [(CAWindowServerRamper *)self display];
    *(float *)&double v75 = v106;
    [(CAWindowServerDisplay *)v74 setIndicatorBrightnessLimit:v75];
  }
  uint64_t v76 = mach_absolute_time();
  double v77 = CATimeWithHostTime(v76);
  v78 = [(CAWindowServerRamper *)self display];
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __35__CABrightnessRamper_rampCallback___block_invoke;
  v107[3] = &unk_1E5273BC0;
  v107[4] = self;
  *(double *)&v107[5] = v48;
  *(double *)&v107[6] = v49;
  *(double *)&v107[7] = v56;
  *(double *)&v107[8] = v51;
  *(double *)&v107[9] = v77;
  if (![(CAWindowServerDisplay *)v78 commitBrightness:&v108 withBlock:v107])
  {
    if (x_log_hook_p())
    {
      uint64_t v85 = [(CAWindowServerRamper *)self id];
      uint64_t v86 = objc_msgSend((id)objc_msgSend(v108, "localizedDescription"), "UTF8String");
      x_log_();
    }
    else
    {
      v79 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        int v80 = [(CAWindowServerRamper *)self id];
        uint64_t v81 = objc_msgSend((id)objc_msgSend(v108, "localizedDescription"), "UTF8String");
        *(_DWORD *)buf = 67109378;
        int v110 = v80;
        __int16 v111 = 2080;
        double v112 = *(double *)&v81;
        _os_log_impl(&dword_184668000, v79, OS_LOG_TYPE_ERROR, "Ramp %d: Error setting brightness: %s", buf, 0x12u);
      }
    }
    [(CADisplayLink *)[(CAWindowServerRamper *)self link] invalidate];
  }
  if (v104 == 1.0)
  {
    objc_msgSend(a3, "invalidate", 1.0, v104);
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (x_log_hook_p())
    {
      [(CAWindowServerRamper *)self id];
      x_log_();
    }
    else
    {
      v83 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
      {
        int v84 = [(CAWindowServerRamper *)self id];
        *(_DWORD *)buf = 67109120;
        int v110 = v84;
        _os_log_impl(&dword_184668000, v83, OS_LOG_TYPE_DEFAULT, "Ramp %d: Complete", buf, 8u);
      }
    }
  }
}

void __35__CABrightnessRamper_rampCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v3 = CATimeWithHostTime(objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"brightnessTransactionPresentationTime"), "unsignedLongLongValue"));
  if (x_log_hook_p())
  {
    [*(id *)(a1 + 32) id];
    x_log_();
  }
  else
  {
    v4 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [*(id *)(a1 + 32) id];
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      double v10 = (v3 - *(double *)(a1 + 72)) * 1000.0;
      *(_DWORD *)buf = 67110656;
      int v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2048;
      double v22 = v3;
      __int16 v23 = 2048;
      double v24 = v10;
      _os_log_impl(&dword_184668000, v4, OS_LOG_TYPE_DEFAULT, "Ramp %d: Setting SDR brightness to %g nits, headroom to %g, limit to %g, contrast enhancer to %g [Hit the glass at time %.3f, took %.3f msec]", buf, 0x44u);
    }
  }
}

- (CABrightnessRamper)initWithDisplay:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CABrightnessRamper;
  double v3 = [(CAWindowServerRamper *)&v6 initWithDisplay:a3];
  v4 = v3;
  if (v3)
  {
    [(CABrightnessRamper *)v3 setSdrNitsBegin:NAN];
    [(CABrightnessRamper *)v4 setSdrNitsEnd:NAN];
    [(CABrightnessRamper *)v4 setHeadroomBegin:NAN];
    [(CABrightnessRamper *)v4 setHeadroomEnd:NAN];
    [(CABrightnessRamper *)v4 setLimitBegin:NAN];
    [(CABrightnessRamper *)v4 setLimitEnd:NAN];
    [(CABrightnessRamper *)v4 setContrastEnhancerBegin:NAN];
    [(CABrightnessRamper *)v4 setContrastEnhancerEnd:NAN];
    [(CABrightnessRamper *)v4 setLowAmbientStrengthBegin:NAN];
    [(CABrightnessRamper *)v4 setLowAmbientStrengthEnd:NAN];
    [(CABrightnessRamper *)v4 setHighAmbientStrengthBegin:NAN];
    [(CABrightnessRamper *)v4 setHighAmbientStrengthEnd:NAN];
    [(CABrightnessRamper *)v4 setIndicatorNitsBegin:NAN];
    [(CABrightnessRamper *)v4 setIndicatorNitsEnd:NAN];
    [(CABrightnessRamper *)v4 setIndicatorLimitBegin:NAN];
    [(CABrightnessRamper *)v4 setIndicatorLimitEnd:NAN];
  }
  return v4;
}

@end