@interface NLContextualEmbeddingResult
- (NLContextualEmbeddingResult)initWithString:(id)a3 tokenDictionaries:(id)a4 data:(id)a5 language:(id)a6 tokenVectorDimension:(unint64_t)a7;
- (NLLanguage)language;
- (NSArray)tokenVectorAtIndex:(NSUInteger)characterIndex tokenRange:(NSRangePointer)tokenRange;
- (NSString)string;
- (NSUInteger)sequenceLength;
- (id)_tokenVectorAtIndex:(unint64_t)a3;
- (id)sentenceVector;
- (id)sentenceVectorData;
- (id)tokenDictionaries;
- (id)tokenVectorData;
- (void)enumerateTokenVectorsInRange:(NSRange)range usingBlock:(void *)block;
@end

@implementation NLContextualEmbeddingResult

- (NLContextualEmbeddingResult)initWithString:(id)a3 tokenDictionaries:(id)a4 data:(id)a5 language:(id)a6 tokenVectorDimension:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)NLContextualEmbeddingResult;
  v16 = [(NLContextualEmbeddingResult *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    string = v16->_string;
    v16->_string = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    tokenDictionaries = v16->_tokenDictionaries;
    v16->_tokenDictionaries = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    data = v16->_data;
    v16->_data = (NSData *)v21;

    uint64_t v23 = [v15 copy];
    language = v16->_language;
    v16->_language = (NSString *)v23;

    v16->_tokenVectorDimension = a7;
  }

  return v16;
}

- (NSString)string
{
  return self->_string;
}

- (NLLanguage)language
{
  return self->_language;
}

- (NSUInteger)sequenceLength
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_tokenDictionaries;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    NSUInteger v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "objectForKey:", @"SubtokenRanges", (void)v11);
        v9 = v8;
        if (v8) {
          v5 += [v8 count];
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return v5;
}

- (id)sentenceVector
{
  return 0;
}

- (id)sentenceVectorData
{
  return 0;
}

- (id)_tokenVectorAtIndex:(unint64_t)a3
{
  NSUInteger v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(NSData *)self->_data bytes];
  unint64_t tokenVectorDimension = self->_tokenVectorDimension;
  if (tokenVectorDimension)
  {
    v9 = v6;
    for (unint64_t i = 0; i < tokenVectorDimension; ++i)
    {
      LODWORD(v7) = v9[i + tokenVectorDimension * a3];
      long long v11 = [NSNumber numberWithFloat:v7];
      [v5 addObject:v11];

      unint64_t tokenVectorDimension = self->_tokenVectorDimension;
    }
  }

  return v5;
}

- (NSArray)tokenVectorAtIndex:(NSUInteger)characterIndex tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_tokenDictionaries;
  NSUInteger v23 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v28)
  {
    v22 = tokenRange;
    uint64_t v6 = 0;
    NSUInteger v25 = 0;
    v29 = 0;
    uint64_t v27 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(obj);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "objectForKey:", @"SubtokenRanges", v22);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v31;
LABEL_8:
          uint64_t v13 = 0;
          uint64_t v14 = v6 + v11;
          while (1)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            NSUInteger v15 = [*(id *)(*((void *)&v30 + 1) + 8 * v13) rangeValue];
            if (v15 <= characterIndex && v15 + v16 > characterIndex) {
              break;
            }
            if (v11 == ++v13)
            {
              uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
              uint64_t v6 = v14;
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_21;
            }
          }
          NSUInteger v18 = v15;
          NSUInteger v19 = v16;
          v6 += v13;
          v20 = [(NLContextualEmbeddingResult *)self _tokenVectorAtIndex:v6];

          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v29 = v20;
            NSUInteger v25 = v19;
            continue;
          }
          NSUInteger v23 = v18;
          goto LABEL_26;
        }
        uint64_t v14 = v6;
LABEL_21:

        uint64_t v6 = v14;
      }
      uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v28) {
        continue;
      }
      break;
    }
    NSUInteger v23 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v19 = v25;
    v20 = v29;
LABEL_26:
    tokenRange = v22;
  }
  else
  {
    NSUInteger v19 = 0;
    v20 = 0;
  }

  if (tokenRange)
  {
    tokenRange->location = v23;
    tokenRange->length = v19;
  }

  return (NSArray *)v20;
}

- (id)tokenVectorData
{
  return self->_data;
}

- (id)tokenDictionaries
{
  return self->_tokenDictionaries;
}

- (void)enumerateTokenVectorsInRange:(NSRange)range usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v37 = block;
  unsigned __int8 v48 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obj = self->_tokenDictionaries;
  uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v34)
  {
    uint64_t v6 = 0;
    uint64_t v33 = *(void *)v45;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v45 != v33) {
        objc_enumerationMutation(obj);
      }
      v8 = *(void **)(*((void *)&v44 + 1) + 8 * v7);
      id v9 = [v8 objectForKey:@"TokenRange"];
      unint64_t v10 = [v9 rangeValue];
      uint64_t v12 = v11;

      uint64_t v13 = [v8 objectForKey:@"SubtokenRanges"];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v39 = v13;
      uint64_t v14 = [v39 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v35 = v7;
        uint64_t v16 = *(void *)v41;
        while (2)
        {
          uint64_t v17 = 0;
          uint64_t v38 = v15;
          do
          {
            uint64_t v18 = v17;
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v39);
            }
            unint64_t v19 = [*(id *)(*((void *)&v40 + 1) + 8 * v17) rangeValue];
            uint64_t v21 = v20;
            if (rangesMatch(location, length, v10, v12)
              && rangesMatch(location, length, v19, v21))
            {
              [(NLContextualEmbeddingResult *)self _tokenVectorAtIndex:v6 + v18];
              uint64_t v22 = v16;
              uint64_t v23 = v12;
              unint64_t v24 = v10;
              NSUInteger v25 = location;
              NSUInteger v26 = length;
              v28 = uint64_t v27 = v6;
              v37[2](v37, v28, v19, v21, &v48);

              uint64_t v6 = v27;
              NSUInteger length = v26;
              NSUInteger location = v25;
              unint64_t v10 = v24;
              uint64_t v12 = v23;
              uint64_t v16 = v22;
              uint64_t v15 = v38;
            }
            if (v48)
            {
              uint64_t v30 = v6 + v18;
              goto LABEL_19;
            }
            uint64_t v17 = v18 + 1;
          }
          while (v15 != v18 + 1);
          uint64_t v15 = [v39 countByEnumeratingWithState:&v40 objects:v49 count:16];
          uint64_t v29 = v6;
          v6 += v17;
          if (v15) {
            continue;
          }
          break;
        }
        uint64_t v30 = v29 + v18;
LABEL_19:
        uint64_t v6 = v30 + 1;
        uint64_t v7 = v35;
      }

      int v31 = v48;
      if (v31) {
        break;
      }
      if (++v7 == v34)
      {
        uint64_t v34 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v34) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tokenDictionaries, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end