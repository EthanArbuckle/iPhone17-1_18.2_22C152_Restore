@interface UILabel(MapsUILayout)
+ (double)_mapsui_maximumHeightWithFont:()MapsUILayout numberOfLines:displayScale:;
@end

@implementation UILabel(MapsUILayout)

+ (double)_mapsui_maximumHeightWithFont:()MapsUILayout numberOfLines:displayScale:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (a4 < 1)
  {
    double v16 = 1.79769313e308;
  }
  else
  {
    [v5 lineHeight];
    [v6 leading];
    v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 5)
    {
      v9 = [v6 fontDescriptor];
      v10 = [v9 fontAttributes];
      v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB0948]];

      if (v11)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v12 = [&unk_1EE405180 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
LABEL_6:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(&unk_1EE405180);
            }
            if ([v11 containsString:*(void *)(*((void *)&v19 + 1) + 8 * v15)]) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [&unk_1EE405180 countByEnumeratingWithState:&v19 objects:v23 count:16];
              if (v13) {
                goto LABEL_6;
              }
              break;
            }
          }
        }
      }
    }
    UICeilToScale();
    double v16 = v17;
  }

  return v16;
}

@end