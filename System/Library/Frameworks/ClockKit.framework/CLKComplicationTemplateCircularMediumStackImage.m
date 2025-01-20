@interface CLKComplicationTemplateCircularMediumStackImage
+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5;
- (int64_t)compatibleFamily;
@end

@implementation CLKComplicationTemplateCircularMediumStackImage

- (int64_t)compatibleFamily
{
  return 105;
}

+ (void)_imageSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forSDKVersion:(int64_t)a5
{
  v8 = +[CLKRenderingContext sharedRenderingContext];
  id obj = [v8 device];

  os_unfair_lock_lock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock_911);
  id WeakRetained = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice_912);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    id v11 = objc_loadWeakRetained(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice_912);
    if (obj == v11)
    {
      uint64_t v12 = [obj version];
      uint64_t v13 = _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion_913;

      if (v12 == v13) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v14 = objc_storeWeak(&_imageSDKSize_deviceSize_forSDKVersion____cachedDevice_912, obj);
  _imageSDKSize_deviceSize_forSDKVersion____previousCLKDeviceVersion_913 = [obj version];

  __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(v15, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageSDKSize_deviceSize_forSDKVersion____lock_911);
  if (a4) {
    *a4 = (CGSize)xmmword_267C8B0E8;
  }
  if (a3) {
    *a3 = *(CGSize *)&_imageSDKSize_deviceSize_forSDKVersion___imageSize_910[2 * a5];
  }
}

void __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  *(void *)&xmmword_267C8B0E8 = __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2((uint64_t)v4, v4);
  *((void *)&xmmword_267C8B0E8 + 1) = v2;
  _imageSDKSize_deviceSize_forSDKVersion___imageSize_910 = __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2([v4 setNewestAllowedSizeClass:&unk_26CCDB6E0], v4);
  unk_267C8B0E0 = v3;
}

double __90__CLKComplicationTemplateCircularMediumStackImage__imageSDKSize_deviceSize_forSDKVersion___block_invoke_2(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v2 = a2;
  [v2 scaledValue:0 withOverride:28.0 forSizeClass:24.0];
  double v4 = v3;
  v7[0] = &unk_26CCDB6C8;
  v7[1] = &unk_26CCDB6E0;
  v8[0] = &unk_26CCDC2E8;
  v8[1] = &unk_26CCDC268;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 scaledValue:v5 withOverrides:14.0];

  return v4;
}

@end