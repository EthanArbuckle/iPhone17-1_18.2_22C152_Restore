@interface CalculateTokenizer
+ (NSSet)functionSet;
+ (NSSet)laTeXFunctionSet;
+ (NSSet)laTeXTrigonometricSet;
+ (NSSet)trigonometricSet;
+ (id)nonWhitespaceLanguageSet;
+ (id)prepareString:(id)a3;
+ (id)punctuationSet;
+ (id)symbolSet;
+ (id)symbolsTrie;
+ (id)tokenizerWithUnits:(id)a3;
+ (int)displayNameExponent:(id)a3;
+ (void)addSymbols:(id)a3;
+ (void)addUnits:(id)a3 builtIn:(BOOL)a4;
+ (void)loadPunctuationSet;
+ (void)loadSymbolSet;
- ($0F7EB6B36CDCC9CA6BC7BE76F6527CA8)singleLetterVariables;
- (BOOL)_isGraphableReserved;
- (BOOL)decimalSeparatorSpace;
- (BOOL)findDeclaredVariables;
- (BOOL)foundGraphableValue;
- (BOOL)foundGraphableVariable;
- (BOOL)groupingSeparatorSpace;
- (BOOL)isGraphable;
- (BOOL)isLaTeX;
- (BOOL)needsUpdate;
- (BOOL)normalizeNumbers;
- (CalculateToken)lastToken;
- (CalculateToken)prevToken;
- (CalculateToken)prevToken2;
- (CalculateTokenizer)init;
- (CalculateTokenizer)initWithUnits:(id)a3;
- (NSArray)locales;
- (NSDictionary)variables;
- (NSMutableArray)peekTokens;
- (NSMutableArray)wordBreakIndices;
- (NSMutableCharacterSet)localizedDecimalSet;
- (NSMutableCharacterSet)localizedGroupingSet;
- (NSMutableSet)lowercasedVariables;
- (NSNumberFormatter)numberFormatter;
- (NSSet)declaredVariables;
- (NSString)currencyDecimalSeparator;
- (NSString)currencyGroupingSeparator;
- (NSString)decimalSeparator;
- (NSString)declaredVariable;
- (NSString)graphableVariable;
- (NSString)groupingSeparator;
- (NSString)string;
- (NSString)suggestedGraphableVariable;
- (Trie)trie;
- (UnitsInfo)unitsInfo;
- (_NSRange)range;
- (id)nextToken;
- (id)peekNonWhitespaceToken;
- (id)peekToken;
- (id)peekTokenAtOffset:(int64_t)a3;
- (int)prevTokenCount;
- (unint64_t)graphableVariableLength;
- (unint64_t)index;
- (unint64_t)peekIndex;
- (unint64_t)startIndex;
- (unint64_t)stringLength;
- (unint64_t)variableBufferLength;
- (unint64_t)wordBreakIndicesIndex;
- (unsigned)variableBuffer;
- (void)_findNextToken;
- (void)_loadIfNeeded;
- (void)addDeclaredVariable:(id)a3;
- (void)addVariable:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setCurrencyDecimalSeparator:(id)a3;
- (void)setCurrencyGroupingSeparator:(id)a3;
- (void)setDecimalSeparator:(id)a3;
- (void)setDecimalSeparatorSpace:(BOOL)a3;
- (void)setFindDeclaredVariables:(BOOL)a3;
- (void)setFoundGraphableVariable:(BOOL)a3;
- (void)setGraphableVariable:(id)a3;
- (void)setGraphableVariableLength:(unint64_t)a3;
- (void)setGroupingSeparator:(id)a3;
- (void)setGroupingSeparatorSpace:(BOOL)a3;
- (void)setIsLaTeX:(BOOL)a3;
- (void)setLastToken:(id)a3;
- (void)setLocales:(id)a3;
- (void)setLocalizedDecimalSet:(id)a3;
- (void)setLocalizedGroupingSet:(id)a3;
- (void)setLowercasedVariables:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setNormalizeNumbers:(BOOL)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setPeekIndex:(unint64_t)a3;
- (void)setPeekTokens:(id)a3;
- (void)setPrevToken2:(id)a3;
- (void)setPrevToken:(id)a3;
- (void)setPrevTokenCount:(int)a3;
- (void)setRange:(_NSRange)a3;
- (void)setSingleLetterVariables:(id *)a3;
- (void)setStartIndex:(unint64_t)a3;
- (void)setString:(id)a3;
- (void)setStringLength:(unint64_t)a3;
- (void)setTrie:(id)a3;
- (void)setUnitsInfo:(id)a3;
- (void)setVariableBuffer:(unsigned __int16 *)a3;
- (void)setVariableBufferLength:(unint64_t)a3;
- (void)setVariables:(id)a3;
- (void)setWordBreakIndices:(id)a3;
- (void)setWordBreakIndicesIndex:(unint64_t)a3;
- (void)update;
@end

@implementation CalculateTokenizer

uint64_t __33__CalculateTokenizer_symbolsTrie__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)symbolsTrie_symbolsTrie;
  symbolsTrie_symbolsTrie = v0;

  uint64_t v2 = symbolsTrie_symbolsTrie;
  return +[CalculateTokenizer addSymbols:v2];
}

id __36__CalculateTokenizer__findNextToken__block_invoke_7(uint64_t a1, void *a2, unint64_t a3)
{
  id result = (id)[a2 isEqualToString:@","];
  if (result)
  {
    if (a3 > [*(id *)(a1 + 32) peekIndex]) {
      id v6 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return result;
}

uint64_t __36__CalculateTokenizer__findNextToken__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 rangeOfCharacterFromSet:whitespaceSet];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    *a5 = 1;
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3 + a4;
  }
  return result;
}

void __36__CalculateTokenizer__findNextToken__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  v10 = v9;
  if (*(_DWORD *)(a1 + 96) == 1)
  {
    v11 = [v9 stringByApplyingTransform:*MEMORY[0x1E4F1C4D8] reverse:0];
    v12 = [v11 lowercaseString];

    v10 = +[CalculateTokenizer prepareString:v12];
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v15 = *(void *)(v13 + 40);
  v14 = (id *)(v13 + 40);
  if (!v15) {
    objc_storeStrong(v14, v10);
  }
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v35 = v10;
  if (!v16)
  {

    goto LABEL_27;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v16 + 16));
  id v18 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 8))
  {
    id v19 = objc_loadWeakRetained((id *)(v16 + 16));
    char v20 = [v19 compressed];

    if (v20) {
      goto LABEL_11;
    }
    id v18 = objc_loadWeakRetained((id *)(v16 + 16));
    -[Trie compress]((void **)v18);
  }

LABEL_11:
  char v21 = -[TrieNode visit:create:](v16, v35, 0);

  if ((v21 & 1) == 0)
  {
LABEL_27:
    *a5 = 1;
    goto LABEL_28;
  }
  unint64_t v22 = a3 + a4;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 12)
    && v22 == *(void *)(a1 + 88) + 2
    && [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"\\"]&& objc_msgSend(v35, "isEqualToString:", @" ""))
  {
    uint64_t v23 = -[TrieNode object](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v22;
  }
  if (v22 == *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    v26 = -[TrieNode object](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (v26)
    {
      unint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

      if (v22 > v27)
      {
        v28 = -[TrieNode object](*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
        v29 = v28;
        if (*(unsigned char *)(*(void *)(a1 + 32) + 12) || ([v28 isLaTeX] & 1) == 0)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v29);
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v22;
        }
      }
    }
    unint64_t v30 = ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    v31 = [*(id *)(a1 + 32) wordBreakIndices];
    unint64_t v32 = [v31 count];

    if (v30 < v32)
    {
      v33 = [*(id *)(a1 + 32) wordBreakIndices];
      v34 = [v33 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (int)[v34 intValue];
    }
  }
LABEL_28:
}

+ (id)prepareString:(id)a3
{
  return (id)[a3 decomposedStringWithCanonicalMapping];
}

id __36__CalculateTokenizer__findNextToken__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [*(id *)(a1 + 32) peekIndex];
  uint64_t v12 = a3 - [*(id *)(a1 + 32) peekIndex];
  if (!v9)
  {
    uint64_t v13 = [*(id *)(a1 + 32) string];
    objc_msgSend(v13, "substringWithRange:", v11, v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = +[CalculateToken tokenWithType:range:text:ranks:](CalculateToken, "tokenWithType:range:text:ranks:", a2, v11, v12, v9, v10);
  uint64_t v15 = [*(id *)(a1 + 32) peekTokens];
  [v15 addObject:v14];

  [*(id *)(a1 + 32) setPeekIndex:a3];
  uint64_t v16 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v16 + 9) && *(unsigned char *)(v16 + 10) && [v14 isOperand]) {
    *(unsigned char *)(*(void *)(a1 + 32) + 11) = 1;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || a2 != 2 && a2 != 52 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    goto LABEL_19;
  }
  v17 = *(void **)(a1 + 32);
  if (!v17[9] || ([v17 _isGraphableReserved] & 1) != 0) {
    goto LABEL_19;
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v18 + 16))
  {
    *(unsigned char *)(v18 + 16) = 1;
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    char v20 = *(void **)(v21 + 80);
    *(void *)(v21 + 80) = v22;
    goto LABEL_17;
  }
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:*(void *)(v18 + 80)] & 1) == 0)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    char v20 = *(void **)(v19 + 80);
    *(void *)(v19 + 80) = 0;
LABEL_17:
  }
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = 0;

LABEL_19:
  if (a2 == 3 || +[CalculateToken isOpen:a2]) {
    goto LABEL_21;
  }
  if (a2 == 1) {
    goto LABEL_44;
  }
  if (a2 == 52 || a2 == 5)
  {
LABEL_21:
    int v25 = [*(id *)(*(void *)(a1 + 32) + 192) isMaybeX];
    if (a2 == 5 && [*(id *)(*(void *)(a1 + 32) + 192) tokenType] == 39) {
      int v25 = 0;
    }
    if ([*(id *)(*(void *)(a1 + 32) + 200) isOperand])
    {
      if (!v25)
      {
LABEL_29:
        if (a2 == 1) {
          goto LABEL_44;
        }
        goto LABEL_30;
      }
    }
    else if ((+[CalculateToken isClose:](CalculateToken, "isClose:", [*(id *)(*(void *)(a1 + 32) + 200) tokenType]) & v25 & 1) == 0)
    {
      goto LABEL_29;
    }
    [*(id *)(*(void *)(a1 + 32) + 192) setTokenType:6];
    goto LABEL_29;
  }
