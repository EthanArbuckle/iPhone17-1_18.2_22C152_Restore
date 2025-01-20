@interface NSScanner
+ (NSScanner)allocWithZone:(_NSZone *)a3;
+ (NSScanner)scannerWithString:(NSString *)string;
+ (id)localizedScannerWithString:(NSString *)string;
- (BOOL)_scanDecimal:(unint64_t)a3 into:(int64_t *)a4;
- (BOOL)caseSensitive;
- (BOOL)isAtEnd;
- (BOOL)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result;
- (BOOL)scanDecimal:(NSDecimal *)dcm;
- (BOOL)scanDouble:(double *)result;
- (BOOL)scanFloat:(float *)result;
- (BOOL)scanHexDouble:(double *)result;
- (BOOL)scanHexFloat:(float *)result;
- (BOOL)scanHexInt:(unsigned int *)result;
- (BOOL)scanHexLongLong:(unint64_t *)result;
- (BOOL)scanInt:(int *)result;
- (BOOL)scanLongLong:(uint64_t *)result;
- (BOOL)scanString:(NSString *)string intoString:(NSString *)result;
- (BOOL)scanUnsignedLongLong:(unint64_t *)result;
- (BOOL)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result;
- (BOOL)scanUpToString:(NSString *)string intoString:(NSString *)result;
- (NSCharacterSet)charactersToBeSkipped;
- (NSScanner)initWithString:(NSString *)string;
- (NSString)string;
- (NSUInteger)scanLocation;
- (id)_invertedSkipSet;
- (id)_remainingString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)locale;
- (void)setCaseSensitive:(BOOL)caseSensitive;
- (void)setCharactersToBeSkipped:(NSCharacterSet *)charactersToBeSkipped;
- (void)setLocale:(id)locale;
- (void)setScanLocation:(NSUInteger)scanLocation;
@end

@implementation NSScanner

- (BOOL)isAtEnd
{
  v3 = [(NSScanner *)self string];
  NSUInteger v4 = [(NSScanner *)self scanLocation];
  uint64_t v5 = [(NSString *)v3 length];
  id v6 = [(NSScanner *)self _invertedSkipSet];
  if (v6)
  {
    uint64_t v7 = -[NSString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", v6, 0, v4, v5 - v4);
    if (v8) {
      NSUInteger v4 = v7;
    }
    else {
      NSUInteger v4 = v5;
    }
  }
  return v4 == v5;
}

- (BOOL)scanUpToCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result
{
  uint64_t v7 = [(NSScanner *)self string];
  NSUInteger v8 = [(NSScanner *)self scanLocation];
  uint64_t v9 = [(NSString *)v7 length];
  id v10 = [(NSScanner *)self _invertedSkipSet];
  uint64_t v11 = [(NSScanner *)self caseSensitive] ^ 1;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }
  uint64_t v14 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", set, v11, v8, v9 - v8);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v9;
  }
  NSUInteger v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }
  return v16 != v8;
}

- (BOOL)scanUpToString:(NSString *)string intoString:(NSString *)result
{
  uint64_t v7 = [(NSScanner *)self string];
  NSUInteger v8 = [(NSScanner *)self scanLocation];
  uint64_t v9 = [(NSString *)v7 length];
  id v10 = [(NSScanner *)self _invertedSkipSet];
  uint64_t v11 = [(NSScanner *)self caseSensitive] ^ 1;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }
  uint64_t v14 = -[NSString rangeOfString:options:range:](v7, "rangeOfString:options:range:", string, v11, v8, v9 - v8);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v9;
  }
  NSUInteger v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }
  return v16 != v8;
}

- (BOOL)scanString:(NSString *)string intoString:(NSString *)result
{
  uint64_t v7 = [(NSScanner *)self string];
  NSUInteger v8 = [(NSScanner *)self scanLocation];
  uint64_t v9 = [(NSString *)v7 length];
  id v10 = [(NSScanner *)self _invertedSkipSet];
  uint64_t v11 = [(NSScanner *)self caseSensitive] ^ 1 | 8;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }
  uint64_t v14 = -[NSString rangeOfString:options:range:](v7, "rangeOfString:options:range:", string, v11, v8, v9 - v8);
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = v14 + v15;
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17 - v8);
    }
    [(NSScanner *)self setScanLocation:v17];
  }
  return v16 != 0;
}

- (NSScanner)initWithString:(NSString *)string
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSScanner;
  return [(NSScanner *)&v4 init];
}

+ (NSScanner)scannerWithString:(NSString *)string
{
  v3 = (void *)[objc_allocWithZone((Class)NSConcreteScanner) initWithString:string];

  return (NSScanner *)v3;
}

