@interface AVMetadataItem(AVAirSerialization)
+ (id)airRepresentationForArray:()AVAirSerialization;
+ (id)itemArrayWithAirRepresentations:()AVAirSerialization;
+ (id)itemWithAirDictionaryRepresentation:()AVAirSerialization;
- (id)airDictionaryRepresentation;
@end

@implementation AVMetadataItem(AVAirSerialization)

- (id)airDictionaryRepresentation
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [a1 identifier];
  [v2 setObject:v3 forKeyedSubscript:@"identifier"];

  v4 = [a1 extendedLanguageTag];
  [v2 setObject:v4 forKeyedSubscript:@"extendedLanguageTag"];

  v5 = [a1 locale];
  v6 = [v5 localeIdentifier];
  [v2 setObject:v6 forKeyedSubscript:@"localeIdentifier"];

  [a1 time];
  if (v45)
  {
    v7 = NSNumber;
    [a1 time];
    v8 = [v7 numberWithDouble:CMTimeGetSeconds(&time)];
    [v2 setObject:v8 forKeyedSubscript:@"time"];
  }
  [a1 duration];
  if (v43)
  {
    v9 = NSNumber;
    [a1 duration];
    v10 = [v9 numberWithDouble:CMTimeGetSeconds(&v42)];
    [v2 setObject:v10 forKeyedSubscript:@"duration"];
  }
  v11 = [a1 dataType];
  [v2 setObject:v11 forKeyedSubscript:@"dataType"];

  if (![a1 statusOfValueForKey:@"value" error:0])
  {
    v12 = _avairlog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[AVMetadataItem(AVAirSerialization) airDictionaryRepresentation]";
      __int16 v49 = 2112;
      v50 = a1;
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s ** WARNING: the value of this metadata item %@ has not yet been loaded; we're about to force it",
        buf,
        0x16u);
    }
  }
  v13 = [a1 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v13 base64EncodedStringWithOptions:32];
    uint64_t v15 = [NSString stringWithFormat:@"b64:%@", v14];

    v13 = (void *)v15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = +[AVInternetDateFormatter internetDateFormatter];
    uint64_t v17 = [v16 stringFromDate:v13];

    v13 = (void *)v17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v18 = [a1 stringValue];

    v13 = (void *)v18;
  }
  v37 = v13;
  [v2 setObject:v13 forKeyedSubscript:@"value"];
  v19 = [a1 startDate];

  if (v19)
  {
    v20 = +[AVInternetDateFormatter internetDateFormatter];
    v21 = [a1 startDate];
    v22 = [v20 stringFromDate:v21];
    [v2 setObject:v22 forKeyedSubscript:@"startDate"];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v23 = [a1 extraAttributes];
  v24 = [v23 allKeys];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v30 = [v2 objectForKeyedSubscript:v29];
        if (!v30)
        {
          v31 = [a1 extraAttributes];
          [v31 objectForKeyedSubscript:v29];
          v33 = v32 = a1;
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          a1 = v32;
          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          v30 = [v32 extraAttributes];
          v35 = [v30 objectForKeyedSubscript:v29];
          [v2 setObject:v35 forKeyedSubscript:v29];

          a1 = v32;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v26);
  }

  return v2;
}

