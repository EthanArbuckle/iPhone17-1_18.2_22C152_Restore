@interface GKGame(UI)
+ (__CFString)platformDisplayString:()UI;
+ (double)serverImageSizeForIconStyle:()UI;
+ (void)preloadIconsForGames:()UI style:handler:;
- (id)_imageSourceForIconSize:()UI;
- (id)_imageURLForIconStyle:()UI;
- (id)cachedIconForStyle:()UI;
- (id)iconForStyle:()UI;
- (id)imageSourceForIconStyle:()UI;
- (id)imageSourceForiOSIconStyle:()UI;
- (id)loadIconForSize:()UI scale:withCompletionHandler:;
- (id)loadIconForStyle:()UI withCompletionHandler:;
- (id)localImageSourceWithName:()UI imageBrush:;
- (id)logoImageWithMaximumSize:()UI;
- (id)macBrushForIconStyle:()UI;
- (id)networkImageSourceWithName:()UI imageBrush:;
- (id)utilityService;
- (uint64_t)URLStringForImageWithShineIfNeeded;
- (uint64_t)isInstalled;
@end

@implementation GKGame(UI)

- (uint64_t)isInstalled
{
  v2 = [a1 bundleIdentifier];

  if (v2) {
    return 0;
  }
  v4 = [MEMORY[0x1E4F63698] defaultWorkspace];
  v5 = [a1 bundleIdentifier];
  uint64_t v6 = [v4 applicationIsInstalled:v5];

  return v6;
}

- (id)utilityService
{
  v0 = [MEMORY[0x1E4F636C8] daemonProxy];
  v1 = [v0 utilityService];

  return v1;
}

- (id)networkImageSourceWithName:()UI imageBrush:
{
  v5 = (objc_class *)MEMORY[0x1E4F639E0];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithName:v7 imageBrush:v6];

  return v8;
}

- (id)localImageSourceWithName:()UI imageBrush:
{
  v5 = (objc_class *)MEMORY[0x1E4F639C8];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithName:v7 imageBrush:v6];

  return v8;
}

+ (double)serverImageSizeForIconStyle:()UI
{
  double result = 128.0;
  switch(a3)
  {
    case 2:
    case 3:
      v4 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 128.0);
      uint64_t v5 = [v4 userInterfaceIdiom];

      if (v5 != 1) {
        return 128.0;
      }
      if (*MEMORY[0x1E4F63830] && *MEMORY[0x1E4F63A38] == 0) {
        return 128.0;
      }
      return 256.0;
    case 4:
    case 5:
    case 6:
    case 7:
      return result;
    case 8:
    case 10:
      return 64.0;
    case 9:
      return 256.0;
    default:
      v8 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 128.0);
      uint64_t v9 = [v8 userInterfaceIdiom];

      if (v9 != 1) {
        return 64.0;
      }
      if (*MEMORY[0x1E4F63830] && *MEMORY[0x1E4F63A38] == 0) {
        return 64.0;
      }
      else {
        return 128.0;
      }
  }
}

- (id)_imageURLForIconStyle:()UI
{
  [(id)objc_opt_class() serverImageSizeForIconStyle:a3];
  double v5 = v4;
  id v6 = [a1 internal];
  id v7 = [v6 icons];
  v8 = [MEMORY[0x1E4F639F0] sharedController];
  [v8 greatestScreenScale];
  uint64_t v9 = objc_msgSend(v7, "_gkImageURLForSize:scale:", (uint64_t)v5);

  return v9;
}

