@interface NMSSHConfig
+ (id)configFromFile:(id)a3;
- (BOOL)host:(id)a3 matchesSubpattern:(id)a4;
- (NMSSHConfig)initWithFile:(id)a3;
- (NMSSHConfig)initWithString:(id)a3;
- (NSArray)hostConfigs;
- (_NSRange)rangeInString:(id)a3 fromLocationUntilBlankOrEnd:(unint64_t)a4;
- (_NSRange)rangeOfFirstTokenInString:(id)a3 suffix:(id *)a4;
- (_NSRange)rangeOfQuotedSubstringInString:(id)a3 startingAtIndex:(unint64_t)a4;
- (id)arrayFromString:(id)a3;
- (id)blanksCharacterSet;
- (id)hostConfigForHost:(id)a3;
- (int)host:(id)a3 matchesPatternList:(id)a4;
- (void)parseHostNameWithArguments:(id)a3 intoArray:(id)a4;
- (void)parseHostWithArguments:(id)a3 intoArray:(id)a4;
- (void)parseIdentityFileWithArguments:(id)a3 intoArray:(id)a4;
- (void)parseLine:(id)a3 intoArray:(id)a4;
- (void)parsePortWithArguments:(id)a3 intoArray:(id)a4;
- (void)parseUserWithArguments:(id)a3 intoArray:(id)a4;
- (void)setHostConfigs:(id)a3;
@end

@implementation NMSSHConfig

- (void).cxx_destruct
{
}

- (void)setHostConfigs:(id)a3
{
}

- (NSArray)hostConfigs
{
  return self->_hostConfigs;
}

- (BOOL)host:(id)a3 matchesSubpattern:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  BOOL v9 = 0;
  if (!v6 || !v7) {
    goto LABEL_28;
  }
  uint64_t v10 = [v7 length];
  unint64_t v11 = [v6 length];
  if (!v10)
  {
LABEL_10:
    BOOL v9 = v10 == v11;
    goto LABEL_28;
  }
  unint64_t v12 = 0;
  while (1)
  {
    int v13 = [v8 characterAtIndex:v12];
    if (v13 == 42) {
      break;
    }
    if (v11 == v12) {
      goto LABEL_27;
    }
    int v14 = v13;
    int v15 = [v6 characterAtIndex:v12];
    if (v14 != 63 && v14 != v15) {
      goto LABEL_27;
    }
    if (v10 == ++v12) {
      goto LABEL_10;
    }
  }
  unint64_t v16 = v12 + 1;
  if (v12 + 1 == v10)
  {
LABEL_12:
    BOOL v9 = 1;
    goto LABEL_28;
  }
  int v17 = [v8 characterAtIndex:v12 + 1];
  if (v17 != 63)
  {
    int v18 = v17;
    if (v17 != 42)
    {
      if (v12 < v11)
      {
        unint64_t v23 = v12 + 2;
        while (1)
        {
          int v24 = [v6 characterAtIndex:v12++];
          if (v24 == v18)
          {
            v25 = [v6 substringFromIndex:v12];
            v26 = [v8 substringFromIndex:v23];
            BOOL v27 = [(NMSSHConfig *)self host:v25 matchesSubpattern:v26];

            if (v27) {
              goto LABEL_12;
            }
          }
          BOOL v9 = 0;
          if (v11 == v12) {
            goto LABEL_28;
          }
        }
      }
      goto LABEL_27;
    }
  }
  if (v12 >= v11)
  {
LABEL_27:
    BOOL v9 = 0;
    goto LABEL_28;
  }
  unint64_t v19 = v11 - 1;
  do
  {
    v20 = [v6 substringFromIndex:v12];
    v21 = [v8 substringFromIndex:v16];
    BOOL v9 = [(NMSSHConfig *)self host:v20 matchesSubpattern:v21];

    if (v9) {
      break;
    }
  }
  while (v19 != v12++);
LABEL_28:

  return v9;
}

- (int)host:(id)a3 matchesPatternList:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [a4 componentsSeparatedByString:@","];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    int v11 = 2;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        int v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "lowercaseString", (void)v18);
        int v14 = [v13 hasPrefix:@"!"];
        if (v14)
        {
          uint64_t v15 = [v13 substringFromIndex:1];

          int v13 = (void *)v15;
        }
        BOOL v16 = [(NMSSHConfig *)self host:v6 matchesSubpattern:v13];

        if (v14 & v16)
        {
          int v11 = 1;
          goto LABEL_16;
        }
        if (v16) {
          int v11 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v11 = 2;
  }
