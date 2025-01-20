@interface MFMimeCharset
+ (BOOL)supportsSecureCoding;
+ (id)allMimeCharsets;
+ (id)allMimeCharsets:(BOOL)a3;
+ (id)charsetForEncoding:(unsigned int)a3;
+ (id)preferredMimeCharset;
- (BOOL)canBeUsedForOutgoingMessages;
- (BOOL)coversLargeUnicodeSubset;
- (BOOL)useBase64InHeaders;
- (MFMimeCharset)initWithCoder:(id)a3;
- (MFMimeCharset)initWithEncoding:(unsigned int)a3;
- (NSString)charsetName;
- (NSString)description;
- (NSString)displayName;
- (id)primaryLanguage;
- (unint64_t)encoding;
- (unsigned)cfStringEncoding;
- (void)_setPrimaryLanguage:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFMimeCharset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allMimeCharsets:(BOOL)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  _MFLockGlobalLock();
  id v4 = (id)allMimeCharsets__cachedResult;
  _MFUnlockGlobalLock();
  BOOL v43 = a3;
  if (!a3 && v4) {
    goto LABEL_50;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v41 = v4;
  v7 = [v6 stringArrayForKey:@"AppleKeyboards"];

  v38 = v7;
  v42 = _convertKeyboardsArrayToLanguages(v7);
  if (![v42 count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    v10 = [MEMORY[0x1E4F1CA20] currentLocale];
    v11 = [v10 localeIdentifier];

    if ([v9 count])
    {
      v12 = [v9 objectAtIndex:0];
      [v8 addObject:v12];
    }
    if (v11) {
      [v8 addObject:v11];
    }
    uint64_t v13 = _convertKeyboardsArrayToLanguages(v8);

    v42 = (void *)v13;
  }
  v39 = (void *)[objc_allocWithZone((Class)a1) initWithEncoding:1536];
  CFArrayAppendValue(Mutable, v39);
  v40 = (void *)[objc_allocWithZone((Class)a1) initWithEncoding:134217984];
  CFArrayAppendValue(Mutable, v40);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v42;
  uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (!v14)
  {
    v15 = 0;
    goto LABEL_43;
  }
  uint64_t v48 = v14;
  v15 = 0;
  uint64_t v46 = *MEMORY[0x1E4F1C470];
  uint64_t v47 = *(void *)v52;
  uint64_t v45 = *MEMORY[0x1E4F1C438];
  do
  {
    uint64_t v49 = 0;
    do
    {
      if (*(void *)v52 != v47) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(*((void *)&v51 + 1) + 8 * v49);
      if (_copyEncodingsForLocaleIdentifier_onceToken != -1) {
        dispatch_once(&_copyEncodingsForLocaleIdentifier_onceToken, &__block_literal_global_6);
      }
      v17 = [(id)_copyEncodingsForLocaleIdentifier_regionEncodingMapping objectForKeyedSubscript:v16];

      v18 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v16];
      v19 = [v18 objectForKeyedSubscript:v46];

      if (v19)
      {
        if (v17) {
          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, (CFArrayRef)v17);
        }
        else {
          CFMutableArrayRef MutableCopy = CFArrayCreateMutable(0, 0, 0);
        }
        v17 = MutableCopy;
        v21 = (void *)_copyEncodingsForLocaleIdentifier_regionEncodingMapping;
        v22 = [v18 objectForKeyedSubscript:v45];
        v23 = [v21 objectForKeyedSubscript:v22];

        if (v23)
        {
          v58.length = CFArrayGetCount((CFArrayRef)v23);
          v58.location = 0;
          CFArrayAppendArray((CFMutableArrayRef)v17, (CFArrayRef)v23, v58);
        }

        if (!v17) {
          goto LABEL_37;
        }
      }
      else
      {
        if (!v17)
        {

          goto LABEL_37;
        }
        CFRetain(v17);
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)v17);
      if (Count < 1)
      {
        v31 = v15;
      }
      else
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v17, i);
          CFIndex v27 = CFArrayGetCount(Mutable);
          if (v27 < 1)
          {
LABEL_31:
            v31 = (void *)[objc_allocWithZone((Class)a1) initWithEncoding:ValueAtIndex];

            [v31 _setPrimaryLanguage:v16];
            CFArrayAppendValue(Mutable, v31);
          }
          else
          {
            CFIndex v28 = 0;
            while (1)
            {
              CFArrayGetValueAtIndex(Mutable, v28);
              v29 = (_DWORD *)objc_claimAutoreleasedReturnValue();
              BOOL v30 = v29[2] == ValueAtIndex;

              if (v30) {
                break;
              }
              if (v27 == ++v28) {
                goto LABEL_31;
              }
            }
            v31 = v15;
          }
          v15 = v31;
        }
      }
      v15 = v31;
      CFRelease(v17);