- (id)imageSourceForiOSIconStyle:()UI
{
  double v5 = [MEMORY[0x1E4F63A28] brush];
  id v6 = v5;
  if (a3 > 9) {
    goto LABEL_14;
  }
  if (((1 << a3) & 0x6C) != 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_3;
    block[3] = &unk_1E5F63350;
    block[4] = a1;
    id v12 = v5;
    if (imageSourceForiOSIconStyle__onceToken_12 != -1) {
      dispatch_once(&imageSourceForiOSIconStyle__onceToken_12, block);
    }
    id v7 = (id)imageSourceForiOSIconStyle__sImageSource_11;
    v8 = v12;
LABEL_17:

    goto LABEL_18;
  }
  if (a3 == 7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke;
    v15[3] = &unk_1E5F63350;
    id v16 = v5;
    uint64_t v17 = a1;
    if (imageSourceForiOSIconStyle__onceToken != -1) {
      dispatch_once(&imageSourceForiOSIconStyle__onceToken, v15);
    }
    id v7 = (id)imageSourceForiOSIconStyle__sharingImageSource;
    v8 = v16;
    goto LABEL_17;
  }
  if (a3 != 9)
  {
LABEL_14:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_2;
    v13[3] = &unk_1E5F63350;
    v13[4] = a1;
    id v14 = v5;
    if (imageSourceForiOSIconStyle__onceToken_7 != -1) {
      dispatch_once(&imageSourceForiOSIconStyle__onceToken_7, v13);
    }
    id v7 = (id)imageSourceForiOSIconStyle__sImageSource;
    v8 = v14;
    goto LABEL_17;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__GKGame_UI__imageSourceForiOSIconStyle___block_invoke_4;
  v10[3] = &unk_1E5F62EB0;
  v10[4] = a1;
  if (imageSourceForiOSIconStyle__onceToken_17 != -1) {
    dispatch_once(&imageSourceForiOSIconStyle__onceToken_17, v10);
  }
  id v7 = (id)imageSourceForiOSIconStyle__sImageSource_16;
LABEL_18:

  return v7;
}

- (id)macBrushForIconStyle:()UI
{
  double v4 = [MEMORY[0x1E4F639D8] brush];
  [(id)objc_opt_class() serverImageSizeForIconStyle:a3];
  objc_msgSend(v4, "setOutputSize:");

  return v4;
}

- (id)imageSourceForIconStyle:()UI
{
  double v5 = objc_msgSend(a1, "imageSourceForiOSIconStyle:");
  if ([a1 platform] == 2)
  {
    id v6 = [a1 macBrushForIconStyle:a3];
    id v7 = [MEMORY[0x1E4F63A10] sharedTheme];
    v8 = [v7 macGameIconSource];

    double v5 = [v8 subsourceWithBrush:v6];
  }

  return v5;
}

- (id)iconForStyle:()UI
{
  double v5 = objc_msgSend(a1, "_imageURLForIconStyle:");
  id v6 = [a1 imageSourceForIconStyle:a3];
  id v7 = [v6 cachedImageForIdentifier:v5];

  return v7;
}

- (id)cachedIconForStyle:()UI
{
  double v5 = objc_msgSend(a1, "_imageURLForIconStyle:");
  id v6 = [a1 imageSourceForIconStyle:a3];
  id v7 = [v6 fastCachedOrDefaultImageForIdentifier:v5];

  return v7;
}

- (uint64_t)URLStringForImageWithShineIfNeeded
{
  return [a1 _imageURLForIconStyle:0];
}

- (id)_imageSourceForIconSize:()UI
{
  if (a2 != a3)
  {
    double v5 = NSString;
    id v6 = [NSString stringWithFormat:@"Assertion failed"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKGame+UI.m"];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [v5 stringWithFormat:@"%@ (size.width == size.height)\n[%s (%s:%d)]", v6, "-[GKGame(UI) _imageSourceForIconSize:]", objc_msgSend(v8, "UTF8String"), 241];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  v10 = [MEMORY[0x1E4F63A20] brush];
  v11 = v10;
  if (a2 <= 64.0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke;
    block[3] = &unk_1E5F63350;
    block[4] = a1;
    id v12 = &v23;
    id v23 = v10;
    if (_imageSourceForIconSize__onceToken != -1) {
      dispatch_once(&_imageSourceForIconSize__onceToken, block);
    }
    v13 = &_imageSourceForIconSize__source64;
  }
  else if (a2 <= 128.0)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke_2;
    v20[3] = &unk_1E5F63350;
    v20[4] = a1;
    id v12 = &v21;
    id v21 = v10;
    if (_imageSourceForIconSize__onceToken_43 != -1) {
      dispatch_once(&_imageSourceForIconSize__onceToken_43, v20);
    }
    v13 = &_imageSourceForIconSize__source128;
  }
  else if (a2 <= 256.0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke_3;
    v18[3] = &unk_1E5F63350;
    v18[4] = a1;
    id v12 = &v19;
    id v19 = v10;
    if (_imageSourceForIconSize__onceToken_47 != -1) {
      dispatch_once(&_imageSourceForIconSize__onceToken_47, v18);
    }
    v13 = &_imageSourceForIconSize__source256;
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __38__GKGame_UI___imageSourceForIconSize___block_invoke_4;
    v16[3] = &unk_1E5F63350;
    v16[4] = a1;
    id v12 = &v17;
    id v17 = v10;
    if (_imageSourceForIconSize__onceToken_51 != -1) {
      dispatch_once(&_imageSourceForIconSize__onceToken_51, v16);
    }
    v13 = &_imageSourceForIconSize__source512;
  }
  id v14 = (id)*v13;

  return v14;
}

- (id)loadIconForSize:()UI scale:withCompletionHandler:
{
  id v10 = a6;
  v11 = objc_msgSend(a1, "_imageSourceForIconSize:", a2 * a4, a3 * a4);
  id v12 = [a1 internal];
  v13 = [v12 icons];
  id v14 = v13;
  if (a4 == 0.0)
  {
    v15 = [MEMORY[0x1E4F639F0] sharedController];
    [v15 greatestScreenScale];
    id v16 = objc_msgSend(v14, "_gkImageURLForSize:scale:", (uint64_t)a2);
  }
  else
  {
    id v16 = [v13 _gkImageURLForSize:(uint64_t)a2 scale:a4];
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__GKGame_UI__loadIconForSize_scale_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E5F64018;
  id v21 = v10;
  id v17 = v10;
  [v11 loadImageForURLString:v16 reference:a1 queue:MEMORY[0x1E4F14428] handler:v20];
  v18 = [v11 fastCachedImageForIdentifier:v16];

  return v18;
}

- (id)loadIconForStyle:()UI withCompletionHandler:
{
  id v6 = a4;
  id v7 = [a1 imageSourceForIconStyle:a3];
  id v8 = [a1 _imageURLForIconStyle:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__GKGame_UI__loadIconForStyle_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5F64018;
  id v13 = v6;
  id v9 = v6;
  [v7 loadImageForURLString:v8 reference:a1 queue:MEMORY[0x1E4F14428] handler:v12];
  id v10 = [v7 fastCachedImageForIdentifier:v8];

  return v10;
}

+ (void)preloadIconsForGames:()UI style:handler:
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F636D8];
  id v10 = NSString;
  id v11 = a3;
  id v12 = objc_msgSend(v10, "stringWithFormat:", @"%s:%d %s", "GKGame+UI.m", 320, "+[GKGame(UI) preloadIconsForGames:style:handler:]");
  id v13 = [v9 dispatchGroupWithName:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__GKGame_UI__preloadIconsForGames_style_handler___block_invoke;
  v15[3] = &unk_1E5F64068;
  id v14 = v13;
  id v16 = v14;
  uint64_t v17 = a4;
  uint64_t v18 = a1;
  [v11 enumerateObjectsWithOptions:1 usingBlock:v15];

  if (v8) {
    [v14 notifyOnMainQueueWithBlock:v8];
  }
}

- (id)logoImageWithMaximumSize:()UI
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GKGame_UI__logoImageWithMaximumSize___block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = a1;
  if (logoImageWithMaximumSize__onceToken != -1) {
    dispatch_once(&logoImageWithMaximumSize__onceToken, block);
  }
  double v5 = [MEMORY[0x1E4F636F0] currentGame];
  id v6 = [v5 bundleIdentifier];

  id v7 = [NSString stringWithFormat:@"%@-logo(%g,%g)", v6, *(void *)&a2, *(void *)&a3];
  id v8 = [(id)logoImageWithMaximumSize__sImageSource cachedImageForIdentifier:v7];
  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F63698] defaultWorkspace];
    id v10 = [v9 applicationProxyForBundleID:v6];
    id v11 = [v10 bundle];
    id v12 = [v11 infoDictionary];
    id v13 = [v12 objectForKeyedSubscript:@"GKDashboardLogo"];
    if (v13)
    {
      id v14 = [v11 pathForResource:v13 ofType:0];
      if (v14)
      {
        v15 = [MEMORY[0x1E4FB1818] imageWithContentsOfFile:v14];
        if (v15)
        {
          id v8 = v15;
          [v15 size];
          if (v17 > a3)
          {
            double v18 = v16 * (a3 / v17);
            v31 = v9;
            id v19 = (void *)MEMORY[0x1E4F639C0];
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __39__GKGame_UI__logoImageWithMaximumSize___block_invoke_75;
            v32[3] = &unk_1E5F64090;
            id v33 = v8;
            double v34 = v18;
            double v35 = a3;
            v20 = objc_msgSend(v19, "contextDrawnWithSize:scale:options:usingBlock:", 4, v32, v18, a3, 1.0);
            [(id)logoImageWithMaximumSize__sImageSource cacheImageFromContext:v20 forIdentifier:v7];

            id v9 = v31;
          }

LABEL_24:
          goto LABEL_25;
        }
        v24 = (NSObject **)MEMORY[0x1E4F63860];
        v25 = *MEMORY[0x1E4F63860];
        if (!*MEMORY[0x1E4F63860])
        {
          id v26 = (id)GKOSLoggers();
          v25 = *v24;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[GKGame(UI) logoImageWithMaximumSize:]((uint64_t)v14, v25);
        }
      }
      else
      {
        id v21 = (NSObject **)MEMORY[0x1E4F63860];
        v22 = *MEMORY[0x1E4F63860];
        if (!*MEMORY[0x1E4F63860])
        {
          id v23 = (id)GKOSLoggers();
          v22 = *v21;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[GKGame(UI) logoImageWithMaximumSize:](v22);
        }
      }
    }
    if (!*MEMORY[0x1E4F63860]) {
      id v27 = (id)GKOSLoggers();
    }
    v28 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v38 = v10;
      __int16 v39 = 2112;
      v40 = v11;
      __int16 v41 = 2048;
      v42 = v12;
      __int16 v43 = 2112;
      v44 = v13;
      _os_log_error_impl(&dword_1AF250000, v28, OS_LOG_TYPE_ERROR, "Logo image missing: proxy:%@ bundle:%@ dict:%p resourceName:%@", buf, 0x2Au);
    }
    id v8 = 0;
    goto LABEL_24;
  }
