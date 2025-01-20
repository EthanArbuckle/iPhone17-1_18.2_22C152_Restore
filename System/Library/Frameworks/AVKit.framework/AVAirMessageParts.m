@interface AVAirMessageParts
+ (id)messagePartsWithData:(id)a3 lineSeparator:(id)a4 data:(id)a5 headerBodySeparator:(id)a6 data:(id)a7 bodyLengthKey:(id)a8;
+ (void)registerClass:(Class)a3 forMessageVersion:(id)a4;
- (AVAirMessageParts)initWithVersion:(id)a3 headers:(id)a4 expectedBodyLength:(int64_t)a5 body:(id)a6 extra:(id)a7;
- (BOOL)isIncomplete;
- (BOOL)shouldCallReverseTransformerAgain;
- (Class)_matchingClass;
- (NSArray)headers;
- (NSArray)repeatedHeaders;
- (NSData)extraData;
- (NSData)rawBodyData;
- (NSData)uncompressedBodyData;
- (NSDictionary)bodyAsJSONDictionary;
- (NSDictionary)uniqueHeaders;
- (NSString)bodyAsUTF8Text;
- (NSString)version;
- (id)airMessage;
- (id)bodyAsJSON;
- (id)decompressBodyUsingAlgorithm:(int64_t)a3;
- (id)decompressBodyUsingNamedAlgorithm:(id)a3;
- (int64_t)expectedBodyLength;
- (void)_identifyUniqueAndRepeatedHeadersIfNecessary;
- (void)_setIncomplete;
- (void)setUncompressedBodyData:(id)a3;
@end

@implementation AVAirMessageParts

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncompressedBodyData, 0);
  objc_storeStrong((id *)&self->_extraData, 0);
  objc_storeStrong((id *)&self->_rawBodyData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_repeatedHeaders, 0);

  objc_storeStrong((id *)&self->_uniqueHeaders, 0);
}

- (void)setUncompressedBodyData:(id)a3
{
}

- (NSData)uncompressedBodyData
{
  return self->_uncompressedBodyData;
}

- (NSData)extraData
{
  return self->_extraData;
}

- (NSData)rawBodyData
{
  return self->_rawBodyData;
}

- (int64_t)expectedBodyLength
{
  return self->_expectedBodyLength;
}

- (NSArray)headers
{
  return self->_headers;
}

- (NSString)version
{
  return self->_version;
}

- (BOOL)isIncomplete
{
  return self->_isIncomplete;
}

- (BOOL)shouldCallReverseTransformerAgain
{
  if ([(AVAirMessageParts *)self isIncomplete]) {
    return 0;
  }
  v4 = [(AVAirMessageParts *)self extraData];
  BOOL v3 = [v4 length] != 0;

  return v3;
}

- (id)decompressBodyUsingNamedAlgorithm:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(AVAirMessageParts *)self isIncomplete])
  {
    v5 = 0;
    goto LABEL_17;
  }
  v6 = [v4 lowercaseString];
  if ([v4 length] && !objc_msgSend(v6, "isEqualToString:", @"none"))
  {
    if ([v6 isEqualToString:@"lzfse"])
    {
      uint64_t v8 = 0;
    }
    else if ([v6 isEqualToString:@"lz4"])
    {
      uint64_t v8 = 1;
    }
    else if ([v6 isEqualToString:@"zlib"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      if (([v6 isEqualToString:@"lzma"] & 1) == 0)
      {
        v10 = _avairlog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315394;
          v12 = "-[AVAirMessageParts decompressBodyUsingNamedAlgorithm:]";
          __int16 v13 = 2114;
          id v14 = v4;
          _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data; algorithm name '%{public}@' is not recognized",
            (uint8_t *)&v11,
            0x16u);
        }

        v5 = 0;
        goto LABEL_16;
      }
      uint64_t v8 = 2;
    }
    uint64_t v7 = [(AVAirMessageParts *)self decompressBodyUsingAlgorithm:v8];
  }
  else
  {
    uint64_t v7 = [(AVAirMessageParts *)self rawBodyData];
  }
  v5 = (void *)v7;
LABEL_16:

LABEL_17:

  return v5;
}

- (id)decompressBodyUsingAlgorithm:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(AVAirMessageParts *)self isIncomplete])
  {
    v5 = 0;
  }
  else
  {
    v6 = [(AVAirMessageParts *)self rawBodyData];
    v5 = v6;
    if ((a3 & 0x8000000000000000) == 0)
    {
      id v11 = 0;
      uint64_t v7 = [v6 decompressedDataUsingAlgorithm:a3 error:&v11];
      id v8 = v11;

      if (!v7)
      {
        v9 = _avairlog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v13 = "-[AVAirMessageParts decompressBodyUsingAlgorithm:]";
          __int16 v14 = 2114;
          id v15 = v8;
          _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s failed to decompress data (%{public}@)", buf, 0x16u);
        }
      }
      v5 = (void *)v7;
    }
  }

  return v5;
}

