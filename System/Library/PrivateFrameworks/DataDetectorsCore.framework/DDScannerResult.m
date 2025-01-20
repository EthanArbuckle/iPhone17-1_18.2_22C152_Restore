@interface DDScannerResult
+ (BOOL)supportsSecureCoding;
+ (__CFArray)coreResultsFromResults:(id)a3;
+ (id)filterResults:(id)a3 forTypes:(unint64_t)a4 referenceDate:(id)a5 referenceTimeZone:(id)a6;
+ (id)resultFromCoreResult:(__DDResult *)a3;
+ (id)resultFromText:(id)a3 personName:(id)a4 jobTitle:(id)a5 department:(id)a6 company:(id)a7;
+ (id)resultsFromCoreResults:(__CFArray *)a3;
+ (id)shouldUrlifyBlockForTypes:(unint64_t)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)cfRange;
- (BOOL)extractStartDate:(id *)a3 startTimezone:(id *)a4 endDate:(id *)a5 endTimezone:(id *)a6 allDayRef:(BOOL *)a7 referenceDate:(id)a8 referenceTimezone:(id)a9;
- (BOOL)getFlightNumber:(id *)a3 airline:(id *)a4;
- (BOOL)getIMScreenNameValue:(id *)a3 type:(id *)a4;
- (BOOL)getMailValue:(id *)a3 label:(id *)a4;
- (BOOL)getMoneyAmount:(double *)a3 currency:(id *)a4;
- (BOOL)getPhoneValue:(id *)a3 label:(id *)a4;
- (BOOL)getPhysicalUnitValue:(double *)a3 unit:(id *)a4;
- (BOOL)getStreet:(id *)a3 city:(id *)a4 state:(id *)a5 zip:(id *)a6 country:(id *)a7;
- (BOOL)getTrackingNumber:(id *)a3 carrier:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)typeIs:(__CFString *)a3;
- (DDScannerResult)init;
- (DDScannerResult)initWithCoder:(id)a3;
- (DDScannerResult)initWithCoreResult:(__DDResult *)a3;
- (NSString)matchedString;
- (NSString)type;
- (NSString)value;
- (NSURL)url;
- (_NSRange)range;
- (_NSRange)urlificationRange;
- (__DDResult)coreResult;
- (double)getDuration;
- (id)_initWithPlist:(id)a3;
- (id)_initWithWebKitPropertyListData:(id)a3;
- (id)_webKitPropertyListData;
- (id)contextualData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateFromReferenceDate:(id)a3 referenceTimezone:(id)a4 timezoneRef:(id *)a5 allDayRef:(BOOL *)a6;
- (id)description;
- (id)location;
- (id)rawValue;
- (id)subResults;
- (id)valueForUndefinedKey:(id)a3;
- (int)category;
- (int64_t)score;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)offsetRangeBy:(int64_t)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSubResults:(id)a3;
- (void)setType:(id)a3;
@end

@implementation DDScannerResult

- (__DDResult)coreResult
{
  return self->_coreResult;
}

+ (id)resultFromCoreResult:(__DDResult *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCoreResult:a3];

  return v3;
}

- (DDScannerResult)initWithCoreResult:(__DDResult *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DDScannerResult;
  v4 = [(DDScannerResult *)&v6 init];
  if (!v4) {
    goto LABEL_4;
  }
  if (a3)
  {
    v4->_coreResult = (__DDResult *)CFRetain(a3);
LABEL_4:
    a3 = v4;
  }

  return (DDScannerResult *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedURL, 0);

  objc_storeStrong((id *)&self->_subResultsCache, 0);
}

