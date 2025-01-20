@interface HKElectrocardiogram
@end

@implementation HKElectrocardiogram

void *__197__HKElectrocardiogram_HealthUI___hk_waveformPathsWithNumberOfValues_transform_maximumNumberOfValuesPerPath_shouldResetXValues_initialValuesToOmit_minimumValueInMicrovolts_maximumValueInMicrovolts___block_invoke(void *result, uint64_t a2, unsigned char *a3, float a4)
{
  if (result[6] <= a2)
  {
    uint64_t v4 = a2;
    v5 = result;
    if (result[7] <= a2)
    {
      *a3 = 1;
    }
    else
    {
      uint64_t v7 = result[8];
      if (v7 >= 1)
      {
        if (!(a2 % v7))
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
          if (([*(id *)(*(void *)(v5[4] + 8) + 40) isEmpty] & 1) == 0)
          {
            if (!*((unsigned char *)v5 + 128))
            {
              [*(id *)(*(void *)(v5[4] + 8) + 40) currentPoint];
              objc_msgSend(v8, "moveToPoint:");
            }
            [*(id *)(*(void *)(v5[5] + 8) + 40) addObject:*(void *)(*(void *)(v5[4] + 8) + 40)];
          }
          uint64_t v9 = *(void *)(v5[4] + 8);
          v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;
        }
        if (*((unsigned char *)v5 + 128)) {
          v4 %= v5[8];
        }
      }
      float v11 = *((float *)v5 + 30);
      float v12 = *((float *)v5 + 31);
      if (v12 <= a4) {
        float v12 = a4;
      }
      if (v12 >= v11) {
        float v12 = *((float *)v5 + 30);
      }
      int v13 = objc_msgSend(*(id *)(*(void *)(v5[4] + 8) + 40), "isEmpty", vaddq_f64(*(float64x2_t *)(v5 + 13), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(v5 + 11), (float)(v11 - v12)), *(float64x2_t *)(v5 + 9), (double)v4)));
      v14 = *(void **)(*(void *)(v5[4] + 8) + 40);
      if (v13)
      {
        return objc_msgSend(v14, "moveToPoint:", v15, v16);
      }
      else
      {
        return objc_msgSend(v14, "addLineToPoint:", v15, v16);
      }
    }
  }
  return result;
}

void __61__HKElectrocardiogram_HKCodingSupport__createWithCodableECG___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "_setPrivateClassification:", objc_msgSend(v3, "classificationRawValue"));
  v5 = (void *)MEMORY[0x1E4F2B370];
  v6 = [*(id *)(a1 + 32) averageHeartRate];
  uint64_t v7 = [v5 createWithCodableQuantity:v6];
  [v4 _setAverageHeartRate:v7];

  objc_msgSend(v4, "_setSymptomsStatus:", objc_msgSend(*(id *)(a1 + 32), "symptomsStatusRawValue"));
  id v8 = [*(id *)(a1 + 32) readingData];
  [v4 _setPayload:v8];
}

@end