LABEL_25:
  id v29 = v8;

  return v29;
}

+ (__CFString)platformDisplayString:()UI
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F63640]]
    || [v3 isEqualToString:*MEMORY[0x1E4F63648]])
  {
    double v4 = NSString;
    double v5 = GKGameCenterUIFrameworkBundle();
    id v6 = GKGetLocalizedStringFromTableInBundle();
    id v7 = GKGameCenterUIFrameworkBundle();
    id v8 = GKGetLocalizedStringFromTableInBundle();
    id v9 = [v4 stringWithFormat:@"%@, %@", v6, v8];

LABEL_9:
    goto LABEL_10;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F63628]]
    || [v3 isEqualToString:*MEMORY[0x1E4F63630]]
    || [v3 isEqualToString:*MEMORY[0x1E4F63638]])
  {
    double v5 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  id v9 = &stru_1F07B2408;
LABEL_10:

  return v9;
}

- (void)logoImageWithMaximumSize:()UI .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_debug_impl(&dword_1AF250000, log, OS_LOG_TYPE_DEBUG, "Logo image resource missing:%@", (uint8_t *)&v1, 0xCu);
}

- (void)logoImageWithMaximumSize:()UI .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AF250000, a2, OS_LOG_TYPE_DEBUG, "Couldn't load image resource at path:%@", (uint8_t *)&v2, 0xCu);
}

@end