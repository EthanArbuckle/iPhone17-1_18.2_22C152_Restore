@interface ADLayoutUtils
+ (BOOL)aspectRatio:(float)a3 matchesAspectRatio:(float)a4;
+ (BOOL)isLandscape:(unint64_t)a3;
+ (BOOL)isLandscapeSize:(CGSize)a3;
+ (float)aspectRatioForKnownLayout:(unint64_t)a3;
+ (id)layoutAsString:(unint64_t)a3;
+ (unint64_t)layoutForSize:(CGSize)a3;
+ (unint64_t)transposeLayout:(unint64_t)a3;
@end

@implementation ADLayoutUtils

+ (unint64_t)layoutForSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v5 = 0;
  uint64_t v16 = *MEMORY[0x263EF8340];
  float v6 = a3.width / a3.height;
  while (1)
  {
    unint64_t v7 = qword_247F26438[v5];
    +[ADLayoutUtils aspectRatioForKnownLayout:v7];
    LODWORD(v9) = v8;
    *(float *)&double v10 = v6;
    if (+[ADLayoutUtils aspectRatio:v10 matchesAspectRatio:v9])
    {
      break;
    }
    if (++v5 == 4)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 134218240;
          CGFloat v13 = width;
          __int16 v14 = 2048;
          CGFloat v15 = height;
          _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Size %2.2fx%2.2f does not match any known layout", (uint8_t *)&v12, 0x16u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 134218240;
        CGFloat v13 = width;
        __int16 v14 = 2048;
        CGFloat v15 = height;
        _os_log_debug_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Size %2.2fx%2.2f does not match any known layout", (uint8_t *)&v12, 0x16u);
      }
      return 254;
    }
  }
  return v7;
}

+ (float)aspectRatioForKnownLayout:(unint64_t)a3
{
  float result = 0.0;
  if (a3 <= 3) {
    return flt_247F246C0[a3];
  }
  return result;
}

+ (BOOL)aspectRatio:(float)a3 matchesAspectRatio:(float)a4
{
  return fabs((float)(a3 / a4) + -1.0) < 0.07;
}

+ (BOOL)isLandscapeSize:(CGSize)a3
{
  return a3.width > a3.height;
}

+ (BOOL)isLandscape:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (unint64_t)transposeLayout:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a3 < 4) {
    return qword_247F26438[a3];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = +[ADLayoutUtils layoutAsString:a3];
    int v6 = 138412290;
    unint64_t v7 = v5;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot get transpose layout for layout %@", (uint8_t *)&v6, 0xCu);
  }
  return 254;
}

+ (id)layoutAsString:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = @"kADLayoutLandscape_4_3";
  switch(a3)
  {
    case 0uLL:
      break;
    case 1uLL:
      v4 = @"kADLayoutPortrait_3_4";
      break;
    case 2uLL:
      v4 = @"kADLayoutLandscape_16_9";
      break;
    case 3uLL:
      v4 = @"kADLayoutPortrait_9_16";
      break;
    default:
      if (a3 == 254)
      {
        v4 = @"kADLayoutUnknown";
      }
      else if (a3 == 255)
      {
        v4 = @"kADLayoutDefault";
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v7 = a3;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown layout numbered: %lu", buf, 0xCu);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }

  return v4;
}

@end