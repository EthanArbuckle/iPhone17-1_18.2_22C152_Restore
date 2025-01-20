@interface BCSGeoDataParser
+ (id)_validateLatitudeAndLongitudeInString:(id)a3 range:(_NSRange)a4;
+ (id)parseString:(id)a3;
@end

@implementation BCSGeoDataParser

+ (id)parseString:(id)a3
{
  id v4 = a3;
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v5) {
    +[BCSGeoDataParser parseString:].cold.4(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  unint64_t v13 = [v4 length];
  if (v13 > 3)
  {
    unint64_t v23 = v13;
    v24 = [v4 substringToIndex:4];
    v25 = [v24 lowercaseString];

    if ([v25 isEqualToString:@"geo:"])
    {
      v26 = objc_msgSend(a1, "_validateLatitudeAndLongitudeInString:range:", v4, 4, v23 - 4);
      if ([v26 length])
      {
        v27 = NSURL;
        v28 = [NSString stringWithFormat:@"http://maps.apple.com/?q=%@", v26];
        v29 = [v27 URLWithString:v28];

        BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
        if (v30) {
          +[BCSGeoDataParser parseString:](v30, v31, v32, v33, v34, v35, v36, v37);
        }
        v22 = [[BCSParsedURLData alloc] initWithURL:v29 type:6];
      }
      else
      {
        v22 = [[BCSInvalidParsedData alloc] initWithInvalidDataType:6 invalidContents:v4];
      }
    }
    else
    {
      BOOL v38 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v38) {
        +[BCSGeoDataParser parseString:](v38, v39, v40, v41, v42, v43, v44, v45);
      }
      v22 = 0;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v14) {
      +[BCSGeoDataParser parseString:](v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v22 = 0;
  }

  return v22;
}

+ (id)_validateLatitudeAndLongitudeInString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  if (_validateLatitudeAndLongitudeInString_range__once != -1) {
    dispatch_once(&_validateLatitudeAndLongitudeInString_range__once, &__block_literal_global_2);
  }
  uint64_t v7 = objc_msgSend((id)_validateLatitudeAndLongitudeInString_range__geoLatLongPattern, "firstMatchInString:options:range:", v6, 0, location, length);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 rangeAtIndex:1];
    uint64_t v11 = objc_msgSend(v6, "substringWithRange:", v9, v10);
    [v11 doubleValue];
    double v13 = v12;

    if (v13 < -90.0 || v13 > 90.0)
    {
      BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v30) {
        +[BCSGeoDataParser _validateLatitudeAndLongitudeInString:range:](v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    else
    {
      uint64_t v14 = [v8 rangeAtIndex:2];
      uint64_t v16 = objc_msgSend(v6, "substringWithRange:", v14, v15);
      [v16 doubleValue];
      double v18 = v17;

      if (v18 >= -180.0 && v18 <= 180.0)
      {
        uint64_t v19 = [v8 range];
        uint64_t v21 = objc_msgSend(v6, "substringWithRange:", v19, v20);
        goto LABEL_16;
      }
      BOOL v38 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v38) {
        +[BCSGeoDataParser _validateLatitudeAndLongitudeInString:range:](v38, v39, v40, v41, v42, v43, v44, v45);
      }
    }
  }
  else
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22) {
      +[BCSGeoDataParser _validateLatitudeAndLongitudeInString:range:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  uint64_t v21 = 0;
LABEL_16:

  return v21;
}

uint64_t __64__BCSGeoDataParser__validateLatitudeAndLongitudeInString_range___block_invoke()
{
  _validateLatitudeAndLongitudeInString_range__geoLatLongPattern = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"^(-?\\d{1,2}(?:\\.\\d+)?),(-?\\d{1,3}(?:\\.\\d+)?)" options:0 error:0];
  return MEMORY[0x270F9A758]();
}

+ (void)parseString:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)parseString:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validateLatitudeAndLongitudeInString:(uint64_t)a3 range:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validateLatitudeAndLongitudeInString:(uint64_t)a3 range:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_validateLatitudeAndLongitudeInString:(uint64_t)a3 range:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end