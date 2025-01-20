@interface AXAuditContrastDetectionManager
+ (id)sharedManager;
- (double)_euclideanDistanceBetweenColor1:(id)a3 color2:(id)a4;
- (double)contrastRatioForColor1:(id)a3 color2:(id)a4;
- (double)luminanceForColor:(id)a3;
- (id)_topColorsForColors:(id)a3;
- (id)_topColorsForImageData:(id)a3 optimized:(BOOL)a4;
- (id)auditDisplayStringForAuditColor:(id)a3;
- (id)colorForHexValueString:(id)a3;
- (id)contrastResultForInput:(id)a3;
- (id)getSuggestedColorForFailContrast:(id)a3 backgroundColor:(id)a4;
- (id)pixelColorInImagePixelData:(__CFData *)a3 atX:(int)a4 atY:(int)a5 width:(double)a6;
@end

@implementation AXAuditContrastDetectionManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__AXAuditContrastDetectionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_3 != -1) {
    dispatch_once(&sharedManager_onceToken_3, block);
  }
  v2 = (void *)sharedManager_instance_3;

  return v2;
}

uint64_t __48__AXAuditContrastDetectionManager_sharedManager__block_invoke()
{
  sharedManager_instance_3 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)contrastResultForInput:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(AXAuditContrastResult);
  v6 = [v4 imageData];
  v7 = [(AXAuditContrastDetectionManager *)self _topColorsForImageData:v6 optimized:1];

  if ((unint64_t)[v7 count] < 2)
  {
    uint64_t v17 = 0;
    goto LABEL_33;
  }
  v8 = [v4 foregroundHexColorValue];
  v9 = [(AXAuditContrastDetectionManager *)self colorForHexValueString:v8];

  v10 = [v4 backgroundHexColorValue];
  v11 = [(AXAuditContrastDetectionManager *)self colorForHexValueString:v10];

  v12 = [v7 objectAtIndexedSubscript:0];
  v13 = [v7 objectAtIndexedSubscript:1];
  v40 = v13;
  v41 = v12;
  if (!v9)
  {
    id v15 = v12;
    id v16 = v13;
    goto LABEL_7;
  }
  id v14 = v9;
  id v15 = v14;
  if (v11)
  {
    id v16 = v11;
LABEL_7:
    id v18 = v16;
    goto LABEL_8;
  }
  char v21 = [v14 isEqual:v12];
  id v18 = v13;
  if ((v21 & 1) == 0)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v7;
    uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v38 = v9;
      uint64_t v24 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v43 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          [(AXAuditContrastDetectionManager *)self _euclideanDistanceBetweenColor1:v15 color2:v26];
          if (v27 > 0.1)
          {
            id v37 = v26;

            id v18 = v37;
            goto LABEL_37;
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v23) {
          continue;
        }
        break;
      }
LABEL_37:
      v9 = v38;
    }

    v11 = 0;
  }
LABEL_8:
  [(AXAuditContrastDetectionManager *)self contrastRatioForColor1:v15 color2:v18];
  double v20 = v19;
  if (![v4 enhanced])
  {
    if (v20 >= 4.5)
    {
      uint64_t v17 = 11;
      goto LABEL_32;
    }
    if (v20 < 3.1)
    {
      uint64_t v17 = 13;
      goto LABEL_32;
    }
    [v4 fontSize];
    BOOL v29 = v32 < 18.0;
    uint64_t v30 = 12;
    uint64_t v31 = 11;
LABEL_29:
    if (v29) {
      uint64_t v17 = v30;
    }
    else {
      uint64_t v17 = v31;
    }
    goto LABEL_32;
  }
  if (v20 >= 7.1)
  {
    uint64_t v17 = 14;
    goto LABEL_32;
  }
  if (v20 >= 4.5)
  {
    [v4 fontSize];
    BOOL v29 = v28 < 18.0;
    uint64_t v30 = 15;
    uint64_t v31 = 14;
    goto LABEL_29;
  }
  uint64_t v17 = 16;
LABEL_32:
  [(AXAuditContrastResult *)v5 setRatio:v20];
  v33 = [(AXAuditContrastDetectionManager *)self auditDisplayStringForAuditColor:v9];
  [(AXAuditContrastResult *)v5 setTextColor:v33];

  v34 = [(AXAuditContrastDetectionManager *)self auditDisplayStringForAuditColor:v15];
  [(AXAuditContrastResult *)v5 setPrimaryColor:v34];

  v35 = [(AXAuditContrastDetectionManager *)self auditDisplayStringForAuditColor:v18];
  [(AXAuditContrastResult *)v5 setSecondaryColor:v35];

