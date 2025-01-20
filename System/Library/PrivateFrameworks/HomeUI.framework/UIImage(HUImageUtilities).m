@interface UIImage(HUImageUtilities)
+ (double)hu_scaleSize:()HUImageUtilities toSize:contentMode:;
+ (id)hu_locationArrowTemplate;
+ (id)hu_symbolForDevice:()HUImageUtilities;
+ (id)hu_symbolFromProductPlatform:()HUImageUtilities;
+ (id)hu_systemImageNamed:()HUImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:configuration:;
+ (uint64_t)hu_systemImageNamed:()HUImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:;
- (id)hu_imageScaledToSize:()HUImageUtilities contentMode:;
@end

@implementation UIImage(HUImageUtilities)

+ (id)hu_locationArrowTemplate
{
  v0 = [MEMORY[0x1E4F42A80] systemImageNamed:@"location.fill"];
  v1 = [v0 imageWithRenderingMode:2];

  return v1;
}

+ (double)hu_scaleSize:()HUImageUtilities toSize:contentMode:
{
  double v7 = a1 / a2;
  double v8 = a3 / a4;
  if (a7 == 2)
  {
    if (v7 <= v8) {
      return a3;
    }
    return a4 * v7;
  }
  if (a7 == 1 && v7 < v8) {
    return a4 * v7;
  }
  return a3;
}

- (id)hu_imageScaledToSize:()HUImageUtilities contentMode:
{
  v5 = objc_opt_class();
  [a1 size];
  objc_msgSend(v5, "hu_scaleSize:toSize:contentMode:", a3);
  double v7 = v6;
  double v9 = v8;
  [a1 size];
  if (v11 == v7 && v10 == v9)
  {
    id v23 = a1;
  }
  else
  {
    [a1 scale];
    UIRectIntegralWithScale();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [a1 scale];
    CGFloat v22 = v21;
    v26.width = v18;
    v26.height = v20;
    UIGraphicsBeginImageContextWithOptions(v26, 0, v22);
    objc_msgSend(a1, "drawInRect:", v14, v16, v18, v20);
    UIGraphicsGetImageFromCurrentImageContext();
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v23;
}

+ (uint64_t)hu_systemImageNamed:()HUImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:
{
  return objc_msgSend(a1, "hu_systemImageNamed:withBackgroundColor:symbolColor:size:cornerRadius:configuration:", a3, a4, a5, 0);
}

+ (id)hu_systemImageNamed:()HUImageUtilities withBackgroundColor:symbolColor:size:cornerRadius:configuration:
{
  id v15 = a7;
  double v16 = (void *)MEMORY[0x1E4F42A80];
  id v17 = a8;
  double v18 = [v16 systemImageNamed:a6 withConfiguration:a9];
  double v19 = [v18 imageWithTintColor:v17];

  if (v19)
  {
    [v19 scale];
    CGFloat v21 = v20;
    v29.width = a1;
    v29.height = a2;
    UIGraphicsBeginImageContextWithOptions(v29, 0, v21);
    [v15 setFill];
    CGFloat v22 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a1, a2, a3);
    [v22 fill];
    [v19 size];
    CGFloat v24 = (a1 - v23) * 0.5;
    [v19 size];
    objc_msgSend(v19, "drawAtPoint:", v24, (a2 - v25) * 0.5);
    CGSize v26 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    CGSize v26 = 0;
  }

  return v26;
}

