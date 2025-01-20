@interface MADVideoRemoveBackgroundSettings
+ (BOOL)autoplayTrimEnabled;
+ (BOOL)visionTrimEnabled;
+ (double)photosPreferredThreshold;
+ (double)visionPreferredLowQualityProportionThreshold;
+ (double)visionPreferredVideoQualityThreshold;
+ (double)visionPreferredWorstFrameScoreThreshold;
+ (double)visionTrimMininumDuration;
+ (double)visionTrimThreshold;
+ (id)sharedSettings;
+ (unint64_t)visionTrimWindow;
- (MADVideoRemoveBackgroundSettings)init;
@end

@implementation MADVideoRemoveBackgroundSettings

- (MADVideoRemoveBackgroundSettings)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)MADVideoRemoveBackgroundSettings;
  v2 = [(MADVideoRemoveBackgroundSettings *)&v23 init];
  v3 = (MADVideoRemoveBackgroundSettings *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 256;
    *((void *)v2 + 2) = 5;
    *(_OWORD *)(v2 + 24) = xmmword_1BC2813F0;
    *(_OWORD *)(v2 + 40) = xmmword_1BC281400;
    *(_OWORD *)(v2 + 56) = xmmword_1BC281410;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        BOOL autoplayTrimEnabled = v3->_autoplayTrimEnabled;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = autoplayTrimEnabled;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "[RMBG] AutoPlay Trim:        %d", buf, 8u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL visionTrimEnabled = v3->_visionTrimEnabled;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = visionTrimEnabled;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[RMBG] Vision Trim:          %d", buf, 8u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t visionTrimWindow = v3->_visionTrimWindow;
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = visionTrimWindow;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "[RMBG] Window:               %d", buf, 8u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double visionTrimThreshold = v3->_visionTrimThreshold;
        *(_DWORD *)buf = 134217984;
        double v25 = visionTrimThreshold;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "[RMBG] Trim Threshold:       %0.2f", buf, 0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double visionTrimMininumDuration = v3->_visionTrimMininumDuration;
        *(_DWORD *)buf = 134217984;
        double v25 = visionTrimMininumDuration;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[RMBG] Min Duration:         %0.3f", buf, 0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double visionPreferredVideoQualityThreshold = v3->_visionPreferredVideoQualityThreshold;
        *(_DWORD *)buf = 134217984;
        double v25 = visionPreferredVideoQualityThreshold;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[v]:    %0.2f", buf, 0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double visionPreferredLowQualityProportionThreshold = v3->_visionPreferredLowQualityProportionThreshold;
        *(_DWORD *)buf = 134217984;
        double v25 = visionPreferredLowQualityProportionThreshold;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[prop]: %0.2f", buf, 0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        double visionPreferredWorstFrameScoreThreshold = v3->_visionPreferredWorstFrameScoreThreshold;
        *(_DWORD *)buf = 134217984;
        double v25 = visionPreferredWorstFrameScoreThreshold;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[wfs]:  %0.2f", buf, 0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        double photosPreferredThreshold = v3->_photosPreferredThreshold;
        *(_DWORD *)buf = 134217984;
        double v25 = photosPreferredThreshold;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "[RMBG] Pref Threshold[ph]:   %0.2f", buf, 0xCu);
      }
    }
  }
  return v3;
}

+ (id)sharedSettings
{
  if (+[MADVideoRemoveBackgroundSettings sharedSettings]::once != -1) {
    dispatch_once(&+[MADVideoRemoveBackgroundSettings sharedSettings]::once, &__block_literal_global_234);
  }
  v2 = (void *)+[MADVideoRemoveBackgroundSettings sharedSettings]::instance;
  return v2;
}

void __50__MADVideoRemoveBackgroundSettings_sharedSettings__block_invoke()
{
  v0 = objc_alloc_init(MADVideoRemoveBackgroundSettings);
  v1 = (void *)+[MADVideoRemoveBackgroundSettings sharedSettings]::instance;
  +[MADVideoRemoveBackgroundSettings sharedSettings]::instance = (uint64_t)v0;
}

+ (BOOL)autoplayTrimEnabled
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  char v3 = v2[8];

  return v3;
}

+ (BOOL)visionTrimEnabled
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  char v3 = v2[9];

  return v3;
}

+ (unint64_t)visionTrimWindow
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  unint64_t v3 = v2[2];

  return v3;
}

+ (double)visionTrimThreshold
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  double v3 = v2[3];

  return v3;
}

+ (double)visionTrimMininumDuration
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  double v3 = v2[4];

  return v3;
}

+ (double)visionPreferredVideoQualityThreshold
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  double v3 = v2[5];

  return v3;
}

+ (double)visionPreferredLowQualityProportionThreshold
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  double v3 = v2[6];

  return v3;
}

+ (double)visionPreferredWorstFrameScoreThreshold
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  double v3 = v2[7];

  return v3;
}

+ (double)photosPreferredThreshold
{
  v2 = +[MADVideoRemoveBackgroundSettings sharedSettings];
  double v3 = v2[8];

  return v3;
}

@end