LABEL_33:
  [(AXAuditContrastResult *)v5 setClassification:v17];
  [v4 fontSize];
  -[AXAuditContrastResult setFontSize:](v5, "setFontSize:");

  return v5;
}

- (id)colorForHexValueString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"#"];
    v5 = [v3 stringByTrimmingCharactersInSet:v4];

    int v8 = 0;
    v6 = [MEMORY[0x263F08B08] scannerWithString:v5];
    [v6 scanHexInt:&v8];
    id v3 = [MEMORY[0x263F1C550] colorWithRed:(float)((float)BYTE2(v8) / 255.0) green:(float)((float)BYTE1(v8) / 255.0) blue:(float)((float)v8 / 255.0) alpha:1.0];
  }
  else
  {
    v5 = 0;
  }

  return v3;
}

- (id)_topColorsForImageData:(id)a3 optimized:(BOOL)a4
{
  id v6 = a3;
  id v7 = (id) [objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v6];
  int v8 = (CGImage *)[v7 CGImage];
  if (!v8)
  {
    v25 = 0;
    goto LABEL_23;
  }
  v9 = v8;
  DataProvider = CGImageGetDataProvider(v8);
  CFDataRef v11 = CGDataProviderCopyData(DataProvider);
  size_t Width = CGImageGetWidth(v9);
  double v13 = (double)Width;
  size_t Height = CGImageGetHeight(v9);
  double v15 = (double)Height;
  id v16 = objc_alloc_init(MEMORY[0x263F08760]);
  id v30 = v6;
  if (a4)
  {
    LODWORD(Height) = llround(v13 * 0.125);
    double v17 = v13 - round(v13 * 0.125);
    if (v17 > (double)(int)Height)
    {
      id v18 = 0;
      int v19 = (int)(v15 * 0.5);
      double v20 = round(v15 / 10.0);
      int v21 = (int)((double)v19 + v20 * 2.0);
      uint64_t v22 = (int)((double)v19 + v20 * -2.0);
      do
      {
        for (uint64_t i = v22; (int)i <= v21; uint64_t i = (int)(v20 + (double)(int)i))
        {
          uint64_t v24 = v18;
          id v18 = [(AXAuditContrastDetectionManager *)self pixelColorInImagePixelData:v11 atX:Height atY:i width:v13];

          if (v18) {
            [v16 addObject:v18];
          }
        }
        size_t Height = (Height + 1);
      }
      while (v17 > (double)(int)Height);
      goto LABEL_22;
    }
  }
  else if (Width)
  {
    uint64_t v26 = 0;
    id v18 = 0;
    do
    {
      if (Height)
      {
        uint64_t v27 = 0;
        do
        {
          double v28 = v18;
          id v18 = [(AXAuditContrastDetectionManager *)self pixelColorInImagePixelData:v11 atX:v26 atY:v27 width:v13];

          if (v18) {
            [v16 addObject:v18];
          }
          uint64_t v27 = (v27 + 1);
        }
        while ((double)(int)v27 < v15);
      }
      uint64_t v26 = (v26 + 1);
    }
    while ((double)(int)v26 < v13);
    goto LABEL_22;
  }
  id v18 = 0;
LABEL_22:
  CFRelease(v11);
  v25 = [(AXAuditContrastDetectionManager *)self _topColorsForColors:v16];

  id v6 = v30;
LABEL_23:

  return v25;
}

- (double)_euclideanDistanceBetweenColor1:(id)a3 color2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  double v8 = 0.0;
  if (v5)
  {
    if (v6)
    {
      v9 = (CGColor *)[v5 CGColor];
      v10 = (CGColor *)[v7 CGColor];
      if (CGColorGetNumberOfComponents(v9) == 4 && CGColorGetNumberOfComponents(v10) == 4)
      {
        Components = CGColorGetComponents(v9);
        double v12 = *Components;
        double v13 = Components[1];
        double v14 = Components[2];
        double v15 = CGColorGetComponents(v10);
        float v16 = v12 - *v15;
        double v17 = (float)(v16 * v16);
        float v18 = v13 - v15[1];
        double v19 = (float)(v18 * v18) * 4.0;
        float v20 = v14 - v15[2];
        double v21 = (float)(v20 * v20);
        double v22 = v19 + v17 * 3.0 + v21 * 2.0;
        double v23 = v19 + v17 * 2.0 + v21 * 3.0;
        if ((v12 + *v15) * 0.5 >= 0.5) {
          double v23 = v22;
        }
        float v24 = v23;
        double v8 = sqrtf(v24);
      }
    }
  }

  return v8;
}