- (void)dealloc
{
  coreResult = self->_coreResult;
  if (coreResult) {
    CFRelease(coreResult);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDScannerResult;
  [(DDScannerResult *)&v4 dealloc];
}

- (NSString)type
{
  return &self->_coreResult->var5->isa;
}

- (BOOL)getFlightNumber:(id *)a3 airline:(id *)a4
{
  coreResult = self->_coreResult;
  if (coreResult)
  {
    BOOL v7 = _typesAreEqual(coreResult->var5, @"FlightInformation");
    if (v7)
    {
      if (a4)
      {
        SubresultWithType = DDResultGetSubresultWithType((uint64_t)coreResult, @"AirlineCode");
        if (SubresultWithType)
        {
          v9 = SubresultWithType;
          SubresultWithType = (const __CFString **)SubresultWithType[10];
          if (!SubresultWithType) {
            SubresultWithType = (const __CFString **)v9[9];
          }
        }
        *a4 = [SubresultWithType uppercaseString];
      }
      if (a3)
      {
        v10 = DDResultGetSubresultWithType((uint64_t)coreResult, @"FlightNumber");
        if (v10)
        {
          v11 = v10;
          v10 = (const __CFString **)v10[10];
          if (!v10) {
            v10 = (const __CFString **)v11[9];
          }
        }
        *a3 = [v10 uppercaseString];
      }
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)getTrackingNumber:(id *)a3 carrier:(id *)a4
{
  coreResult = self->_coreResult;
  if (!coreResult) {
    goto LABEL_9;
  }
  BOOL v7 = _typesAreEqual(coreResult->var5, @"TrackingNumber");
  if (!v7) {
    return v7;
  }
  CFArrayRef var4 = coreResult->var4;
  if (CFArrayGetCount(var4) != 1)
  {
LABEL_9:
    LOBYTE(v7) = 0;
    return v7;
  }
  ValueAtIndex = (id *)CFArrayGetValueAtIndex(var4, 0);
  v10 = ValueAtIndex;
  if (a4) {
    *a4 = ValueAtIndex[8];
  }
  if (a3)
  {
    if (v10) {
      id v11 = v10[9];
    }
    else {
      id v11 = 0;
    }
    v12 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    *a3 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)getPhysicalUnitValue:(double *)a3 unit:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = 0;
  int v6 = DDResultPhysicalUnitExtraction((uint64_t)self->_coreResult, (double *)&v8, (unint64_t)&v9);
  if (v6)
  {
    if (a4) {
      *a4 = v9;
    }
    if (a3) {
      *(void *)a3 = v8;
    }
  }
  return v6 != 0;
}

- (BOOL)getMoneyAmount:(double *)a3 currency:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = 0;
  int v6 = DDResultCurrencyExtraction((uint64_t)self->_coreResult, (double *)&v8, (unint64_t)&v9);
  if (v6)
  {
    if (a4) {
      *a4 = v9;
    }
    if (a3) {
      *(void *)a3 = v8;
    }
  }
  return v6 != 0;
}

- (NSURL)url
{
  if (!self->_hasCachedURL)
  {
    v3 = (__CFString *)DDResultCopyExtractedURLWithOptions((uint64_t)self->_coreResult, 1);
    if (v3)
    {
      objc_super v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      cachedURL = self->_cachedURL;
      self->_cachedURL = v4;

      if (!self->_cachedURL)
      {
        uint64_t v6 = [(__CFString *)v3 rangeOfString:@"://"];
        if (v6 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v8 = v6 + v7;
          if (v6 + v7 < (unint64_t)[(__CFString *)v3 length])
          {
            uint64_t v9 = [(__CFString *)v3 rangeOfString:@"/", 0, v8, [(__CFString *)v3 length] - v8 options range];
            uint64_t v11 = v9 + v10;
            if (v9 + v10 < (unint64_t)[(__CFString *)v3 length])
            {
              v12 = [(__CFString *)v3 substringToIndex:v11];
              v13 = [(__CFString *)v3 substringFromIndex:v11];
              v14 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
              v15 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:v14];

              v16 = (void *)MEMORY[0x1E4F1CB10];
              v17 = [NSString stringWithFormat:@"%@%@", v12, v15];
              v18 = [v16 URLWithString:v17];
              v19 = self->_cachedURL;
              self->_cachedURL = v18;
            }
          }
        }
        if (!self->_cachedURL)
        {
          v20 = (void *)MEMORY[0x1E4F1CB10];
          v21 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
          v22 = [(__CFString *)v3 stringByAddingPercentEncodingWithAllowedCharacters:v21];
          v23 = [v20 URLWithString:v22];
          v24 = self->_cachedURL;
          self->_cachedURL = v23;
        }
      }
    }
    self->_hasCachedURL = 1;
  }
  v25 = self->_cachedURL;

  return v25;
}

- (void)offsetRangeBy:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int64_t v3 = a3;
    uint64_t v5 = [(DDScannerResult *)self range];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    long long v14 = 0u;
    long long v15 = 0u;
    if (v5 + v3 < 0 != __OFADD__(v5, v3)) {
      int64_t v3 = -v5;
    }
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    uint64_t v9 = [(DDScannerResult *)self subResults];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) offsetRangeBy:v3];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    -[DDScannerResult setRange:](self, "setRange:", v3 + v6, v8);
  }
}