+ (NSScanner)allocWithZone:(_NSZone *)a3
{
  objc_super v4 = (objc_class *)a1;
  if (self == a1) {
    objc_super v4 = (objc_class *)self;
  }

  return (NSScanner *)NSAllocateObject(v4, 0, a3);
}

- (BOOL)scanCharactersFromSet:(NSCharacterSet *)set intoString:(NSString *)result
{
  uint64_t v7 = [(NSScanner *)self string];
  NSUInteger v8 = [(NSScanner *)self scanLocation];
  uint64_t v9 = [(NSString *)v7 length];
  id v10 = [(NSScanner *)self _invertedSkipSet];
  uint64_t v11 = [(NSScanner *)self caseSensitive] ^ 1;
  if (v10)
  {
    uint64_t v12 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v10, 0, v8, v9 - v8);
    if (v13) {
      NSUInteger v8 = v12;
    }
    else {
      NSUInteger v8 = v9;
    }
  }
  uint64_t v14 = -[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", [(NSCharacterSet *)set invertedSet], v11, v8, v9 - v8);
  if (v15) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v9;
  }
  NSUInteger v17 = v16 - v8;
  if (v16 != v8)
  {
    if (result) {
      *result = -[NSString substringWithRange:](v7, "substringWithRange:", v8, v17);
    }
    -[NSScanner setScanLocation:](self, "setScanLocation:", v16, v17);
  }
  return v16 != v8;
}