LABEL_37:
      ++v49;
    }
    while (v49 != v48);
    uint64_t v32 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    uint64_t v48 = v32;
  }
  while (v32);
LABEL_43:

  v33 = v41;
  if (!v43)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__keyboardsUpdated, @"AppleKeyboardsPreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  _MFLockGlobalLock();
  v35 = (void *)allMimeCharsets__cachedResult;
  if (v43 || !allMimeCharsets__cachedResult)
  {
    allMimeCharsets__cachedResult = (uint64_t)Mutable;

    v33 = v41;
  }
  else
  {
    CFRelease(Mutable);
  }
  id v36 = (id)allMimeCharsets__cachedResult;

  id v4 = v36;
  _MFUnlockGlobalLock();
LABEL_50:
  return v4;
}

+ (id)allMimeCharsets
{
  return (id)[a1 allMimeCharsets:0];
}

+ (id)charsetForEncoding:(unsigned int)a3
{
  CFArrayRef v4 = (const __CFArray *)[a1 allMimeCharsets];
  CFIndex Count = CFArrayGetCount(v4);
  if (Count < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(v4, v7);
      v8 = (_DWORD *)objc_claimAutoreleasedReturnValue();
      if (v8[2] == a3) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  return v8;
}

+ (id)preferredMimeCharset
{
  v2 = [a1 allMimeCharsets];
  if ((unint64_t)[v2 count] < 2)
  {
    v3 = 0;
  }
  else
  {
    v3 = [v2 objectAtIndex:1];
  }

  return v3;
}

- (MFMimeCharset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MFMimeCharset initWithEncoding:](self, "initWithEncoding:", [v4 decodeInt32ForKey:@"Encoding"]);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MFMimeCharset)initWithEncoding:(unsigned int)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MFMimeCharset;
  id v4 = [(MFMimeCharset *)&v24 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_encoding = a3;
  if ((int)a3 > 2111)
  {
    if ((int)a3 > 2367)
    {
      switch(a3)
      {
        case 0xA02u:
        case 0xA05u:
          goto LABEL_21;
        case 0xA03u:
        case 0xA06u:
          goto LABEL_20;
        case 0xA04u:
          goto LABEL_26;
        default:
          if (a3 == 2814 || a3 == 2368) {
            goto LABEL_25;
          }
          goto LABEL_26;
      }
    }
    if (a3 != 2112)
    {
      if (a3 != 2336)
      {
        if (a3 == 2352)
        {
          primaryLanguage = v4->_primaryLanguage;
          v4->_primaryLanguage = 0;

          uint64_t v7 = [@"GB2312" copy];
          goto LABEL_29;
        }
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if ((int)a3 <= 1055)
  {
    if (a3 >= 2)
    {
      if (a3 == 518)
      {
        v21 = v4->_primaryLanguage;
        v4->_primaryLanguage = 0;

        uint64_t v7 = [@"ISO-8859-6-i" copy];
        goto LABEL_29;
      }
      if (a3 == 520)
      {
        CFIndex v6 = v4->_primaryLanguage;
        v4->_primaryLanguage = 0;

        uint64_t v7 = [@"ISO-8859-8-i" copy];
LABEL_29:
        charsetName = v5->_charsetName;
        v5->_charsetName = (NSString *)v7;

        char v14 = *((unsigned char *)v5 + 32) & 0xF8 | 4;
        goto LABEL_30;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if ((int)a3 > 1058)
  {
    if (a3 == 1059)
    {
LABEL_21:
      v15 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      v11 = v5->_charsetName;
      v5->_charsetName = 0;
      goto LABEL_22;
    }
    if (a3 == 2080)
    {
LABEL_20:
      v12 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      uint64_t v13 = v5->_charsetName;
      v5->_charsetName = 0;

      char v14 = *((unsigned char *)v5 + 32) | 7;
LABEL_30:
      *((unsigned char *)v5 + 32) = v14;
      return v5;
    }
  }
  else
  {
    if (a3 == 1056)
    {
LABEL_25:
      id v16 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      v17 = v5->_charsetName;
      v5->_charsetName = 0;

      char v14 = *((unsigned char *)v5 + 32) & 0xF8;
      goto LABEL_30;
    }
    if (a3 == 1057)
    {
      v9 = v4->_primaryLanguage;
      v4->_primaryLanguage = 0;

      uint64_t v10 = [@"CP936" copy];
      v11 = v5->_charsetName;
      v5->_charsetName = (NSString *)v10;
LABEL_22:

      char v14 = *((unsigned char *)v5 + 32) & 0xF8 | 5;
      goto LABEL_30;
    }
  }
LABEL_26:
  v18 = [(MFMimeCharset *)v4 charsetName];
  v19 = v18;
  if (v18) {
    char v20 = 4 * ([v18 rangeOfString:@"X-" options:9] == 0x7FFFFFFFFFFFFFFFLL);
  }
  else {
    char v20 = 0;
  }
  *((unsigned char *)v5 + 32) = *((unsigned char *)v5 + 32) & 0xFB | v20;

  return v5;
}

- (void)_setPrimaryLanguage:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  primaryLanguage = self->_primaryLanguage;
  self->_primaryLanguage = v4;
}

- (unsigned)cfStringEncoding
{
  return self->_encoding;
}

- (unint64_t)encoding
{
  return CFStringConvertEncodingToNSStringEncoding(self->_encoding);
}

- (NSString)charsetName
{
  charsetName = self->_charsetName;
  if (!charsetName)
  {
    id v4 = MFCharsetForEncoding(self->_encoding);
    if (v4)
    {
      _MFLockGlobalLock();
      if (!self->_charsetName)
      {
        v5 = (NSString *)[v4 copyWithZone:0];
        id v6 = self->_charsetName;
        self->_charsetName = v5;
      }
      _MFUnlockGlobalLock();
    }

    charsetName = self->_charsetName;
  }
  return charsetName;
}

- (BOOL)canBeUsedForOutgoingMessages
{
  return (*((unsigned __int8 *)self + 32) >> 2) & 1;
}

- (BOOL)coversLargeUnicodeSubset
{
  return *((unsigned char *)self + 32) & 1;
}

- (BOOL)useBase64InHeaders
{
  return (*((unsigned __int8 *)self + 32) >> 1) & 1;
}

- (NSString)displayName
{
  CFStringEncoding encoding = self->_encoding;
  if (encoding == -1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSString localizedNameOfStringEncoding:CFStringConvertEncodingToNSStringEncoding(encoding)];
  }
  return (NSString *)v3;
}

- (id)primaryLanguage
{
  return self->_primaryLanguage;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MFMimeCharset *)self displayName];
  id v6 = [v3 stringWithFormat:@"<%@ %p> %@ encoding=0X%08lX charsetName=%@ lang=%@", v4, self, v5, self->_encoding, self->_charsetName, self->_primaryLanguage];

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charsetName, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
}

@end