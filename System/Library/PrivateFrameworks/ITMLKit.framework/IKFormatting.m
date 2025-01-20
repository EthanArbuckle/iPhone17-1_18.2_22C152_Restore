@interface IKFormatting
+ (id)isoDateFormatter;
+ (id)rfc1123DateFormatter;
+ (id)sharedInstance;
- (IKFormatting)init;
- (id)formatDate:(id)a3 format:(id)a4;
- (id)formatDuration:(id)a3;
- (id)formatLocalizedLocaleIdentifier:(id)a3;
- (id)formatLocalizedNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6 currencyCode:(id)a7;
- (id)formatNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6;
- (id)joinComponents:(id)a3 withASCII:(id)a4 arabic:(id)a5 ethiopic:(id)a6 ideograph:(id)a7;
- (id)joinComponentsWithLocalizedCommaAndSpace:(id)a3;
- (id)joinComponentsWithLocalizedSemicolonAndSpace:(id)a3;
@end

@implementation IKFormatting

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_30);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __30__IKFormatting_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(IKFormatting);
  uint64_t v1 = sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)rfc1123DateFormatter
{
  if (rfc1123DateFormatter_onceToken != -1) {
    dispatch_once(&rfc1123DateFormatter_onceToken, &__block_literal_global_2_1);
  }
  v2 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  return v2;
}

void __36__IKFormatting_rfc1123DateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  rfc1123DateFormatter_sRFC1123Formatter = (uint64_t)v0;

  v2 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)rfc1123DateFormatter_sRFC1123Formatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
  v4 = (void *)rfc1123DateFormatter_sRFC1123Formatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

+ (id)isoDateFormatter
{
  if (isoDateFormatter_onceToken != -1) {
    dispatch_once(&isoDateFormatter_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)isoDateFormatter_sISOFormatter;
  return v2;
}

void __32__IKFormatting_isoDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v1 = (void *)isoDateFormatter_sISOFormatter;
  isoDateFormatter_sISOFormatter = (uint64_t)v0;

  v2 = (void *)isoDateFormatter_sISOFormatter;
  v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)isoDateFormatter_sISOFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v4 = (void *)isoDateFormatter_sISOFormatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

- (IKFormatting)init
{
  v12.receiver = self;
  v12.super_class = (Class)IKFormatting;
  v2 = [(IKFormatting *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dateFormatters = v2->_dateFormatters;
    v2->_dateFormatters = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    numberFormatters = v2->_numberFormatters;
    v2->_numberFormatters = v5;

    v2->_dateFormattersLock._os_unfair_lock_opaque = 0;
    v2->_numberFormattersLock._os_unfair_lock_opaque = 0;
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v7;

    [(NSNumberFormatter *)v2->_durationFormatter setNumberStyle:1];
    v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    durationPaddedFormatter = v2->_durationPaddedFormatter;
    v2->_durationPaddedFormatter = v9;

    [(NSNumberFormatter *)v2->_durationPaddedFormatter setNumberStyle:1];
    [(NSNumberFormatter *)v2->_durationPaddedFormatter setPositiveFormat:@"00"];
  }
  return v2;
}

- (id)formatDate:(id)a3 format:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = a3;
  uint64_t v8 = [(__CFString *)v6 length];
  v9 = @"default";
  if (v8) {
    v9 = v6;
  }
  v10 = v9;

  os_unfair_lock_lock(&self->_dateFormattersLock);
  id v11 = [(NSMutableDictionary *)self->_dateFormatters objectForKey:v10];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    if ([(__CFString *)v10 isEqualToString:@"default"])
    {
      [v11 setDateStyle:2];
      [v11 setTimeStyle:0];
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      objc_super v12 = (void *)MEMORY[0x1E4F28C10];
      v13 = [MEMORY[0x1E4F1CA20] currentLocale];
      v14 = [v12 dateFormatFromTemplate:v10 options:0 locale:v13];

      [v11 setDateFormat:v14];
      if (!v11) {
        goto LABEL_9;
      }
    }
    [(NSMutableDictionary *)self->_dateFormatters setObject:v11 forKey:v10];
  }
LABEL_9:
  os_unfair_lock_unlock(&self->_dateFormattersLock);
  v15 = [v11 stringFromDate:v7];

  return v15;
}