- (BOOL)scanHexInt:(unsigned int *)result
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v7[0] = 0;
    BOOL v4 = [(NSScanner *)self scanHexLongLong:v7];
    if (v4)
    {
      unsigned int v5 = v7[0];
      if (v7[0] >= 0xFFFFFFFFuLL) {
        unsigned int v5 = -1;
      }
      *result = v5;
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v4 = -[NSScanner scanHexLongLong:](self, "scanHexLongLong:");
    if (v4) {
LABEL_7:
    }
      LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)scanHexLongLong:(unint64_t *)result
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(NSScanner *)self string];
  NSUInteger v5 = [(NSScanner *)self scanLocation];
  long long v42 = 0u;
  memset(v41, 0, sizeof(v41));
  long long v38 = 0u;
  unint64_t v6 = [(NSString *)v4 length];
  unint64_t v40 = v6;
  *(void *)&v41[0] = v5;
  v39 = v4;
  if (v6 <= v5)
  {
    *(void *)&long long v38 = 0;
    __int16 v8 = -1;
  }
  else
  {
    if (v6 - v5 >= 0x20) {
      uint64_t v7 = 32;
    }
    else {
      uint64_t v7 = v6 - v5;
    }
    *(void *)&long long v38 = v7;
    objc_msgSend(v4, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v5, v7);
    __int16 v8 = WORD4(v41[0]);
  }
  WORD4(v42) = v8;
  *((void *)&v38 + 1) = 1;
  uint64_t v9 = [(NSScanner *)self charactersToBeSkipped];
  if (v9)
  {
    id v10 = v9;
    if ([(NSCharacterSet *)v9 characterIsMember:WORD4(v42)])
    {
      do
      {
        long long v11 = v38;
        if (*((void *)&v38 + 1) - 1 >= (unint64_t)v38) {
          break;
        }
        if (*((void *)&v38 + 1) >= (unint64_t)v38)
        {
          uint64_t v13 = *(void *)&v41[0] + v38;
          if (v40 > *(void *)&v41[0] + (void)v38)
          {
            if (v40 - (*(void *)&v41[0] + (void)v38) >= 0x20) {
              uint64_t v14 = 32;
            }
            else {
              uint64_t v14 = v40 - (*(void *)&v41[0] + v38);
            }
            *(void *)&v41[0] += v38;
            *(void *)&long long v38 = v14;
            objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v13, v14);
            WORD4(v42) = WORD4(v41[0]);
            *((void *)&v38 + 1) = 1;
            continue;
          }
          *((void *)&v38 + 1) = v38 + 1;
          __int16 v12 = -1;
        }
        else
        {
          ++*((void *)&v38 + 1);
          __int16 v12 = *((_WORD *)v41 + *((void *)&v11 + 1) + 4);
        }
        WORD4(v42) = v12;
      }
      while (-[NSCharacterSet characterIsMember:](v10, "characterIsMember:"));
    }
  }
  int v15 = WORD4(v42);
  if (WORD4(v42) != 48)
  {
    if (WORD4(v42) - 48 > 9)
    {
      if (WORD4(v42) - 65 > 5)
      {
        if (WORD4(v42) - 97 > 5) {
          return 0;
        }
        goto LABEL_36;
      }
LABEL_34:
      unsigned int v21 = v15 - 55;
      goto LABEL_39;
    }
    unsigned int v21 = WORD4(v42) - 48;
    goto LABEL_39;
  }
  uint64_t v17 = *((void *)&v38 + 1);
  uint64_t v16 = v38;
  if (*((void *)&v38 + 1) >= (unint64_t)v38)
  {
    uint64_t v22 = *(void *)&v41[0] + v38;
    if (v40 <= *(void *)&v41[0] + (void)v38) {
      goto LABEL_76;
    }
    if (v40 - (*(void *)&v41[0] + (void)v38) >= 0x20) {
      uint64_t v23 = 32;
    }
    else {
      uint64_t v23 = v40 - (*(void *)&v41[0] + v38);
    }
    *(void *)&v41[0] += v38;
    *(void *)&long long v38 = v23;
    objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v22, v23);
    int v20 = WORD4(v41[0]);
    WORD4(v42) = WORD4(v41[0]);
    unint64_t v18 = 1;
    *((void *)&v38 + 1) = 1;
  }
  else
  {
    unint64_t v18 = ++*((void *)&v38 + 1);
    v19 = (char *)&v38 + 2 * v17;
    int v20 = *((unsigned __int16 *)v19 + 20);
    WORD4(v42) = *((_WORD *)v19 + 20);
  }
  unsigned int v21 = v20 - 48;
  if ((v20 - 48) <= 9)
  {
LABEL_39:
    unint64_t v24 = 0;
    unint64_t v25 = *((void *)&v38 + 1);
    while (1)
    {
      uint64_t v26 = 16 * v24 + v21;
      if (v24 >> 60) {
        unint64_t v24 = -1;
      }
      else {
        unint64_t v24 = v26;
      }
      if (v25 >= (unint64_t)v38)
      {
        uint64_t v29 = *(void *)&v41[0];
        uint64_t v30 = *(void *)&v41[0] + v38;
        if (v40 <= *(void *)&v41[0] + (void)v38)
        {
          unint64_t v25 = v38 + 1;
          *((void *)&v38 + 1) = v38 + 1;
          WORD4(v42) = -1;
          goto LABEL_59;
        }
        if (v40 - (*(void *)&v41[0] + (void)v38) >= 0x20) {
          uint64_t v31 = 32;
        }
        else {
          uint64_t v31 = v40 - (*(void *)&v41[0] + v38);
        }
        *(void *)&v41[0] += v38;
        *(void *)&long long v38 = v31;
        objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v30, v31);
        int v28 = WORD4(v41[0]);
        WORD4(v42) = WORD4(v41[0]);
        *((void *)&v38 + 1) = 1;
        unint64_t v25 = 1;
      }
      else
      {
        v27 = (char *)&v38 + 2 * v25++;
        *((void *)&v38 + 1) = v25;
        int v28 = *((unsigned __int16 *)v27 + 20);
        WORD4(v42) = v28;
      }
      if ((v28 - 48) >= 0xA)
      {
        if ((v28 - 65) >= 6)
        {
          if ((v28 - 97) > 5)
          {
            uint64_t v29 = *(void *)&v41[0];
LABEL_59:
            [(NSScanner *)self setScanLocation:v25 + v29 - 1];
            v33 = result;
            if (result) {
LABEL_60:
            }
              unint64_t *v33 = v24;
            return 1;
          }
          int v32 = -87;
        }
        else
        {
          int v32 = -55;
        }
      }
      else
      {
        int v32 = -48;
      }
      unsigned int v21 = v32 + v28;
    }
  }
  if ((v20 - 65) <= 5)
  {
    unsigned int v21 = v20 - 55;
    goto LABEL_39;
  }
  if ((v20 - 97) <= 5)
  {
    unsigned int v21 = v20 - 87;
    goto LABEL_39;
  }
  uint64_t v22 = v18 + *(void *)&v41[0] - 1;
  if ((v20 | 0x20) != 0x78) {
    goto LABEL_77;
  }
  uint64_t v16 = v38;
  if (v18 < (unint64_t)v38)
  {
    *((void *)&v38 + 1) = v18 + 1;
    int v15 = *((unsigned __int16 *)v41 + v18 + 4);
    WORD4(v42) = v15;
    goto LABEL_72;
  }
  uint64_t v35 = v38 + *(void *)&v41[0];
  if (v40 > (void)v38 + *(void *)&v41[0])
  {
    if (v40 - ((void)v38 + *(void *)&v41[0]) >= 0x20) {
      uint64_t v36 = 32;
    }
    else {
      uint64_t v36 = v40 - (v38 + *(void *)&v41[0]);
    }
    *(void *)&v41[0] += v38;
    *(void *)&long long v38 = v36;
    objc_msgSend(v39, sel_getUid("getCharacters:range:"), (char *)v41 + 8, v35, v36);
    int v15 = WORD4(v41[0]);
    WORD4(v42) = WORD4(v41[0]);
    *((void *)&v38 + 1) = 1;
LABEL_72:
    unsigned int v21 = v15 - 48;
    if ((v15 - 48) <= 9) {
      goto LABEL_39;
    }
    if ((v15 - 65) > 5)
    {
      if ((v15 - 97) > 5) {
        goto LABEL_77;
      }
LABEL_36:
      unsigned int v21 = v15 - 87;
      goto LABEL_39;
    }
    goto LABEL_34;
  }