LABEL_16:

  return v11;
}

- (id)hostConfigForHost:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_alloc_init(NMSSHHostConfig);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = self->_hostConfigs;
  uint64_t v22 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    char v19 = 0;
    long long v20 = v5;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v6);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v9 = [v8 hostPatterns];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v24;
          int v13 = 2;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v24 != v12) {
                objc_enumerationMutation(v9);
              }
              int v15 = [(NMSSHConfig *)self host:v4 matchesPatternList:*(void *)(*((void *)&v23 + 1) + 8 * j)];
              if (v15)
              {
                if (v15 == 1) {
                  goto LABEL_19;
                }
              }
              else
              {
                int v13 = 0;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v11);

          if (!v13)
          {
            [(NMSSHHostConfig *)v20 mergeFrom:v8];
            char v19 = 1;
          }
        }
        else
        {
LABEL_19:
        }
      }
      uint64_t v22 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);

    v5 = v20;
    if (v19) {
      BOOL v16 = v20;
    }
    else {
      BOOL v16 = 0;
    }
  }
  else
  {

    BOOL v16 = 0;
  }
  int v17 = v16;

  return v17;
}

- (_NSRange)rangeOfFirstTokenInString:(id)a3 suffix:(id *)a4
{
  id v6 = a3;
  id v7 = [(NMSSHConfig *)self blanksCharacterSet];
  uint64_t v8 = (void *)[v7 mutableCopy];
  [v8 invert];
  uint64_t v9 = [v6 rangeOfCharacterFromSet:v8];
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v12 = v10;
    goto LABEL_10;
  }
  uint64_t v13 = v9;
  if ([v6 characterAtIndex:v9] != 34)
  {
    uint64_t v17 = [(NMSSHConfig *)self rangeInString:v6 fromLocationUntilBlankOrEnd:v13];
    uint64_t v11 = v17;
    NSUInteger v12 = v18;
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v16 = v17 + v18;
LABEL_9:
    *a4 = [v6 substringFromIndex:v16];
    goto LABEL_10;
  }
  uint64_t v14 = [(NMSSHConfig *)self rangeOfQuotedSubstringInString:v6 startingAtIndex:v13];
  uint64_t v11 = v14;
  NSUInteger v12 = v15;
  if (a4 && v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v15 + v14 + 1;
    goto LABEL_9;
  }
LABEL_10:

  NSUInteger v19 = v11;
  NSUInteger v20 = v12;
  result.length = v20;
  result.location = v19;
  return result;
}

- (_NSRange)rangeInString:(id)a3 fromLocationUntilBlankOrEnd:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 length] - a4;
  uint64_t v8 = [(NMSSHConfig *)self blanksCharacterSet];
  uint64_t v9 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", v8, 0, a4, v7);
  uint64_t v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v12 = v7;
  }
  else {
    NSUInteger v12 = v11 + ~a4 + v9;
  }
  NSUInteger v13 = a4;
  result.length = v12;
  result.location = v13;
  return result;
}

- (_NSRange)rangeOfQuotedSubstringInString:(id)a3 startingAtIndex:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "rangeOfString:options:range:", @"\", 0, v5, objc_msgSend(v6, "length"") - v5);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    NSUInteger v8 = a4 + 1;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v9 = 0;
  }
  else {
    NSUInteger v9 = v7 - v5;
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)blanksCharacterSet
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C0]);
  objc_msgSend(v2, "addCharactersInRange:", 32, 1);
  objc_msgSend(v2, "addCharactersInRange:", 9, 1);
  return v2;
}

- (void)parseIdentityFileWithArguments:(id)a3 intoArray:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v14 suffix:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      uint64_t v10 = objc_msgSend(v14, "substringWithRange:", v8, v9);
      uint64_t v11 = [v10 stringByExpandingTildeInPath];

      NSUInteger v12 = [v7 identityFiles];
      NSUInteger v13 = [v12 arrayByAddingObject:v11];
      [v7 setIdentityFiles:v13];
    }
  }
}

- (void)parsePortWithArguments:(id)a3 intoArray:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v13 suffix:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      uint64_t v10 = objc_msgSend(v13, "substringWithRange:", v8, v9);
      int v11 = [v10 intValue];
      if ((v11 & 0x80000000) == 0)
      {
        NSUInteger v12 = [NSNumber numberWithInteger:(unsigned __int16)v11];
        [v7 setPort:v12];
      }
    }
  }
}

