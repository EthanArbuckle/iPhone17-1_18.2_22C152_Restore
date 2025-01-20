@interface NLNLPLanguageModelNode
+ (id)conditionalProbabilitiesForStrings:(id)a3 modelState:(void *)a4 copyRequired:(BOOL)a5;
- (BOOL)isLeaf;
- (NLNLPLanguageModelNode)initWithTokenIDs:(id)a3;
- (id)_treeDescriptionWithPrefix:(id)a3;
- (id)description;
- (id)treeDescription;
- (void)_addString:(id)a3 tokenIDs:(id)a4;
- (void)_evaluateChildrenWithModelState:(void *)a3 copyRequired:(BOOL)a4 probability:(double)a5 dictionary:(id)a6;
- (void)_setProbability:(double)a3 dictionary:(id)a4;
@end

@implementation NLNLPLanguageModelNode

- (NLNLPLanguageModelNode)initWithTokenIDs:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLNLPLanguageModelNode;
  v5 = [(NLNLPLanguageModelNode *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    strings = v5->_strings;
    v5->_strings = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    children = v5->_children;
    v5->_children = (NSMutableDictionary *)v10;
  }
  return v5;
}

- (BOOL)isLeaf
{
  return [(NSMutableDictionary *)self->_children count] == 0;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)NLNLPLanguageModelNode;
  id v4 = [(NLNLPLanguageModelNode *)&v10 description];
  v5 = [(NSArray *)self->_tokenIDs componentsJoinedByString:@"-"];
  uint64_t v6 = [v3 stringWithFormat:@"%@ <%@>", v4, v5];

  if ([(NSMutableSet *)self->_strings count])
  {
    v7 = [(NSMutableSet *)self->_strings allObjects];
    uint64_t v8 = [v7 componentsJoinedByString:@"/"];
    [v6 appendFormat:@" <%@>", v8];
  }

  return v6;
}

- (id)_treeDescriptionWithPrefix:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v6 = [(NLNLPLanguageModelNode *)self description];
  v7 = [v5 stringWithFormat:@"%@%@", v4, v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_children;
  uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [(NSMutableDictionary *)self->_children objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        objc_super v13 = [v4 stringByAppendingString:@"  "];
        v14 = [v12 _treeDescriptionWithPrefix:v13];
        [v7 appendFormat:@"\n%@", v14];
      }
      uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)treeDescription
{
  return [(NLNLPLanguageModelNode *)self _treeDescriptionWithPrefix:&stru_1EFB303D0];
}

- (void)_addString:(id)a3 tokenIDs:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v7 = [v6 firstObject];
    uint64_t v8 = [(NSMutableDictionary *)self->_children objectForKey:v7];
    if (!v8)
    {
      uint64_t v9 = [NLNLPLanguageModelNode alloc];
      uint64_t v10 = [(NSArray *)self->_tokenIDs arrayByAddingObject:v7];
      uint64_t v8 = [(NLNLPLanguageModelNode *)v9 initWithTokenIDs:v10];

      [(NSMutableDictionary *)self->_children setObject:v8 forKey:v7];
    }
    v11 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    [(NLNLPLanguageModelNode *)v8 _addString:v12 tokenIDs:v11];
  }
  else
  {
    [(NSMutableSet *)self->_strings addObject:v12];
  }
}

- (void)_setProbability:(double)a3 dictionary:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_strings;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        objc_super v13 = [NLProbabilityInfo alloc];
        v14 = -[NLProbabilityInfo initWithProbability:flags:](v13, "initWithProbability:flags:", 0, a3, (void)v15);
        [v6 setObject:v14 forKey:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_evaluateChildrenWithModelState:(void *)a3 copyRequired:(BOOL)a4 probability:(double)a5 dictionary:(id)a6
{
  BOOL v31 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = [(NSMutableDictionary *)self->_children allKeys];
  uint64_t v11 = [v10 count];
  v33 = a3;
  CFArrayRef v12 = (const __CFArray *)CoreLMCopyConditionalProbabilities();
  if (v12)
  {
    CFArrayRef v13 = v12;
    v29 = v10;
    if (v11 == CFArrayGetCount(v12))
    {
      uint64_t v30 = v11;
      id v32 = v9;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v10;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        unint64_t v17 = 0;
        uint64_t v18 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = -[NSMutableDictionary objectForKey:](self->_children, "objectForKey:", *(void *)(*((void *)&v35 + 1) + 8 * i), v29);
            v17 += [v20 isLeaf] ^ 1;
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v16);
      }
      else
      {
        unint64_t v17 = 0;
      }

      id v9 = v32;
      uint64_t v21 = v30;
      if (v30)
      {
        CFIndex v22 = 0;
        uint64_t v23 = 0;
        do
        {
          v24 = objc_msgSend(v14, "objectAtIndex:", v22, v29);
          v25 = [(NSMutableDictionary *)self->_children objectForKey:v24];
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v13, v22);
          double valuePtr = 0.0;
          if (CFNumberGetValue(ValueAtIndex, kCFNumberDoubleType, &valuePtr))
          {
            [v25 _setProbability:v9 dictionary:valuePtr * a5];
            if (([v25 isLeaf] & 1) == 0)
            {
              int v27 = ++v23 < v17 || v31;
              v28 = v33;
              if (v27 == 1) {
                v28 = (const void *)CoreLMCreateCopy();
              }
              if (v28)
              {
                v39 = v24;
                [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
                if (CoreLMUpdateWithContext()) {
                  [v25 _evaluateChildrenWithModelState:v28 copyRequired:0 probability:v32 dictionary:valuePtr * a5];
                }
                if (v27) {
                  CFRelease(v28);
                }
              }
              id v9 = v32;
              uint64_t v21 = v30;
            }
          }

          ++v22;
        }
        while (v21 != v22);
      }
    }
    CFRelease(v13);
    uint64_t v10 = v29;
  }
}

+ (id)conditionalProbabilitiesForStrings:(id)a3 modelState:(void *)a4 copyRequired:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a4)
  {
    BOOL v26 = v5;
    uint64_t v10 = [NLNLPLanguageModelNode alloc];
    uint64_t v11 = [(NLNLPLanguageModelNode *)v10 initWithTokenIDs:MEMORY[0x1E4F1CBF0]];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v18 = (void *)CoreLMCopyTokenIdsForText();
          [(NLNLPLanguageModelNode *)v11 _addString:v17 tokenIDs:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v14);
    }

    [(NLNLPLanguageModelNode *)v11 _setProbability:v9 dictionary:1.0];
    if (![(NLNLPLanguageModelNode *)v11 isLeaf]) {
      [(NLNLPLanguageModelNode *)v11 _evaluateChildrenWithModelState:a4 copyRequired:v26 probability:v9 dictionary:1.0];
    }

    id v7 = v27;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v7;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = [v9 objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        if (!v24) {
          v24 = [[NLProbabilityInfo alloc] initWithInvalidProbability];
        }
        [v8 addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_strings, 0);

  objc_storeStrong((id *)&self->_tokenIDs, 0);
}

@end