- (id)_initWithPlist:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DDScannerResult;
  id v5 = [(DDScannerResult *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"VN"];
    uint64_t v7 = [v6 longValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"AR"];
    uint64_t v9 = [v8 rangeValue];
    uint64_t v11 = v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"T"];
    *((void *)v5 + 1) = DDResultCreate(v12, v9 << 32, (unint64_t)(v9 + v11) << 32);

    uint64_t v13 = *((void *)v5 + 1);
    long long v14 = [v4 objectForKeyedSubscript:@"MS"];
    DDResultSetMatchedString(v13, v14);

    uint64_t v15 = *((void *)v5 + 1);
    *(void *)(v15 + 32) = v9;
    *(void *)(v15 + 40) = v11;
    if (v7)
    {
      long long v16 = [v4 objectForKeyedSubscript:@"P"];
      *(void *)(*((void *)v5 + 1) + 96) = [v16 integerValue] & 0xFFFFFFFFFFFBFFFFLL;
    }
    long long v17 = [v4 objectForKeyedSubscript:@"CF"];
    v18 = v17;
    if (v17)
    {
      uint64_t v19 = *((void *)v5 + 1);
      [v17 floatValue];
      if (v19)
      {
        *(_DWORD *)(v19 + 108) = v20;
        *(unsigned char *)(v19 + 104) = 1;
      }
    }
    v21 = [v4 objectForKeyedSubscript:@"V"];
    if (v21) {
      DDResultSetValue(*((void *)v5 + 1), v21);
    }
    v22 = [v4 objectForKeyedSubscript:@"C"];
    if (v22) {
      DDResultSetContextualData(*((void *)v5 + 1), v22);
    }
    v23 = [v4 objectForKeyedSubscript:@"SR"];
    if (v23) {
      [v5 setSubResults:v23];
    }
  }
  return v5;
}

- (DDScannerResult)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionaryWithCapacity:9];
  uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"AR"];
  [v6 setObject:v7 forKeyedSubscript:@"AR"];

  uint64_t v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"MS"];
  [v6 setObject:v8 forKeyedSubscript:@"MS"];

  uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"T"];
  [v6 setObject:v9 forKeyedSubscript:@"T"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "decodeIntegerForKey:", @"P"));
  [v6 setObject:v10 forKeyedSubscript:@"P"];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  long long v14 = [v5 decodeObjectOfClasses:v13 forKey:@"SR"];
  [v6 setObject:v14 forKeyedSubscript:@"SR"];

  uint64_t v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"V"];
  [v6 setObject:v15 forKeyedSubscript:@"V"];

  long long v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  int v20 = [v5 decodeObjectOfClasses:v19 forKey:@"C"];
  [v6 setObject:v20 forKeyedSubscript:@"C"];

  v21 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"CF"];
  [v6 setObject:v21 forKeyedSubscript:@"CF"];

  v22 = NSNumber;
  uint64_t v23 = [v5 decodeIntegerForKey:@"VN"];

  v24 = [v22 numberWithInteger:v23];
  [v6 setObject:v24 forKeyedSubscript:@"VN"];

  objc_super v25 = [(DDScannerResult *)self _initWithPlist:v6];
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  id v4 = (void *)MEMORY[0x1E4F29238];
  uint64_t v5 = [(DDScannerResult *)self range];
  uint64_t v7 = objc_msgSend(v4, "valueWithRange:", v5, v6);
  [v20 encodeObject:v7 forKey:@"AR"];

  uint64_t v8 = [(DDScannerResult *)self matchedString];
  [v20 encodeObject:v8 forKey:@"MS"];

  uint64_t v9 = [(DDScannerResult *)self type];
  [v20 encodeObject:v9 forKey:@"T"];

  [v20 encodeInteger:self->_coreResult->var9 & 0xFFFFFFFFFFFBFFFFLL forKey:@"P"];
  uint64_t v10 = [(DDScannerResult *)self subResults];

  if (v10)
  {
    uint64_t v11 = [(DDScannerResult *)self subResults];
    uint64_t v12 = (void *)[v11 copy];
    [v20 encodeObject:v12 forKey:@"SR"];
  }
  uint64_t v13 = [(DDScannerResult *)self rawValue];

  if (v13)
  {
    long long v14 = [(DDScannerResult *)self rawValue];
    [v20 encodeObject:v14 forKey:@"V"];
  }
  uint64_t v15 = [(DDScannerResult *)self contextualData];

  if (v15)
  {
    long long v16 = [(DDScannerResult *)self contextualData];
    uint64_t v17 = (void *)[v16 copy];
    [v20 encodeObject:v17 forKey:@"C"];
  }
  if (DDResultHasContextualFloat((uint64_t)self->_coreResult))
  {
    *(float *)&double v18 = DDResultGetContextualFloat((uint64_t)self->_coreResult);
    uint64_t v19 = [NSNumber numberWithFloat:v18];
    [v20 encodeObject:v19 forKey:@"CF"];
  }
  [v20 encodeInteger:1 forKey:@"VN"];
}

