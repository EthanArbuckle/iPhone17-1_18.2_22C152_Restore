@interface CPSearchMatcher
- (BOOL)matches:(id)a3;
- (BOOL)matches:(id)a3 matchType:(int)a4;
- (BOOL)matchesASCIIString:(const char *)a3 matchType:(int)a4;
- (BOOL)matchesUTF8String:(const char *)a3;
- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4;
- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4 matchOptions:(int)a5;
- (CPSearchMatcher)initWithSearchString:(id)a3;
- (CPSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4;
- (CPSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(int)a5;
- (CPSearchMatcher)initWithSearchString:(id)a3 options:(int)a4;
- (void)dealloc;
@end

@implementation CPSearchMatcher

- (BOOL)matchesASCIIString:(const char *)a3 matchType:(int)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v7 = [(NSData *)self->_wholeSearchStringData bytes];
  NSUInteger v8 = [(NSData *)self->_wholeSearchStringData length];
  if ((self->_options & 2) != 0) {
    v9 = (unsigned int (*)(const char *, const void *, NSUInteger))MEMORY[0x1E4F14A80];
  }
  else {
    v9 = (unsigned int (*)(const char *, const void *, NSUInteger))MEMORY[0x1E4F14A88];
  }
  v10 = (uint64_t (*)(const char *, uint64_t))MEMORY[0x1E4F14A70];
  if ((self->_options & 2) == 0) {
    v10 = (uint64_t (*)(const char *, uint64_t))MEMORY[0x1E4F14A90];
  }
  v40 = v10;
  v41 = v9;
  int v38 = a4;
  if (a4 == 4)
  {
    NSUInteger v11 = v8;
    if (strlen(a3) == v8)
    {
      LOBYTE(v12) = v41(a3, v7, v11) == 0;
      return v12;
    }
LABEL_48:
    LOBYTE(v12) = 0;
    return v12;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obj = self->_asciiComponents;
  uint64_t v39 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (!v39) {
    goto LABEL_48;
  }
  uint64_t v37 = *(void *)v55;
LABEL_11:
  uint64_t v13 = 0;
LABEL_12:
  if (*(void *)v55 != v37) {
    objc_enumerationMutation(obj);
  }
  v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
  uint64_t v15 = [v14 bytes];
  uint64_t v12 = v40(a3, v15);
  if (v12)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    uint64_t v16 = [v14 length];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v43 = __48__CPSearchMatcher_matchesASCIIString_matchType___block_invoke;
    v44 = &unk_1E56690E0;
    int v49 = v38;
    v47 = v41;
    uint64_t v48 = v15;
    v45 = &v50;
    uint64_t v46 = v16 - 1;
    char v58 = 0;
    if (!a3) {
      goto LABEL_44;
    }
    char v17 = *a3;
    if (!*a3) {
      goto LABEL_44;
    }
    uint64_t v18 = 0;
    int v19 = 1;
    v20 = a3;
    v21 = a3;
    char v22 = 1;
    while (1)
    {
      __darwin_ct_rune_t v23 = v17;
      if (v17 < 0)
      {
        BOOL v25 = __maskrune(v17, 0x8000uLL) == 0;
        int v26 = __maskrune(v23, 0x1000uLL) != 0;
        if (__maskrune(v23, 0x4000uLL))
        {
LABEL_22:
          int v28 = v19 & !v25;
          goto LABEL_25;
        }
        int v27 = __maskrune(v23, 0x2000uLL);
      }
      else
      {
        unsigned int v24 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v17 + 60);
        BOOL v25 = (v24 & 0x8000) == 0;
        int v26 = (v24 >> 12) & 1;
        if ((v24 & 0x4000) != 0) {
          goto LABEL_22;
        }
        int v27 = v24 & 0x2000;
      }
      int v28 = v19 & !v25;
      if (!v27)
      {
        int v29 = 0;
        int v30 = 1;
        int v19 = v26;
        goto LABEL_26;
      }
LABEL_25:
      int v29 = 1;
      int v19 = v26;
      int v30 = v28;
LABEL_26:
      if (v22) {
        int v31 = v30;
      }
      else {
        int v31 = v28;
      }
      if ((v22 & 1) == 0) {
        v28 |= v29;
      }
      if (v28 == 1 && v18 != 0)
      {
        v43((uint64_t)v42, v18, (unint64_t)&v21[-v18], &v58);
        if (v58) {
          goto LABEL_44;
        }
        uint64_t v18 = 0;
      }
      if (v31) {
        uint64_t v18 = (uint64_t)v20;
      }
      int v33 = *(unsigned __int8 *)++v20;
      char v17 = v33;
      ++v21;
      char v22 = v29;
      if (!v33)
      {
        if (v18) {
          v43((uint64_t)v42, v18, (unint64_t)&v21[-v18], &v58);
        }
LABEL_44:
        int v34 = *((unsigned __int8 *)v51 + 24);
        _Block_object_dispose(&v50, 8);
        if (!v34) {
          goto LABEL_48;
        }
        if (++v13 == v39)
        {
          uint64_t v39 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
          LOBYTE(v12) = 1;
          if (!v39) {
            return v12;
          }
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
  }
  return v12;
}

uint64_t __48__CPSearchMatcher_matchesASCIIString_matchType___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(result + 40);
  if (*(_DWORD *)(result + 64) == 6)
  {
    if (v6 != a3) {
      return result;
    }
  }
  else if (v6 > a3)
  {
    return result;
  }
  result = (*(uint64_t (**)(uint64_t, void))(result + 48))(a2, *(void *)(result + 56));
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)matchesUTF8String:(const char *)a3
{
  return [(CPSearchMatcher *)self matchesUTF8String:a3 matchType:5 matchOptions:1];
}

- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4 matchOptions:(int)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((a4 & 0xFFFFFFFD) == 4 || a4 == 5) {
    int v9 = a4;
  }
  else {
    int v9 = 5;
  }
  if (!a3 || !self->_asciiComponents) {
    goto LABEL_14;
  }
  char v10 = 0;
  NSUInteger v11 = a3;
  do
  {
    int v13 = *v11++;
    int v12 = v13;
    if (!(_BYTE)v13) {
      char v10 = 1;
    }
  }
  while (v12 > 0);
  if ((v10 & 1) == 0)
  {
LABEL_14:
    if (v9 == 4)
    {
      int v14 = [(NSData *)self->_wholeSearchStringData length];
      wholeSearchStringData = self->_wholeSearchStringData;
      if (wholeSearchStringData)
      {
        uint64_t v16 = [(NSData *)wholeSearchStringData bytes];
        char v17 = [(NSData *)self->_context bytes];
        return _ICUSQLiteMatch(a3, v16, v14, 4, (uint64_t)v17);
      }
      return 0;
    }
    else
    {
      BOOL v19 = [(NSArray *)self->_components count] != 0;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      components = self->_components;
      uint64_t v21 = [(NSArray *)components countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(components);
            }
            unsigned int v25 = _ICUSQLiteMatch(a3, (char *)[*(id *)(*((void *)&v26 + 1) + 8 * i) bytes], objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "length"), v9, (uint64_t)-[NSData bytes](self->_context, "bytes"));
            BOOL v19 = v25;
            if (a5)
            {
              if (!v25) {
                return a5 == 0;
              }
            }
            else if (v25)
            {
              return a5 == 0;
            }
          }
          uint64_t v22 = [(NSArray *)components countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
    }
    return v19;
  }
  return -[CPSearchMatcher matchesASCIIString:matchType:](self, "matchesASCIIString:matchType:");
}