LABEL_76:
  *((void *)&v38 + 1) = v16 + 1;
  WORD4(v42) = -1;
LABEL_77:
  [(NSScanner *)self setScanLocation:v22];
  v33 = result;
  if (result)
  {
    unint64_t v24 = 0;
    goto LABEL_60;
  }
  return 1;
}

- (BOOL)scanFloat:(float *)result
{
  v9[1] = *(double *)MEMORY[0x1E4F143B8];
  v9[0] = 0.0;
  NSUInteger v8 = [(NSScanner *)self scanLocation];
  int v5 = _NSScanDoubleFromString([(NSScanner *)self string], [(NSScanner *)self charactersToBeSkipped], v9, &v8, [(NSScanner *)self locale]);
  if (v5)
  {
    if (result)
    {
      float v6 = v9[0];
      *result = v6;
    }
    [(NSScanner *)self setScanLocation:v8];
  }
  return v5;
}

- (BOOL)scanDecimal:(NSDecimal *)dcm
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v45 = 0uLL;
  int v46 = 0;
  NSUInteger v4 = [(NSScanner *)self scanLocation];
  int v5 = [(NSScanner *)self string];
  float v6 = [(NSScanner *)self charactersToBeSkipped];
  long long v42 = self;
  id v7 = [(NSScanner *)self locale];
  long long v54 = 0u;
  long long v52 = 0u;
  memset(v53, 0, sizeof(v53));
  long long v51 = 0u;
  v44 = (char *)&v50 + 15;
  long long v47 = 0uLL;
  int v48 = 0;
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F1C418]];
  if (!v8) {
    uint64_t v8 = [v7 objectForKey:@"NSDecimalSeparator"];
  }
  if (v8) {
    uint64_t v9 = (__CFString *)v8;
  }
  else {
    uint64_t v9 = @".";
  }
  if ([(__CFString *)v9 length]) {
    uint64_t v10 = [(__CFString *)v9 characterAtIndex:0];
  }
  else {
    uint64_t v10 = 46;
  }
  unint64_t v11 = [(NSString *)v5 length];
  *((void *)&v52 + 1) = v11;
  v53[0] = v4;
  *(void *)&long long v52 = v5;
  if (v11 <= v4)
  {
    *(void *)&long long v51 = 0;
    uint64_t v13 = 0xFFFFLL;
  }
  else
  {
    if (v11 - v4 >= 0x20) {
      uint64_t v12 = 32;
    }
    else {
      uint64_t v12 = v11 - v4;
    }
    *(void *)&long long v51 = v12;
    objc_msgSend(v5, sel_getUid("getCharacters:range:"), &v53[1], v4, v12);
    uint64_t v13 = LOWORD(v53[1]);
  }
  WORD4(v54) = v13;
  *((void *)&v51 + 1) = 1;
  if (v6)
  {
    if ([(NSCharacterSet *)v6 characterIsMember:v13])
    {
      do
      {
        uint64_t v14 = *((void *)&v51 + 1);
        if (*((void *)&v51 + 1) - 1 >= (unint64_t)v51) {
          break;
        }
        if (*((void *)&v51 + 1) >= (unint64_t)v51)
        {
          uint64_t v16 = v53[0] + v51;
          unint64_t v17 = *((void *)&v52 + 1) - (v53[0] + v51);
          if (*((void *)&v52 + 1) > v53[0] + (void)v51)
          {
            v53[0] += v51;
            if (v17 >= 0x20) {
              uint64_t v18 = 32;
            }
            else {
              uint64_t v18 = *((void *)&v52 + 1) - v16;
            }
            *(void *)&long long v51 = v18;
            objc_msgSend((id)v52, sel_getUid("getCharacters:range:"), &v53[1], v16, v18);
            WORD4(v54) = v53[1];
            *((void *)&v51 + 1) = 1;
            continue;
          }
          *((void *)&v51 + 1) = v51 + 1;
          __int16 v15 = -1;
        }
        else
        {
          ++*((void *)&v51 + 1);
          __int16 v15 = *((_WORD *)&v53[1] + v14);
        }
        WORD4(v54) = v15;
      }
      while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
    }
    LODWORD(v13) = WORD4(v54);
    uint64_t v40 = *((void *)&v51 + 1) - 1;
  }
  else
  {
    uint64_t v40 = 0;
  }
  uint64_t v39 = v53[0];
  __int16 v43 = v13;
  if (v13 <= 0x7F && ((v13 - 9) < 5 || v13 == 32)) {
    return 0;
  }
  v19 = 0;
  size_t v20 = 0;
  unsigned int v21 = __NSNumberSet;
  uint64_t v22 = (char *)v49;
  uint64_t v23 = (char *)v49;
  while ((unsigned __int16)v13 <= 0x7Fu && ((v21[(unsigned __int16)v13 >> 3] >> (v13 & 7)) & 1) != 0)
  {
LABEL_38:
    if (v22 >= v44)
    {
      v20 += 128;
      if (v19)
      {
        uint64_t v24 = MEMORY[0x185306D80](v19, v20, 3943434182, 0);
        if (!v24) {
          return 0;
        }
        uint64_t v23 = (char *)v24;
        LOBYTE(v13) = v43;
      }
      else
      {
        uint64_t v23 = (char *)malloc_type_malloc(v20, 0xF5B10660uLL);
        long long v25 = v50;
        long long v27 = v49[0];
        long long v26 = v49[1];
        *((_OWORD *)v23 + 2) = v49[2];
        *((_OWORD *)v23 + 3) = v25;
        *(_OWORD *)uint64_t v23 = v27;
        *((_OWORD *)v23 + 1) = v26;
        v19 = (char *)v49;
      }
      uint64_t v22 = &v23[v22 - v19];
      v44 = &v23[v20 - 1];
      v19 = v23;
    }
    *v22++ = v13;
    uint64_t v28 = *((void *)&v51 + 1);
    if (*((void *)&v51 + 1) < (unint64_t)v51)
    {
      ++*((void *)&v51 + 1);
      LOWORD(v13) = *((_WORD *)&v53[1] + v28);
LABEL_52:
      WORD4(v54) = v13;
      goto LABEL_53;
    }
    uint64_t v13 = v53[0] + v51;
    unint64_t v29 = *((void *)&v52 + 1) - (v53[0] + v51);
    if (*((void *)&v52 + 1) <= v53[0] + (void)v51)
    {
      *((void *)&v51 + 1) = v51 + 1;
      LOWORD(v13) = -1;
      goto LABEL_52;
    }
    v53[0] += v51;
    uint64_t v30 = v9;
    uint64_t v31 = v10;
    int v32 = v21;
    if (v29 >= 0x20) {
      uint64_t v33 = 32;
    }
    else {
      uint64_t v33 = v29;
    }
    *(void *)&long long v51 = v33;
    v34 = (void *)v52;
    Uid = sel_getUid("getCharacters:range:");
    uint64_t v36 = v33;
    unsigned int v21 = v32;
    uint64_t v10 = v31;
    uint64_t v9 = v30;
    objc_msgSend(v34, Uid, &v53[1], v13, v36);
    LOWORD(v13) = v53[1];
    WORD4(v54) = v53[1];
    *((void *)&v51 + 1) = 1;
LABEL_53:
    __int16 v43 = v13;
  }
  if (_NSCheckDecimalSeparator((uint64_t *)&v51, &v43, v10, v9))
  {
    LOBYTE(v13) = 46;
    __int16 v43 = 46;
    goto LABEL_38;
  }
  *uint64_t v22 = 0;
  _NSCStringToDecimal((uint64_t)v23, &v44, (uint64_t)&v47);
  if (v19) {
    free(v19);
  }
  if (v44 == v23) {
    return 0;
  }
  v37 = &v44[v40 + v39 - (void)v23];
  long long v45 = v47;
  int v46 = v48;
  if (dcm)
  {
    *(_OWORD *)dcm = v45;
    *(_DWORD *)&dcm->_mantissa[6] = v46;
  }
  [(NSScanner *)v42 setScanLocation:v37];
  return 1;
}