+ (id)hu_symbolForDevice:()HUImageUtilities
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 productInfo];
  uint64_t v6 = [v5 productClass];

  switch(v6)
  {
    case 0:
      double v7 = objc_msgSend(a1, "hu_symbolFromProductPlatform:", v4);
      goto LABEL_33;
    case 1:
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68D58];
      goto LABEL_31;
    case 2:
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68D60];
      goto LABEL_31;
    case 3:
      double v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"ipad"];
        *(_DWORD *)buf = 136315394;
        v36 = "+[UIImage(HUImageUtilities) hu_symbolForDevice:]";
        __int16 v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%s iPad icon: %@", buf, 0x16u);
      }
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68D50];
      goto LABEL_31;
    case 4:
      double v13 = HFLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = [MEMORY[0x1E4F42A80] systemImageNamed:@"appletv.fill"];
        *(_DWORD *)buf = 136315394;
        v36 = "+[UIImage(HUImageUtilities) hu_symbolForDevice:]";
        __int16 v37 = 2112;
        v38 = v14;
        _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%s Apple TV icon: %@", buf, 0x16u);
      }
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68CE8];
      goto LABEL_31;
    case 5:
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68CF0];
      goto LABEL_31;
    case 6:
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = objc_msgSend(MEMORY[0x1E4F691A0], "sharedDispatcher", 0);
      double v16 = [v15 home];
      id v17 = [v16 accessories];

      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v18) {
        goto LABEL_26;
      }
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v31;
      break;
    case 7:
      goto LABEL_27;
    case 8:
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68D30];
      goto LABEL_31;
    case 9:
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68D38];
      goto LABEL_31;
    case 10:
      double v9 = (void *)MEMORY[0x1E4F42A80];
      double v10 = (void *)MEMORY[0x1E4F68D40];
      goto LABEL_31;
    default:
      double v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = (const char *)v4;
        _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Could not fetch icon for %@. Both product class and platform were unknown", buf, 0xCu);
      }

      double v7 = 0;
      goto LABEL_33;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v31 != v20) {
        objc_enumerationMutation(v17);
      }
      CGFloat v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      double v23 = [v22 device];
      int v24 = [v23 isEqual:v4];

      if (v24)
      {
        if ([v22 homePodVariant] == 2)
        {
          v27 = (void *)MEMORY[0x1E4F42A80];
          v28 = (void *)MEMORY[0x1E4F68D20];
          goto LABEL_38;
        }
        if ([v22 homePodVariant] == 1 || objc_msgSend(v22, "homePodVariant") == 3)
        {
          v27 = (void *)MEMORY[0x1E4F42A80];
          v28 = (void *)MEMORY[0x1E4F68D28];
LABEL_38:
          double v25 = [v27 systemImageNamed:*v28];
          CGSize v29 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_keyColor");
          double v7 = [v25 imageWithTintColor:v29];

          goto LABEL_32;
        }
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v19) {
      continue;
    }
    break;
  }
LABEL_26:

LABEL_27:
  double v9 = (void *)MEMORY[0x1E4F42A80];
  double v10 = (void *)MEMORY[0x1E4F68D48];
LABEL_31:
  id v17 = [v9 systemImageNamed:*v10];
  double v25 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_keyColor");
  double v7 = [v17 imageWithTintColor:v25];
LABEL_32:

LABEL_33:

  return v7;
}

+ (id)hu_symbolFromProductPlatform:()HUImageUtilities
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 productInfo];
  uint64_t v5 = [v4 productPlatform];

  uint64_t v6 = [v3 productInfo];
  uint64_t v7 = [v6 productClass];

  switch(v5)
  {
    case 1:
      double v8 = (void *)MEMORY[0x1E4F42A80];
      double v9 = (void *)MEMORY[0x1E4F68D30];
      goto LABEL_22;
    case 2:
      double v8 = (void *)MEMORY[0x1E4F42A80];
      double v9 = (void *)MEMORY[0x1E4F68D58];
      goto LABEL_22;
    case 3:
      double v8 = (void *)MEMORY[0x1E4F42A80];
      double v9 = (void *)MEMORY[0x1E4F68CF0];
      goto LABEL_22;
    case 4:
      if (v7 != 6)
      {
        double v8 = (void *)MEMORY[0x1E4F42A80];
        double v9 = (void *)MEMORY[0x1E4F68CE8];
LABEL_22:
        v12 = [v8 systemImageNamed:*v9];
        CGFloat v22 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_keyColor");
        CGFloat v21 = [v12 imageWithTintColor:v22];
        goto LABEL_23;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      double v10 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      double v11 = [v10 home];
      v12 = [v11 accessories];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v13) {
        goto LABEL_17;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v18 = [v17 device];
          int v19 = [v18 isEqual:v3];

          if (!v19) {
            continue;
          }
          if ([v17 homePodVariant] == 2)
          {
            int v24 = (void *)MEMORY[0x1E4F42A80];
            double v25 = (void *)MEMORY[0x1E4F68D20];
LABEL_29:
            CGFloat v22 = [v24 systemImageNamed:*v25];
            CGSize v26 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_keyColor");
            CGFloat v21 = [v22 imageWithTintColor:v26];

LABEL_23:
            goto LABEL_24;
          }
          if ([v17 homePodVariant] == 1 || objc_msgSend(v17, "homePodVariant") == 3)
          {
            int v24 = (void *)MEMORY[0x1E4F42A80];
            double v25 = (void *)MEMORY[0x1E4F68D28];
            goto LABEL_29;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
LABEL_17:

LABEL_18:
      uint64_t v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v27 = 0;
        _os_log_error_impl(&dword_1BE345000, v20, OS_LOG_TYPE_ERROR, "Unknown product Platform", v27, 2u);
      }

      CGFloat v21 = 0;
LABEL_24:

      return v21;
    default:
      goto LABEL_18;
  }
}

@end