- (id)formatDuration:(id)a3
{
  uint64_t v4 = [a3 integerValue];
  uint64_t v5 = v4 % 3600;
  uint64_t v6 = ((unsigned __int128)(v4 % 3600 * (__int128)(uint64_t)0x8888888888888889) >> 64) + v4 % 3600;
  id v7 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (v4 <= 3599)
  {
    v17 = [v7 dateFormatFromTemplate:@"mmss" options:0 locale:v8];
    v10 = (void *)[v17 mutableCopy];

    goto LABEL_8;
  }
  v9 = [v7 dateFormatFromTemplate:@"HHmmss" options:0 locale:v8];
  v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v10 rangeOfString:@"HH"];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v11 = [v10 rangeOfString:@"H"], v11 != 0x7FFFFFFFFFFFFFFFLL)
    || (uint64_t v11 = [v10 rangeOfString:@"kk"], v11 != 0x7FFFFFFFFFFFFFFFLL)
    || (uint64_t v11 = [v10 rangeOfString:@"k"], v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
    durationFormatter = self->_durationFormatter;
    v16 = [NSNumber numberWithInteger:v4 / 3600];
    uint64_t v8 = [(NSNumberFormatter *)durationFormatter stringFromNumber:v16];

    objc_msgSend(v10, "replaceCharactersInRange:withString:", v13, v14, v8);
LABEL_8:
  }
  uint64_t v18 = (v6 >> 5) + ((unint64_t)v6 >> 63);
  uint64_t v19 = [v10 rangeOfString:@"mm"];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v21 = [v10 rangeOfString:@"m"];
    unint64_t v23 = 0x1E4F28000;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_16;
    }
    uint64_t v24 = v21;
    uint64_t v25 = v22;
  }
  else
  {
    uint64_t v24 = v19;
    uint64_t v25 = v20;
    unint64_t v23 = 0x1E4F28000uLL;
  }
  uint64_t v26 = 40;
  if (v4 > 3599) {
    uint64_t v26 = 48;
  }
  v27 = *(void **)(v23 + 3792);
  id v28 = *(id *)((char *)&self->super.isa + v26);
  v29 = [v27 numberWithInteger:(v6 >> 5) + ((unint64_t)v6 >> 63)];
  v30 = [v28 stringFromNumber:v29];

  objc_msgSend(v10, "replaceCharactersInRange:withString:", v24, v25, v30);
LABEL_16:
  uint64_t v31 = [v10 rangeOfString:@"ss"];
  if (v31 != 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v31 = [v10 rangeOfString:@"s"], v31 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v33 = v31;
    uint64_t v34 = v32;
    durationPaddedFormatter = self->_durationPaddedFormatter;
    v36 = [*(id *)(v23 + 3792) numberWithInteger:v5 - 60 * v18];
    v37 = [(NSNumberFormatter *)durationPaddedFormatter stringFromNumber:v36];

    objc_msgSend(v10, "replaceCharactersInRange:withString:", v33, v34, v37);
  }
  return v10;
}

- (id)formatNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  v16 = v15;
  if (v10) {
    [v15 addObject:v10];
  }
  if (v11) {
    [v16 addObject:v11];
  }
  if (v12) {
    [v16 addObject:v12];
  }
  v17 = [v16 valueForKey:@"description"];
  uint64_t v18 = [v17 componentsJoinedByString:@"_"];

  os_unfair_lock_lock(&self->_numberFormattersLock);
  id v19 = [(NSMutableDictionary *)self->_numberFormatters objectForKey:v18];
  if (!v19)
  {
    if ([v10 isEqualToString:@"noStyle"])
    {
      uint64_t v20 = 0;
    }
    else if ([v10 isEqualToString:@"decimal"])
    {
      uint64_t v20 = 1;
    }
    else if ([v10 isEqualToString:@"currency"])
    {
      uint64_t v20 = 2;
    }
    else if ([v10 isEqualToString:@"percent"])
    {
      uint64_t v20 = 3;
    }
    else if ([v10 isEqualToString:@"scientific"])
    {
      uint64_t v20 = 4;
    }
    else if ([v10 isEqualToString:@"spellOut"])
    {
      uint64_t v20 = 5;
    }
    else
    {
      uint64_t v20 = 1;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v19 setNumberStyle:v20];
    if ([v11 length]) {
      [v19 setPositiveFormat:v11];
    }
    if ([v12 length]) {
      [v19 setNegativeFormat:v12];
    }
    if (v19) {
      [(NSMutableDictionary *)self->_numberFormatters setObject:v19 forKey:v18];
    }
  }
  os_unfair_lock_unlock(&self->_numberFormattersLock);
  uint64_t v21 = [v19 stringFromNumber:v14];

  return v21;
}