- (BOOL)scanUnsignedLongLong:(unint64_t *)result
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = [(NSScanner *)self scanLocation];
  int v5 = [(NSScanner *)self string];
  float v6 = [(NSScanner *)self charactersToBeSkipped];
  *(_OWORD *)c = 0u;
  memset(v43, 0, sizeof(v43));
  long long v40 = 0u;
  unint64_t v7 = [(NSString *)v5 length];
  unint64_t v42 = v7;
  *(void *)&v43[0] = v4;
  v41 = v5;
  if (v7 <= v4)
  {
    *(void *)&long long v40 = 0;
    int v9 = 0xFFFF;
  }
  else
  {
    if (v7 - v4 >= 0x20) {
      uint64_t v8 = 32;
    }
    else {
      uint64_t v8 = v7 - v4;
    }
    *(void *)&long long v40 = v8;
    objc_msgSend(v5, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v4, v8);
    int v9 = WORD4(v43[0]);
  }
  LOWORD(c[2]) = v9;
  *((void *)&v40 + 1) = 1;
  if (v6)
  {
    if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"))
    {
      do
      {
        long long v10 = v40;
        if (*((void *)&v40 + 1) - 1 >= (unint64_t)v40) {
          break;
        }
        if (*((void *)&v40 + 1) >= (unint64_t)v40)
        {
          uint64_t v12 = *(void *)&v43[0] + v40;
          if (v42 > *(void *)&v43[0] + (void)v40)
          {
            if (v42 - (*(void *)&v43[0] + (void)v40) >= 0x20) {
              uint64_t v13 = 32;
            }
            else {
              uint64_t v13 = v42 - (*(void *)&v43[0] + v40);
            }
            *(void *)&v43[0] += v40;
            *(void *)&long long v40 = v13;
            objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v12, v13);
            LOWORD(c[2]) = WORD4(v43[0]);
            *((void *)&v40 + 1) = 1;
            continue;
          }
          *((void *)&v40 + 1) = v40 + 1;
          __int16 v11 = -1;
        }
        else
        {
          ++*((void *)&v40 + 1);
          __int16 v11 = *((_WORD *)v43 + *((void *)&v10 + 1) + 4);
        }
        LOWORD(c[2]) = v11;
      }
      while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
    }
    int v9 = LOWORD(c[2]);
  }
  if (v9 != 43) {
    goto LABEL_44;
  }
  long long v14 = v40;
  if (*((void *)&v40 + 1) >= (unint64_t)v40)
  {
    uint64_t v16 = *(void *)&v43[0] + v40;
    if (v42 > *(void *)&v43[0] + (void)v40)
    {
      if (v42 - (*(void *)&v43[0] + (void)v40) >= 0x20) {
        uint64_t v17 = 32;
      }
      else {
        uint64_t v17 = v42 - (*(void *)&v43[0] + v40);
      }
      *(void *)&v43[0] += v40;
      *(void *)&long long v40 = v17;
      objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v16, v17);
      LOWORD(c[2]) = WORD4(v43[0]);
      *((void *)&v40 + 1) = 1;
      if (!v6) {
        goto LABEL_44;
      }
      goto LABEL_32;
    }
    *((void *)&v40 + 1) = v40 + 1;
    __int16 v15 = -1;
  }
  else
  {
    ++*((void *)&v40 + 1);
    __int16 v15 = *((_WORD *)v43 + *((void *)&v14 + 1) + 4);
  }
  LOWORD(c[2]) = v15;
  if (!v6) {
    goto LABEL_44;
  }