- (id)_initWithWebKitPropertyListData:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"AR"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !strcmp((const char *)[objc_retainAutorelease(v5) objCType], "{_NSRange=QQ}"))
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"MS"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"T"];
      objc_opt_class();
      char v9 = objc_opt_isKindOfClass();

      if (v9)
      {
        uint64_t v10 = [v4 objectForKeyedSubscript:@"P"];
        objc_opt_class();
        char v11 = objc_opt_isKindOfClass();

        if (v11)
        {
          uint64_t v12 = [v4 objectForKeyedSubscript:@"VN"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_27;
          }
          if ([v12 longValue] != 1) {
            goto LABEL_27;
          }
          uint64_t v13 = [v4 objectForKeyedSubscript:@"SR"];
          if (v13)
          {
            long long v14 = (void *)v13;
            uint64_t v15 = [v4 objectForKeyedSubscript:@"SR"];
            objc_opt_class();
            char v16 = objc_opt_isKindOfClass();

            if ((v16 & 1) == 0) {
              goto LABEL_27;
            }
          }
          v36 = v12;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v17 = [v4 objectForKeyedSubscript:@"SR"];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v38;
            while (2)
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v38 != v20) {
                  objc_enumerationMutation(v17);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  goto LABEL_30;
                }
                ++v21;
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          uint64_t v22 = [v4 objectForKeyedSubscript:@"V"];
          if (v22)
          {
            uint64_t v23 = (void *)v22;
            v24 = [v4 objectForKeyedSubscript:@"V"];
            objc_opt_class();
            char v25 = objc_opt_isKindOfClass();

            if ((v25 & 1) == 0)
            {
LABEL_30:
              v34 = 0;
              uint64_t v12 = v36;
              goto LABEL_28;
            }
          }
          uint64_t v26 = [v4 objectForKeyedSubscript:@"C"];
          uint64_t v12 = v36;
          if (v26)
          {
            v27 = (void *)v26;
            v28 = [v4 objectForKeyedSubscript:@"C"];
            objc_opt_class();
            char v29 = objc_opt_isKindOfClass();

            if ((v29 & 1) == 0) {
              goto LABEL_27;
            }
          }
          uint64_t v30 = [v4 objectForKeyedSubscript:@"CF"];
          if (!v30
            || (v31 = (void *)v30,
                [v4 objectForKeyedSubscript:@"CF"],
                v32 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char v33 = objc_opt_isKindOfClass(),
                v32,
                v31,
                (v33 & 1) != 0))
          {
            self = (DDScannerResult *)[(DDScannerResult *)self _initWithPlist:v4];
            v34 = self;
          }
          else
          {
LABEL_27:
            v34 = 0;
          }
LABEL_28:

          goto LABEL_26;
        }
      }
    }
  }
  v34 = 0;
LABEL_26:

  return v34;
}

- (id)_webKitPropertyListData
{
  int64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:9];
  id v4 = (void *)MEMORY[0x1E4F29238];
  uint64_t v5 = [(DDScannerResult *)self range];
  uint64_t v7 = objc_msgSend(v4, "valueWithRange:", v5, v6);
  [v3 setObject:v7 forKeyedSubscript:@"AR"];

  uint64_t v8 = [(DDScannerResult *)self matchedString];
  [v3 setObject:v8 forKeyedSubscript:@"MS"];

  char v9 = [(DDScannerResult *)self type];
  [v3 setObject:v9 forKeyedSubscript:@"T"];

  uint64_t v10 = [NSNumber numberWithLong:self->_coreResult->var9 & 0xFFFFFFFFFFFBFFFFLL];
  [v3 setObject:v10 forKeyedSubscript:@"P"];

  char v11 = [(DDScannerResult *)self subResults];

  if (v11)
  {
    uint64_t v12 = [(DDScannerResult *)self subResults];
    [v3 setObject:v12 forKeyedSubscript:@"SR"];
  }
  uint64_t v13 = [(DDScannerResult *)self rawValue];

  if (v13)
  {
    long long v14 = [(DDScannerResult *)self rawValue];
    [v3 setObject:v14 forKeyedSubscript:@"V"];
  }
  uint64_t v15 = [(DDScannerResult *)self contextualData];

  if (v15)
  {
    char v16 = [(DDScannerResult *)self contextualData];
    [v3 setObject:v16 forKeyedSubscript:@"C"];
  }
  if (DDResultHasContextualFloat((uint64_t)self->_coreResult))
  {
    uint64_t v17 = NSNumber;
    *(float *)&double v18 = DDResultGetContextualFloat((uint64_t)self->_coreResult);
    uint64_t v19 = [v17 numberWithFloat:v18];
    [v3 setObject:v19 forKeyedSubscript:@"CF"];
  }
  [v3 setObject:&unk_1EF03BEF0 forKeyedSubscript:@"VN"];

  return v3;
}