LABEL_30:
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), *(id *)(*(void *)(a1 + 32) + 192));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), v14);
  ++*(_DWORD *)(*(void *)(a1 + 32) + 20);
  uint64_t v26 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v26 + 9))
  {
    if (!*(unsigned char *)(v26 + 10)
      && *(_DWORD *)(v26 + 20) == 2
      && [*(id *)(v26 + 192) tokenType] == 31
      && [*(id *)(*(void *)(a1 + 32) + 200) tokenType] == 39)
    {
      uint64_t v27 = [*(id *)(*(void *)(a1 + 32) + 200) text];
      uint64_t v28 = *(void *)(a1 + 32);
      v29 = *(void **)(v28 + 72);
      *(void *)(v28 + 72) = v27;

      [*(id *)(*(void *)(a1 + 32) + 200) range];
      if (v30 == 1)
      {
        v31 = [*(id *)(*(void *)(a1 + 32) + 200) text];
        if ([v31 isEqualToString:@"y"])
        {
        }
        else
        {
          unint64_t v32 = [*(id *)(*(void *)(a1 + 32) + 200) text];
          int v33 = [v32 isEqualToString:@"Y"];

          if (!v33) {
            goto LABEL_44;
          }
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
        *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
        [*(id *)(a1 + 32) addDeclaredVariable:@"x"];
      }
    }
  }
LABEL_44:

  return v14;
}

- (id)nextToken
{
  v3 = [(CalculateTokenizer *)self peekToken];
  if (v3)
  {
    v4 = [(CalculateTokenizer *)self peekTokens];
    [v4 removeObjectAtIndex:0];
  }
  [(CalculateTokenizer *)self setLastToken:v3];
  return v3;
}

- (id)peekToken
{
  v3 = [(CalculateTokenizer *)self peekTokens];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(CalculateTokenizer *)self _findNextToken];
  }
  v5 = [(CalculateTokenizer *)self peekTokens];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [(CalculateTokenizer *)self peekTokens];
    v8 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSMutableArray)peekTokens
{
  return self->_peekTokens;
}

- (void)setLastToken:(id)a3
{
}

- (void)_findNextToken
{
  uint64_t v251 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdate) {
    [(CalculateTokenizer *)self update];
  }
  unint64_t v3 = [(CalculateTokenizer *)self peekIndex];
  if (v3 >= [(CalculateTokenizer *)self stringLength]) {
    return;
  }
  while (1)
  {
    uint64_t v4 = [(CalculateTokenizer *)self wordBreakIndices];
    v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[CalculateTokenizer wordBreakIndicesIndex](self, "wordBreakIndicesIndex"));
    int v6 = [v5 intValue];
    unint64_t v7 = [(CalculateTokenizer *)self peekIndex];

    if (v7 < v6) {
      break;
    }
    [(CalculateTokenizer *)self setWordBreakIndicesIndex:[(CalculateTokenizer *)self wordBreakIndicesIndex] + 1];
  }
  uint64_t v241 = 0;
  v242 = &v241;
  uint64_t v243 = 0x3032000000;
  v244 = __Block_byref_object_copy__785;
  v245 = __Block_byref_object_dispose__786;
  id v246 = 0;
  uint64_t v237 = 0;
  v238 = &v237;
  uint64_t v239 = 0x2020000000;
  char v240 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CalculateTokenizer__findNextToken__block_invoke;
  aBlock[3] = &unk_1E6365D40;
  aBlock[4] = self;
  aBlock[5] = &v241;
  aBlock[6] = &v237;
  v146 = _Block_copy(aBlock);
  unint64_t v144 = [(CalculateTokenizer *)self stringLength];
  uint64_t v149 = [(CalculateTokenizer *)self peekIndex];
  v8 = [(CalculateTokenizer *)self wordBreakIndices];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[CalculateTokenizer wordBreakIndicesIndex](self, "wordBreakIndicesIndex"));
  int v10 = [v9 intValue];

  uint64_t v148 = v10;
  unint64_t v11 = v149;
  if (!self->_prevToken
    && (unsigned __int16)(([(NSString *)self->_string characterAtIndex:v149] & 0xFFDF) - 65) <= 0x19u)
  {
    *(void *)&long long v247 = 0;
    *((void *)&v247 + 1) = &v247;
    *(void *)&long long v248 = 0x2020000000;
    BYTE8(v248) = 0;
    uint64_t v229 = 0;
    v230 = &v229;
    uint64_t v231 = 0x2020000000;
    LOBYTE(v232) = 0;
    uint64_t v12 = [(CalculateTokenizer *)self string];
    v235[0] = MEMORY[0x1E4F143A8];
    v235[1] = 3221225472;
    v235[2] = __36__CalculateTokenizer__findNextToken__block_invoke_2;
    v235[3] = &unk_1E6365D68;
    v235[4] = &v247;
    v235[5] = &v229;
    +[Trie enumerateCharactersInKey:v10 range:v144 - v10 usingBlock:v235];

    if (*(unsigned char *)(*((void *)&v247 + 1) + 24) && *((unsigned char *)v230 + 24))
    {
      id v13 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(void *, uint64_t, void, void, void))v146
                                                         + 2))(v146, 39, v10, 0, 0));
      _Block_object_dispose(&v229, 8);
      _Block_object_dispose(&v247, 8);
      goto LABEL_153;
    }
    _Block_object_dispose(&v229, 8);
    _Block_object_dispose(&v247, 8);
    unint64_t v11 = v149;
  }
  unint64_t v143 = v10 - v11;
  if (v10 <= v11
    || v143 != 1 && v143 > self->_variableBufferLength && v143 > self->_graphableVariableLength
    || (unsigned __int16)(([(NSString *)self->_string characterAtIndex:v11] & 0xFFDF) - 65) > 0x19u)
  {
    goto LABEL_68;
  }
  if (v143 == 1 || v143 <= self->_variableBufferLength || v143 <= self->_graphableVariableLength)
  {
    v14 = [(NSString *)self->_string substringWithRange:v11];
    uint64_t v15 = [v14 lowercaseString];

    uint64_t v16 = [(NSDictionary *)self->_variables objectForKey:v15];
    if (v16)
    {

      graphableVariable = self->_graphableVariable;
      if (!graphableVariable)
      {
        *((unsigned char *)v238 + 24) = 0;
        goto LABEL_32;
      }
      char v18 = 1;
    }
    else
    {
      char v18 = [(NSMutableSet *)self->_lowercasedVariables containsObject:v15];
      graphableVariable = self->_graphableVariable;
      if (!graphableVariable)
      {
        *((unsigned char *)v238 + 24) = 0;
        if (v18) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
    }
    uint64_t v19 = [(NSString *)graphableVariable caseInsensitiveCompare:v15];
    *((unsigned char *)v238 + 24) = v19 == 0;
    if (v18) {
      goto LABEL_32;
    }
    if (!v19)
    {
      uint64_t v20 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v149, v143);
      uint64_t v21 = (void *)v242[5];
      v242[5] = v20;

      if (*((unsigned char *)v238 + 24)) {
        goto LABEL_32;
      }
    }
LABEL_30:
    if ([v15 isEqualToString:@"x"])
    {
      if (!*((unsigned char *)v238 + 24))
      {
        uint64_t v22 = 52;
        goto LABEL_33;
      }
LABEL_32:
      uint64_t v22 = 39;
LABEL_33:
      uint64_t v23 = (*((void (**)(void *, uint64_t, void, void, void))v146 + 2))(v146, v22, v10, 0, 0);
      if ([v23 isMaybeX])
      {
        [(CalculateTokenizer *)self _findNextToken];
        uint64_t v24 = [(NSMutableArray *)self->_peekTokens lastObject];
        int v25 = v24;
        if (!v24 || [v24 tokenType] == 1) {
          [(CalculateTokenizer *)self _findNextToken];
        }
      }
      goto LABEL_153;
    }
    *((unsigned char *)v238 + 24) = 0;

    unint64_t v11 = v149;
  }
  if (!self->_variables || !self->_variableBuffer || v143 > self->_variableBufferLength) {
    goto LABEL_68;
  }
  -[NSString getCharacters:range:](self->_string, "getCharacters:range:");
  int v26 = 0;
  LOBYTE(v27) = 0;
  uint64_t v28 = 0;
  long long v247 = 0u;
  long long v248 = 0u;
  uint64_t v29 = v143;
  variableBuffer = self->_variableBuffer;
  if (v143 <= 1) {
    uint64_t v29 = 1;
  }
  BOOL v31 = 1;
  do
  {
    int v32 = variableBuffer[v28];
    int v33 = -97;
    if ((unsigned __int16)(v32 - 97) < 0x1Au) {
      goto LABEL_49;
    }
    if ((unsigned __int16)(v32 - 65) < 0x1Au)
    {
      int v33 = -65;
LABEL_49:
      if (self->_singleLetterVariables.letters[v33 + v32]) {
        goto LABEL_51;
      }
    }
    ++v26;
    unsigned __int16 v27 = variableBuffer[v28];
LABEL_51:
    if ((unsigned __int16)(v32 - 97) > 0x19u)
    {
      if ((unsigned __int16)(v32 - 65) > 0x19u) {
        goto LABEL_58;
      }
      v34 = (char *)&v247 + (v32 - 65);
    }
    else
    {
      v34 = (char *)&v247 + (v32 - 97);
    }
    if (*v34) {
      goto LABEL_58;
    }
    unsigned char *v34 = 1;
    BOOL v31 = ++v28 < v143;
  }
  while (v29 != v28);
  BOOL v31 = 0;
LABEL_58:
  if (self->_declaredVariable && v26 == 1)
  {
    uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%c", (char)v27);
    v36 = (void *)v242[5];
    v242[5] = v35;

    unint64_t v11 = v149;
    if (self->_graphableVariable)
    {
      if (!objc_msgSend((id)v242[5], "caseInsensitiveCompare:"))
      {
        *((unsigned char *)v238 + 24) = 1;
        if (!v31) {
          goto LABEL_63;
        }
      }
    }
  }
  else if (!v31 && v26 <= 0)
  {
    do
LABEL_63:
      id v37 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(void *, uint64_t, unint64_t, void, void))v146
                                                         + 2))(v146, 39, ++v11, 0, 0));
    while (v10 != v11);
    goto LABEL_153;
  }
  *((unsigned char *)v238 + 24) = 0;
