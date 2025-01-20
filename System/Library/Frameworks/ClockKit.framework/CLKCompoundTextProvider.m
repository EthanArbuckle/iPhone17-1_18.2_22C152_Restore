@interface CLKCompoundTextProvider
+ (BOOL)supportsSecureCoding;
+ (id)compoundProviderWithLocalizedFormat:(id)a3 localizedTextProviders:(id)a4;
+ (id)compoundTextProviderCurrentlyFormattingOnThisThread;
- (BOOL)_validate;
- (BOOL)isEqual:(id)a3;
- (CLKCompoundTextProvider)initWithCoder:(id)a3;
- (CLKCompoundTextProvider)initWithFormat:(id)a3 arguments:(char *)a4;
- (CLKCompoundTextProvider)initWithSegments:(id)a3 textProviders:(id)a4;
- (id)JSONObjectRepresentation;
- (id)_arrayOfTextProviderJSONObjectRepresentations;
- (id)_attributedStringForSegment:(id)a3 withStyle:(id)a4;
- (id)_initWithJSONObjectRepresentation:(id)a3;
- (id)_replacementForTextProvider:(id)a3 index:(unint64_t)a4 withStyle:(id)a5;
- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4;
- (id)_sessionCacheKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_updateFrequency;
- (int64_t)timeTravelUpdateFrequency;
- (unint64_t)hash;
- (void)_endSession;
- (void)_processFormat:(id)a3 arguments:(char *)a4;
- (void)_startSessionWithDate:(id)a3;
- (void)addTextProvider:(id)a3 andGetPlaceholderString:(id *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKCompoundTextProvider

- (CLKCompoundTextProvider)initWithFormat:(id)a3 arguments:(char *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLKCompoundTextProvider;
  v7 = [(CLKTextProvider *)&v13 initPrivate];
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    textProviders = v7->_textProviders;
    v7->_textProviders = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    segments = v7->_segments;
    v7->_segments = v10;

    [(CLKCompoundTextProvider *)v7 _processFormat:v6 arguments:a4];
  }

  return v7;
}

- (CLKCompoundTextProvider)initWithSegments:(id)a3 textProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLKCompoundTextProvider;
  v8 = [(CLKTextProvider *)&v14 initPrivate];
  if (v8)
  {
    uint64_t v9 = [v7 mutableCopy];
    textProviders = v8->_textProviders;
    v8->_textProviders = (NSMutableArray *)v9;

    uint64_t v11 = [v6 mutableCopy];
    segments = v8->_segments;
    v8->_segments = (NSMutableArray *)v11;
  }
  return v8;
}

+ (id)compoundProviderWithLocalizedFormat:(id)a3 localizedTextProviders:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08B08] localizedScannerWithString:v6];
  [v8 setCharactersToBeSkipped:0];
  uint64_t v9 = objc_opt_new();
  v10 = objc_opt_new();
  if ([v8 isAtEnd])
  {
    v12 = &stru_26CCC52F8;
    goto LABEL_33;
  }
  id v33 = a1;
  id v34 = v6;
  int v13 = 0;
  v12 = &stru_26CCC52F8;
  *(void *)&long long v11 = 138412546;
  long long v32 = v11;
  do
  {
    id v36 = 0;
    objc_msgSend(v8, "scanUpToString:intoString:", @"%", &v36, v32);
    id v14 = v36;
    if (v14)
    {
      uint64_t v15 = [(__CFString *)v12 stringByAppendingString:v14];

      v12 = (__CFString *)v15;
    }
    if (![v8 scanString:@"%" intoString:0])
    {
LABEL_21:
      int v19 = 0;
      goto LABEL_24;
    }
    if ([v8 scanString:@"@" intoString:0])
    {
      if ([v7 count] <= (unint64_t)v13)
      {
        v21 = CLKLoggingObjectForDomain(4);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v34;
          _os_log_impl(&dword_21C599000, v21, OS_LOG_TYPE_DEFAULT, "Error: Format string '%@' has more %% conversions than data arguments", buf, 0xCu);
        }
        goto LABEL_23;
      }
      [v9 addObject:v12];

      v16 = v7;
      uint64_t v17 = v13;
    }
    else
    {
      if ([v8 scanString:@"%" intoString:0])
      {
        uint64_t v20 = [(__CFString *)v12 stringByAppendingString:@"%"];

        int v19 = 0;
        v12 = (__CFString *)v20;
        goto LABEL_24;
      }
      int v35 = 0;
      if (![v8 scanInt:&v35])
      {
        v21 = CLKLoggingObjectForDomain(4);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v34;
          v23 = v21;
          v24 = "Error: Format string '%@' contains unsupported format";
          uint32_t v25 = 12;
LABEL_29:
          _os_log_error_impl(&dword_21C599000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
        }
LABEL_23:

        int v19 = 1;
        goto LABEL_24;
      }
      if (![v8 scanString:@"$@" intoString:0]) {
        goto LABEL_21;
      }
      unint64_t v22 = v35;
      if (v35 < 1 || [v7 count] < v22)
      {
        v21 = CLKLoggingObjectForDomain(4);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          id v38 = v34;
          __int16 v39 = 1024;
          LODWORD(v40) = v35;
          v23 = v21;
          v24 = "Error: Format string '%@' contains position '%i' that exceeds data arguments";
          uint32_t v25 = 18;
          goto LABEL_29;
        }
        goto LABEL_23;
      }
      [v9 addObject:v12];

      uint64_t v17 = v35 - 1;
      v16 = v7;
    }
    v18 = [v16 objectAtIndexedSubscript:v17];
    [v10 addObject:v18];

    int v19 = 0;
    ++v13;
    v12 = &stru_26CCC52F8;
