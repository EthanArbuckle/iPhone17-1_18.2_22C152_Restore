@interface PHAsset(Stickers)
- (id)vcp_animatedStickerScore;
@end

@implementation PHAsset(Stickers)

- (id)vcp_animatedStickerScore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(a1, "vcp_isLivePhoto"))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v4 = [a1 localIdentifier];
        int v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[%@] Asset is not Live Photo; omitting sticker score",
          (uint8_t *)&v11,
          0xCu);
      }
      goto LABEL_9;
    }
LABEL_10:
    v5 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(a1, "vcp_needsFullAnalysisProcessing:", 0) & 1) == 0)
  {
    v2 = [a1 mediaAnalysisProperties];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [a1 localIdentifier];
        [v2 videoStickerSuggestionScore];
        int v11 = 138412802;
        v12 = v7;
        __int16 v13 = 2048;
        double v14 = v8;
        __int16 v15 = 1024;
        int v16 = [v2 mediaAnalysisVersion];
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_INFO, "[%@] Animated Sticker Score: %0.3f (v%d)", (uint8_t *)&v11, 0x1Cu);
      }
    }
    v9 = NSNumber;
    [v2 videoStickerSuggestionScore];
    v5 = objc_msgSend(v9, "numberWithFloat:");
    goto LABEL_16;
  }
  if ((int)MediaAnalysisLogLevel() < 6) {
    goto LABEL_10;
  }
  v2 = VCPLogInstance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [a1 localIdentifier];
    int v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "[%@] Analysis unavailable or outdated; omitting sticker score",
      (uint8_t *)&v11,
      0xCu);
  }
LABEL_9:
  v5 = 0;
LABEL_16:

LABEL_17:
  return v5;
}

@end