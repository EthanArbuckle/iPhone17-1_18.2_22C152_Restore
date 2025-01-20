@interface CUIPSLayerEffectsPreset
- (CUIPSLayerEffectsPreset)initWithLayerEffects:(id)a3 forScaleFactor:(double)a4;
@end

@implementation CUIPSLayerEffectsPreset

- (CUIPSLayerEffectsPreset)initWithLayerEffects:(id)a3 forScaleFactor:(double)a4
{
  v4 = self;
  if (a3)
  {
    if (a4 > 0.0)
    {
      v24.receiver = self;
      v24.super_class = (Class)CUIPSLayerEffectsPreset;
      v4 = -[CUIShapeEffectPreset initWithEffectScale:](&v24, sel_initWithEffectScale_);
      if (v4)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v6 = objc_msgSend(objc_msgSend(a3, "effectList"), "allValues");
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v21;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              uint64_t v19 = 0;
              if ([v11 visible]
                && ([v11 updateLayerEffectPreset:v4 error:&v19] & 1) == 0
                && v19)
              {
                _CUILog(4, (uint64_t)"Unable to update layer effect preset: %@", v12, v13, v14, v15, v16, v17, v19);

                return 0;
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  return v4;
}

@end