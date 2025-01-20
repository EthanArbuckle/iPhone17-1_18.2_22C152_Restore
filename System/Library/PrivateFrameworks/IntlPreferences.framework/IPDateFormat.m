@interface IPDateFormat
+ (BOOL)dateFormatIsAllNumeric:(id)a3;
+ (double)sampleTime;
+ (id)availableDateFormats;
+ (id)currentDateFormat;
+ (id)dateFormatFromFormatter:(id)a3 style:(unint64_t)a4;
+ (id)dateFormatterFromLanguage;
+ (id)dateFormatterFromLocale;
+ (void)setDateFormat:(id)a3;
- (IPDateFormat)initWithOption:(id)a3 title:(id)a4;
- (NSString)option;
- (NSString)title;
@end

@implementation IPDateFormat

- (IPDateFormat)initWithOption:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPDateFormat;
  v9 = [(IPDateFormat *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_option, a3);
    objc_storeStrong((id *)&v10->_title, a4);
  }

  return v10;
}

+ (double)sampleTime
{
  v2 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    [v4 setTimeZone:v2];
    v5 = [MEMORY[0x1E4F1C9C8] date];
    v6 = [v4 components:-1 fromDate:v5];

    [v6 setHour:0];
    [v6 setMinute:34];
    [v6 setSecond:0];
    [v6 setMonth:8];
    [v6 setDay:19];
    id v7 = [v4 dateFromComponents:v6];
    [v7 timeIntervalSince1970];
    double v9 = v8;
  }
  else
  {
    double v9 = 978307200.0;
  }

  return v9;
}

+ (id)dateFormatterFromLocale
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  v4 = [MEMORY[0x1E4F1CA20] preferredLocale];
  v5 = [v4 localeIdentifier];
  v6 = [v3 localeWithLocaleIdentifier:v5];
  [v2 setLocale:v6];

  [v2 setDateStyle:1];
  return v2;
}

+ (id)dateFormatterFromLanguage
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = [a1 localeFromDeviceLanguage];
  [v3 setLocale:v4];

  [v3 setDateStyle:1];
  return v3;
}

+ (id)dateFormatFromFormatter:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  [v5 setDateStyle:a4];
  v6 = [v5 dateFormat];

  return v6;
}

+ (id)availableDateFormats
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 dateFormatterFromLocale];
  v4 = [a1 dateFormatterFromLanguage];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [IPDateFormat alloc];
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v36 = a1;
  [a1 sampleTime];
  double v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
  uint64_t v9 = [v3 stringFromDate:v8];
  uint64_t v10 = [(IPDateFormat *)v6 initWithOption:@"locale" title:v9];

  id v37 = v5;
  v33 = (void *)v10;
  [v5 addObject:v10];
  v11 = (void *)MEMORY[0x1E4F1CA80];
  v34 = v3;
  objc_super v12 = [v3 dateFormat];
  v13 = [v11 setWithObject:v12];

  v35 = v4;
  v14 = [v4 dateFormat];
  LOBYTE(v9) = [v13 containsObject:v14];

  if ((v9 & 1) == 0)
  {
    v15 = [IPDateFormat alloc];
    v16 = (void *)MEMORY[0x1E4F1C9C8];
    [v36 sampleTime];
    v17 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
    v18 = [v4 stringFromDate:v17];
    v19 = [(IPDateFormat *)v15 initWithOption:@"language" title:v18];

    [v5 addObject:v19];
    v20 = [v4 dateFormat];
    [v13 addObject:v20];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v21 = [&unk_1F19D8900 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(&unk_1F19D8900);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        if (([v13 containsObject:v25] & 1) == 0)
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          [v26 setDateFormat:v25];
          v27 = [IPDateFormat alloc];
          v28 = (void *)MEMORY[0x1E4F1C9C8];
          [v36 sampleTime];
          v29 = objc_msgSend(v28, "dateWithTimeIntervalSince1970:");
          v30 = [v26 stringFromDate:v29];
          v31 = [(IPDateFormat *)v27 initWithOption:v25 title:v30];

          [v37 addObject:v31];
          [v13 addObject:v25];
        }
      }
      uint64_t v22 = [&unk_1F19D8900 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v22);
  }

  return v37;
}

+ (id)currentDateFormat
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  v4 = [v3 dateFormat];
  id v5 = [a1 dateFormatterFromLocale];
  v6 = [v5 dateFormat];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    double v8 = IPFormatOptionLocale;