LABEL_24:
  }
  while (([v8 isAtEnd] & 1) == 0 && !v19);
  if (v19)
  {
    v26 = 0;
    id v6 = v34;
    goto LABEL_40;
  }
  id v6 = v34;
  a1 = v33;
LABEL_33:
  [v9 addObject:v12];
  uint64_t v27 = [v9 count];
  uint64_t v28 = [v10 count] + 1;
  v29 = CLKLoggingObjectForDomain(4);
  v30 = v29;
  if (v27 == v28)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v6;
      __int16 v39 = 2112;
      v40 = v9;
      __int16 v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_21C599000, v30, OS_LOG_TYPE_DEFAULT, "Will create compound provider for '%@' with segments: %@ textProviders: %@", buf, 0x20u);
    }

    v26 = (void *)[objc_alloc((Class)a1) initWithSegments:v9 textProviders:v10];
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v38 = v6;
      __int16 v39 = 2112;
      v40 = v9;
      __int16 v41 = 2112;
      v42 = v10;
      _os_log_error_impl(&dword_21C599000, v30, OS_LOG_TYPE_ERROR, "Failed to create compound provider for '%@' with segments: %@ textProviders: %@", buf, 0x20u);
    }

    v26 = 0;
  }
LABEL_40:

  return v26;
}

+ (id)compoundTextProviderCurrentlyFormattingOnThisThread
{
  if (_PthreadKey_onceToken != -1) {
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  }
  pthread_key_t v2 = _PthreadKey_key;

  return pthread_getspecific(v2);
}

- (void)addTextProvider:(id)a3 andGetPlaceholderString:(id *)a4
{
  textProviders = self->_textProviders;
  id v7 = a3;
  uint64_t v8 = [(NSMutableArray *)textProviders count];
  uint64_t v9 = self->_textProviders;
  v10 = [v7 finalizedCopy];

  [(NSMutableArray *)v9 addObject:v10];
  long long v11 = NSString;
  v12 = [NSNumber numberWithUnsignedInteger:v8];
  int v13 = [v11 stringWithFormat:@"%@%@%@", @"Ω-♨︎-Д-⚽︎-猫", v12, @"止"];

  *a4 = v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CLKCompoundTextProvider;
  pthread_key_t v2 = [(CLKTextProvider *)&v4 description];

  return v2;
}

