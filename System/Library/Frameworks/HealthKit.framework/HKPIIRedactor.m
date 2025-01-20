@interface HKPIIRedactor
+ (BOOL)supportsSecureCoding;
+ (id)_SSNRegularExpressionWithError:(id *)a3;
+ (id)_longNumberRegexWithError:(id *)a3;
+ (id)_redactFullWordRegexWithError:(id *)a3;
+ (id)redactorWithNames:(id)a3 error:(id *)a4;
- (HKPIIRedactor)initWithCoder:(id)a3;
- (NSDataDetector)dataDetectorAll;
- (NSDataDetector)dataDetectorSkipLink;
- (NSDataDetector)dataDetectorSkipLinkSkipPhoneNumbers;
- (NSDataDetector)dataDetectorSkipPhoneNumbers;
- (NSRegularExpression)SSNRegex;
- (NSRegularExpression)fullWordRegex;
- (NSRegularExpression)longNumberRegex;
- (NSSet)names;
- (id)redactedStringWithString:(id)a3;
- (id)redactedStringWithString:(id)a3 options:(unint64_t)a4;
- (id)redactedStringWithString:(id)a3 options:(unint64_t)a4 redactedCount:(unint64_t *)a5;
- (id)redactedStringWithString:(id)a3 redactedCount:(unint64_t *)a4;
- (unint64_t)_redactDataDetectorTypesFromString:(id)a3 options:(unint64_t)a4;
- (unint64_t)_redactLongNumbersFromString:(id)a3;
- (unint64_t)_redactNamesFromString:(id)a3;
- (unint64_t)_redactSSNsFromString:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKPIIRedactor

+ (id)redactorWithNames:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(HKPIIRedactor);
  if (!v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2104 error:a4];
  dataDetectorAll = v7->_dataDetectorAll;
  v7->_dataDetectorAll = (NSDataDetector *)v8;

  v10 = [(HKPIIRedactor *)v7 dataDetectorAll];

  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:2072 error:a4];
  dataDetectorSkipLink = v7->_dataDetectorSkipLink;
  v7->_dataDetectorSkipLink = (NSDataDetector *)v11;

  v13 = [(HKPIIRedactor *)v7 dataDetectorSkipLink];

  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:56 error:a4];
  dataDetectorSkipPhoneNumbers = v7->_dataDetectorSkipPhoneNumbers;
  v7->_dataDetectorSkipPhoneNumbers = (NSDataDetector *)v14;

  v16 = [(HKPIIRedactor *)v7 dataDetectorSkipPhoneNumbers];

  if (!v16) {
    goto LABEL_10;
  }
  uint64_t v17 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:24 error:a4];
  dataDetectorSkipLinkSkipPhoneNumbers = v7->_dataDetectorSkipLinkSkipPhoneNumbers;
  v7->_dataDetectorSkipLinkSkipPhoneNumbers = (NSDataDetector *)v17;

  v19 = [(HKPIIRedactor *)v7 dataDetectorSkipLinkSkipPhoneNumbers];

  if (!v19) {
    goto LABEL_10;
  }
  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
  names = v7->_names;
  v7->_names = (NSSet *)v20;

  uint64_t v22 = [a1 _redactFullWordRegexWithError:a4];
  fullWordRegex = v7->_fullWordRegex;
  v7->_fullWordRegex = (NSRegularExpression *)v22;

  v24 = [(HKPIIRedactor *)v7 fullWordRegex];

  if (!v24) {
    goto LABEL_10;
  }
  uint64_t v25 = [a1 _SSNRegularExpressionWithError:a4];
  SSNRegex = v7->_SSNRegex;
  v7->_SSNRegex = (NSRegularExpression *)v25;

  v27 = [(HKPIIRedactor *)v7 SSNRegex];

  if (v27)
  {
    uint64_t v28 = [a1 _longNumberRegexWithError:a4];
    longNumberRegex = v7->_longNumberRegex;
    v7->_longNumberRegex = (NSRegularExpression *)v28;

    v30 = [(HKPIIRedactor *)v7 longNumberRegex];

    if (v30) {
      v30 = v7;
    }
  }
  else
  {
LABEL_10:
    v30 = 0;
  }

  return v30;
}

- (id)redactedStringWithString:(id)a3
{
  return [(HKPIIRedactor *)self redactedStringWithString:a3 options:0 redactedCount:0];
}

- (id)redactedStringWithString:(id)a3 redactedCount:(unint64_t *)a4
{
  return [(HKPIIRedactor *)self redactedStringWithString:a3 options:0 redactedCount:a4];
}

- (id)redactedStringWithString:(id)a3 options:(unint64_t)a4
{
  return [(HKPIIRedactor *)self redactedStringWithString:a3 options:a4 redactedCount:0];
}