LABEL_5:
    v13 = *v8;
    goto LABEL_7;
  }
  uint64_t v9 = [v3 dateFormat];
  uint64_t v10 = [a1 dateFormatterFromLanguage];
  v11 = [v10 dateFormat];
  int v12 = [v9 isEqualToString:v11];

  if (v12)
  {
    double v8 = IPFormatOptionLanguage;
    goto LABEL_5;
  }
  v13 = [v3 dateFormat];
LABEL_7:
  v14 = v13;

  return v14;
}

+ (void)setDateFormat:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v4 isEqualToString:@"language"])
  {
    v6 = [a1 dateFormatterFromLanguage];
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 1);
    v27[0] = v21;
    int v7 = [a1 dateFormatFromFormatter:v6 style:1];
    v28[0] = v7;
    double v8 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 2);
    v27[1] = v8;
    [a1 dateFormatFromFormatter:v6 style:2];
    uint64_t v9 = v22 = v5;
    v28[1] = v9;
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 3);
    v27[2] = v10;
    v11 = [a1 dateFormatFromFormatter:v6 style:3];
    v28[2] = v11;
    int v12 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 4);
    v27[3] = v12;
    v13 = [a1 dateFormatFromFormatter:v6 style:4];
    v28[3] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

    id v5 = v22;
  }
  else
  {
    if (![&unk_1F19D8918 containsObject:v4])
    {
      [v5 removeObjectForKey:@"AppleICUDateFormatStrings" inDomain:*MEMORY[0x1E4F283E0]];
      goto LABEL_8;
    }
    v6 = [a1 dateFormatterFromLocale];
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 1);
    uint64_t v25 = v15;
    id v26 = v4;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

    v16 = [a1 dateFormatFromFormatter:v6 style:2];
    int v17 = [a1 dateFormatIsAllNumeric:v16];

    if (v17)
    {
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 1);
      v23[0] = v18;
      v24[0] = v4;
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", 2);
      v23[1] = v19;
      v24[1] = v4;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

      v14 = (void *)v20;
    }
  }
  [v5 setObject:v14 forKey:@"AppleICUDateFormatStrings" inDomain:*MEMORY[0x1E4F283E0]];

LABEL_8:
}

+ (BOOL)dateFormatIsAllNumeric:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v4 = [v3 length];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__IPDateFormat_dateFormatIsAllNumeric___block_invoke;
  v8[3] = &unk_1E63BFD70;
  v8[4] = &v13;
  v8[5] = &v21;
  v8[6] = &v9;
  v8[7] = &v17;
  objc_msgSend(v3, "_enumerateLongCharactersInRange:usingBlock:", 0, v4, v8);
  if (*((unsigned char *)v10 + 24))
  {
    BOOL v5 = 0;
  }
  else
  {
    int v6 = *((unsigned __int8 *)v14 + 24);
    if (v22[3] > 0) {
      ++v6;
    }
    BOOL v5 = v6 + *((unsigned __int8 *)v18 + 24) > 1;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v5;
}

uint64_t __39__IPDateFormat_dateFormatIsAllNumeric___block_invoke(uint64_t result, UChar32 c, unsigned char *a3)
{
  uint64_t v5 = result;
  uint64_t v6 = (c - 76);
  if (v6 <= 0x2D)
  {
    if (((1 << (c - 76)) & 0x224000002000) != 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      return result;
    }
    if (((1 << (c - 76)) & 3) != 0)
    {
      if ((uint64_t)++*(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) < 3) {
        return result;
      }
      goto LABEL_10;
    }
    if (v6 == 24)
    {
      *(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24) = 1;
      return result;
    }
  }
  result = u_isalpha(c);
  if (result)
  {
LABEL_10:
    *(unsigned char *)(*(void *)(*(void *)(v5 + 48) + 8) + 24) = 1;
    *a3 = 1;
    return result;
  }
  result = u_isspace(c);
  if (result)
  {
    if (c == 39) {
      goto LABEL_10;
    }
  }
  else
  {
    result = u_ispunct(c);
    BOOL v8 = c != 8207 && result == 0;
    if (c == 39 || v8) {
      goto LABEL_10;
    }
  }
  return result;
}

- (NSString)option
{
  return self->_option;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end