LABEL_68:
  int v38 = 0;
  *(void *)&long long v247 = 0;
  *((void *)&v247 + 1) = &v247;
  *(void *)&long long v248 = 0x3032000000;
  *((void *)&v248 + 1) = __Block_byref_object_copy__785;
  v249 = __Block_byref_object_dispose__786;
  id v250 = 0;
  uint64_t v229 = 0;
  v230 = &v229;
  uint64_t v231 = 0x3032000000;
  v232 = __Block_byref_object_copy__785;
  v233 = __Block_byref_object_dispose__786;
  id v234 = 0;
  uint64_t v225 = 0;
  v226 = &v225;
  uint64_t v227 = 0x2020000000;
  uint64_t v228 = 0;
  uint64_t v39 = v144 - v11;
  char v40 = 1;
  while (2)
  {
    char v41 = v40;
    uint64_t v219 = 0;
    v220 = &v219;
    uint64_t v221 = 0x3032000000;
    v222 = __Block_byref_object_copy__785;
    v223 = __Block_byref_object_dispose__786;
    uint64_t v42 = [(CalculateTokenizer *)self trie];
    v43 = (void *)v42;
    if (v42) {
      v44 = (void *)[*(id *)(v42 + 32) copy];
    }
    else {
      v44 = 0;
    }
    id v224 = v44;

    uint64_t v178 = 0;
    v179 = &v178;
    uint64_t v180 = 0x2020000000;
    v181 = 0;
    v181 = [(CalculateTokenizer *)self wordBreakIndicesIndex];
    uint64_t v172 = 0;
    v173 = &v172;
    uint64_t v174 = 0x2020000000;
    v175 = (uint64_t (*)(uint64_t, uint64_t))v10;
    v45 = [(CalculateTokenizer *)self string];
    v217[0] = MEMORY[0x1E4F143A8];
    v217[1] = 3221225472;
    v217[2] = __36__CalculateTokenizer__findNextToken__block_invoke_3;
    v217[3] = &unk_1E6365D90;
    int v218 = v38;
    v217[5] = &v229;
    v217[4] = self;
    v217[6] = &v219;
    v217[7] = &v247;
    v217[8] = &v225;
    v217[9] = &v172;
    v217[11] = v149;
    v217[10] = &v178;
    +[Trie enumerateCharactersInKey:v149 range:v39 usingBlock:v217];

    v46 = [*(id *)(*((void *)&v247 + 1) + 40) ranks];
    if ([v46 count] != 1)
    {

LABEL_75:
      _Block_object_dispose(&v172, 8);
      _Block_object_dispose(&v178, 8);
      _Block_object_dispose(&v219, 8);

      char v40 = 0;
      int v38 = 1;
      if ((v41 & 1) == 0) {
        goto LABEL_78;
      }
      continue;
    }
    break;
  }
  BOOL v47 = [*(id *)(*((void *)&v247 + 1) + 40) tokenType] == 2;

  if (v47) {
    goto LABEL_75;
  }
  _Block_object_dispose(&v172, 8);
  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v219, 8);

LABEL_78:
  v48 = *(void **)(*((void *)&v247 + 1) + 40);
  if (v48 && [v48 tokenType] != 33)
  {
    if ([*(id *)(*((void *)&v247 + 1) + 40) tokenType] == 2
      || [*(id *)(*((void *)&v247 + 1) + 40) tokenType] == 35)
    {
      int v53 = [*(id *)(*((void *)&v247 + 1) + 40) tokenType];
      uint64_t v54 = v149;
      if (v53 == 35)
      {
        v55 = objc_msgSend(*(id *)(*((void *)&v247 + 1) + 40), "ranks", v149);
        BOOL v56 = [v55 count] == 1;

        if (v56)
        {
          v57 = *(void **)(*((void *)&v247 + 1) + 40);
          *(void *)(*((void *)&v247 + 1) + 40) = 0;
        }
        unint64_t v58 = v226[3];
        uint64_t v54 = v149;
        if (v58 < v144)
        {
          while (1)
          {
            v59 = [(CalculateTokenizer *)self string];
            int v60 = [v59 characterAtIndex:v58];

            uint64_t v54 = v149;
            if (v60 == 95) {
              break;
            }
            if (v60 != 32 && (unsigned __int16)(v60 - 48) >= 0xAu)
            {
              if (v60 != 40) {
                goto LABEL_144;
              }
              break;
            }
            if (v144 == ++v58) {
              goto LABEL_144;
            }
          }
          v98 = *(void **)(*((void *)&v247 + 1) + 40);
          *(void *)(*((void *)&v247 + 1) + 40) = 0;

          uint64_t v54 = v149;
        }
      }
LABEL_144:
      if (*(void *)(*((void *)&v247 + 1) + 40))
      {
        if (!v242[5] && v143 == 1)
        {
          uint64_t v99 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v54, 1);
          v100 = (void *)v242[5];
          v242[5] = v99;

          v101 = (void *)v242[5];
          v102 = [MEMORY[0x1E4F28B88] letterCharacterSet];
          LODWORD(v101) = [v101 rangeOfCharacterFromSet:v102] == 0x7FFFFFFFFFFFFFFFLL;

          if (v101)
          {
            v103 = (void *)v242[5];
            v242[5] = 0;
          }
        }
        v65 = (uint64_t (**)(void *, uint64_t, uint64_t, void, uint64_t))v146;
        uint64_t v67 = v226[3];
        uint64_t v64 = *(void *)(*((void *)&v247 + 1) + 40);
        uint64_t v66 = 2;
      }
      else
      {
        uint64_t v64 = 0;
        v65 = (uint64_t (**)(void *, uint64_t, uint64_t, void, uint64_t))v146;
        uint64_t v67 = v226[3];
        uint64_t v66 = 35;
      }
    }
    else
    {
      int v63 = [*(id *)(*((void *)&v247 + 1) + 40) tokenType];
      uint64_t v64 = 0;
      v65 = (uint64_t (**)(void *, uint64_t, uint64_t, void, uint64_t))v146;
      uint64_t v66 = v63;
      uint64_t v67 = v226[3];
    }
    id v104 = (id)v65[2](v65, v66, v67, 0, v64);
    goto LABEL_152;
  }
  uint64_t v49 = [(id)v230[5] length] + v149;
  uint64_t v213 = 0;
  v214 = &v213;
  uint64_t v215 = 0x2020000000;
  uint64_t v216 = v49;
  if ([(id)v230[5] rangeOfCharacterFromSet:newlineSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v52 = 32;
    goto LABEL_106;
  }
  if ([(id)v230[5] rangeOfCharacterFromSet:whitespaceSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v61 = [(CalculateTokenizer *)self string];
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __36__CalculateTokenizer__findNextToken__block_invoke_4;
    v212[3] = &unk_1E6365DB8;
    v212[4] = &v213;
    +[Trie enumerateCharactersInKey:v149 range:v143 usingBlock:v212];

    uint64_t v49 = v214[3];
    uint64_t v52 = 1;
    goto LABEL_106;
  }
  if ([(id)v230[5] rangeOfCharacterFromSet:anyDigitSet] == 0x7FFFFFFFFFFFFFFFLL
    && [(id)v230[5] rangeOfCharacterFromSet:self->_localizedDecimalSet] == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_181;
  }
  uint64_t v208 = 0;
  v209 = &v208;
  uint64_t v210 = 0x2020000000;
  int v211 = 0;
  id v50 = (id)v230[5];
  if ([v50 rangeOfCharacterFromSet:digitSet] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v50 rangeOfCharacterFromSet:symbolSet] == 0x7FFFFFFFFFFFFFFFLL
      && [v50 rangeOfCharacterFromSet:hebrewSet] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v50 rangeOfCharacterFromSet:punctuationSet] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v50 rangeOfCharacterFromSet:devanagariDigitSet] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v50 rangeOfCharacterFromSet:eastArabicDigitSet] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v50 rangeOfCharacterFromSet:wideDigitSet] == 0x7FFFFFFFFFFFFFFFLL) {
              int v51 = 1;
            }
            else {
              int v51 = 5;
            }
          }
          else
          {
            int v51 = 4;
          }
        }
        else
        {
          int v51 = 3;
        }
      }
      else
      {
        int v51 = 7;
      }
    }
    else
    {
      int v51 = 6;
    }
  }
  else
  {
    int v51 = 2;
  }

  int v211 = v51;
  uint64_t v204 = 0;
  v205 = &v204;
  uint64_t v206 = 0x2020000000;
  BOOL v207 = 0;
  BOOL v207 = [(id)v230[5] rangeOfCharacterFromSet:self->_localizedDecimalSet] == 0x7FFFFFFFFFFFFFFFLL;
  v202[0] = 0;
  v202[1] = v202;
  v202[2] = 0x2020000000;
  char v203 = 1;
  v200[0] = 0;
  v200[1] = v200;
  v200[2] = 0x2020000000;
  char v201 = 0;
  v198[0] = 0;
  v198[1] = v198;
  v198[2] = 0x2020000000;
  char v199 = 0;
  char v199 = *((unsigned char *)v205 + 24);
  v196[0] = 0;
  v196[1] = v196;
  v196[2] = 0x2020000000;
  char v197 = 0;
  uint64_t v192 = 0;
  v193 = &v192;
  uint64_t v194 = 0x2020000000;
  char v195 = 0;
  if (!*((unsigned char *)v205 + 24)) {
    *((_DWORD *)v209 + 6) = 1;
  }
  uint64_t v219 = 0;
  v220 = &v219;
  uint64_t v221 = 0x3032000000;
  v222 = __Block_byref_object_copy__785;
  v223 = __Block_byref_object_dispose__786;
  id v224 = 0;
  if (self->_normalizeNumbers)
  {
    v68 = objc_opt_new();
    v69 = v68;
    if (*((unsigned char *)v205 + 24)) {
      [v68 appendString:v230[5]];
    }
    else {
      [v68 appendString:@"."];
    }
  }
  else
  {
    v69 = 0;
  }
  uint64_t v188 = 0;
  v189 = &v188;
  uint64_t v190 = 0x2020000000;
  char v191 = 0;
  uint64_t v184 = 0;
  v185 = (int *)&v184;
  uint64_t v186 = 0x2020000000;
  int v187 = 0;
  uint64_t v178 = 0;
  v179 = &v178;
  uint64_t v180 = 0x3032000000;
  v181 = __Block_byref_object_copy__785;
  v182 = __Block_byref_object_dispose__786;
  id v183 = (id)v230[5];
  uint64_t v172 = 0;
  v173 = &v172;
  uint64_t v174 = 0x3032000000;
  v175 = __Block_byref_object_copy__785;
  v176 = __Block_byref_object_dispose__786;
  id v177 = 0;
  uint64_t v168 = 0;
  v169 = &v168;
  uint64_t v170 = 0x2020000000;
  uint64_t v171 = v49;
  if (self->_normalizeNumbers && *((_DWORD *)v209 + 6) != 2) {
    char v191 = 1;
  }
  v214[3] = v49;
  v70 = [(CalculateTokenizer *)self string];
  v152[0] = MEMORY[0x1E4F143A8];
  v152[1] = 3221225472;
  v152[2] = __36__CalculateTokenizer__findNextToken__block_invoke_5;
  v152[3] = &unk_1E6365DE0;
  v155 = v200;
  v156 = &v192;
  v157 = v196;
  v158 = &v188;
  v154 = &v208;
  v152[4] = self;
  v159 = &v184;
  v160 = &v219;
  id v71 = v69;
  id v153 = v71;
  v161 = v198;
  v162 = &v172;
  v163 = &v204;
  v164 = v202;
  v165 = &v178;
  v166 = &v213;
  v167 = &v168;
  +[Trie enumerateCharactersInKey:v49 range:v144 - v49 usingBlock:v152];

  if (v214[3] == v149 + 1 && [(id)v230[5] isEqualToString:@"."])
  {
    id v72 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, void))v146
                                                       + 2))(v146, 6, v214[3], v230[5], 0));
    goto LABEL_179;
  }
  if (*((unsigned char *)v193 + 24) || [(id)v179[5] isEqualToString:@","])
  {
    --v214[3];
    if (self->_normalizeNumbers) {
      objc_msgSend(v71, "deleteCharactersInRange:", objc_msgSend(v71, "length") - 1, 1);
    }
  }
  unint64_t v73 = v214[3];
  if (v73 <= [(CalculateTokenizer *)self peekIndex])
  {
    char v97 = 1;
    goto LABEL_180;
  }
  v74 = [(CalculateTokenizer *)self lastToken];
  v141 = v71;
  if (!v74) {
    goto LABEL_166;
  }
  v75 = [(CalculateTokenizer *)self lastToken];
  BOOL v76 = [v75 tokenType] == 2;

  if (!v76) {
    goto LABEL_166;
  }
  unint64_t v147 = 0;
  id v77 = 0;
  char v142 = 0;
  while (1)
  {
    v78 = [(CalculateTokenizer *)self lastToken];
    v79 = [v78 ranks];
    v80 = [v79 ranks];
    unint64_t v145 = [v80 count];

    if (v145 <= v147) {
      break;
    }
    v81 = [(CalculateTokenizer *)self lastToken];
    v82 = [v81 ranks];
    v83 = [v82 ranks];
    v84 = [v83 objectAtIndexedSubscript:v147];
    BOOL v85 = (int)[v84 unitID] < 1;

    if (!v85)
    {
      v86 = [(CalculateTokenizer *)self unitsInfo];
      v87 = [(CalculateTokenizer *)self lastToken];
      v88 = [v87 ranks];
      v89 = [v88 ranks];
      v90 = [v89 objectAtIndexedSubscript:v147];
      v91 = objc_msgSend(v86, "objectAtIndexedSubscript:", (int)objc_msgSend(v90, "unitID"));
      v92 = [v91 typeInfo];
      int v93 = [v92 isCurrency];

      if (v93)
      {
        if ((v142 & 1) == 0) {
          break;
        }
        v94 = [(CalculateTokenizer *)self string];
        unint64_t v95 = [(CalculateTokenizer *)self peekIndex];
        v96 = objc_msgSend(v94, "substringWithRange:", v95, v214[3] - -[CalculateTokenizer peekIndex](self, "peekIndex"));

        if (([v96 isEqualToString:@"2"] & 1) == 0
          && ([v96 isEqualToString:@"3"] & 1) == 0)
        {
          id v77 = v96;
          break;
        }
        char v142 = 1;
        id v77 = v96;
      }
      else
      {
        char v142 = 1;
      }
    }
    ++v147;
  }
  v105 = [(CalculateTokenizer *)self lastToken];
  v106 = [v105 text];
  v107 = [(CalculateTokenizer *)self lastToken];
  v108 = [v107 text];
  v109 = objc_msgSend(v106, "substringFromIndex:", objc_msgSend(v108, "length") - 1);

  if ([v109 rangeOfCharacterFromSet:symbolSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v110 = 0;
LABEL_168:

    id v115 = v77;
    goto LABEL_169;
  }
  v110 = 0;
  if ([v109 rangeOfCharacterFromSet:punctuationSet] != 0x7FFFFFFFFFFFFFFFLL || v145 > v147) {
    goto LABEL_168;
  }
  v111 = [(CalculateTokenizer *)self string];
  unint64_t v112 = [(CalculateTokenizer *)self peekIndex];
  v113 = objc_msgSend(v111, "substringWithRange:", v112, v214[3] - -[CalculateTokenizer peekIndex](self, "peekIndex"));

  if (([v113 isEqualToString:@"2"] & 1) == 0
    && ![v113 isEqualToString:@"3"])
  {
    v110 = 0;
    id v77 = v113;
    goto LABEL_168;
  }
  id v77 = v113;

  if (v77)
  {
    v109 = [(CalculateTokenizer *)self peekTokens];
    v114 = +[CalculateToken tokenWithType:11, [(CalculateTokenizer *)self peekIndex], 0, @"^", 0 range text ranks];
    [v109 addObject:v114];

    v110 = v77;
    goto LABEL_168;
  }
LABEL_166:
  id v115 = 0;
  v110 = 0;
LABEL_169:
  v116 = v115;
  v117 = (*((void (**)(void *, uint64_t, uint64_t))v146 + 2))(v146, 3, v214[3]);
  id v71 = v141;
  if (self->_normalizeNumbers)
  {
    id v118 = v141;
    v119 = v118;
    if (*((unsigned char *)v189 + 24))
    {
      uint64_t v120 = objc_msgSend(v118, "calc_stringByReplacingOccurrencesOfRegex:usingBlock:", @"[０-９०-९٠-٩]+", &__block_literal_global_1028);

      v119 = (void *)v120;
    }
    [v117 setNormalizedText:v119];
    [v117 setCharacterType:*((unsigned int *)v209 + 6)];
  }
  if (v185[6] >= 1 && v169[3] > (unint64_t)v214[3])
  {
    v121 = [(CalculateTokenizer *)self string];
    v122 = v110;
    uint64_t v123 = v214[3];
    uint64_t v124 = v169[3] - v123;
    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = __36__CalculateTokenizer__findNextToken__block_invoke_7;
    v150[3] = &unk_1E6365E28;
    v150[4] = self;
    id v125 = v146;
    id v151 = v125;
    uint64_t v126 = v123;
    v110 = v122;
    +[Trie enumerateCharactersInKey:v126 range:v124 usingBlock:v150];

    unint64_t v127 = v169[3];
    if (v127 > [(CalculateTokenizer *)self peekIndex]) {
      id v128 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(id, uint64_t, uint64_t, void, void))v146
    }
                                                          + 2))(v125, 3, v169[3], 0, 0));

    id v71 = v141;
  }