- (int64_t)timeTravelUpdateFrequency
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  pthread_key_t v2 = self->_textProviders;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "timeTravelUpdateFrequency", (void)v10);
        if (v5 <= v8) {
          int64_t v5 = v8;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_startSessionWithDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v5 = self->_textProviders;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_startSessionWithDate:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_sessionCacheKey
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  sessionCacheKey = self->_sessionCacheKey;
  if (!sessionCacheKey)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = self->_textProviders;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) _sessionCacheKey];
          if (v9)
          {
            long long v10 = self->_sessionCacheKey;
            if (v10)
            {
              long long v11 = [(NSString *)v10 stringByAppendingFormat:@"--%@", v9];
            }
            else
            {
              long long v11 = v9;
            }
            long long v12 = self->_sessionCacheKey;
            self->_sessionCacheKey = v11;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    sessionCacheKey = self->_sessionCacheKey;
  }

  return sessionCacheKey;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ([(NSMutableArray *)self->_textProviders count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v7 = self->_textProviders;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "sessionAttributedTextForIndex:withStyle:", a3, v6, (void)v27);

          if (v12)
          {

            uint64_t v14 = [(NSMutableArray *)self->_textProviders count];
            id v13 = objc_alloc_init(MEMORY[0x263F089B8]);
            if (v14)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                long long v16 = [(NSMutableArray *)self->_segments objectAtIndex:j];
                long long v17 = [(CLKCompoundTextProvider *)self _attributedStringForSegment:v16 withStyle:v6];
                [v13 appendAttributedString:v17];

                v18 = [(NSMutableArray *)self->_textProviders objectAtIndex:j];
                uint64_t v19 = [(CLKCompoundTextProvider *)self _replacementForTextProvider:v18 index:a3 withStyle:v6];
                [v13 appendAttributedString:v19];
              }
            }
            uint64_t v20 = [(NSMutableArray *)self->_segments lastObject];
            v21 = [(CLKCompoundTextProvider *)self _attributedStringForSegment:v20 withStyle:v6];
            [v13 appendAttributedString:v21];

            if ([v6 shouldEmbedTintColors])
            {
              unint64_t v22 = [(CLKTextProvider *)self tintColor];

              if (v22)
              {
                uint64_t v31 = *MEMORY[0x263F82278];
                v23 = [(CLKTextProvider *)self tintColor];
                long long v32 = v23;
                v24 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
                objc_msgSend(v13, "addAttributesPreservingOriginals:range:", v24, 0, objc_msgSend(v13, "length"));
              }
            }
            goto LABEL_21;
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v13 = 0;
  }
  else
  {
    uint32_t v25 = [(NSMutableArray *)self->_segments firstObject];
    if (a3)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [(CLKCompoundTextProvider *)self _attributedStringForSegment:v25 withStyle:v6];
    }
  }
LABEL_21:

  return v13;
}

- (id)_attributedStringForSegment:(id)a3 withStyle:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 uppercase])
  {
    uint64_t v7 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v8 = [v5 uppercaseStringWithLocale:v7];

    id v5 = (id)v8;
  }
  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v15 = *MEMORY[0x263F82270];
  uint64_t v10 = [v6 font];
  v16[0] = v10;
  long long v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  long long v12 = (void *)[v9 initWithString:v5 attributes:v11];

  id v13 = [v12 _attributedStringWithOtherAttributesFromStyle:v6];

  if (!v13) {
    id v13 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26CCC52F8];
  }

  return v13;
}

- (id)_replacementForTextProvider:(id)a3 index:(unint64_t)a4 withStyle:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((a4 & 0x8000000000000000) != 0)
  {
    uint64_t v10 = 0;
  }
  else
  {
    do
    {
      uint64_t v9 = [v7 sessionAttributedTextForIndex:a4 withStyle:v8];
      uint64_t v10 = (void *)v9;
      BOOL v11 = a4-- != 0;
    }
    while (v11 && !v9);
  }
  long long v12 = [v10 _attributedStringWithOtherAttributesFromStyle:v8];
  if (!v12) {
    long long v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:&stru_26CCC52F8];
  }

  return v12;
}

- (void)_endSession
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_textProviders;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "_endSession", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  sessionCacheKey = self->_sessionCacheKey;
  self->_sessionCacheKey = 0;
}