- (NSDictionary)bodyAsJSONDictionary
{
  v2 = [(AVAirMessageParts *)self bodyAsJSON];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (id)bodyAsJSON
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(AVAirMessageParts *)self isIncomplete])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(AVAirMessageParts *)self uncompressedBodyData];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(AVAirMessageParts *)self rawBodyData];
    }
    uint64_t v7 = v6;

    id v11 = 0;
    id v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:4 error:&v11];
    id v8 = v11;
    if (!v3)
    {
      v9 = _avairlog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[AVAirMessageParts bodyAsJSON]";
        __int16 v14 = 2114;
        id v15 = v8;
        _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s JSON deserialization failed: %{public}@", buf, 0x16u);
      }
    }
  }

  return v3;
}

- (NSString)bodyAsUTF8Text
{
  if ([(AVAirMessageParts *)self isIncomplete])
  {
    id v3 = [(AVAirMessageParts *)self rawBodyData];

    if (!v3) {
      goto LABEL_9;
    }
    id v4 = [NSString alloc];
    v5 = [(AVAirMessageParts *)self rawBodyData];
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(AVAirMessageParts *)self uncompressedBodyData];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(AVAirMessageParts *)self rawBodyData];
    }
    v5 = v9;

    id v6 = [NSString alloc];
  }
  id v3 = (void *)[v6 initWithData:v5 encoding:4];

LABEL_9:

  return (NSString *)v3;
}

- (NSArray)repeatedHeaders
{
  [(AVAirMessageParts *)self _identifyUniqueAndRepeatedHeadersIfNecessary];
  repeatedHeaders = self->_repeatedHeaders;

  return repeatedHeaders;
}

- (NSDictionary)uniqueHeaders
{
  [(AVAirMessageParts *)self _identifyUniqueAndRepeatedHeadersIfNecessary];
  uniqueHeaders = self->_uniqueHeaders;

  return uniqueHeaders;
}