LABEL_179:
  char v97 = 0;
LABEL_180:

  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(&v172, 8);

  _Block_object_dispose(&v178, 8);
  _Block_object_dispose(&v184, 8);
  _Block_object_dispose(&v188, 8);
  _Block_object_dispose(&v219, 8);

  _Block_object_dispose(&v192, 8);
  _Block_object_dispose(v196, 8);
  _Block_object_dispose(v198, 8);
  _Block_object_dispose(v200, 8);
  _Block_object_dispose(v202, 8);
  _Block_object_dispose(&v204, 8);
  _Block_object_dispose(&v208, 8);
  if (v97)
  {
LABEL_181:
    v129 = *(void **)(*((void *)&v247 + 1) + 40);
    if (v129 && [v129 tokenType] == 33)
    {
      uint64_t v52 = (int)[*(id *)(*((void *)&v247 + 1) + 40) tokenType];
      uint64_t v49 = v226[3];
      goto LABEL_106;
    }
    trie = self->_trie;
    v131 = +[CalculateTokenizer symbolsTrie];
    if (trie != v131)
    {

      goto LABEL_186;
    }
    BOOL v136 = self->_unitsInfo == 0;

    if (!v136)
    {
      v137 = +[AvailableUnitRanks shared];
      v138 = [v137 ranksWithLocales:self->_locales];
      v139 = self->_trie;
      self->_trie = v138;

      [(CalculateTokenizer *)self _findNextToken];
      goto LABEL_107;
    }
LABEL_186:
    if ([(CalculateTokenizer *)self peekIndex] + 1 != v148) {
      goto LABEL_190;
    }
    int v132 = characterTypeForCharacter((void *)v230[5]);
    if (v132 == 6)
    {
      uint64_t v133 = 54;
LABEL_196:
      id v140 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(void *, uint64_t, uint64_t, void, void))v146
                                                          + 2))(v146, v133, v148, 0, 0));
    }
    else
    {
      if (v132 == 7)
      {
        uint64_t v133 = 53;
        goto LABEL_196;
      }
LABEL_190:
      if (!v242[5])
      {
        uint64_t v134 = -[NSString substringWithRange:](self->_string, "substringWithRange:", v149, v143);
        v135 = (void *)v242[5];
        v242[5] = v134;
      }
      uint64_t v52 = 52;
      uint64_t v49 = v148;
LABEL_106:
      id v62 = objc_unsafeClaimAutoreleasedReturnValue((id)(*((uint64_t (**)(void *, uint64_t, uint64_t, void, void))v146
                                                         + 2))(v146, v52, v49, 0, 0));
    }
  }
LABEL_107:
  _Block_object_dispose(&v213, 8);
LABEL_152:
  _Block_object_dispose(&v225, 8);
  _Block_object_dispose(&v229, 8);

  _Block_object_dispose(&v247, 8);
LABEL_153:

  _Block_object_dispose(&v237, 8);
  _Block_object_dispose(&v241, 8);
}

- (unint64_t)peekIndex
{
  return self->_peekIndex;
}

- (unint64_t)wordBreakIndicesIndex
{
  return self->_wordBreakIndicesIndex;
}

- (NSString)string
{
  return self->_string;
}

- (NSMutableArray)wordBreakIndices
{
  return self->_wordBreakIndices;
}

void __28__CalculateTokenizer_update__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  BOOL v5 = [v12 rangeOfCharacterFromSet:digitSet] == 0x7FFFFFFFFFFFFFFFLL;
  int v6 = v12;
  if (!v5)
  {
    int v7 = 2;
    goto LABEL_14;
  }
  if ([v12 rangeOfCharacterFromSet:symbolSet] != 0x7FFFFFFFFFFFFFFFLL
    || [v12 rangeOfCharacterFromSet:hebrewSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = 6;
LABEL_13:
    int v6 = v12;
    goto LABEL_14;
  }
  if ([v12 rangeOfCharacterFromSet:punctuationSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = 7;
    goto LABEL_13;
  }
  if ([v12 rangeOfCharacterFromSet:devanagariDigitSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = 3;
    goto LABEL_13;
  }
  BOOL v5 = [v12 rangeOfCharacterFromSet:eastArabicDigitSet] == 0x7FFFFFFFFFFFFFFFLL;
  int v6 = v12;
  if (v5)
  {
    BOOL v5 = [v12 rangeOfCharacterFromSet:wideDigitSet] == 0x7FFFFFFFFFFFFFFFLL;
    int v6 = v12;
    if (v5) {
      int v7 = 1;
    }
    else {
      int v7 = 5;
    }
  }
  else
  {
    int v7 = 4;
  }
LABEL_14:

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  int v9 = *(_DWORD *)(v8 + 24);
  if (v9 && ((~v7 & 6) == 0 || v7 != v9))
  {
    int v10 = [*(id *)(a1 + 32) wordBreakIndices];
    unint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    [v10 addObject:v11];

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(_DWORD *)(v8 + 24) = v7;
}

- (unint64_t)stringLength
{
  return self->_stringLength;
}

- (Trie)trie
{
  return self->_trie;
}

- (void)setPeekIndex:(unint64_t)a3
{
  self->_peekIndex = a3;
}

+ (int)displayNameExponent:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@"2"] & 1) != 0 || (objc_msgSend(v3, "hasSuffix:", @"²"))
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 3;
    if (([v3 hasSuffix:@"3"] & 1) == 0)
    {
      if ([v3 hasSuffix:@"³"]) {
        int v4 = 3;
      }
      else {
        int v4 = 0;
      }
    }
  }

  return v4;
}