+ (id)itemArrayWithAirRepresentations:()AVAirSerialization
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "itemWithAirDictionaryRepresentation:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)airRepresentationForArray:()AVAirSerialization
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "airDictionaryRepresentation", (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)itemWithAirDictionaryRepresentation:()AVAirSerialization
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F165A0]);
  id v5 = [v3 objectForKeyedSubscript:@"identifier"];

  if (!v5)
  {
    uint64_t v8 = _avairlog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v69 = "+[AVMetadataItem(AVAirSerialization) itemWithAirDictionaryRepresentation:]";
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s ** AVMetadataItem representation has no identifier!", buf, 0xCu);
    }
    goto LABEL_43;
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"identifier"];
    [v4 setIdentifier:v7];
  }
  else
  {
    [v4 setIdentifier:0];
  }

  uint64_t v9 = [v3 objectForKeyedSubscript:@"extendedLanguageTag"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v3 objectForKeyedSubscript:@"extendedLanguageTag"];
    [v4 setExtendedLanguageTag:v10];
  }
  else
  {
    [v4 setExtendedLanguageTag:0];
  }

  v11 = [v3 objectForKeyedSubscript:@"localeIdentifier"];

  if (v11)
  {
    long long v12 = [v3 objectForKeyedSubscript:@"localeIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = [v3 objectForKeyedSubscript:@"localeIdentifier"];

      if (v13)
      {
        long long v14 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
      }
      else
      {
        long long v14 = 0;
      }
    }
    else
    {

      long long v14 = 0;
      long long v13 = 0;
    }
    [v4 setLocale:v14];
  }
  long long v15 = [v3 objectForKeyedSubscript:@"time"];

  if (v15)
  {
    long long v16 = [v3 objectForKeyedSubscript:@"time"];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [v3 objectForKeyedSubscript:@"time"];
      [v17 doubleValue];
      Float64 v19 = v18;

      if (v19 >= 0.0)
      {
        CMTimeMakeWithSeconds(&v65, v19, 1000);
        [v4 setTime:&v65];
      }
    }
    else
    {
    }
  }
  v20 = [v3 objectForKeyedSubscript:@"duration"];

  if (v20)
  {
    v21 = [v3 objectForKeyedSubscript:@"duration"];
    if (objc_opt_respondsToSelector())
    {
      v22 = [v3 objectForKeyedSubscript:@"duration"];
      [v22 doubleValue];
      Float64 v24 = v23;

      if (v24 > 0.0)
      {
        CMTimeMakeWithSeconds(&v64, v24, 1000);
        [v4 setDuration:&v64];
      }
    }
    else
    {
    }
  }
  uint64_t v25 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_36;
  }
  uint64_t v26 = [v3 objectForKeyedSubscript:@"value"];
  int v27 = [v26 hasPrefix:@"b64:"];

  if (!v27) {
    goto LABEL_37;
  }
  v28 = [v4 identifier];
  if (([v28 isEqualToString:*MEMORY[0x1E4F15C40]] & 1) == 0)
  {
    uint64_t v29 = [v4 identifier];
    if (([v29 isEqualToString:*MEMORY[0x1E4F15D48]] & 1) == 0)
    {
      v30 = [v4 identifier];
      if (![v30 isEqualToString:*MEMORY[0x1E4F15DA8]])
      {
        v57 = [v4 identifier];
        char v58 = [v57 isEqualToString:*MEMORY[0x1E4F15D40]];

        if ((v58 & 1) == 0)
        {
          uint64_t v8 = _avairlog();
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_43;
          }
          v36 = [v4 identifier];
          *(_DWORD *)buf = 136315394;
          v69 = "+[AVMetadataItem(AVAirSerialization) itemWithAirDictionaryRepresentation:]";
          __int16 v70 = 2114;
          v71 = v36;
          v37 = "%s The value passed for '%{public}@' is raw data, but we do not expect it. Discarding.";
          goto LABEL_42;
        }
        goto LABEL_35;
      }
    }
  }

LABEL_35:
  v31 = [v3 objectForKeyedSubscript:@"value"];
  uint64_t v25 = [v31 substringFromIndex:4];

  v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v25 options:0];
  [v4 setValue:v32];

LABEL_36:
LABEL_37:
  v33 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_40:
    uint64_t v8 = _avairlog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:
      id v38 = 0;
      goto LABEL_44;
    }
    v36 = [v4 identifier];
    *(_DWORD *)buf = 136315394;
    v69 = "+[AVMetadataItem(AVAirSerialization) itemWithAirDictionaryRepresentation:]";
    __int16 v70 = 2112;
    v71 = v36;
    v37 = "%s Metadata values should not be arrays/dictionaries. Lookin' at you, '%@'.";
LABEL_42:
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, v37, buf, 0x16u);

    goto LABEL_43;
  }
  v34 = [v3 objectForKeyedSubscript:@"value"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_40;
  }
  long long v40 = [v4 value];

  if (!v40)
  {
    long long v41 = [v3 objectForKeyedSubscript:@"value"];
    [v4 setValue:v41];
  }
  CMTime v42 = [v3 objectForKeyedSubscript:@"startDate"];

  if (v42)
  {
    char v43 = [v3 objectForKeyedSubscript:@"startDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [v3 objectForKeyedSubscript:@"startDate"];
    }
    else
    {
      v44 = 0;
    }

    char v45 = +[AVInternetDateFormatter internetDateFormatter];
    v46 = [v45 dateFromString:v44];

    [v4 setStartDate:v46];
  }
  v59 = v4;
  uint64_t v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v47 = *MEMORY[0x1E4F15CD8];
  v66[0] = *MEMORY[0x1E4F15CF8];
  v66[1] = v47;
  v66[2] = *MEMORY[0x1E4F15D08];
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:3];
  uint64_t v49 = [v48 countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v61 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = *(void *)(*((void *)&v60 + 1) + 8 * i);
        v54 = [v3 objectForKeyedSubscript:v53];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v55 = [v3 objectForKeyedSubscript:v53];
          [v8 setObject:v55 forKeyedSubscript:v53];
        }
        else
        {
          [v8 setObject:0 forKeyedSubscript:v53];
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v50);
  }

  id v4 = v59;
  if ([v8 count])
  {
    id v56 = [v8 copy];
    [v59 setExtraAttributes:v56];
  }
  id v38 = v59;
LABEL_44:

  return v38;
}

@end