- (BOOL)getStreet:(id *)a3 city:(id *)a4 state:(id *)a5 zip:(id *)a6 country:(id *)a7
{
  if (a3)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%@.value", @"Street"];
    *a3 = [(DDScannerResult *)self valueForKeyPath:v13];
  }
  if (a4)
  {
    long long v14 = [NSString stringWithFormat:@"%@.value", @"City"];
    *a4 = [(DDScannerResult *)self valueForKeyPath:v14];
  }
  if (a6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@.value", @"ZipCode"];
    *a6 = [(DDScannerResult *)self valueForKeyPath:v15];
  }
  if (a5)
  {
    char v16 = [NSString stringWithFormat:@"%@.value", @"State"];
    *a5 = [(DDScannerResult *)self valueForKeyPath:v16];
  }
  if (a7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%@.value", @"Country"];
    *a7 = [(DDScannerResult *)self valueForKeyPath:v17];
  }
  return 1;
}

- (BOOL)getIMScreenNameValue:(id *)a3 type:(id *)a4
{
  uint64_t v7 = [(DDScannerResult *)self valueForKeyPath:@"Value"];
  uint64_t v8 = [v7 matchedString];

  if (a3) {
    *a3 = v8;
  }
  char v9 = [NSString stringWithFormat:@"%@.value", @"Label"];
  uint64_t v10 = [(DDScannerResult *)self valueForKeyPath:v9];

  if (a4) {
    *a4 = v10;
  }
  if (v8)
  {
    BOOL v11 = 0;
    if ([v8 length] && v10) {
      BOOL v11 = [v10 length] != 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)getMailValue:(id *)a3 label:(id *)a4
{
  uint64_t v7 = [(DDScannerResult *)self valueForKeyPath:@"Value"];
  uint64_t v8 = [v7 matchedString];

  if (a3) {
    *a3 = v8;
  }
  if (a4)
  {
    char v9 = [NSString stringWithFormat:@"%@.value", @"Label"];
    *a4 = [(DDScannerResult *)self valueForKeyPath:v9];
  }
  if (v8) {
    BOOL v10 = [v8 length] != 0;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)getPhoneValue:(id *)a3 label:(id *)a4
{
  id v11 = 0;
  id v12 = 0;
  coreResult = self->_coreResult;
  if (a3) {
    uint64_t v7 = &v12;
  }
  else {
    uint64_t v7 = 0;
  }
  if (a4) {
    uint64_t v8 = (CFStringRef *)&v11;
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = DDResultCopyValueLabelValue((uint64_t)coreResult, (CFTypeRef *)v7, v8, 0);
  if (v12) {
    *a3 = v12;
  }
  if (v11) {
    *a4 = v11;
  }
  return v9 != 0;
}

- (BOOL)extractStartDate:(id *)a3 startTimezone:(id *)a4 endDate:(id *)a5 endTimezone:(id *)a6 allDayRef:(BOOL *)a7 referenceDate:(id)a8 referenceTimezone:(id)a9
{
  id v23 = 0;
  id v24 = 0;
  id v21 = 0;
  id v22 = 0;
  BOOL v20 = 0;
  id v16 = a9;
  id v17 = a8;
  int started = DDResultCopyExtractedStartDateEndDate((uint64_t)[(DDScannerResult *)self coreResult], (CFDateRef *)&v24, (CFTypeRef *)&v23, (CFTypeRef *)&v22, (CFTypeRef *)&v21, &v20, v17, v16);

  if (started)
  {
    if (a3) {
      *a3 = v24;
    }
    if (a4) {
      *a4 = v23;
    }
    if (a5) {
      *a5 = v22;
    }
    if (a6) {
      *a6 = v21;
    }
    if (a7) {
      *a7 = v20;
    }
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v21) {
    CFRelease(v21);
  }
  return started != 0;
}

- (id)dateFromReferenceDate:(id)a3 referenceTimezone:(id)a4 timezoneRef:(id *)a5 allDayRef:(BOOL *)a6
{
  BOOL v16 = 0;
  id v14 = 0;
  id v15 = 0;
  id v10 = a4;
  id v11 = a3;
  LODWORD(self) = DDResultCopyExtractedDateFromReferenceDate((uint64_t)[(DDScannerResult *)self coreResult], v11, v10, &v16, (CFDateRef *)&v15, (CFTypeRef *)&v14);

  if (!self) {
    goto LABEL_6;
  }
  if (a6) {
    *a6 = v16;
  }
  if (a5)
  {
    *a5 = v14;
  }
  else
  {
LABEL_6:
    if (v14) {
      CFRelease(v14);
    }
  }
  id v12 = v15;

  return v12;
}

- (double)getDuration
{
  if (DDLogHandle_onceToken != -1) {
    dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_776);
  }
  v2 = (id)DDLogHandle_error_log_handle;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_19DC95000, v2, OS_LOG_TYPE_ERROR, "Call to DDResultGetDuration is deprecated. Result will be incorrect. Please contact the DataDetectors team if you need this", v4, 2u);
  }

  return 0.0;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(DDScannerResult *)self subResults];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 type];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setSubResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  if (self->_subResultsCache != v5) {
    objc_storeStrong((id *)&self->_subResultsCache, a3);
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = v5;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "coreResult", (void)v12));
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  DDResultSetSubResults((uint64_t)self->_coreResult, Mutable);
  CFRelease(Mutable);
}