- (id)redactedStringWithString:(id)a3 options:(unint64_t)a4 redactedCount:(unint64_t *)a5
{
  uint64_t v8 = [MEMORY[0x1E4F28E78] stringWithString:a3];
  if (a4)
  {
    unint64_t v9 = 0;
    if ((a4 & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  unint64_t v9 = [(HKPIIRedactor *)self _redactDataDetectorTypesFromString:v8 options:a4];
  if ((a4 & 4) == 0) {
LABEL_5:
  }
    v9 += [(HKPIIRedactor *)self _redactNamesFromString:v8];
LABEL_6:
  if ((a4 & 2) != 0)
  {
    if ((a4 & 8) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    v9 += [(HKPIIRedactor *)self _redactSSNsFromString:v8];
    if ((a4 & 8) != 0)
    {
LABEL_8:
      if (!a5) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  v9 += [(HKPIIRedactor *)self _redactLongNumbersFromString:v8];
  if (a5) {
LABEL_9:
  }
    *a5 = v9;
LABEL_10:

  return v8;
}

- (unint64_t)_redactDataDetectorTypesFromString:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  char v6 = ~(_BYTE)a4;
  id v7 = a3;
  if ((v6 & 0x30) != 0)
  {
    if ((v4 & 0x10) != 0)
    {
      uint64_t v8 = [(HKPIIRedactor *)self dataDetectorSkipLink];
    }
    else
    {
      if ((v4 & 0x20) != 0) {
        [(HKPIIRedactor *)self dataDetectorSkipPhoneNumbers];
      }
      else {
      uint64_t v8 = [(HKPIIRedactor *)self dataDetectorAll];
      }
    }
  }
  else
  {
    uint64_t v8 = [(HKPIIRedactor *)self dataDetectorSkipLinkSkipPhoneNumbers];
  }
  unint64_t v9 = v8;
  unint64_t v10 = objc_msgSend(v8, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"█████");

  return v10;
}

- (unint64_t)_redactSSNsFromString:(id)a3
{
  id v4 = a3;
  v5 = [(HKPIIRedactor *)self SSNRegex];

  if (v5)
  {
    char v6 = [(HKPIIRedactor *)self SSNRegex];
    unint64_t v7 = objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), @"█████");
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)_SSNRegularExpressionWithError:(id *)a3
{
  v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\b(?!219(?:-|)?09(?:-|)?9999|078(?:-|)?05(?:-|)?1120)(?!666|000|9\\d{2})\\d{3}(?:-|)?(?!00)\\d{2}(?:-|)?(?!0{4})\\d{4}\\b" options:64 error:a3];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (unint64_t)_redactNamesFromString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKPIIRedactor *)self names];

  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    char v6 = [(HKPIIRedactor *)self names];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v7)
    {
      unint64_t v13 = 0;
      goto LABEL_15;
    }
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((unint64_t)[v12 length] >= 2) {
          v9 += objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", v12, @"xxREPLACExx", 385, 0, objc_msgSend(v4, "length"));
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);

    if (v9)
    {
      char v6 = [(HKPIIRedactor *)self fullWordRegex];
      unint64_t v13 = objc_msgSend(v6, "replaceMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), @"█████");
LABEL_15:

      goto LABEL_16;
    }
  }
  unint64_t v13 = 0;
LABEL_16:

  return v13;
}

+ (id)_redactFullWordRegexWithError:(id *)a3
{
  id v4 = [NSString stringWithFormat:@"\\b(?:\\.|\\w)*%@(?:\\.|\\w)*\\b", @"xxREPLACExx"];
  id v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v4 options:64 error:a3];
  char v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (unint64_t)_redactLongNumbersFromString:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HKPIIRedactor *)self longNumberRegex];

  if (v5)
  {
    char v6 = objc_opt_new();
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = 0;
    id v7 = [(HKPIIRedactor *)self longNumberRegex];
    uint64_t v8 = [v4 length];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __46__HKPIIRedactor__redactLongNumbersFromString___block_invoke;
    v24[3] = &unk_1E58C20B8;
    id v9 = v6;
    id v25 = v9;
    v26 = &v27;
    objc_msgSend(v7, "enumerateMatchesInString:options:range:usingBlock:", v4, 0, 0, v8, v24);

    unint64_t v19 = v28[3];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) rangeValue];
          uint64_t v16 = v15;
          long long v17 = [&stru_1EEC60288 stringByPaddingToLength:v15 withString:@"█" startingAtIndex:0];
          objc_msgSend(v4, "replaceCharactersInRange:withString:", v14, v16, v17);

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v31 count:16];
      }
      while (v11);
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