- (id)_topColorsForColors:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 count])
  {
    id v20 = 0;
    goto LABEL_20;
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6)
  {

    double v19 = 0;
    v9 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  double v22 = v4;
  id v23 = v3;
  double v8 = 0;
  v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v24 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v26 != v24) {
        objc_enumerationMutation(v5);
      }
      double v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      unint64_t v14 = [v5 countForObject:v13];
      unint64_t v15 = v14;
      if (v14 <= v10)
      {
        id v16 = v13;
        if (v14 <= v11) {
          continue;
        }
      }
      else
      {
        id v16 = v8;

        v9 = v16;
        double v8 = v13;
        unint64_t v17 = v15;
        unint64_t v15 = v10;
        unint64_t v10 = v17;
      }
      id v18 = v13;

      v9 = v16;
      unint64_t v11 = v15;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);

  id v4 = v22;
  double v19 = v8;
  if (v8) {
    [v22 addObject:v8];
  }
  id v3 = v23;
  if (v9) {
    [v22 addObject:v9];
  }
LABEL_19:
  id v20 = v4;

LABEL_20:

  return v20;
}

- (id)pixelColorInImagePixelData:(__CFData *)a3 atX:(int)a4 atY:(int)a5 width:(double)a6
{
  BytePtr = CFDataGetBytePtr(a3);
  int64_t v11 = vcvtd_n_s64_f64((double)a4 + a6 * (double)a5, 2uLL);
  CFIndex Length = CFDataGetLength(a3);
  if (Length >= v11) {
    int64_t v17 = v11;
  }
  else {
    int64_t v17 = Length;
  }
  id v18 = &BytePtr[v17];
  LOBYTE(v13) = *v18;
  double v19 = (float)((float)v13 / 255.0);
  LOBYTE(v14) = v18[1];
  double v20 = (float)((float)v14 / 255.0);
  LOBYTE(v15) = v18[2];
  double v21 = (float)((float)v15 / 255.0);
  LOBYTE(v16) = v18[3];
  double v22 = (void *)MEMORY[0x263F1C550];

  return (id)[v22 colorWithRed:v19 green:v20 blue:v21 alpha:(float)((float)v16 / 255.0)];
}

- (double)luminanceForColor:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  double v5 = 0.0;
  if (v3)
  {
    uint64_t v6 = (CGColor *)[v3 CGColor];
    if (CGColorGetNumberOfComponents(v6) == 4)
    {
      Components = CGColorGetComponents(v6);
      double v8 = *Components;
      double v9 = Components[1];
      double v10 = Components[2];
      if (*Components <= 0.03928) {
        double v11 = v8 / 12.92;
      }
      else {
        double v11 = pow((v8 + 0.055) / 1.055, 2.4);
      }
      if (v9 <= 0.03928) {
        double v12 = v9 / 12.92;
      }
      else {
        double v12 = pow((v9 + 0.055) / 1.055, 2.4);
      }
      double v13 = v12 * 0.7152 + v11 * 0.2126;
      if (v10 <= 0.03928) {
        double v14 = v10 / 12.92;
      }
      else {
        double v14 = pow((v10 + 0.055) / 1.055, 2.4);
      }
      double v5 = v13 + v14 * 0.0722;
    }
  }

  return v5;
}

- (double)contrastRatioForColor1:(id)a3 color2:(id)a4
{
  id v6 = a4;
  [(AXAuditContrastDetectionManager *)self luminanceForColor:a3];
  double v8 = v7;
  [(AXAuditContrastDetectionManager *)self luminanceForColor:v6];
  double v10 = v9;

  double result = (v8 + 0.05) / (v10 + 0.05);
  if (v10 > v8) {
    return 1.0 / result;
  }
  return result;
}

- (id)auditDisplayStringForAuditColor:(id)a3
{
  if (a3)
  {
    id v4 = (CGColor *)[a3 CGColor];
    if (CGColorGetNumberOfComponents(v4) == 4)
    {
      Components = CGColorGetComponents(v4);
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"#%02X%02X%02X", llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0));
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)getSuggestedColorForFailContrast:(id)a3 backgroundColor:(id)a4
{
  return 0;
}

@end