- (void)setWordBreakIndicesIndex:(unint64_t)a3
{
  self->_wordBreakIndicesIndex = a3;
}

+ (id)symbolsTrie
{
  if (symbolsTrie_onceToken != -1) {
    dispatch_once(&symbolsTrie_onceToken, &__block_literal_global_166);
  }
  uint64_t v2 = (void *)symbolsTrie_symbolsTrie;
  return v2;
}

- (CalculateToken)lastToken
{
  return self->_lastToken;
}

- (UnitsInfo)unitsInfo
{
  return self->_unitsInfo;
}

void __39__CalculateTokenizer_addUnits_builtIn___block_invoke_3()
{
  uint64_t v0 = (void *)addUnits_builtIn__deg;
  addUnits_builtIn__deg = (uint64_t)&unk_1F1872DA0;

  v1 = (void *)addUnits_builtIn__circ;
  addUnits_builtIn__circ = (uint64_t)&unk_1F1872DB8;

  uint64_t v2 = (void *)addUnits_builtIn__dollar;
  addUnits_builtIn__dollar = (uint64_t)&unk_1F1872DD0;

  id v3 = (void *)addUnits_builtIn__dollarCountries;
  addUnits_builtIn__dollarCountries = (uint64_t)&unk_1F1872DE8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDecimalSet, 0);
  objc_storeStrong((id *)&self->_localizedGroupingSet, 0);
  objc_storeStrong((id *)&self->_currencyDecimalSeparator, 0);
  objc_storeStrong((id *)&self->_currencyGroupingSeparator, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_groupingSeparator, 0);
  objc_storeStrong((id *)&self->_prevToken2, 0);
  objc_storeStrong((id *)&self->_prevToken, 0);
  objc_storeStrong((id *)&self->_lowercasedVariables, 0);
  objc_storeStrong((id *)&self->_wordBreakIndices, 0);
  objc_storeStrong((id *)&self->_lastToken, 0);
  objc_storeStrong((id *)&self->_peekTokens, 0);
  objc_storeStrong((id *)&self->_trie, 0);
  objc_storeStrong((id *)&self->_unitsInfo, 0);
  objc_storeStrong((id *)&self->_graphableVariable, 0);
  objc_storeStrong((id *)&self->_suggestedGraphableVariable, 0);
  objc_storeStrong((id *)&self->_declaredVariable, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

+ (id)nonWhitespaceLanguageSet
{
  if (nonWhitespaceLanguageSet_onceToken != -1) {
    dispatch_once(&nonWhitespaceLanguageSet_onceToken, &__block_literal_global_163);
  }
  uint64_t v2 = (void *)nonWhitespaceLanguageSet_nonWhitespaceLanguageSet;
  return v2;
}

- (void)update
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdate)
  {
    self->_needsUpdate = 0;
    [(CalculateTokenizer *)self _loadIfNeeded];
    id v3 = [(CalculateTokenizer *)self wordBreakIndices];
    [v3 removeAllObjects];

    int v4 = [(CalculateTokenizer *)self locales];
    if (![v4 count])
    {
      uint64_t v5 = +[Localize systemLocales];

      int v4 = (void *)v5;
    }
    int v6 = [v4 firstObject];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v45 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (([v12 usesWhitespace] & 1) == 0)
          {
            id v13 = v12;

            int v6 = v13;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    v14 = self->_numberFormatter;
    if (!v14)
    {
      uint64_t v15 = [v7 firstObject];
      v14 = +[CalculateResult performSelector:sel_defaultNumberFormatter_ withObject:v15];
    }
    uint64_t v16 = [(NSNumberFormatter *)v14 groupingSeparator];
    groupingSeparator = self->_groupingSeparator;
    self->_groupingSeparator = v16;

    char v18 = [(NSNumberFormatter *)v14 decimalSeparator];
    decimalSeparator = self->_decimalSeparator;
    self->_decimalSeparator = v18;

    uint64_t v20 = [(NSNumberFormatter *)v14 currencyGroupingSeparator];
    currencyGroupingSeparator = self->_currencyGroupingSeparator;
    self->_currencyGroupingSeparator = v20;

    uint64_t v42 = v14;
    uint64_t v22 = [(NSNumberFormatter *)v14 currencyDecimalSeparator];
    currencyDecimalSeparator = self->_currencyDecimalSeparator;
    self->_currencyDecimalSeparator = v22;

    uint64_t v24 = (NSMutableCharacterSet *)objc_opt_new();
    localizedGroupingSet = self->_localizedGroupingSet;
    self->_localizedGroupingSet = v24;

    if (self->_groupingSeparator) {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:");
    }
    if (self->_currencyGroupingSeparator) {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedGroupingSet, "addCharactersInString:");
    }
    if ([(NSString *)self->_groupingSeparator isEqualToString:@"’"]
      || [(NSString *)self->_currencyGroupingSeparator isEqualToString:@"’"])
    {
      [(NSMutableCharacterSet *)self->_localizedGroupingSet addCharactersInString:@"'"];
    }
    if ([(NSString *)self->_groupingSeparator rangeOfCharacterFromSet:nbspSet] != 0x7FFFFFFFFFFFFFFFLL
      || [(NSString *)self->_currencyGroupingSeparator rangeOfCharacterFromSet:nbspSet] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableCharacterSet *)self->_localizedGroupingSet addCharactersInString:@" "];
    }
    if (![(NSString *)self->_decimalSeparator isEqualToString:@","]
      && ![(NSString *)self->_currencyDecimalSeparator isEqualToString:@","])
    {
      [(NSMutableCharacterSet *)self->_localizedGroupingSet addCharactersInString:@","];
    }
    int v26 = (NSMutableCharacterSet *)objc_opt_new();
    localizedDecimalSet = self->_localizedDecimalSet;
    self->_localizedDecimalSet = v26;

    if (self->_decimalSeparator) {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedDecimalSet, "addCharactersInString:");
    }
    if (self->_currencyDecimalSeparator) {
      -[NSMutableCharacterSet addCharactersInString:](self->_localizedDecimalSet, "addCharactersInString:");
    }
    if ([(NSString *)self->_decimalSeparator rangeOfCharacterFromSet:nbspSet] != 0x7FFFFFFFFFFFFFFFLL
      || [(NSString *)self->_currencyDecimalSeparator rangeOfCharacterFromSet:nbspSet] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableCharacterSet *)self->_localizedDecimalSet addCharactersInString:@" "];
    }
    if (![(NSString *)self->_groupingSeparator isEqualToString:@"."]
      && ![(NSString *)self->_currencyGroupingSeparator isEqualToString:@"."])
    {
      [(NSMutableCharacterSet *)self->_localizedDecimalSet addCharactersInString:@"."];
    }
    CFAllocatorRef v28 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v29 = [(CalculateTokenizer *)self string];
    v50.location = self->_startIndex;
    v50.length = self->_stringLength - v50.location;
    uint64_t v30 = CFStringTokenizerCreate(v28, v29, v50, 0, (CFLocaleRef)v6);

    unint64_t v31 = [(CalculateTokenizer *)self startIndex];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __28__CalculateTokenizer_update__block_invoke;
    aBlock[3] = &unk_1E6365C28;
    aBlock[4] = self;
    int v32 = (void (**)(void *, unint64_t, CFIndex))_Block_copy(aBlock);
    while (CFStringTokenizerAdvanceToNextToken(v30))
    {
      CFIndex v33 = [(CalculateTokenizer *)self stringLength];
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v30);
      if (CurrentTokenRange.location != -1) {
        CFIndex v33 = CurrentTokenRange.location + CurrentTokenRange.length;
      }
      v32[2](v32, v31, v33);
      unint64_t v31 = v33;
    }
    uint64_t v35 = [(CalculateTokenizer *)self wordBreakIndices];
    if ([v35 count])
    {
      [(CalculateTokenizer *)self wordBreakIndices];
      v36 = char v41 = v6;
      [v36 lastObject];
      v38 = id v37 = v7;
      int v40 = [v38 intValue];
      unint64_t v39 = [(CalculateTokenizer *)self stringLength];

      id v7 = v37;
      int v6 = v41;

      if (v39 <= v40) {
        goto LABEL_49;
      }
    }
    else
    {
    }
    v32[2](v32, v31, [(CalculateTokenizer *)self stringLength]);
LABEL_49:
    CFRelease(v30);
    [(CalculateTokenizer *)self reset];
  }
}

void __28__CalculateTokenizer_update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  int v11 = 0;
  int v6 = [*(id *)(a1 + 32) string];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__CalculateTokenizer_update__block_invoke_2;
  v9[3] = &unk_1E6365D18;
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v10;
  +[Trie enumerateCharactersInKey:a2 range:a3 - a2 usingBlock:v9];

  id v7 = [*(id *)(a1 + 32) wordBreakIndices];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 addObject:v8];

  _Block_object_dispose(v10, 8);
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)reset
{
  self->_peekIndex = self->_startIndex;
  [(NSMutableArray *)self->_peekTokens removeAllObjects];
  lastToken = self->_lastToken;
  self->_lastToken = 0;

  prevToken2 = self->_prevToken2;
  self->_prevToken2 = 0;

  prevToken = self->_prevToken;
  self->_prevToken = 0;

  self->_prevTokenCount = 0;
  *(_WORD *)&self->_isGraphable = 0;
  declaredVariables = self->_declaredVariables;
  self->_declaredVariables = 0;

  declaredVariable = self->_declaredVariable;
  self->_declaredVariable = 0;

  suggestedGraphableVariable = self->_suggestedGraphableVariable;
  self->_suggestedGraphableVariable = 0;

  self->_foundGraphableVariable = 0;
  [(CalculateTokenizer *)self setWordBreakIndicesIndex:0];
}

- (NSArray)locales
{
  return self->_locales;
}

- (void)_loadIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CalculateTokenizer__loadIfNeeded__block_invoke;
  block[3] = &unk_1E6365CF0;
  block[4] = self;
  if (_loadIfNeeded_onceToken != -1) {
    dispatch_once(&_loadIfNeeded_onceToken, block);
  }
  if (!self->_trie)
  {
    if (self->_unitsInfo)
    {
      id v3 = +[AvailableUnitRanks shared];
      int v4 = [v3 ranksWithLocales:self->_locales cachedOnly:1];
      uint64_t v5 = v4;
      if (v4)
      {
        int v6 = v4;
      }
      else
      {
        int v6 = +[CalculateTokenizer symbolsTrie];
      }
      trie = self->_trie;
      self->_trie = v6;
    }
    else
    {
      id v7 = +[CalculateTokenizer symbolsTrie];
      id v3 = self->_trie;
      self->_trie = v7;
    }
  }
}

