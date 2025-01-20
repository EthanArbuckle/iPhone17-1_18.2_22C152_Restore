@interface ATXFaceSuggestionConfiguredWatchFaceSignal
- (ATXFaceSuggestionConfiguredWatchFaceSignal)init;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
@end

@implementation ATXFaceSuggestionConfiguredWatchFaceSignal

- (ATXFaceSuggestionConfiguredWatchFaceSignal)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)ATXFaceSuggestionConfiguredWatchFaceSignal;
  v2 = [(ATXFaceSuggestionConfiguredWatchFaceSignal *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4B428] sharedInstance];
    uint64_t v4 = [v3 watchFaces];
    watchFaces = v2->_watchFaces;
    v2->_watchFaces = (NSArray *)v4;

    if (![(NSArray *)v2->_watchFaces count])
    {
      v6 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = "-[ATXFaceSuggestionConfiguredWatchFaceSignal init]";
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%s: no stored watchfaces", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (double)valueForDescriptor:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v5 = self->_watchFaces;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v32;
    double v10 = 0.0;
    *(void *)&long long v7 = 136315650;
    long long v30 = v7;
LABEL_3:
    uint64_t v11 = 0;
    while (2)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(v5);
      }
      id v12 = *(id *)(*((void *)&v31 + 1) + 8 * v11);
      id v13 = v4;
      v14 = [v13 extensionBundleIdentifier];
      v15 = [v13 identifier];

      uint64_t v16 = [v12 style];
      switch(v16)
      {
        case 1:
        case 17:
          v17 = v14;
          v18 = @"com.apple.NanoUniverse.AegirProxyApp.AegirPoster";
          goto LABEL_11;
        case 2:
        case 10:
          v17 = v14;
          v18 = @"com.apple.GradientPoster.GradientPosterExtension";
          goto LABEL_11;
        case 3:
          if ([v14 isEqualToString:@"com.apple.mobileslideshow.PhotosPosterProvider"])
          {
          }
          else
          {
            int v27 = [v14 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];

            if (!v27) {
              goto LABEL_22;
            }
          }
LABEL_12:
          v20 = __atxlog_handle_lock_screen();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v36 = "-[ATXFaceSuggestionConfiguredWatchFaceSignal valueForDescriptor:]";
            __int16 v37 = 2112;
            id v38 = v4;
            __int16 v39 = 2112;
            id v40 = v12;
            _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%s: descriptor (%@) has matching watch face: %@", buf, 0x20u);
          }

          id v21 = v12;
          double v22 = 0.1;
          if ([v21 style] != 1)
          {
            double v22 = 0.1;
            if ([v21 style] != 17)
            {
              double v22 = 0.1;
              if ([v21 style] != 10)
              {
                if ([v21 style] == 2) {
                  double v22 = 0.1;
                }
                else {
                  double v22 = 1.0;
                }
              }
            }
          }

          if (v10 < v22) {
            double v10 = v22;
          }
LABEL_22:
          if (v8 != ++v11) {
            continue;
          }
          uint64_t v28 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v41 count:16];
          uint64_t v8 = v28;
          if (!v28) {
            goto LABEL_39;
          }
          goto LABEL_3;
        case 4:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
          v17 = v14;
          v18 = @"com.apple.PridePoster.PridePosterExtension";
          goto LABEL_11;
        case 5:
        case 6:
          v17 = v14;
          v18 = @"com.apple.UnityPoster.UnityPosterExtension";
LABEL_11:
          char v19 = objc_msgSend(v17, "isEqualToString:", v18, v30);

          if (v19) {
            goto LABEL_12;
          }
          goto LABEL_22;
        case 7:
          int v23 = [v14 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp.AegirPoster"];
          v24 = v15;
          v25 = @"Earth";
          goto LABEL_30;
        case 8:
          int v23 = [v14 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp.AegirPoster"];
          v24 = v15;
          v25 = @"Moon";
          goto LABEL_30;
        case 9:
          int v23 = [v14 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp.AegirPoster"];
          v24 = v15;
          v25 = @"Orrery";
LABEL_30:
          char v26 = objc_msgSend(v24, "containsString:", v25, v30, (void)v31);

          if (!v23 || (v26 & 1) == 0) {
            goto LABEL_22;
          }
          goto LABEL_12;
        default:

          goto LABEL_22;
      }
    }
  }
  double v10 = 0.0;
LABEL_39:

  return v10;
}

- (double)weight
{
  return 50.0;
}

- (void).cxx_destruct
{
}

@end