- (void)_identifyUniqueAndRepeatedHeadersIfNecessary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_uniqueHeaders)
  {
    id v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = [(AVAirMessageParts *)self headers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v11 = [v10 key];
          v12 = [v11 lowercaseString];

          __int16 v13 = [(NSDictionary *)v3 objectForKeyedSubscript:v12];

          if (v13)
          {
            [(NSArray *)v4 addObject:v10];
          }
          else
          {
            __int16 v14 = [v10 value];
            [(NSDictionary *)v3 setObject:v14 forKeyedSubscript:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    uniqueHeaders = self->_uniqueHeaders;
    self->_uniqueHeaders = v3;
    uint64_t v16 = v3;

    repeatedHeaders = self->_repeatedHeaders;
    self->_repeatedHeaders = v4;
  }
}

- (void)_setIncomplete
{
  self->_isIncomplete = 1;
}

- (AVAirMessageParts)initWithVersion:(id)a3 headers:(id)a4 expectedBodyLength:(int64_t)a5 body:(id)a6 extra:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)AVAirMessageParts;
  uint64_t v16 = [(AVAirMessageParts *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    version = v16->_version;
    v16->_version = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    long long v20 = (void *)v19;
    if (v19) {
      long long v21 = (void *)v19;
    }
    else {
      long long v21 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v16->_headers, v21);

    uint64_t v22 = [v14 copy];
    rawBodyData = v16->_rawBodyData;
    v16->_rawBodyData = (NSData *)v22;

    uint64_t v24 = [v15 copy];
    extraData = v16->_extraData;
    v16->_extraData = (NSData *)v24;

    v16->_isIncomplete = v14 == 0;
    v16->_expectedBodyLength = a5;
  }

  return v16;
}

+ (id)messagePartsWithData:(id)a3 lineSeparator:(id)a4 data:(id)a5 headerBodySeparator:(id)a6 data:(id)a7 bodyLengthKey:(id)a8
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  unint64_t v18 = [v13 length];
  if (v18 >= 0x400) {
    uint64_t v19 = 1024;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = objc_msgSend(v13, "rangeOfData:options:range:", v15, 0, 0, v19);
  if (v21)
  {
    uint64_t v22 = v20;
    uint64_t v23 = v21;
    v57 = (objc_class *)a1;
    uint64_t v24 = objc_msgSend(v13, "subdataWithRange:", 0, v20);
    v58 = (void *)[[NSString alloc] initWithData:v24 encoding:4];
    if ([v58 length])
    {
      unint64_t v25 = objc_msgSend(v13, "rangeOfData:options:range:", v16, 0, v22, objc_msgSend(v13, "length") - v22);
      if (v26)
      {
        uint64_t v54 = v26;
        unint64_t v55 = v25;
        if (v25 <= v22 + v23)
        {
          objc_super v27 = 0;
        }
        else
        {
          objc_super v27 = objc_msgSend(v13, "subdataWithRange:", v22 + v23, v25 - (v22 + v23));
        }
        v29 = (void *)[[NSString alloc] initWithData:v27 encoding:4];
        if (v29 || ![v27 length])
        {
          v56 = v13;
          id v53 = v14;
          v30 = objc_msgSend(v29, "componentsSeparatedByString:", v14, v29, v27, v24, v16, v15);
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id obj = v30;
          uint64_t v32 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v61;
            uint64_t v35 = -1;
            do
            {
              for (uint64_t i = 0; i != v33; ++i)
              {
                if (*(void *)v61 != v34) {
                  objc_enumerationMutation(obj);
                }
                v37 = [[AVStringPair alloc] initWithString:*(void *)(*((void *)&v60 + 1) + 8 * i) separatedByString:@":"];
                [v31 addObject:v37];
                if ([(AVStringPair *)v37 keyEquals:v17])
                {
                  v38 = [(AVStringPair *)v37 value];
                  uint64_t v35 = [v38 integerValue];
                }
              }
              uint64_t v33 = [obj countByEnumeratingWithState:&v60 objects:v64 count:16];
            }
            while (v33);
          }
          else
          {
            uint64_t v35 = -1;
          }

          uint64_t v39 = v55 + v54;
          uint64_t v40 = [v56 length];
          uint64_t v41 = v40 - (v55 + v54);
          if (v35 >= 0) {
            uint64_t v42 = v35;
          }
          else {
            uint64_t v42 = v40 - v39;
          }
          if (v42 >= v41) {
            uint64_t v43 = v40 - v39;
          }
          else {
            uint64_t v43 = v42;
          }
          v44 = objc_msgSend(v56, "subdataWithRange:", v39, v43);
          if (v41 <= v42)
          {
            v45 = 0;
          }
          else
          {
            v45 = objc_msgSend(v56, "subdataWithRange:", v43 + v39, v41 - v43);
          }
          v46 = (void *)[[v57 alloc] initWithVersion:v58 headers:v31 expectedBodyLength:v35 body:v44 extra:v45];
          v28 = v46;
          id v14 = v53;
          if (v42 > v41) {
            [v46 _setIncomplete];
          }

          id v13 = v56;
          id v16 = v51;
          id v15 = v52;
          objc_super v27 = v49;
          uint64_t v24 = v50;
          v29 = v48;
        }
        else
        {
          v28 = 0;
        }
      }
      else
      {
        v28 = (void *)[objc_alloc((Class)a1) initWithVersion:v58 headers:0 expectedBodyLength:-1 body:0 extra:0];
      }
    }
    else
    {
      v28 = 0;
    }
  }
  else if ((unint64_t)[v13 length] <= 0x400)
  {
    v28 = (void *)[objc_alloc((Class)a1) initWithVersion:0 headers:0 expectedBodyLength:-1 body:0 extra:0];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)airMessage
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVAirMessageParts *)self _matchingClass];
  if (v3)
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      v5 = [(objc_class *)v4 messageWithParts:self];
      goto LABEL_10;
    }
    uint64_t v6 = _avairlog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = NSStringFromClass(v4);
      int v10 = 136315394;
      id v11 = "-[AVAirMessageParts(AVAirMessages) airMessage]";
      __int16 v12 = 2114;
      id v13 = v7;
      uint64_t v8 = "%s class %{public}@ does not implement messageWithParts:";
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = _avairlog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(AVAirMessageParts *)self version];
      int v10 = 136315394;
      id v11 = "-[AVAirMessageParts(AVAirMessages) airMessage]";
      __int16 v12 = 2114;
      id v13 = v7;
      uint64_t v8 = "%s no class registered for version '%{public}@'";
LABEL_8:
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }

  v5 = 0;
LABEL_10:

  return v5;
}

- (Class)_matchingClass
{
  v2 = [(AVAirMessageParts *)self version];
  if (v2)
  {
    id v3 = [(id)_registeredMessageClasses objectForKeyedSubscript:v2];
    id v4 = v3;
    if (v3)
    {
      v5 = NSClassFromString(v3);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

+ (void)registerClass:(Class)a3 forMessageVersion:(id)a4
{
  uint64_t v5 = registerClass_forMessageVersion__onceToken;
  id v6 = a4;
  if (v5 != -1) {
    dispatch_once(&registerClass_forMessageVersion__onceToken, &__block_literal_global_190);
  }
  NSStringFromClass(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_registeredMessageClasses setObject:v7 forKeyedSubscript:v6];
}

uint64_t __68__AVAirMessageParts_AVAirMessages__registerClass_forMessageVersion___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = _registeredMessageClasses;
  _registeredMessageClasses = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end