- (id)subResults
{
  subResultsCache = self->_subResultsCache;
  if (!subResultsCache)
  {
    CFArrayRef var4 = self->_coreResult->var4;
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (var4)
    {
      id v6 = (NSArray *)[v5 initWithCapacity:CFArrayGetCount(var4)];
      CFIndex Count = CFArrayGetCount(var4);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        for (CFIndex i = 0; i != v8; ++i)
        {
          uint64_t v10 = [[DDScannerResult alloc] initWithCoreResult:CFArrayGetValueAtIndex(var4, i)];
          if (v10) {
            [(NSArray *)v6 addObject:v10];
          }
        }
      }
    }
    else
    {
      id v6 = (NSArray *)[v5 initWithCapacity:0];
    }
    char v11 = self->_subResultsCache;
    self->_subResultsCache = v6;

    subResultsCache = self->_subResultsCache;
  }

  return subResultsCache;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(DDScannerResult *)self type],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v4 type],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqual:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(DDScannerResult *)self range];
    uint64_t v10 = v9;
    char v12 = 0;
    if (v8 == [v4 range] && v10 == v11)
    {
      long long v13 = [(DDScannerResult *)self subResults];
      long long v14 = [v4 subResults];
      char v12 = [v13 isEqual:v14];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  int64_t v3 = [(DDScannerResult *)self type];

  id v4 = NSString;
  if (v3)
  {
    id v5 = [(DDScannerResult *)self type];
    v10.location = [(DDScannerResult *)self range];
    id v6 = NSStringFromRange(v10);
    int v7 = [v4 stringWithFormat:@"<Result:%@:%@>", v5, v6];
  }
  else
  {
    v11.location = [(DDScannerResult *)self range];
    id v5 = NSStringFromRange(v11);
    int v7 = [v4 stringWithFormat:@"<Result:%@>", v5];
  }

  return v7;
}

- (NSString)matchedString
{
  coreResult = self->_coreResult;
  if (coreResult) {
    return &coreResult->var6->isa;
  }
  else {
    return 0;
  }
}

- (id)contextualData
{
  coreResult = self->_coreResult;
  if (coreResult) {
    return coreResult->var8;
  }
  else {
    return 0;
  }
}

- (id)location
{
  return 0;
}

- (id)rawValue
{
  coreResult = self->_coreResult;
  if (coreResult) {
    return coreResult->var7;
  }
  else {
    return 0;
  }
}

- (NSString)value
{
  coreResult = self->_coreResult;
  if (!coreResult) {
    return 0;
  }
  result = (NSString *)coreResult->var7;
  if (!result) {
    return &coreResult->var6->isa;
  }
  return result;
}

- (void)setType:(id)a3
{
}

- (BOOL)typeIs:(__CFString *)a3
{
  coreResult = self->_coreResult;
  if (coreResult) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4 && _typesAreEqual(coreResult->var5, a3);
}

- (int64_t)score
{
  return self->_coreResult->var3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)cfRange
{
  coreResult = self->_coreResult;
  int64_t var0 = coreResult->var2.var0;
  int64_t var1 = coreResult->var2.var1;
  result.int64_t var1 = var1;
  result.int64_t var0 = var0;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_coreResult->var2 = ($0AC6E346AE4835514AAA8AC86D8F4844)a3;
}