- (BOOL)matchesUTF8String:(const char *)a3 matchType:(int)a4
{
  return [(CPSearchMatcher *)self matchesUTF8String:a3 matchType:*(void *)&a4 matchOptions:1];
}

- (BOOL)matches:(id)a3
{
  uint64_t v4 = [a3 UTF8String];
  return [(CPSearchMatcher *)self matchesUTF8String:v4];
}

- (BOOL)matches:(id)a3 matchType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 UTF8String];
  return [(CPSearchMatcher *)self matchesUTF8String:v6 matchType:v4];
}

- (CPSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4 andOptions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CPSearchMatcher;
  NSUInteger v8 = [(CPSearchMatcher *)&v21 init];
  int v9 = v8;
  if (v8)
  {
    v8->_options = v5;
    v8->_components = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9->_wholeSearchStringData = (NSData *)(id)[a3 dataUsingEncoding:4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    char v10 = objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet", 0));
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          -[NSArray addObject:](v9->_components, "addObject:", [*(id *)(*((void *)&v17 + 1) + 8 * i) dataUsingEncoding:4]);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
    inited = (const void *)initICUSearchContext([a4 UTF8String], v5);
    v9->_context = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:inited length:malloc_size(inited) freeWhenDone:0];
  }
  return v9;
}

- (CPSearchMatcher)initWithSearchString:(id)a3
{
  return [(CPSearchMatcher *)self initWithSearchString:a3 andLocale:0 andOptions:3];
}

- (CPSearchMatcher)initWithSearchString:(id)a3 andLocale:(id)a4
{
  return [(CPSearchMatcher *)self initWithSearchString:a3 andLocale:a4 andOptions:3];
}

- (CPSearchMatcher)initWithSearchString:(id)a3 options:(int)a4
{
  return [(CPSearchMatcher *)self initWithSearchString:a3 andLocale:0 andOptions:*(void *)&a4];
}

- (void)dealloc
{
  freeICUSearchContext([(NSData *)self->_context bytes]);

  v3.receiver = self;
  v3.super_class = (Class)CPSearchMatcher;
  [(CPSearchMatcher *)&v3 dealloc];
}

@end