+ (void)addUnits:(id)a3 builtIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = +[UnitsInfo converterUnits];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__CalculateTokenizer_addUnits_builtIn___block_invoke;
  aBlock[3] = &unk_1E6365CA0;
  id v7 = v5;
  id v25 = v7;
  id v8 = v6;
  id v26 = v8;
  uint64_t v9 = _Block_copy(aBlock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __39__CalculateTokenizer_addUnits_builtIn___block_invoke_2;
  v22[3] = &unk_1E6365CC8;
  id v10 = v9;
  id v23 = v10;
  int v11 = _Block_copy(v22);
  if (addUnits_builtIn__onceToken[0] != -1) {
    dispatch_once(addUnits_builtIn__onceToken, &__block_literal_global_596);
  }
  id v12 = (void (*)(void *, __CFString *, uint64_t, float))v11[2];
  if (v4)
  {
    v12(v11, @"degree", addUnits_builtIn__circ, 0.6);
  }
  else
  {
    v12(v11, @"fahrenheit", addUnits_builtIn__circ, 0.0);
    ((void (*)(void *, __CFString *, uint64_t, double))v11[2])(v11, @"celsius", addUnits_builtIn__circ, 0.0);
    ((void (*)(void *, __CFString *, uint64_t, float))v11[2])(v11, @"USD", addUnits_builtIn__dollar, 0.2);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = (id)addUnits_builtIn__dollarCountries;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          ((void (*)(void *, void, uint64_t, float))v11[2])(v11, *(void *)(*((void *)&v18 + 1) + 8 * i), addUnits_builtIn__dollar, 1.0);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v15);
    }
  }
}

uint64_t __39__CalculateTokenizer_addUnits_builtIn___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__CalculateTokenizer_addUnits_builtIn___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, float a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = -[Trie objectForKeyedSubscript:](*(void *)(a1 + 32), v14);
        if (!v15)
        {
          uint64_t v15 = +[UnitRanks unitRanksWithUnitsInfo:0];
          -[Trie setObject:forKeyedSubscript:](*(void *)(a1 + 32), v15, v14);
        }
        uint64_t v16 = [*(id *)(a1 + 40) infoForUnitName:v9];
        v17 = [UnitRank alloc];
        uint64_t v18 = [v16 unitID];
        *(float *)&double v19 = a5;
        long long v20 = [(UnitRank *)v17 initWithUnitID:v18 rank:0 locale:v19];
        [(UnitRank *)v20 setIsLaTeX:a4];
        [v15 addUnitRank:v20];
        [v15 sort];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

void __35__CalculateTokenizer_loadSymbolSet__block_invoke()
{
  id v3 = (id)objc_opt_new();
  uint64_t v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  [v3 formUnionWithCharacterSet:v0];

  [v3 addCharactersInString:@"\\#*×⋅⌈⌉⌊⌋＊"];
  [v3 addCharactersInString:@"+＋➕"];
  [v3 addCharactersInString:@"-﹣－➖–−"];
  [v3 addCharactersInString:@"/÷⁄／"];
  objc_msgSend(v3, "addCharactersInString:", @"(（");
  [v3 addCharactersInString:@"）"]);
  [v3 addCharactersInString:@"^"];
  [v3 addCharactersInString:@"<≪"];
  [v3 addCharactersInString:@">≫"];
  [v3 addCharactersInString:@"<⋘"];
  [v3 addCharactersInString:@">⋙"];
  [v3 addCharactersInString:@"%٪"];
  [v3 addCharactersInString:@"&"];
  [v3 addCharactersInString:@"|"];
  [v3 addCharactersInString:@"=＝"];
  [v3 addCharactersInString:@","];
  [v3 addCharactersInString:@"!"];
  [v3 addCharactersInString:@"πΠ𝜋𝝥𝝅𝚷"];
  [v3 addCharactersInString:@"{"];
  [v3 addCharactersInString:@"}"];
  [v3 addCharactersInString:@"["];
  [v3 addCharactersInString:@"]"];
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)symbolSet;
  symbolSet = v1;
}

void __35__CalculateTokenizer__loadIfNeeded__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v1 = (void *)newlineSet;
  newlineSet = v0;

  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v3 = (void *)whitespaceSet;
  whitespaceSet = v2;

  uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789"];
  id v5 = (void *)digitSet;
  digitSet = v4;

  uint64_t v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"०१२३४५६७८९"];
  id v7 = (void *)devanagariDigitSet;
  devanagariDigitSet = v6;

  uint64_t v8 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"٠١٢٣٤٥٦٧٨٩"];
  id v9 = (void *)eastArabicDigitSet;
  eastArabicDigitSet = v8;

  uint64_t v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"０１２３４５６７８９"];
  uint64_t v11 = (void *)wideDigitSet;
  wideDigitSet = v10;

  uint64_t v12 = objc_opt_new();
  [v12 formUnionWithCharacterSet:digitSet];
  [v12 formUnionWithCharacterSet:devanagariDigitSet];
  [v12 formUnionWithCharacterSet:eastArabicDigitSet];
  [v12 formUnionWithCharacterSet:wideDigitSet];
  id v13 = (void *)anyDigitSet;
  anyDigitSet = (uint64_t)v12;
  id v24 = v12;

  uint64_t v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+＋➕"];
  uint64_t v15 = (void *)addSet;
  addSet = v14;

  uint64_t v16 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-﹣－➖–−"];
  v17 = (void *)subtractSet;
  subtractSet = v16;

  uint64_t v18 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"=＝"];
  double v19 = (void *)equalSet;
  equalSet = v18;

  [(id)objc_opt_class() loadSymbolSet];
  [(id)objc_opt_class() loadPunctuationSet];
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 1424, 112);
  long long v21 = (void *)hebrewSet;
  hebrewSet = v20;

  uint64_t v22 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"  "];
  long long v23 = (void *)nbspSet;
  nbspSet = v22;
}

+ (void)loadSymbolSet
{
  if (loadSymbolSet_onceToken[0] != -1) {
    dispatch_once(loadSymbolSet_onceToken, &__block_literal_global_91);
  }
}

+ (void)loadPunctuationSet
{
  if (loadPunctuationSet_onceToken != -1) {
    dispatch_once(&loadPunctuationSet_onceToken, &__block_literal_global_161_869);
  }
}

+ (void)addSymbols:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CalculateTokenizer_addSymbols___block_invoke;
  aBlock[3] = &unk_1E6365C50;
  id v19 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__CalculateTokenizer_addSymbols___block_invoke_2;
  v16[3] = &unk_1E6365C78;
  id v6 = v5;
  id v17 = v6;
  id v7 = (void (**)(void *, uint64_t, void *))_Block_copy(v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__CalculateTokenizer_addSymbols___block_invoke_3;
  v14[3] = &unk_1E6365C78;
  id v15 = v6;
  id v8 = v6;
  id v9 = (void (**)(void *, uint64_t, void *))_Block_copy(v14);
  v7[2](v7, 4, &unk_1F18728C0);
  v7[2](v7, 5, &unk_1F18728D8);
  v7[2](v7, 6, &unk_1F18728F0);
  v7[2](v7, 7, &unk_1F1872908);
  v7[2](v7, 8, &unk_1F1872920);
  v7[2](v7, 9, &unk_1F1872938);
  v7[2](v7, 10, &unk_1F1872950);
  v7[2](v7, 19, &unk_1F1872968);
  v7[2](v7, 20, &unk_1F1872980);
  v7[2](v7, 21, &unk_1F1872998);
  v7[2](v7, 22, &unk_1F18729B0);
  v7[2](v7, 12, &unk_1F18729C8);
  v7[2](v7, 36, &unk_1F18729E0);
  v7[2](v7, 13, &unk_1F18729F8);
  v7[2](v7, 14, &unk_1F1872A10);
  v7[2](v7, 15, &unk_1F1872A28);
  v7[2](v7, 16, &unk_1F1872A40);
  v7[2](v7, 17, &unk_1F1872A58);
  v7[2](v7, 18, &unk_1F1872A70);
  v7[2](v7, 31, &unk_1F1872A88);
  v7[2](v7, 33, &unk_1F1872AA0);
  v7[2](v7, 34, &unk_1F1872AB8);
  v7[2](v7, 37, &unk_1F1872AD0);
  v7[2](v7, 38, &unk_1F1872AE8);
  v7[2](v7, 27, &unk_1F1872B00);
  v7[2](v7, 28, &unk_1F1872B18);
  v7[2](v7, 29, &unk_1F1872B30);
  v7[2](v7, 30, &unk_1F1872B48);
  v7[2](v7, 23, &unk_1F1872B60);
  v7[2](v7, 24, &unk_1F1872B78);
  v7[2](v7, 25, &unk_1F1872B90);
  v7[2](v7, 26, &unk_1F1872BA8);
  uint64_t v10 = +[CalculateTokenizer functionSet];
  uint64_t v11 = [v10 allObjects];
  v7[2](v7, 35, v11);

  v9[2](v9, 43, &unk_1F1872BC0);
  v9[2](v9, 44, &unk_1F1872BD8);
  v9[2](v9, 7, &unk_1F1872BF0);
  v9[2](v9, 6, &unk_1F1872C08);
  v9[2](v9, 12, &unk_1F1872C20);
  v9[2](v9, 37, &unk_1F1872C38);
  uint64_t v12 = +[CalculateTokenizer laTeXFunctionSet];
  id v13 = [v12 allObjects];
  v9[2](v9, 35, v13);

  v9[2](v9, 40, &unk_1F1872C50);
  v9[2](v9, 51, &unk_1F1872C68);
  v9[2](v9, 41, &unk_1F1872C80);
  v9[2](v9, 42, &unk_1F1872C98);
  v9[2](v9, 1, &unk_1F1872CB0);
  v9[2](v9, 36, &unk_1F1872CC8);
  v9[2](v9, 13, &unk_1F1872CE0);
  v9[2](v9, 31, &unk_1F1872CF8);
  v9[2](v9, 45, &unk_1F1872D10);
  v9[2](v9, 46, &unk_1F1872D28);
  v9[2](v9, 47, &unk_1F1872D40);
  v9[2](v9, 48, &unk_1F1872D58);
  v9[2](v9, 49, &unk_1F1872D70);
  v9[2](v9, 50, &unk_1F1872D88);
  +[CalculateTokenizer addUnits:v4 builtIn:1];
}