- (_NSRange)range
{
  coreResult = self->_coreResult;
  NSUInteger var0 = coreResult->var2.var0;
  NSUInteger var1 = coreResult->var2.var1;
  result.length = var1;
  result.location = var0;
  return result;
}

- (int)category
{
  return DDResultGetCategory((uint64_t)self->_coreResult);
}

- (_NSRange)urlificationRange
{
  NSUInteger RangeForURLification = DDResultGetRangeForURLification((uint64_t)self->_coreResult);
  result.length = v3;
  result.location = RangeForURLification;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (DDScannerResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)DDScannerResult;
  v2 = [(DDScannerResult *)&v5 init];
  if (v2)
  {
    CFTypeID v3 = DDTypeRegister(&DDResultGetTypeID_typeID);
    v2->_coreResult = (__DDResult *)DDTypeCreateInstance_(0, v3, 0x60uLL);
  }
  return v2;
}

+ (id)resultFromText:(id)a3 personName:(id)a4 jobTitle:(id)a5 department:(id)a6 company:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v11 length]
    && (long long v28 = xmmword_19DCCF980,
        ContactNameComponentInText = createContactNameComponentInText(v11, v12, @"NLPContactName", (NSRange *)&v28), uint64_t v17 = createContactNameComponentInText(v11, v13, @"JobTitle", (NSRange *)&v28), v18 = createContactNameComponentInText(v11, v14, @"DepartmentName", (NSRange *)&v28), v19 = createContactNameComponentInText(v11, v15, @"CompanyName", (NSRange *)&v28), v20 = v28, (void)v28 != 0x7FFFFFFFFFFFFFFFLL))
  {
    value = v18;
    v27 = v19;
    NSUInteger v22 = *((void *)&v28 + 1);
    id v23 = DDResultCreate(@"Contact", ((void)v28 << 32) | 0x10000, ((unint64_t)(DWORD2(v28) + v28) << 32) | 0x10000);
    DDResultSetMatchedString((uint64_t)v23, (CFTypeRef)objc_msgSend(v11, "substringWithRange:", v20, v22));
    v23[4] = v20;
    v23[5] = v22;
    if (ContactNameComponentInText)
    {
      id v24 = DDResultCreate(@"ContactName", ContactNameComponentInText[2], ContactNameComponentInText[3]);
      DDResultSetMatchedString((uint64_t)v24, (CFTypeRef)ContactNameComponentInText[9]);
      v24[2] = *((_OWORD *)ContactNameComponentInText + 2);
      DDResultAddSubresult((uint64_t)v24, ContactNameComponentInText);
      CFRelease(ContactNameComponentInText);
      DDResultAddSubresult((uint64_t)v23, v24);
      CFRelease(v24);
    }
    if (v17)
    {
      DDResultAddSubresult((uint64_t)v23, v17);
      CFRelease(v17);
    }
    if (value)
    {
      DDResultAddSubresult((uint64_t)v23, value);
      CFRelease(value);
    }
    if (v27)
    {
      DDResultAddSubresult((uint64_t)v23, v27);
      CFRelease(v27);
    }
    id v21 = +[DDScannerResult resultFromCoreResult:](DDScannerResult, "resultFromCoreResult:", v23, value);
    CFRelease(v23);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

+ (id)filterResults:(id)a3 forTypes:(unint64_t)a4 referenceDate:(id)a5 referenceTimeZone:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 count];
  if (v13)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
    id v15 = [a1 shouldUrlifyBlockForTypes:a4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v10;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (((unsigned int (**)(void, uint64_t, id, id))v15)[2](v15, [v21 coreResult], v11, v12))
          {
            [v14 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }

    id v10 = v23;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

+ (id)shouldUrlifyBlockForTypes:(unint64_t)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__DDScannerResult_shouldUrlifyBlockForTypes___block_invoke;
  aBlock[3] = &__block_descriptor_40_e206_B32__0____DDResult____CFRuntimeBase_QAQ____DDQueryRange____DDQueryOffset_b16b16b32____DDQueryOffset_b16b16b32_____qq_q____CFArray_____CFString_____CFString__v____CFDictionary_qCf_8__NSDate_16__NSTimeZone_24l;
  aBlock[4] = a3;
  CFTypeID v3 = _Block_copy(aBlock);
  BOOL v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __45__DDScannerResult_shouldUrlifyBlockForTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  CFTimeZoneRef v8 = a4;
  int Category = DDResultGetCategory(a2);
  CFStringRef v10 = *(const __CFString **)(a2 + 64);
  if (CFEqual(@"SignatureBlock", v10)) {
    goto LABEL_6;
  }
  if (*(unsigned char *)(a2 + 96))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if ((v12 & 4) != 0 && Category == 3) {
      goto LABEL_6;
    }
    if ((v12 & 0x10) != 0)
    {
      if (CFEqual(@"TrackingNumber", v10)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 0x20) != 0)
    {
      if (CFEqual(@"FlightInformation", v10)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 0x40) != 0)
    {
      if (CFEqual(@"Parsec", v10)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 0x20000) != 0)
    {
      if (CFEqual(@"GameCenter", v10)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 1) != 0 && Category == 2) {
      goto LABEL_6;
    }
    if ((v12 & 2) != 0)
    {
      if (_DDResultIsURL((uint64_t)v10)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 8) != 0 && Category == 4)
    {
      if (!DDResultIsPastDate(a2, v7, v8)) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 0x40000) != 0)
    {
      if (_typesAreEqual(*(CFStringRef *)(a2 + 64), @"AuthCode")) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 0x80000) != 0)
    {
      if (_typesAreEqual(*(CFStringRef *)(a2 + 64), @"ContactName")) {
        goto LABEL_6;
      }
      uint64_t v12 = *(void *)(a1 + 32);
    }
    if ((v12 & 0x100000) == 0) {
      goto LABEL_38;
    }
    if (!_typesAreEqual(*(CFStringRef *)(a2 + 64), @"CompanyName"))
    {
      uint64_t v12 = *(void *)(a1 + 32);
LABEL_38:
      if ((v12 & 0x200000) != 0)
      {
        if (_typesAreEqual(*(CFStringRef *)(a2 + 64), @"evts"))
        {
          double Helper_x8__OBJC_CLASS___CSFFeatureManager = gotLoadHelper_x8__OBJC_CLASS___CSFFeatureManager(v14);
          uint64_t v17 = objc_msgSend(*(id *)(v16 + 3000), "shouldShowRSVPDataDetectors", Helper_x8__OBJC_CLASS___CSFFeatureManager);
          goto LABEL_50;
        }
        uint64_t v12 = *(void *)(a1 + 32);
      }
      if ((v12 & 0x80) != 0)
      {
        if (_typesAreEqual(*(CFStringRef *)(a2 + 64), @"Money"))
        {
LABEL_47:
          Class v18 = NSClassFromString(&cfstr_Ddconversionac.isa);
          if (!v18) {
            goto LABEL_3;
          }
          Class v19 = v18;
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_3;
          }
          uint64_t v17 = [(objc_class *)v19 actionAvailableForResult:a2];
LABEL_50:
          uint64_t v11 = v17;
          goto LABEL_7;
        }
        uint64_t v12 = *(void *)(a1 + 32);
      }
      if ((v12 & 0x100) == 0 || !_typesAreEqual(*(CFStringRef *)(a2 + 64), @"PhysicalAmount")) {
        goto LABEL_3;
      }
      goto LABEL_47;
    }