LABEL_32:
  if (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"))
  {
    do
    {
      long long v18 = v40;
      if (*((void *)&v40 + 1) - 1 >= (unint64_t)v40) {
        break;
      }
      if (*((void *)&v40 + 1) >= (unint64_t)v40)
      {
        uint64_t v20 = *(void *)&v43[0] + v40;
        if (v42 > *(void *)&v43[0] + (void)v40)
        {
          if (v42 - (*(void *)&v43[0] + (void)v40) >= 0x20) {
            uint64_t v21 = 32;
          }
          else {
            uint64_t v21 = v42 - (*(void *)&v43[0] + v40);
          }
          *(void *)&v43[0] += v40;
          *(void *)&long long v40 = v21;
          objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v20, v21);
          LOWORD(c[2]) = WORD4(v43[0]);
          *((void *)&v40 + 1) = 1;
          continue;
        }
        *((void *)&v40 + 1) = v40 + 1;
        __int16 v19 = -1;
      }
      else
      {
        ++*((void *)&v40 + 1);
        __int16 v19 = *((_WORD *)v43 + *((void *)&v18 + 1) + 4);
      }
      LOWORD(c[2]) = v19;
    }
    while (-[NSCharacterSet characterIsMember:](v6, "characterIsMember:"));
  }
