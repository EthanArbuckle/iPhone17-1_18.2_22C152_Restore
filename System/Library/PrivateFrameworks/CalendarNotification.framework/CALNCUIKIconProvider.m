@interface CALNCUIKIconProvider
+ (BOOL)_parseIconIdentifier:(id)a3 intoDateComponents:(id *)a4 calendar:(id *)a5 type:(int64_t *)a6;
+ (CALNCUIKIconProvider)sharedInstance;
+ (id)_identifierEncodingAllowedCharacters;
- (id)identifierForIconWithDate:(id)a3 inCalendar:(id)a4;
- (id)pngDataForIconWithIdentifier:(id)a3;
@end

@implementation CALNCUIKIconProvider

+ (id)_identifierEncodingAllowedCharacters
{
  if (_identifierEncodingAllowedCharacters_onceToken != -1) {
    dispatch_once(&_identifierEncodingAllowedCharacters_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)_identifierEncodingAllowedCharacters_characterSet;
  return v2;
}

void __60__CALNCUIKIconProvider__identifierEncodingAllowedCharacters__block_invoke()
{
  id v3 = [@"-" stringByAppendingString:@"%"];
  v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v3];
  uint64_t v1 = [v0 invertedSet];
  v2 = (void *)_identifierEncodingAllowedCharacters_characterSet;
  _identifierEncodingAllowedCharacters_characterSet = v1;
}

+ (CALNCUIKIconProvider)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CALNCUIKIconProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_5;
  return (CALNCUIKIconProvider *)v2;
}

uint64_t __38__CALNCUIKIconProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_5 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)pngDataForIconWithIdentifier:(id)a3
{
  uint64_t v21 = 0;
  id v3 = a3;
  id v19 = 0;
  id v20 = 0;
  int v4 = [(id)objc_opt_class() _parseIconIdentifier:v3 intoDateComponents:&v20 calendar:&v19 type:&v21];

  id v5 = v20;
  id v6 = v19;
  v7 = 0;
  if (v4)
  {
    v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 scale];
    double v10 = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 182.0, 182.0, v10);
    [v11 setShouldApplyMask:0];
    id v12 = objc_alloc(MEMORY[0x263F4B540]);
    v13 = (void *)[v12 initWithDateComponents:v5 calendar:v6 format:v21 forceNoTextEffects:1];
    v14 = [v13 prepareImageForDescriptor:v11];
    uint64_t v15 = [v14 CGImage];
    if (v15)
    {
      v16 = [MEMORY[0x263F1C6B0] imageWithCGImage:v15 scale:0 orientation:v10];
      v17 = v16;
      if (v16)
      {
        v7 = UIImagePNGRepresentation(v16);
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

+ (BOOL)_parseIconIdentifier:(id)a3 intoDateComponents:(id *)a4 calendar:(id *)a5 type:(int64_t *)a6
{
  double v9 = [a3 componentsSeparatedByString:@"-"];
  if ([v9 count] == 6)
  {
    v38 = a5;
    double v10 = [v9 objectAtIndexedSubscript:0];
    v11 = [v9 objectAtIndexedSubscript:1];
    id v12 = [v9 objectAtIndexedSubscript:2];
    v13 = [v9 objectAtIndexedSubscript:3];
    v14 = [v9 objectAtIndexedSubscript:4];
    uint64_t v15 = [v9 objectAtIndexedSubscript:5];
    int v16 = [v10 intValue];
    BOOL v17 = v16 == 5;
    if (v16 == 5)
    {
      v34 = a6;
      v35 = v11;
      v36 = v10;
      uint64_t v18 = [v11 stringByRemovingPercentEncoding];
      v33 = v12;
      [v12 stringByRemovingPercentEncoding];
      v20 = id v19 = v14;
      v32 = v13;
      int64_t v37 = (int)[v13 intValue];
      v29 = v19;
      uint64_t v21 = (int)[v19 intValue];
      uint64_t v22 = (int)[v15 intValue];
      v23 = objc_opt_new();
      v31 = (void *)v18;
      v24 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:v18];
      v30 = (void *)v20;
      v25 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v20];
      [v24 setLocale:v25];

      [v23 setCalendar:v24];
      [v23 setDay:v22];
      if (v37 == 1)
      {
        [v23 setMonth:v21];
        v27 = v38;
      }
      else
      {
        uint64_t v26 = v21;
        v27 = v38;
        if (!v37) {
          [v23 setWeekday:v26];
        }
      }
      v11 = v35;
      double v10 = v36;
      v14 = v29;
      if (a4) {
        *a4 = v23;
      }
      if (v27) {
        id *v27 = v24;
      }
      if (v34) {
        int64_t *v34 = v37;
      }

      v13 = v32;
      id v12 = v33;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)identifierForIconWithDate:(id)a3 inCalendar:(id)a4
{
  v24[6] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF910] date];
  }
  v23 = [v6 components:536 fromDate:v5];
  uint64_t v22 = [v23 weekday];
  uint64_t v7 = [v23 day];
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 5);
  v8 = [v6 calendarIdentifier];
  double v9 = [(id)objc_opt_class() _identifierEncodingAllowedCharacters];
  double v10 = [v8 stringByAddingPercentEncodingWithAllowedCharacters:v9];

  v11 = [v6 locale];
  id v12 = [v11 localeIdentifier];
  v13 = [(id)objc_opt_class() _identifierEncodingAllowedCharacters];
  v14 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v13];

  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 0);
  int v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v22);
  BOOL v17 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v7);
  v24[0] = v21;
  v24[1] = v10;
  v24[2] = v14;
  v24[3] = v15;
  v24[4] = v16;
  v24[5] = v17;
  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:6];
  id v19 = [v18 componentsJoinedByString:@"-"];

  return v19;
}

@end