void __46__HKPIIRedactor__redactLongNumbersFromString___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 resultType] == 1024 && (unint64_t)objc_msgSend(v9, "numberOfRanges") >= 2)
  {
    char v3 = 0;
    unint64_t v4 = 1;
    do
    {
      while (1)
      {
        uint64_t v6 = [v9 rangeAtIndex:v4];
        if (v6 == 0x7FFFFFFFFFFFFFFFLL && !v5) {
          break;
        }
        id v7 = *(void **)(a1 + 32);
        uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v6, v5);
        [v7 addObject:v8];

        ++v4;
        char v3 = 1;
        if (v4 >= [v9 numberOfRanges]) {
          goto LABEL_11;
        }
      }
      ++v4;
    }
    while (v4 < objc_msgSend(v9, "numberOfRanges", 0x7FFFFFFFFFFFFFFFLL));
    if ((v3 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_11:
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
LABEL_12:
}

+ (id)_longNumberRegexWithError:(id *)a3
{
  char v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(?:(?:\\d{2}(?:(\\d*)\\.(\\d+)))|(?:\\d\\.\\d(\\d+))|(?:\\d{2}(\\d+)))(?:[eE][-+]?(\\d+))?" options:0 error:a3];
  unint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dataDetectorAll = self->_dataDetectorAll;
  id v5 = a3;
  [v5 encodeObject:dataDetectorAll forKey:@"DataDetectorAll"];
  [v5 encodeObject:self->_dataDetectorSkipLink forKey:@"DataDetectorSkipLink"];
  [v5 encodeObject:self->_dataDetectorSkipPhoneNumbers forKey:@"DataDetectorSkipPhoneNumbers"];
  [v5 encodeObject:self->_dataDetectorSkipLinkSkipPhoneNumbers forKey:@"DataDetectorSkipLinkSkipPhoneNumbers"];
  [v5 encodeObject:self->_names forKey:@"Names"];
  [v5 encodeObject:self->_fullWordRegex forKey:@"FullWordRegex"];
  [v5 encodeObject:self->_SSNRegex forKey:@"SSNRegex"];
  [v5 encodeObject:self->_longNumberRegex forKey:@"LongNumberRegex"];
}

- (HKPIIRedactor)initWithCoder:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HKPIIRedactor;
  id v5 = [(HKPIIRedactor *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataDetectorAll"];
    dataDetectorAll = v5->_dataDetectorAll;
    v5->_dataDetectorAll = (NSDataDetector *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataDetectorSkipLink"];
    dataDetectorSkipLink = v5->_dataDetectorSkipLink;
    v5->_dataDetectorSkipLink = (NSDataDetector *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataDetectorSkipPhoneNumbers"];
    dataDetectorSkipPhoneNumbers = v5->_dataDetectorSkipPhoneNumbers;
    v5->_dataDetectorSkipPhoneNumbers = (NSDataDetector *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DataDetectorSkipLinkSkipPhoneNumbers"];
    dataDetectorSkipLinkSkipPhoneNumbers = v5->_dataDetectorSkipLinkSkipPhoneNumbers;
    v5->_dataDetectorSkipLinkSkipPhoneNumbers = (NSDataDetector *)v12;

    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    uint64_t v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"Names"];
    names = v5->_names;
    v5->_names = (NSSet *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FullWordRegex"];
    fullWordRegex = v5->_fullWordRegex;
    v5->_fullWordRegex = (NSRegularExpression *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSNRegex"];
    SSNRegex = v5->_SSNRegex;
    v5->_SSNRegex = (NSRegularExpression *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LongNumberRegex"];
    longNumberRegex = v5->_longNumberRegex;
    v5->_longNumberRegex = (NSRegularExpression *)v23;
  }
  return v5;
}

- (NSSet)names
{
  return self->_names;
}

- (NSDataDetector)dataDetectorAll
{
  return self->_dataDetectorAll;
}

- (NSDataDetector)dataDetectorSkipLink
{
  return self->_dataDetectorSkipLink;
}

- (NSDataDetector)dataDetectorSkipPhoneNumbers
{
  return self->_dataDetectorSkipPhoneNumbers;
}

- (NSDataDetector)dataDetectorSkipLinkSkipPhoneNumbers
{
  return self->_dataDetectorSkipLinkSkipPhoneNumbers;
}

- (NSRegularExpression)fullWordRegex
{
  return self->_fullWordRegex;
}

- (NSRegularExpression)SSNRegex
{
  return self->_SSNRegex;
}

- (NSRegularExpression)longNumberRegex
{
  return self->_longNumberRegex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longNumberRegex, 0);
  objc_storeStrong((id *)&self->_SSNRegex, 0);
  objc_storeStrong((id *)&self->_fullWordRegex, 0);
  objc_storeStrong((id *)&self->_dataDetectorSkipLinkSkipPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_dataDetectorSkipPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_dataDetectorSkipLink, 0);
  objc_storeStrong((id *)&self->_dataDetectorAll, 0);

  objc_storeStrong((id *)&self->_names, 0);
}

@end