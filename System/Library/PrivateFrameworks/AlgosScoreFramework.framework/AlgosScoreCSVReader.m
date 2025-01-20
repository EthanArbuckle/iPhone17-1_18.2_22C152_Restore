@interface AlgosScoreCSVReader
+ (id)csvReader:(id)a3 header:(BOOL)a4;
- (AlgosScoreCSVReader)initWithFileName:(id)a3 header:(BOOL)a4;
- (NSArray)rows;
- (NSDictionary)headings;
- (NSError)error;
- (double)doubleAtRow:(id)a3 col:(id)a4 defaultValue:(double)a5;
- (double)doubleAtRow:(id)a3 colIndex:(int64_t)a4 defaultValue:(double)a5;
- (id)atRow:(id)a3 col:(id)a4;
- (id)atRowIndex:(int64_t)a3 col:(id)a4;
- (id)fixStrings:(id)a3;
- (id)parseFile:(id)a3 header:(BOOL)a4;
- (id)stripAndQuoteString:(id)a3;
- (int64_t)intAtRow:(id)a3 col:(id)a4 defaultValue:(int64_t)a5;
- (int64_t)intAtRow:(id)a3 colIndex:(int64_t)a4 defaultValue:(int64_t)a5;
- (void)debugPrint:(int)a3;
- (void)setError:(id)a3;
- (void)setHeadings:(id)a3;
- (void)setRows:(id)a3;
- (void)sortOnColumn:(id)a3 ascending:(BOOL)a4;
- (void)sortOnColumnIndex:(int64_t)a3 ascending:(BOOL)a4;
@end

@implementation AlgosScoreCSVReader

+ (id)csvReader:(id)a3 header:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[AlgosScoreCSVReader alloc] initWithFileName:v5 header:v4];

  return v6;
}

- (id)stripAndQuoteString:(id)a3
{
  id v3 = a3;
  BOOL v4 = &stru_26C637318;
  if (([v3 isEqualToString:&stru_26C637318] & 1) == 0)
  {
    uint64_t v11 = 0;
    id v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\S+|\".*\"" options:1 error:&v11];
    BOOL v4 = 0;
    if (!v11)
    {
      v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
      v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 range];
        objc_msgSend(v3, "substringWithRange:", v8, v9);
        BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v4 = 0;
      }
    }
  }

  return v4;
}

- (id)fixStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
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
        uint64_t v11 = -[AlgosScoreCSVReader stripAndQuoteString:](self, "stripAndQuoteString:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)parseFile:(id)a3 header:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v43 = 0;
  id v6 = [NSString stringWithContentsOfFile:a3 encoding:4 error:&v43];
  id v7 = v43;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  if (!v7)
  {
    v28 = v6;
    uint64_t v9 = [v6 componentsSeparatedByString:@"\n"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      int v13 = 1;
      v33 = self;
      BOOL v32 = v4;
      v30 = v9;
      v31 = v8;
      uint64_t v29 = *(void *)v40;
      do
      {
        uint64_t v14 = 0;
        uint64_t v34 = v11;
        do
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
          if (([v15 isEqualToString:&stru_26C637318] & 1) == 0)
          {
            if ((v13 & v4) == 1)
            {
              long long v16 = [MEMORY[0x263EFF9A0] dictionary];
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              v17 = [v15 componentsSeparatedByString:@","];
              uint64_t v18 = [(AlgosScoreCSVReader *)self fixStrings:v17];

              uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = 0;
                uint64_t v22 = *(void *)v36;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v36 != v22) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
                    v25 = [NSNumber numberWithUnsignedInteger:v21 + i];
                    [v16 setObject:v25 forKey:v24];
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
                  v21 += i;
                }
                while (v20);
              }

              self = v33;
              [(AlgosScoreCSVReader *)v33 setHeadings:v16];
              BOOL v4 = v32;
              uint64_t v9 = v30;
              uint64_t v8 = v31;
              uint64_t v12 = v29;
            }
            else
            {
              long long v16 = [v15 componentsSeparatedByString:@","];
              v26 = [(AlgosScoreCSVReader *)self fixStrings:v16];
              [v8 addObject:v26];
            }
            int v13 = 0;
            uint64_t v11 = v34;
          }
          ++v14;
        }
        while (v14 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v11);
    }
    [(AlgosScoreCSVReader *)self setRows:v8];

    id v6 = v28;
    id v7 = 0;
  }

  return v7;
}

