@interface CDRichComplicationCornerUtilities
+ (CGRect)cornerGaugeCustomViewRectWithPosition:(int64_t)a3 forDevice:(id)a4;
+ (id)hitTestPathWithViewBounds:(CGRect)a3 position:(int64_t)a4 forDevice:(id)a5;
@end

@implementation CDRichComplicationCornerUtilities

+ (id)hitTestPathWithViewBounds:(CGRect)a3 position:(int64_t)a4 forDevice:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  CLKLargeDialDiameterForDevice();
  double v12 = v11;
  [v10 screenBounds];
  double v14 = v13;
  double v16 = v15;

  v17 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", x, y, width, height);
  double v18 = (v14 - v12) * 0.5;
  double v19 = (v16 - v12) * 0.5;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      double v18 = width - v12 - v18;
      break;
    case 2:
      goto LABEL_5;
    case 3:
      double v18 = width - v12 - v18;
LABEL_5:
      double v19 = height - v16 + v19;
      break;
    default:
      double v18 = *MEMORY[0x263F00148];
      double v19 = *(double *)(MEMORY[0x263F00148] + 8);
      break;
  }
  v20 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", v18, v19, v12, v12);
  v21 = [v20 bezierPathByReversingPath];
  [v17 appendPath:v21];

  return v17;
}

+ (CGRect)cornerGaugeCustomViewRectWithPosition:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id v8 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
    if (v8 == v5)
    {
      uint64_t v9 = [v5 version];
      uint64_t v10 = _LayoutConstants___previousCLKDeviceVersion_3;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = objc_storeWeak(&_LayoutConstants___cachedDevice_3, v5);
  _LayoutConstants___previousCLKDeviceVersion_3 = [v5 version];

  ___LayoutConstants_block_invoke_3(v12, (uint64_t)v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  double v13 = *(double *)&_LayoutConstants___constants_0_2;
  double v14 = *(double *)&_LayoutConstants___constants_1_2;
  double v15 = *(double *)&_LayoutConstants___constants_2_0;

  double v16 = CDCornerComplicationSize(v5);
  double v18 = v17;
  [v5 sizeClass];
  if (CLKDeviceCategoryForSizeClass() == 5)
  {
    double v14 = CDCornerComplicationOuterImageCenterPoint(v5);
    double v15 = v19;
  }
  switch(a3)
  {
    case 0:
      break;
    case 1:
      double v14 = v16 - v14;
      break;
    case 2:
      goto LABEL_12;
    case 3:
      double v14 = v16 - v14;
LABEL_12:
      double v15 = v18 - v15;
      break;
    default:
      double v14 = 0.0;
      double v15 = 0.0;
      break;
  }

  double v20 = v14 - v13 * 0.5;
  double v21 = v15 - v13 * 0.5;
  double v22 = v13;
  double v23 = v13;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

@end