void __33__CalculateTokenizer_addSymbols___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = -[Trie objectForKeyedSubscript:](*(void *)(a1 + 32), v12);
        if (!v13)
        {
          id v13 = +[UnitRanks unitRanksWithUnitsInfo:0];
          -[Trie setObject:forKeyedSubscript:](*(void *)(a1 + 32), v13, v12);
        }
        uint64_t v14 = [UnitRank alloc];
        LODWORD(v15) = -1.0;
        uint64_t v16 = [(UnitRank *)v14 initWithUnitID:0 rank:0 locale:v15];
        [(UnitRank *)v16 setTokenType:a2];
        [(UnitRank *)v16 setIsLaTeX:a4];
        [v13 addUnitRank:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

uint64_t __33__CalculateTokenizer_addSymbols___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __33__CalculateTokenizer_addSymbols___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (NSSet)laTeXFunctionSet
{
  if (laTeXFunctionSet_onceToken[0] != -1) {
    dispatch_once(laTeXFunctionSet_onceToken, &__block_literal_global_886_821);
  }
  uint64_t v2 = (void *)laTeXFunctionSet_functionSet;
  return (NSSet *)v2;
}

+ (NSSet)functionSet
{
  if (functionSet_onceToken != -1) {
    dispatch_once(&functionSet_onceToken, &__block_literal_global_712);
  }
  uint64_t v2 = (void *)functionSet_functionSet;
  return (NSSet *)v2;
}

- (BOOL)isGraphable
{
  return self->_isGraphable;
}

- (void)setVariables:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_needsUpdate = 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = (NSDictionary *)v4;
  }
  else {
    id v5 = 0;
  }
  variables = self->_variables;
  self->_variables = v5;

  lowercasedVariables = self->_lowercasedVariables;
  self->_lowercasedVariables = 0;

  self->_variableBufferLength = 0;
  variableBuffer = self->_variableBuffer;
  if (variableBuffer)
  {
    free(variableBuffer);
    self->_variableBuffer = 0;
  }
  uint64_t v9 = self->_variables;
  if (v9)
  {
    *(_OWORD *)self->_singleLetterVariables.letters = 0u;
    *(_OWORD *)&self->_singleLetterVariables.letters[16] = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = v9;
    uint64_t v11 = [(NSDictionary *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          -[CalculateTokenizer addVariable:](self, "addVariable:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [(NSDictionary *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }

    self->_variableBuffer = (unsigned __int16 *)malloc_type_realloc(self->_variableBuffer, 2 * self->_variableBufferLength + 2, 0x1000040BDFB0063uLL);
  }
}

- (void)setTrie:(id)a3
{
}

- (void)setString:(id)a3
{
  self->_needsUpdate = 1;
  objc_storeStrong((id *)&self->_string, a3);
  id v5 = a3;
  unint64_t v6 = [v5 length];

  self->_stringLength = v6;
  self->_startIndex = 0;
}

- (void)setNumberFormatter:(id)a3
{
  self->_needsUpdate = 1;
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void)setNormalizeNumbers:(BOOL)a3
{
  self->_normalizeNumbers = a3;
}

- (void)setLocales:(id)a3
{
  self->_needsUpdate = 1;
  objc_storeStrong((id *)&self->_locales, a3);
  [(CalculateTokenizer *)self setTrie:0];
}

- (void)setIsLaTeX:(BOOL)a3
{
  self->_needsUpdate = 1;
  self->_isLaTeX = a3;
}

- (CalculateTokenizer)initWithUnits:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CalculateTokenizer;
  unint64_t v6 = [(CalculateTokenizer *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unitsInfo, a3);
    uint64_t v8 = objc_opt_new();
    peekTokens = v7->_peekTokens;
    v7->_peekTokens = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    wordBreakIndices = v7->_wordBreakIndices;
    v7->_wordBreakIndices = (NSMutableArray *)v10;

    v7->_needsUpdate = 1;
    v7->_findDeclaredVariables = 1;
  }

  return v7;
}

- (NSString)graphableVariable
{
  return self->_graphableVariable;
}

- (void)dealloc
{
  variableBuffer = self->_variableBuffer;
  if (variableBuffer)
  {
    free(variableBuffer);
    self->_variableBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CalculateTokenizer;
  [(CalculateTokenizer *)&v4 dealloc];
}

- (BOOL)_isGraphableReserved
{
  return [(NSString *)self->_declaredVariable caseInsensitiveCompare:@"x"] == NSOrderedSame
      || [(NSString *)self->_declaredVariable caseInsensitiveCompare:@"y"] == NSOrderedSame
      || [(NSString *)self->_declaredVariable caseInsensitiveCompare:@"z"] == NSOrderedSame;
}

void __36__CalculateTokenizer__findNextToken__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v27 = a2;
  if ([(__CFString *)v27 rangeOfCharacterFromSet:digitSet] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(__CFString *)v27 rangeOfCharacterFromSet:symbolSet] == 0x7FFFFFFFFFFFFFFFLL
      && [(__CFString *)v27 rangeOfCharacterFromSet:hebrewSet] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([(__CFString *)v27 rangeOfCharacterFromSet:punctuationSet] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(__CFString *)v27 rangeOfCharacterFromSet:devanagariDigitSet] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([(__CFString *)v27 rangeOfCharacterFromSet:eastArabicDigitSet] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([(__CFString *)v27 rangeOfCharacterFromSet:wideDigitSet] == 0x7FFFFFFFFFFFFFFFLL) {
              int v10 = 1;
            }
            else {
              int v10 = 5;
            }
          }
          else
          {
            int v10 = 4;
          }
        }
        else
        {
          int v10 = 3;
        }
      }
      else
      {
        int v10 = 7;
      }
    }
    else
    {
      int v10 = 6;
    }
  }
  else
  {
    int v10 = 2;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(_DWORD *)(v11 + 24) == 1) {
    *(_DWORD *)(v11 + 24) = v10;
  }
  if ([(__CFString *)v27 rangeOfCharacterFromSet:anyDigitSet] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
      && [(__CFString *)v27 rangeOfCharacterFromSet:*(void *)(*(void *)(a1 + 32) + 240)] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
      if (!v22 || ([v22 isEqualToString:v27] & 1) != 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), a2);
        if ([(__CFString *)v27 isEqualToString:@","]) {
          *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 3;
        }
        else {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        }
        goto LABEL_54;
      }
    }
    else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) {
           && [(__CFString *)v27 rangeOfCharacterFromSet:*(void *)(*(void *)(a1 + 32) + 248)] != 0x7FFFFFFFFFFFFFFFLL)
    }
    {
      if (*(int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) < 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
        {
          [*(id *)(a1 + 40) appendString:@"."];
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
            && ([(__CFString *)v27 isEqualToString:@"."] & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
          }
        }
        goto LABEL_54;
      }
    }
    else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) {
           && (([(__CFString *)v27 isEqualToString:@"e"] & 1) != 0
    }
            || [(__CFString *)v27 isEqualToString:@"E"]))
    {
      if (*(int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) < 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        goto LABEL_37;
      }
    }
    else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if ([(__CFString *)v27 rangeOfCharacterFromSet:subtractSet] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          && [(__CFString *)v27 rangeOfCharacterFromSet:addSet] != 0x7FFFFFFFFFFFFFFFLL
          && *(int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) < 1)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
          if (!*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
            goto LABEL_54;
          }
          long long v23 = *(void **)(a1 + 40);
          id v24 = @"+";
          goto LABEL_39;
        }
      }
      else if (*(int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) < 1)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
          goto LABEL_54;
        }
        long long v23 = *(void **)(a1 + 40);
        id v24 = @"-";
        goto LABEL_39;
      }
    }
  }
  else if (v10 == *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    if (v10 != 2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8);
    int v13 = *(_DWORD *)(v12 + 24);
    BOOL v14 = __OFSUB__(v13, 1);
    int v15 = v13 - 1;
    if (v15 < 0 == v14)
    {
      *(_DWORD *)(v12 + 24) = v15;
      if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
      {
        long long v16 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        if (!v16)
        {
          uint64_t v17 = objc_opt_new();
          uint64_t v18 = *(void *)(*(void *)(a1 + 96) + 8);
          long long v19 = *(void **)(v18 + 40);
          *(void *)(v18 + 40) = v17;

          long long v16 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
        }
        [v16 appendString:v27];
        if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
        {
          [*(id *)(a1 + 40) appendString:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
          uint64_t v20 = *(void *)(*(void *)(a1 + 96) + 8);
          long long v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = 0;
        }
      }
      goto LABEL_54;
    }
LABEL_37:
    if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
    {
      long long v23 = *(void **)(a1 + 40);
      id v24 = v27;
LABEL_39:
      [v23 appendString:v24];
    }
LABEL_54:
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
    {
      uint64_t v25 = a3 + a4;
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40), a2);
      uint64_t v25 = a3 + a4;
      *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = a3 + a4;
    }
    id v26 = v27;
    *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 24) = v25;
    goto LABEL_60;
  }
  *a5 = 1;
  id v26 = v27;
LABEL_60:
}

void __46__CalculateTokenizer_nonWhitespaceLanguageSet__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CalculateTokenizer_nonWhitespaceLanguageSet__block_invoke_2;
  aBlock[3] = &unk_1E6365C28;
  id v6 = v0;
  id v1 = v0;
  uint64_t v2 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v2[2](v2, 12288, 12543);
  v2[2](v2, 65280, 65519);
  v2[2](v2, 19968, 40879);
  v2[2](v2, 3584, 3711);
  uint64_t v3 = [v1 copy];
  objc_super v4 = (void *)nonWhitespaceLanguageSet_nonWhitespaceLanguageSet;
  nonWhitespaceLanguageSet_nonWhitespaceLanguageSet = v3;
}

uint64_t __46__CalculateTokenizer_nonWhitespaceLanguageSet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCharactersInRange:", a2, a3 - a2);
}

uint64_t __40__CalculateTokenizer_loadPunctuationSet__block_invoke()
{
  punctuationSet = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  return MEMORY[0x1F41817F8]();
}

void __38__CalculateTokenizer_laTeXFunctionSet__block_invoke()
{
  objc_super v4 = objc_opt_new();
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"\\sqrt", @"\\lg", @"\\log", @"\\ln", @"\\min", @"\\max", 0);
  [v4 unionSet:v0];

  id v1 = +[CalculateTokenizer laTeXTrigonometricSet];
  [v4 unionSet:v1];

  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)laTeXFunctionSet_functionSet;
  laTeXFunctionSet_functionSet = v2;
}

void __33__CalculateTokenizer_functionSet__block_invoke()
{
  objc_super v4 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"√", @"sqrt", @"∛", @"cbrt", @"ln", @"log", @"pow", @"root", @"fact", @"exp", @"flip", @"ceil", @"floor", @"round", @"rint", @"abs", @"fabs",
    @"j0",
    @"j1",
    @"y0",
    @"y1",
    @"erf",
    @"erfc",
    @"fmod",
    @"hypot",
    @"rem",
    @"min",
    @"max",
    @"lgamma",
  uint64_t v0 = 0);
  [v4 unionSet:v0];

  id v1 = +[CalculateTokenizer trigonometricSet];
  [v4 unionSet:v1];

  uint64_t v2 = [v4 copy];
  uint64_t v3 = (void *)functionSet_functionSet;
  functionSet_functionSet = v2;
}

- (void)setRange:(_NSRange)a3
{
  self->_needsUpdate = 1;
  self->_stringLength = a3.location + a3.length;
  self->_startIndex = a3.location;
}

- (void)setFindDeclaredVariables:(BOOL)a3
{
  self->_findDeclaredVariables = a3;
}

+ (id)tokenizerWithUnits:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[CalculateTokenizer alloc] initWithUnits:v3];

  return v4;
}

- (void)setGraphableVariableLength:(unint64_t)a3
{
  self->_graphableVariableLength = a3;
}

- (unint64_t)graphableVariableLength
{
  return self->_graphableVariableLength;
}