LABEL_44:
  uint64_t v22 = LOWORD(c[2]);
  uint64_t v23 = (NSCharacterSet *)isADigit_set;
  if (!isADigit_set)
  {
    uint64_t v23 = +[NSCharacterSet decimalDigitCharacterSet];
    isADigit_set = (uint64_t)v23;
  }
  BOOL v24 = [(NSCharacterSet *)v23 characterIsMember:v22];
  if (v24)
  {
    BOOL v38 = v24;
    unint64_t v25 = 0;
    while (1)
    {
      if (v25 > 0x1999999999999998)
      {
        if (v25 != 0x1999999999999999) {
          goto LABEL_53;
        }
        unint64_t v26 = LOWORD(c[2]) - 48;
        if (v26 > 9) {
          unint64_t v26 = u_charDigitValue(LOWORD(c[2]));
        }
        if (v26 >= 5)
        {
LABEL_53:
          while (1)
          {
            long long v27 = v40;
            if (*((void *)&v40 + 1) >= (unint64_t)v40)
            {
              uint64_t v29 = *(void *)&v43[0] + v40;
              if (v42 > *(void *)&v43[0] + (void)v40)
              {
                if (v42 - (*(void *)&v43[0] + (void)v40) >= 0x20) {
                  uint64_t v30 = 32;
                }
                else {
                  uint64_t v30 = v42 - (*(void *)&v43[0] + v40);
                }
                *(void *)&v43[0] += v40;
                *(void *)&long long v40 = v30;
                objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v29, v30);
                uint64_t v28 = WORD4(v43[0]);
                LOWORD(c[2]) = WORD4(v43[0]);
                *((void *)&v40 + 1) = 1;
                goto LABEL_62;
              }
              *((void *)&v40 + 1) = v40 + 1;
              uint64_t v28 = 0xFFFFLL;
            }
            else
            {
              ++*((void *)&v40 + 1);
              uint64_t v28 = *((unsigned __int16 *)v43 + *((void *)&v27 + 1) + 4);
            }
            LOWORD(c[2]) = v28;
LABEL_62:
            uint64_t v31 = (NSCharacterSet *)isADigit_set;
            if (!isADigit_set)
            {
              uint64_t v31 = +[NSCharacterSet decimalDigitCharacterSet];
              isADigit_set = (uint64_t)v31;
            }
            if (![(NSCharacterSet *)v31 characterIsMember:v28])
            {
              unint64_t v25 = -1;
              uint64_t v32 = LOWORD(c[2]);
              goto LABEL_77;
            }
          }
        }
      }
      uint64_t v33 = LOWORD(c[2]) - 48;
      if (v33 > 9) {
        uint64_t v33 = u_charDigitValue(LOWORD(c[2]));
      }
      unint64_t v25 = v33 + 10 * v25;
      long long v34 = v40;
      if (*((void *)&v40 + 1) >= (unint64_t)v40)
      {
        uint64_t v35 = *(void *)&v43[0] + v40;
        if (v42 > *(void *)&v43[0] + (void)v40)
        {
          if (v42 - (*(void *)&v43[0] + (void)v40) >= 0x20) {
            uint64_t v36 = 32;
          }
          else {
            uint64_t v36 = v42 - (*(void *)&v43[0] + v40);
          }
          *(void *)&v43[0] += v40;
          *(void *)&long long v40 = v36;
          objc_msgSend(v41, sel_getUid("getCharacters:range:"), (char *)v43 + 8, v35, v36);
          uint64_t v32 = WORD4(v43[0]);
          LOWORD(c[2]) = WORD4(v43[0]);
          *((void *)&v40 + 1) = 1;
          goto LABEL_77;
        }
        *((void *)&v40 + 1) = v40 + 1;
        uint64_t v32 = 0xFFFFLL;
      }
      else
      {
        ++*((void *)&v40 + 1);
        uint64_t v32 = *((unsigned __int16 *)v43 + *((void *)&v34 + 1) + 4);
      }
      LOWORD(c[2]) = v32;
LABEL_77:
      v37 = (NSCharacterSet *)isADigit_set;
      if (!isADigit_set)
      {
        v37 = +[NSCharacterSet decimalDigitCharacterSet];
        isADigit_set = (uint64_t)v37;
      }
      if (![(NSCharacterSet *)v37 characterIsMember:v32])
      {
        if (result) {
          *result = v25;
        }
        [(NSScanner *)self setScanLocation:*(void *)&v43[0] + *((void *)&v40 + 1) - 1];
        return v38;
      }
    }
  }
  return v24;
}

- (id)_remainingString
{
  v3 = [(NSScanner *)self string];
  NSUInteger v4 = [(NSScanner *)self scanLocation];
  NSUInteger v5 = [(NSString *)v3 length] - v4;

  return -[NSString substringWithRange:](v3, "substringWithRange:", v4, v5);
}

