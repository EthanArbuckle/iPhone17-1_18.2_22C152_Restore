@interface VCPImageQualityAnalyzer
- (float)qualityScore;
- (int)analyzeImageQuality:(id)a3 irisPhotoOffsetSec:(float)a4 cancel:(id)a5;
@end

@implementation VCPImageQualityAnalyzer

- (int)analyzeImageQuality:(id)a3 irisPhotoOffsetSec:(float)a4 cancel:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v33 = (uint64_t (**)(void))a5;
  v34 = [v7 objectForKeyedSubscript:@"BlurResults"];
  v32 = [v7 objectForKeyedSubscript:@"ObstructionResults"];
  if ([v34 count])
  {
    if (v33 && (v33[2]() & 1) != 0)
    {
      int v8 = -128;
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v9 = v34;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v43 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = [*(id *)(*((void *)&v42 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
            v14 = [v13 objectForKeyedSubscript:@"sharpness"];
            [v14 floatValue];
            float v16 = v15;
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v10);
      }
      else
      {
        float v16 = 0.0;
      }

      v17 = [v7 objectForKeyedSubscript:@"ExposureResults"];
      v18 = [v17 objectAtIndexedSubscript:0];
      v19 = [v18 objectForKeyedSubscript:@"quality"];
      [v19 floatValue];
      self->_float qualityScore = v20;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v39 = 0u;
      long long v38 = 0u;
      id v21 = v32;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v39;
        double v24 = a4;
        while (2)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v21);
            }
            CFDictionaryRef v26 = *(const __CFDictionary **)(*((void *)&v38 + 1) + 8 * j);
            memset(&v37, 0, sizeof(v37));
            CMTimeRangeMakeFromDictionary(&v37, v26);
            CMTimeRange range = v37;
            CMTimeMakeWithSeconds(&time, v24, 600);
            if (CMTimeRangeContainsTime(&range, &time))
            {
              [(__CFDictionary *)v26 vcp_quality];
              *(float *)&double v27 = v27;
              self->_float qualityScore = fmaxf(self->_qualityScore + (float)((float)(1.0 - *(float *)&v27) * -15.0), 0.0);
              goto LABEL_25;
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_25:

      float v28 = 0.0;
      if (v16 > 0.2)
      {
        float qualityScore = self->_qualityScore;
        if (qualityScore != 0.0) {
          float v28 = (float)((float)(qualityScore * 0.75) + (float)(v16 * 0.25)) * 100.0;
        }
      }
      int v8 = 0;
      self->_float qualityScore = roundf(v28) / 100.0;
    }
  }
  else
  {
    int v8 = -50;
  }

  return v8;
}

- (float)qualityScore
{
  return self->_qualityScore;
}

@end