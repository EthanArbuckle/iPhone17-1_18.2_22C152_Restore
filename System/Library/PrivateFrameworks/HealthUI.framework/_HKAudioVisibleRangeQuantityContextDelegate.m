@interface _HKAudioVisibleRangeQuantityContextDelegate
- (HKLineSeries)audioOverlayLineSeries;
- (_HKAudioVisibleRangeQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4;
- (id)formatterForTimescope:(int64_t)a3;
- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5;
- (void)_enumerateAudioExposureChartPoints:(id)a3 withBlock:(id)a4;
@end

@implementation _HKAudioVisibleRangeQuantityContextDelegate

- (_HKAudioVisibleRangeQuantityContextDelegate)initWithCustomDataSource:(id)a3 primaryDisplayType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_HKAudioVisibleRangeQuantityContextDelegate;
  v4 = [(_HKAudioStandardQuantityContextDelegate *)&v8 initWithCustomDataSource:a3 primaryDisplayType:a4];
  if (v4)
  {
    v5 = objc_alloc_init(_HKAudioVisibleRangeOverlaySeries);
    audioOverlayLineSeries = v4->_audioOverlayLineSeries;
    v4->_audioOverlayLineSeries = &v5->super;
  }
  return v4;
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __102___HKAudioVisibleRangeQuantityContextDelegate_valueString_applicationItems_representativeDisplayType___block_invoke;
  v19[3] = &unk_1E6D52E78;
  v19[4] = &v20;
  [(_HKAudioVisibleRangeQuantityContextDelegate *)self _enumerateAudioExposureChartPoints:v8 withBlock:v19];
  v11 = [MEMORY[0x1E4F2AC28] computeLEQFromAudioExposureValues:v21[5]];
  if (v11)
  {
    v12 = [v9 unitController];
    v13 = [v12 unitForDisplayType:v10];

    v14 = NSNumber;
    [v11 doubleValueForUnit:v13];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    v16 = [v9 unitController];
    v17 = HKFormattedStringFromValue(v15, v10, v16, 0, 0);
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v17 = [v13 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }

  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = 0;
  v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109___HKAudioVisibleRangeQuantityContextDelegate_valueContextString_applicationItems_representativeDisplayType___block_invoke;
  v14[3] = &unk_1E6D52E78;
  v14[4] = &v15;
  [(_HKAudioVisibleRangeQuantityContextDelegate *)self _enumerateAudioExposureChartPoints:v8 withBlock:v14];
  v11 = [NSNumber numberWithDouble:v16[3]];
  v12 = HKTimePeriodString(v11, 0);

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)_enumerateAudioExposureChartPoints:(id)a3 withBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1E4E40740](v8);
        v14 = objc_msgSend(v12, "userInfo", (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v6[2](v6, v14);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }
}

- (id)formatterForTimescope:(int64_t)a3
{
  return 0;
}

- (HKLineSeries)audioOverlayLineSeries
{
  return self->_audioOverlayLineSeries;
}

- (void).cxx_destruct
{
}

@end