- (void)setFoundGraphableVariable:(BOOL)a3
{
  self->_foundGraphableVariable = a3;
}

- (BOOL)foundGraphableVariable
{
  return self->_foundGraphableVariable;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setLocalizedDecimalSet:(id)a3
{
}

- (NSMutableCharacterSet)localizedDecimalSet
{
  return self->_localizedDecimalSet;
}

- (void)setLocalizedGroupingSet:(id)a3
{
}

- (NSMutableCharacterSet)localizedGroupingSet
{
  return self->_localizedGroupingSet;
}

- (void)setDecimalSeparatorSpace:(BOOL)a3
{
  self->_decimalSeparatorSpace = a3;
}

- (BOOL)decimalSeparatorSpace
{
  return self->_decimalSeparatorSpace;
}

- (void)setGroupingSeparatorSpace:(BOOL)a3
{
  self->_groupingSeparatorSpace = a3;
}

- (BOOL)groupingSeparatorSpace
{
  return self->_groupingSeparatorSpace;
}

- (void)setCurrencyDecimalSeparator:(id)a3
{
}

- (NSString)currencyDecimalSeparator
{
  return self->_currencyDecimalSeparator;
}

- (void)setCurrencyGroupingSeparator:(id)a3
{
}

- (NSString)currencyGroupingSeparator
{
  return self->_currencyGroupingSeparator;
}

- (void)setDecimalSeparator:(id)a3
{
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (void)setGroupingSeparator:(id)a3
{
}

- (NSString)groupingSeparator
{
  return self->_groupingSeparator;
}

- (void)setPrevTokenCount:(int)a3
{
  self->_prevTokenCount = a3;
}

- (int)prevTokenCount
{
  return self->_prevTokenCount;
}

- (void)setPrevToken2:(id)a3
{
}

- (CalculateToken)prevToken2
{
  return self->_prevToken2;
}

- (void)setPrevToken:(id)a3
{
}

- (CalculateToken)prevToken
{
  return self->_prevToken;
}

- (void)setSingleLetterVariables:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[16];
  *(_OWORD *)self->_singleLetterVariables.letters = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_singleLetterVariables.letters[16] = v3;
}

- ($0F7EB6B36CDCC9CA6BC7BE76F6527CA8)singleLetterVariables
{
  long long v3 = *(_OWORD *)&self[8].var0[24];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[8].var0[8];
  *(_OWORD *)&retstr->var0[16] = v3;
  return self;
}

- (void)setVariableBuffer:(unsigned __int16 *)a3
{
  self->_variableBuffer = a3;
}

- (unsigned)variableBuffer
{
  return self->_variableBuffer;
}

- (void)setVariableBufferLength:(unint64_t)a3
{
  self->_variableBufferLength = a3;
}

- (unint64_t)variableBufferLength
{
  return self->_variableBufferLength;
}

- (void)setLowercasedVariables:(id)a3
{
}

- (NSMutableSet)lowercasedVariables
{
  return self->_lowercasedVariables;
}

- (void)setWordBreakIndices:(id)a3
{
}

- (void)setPeekTokens:(id)a3
{
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (void)setStringLength:(unint64_t)a3
{
  self->_stringLength = a3;
}

- (void)setUnitsInfo:(id)a3
{
}

- (BOOL)isLaTeX
{
  return self->_isLaTeX;
}

- (NSString)suggestedGraphableVariable
{
  return self->_suggestedGraphableVariable;
}

- (BOOL)foundGraphableValue
{
  return self->_foundGraphableValue;
}

- (BOOL)findDeclaredVariables
{
  return self->_findDeclaredVariables;
}

- (NSString)declaredVariable
{
  return self->_declaredVariable;
}

- (NSSet)declaredVariables
{
  return self->_declaredVariables;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (BOOL)normalizeNumbers
{
  return self->_normalizeNumbers;
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (unint64_t)index
{
  return self->_index;
}

- (id)peekNonWhitespaceToken
{
  long long v3 = [(CalculateTokenizer *)self peekToken];
  if ([v3 tokenType] == 1)
  {
    id v4 = [(CalculateTokenizer *)self peekTokenAtOffset:1];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)peekTokenAtOffset:(int64_t)a3
{
  id v5 = [(CalculateTokenizer *)self peekTokens];
  int64_t v6 = a3 - [v5 count];

  if ((v6 & 0x8000000000000000) == 0)
  {
    int64_t v7 = 0;
    do
    {
      [(CalculateTokenizer *)self _findNextToken];
      ++v7;
    }
    while (v6 >= v7);
  }
  if (a3 < 0
    || ([(CalculateTokenizer *)self peekTokens],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v9 <= a3))
  {
    uint64_t v11 = 0;
  }
  else
  {
    int v10 = [(CalculateTokenizer *)self peekTokens];
    uint64_t v11 = [v10 objectAtIndexedSubscript:a3];
  }
  return v11;
}

void __36__CalculateTokenizer__findNextToken__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  BOOL v7 = [v9 rangeOfCharacterFromSet:whitespaceSet] == 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = v9;
  if (v7)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      BOOL v7 = [v9 rangeOfCharacterFromSet:equalSet] == 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v8 = v9;
      if (!v7)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        goto LABEL_8;
      }
    }
    *a5 = 1;
  }
LABEL_8:
}

uint64_t __36__CalculateTokenizer__findNextToken__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 stringByApplyingTransform:@"Fullwidth-Halfwidth; Any-Latin" reverse:0];
}

- (void)addDeclaredVariable:(id)a3
{
  if (self->_findDeclaredVariables)
  {
    id v10 = [a3 lowercaseString];
    -[CalculateTokenizer addVariable:](self, "addVariable:");
    lowercasedVariables = self->_lowercasedVariables;
    if (!lowercasedVariables)
    {
      id v5 = (NSMutableSet *)objc_opt_new();
      int64_t v6 = self->_lowercasedVariables;
      self->_lowercasedVariables = v5;

      lowercasedVariables = self->_lowercasedVariables;
    }
    [(NSMutableSet *)lowercasedVariables addObject:v10];
    declaredVariables = self->_declaredVariables;
    if (!declaredVariables)
    {
      uint64_t v8 = (NSSet *)objc_opt_new();
      id v9 = self->_declaredVariables;
      self->_declaredVariables = v8;

      declaredVariables = self->_declaredVariables;
    }
    [(NSSet *)declaredVariables addObject:v10];
  }
}

- (void)addVariable:(id)a3
{
  id v20 = a3;
  unint64_t v4 = [v20 length] + 1;
  unint64_t variableBufferLength = self->_variableBufferLength;
  if (v4 > variableBufferLength) {
    self->_unint64_t variableBufferLength = v4;
  }
  BOOL v6 = [v20 length] == 1;
  BOOL v7 = v20;
  if (v6)
  {
    int v8 = [v20 characterAtIndex:0];
    p_singleLetterVariables = &self->_singleLetterVariables;
    uint64_t v10 = (v8 - 97);
    if (v10 > 0x19)
    {
      uint64_t v12 = (v8 - 65);
      BOOL v7 = v20;
      if (v12 > 0x19 || (uint64_t v11 = &p_singleLetterVariables->letters[v12], *v11))
      {
LABEL_11:
        unint64_t v13 = self->_singleLetterVariables.count + 1;
        if (self->_variableBufferLength < v13) {
          self->_unint64_t variableBufferLength = v13;
        }
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v11 = &p_singleLetterVariables->letters[v10];
      BOOL v7 = v20;
      if (*v11) {
        goto LABEL_11;
      }
    }
    BOOL *v11 = 1;
    ++self->_singleLetterVariables.count;
    goto LABEL_11;
  }
LABEL_13:
  BOOL v14 = [v7 lowercaseString];
  if (([v20 isEqualToString:v14] & 1) == 0)
  {
    lowercasedVariables = self->_lowercasedVariables;
    if (!lowercasedVariables)
    {
      long long v16 = (NSMutableSet *)objc_opt_new();
      uint64_t v17 = self->_lowercasedVariables;
      self->_lowercasedVariables = v16;

      lowercasedVariables = self->_lowercasedVariables;
    }
    [(NSMutableSet *)lowercasedVariables addObject:v14];
  }
  unint64_t v18 = self->_variableBufferLength;
  if (v18 > (int)variableBufferLength)
  {
    variableBuffer = self->_variableBuffer;
    if (variableBuffer) {
      self->_variableBuffer = (unsigned __int16 *)malloc_type_realloc(variableBuffer, 2 * v18 + 2, 0x1000040BDFB0063uLL);
    }
  }
}

- (void)setGraphableVariable:(id)a3
{
  objc_storeStrong((id *)&self->_graphableVariable, a3);
  id v5 = a3;
  unint64_t v6 = [(NSString *)self->_graphableVariable length];

  self->_graphableVariableLength = v6;
}

- (_NSRange)range
{
  NSUInteger stringLength = self->_stringLength;
  NSUInteger startIndex = self->_startIndex;
  result.length = stringLength;
  result.location = startIndex;
  return result;
}

- (CalculateTokenizer)init
{
  return [(CalculateTokenizer *)self initWithUnits:0];
}

+ (NSSet)laTeXTrigonometricSet
{
  if (laTeXTrigonometricSet_onceToken[0] != -1) {
    dispatch_once(laTeXTrigonometricSet_onceToken, &__block_literal_global_906);
  }
  uint64_t v2 = (void *)laTeXTrigonometricSet_trigonometricSet;
  return (NSSet *)v2;
}

uint64_t __43__CalculateTokenizer_laTeXTrigonometricSet__block_invoke()
{
  laTeXTrigonometricSet_trigonometricSet = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"\\cos", @"\\sin", @"\\tan", @"\\arccos", @"\\arcsin", @"\\arctan", @"\\cosh", @"\\sinh", @"\\tanh", @"\\sec", @"\\csc", @"\\cot", @"\\sech", @"\\csch", @"\\coth", 0);
  return MEMORY[0x1F41817F8]();
}

+ (NSSet)trigonometricSet
{
  if (trigonometricSet_onceToken != -1) {
    dispatch_once(&trigonometricSet_onceToken, &__block_literal_global_803);
  }
  uint64_t v2 = (void *)trigonometricSet_trigonometricSet;
  return (NSSet *)v2;
}

uint64_t __38__CalculateTokenizer_trigonometricSet__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"sin", @"cos", @"tan", @"asin", @"acos", @"atan", @"sinh", @"cosh", @"tanh", @"asinh", @"acosh", @"atanh", @"arcsin", @"arccos", @"arctan", @"arcsind", @"arccosd",
    @"arctand",
    @"arcsinh",
    @"arccosh",
    @"arctanh",
    @"sind",
    @"cosd",
    @"tand",
    @"asind",
    @"acosd",
    @"atand",
  trigonometricSet_trigonometricSet = 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)punctuationSet
{
  [a1 loadPunctuationSet];
  uint64_t v2 = (void *)punctuationSet;
  return v2;
}

+ (id)symbolSet
{
  [a1 loadSymbolSet];
  uint64_t v2 = (void *)symbolSet;
  return v2;
}

@end