- (AlgosScoreCSVReader)initWithFileName:(id)a3 header:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AlgosScoreCSVReader;
  id v7 = [(AlgosScoreCSVReader *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(AlgosScoreCSVReader *)v7 parseFile:v6 header:v4];
    [(AlgosScoreCSVReader *)v8 setError:v9];
  }
  return v8;
}

- (id)atRow:(id)a3 col:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(AlgosScoreCSVReader *)self headings];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "integerValue"));
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = &stru_26C637318;
  }

  return v10;
}

- (id)atRowIndex:(int64_t)a3 col:(id)a4
{
  id v6 = a4;
  id v7 = [(AlgosScoreCSVReader *)self headings];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  uint64_t v9 = [v8 integerValue];
  uint64_t v10 = [(AlgosScoreCSVReader *)self rows];
  objc_super v11 = [v10 objectAtIndexedSubscript:a3];
  uint64_t v12 = [v11 objectAtIndexedSubscript:v9];

  return v12;
}

- (double)doubleAtRow:(id)a3 col:(id)a4 defaultValue:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AlgosScoreCSVReader *)self atRow:v8 col:v9];
  if (([v10 isEqualToString:&stru_26C637318] & 1) == 0)
  {
    [v10 doubleValue];
    a5 = v11;
  }

  return a5;
}

- (double)doubleAtRow:(id)a3 colIndex:(int64_t)a4 defaultValue:(double)a5
{
  id v7 = a3;
  id v8 = [v7 objectAtIndexedSubscript:a4];
  if (([v8 isEqualToString:&stru_26C637318] & 1) == 0)
  {
    [v8 doubleValue];
    a5 = v9;
  }

  return a5;
}

- (int64_t)intAtRow:(id)a3 col:(id)a4 defaultValue:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AlgosScoreCSVReader *)self atRow:v8 col:v9];
  if (([v10 isEqualToString:&stru_26C637318] & 1) == 0) {
    a5 = [v10 longLongValue];
  }

  return a5;
}

- (int64_t)intAtRow:(id)a3 colIndex:(int64_t)a4 defaultValue:(int64_t)a5
{
  id v7 = a3;
  id v8 = [v7 objectAtIndexedSubscript:a4];
  if (([v8 isEqualToString:&stru_26C637318] & 1) == 0) {
    a5 = [v8 longLongValue];
  }

  return a5;
}

- (void)sortOnColumnIndex:(int64_t)a3 ascending:(BOOL)a4
{
  id v6 = [(AlgosScoreCSVReader *)self rows];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__AlgosScoreCSVReader_sortOnColumnIndex_ascending___block_invoke;
  v7[3] = &__block_descriptor_41_e11_q24__0_8_16l;
  BOOL v8 = a4;
  v7[4] = a3;
  [v6 sortUsingComparator:v7];
}

BOOL __51__AlgosScoreCSVReader_sortOnColumnIndex_ascending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  BOOL v8 = [a2 objectAtIndexedSubscript:v6];
  int v9 = [v8 intValue];
  uint64_t v10 = [v7 objectAtIndexedSubscript:*(void *)(a1 + 32)];

  int v11 = [v10 intValue];
  if (v5) {
    return v9 > v11;
  }
  else {
    return v9 < v11;
  }
}

- (void)sortOnColumn:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  uint64_t v6 = [(AlgosScoreCSVReader *)self headings];
  id v7 = [v6 objectForKeyedSubscript:v9];

  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF940] exceptionWithName:@"No column field" reason:0 userInfo:0];
    objc_exception_throw(v8);
  }
  -[AlgosScoreCSVReader sortOnColumnIndex:ascending:](self, "sortOnColumnIndex:ascending:", (int)[v7 intValue], v4);
}

- (void)debugPrint:(int)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v5 = [(AlgosScoreCSVReader *)self headings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        printf("%-15s", (const char *)[*(id *)(*((void *)&v30 + 1) + 8 * i) cStringUsingEncoding:4]);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  putchar(10);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [(AlgosScoreCSVReader *)self rows];
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
LABEL_10:
    uint64_t v13 = 0;
    uint64_t v14 = a3 & ~(a3 >> 31);
    while (1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(obj);
      }
      if (v13 == v14) {
        break;
      }
      long long v15 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v16);
            }
            printf("%-15s", (const char *)[*(id *)(*((void *)&v22 + 1) + 8 * j) cStringUsingEncoding:4]);
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v34 count:16];
        }
        while (v18);
      }
      --a3;

      putchar(10);
      if (++v13 == v11)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v11) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (NSDictionary)headings
{
  return self->_headings;
}

- (void)setHeadings:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_headings, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end