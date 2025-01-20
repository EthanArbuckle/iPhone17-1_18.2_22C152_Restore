@interface LPURLSuffixChecker
- (BOOL)hasSuffix:(id)a3;
- (BOOL)hasSuffix:(id)a3 remainingPrefix:(id *)a4;
- (BOOL)insertString:(id)a3 intoTrieWithCache:(id *)a4;
- (LPURLSuffixChecker)initWithSuffixes:(id)a3;
- (void)addStringToFailedSuffixes:(id)a3;
- (void)dealloc;
@end

@implementation LPURLSuffixChecker

- (BOOL)insertString:(id)a3 intoTrieWithCache:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  unint64_t Length = CFStringGetLength(v6);
  if (Length > 0x20) {
    goto LABEL_34;
  }
  CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  if (CStringPtr) {
    goto LABEL_5;
  }
  if (!CFStringGetCString(v6, buffer, 32, 0x600u))
  {
LABEL_34:
    BOOL v30 = 0;
    goto LABEL_35;
  }
  CStringPtr = buffer;
LABEL_5:
  maxunint64_t Length = self->_maxLength;
  if (maxLength <= Length) {
    maxunint64_t Length = Length;
  }
  self->_maxunint64_t Length = maxLength;
  if (*CStringPtr != 46) {
    goto LABEL_34;
  }
  unint64_t var1 = a4->var1;
  if (Length >= var1) {
    unint64_t v11 = a4->var1;
  }
  else {
    unint64_t v11 = Length;
  }
  if (v11 >= 2)
  {
    v12 = &a4->var0[1];
    unint64_t v13 = 1;
    do
    {
      int v14 = (char)CStringPtr[v13];
      int v15 = (v14 | 0x20) - 96;
      if ((v14 | 0x20u) - 123 < 0xFFFFFFE6) {
        int v15 = -1;
      }
      if (v14 == 46) {
        int v16 = 0;
      }
      else {
        int v16 = v15;
      }
      if (v16 != v12->var0)
      {
        a4->unint64_t var1 = v13;
        unint64_t var1 = v13;
      }
      ++v13;
      if (Length >= var1) {
        unint64_t v17 = var1;
      }
      else {
        unint64_t v17 = Length;
      }
      ++v12;
    }
    while (v13 < v17);
  }
  unint64_t v18 = var1 - 1;
  trie = self->_trie;
  a4->unint64_t var1 = Length;
  unint64_t v20 = Length - 1;
  if (Length - 1 <= var1 - 1)
  {
    v22 = trie;
  }
  else
  {
    p_unint64_t var1 = &a4->var0[Length - 1].var1;
    v22 = trie;
    do
    {
      int v23 = (char)CStringPtr[v20];
      if (v23 == 46)
      {
        unsigned int v24 = 0;
      }
      else
      {
        int v25 = v23 | 0x20;
        if ((v25 - 123) < 0xFFFFFFE6) {
          goto LABEL_34;
        }
        unsigned int v24 = v25 - 96;
      }
      unsigned int trieNodeCount = v22->var0[v24];
      unsigned __int16 v27 = v24;
      if (!v22->var0[v24])
      {
        unsigned int trieNodeCount = self->_trieNodeCount;
        self->_unsigned int trieNodeCount = trieNodeCount + 1;
        v22->var0[v24] = trieNodeCount;
        v28 = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_realloc(trie, 54 * (trieNodeCount + 1), 0x10000409C08D13AuLL);
        self->_trie = v28;
        v29 = &v28[trieNodeCount];
        *(void *)&v29->var0[23] = 0;
        *(_OWORD *)&v29->var0[8] = 0u;
        *(_OWORD *)&v29->var0[16] = 0u;
        *(_OWORD *)v29->var0 = 0u;
        trie = self->_trie;
      }
      *(p_var1 - 1) = v27;
      *p_unint64_t var1 = trieNodeCount;
      p_var1 -= 2;
      v22 = &trie[trieNodeCount];
      --v20;
    }
    while (v20 > v18);
  }
  int v32 = (char)CStringPtr[v18];
  LODWORD(v33) = (v32 | 0x20) - 96;
  if ((v32 | 0x20u) - 123 < 0xFFFFFFE6) {
    uint64_t v33 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v33 = v33;
  }
  if (v32 == 46) {
    uint64_t v34 = 0;
  }
  else {
    uint64_t v34 = v33;
  }
  v22->var0[v34] = a4->var0[v18].var1;
  BOOL v30 = 1;
LABEL_35:

  return v30;
}