LABEL_6:
    uint64_t v11 = 1;
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v11 = 0;
LABEL_7:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (__CFArray)coreResultsFromResults:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v13 = [v3 count];
  uint64_t v4 = v11[3];
  if (v4 <= 0)
  {
    CFArrayRef v6 = CFArrayCreate(0, 0, 0, MEMORY[0x1E4F1D510]);
  }
  else
  {
    objc_super v5 = (const void **)malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
    v11[3] = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__DDScannerResult_coreResultsFromResults___block_invoke;
    v9[3] = &unk_1E5985B08;
    v9[4] = &v10;
    v9[5] = v5;
    [v3 enumerateObjectsUsingBlock:v9];
    CFArrayRef v6 = CFArrayCreate(0, v5, v11[3], MEMORY[0x1E4F1D510]);
    free(v5);
  }
  id v7 = (__CFArray *)CFAutorelease(v6);
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __42__DDScannerResult_coreResultsFromResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 coreResult];
  if (result) {
    *(void *)(*(void *)(a1 + 40) + 8 * (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++) = result;
  }
  return result;
}

+ (id)resultsFromCoreResults:(__CFArray *)a3
{
  if (a3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:CFArrayGetCount(a3)];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__DDScannerResult_resultsFromCoreResults___block_invoke;
    v7[3] = &unk_1E5985AE0;
    id v5 = v4;
    id v8 = v5;
    [(__CFArray *)a3 enumerateObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

void __42__DDScannerResult_resultsFromCoreResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[DDScannerResult alloc] initWithCoreResult:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

@end