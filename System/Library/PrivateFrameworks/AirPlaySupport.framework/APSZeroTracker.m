@interface APSZeroTracker
@end

@implementation APSZeroTracker

void __APSZeroTracker_StartZeroLoggerDispatch_block_invoke(uint64_t a1, double a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(_DWORD **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    LODWORD(a2) = v2[57];
    double v4 = (double)*(unint64_t *)&a2;
    LODWORD(a2) = *(_DWORD *)(v3 + 24);
    unint64_t v5 = *(void *)v3;
    double v6 = *(double *)v3 * (double)*(unint64_t *)&a2;
    LODWORD(v5) = v2[1];
    double v7 = (double)v5 / v6;
    if (v7 >= v4)
    {
      LODWORD(v4) = v2[12];
      v2[1] = 0;
      double v8 = (double)*(unint64_t *)&v4 / v6;
      if (gLogCategory_APSAudioStats <= 50
        && (gLogCategory_APSAudioStats != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v9 = LogCategoryCopyOSLogHandle();
      v10 = (void *)v9;
      if (v9) {
        v11 = v9;
      }
      else {
        v11 = MEMORY[0x1E4F14500];
      }
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 134218240;
        double v13 = v7;
        __int16 v14 = 2048;
        double v15 = v8;
        _os_signpost_emit_with_name_impl(&dword_1D0BA9000, v11, OS_SIGNPOST_EVENT, 0x2B8D0934uLL, "AP_SIGNPOST_CAR_DIGITAL_ZEROS_TRACKER", "Digital zeros detected (%.2lf seconds). Total Duration = %.2lf Secs.\n", buf, 0x16u);
      }
      if (v10) {
        os_release(v10);
      }
    }
  }
}

@end