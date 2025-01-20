@interface CHStringOVSChecker
- (BOOL)isInappropriateLexiconEntry:(_LXEntry *)a3;
- (BOOL)isInappropriateString:(id)a3;
- (BOOL)isInappropriateTokenID:(unsigned int)a3;
- (CHStringOVSChecker)initWithTrie:(_CFBurstTrie *)a3 staticLexicon:(_LXLexicon *)a4 customLexicon:(_LXLexicon *)a5 flags:(unsigned int)a6 stringNormalizationFunction:(void *)a7;
- (void)dealloc;
@end

@implementation CHStringOVSChecker

- (CHStringOVSChecker)initWithTrie:(_CFBurstTrie *)a3 staticLexicon:(_LXLexicon *)a4 customLexicon:(_LXLexicon *)a5 flags:(unsigned int)a6 stringNormalizationFunction:(void *)a7
{
  v14.receiver = self;
  v14.super_class = (Class)CHStringOVSChecker;
  v12 = [(CHStringOVSChecker *)&v14 init];
  if (v12)
  {
    if (a3) {
      v12->_ovsTrie = (_CFBurstTrie *)CFBurstTrieRetain();
    }
    if (a4) {
      v12->_staticLexicon = (_LXLexicon *)CFRetain(a4);
    }
    if (a5) {
      v12->_customLexicon = (_LXLexicon *)CFRetain(a5);
    }
    v12->_flagsFilter = a6;
    v12->_stringNormalizationFunction = a7;
  }
  return v12;
}

- (BOOL)isInappropriateLexiconEntry:(_LXEntry *)a3
{
  return a3 && (self->_flagsFilter & LXEntryGetMetaFlags()) != 0;
}

- (BOOL)isInappropriateString:(id)a3
{
  id v4 = a3;
  if (self->_staticLexicon)
  {
    BOOL v5 = sub_1C4B57370((uint64_t)self, v4);
    BOOL v6 = v5;
    if (!self->_customLexicon) {
      goto LABEL_7;
    }
    BOOL v5 = 1;
  }
  else
  {
    BOOL v6 = 0;
    customLexicon = self->_customLexicon;
    BOOL v5 = customLexicon != 0;
    if (!customLexicon) {
      goto LABEL_7;
    }
  }
  if (!v6) {
    BOOL v5 = sub_1C4B57370((uint64_t)self, v4);
  }
LABEL_7:
  ovsTrie = self->_ovsTrie;
  if (ovsTrie) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v5;
  }
  if (ovsTrie && !v5)
  {
    id v10 = v4;
    v15 = v10;
    if (v10 && (objc_msgSend_isEqualToString_(v10, v11, (uint64_t)&stru_1F20141C8, v12, v13, v14) & 1) == 0)
    {
      objc_msgSend_lowercaseString(v15, v16, v17, v18, v19, v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      self;
      id v27 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      for (unint64_t i = 0; objc_msgSend_length(v21, v22, v23, v24, v25, v26) > i; ++i)
      {
        unsigned int v33 = objc_msgSend_characterAtIndex_(v21, v29, i, v30, v31, v32);
        v38 = objc_msgSend_stringWithFormat_(NSString, v34, @"%C", v35, v36, v37, (unsigned __int16)((v33 >> 1) | ((_WORD)v33 << 15)));
        objc_msgSend_appendString_(v27, v39, (uint64_t)v38, v40, v41, v42);
      }
      objc_msgSend_length(v15, v43, v44, v45, v46, v47);
      BOOL v9 = CFBurstTrieContains() != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)isInappropriateTokenID:(unsigned int)a3
{
  uint64_t v4 = LXLexiconCopyEntryForTokenID();
  if (v4
    && (BOOL v9 = (const void *)v4,
        char v10 = objc_msgSend_isInappropriateLexiconEntry_(self, v5, v4, v6, v7, v8),
        CFRelease(v9),
        (v10 & 1) != 0))
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v11 = LXLexiconCopyEntryForTokenID();
    if (v11)
    {
      v16 = (const void *)v11;
      char isInappropriateLexiconEntry = objc_msgSend_isInappropriateLexiconEntry_(self, v12, v11, v13, v14, v15);
      CFRelease(v16);
      LOBYTE(v11) = isInappropriateLexiconEntry;
    }
  }
  return v11;
}

- (void)dealloc
{
  if (self->_ovsTrie)
  {
    CFBurstTrieRelease();
    self->_ovsTrie = 0;
  }
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  customLexicon = self->_customLexicon;
  if (customLexicon)
  {
    CFRelease(customLexicon);
    self->_customLexicon = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CHStringOVSChecker;
  [(CHStringOVSChecker *)&v5 dealloc];
}

@end