- (void)parseUserWithArguments:(id)a3 intoArray:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v11 suffix:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      uint64_t v10 = objc_msgSend(v11, "substringWithRange:", v8, v9);
      [v7 setUser:v10];
    }
  }
}

- (void)parseHostNameWithArguments:(id)a3 intoArray:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    uint64_t v7 = [v6 lastObject];
    uint64_t v8 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v11 suffix:0];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9)
    {
      uint64_t v10 = objc_msgSend(v11, "substringWithRange:", v8, v9);
      [v7 setHostname:v10];
    }
  }
}

- (void)parseHostWithArguments:(id)a3 intoArray:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(NMSSHHostConfig);
  id v21 = 0;
  uint64_t v9 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v6 suffix:&v21];
  uint64_t v11 = v10;
  id v12 = v21;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = v6;
  }
  else
  {
    do
    {
      if (v11)
      {
        id v14 = objc_msgSend(v6, "substringWithRange:", v9, v11);
        NSUInteger v15 = [(NMSSHHostConfig *)v8 hostPatterns];
        uint64_t v16 = [v15 arrayByAddingObject:v14];
        [(NMSSHHostConfig *)v8 setHostPatterns:v16];
      }
      id v13 = v12;

      id v20 = v13;
      uint64_t v9 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v13 suffix:&v20];
      uint64_t v11 = v17;
      id v12 = v20;

      id v6 = v13;
    }
    while (v9 != 0x7FFFFFFFFFFFFFFFLL);
  }
  NSUInteger v18 = [(NMSSHHostConfig *)v8 hostPatterns];
  uint64_t v19 = [v18 count];

  if (v19) {
    [v7 addObject:v8];
  }
}

- (void)parseLine:(id)a3 intoArray:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F08708];
  id v8 = a3;
  uint64_t v9 = [v7 whitespaceCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

  id v16 = 0;
  uint64_t v11 = [(NMSSHConfig *)self rangeOfFirstTokenInString:v10 suffix:&v16];
  uint64_t v13 = v12;
  id v14 = v16;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v15 = objc_msgSend(v10, "substringWithRange:", v11, v13);
    if (([v15 hasPrefix:@"#"] & 1) == 0 && objc_msgSend(v15, "length"))
    {
      if ([v15 localizedCaseInsensitiveCompare:@"host"])
      {
        if ([v15 localizedCaseInsensitiveCompare:@"hostname"])
        {
          if ([v15 localizedCaseInsensitiveCompare:@"user"])
          {
            if ([v15 localizedCaseInsensitiveCompare:@"port"])
            {
              if (![v15 localizedCaseInsensitiveCompare:@"identityfile"]) {
                [(NMSSHConfig *)self parseIdentityFileWithArguments:v14 intoArray:v6];
              }
            }
            else
            {
              [(NMSSHConfig *)self parsePortWithArguments:v14 intoArray:v6];
            }
          }
          else
          {
            [(NMSSHConfig *)self parseUserWithArguments:v14 intoArray:v6];
          }
        }
        else
        {
          [(NMSSHConfig *)self parseHostNameWithArguments:v14 intoArray:v6];
        }
      }
      else
      {
        [(NMSSHConfig *)self parseHostWithArguments:v14 intoArray:v6];
      }
    }
  }
}

- (id)arrayFromString:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = v4;
    id v6 = [v4 stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];

    id v7 = [v6 componentsSeparatedByString:@"\n"];
    id v8 = [MEMORY[0x263EFF980] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          -[NMSSHConfig parseLine:intoArray:](self, "parseLine:intoArray:", *(void *)(*((void *)&v16 + 1) + 8 * i), v8, (void)v16);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    id v14 = (void *)[v8 copy];
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

- (NMSSHConfig)initWithString:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)NMSSHConfig;
  unint64_t v5 = [(NMSSHConfig *)&v9 init];
  self = v5;
  if (!v5
    || ([(NMSSHConfig *)v5 arrayFromString:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [(NMSSHConfig *)self setHostConfigs:v6],
        v6,
        self->_hostConfigs))
  {
    self = self;
    id v7 = self;
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }

  return v7;
}

- (NMSSHConfig)initWithFile:(id)a3
{
  id v4 = [NSString stringWithContentsOfFile:a3 encoding:4 error:0];
  unint64_t v5 = [(NMSSHConfig *)self initWithString:v4];

  return v5;
}

+ (id)configFromFile:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)[objc_alloc((Class)a1) initWithFile:v4];

  return v5;
}

@end