- (void)addStringToFailedSuffixes:(id)a3
{
  id v4 = a3;
  failedSuffixes = self->_failedSuffixes;
  id v9 = v4;
  if (!failedSuffixes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_failedSuffixes;
    self->_failedSuffixes = v6;

    failedSuffixes = self->_failedSuffixes;
    id v4 = v9;
  }
  v8 = [v4 substringFromIndex:1];
  [(NSMutableArray *)failedSuffixes addObject:v8];
}

- (LPURLSuffixChecker)initWithSuffixes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)LPURLSuffixChecker;
  v5 = [(LPURLSuffixChecker *)&v19 init];
  if (v5)
  {
    v5->_trie = ($BB8B2815F19B946069E0C78052E8954D *)malloc_type_calloc(0x36uLL, 2uLL, 0xF464328uLL);
    v5->_unsigned int trieNodeCount = 2;
    memset(v17, 0, sizeof(v17));
    WORD1(v17[0]) = 1;
    uint64_t v18 = 1;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (!-[LPURLSuffixChecker insertString:intoTrieWithCache:](v5, "insertString:intoTrieWithCache:", v10, v17, (void)v13))[(LPURLSuffixChecker *)v5 addStringToFailedSuffixes:v10]; {
        }
          }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v20 count:16];
      }
      while (v7);
    }

    unint64_t v11 = v5;
  }

  return v5;
}

- (BOOL)hasSuffix:(id)a3
{
  return [(LPURLSuffixChecker *)self hasSuffix:a3 remainingPrefix:0];
}

- (BOOL)hasSuffix:(id)a3 remainingPrefix:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  CFStringRef v6 = (const __CFString *)a3;
  uint64_t v7 = (__CFString *)v6;
  if (!v6) {
    goto LABEL_34;
  }
  unint64_t Length = CFStringGetLength(v6);
  CStringPtr = (char *)CFStringGetCStringPtr(v7, 0x600u);
  if (CStringPtr) {
    goto LABEL_5;
  }
  if (CFStringGetCString(v7, buffer, 32, 0x600u))
  {
    CStringPtr = buffer;
LABEL_5:
    if (Length >= self->_maxLength) {
      maxunint64_t Length = self->_maxLength;
    }
    else {
      maxunint64_t Length = Length;
    }
    if (maxLength)
    {
      trie = self->_trie;
      while (1)
      {
        int v12 = CStringPtr[Length - 1];
        if (v12 == 46)
        {
          int v13 = 0;
        }
        else
        {
          int v14 = v12 | 0x20;
          if ((v14 - 123) < 0xFFFFFFE6) {
            goto LABEL_22;
          }
          int v13 = v14 - 96;
        }
        int v15 = trie->var0[v13];
        if (!v15) {
          goto LABEL_22;
        }
        if (v15 == 1) {
          break;
        }
        trie = &self->_trie[v15];
        --Length;
        if (!--maxLength) {
          goto LABEL_19;
        }
      }
      if (a4)
      {
        *a4 = [(__CFString *)v7 substringToIndex:Length];
      }
LABEL_43:
      BOOL v23 = 1;
      goto LABEL_44;
    }
    trie = self->_trie;
LABEL_19:
    if (trie->var0[0] == 1)
    {
      if (a4) {
        *a4 = 0;
      }
      goto LABEL_43;
    }
  }
LABEL_22:
  failedSuffixes = self->_failedSuffixes;
  if (!failedSuffixes) {
    goto LABEL_34;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v17 = failedSuffixes;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v18) {
    goto LABEL_33;
  }
  uint64_t v19 = *(void *)v27;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v27 != v19) {
        objc_enumerationMutation(v17);
      }
      uint64_t v21 = -[__CFString rangeOfString:options:](v7, "rangeOfString:options:", *(void *)(*((void *)&v26 + 1) + 8 * i), 15, (void)v26);
      uint64_t v22 = v21;
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v21)
        {
          if ([(__CFString *)v7 characterAtIndex:v21 - 1] != 46) {
            continue;
          }
          if (a4)
          {
            id v24 = [(__CFString *)v7 substringToIndex:v22];
            goto LABEL_41;
          }
        }
        else if (a4)
        {
          id v24 = 0;
LABEL_41:
          *a4 = v24;
        }

        goto LABEL_43;
      }
    }
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_33:

LABEL_34:
  BOOL v23 = 0;
LABEL_44:

  return v23;
}

- (void)dealloc
{
  free(self->_trie);
  v3.receiver = self;
  v3.super_class = (Class)LPURLSuffixChecker;
  [(LPURLSuffixChecker *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end