- (BOOL)_scanDecimal:(unint64_t)a3 into:(int64_t *)a4
{
  NSUInteger v7 = [(NSScanner *)self scanLocation];
  uint64_t v8 = [(NSScanner *)self string];
  unint64_t v9 = [(NSString *)v8 length];
  if (a3)
  {
    unint64_t v10 = 0;
    int64_t v11 = 0;
    if (v9 >= v7) {
      unint64_t v12 = v9 - v7;
    }
    else {
      unint64_t v12 = 0;
    }
    while (1)
    {
      if (v12 == v10) {
        goto LABEL_9;
      }
      unsigned int v13 = [(NSString *)v8 characterAtIndex:v7 + v10];
      if (v13 - 58 < 0xFFFFFFF6) {
        break;
      }
      int64_t v11 = 10 * v11 + v13 - 48;
      if (a3 == ++v10)
      {
        unint64_t v12 = a3;
LABEL_9:
        if (!v12) {
          return 0;
        }
LABEL_10:
        [(NSScanner *)self setScanLocation:v12 + v7];
        *a4 = v11;
        return 1;
      }
    }
    unint64_t v12 = v10;
    if (v10) {
      goto LABEL_10;
    }
  }
  return 0;
}

+ (id)localizedScannerWithString:(NSString *)string
{
  id v3 = (id)[objc_allocWithZone((Class)NSConcreteScanner) initWithString:string];
  objc_msgSend(v3, "setLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = objc_msgSend(objc_allocWithZone((Class)NSConcreteScanner), "initWithString:", -[NSScanner string](self, "string"));
  objc_msgSend(v4, "setCharactersToBeSkipped:", -[NSScanner charactersToBeSkipped](self, "charactersToBeSkipped"));
  objc_msgSend(v4, "setScanLocation:", -[NSScanner scanLocation](self, "scanLocation"));
  objc_msgSend(v4, "setCaseSensitive:", -[NSScanner caseSensitive](self, "caseSensitive"));
  objc_msgSend(v4, "setLocale:", -[NSScanner locale](self, "locale"));
  return v4;
}

- (id)_invertedSkipSet
{
  v2 = [(NSScanner *)self charactersToBeSkipped];

  return [(NSCharacterSet *)v2 invertedSet];
}

- (BOOL)scanDouble:(double *)result
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSScanner *)self scanLocation];
  int v5 = _NSScanDoubleFromString([(NSScanner *)self string], [(NSScanner *)self charactersToBeSkipped], result, v7, [(NSScanner *)self locale]);
  if (v5) {
    [(NSScanner *)self setScanLocation:v7[0]];
  }
  return v5;
}

- (BOOL)scanHexDouble:(double *)result
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSScanner *)self scanLocation];
  int v5 = _NSScanHexDoubleFromString([(NSScanner *)self string], [(NSScanner *)self charactersToBeSkipped], result, v7, [(NSScanner *)self locale]);
  if (v5) {
    [(NSScanner *)self setScanLocation:v7[0]];
  }
  return v5;
}

- (BOOL)scanHexFloat:(float *)result
{
  v9[1] = *(double *)MEMORY[0x1E4F143B8];
  v9[0] = 0.0;
  NSUInteger v8 = [(NSScanner *)self scanLocation];
  int v5 = _NSScanHexDoubleFromString([(NSScanner *)self string], [(NSScanner *)self charactersToBeSkipped], v9, &v8, [(NSScanner *)self locale]);
  if (v5)
  {
    if (result)
    {
      float v6 = v9[0];
      *result = v6;
    }
    [(NSScanner *)self setScanLocation:v8];
  }
  return v5;
}

- (BOOL)scanLongLong:(uint64_t *)result
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSScanner *)self scanLocation];
  int v5 = _NSScanLongLongFromString([(NSScanner *)self string], [(NSScanner *)self charactersToBeSkipped], result, v7);
  if (v5) {
    [(NSScanner *)self setScanLocation:v7[0]];
  }
  return v5;
}

- (BOOL)scanInt:(int *)result
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = [(NSScanner *)self scanLocation];
  int v5 = _NSScanIntFromString([(NSScanner *)self string], [(NSScanner *)self charactersToBeSkipped], result, v7);
  if (v5) {
    [(NSScanner *)self setScanLocation:v7[0]];
  }
  return v5;
}

- (NSCharacterSet)charactersToBeSkipped
{
  return +[NSCharacterSet whitespaceAndNewlineCharacterSet];
}

- (BOOL)caseSensitive
{
  return 0;
}

- (id)locale
{
  return 0;
}

- (NSString)string
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setScanLocation:(NSUInteger)scanLocation
{
  int v5 = NSClassFromString((NSString *)@"NSScanner");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSUInteger)scanLocation
{
  NSUInteger v4 = NSClassFromString((NSString *)@"NSScanner");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)setCharactersToBeSkipped:(NSCharacterSet *)charactersToBeSkipped
{
  int v5 = NSClassFromString((NSString *)@"NSScanner");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setCaseSensitive:(BOOL)caseSensitive
{
  int v5 = NSClassFromString((NSString *)@"NSScanner");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)setLocale:(id)locale
{
  int v5 = NSClassFromString((NSString *)@"NSScanner");

  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

@end