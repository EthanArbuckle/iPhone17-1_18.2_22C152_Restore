@interface _WDSelectedRangeIcon
+ (id)_cacheKeyForData:(id)a3 foregroundColor:(id)a4 font:(id)a5;
+ (id)_dataLabelImageForPlusSign:(BOOL)a3 foregroundColor:(id)a4 dimension:(double)a5 strokeOffset:(double)a6 strokeWidth:(double)a7;
+ (id)_iconCache;
+ (id)iconForData:(id)a3 foregroundColor:(id)a4 compatibleWithFont:(id)a5;
@end

@implementation _WDSelectedRangeIcon

+ (id)_iconCache
{
  v2 = (void *)_iconCache__cache;
  if (!_iconCache__cache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v4 = (void *)_iconCache__cache;
    _iconCache__cache = (uint64_t)v3;

    v2 = (void *)_iconCache__cache;
  }
  return v2;
}

+ (id)iconForData:(id)a3 foregroundColor:(id)a4 compatibleWithFont:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _cacheKeyForData:v8 foregroundColor:v9 font:v10];
  v12 = [a1 _iconCache];
  v13 = [v12 objectForKey:v11];

  if (v13)
  {
    id v14 = v13;
    goto LABEL_36;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  uint64_t v16 = [v8 statisticsType];
  if (v16 == 6)
  {
    uint64_t v17 = 1;
    goto LABEL_7;
  }
  if (v16 == 7)
  {
    uint64_t v17 = 0;
LABEL_7:
    v18 = +[_WDSelectedRangeIcon _dataLabelImageForPlusSign:v17 foregroundColor:v9 dimension:10.0 strokeOffset:1.0 strokeWidth:1.5];
    [v15 setImage:v18];
  }
  switch([v8 dataType])
  {
    case 1:
      uint64_t v20 = +[HKBloodPressureSeries systolicImageCompatibleWithFont:v10 withColor:v9];
      goto LABEL_30;
    case 2:
      uint64_t v20 = +[HKBloodPressureSeries diastolicImageCompatibleWithFont:v10 withColor:v9];
      goto LABEL_30;
    case 3:
    case 4:
    case 28:
    case 29:
      [v10 capHeight];
      uint64_t v20 = +[HKChartSeriesPointMarker chartPointWithColor:v9 radius:0 style:v19 * 0.5];
      goto LABEL_30;
    case 7:
      v21 = [MEMORY[0x1E4F2B860] sharedBehavior];
      v22 = [v21 features];
      int v23 = [v22 yodel];

      if (!v23 || [v8 statisticsType] == 3) {
        goto LABEL_33;
      }
      v24 = [v8 metadata];
      [v10 capHeight];
      double v26 = v25 / 1.5;
      v27 = v24;
      uint64_t v28 = 1;
      goto LABEL_27;
    case 8:
      v42 = [MEMORY[0x1E4F2B860] sharedBehavior];
      v43 = [v42 features];
      int v44 = [v43 yodel];

      if (!v44 || [v8 statisticsType] == 3) {
        goto LABEL_33;
      }
      v24 = [v8 metadata];
      [v10 capHeight];
      double v26 = v45 / 1.5;
      v27 = v24;
      uint64_t v28 = 2;
LABEL_27:
      v29 = +[HKAudiogramLineSeries filledSymbolUsingMetadata:v27 forEar:v28 radius:1 useEarSpecificColor:v26];

      [v10 capHeight];
      double v47 = v46;
      [v29 size];
      double v49 = (v47 - v48) * 0.5;
      [v29 size];
      double v51 = v50;
      [v29 size];
      objc_msgSend(v15, "setBounds:", 0.0, v49, v51, v52);
      goto LABEL_31;
    case 9:
      uint64_t v20 = +[HKSleepPeriodSeries inBedImageCompatibleWithFont:v10 withColor:v9];
      goto LABEL_30;
    case 10:
      uint64_t v20 = +[HKSleepPeriodSeries asleepImageCompatibleWithFont:v10 withColor:v9];
LABEL_30:
      v29 = (void *)v20;
LABEL_31:
      [v15 setImage:v29];
      goto LABEL_32;
    case 11:
      v29 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_reproductiveHealthKeyColor");
      double v30 = 4.0;
      goto LABEL_22;
    case 12:
      v29 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_reproductiveHealthKeyColor");
      double v30 = 4.0;
      v31 = v29;
      uint64_t v32 = 1;
      goto LABEL_23;
    case 33:
      v33 = [MEMORY[0x1E4F2B860] sharedBehavior];
      v34 = [v33 features];
      int v35 = [v34 yodel];

      if (!v35) {
        goto LABEL_33;
      }
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudiogramLeftEarPointMarkerColor");
      break;
    case 34:
      v37 = [MEMORY[0x1E4F2B860] sharedBehavior];
      v38 = [v37 features];
      int v39 = [v38 yodel];

      if (!v39) {
        goto LABEL_33;
      }
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudiogramRightEarPointMarkerColor");
      break;
    default:
      goto LABEL_33;
  }
  v29 = (void *)v36;
  [v10 capHeight];
  double v30 = v40 * 0.5;
LABEL_22:
  v31 = v29;
  uint64_t v32 = 0;
LABEL_23:
  v41 = +[HKChartSeriesPointMarker chartPointWithColor:v31 radius:v32 style:v30];
  [v15 setImage:v41];

LABEL_32:
LABEL_33:
  id v14 = [v15 image];

  if (v14)
  {
    id v14 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v15];
    v53 = [a1 _iconCache];
    [v53 setObject:v14 forKey:v11];
  }
LABEL_36:

  return v14;
}

+ (id)_cacheKeyForData:(id)a3 foregroundColor:(id)a4 font:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 statisticsType];
  uint64_t v11 = [v9 dataType];

  uint64_t v12 = [v8 hash];
  uint64_t v13 = [v7 hash];

  id v14 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  uint64_t v15 = [v14 hash];
  uint64_t v16 = [NSNumber numberWithInteger:v13 ^ v12 ^ v15 ^ (v11 + (v11 + v10 + (v11 + v10) * (v11 + v10)) / 2)];

  return v16;
}

+ (id)_dataLabelImageForPlusSign:(BOOL)a3 foregroundColor:(id)a4 dimension:(double)a5 strokeOffset:(double)a6 strokeWidth:(double)a7
{
  BOOL v10 = a3;
  id v11 = a4;
  v23.width = a5;
  v23.height = a5;
  UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  double v13 = a5 * 0.5 - a7 * 0.5;
  double v14 = a5 + a6 * -2.0;
  uint64_t v15 = +[HKBarSeries barSeriesRoundedRect:cornerRadius:](HKBarSeries, "barSeriesRoundedRect:cornerRadius:", a6, v13, v14, a7, 1.0);
  id v16 = v11;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v16 CGColor]);
  id v17 = v15;
  CGContextAddPath(CurrentContext, (CGPathRef)[v17 CGPath]);
  CGContextFillPath(CurrentContext);
  if (v10)
  {
    v18 = +[HKBarSeries barSeriesRoundedRect:cornerRadius:](HKBarSeries, "barSeriesRoundedRect:cornerRadius:", v13, a6, a7, v14, 1.0);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v16 CGColor]);
    id v19 = v18;
    CGContextAddPath(CurrentContext, (CGPathRef)[v19 CGPath]);
    CGContextFillPath(CurrentContext);
  }
  uint64_t v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

@end