- (BOOL)_validate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)CLKCompoundTextProvider;
  if (![(CLKTextProvider *)&v14 _validate]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_textProviders;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "validate", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (int64_t)_updateFrequency
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  pthread_key_t v2 = self->_textProviders;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_updateFrequency", (void)v10);
        if (v5 <= v8) {
          int64_t v5 = v8;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLKCompoundTextProvider;
  uint64_t v4 = [(CLKTextProvider *)&v10 copyWithZone:a3];
  if (v4 != self)
  {
    uint64_t v5 = [(NSMutableArray *)self->_textProviders copy];
    textProviders = v4->_textProviders;
    v4->_textProviders = (NSMutableArray *)v5;

    uint64_t v7 = [(NSMutableArray *)self->_segments copy];
    segments = v4->_segments;
    v4->_segments = (NSMutableArray *)v7;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKCompoundTextProvider;
  if ([(CLKTextProvider *)&v7 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_textProviders, v4[16]))
  {
    char v5 = CLKEqualObjects(self->_segments, v4[17]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)CLKCompoundTextProvider;
  uint64_t v3 = [(CLKTextProvider *)&v6 hash];
  uint64_t v4 = &v3[[(NSMutableArray *)self->_textProviders hash]];
  return (unint64_t)&v4[4 * [(NSMutableArray *)self->_segments hash]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLKCompoundTextProvider;
  id v4 = a3;
  [(CLKTextProvider *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_textProviders, @"_textProviders", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_segments forKey:@"_segments"];
}

- (CLKCompoundTextProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CLKCompoundTextProvider;
  objc_super v5 = [(CLKTextProvider *)&v21 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_textProviders"];
    textProviders = v5->_textProviders;
    v5->_textProviders = (NSMutableArray *)v9;

    long long v11 = v5->_textProviders;
    uint64_t v12 = objc_opt_class();
    CLKValidateArray(v11, v12);
    long long v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_segments"];
    segments = v5->_segments;
    v5->_segments = (NSMutableArray *)v16;

    v18 = v5->_segments;
    uint64_t v19 = objc_opt_class();
    CLKValidateArray(v18, v19);
  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)CLKCompoundTextProvider;
  id v20 = a3;
  id v3 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v30, sel__initWithJSONObjectRepresentation_);
  if (v3)
  {
    id v4 = objc_msgSend(v20, "objectForKeyedSubscript:");
    if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary must be an array - invalid value: %@", @"textProviders", v4 format];
    }
    uint64_t v5 = objc_opt_new();
    objc_super v6 = (void *)*((void *)v3 + 16);
    *((void *)v3 + 16) = v5;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(obj);
          }
          objc_super v10 = +[CLKTextProvider providerWithJSONObjectRepresentation:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          [*((id *)v3 + 16) addObject:v10];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v7);
    }

    long long v11 = [v20 objectForKeyedSubscript:@"format segments"];
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary must be an array - invalid value: %@", @"format segments", v11 format];
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary must be an array of strings - invalid object: %@", @"format segments", v16 format];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [MEMORY[0x263EFF980] arrayWithArray:v12];
    v18 = (void *)*((void *)v3 + 17);
    *((void *)v3 + 17) = v17;
  }
  return v3;
}

- (id)JSONObjectRepresentation
{
  v7.receiver = self;
  v7.super_class = (Class)CLKCompoundTextProvider;
  id v3 = [(CLKTextProvider *)&v7 JSONObjectRepresentation];
  id v4 = [(CLKCompoundTextProvider *)self _arrayOfTextProviderJSONObjectRepresentations];
  [v3 setObject:v4 forKeyedSubscript:@"textProviders"];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_segments];
  [v3 setObject:v5 forKeyedSubscript:@"format segments"];

  return v3;
}

- (id)_arrayOfTextProviderJSONObjectRepresentations
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_textProviders;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "JSONObjectRepresentation", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_processFormat:(id)a3 arguments:(char *)a4
{
  id v21 = a3;
  if (_PthreadKey_onceToken != -1) {
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  }
  uint64_t v6 = pthread_getspecific(_PthreadKey_key);
  if (_PthreadKey_onceToken != -1) {
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  }
  pthread_setspecific(_PthreadKey_key, self);
  id v7 = [NSString alloc];
  uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v9 = (void *)[v7 initWithFormat:v21 locale:v8 arguments:a4];

  if (_PthreadKey_onceToken != -1) {
    dispatch_once(&_PthreadKey_onceToken, &__block_literal_global_2);
  }
  pthread_setspecific(_PthreadKey_key, v6);
  unint64_t v10 = [(NSMutableArray *)self->_textProviders count];
  long long v11 = (void *)[(NSMutableArray *)self->_textProviders copy];
  [(NSMutableArray *)self->_textProviders removeAllObjects];
  id v12 = v9;
  unint64_t v23 = 0;
  uint64_t v24 = 0;
  long long v22 = 0;
  int NextSegment = _GetNextSegment(v12, v10, &v22, &v23, &v24);
  long long v14 = v22;
  uint64_t v15 = v14;
  id v20 = v12;
  if (NextSegment)
  {
    do
    {
      [(NSMutableArray *)self->_segments addObject:v15];
      uint64_t v16 = [v11 objectAtIndex:v23];
      [(NSMutableArray *)self->_textProviders addObject:v16];
      uint64_t v17 = [v12 substringFromIndex:v24];

      long long v22 = v15;
      char v18 = _GetNextSegment(v17, v10, &v22, &v23, &v24);
      uint64_t v19 = v22;

      uint64_t v15 = v19;
      id v12 = v17;
    }
    while ((v18 & 1) != 0);
  }
  else
  {
    uint64_t v17 = v12;
    uint64_t v19 = v14;
  }
  [(NSMutableArray *)self->_segments addObject:v17];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionCacheKey, 0);
  objc_storeStrong((id *)&self->_segments, 0);

  objc_storeStrong((id *)&self->_textProviders, 0);
}

@end