- (id)formatLocalizedNumber:(id)a3 style:(id)a4 postiveFormat:(id)a5 negativeFormat:(id)a6 currencyCode:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v26 = a3;
  id v17 = objc_alloc_init(v16);
  uint64_t v18 = v17;
  if (v12) {
    [v17 addObject:v12];
  }
  if (v13) {
    [v18 addObject:v13];
  }
  if (v14) {
    [v18 addObject:v14];
  }
  if (v15) {
    [v18 addObject:v15];
  }
  id v19 = [v18 valueForKey:@"description"];
  uint64_t v20 = [v19 componentsJoinedByString:@"|"];

  os_unfair_lock_lock(&self->_numberFormattersLock);
  id v21 = [(NSMutableDictionary *)self->_numberFormatters objectForKey:v20];
  if (!v21)
  {
    if ([v12 isEqualToString:@"noStyle"])
    {
      uint64_t v22 = 0;
    }
    else if ([v12 isEqualToString:@"decimal"])
    {
      uint64_t v22 = 1;
    }
    else if ([v12 isEqualToString:@"currency"])
    {
      uint64_t v22 = 2;
    }
    else if ([v12 isEqualToString:@"percent"])
    {
      uint64_t v22 = 3;
    }
    else if ([v12 isEqualToString:@"scientific"])
    {
      uint64_t v22 = 4;
    }
    else if ([v12 isEqualToString:@"spellOut"])
    {
      uint64_t v22 = 5;
    }
    else
    {
      uint64_t v22 = 1;
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v21 setNumberStyle:v22];
    unint64_t v23 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v21 setLocale:v23];

    if ([v13 length]) {
      [v21 setPositiveFormat:v13];
    }
    if ([v14 length]) {
      [v21 setNegativeFormat:v14];
    }
    if ([v15 length]) {
      [v21 setCurrencyCode:v15];
    }
    if (v21) {
      [(NSMutableDictionary *)self->_numberFormatters setObject:v21 forKey:v20];
    }
  }
  os_unfair_lock_unlock(&self->_numberFormattersLock);
  uint64_t v24 = [v21 stringFromNumber:v26];

  return v24;
}

- (id)formatLocalizedLocaleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v5 = [v4 localizedStringForLocaleIdentifier:v3];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v3];
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v5 = [v7 localizedStringForLocaleIdentifier:v6];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (id)joinComponents:(id)a3 withASCII:(id)a4 arabic:(id)a5 ethiopic:(id)a6 ideograph:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v33 = a7;
  uint64_t v12 = [v11 count];
  if (v12)
  {
    uint64_t v39 = v12 - 1;
    if (v12 == 1)
    {
      id v13 = [v11 objectAtIndexedSubscript:0];
      id v14 = [v13 description];

      goto LABEL_36;
    }
    id v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v16 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v32 = v11;
    id obj = v11;
    uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v41;
      do
      {
        uint64_t v21 = 0;
        uint64_t v34 = v19;
        do
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v21), "description", v32);
          uint64_t v23 = [v22 length];
          if (v23)
          {
            unint64_t v24 = v23;
            [v16 appendString:v22];
            if (v19 != v39)
            {
              while (1)
              {
                unint64_t v25 = v24 - 1;
                uint64_t v26 = [v22 characterAtIndex:v24 - 1];
                if ([v15 characterIsMember:v26]) {
                  goto LABEL_31;
                }
                if (v24 >= 2 && (v26 & 0xFC00) == 0xDC00)
                {
                  int v27 = [v22 characterAtIndex:v24 - 2];
                  if ((v27 & 0xFC00) != 0xD800) {
                    goto LABEL_23;
                  }
                  LODWORD(v26) = v26 + (v27 << 10) - 56613888;
                  --v24;
                }
                int32x4_t v28 = vdupq_n_s32(v26);
                if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1E2B90B00, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1E2B90AF0)))) & 1) != 0|| (v26 & 0xFFFFFF00) == 0x600)
                {
                  v29 = v36;
                  goto LABEL_30;
                }
                if ((v26 - 4608) < 0x1A0)
                {
                  v29 = v35;
                  goto LABEL_30;
                }
                if ((vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1E2B90B30, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1E2B90B10)), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1E2B90B40, (uint32x4_t)vaddq_s32(v28, (int32x4_t)xmmword_1E2B90B20))))) & 1) != 0|| (v26 - 194560) < 0x220)
                {
                  v29 = v33;
LABEL_30:
                  id v30 = v29;
                  if (v30) {
                    goto LABEL_32;
                  }
                  goto LABEL_31;
                }
                unint64_t v25 = v24 - 1;
LABEL_23:
                unint64_t v24 = v25;
                if (!v25) {
                  goto LABEL_31;
                }
              }
            }
          }
          else if (v19 != v39)
          {
LABEL_31:
            id v30 = v37;
LABEL_32:
            [v16 appendString:v30];
          }
          ++v19;

          ++v21;
        }
        while (v21 != v18);
        uint64_t v19 = v34 + v18;
        uint64_t v18 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v18);
    }

    id v14 = (__CFString *)[v16 copy];
    id v11 = v32;
  }
  else
  {
    id v14 = &stru_1F3E09950;
  }
LABEL_36:

  return v14;
}

- (id)joinComponentsWithLocalizedCommaAndSpace:(id)a3
{
  return [(IKFormatting *)self joinComponents:a3 withASCII:@", " arabic:@"، " ethiopic:@"፣ " ideograph:@"、"];
}

- (id)joinComponentsWithLocalizedSemicolonAndSpace:(id)a3
{
  return -[IKFormatting joinComponents:withASCII:arabic:ethiopic:ideograph:](self, "joinComponents:withASCII:arabic:ethiopic:ideograph:", a3, @"; ",
           @"؛ ",
           @"፤ ",
           @"、");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationPaddedFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatters, 0);
  objc_storeStrong((id *)&self->_dateFormatters, 0);
}

@end