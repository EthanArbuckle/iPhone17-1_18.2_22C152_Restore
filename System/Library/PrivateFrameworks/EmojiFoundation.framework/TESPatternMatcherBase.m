@interface TESPatternMatcherBase
- (BOOL)matchMustBeWordOrSentenceTerminal;
- (NSRegularExpression)regularExpression;
- (NSString)pattern;
- (TESPatternMatcherBase)init;
- (id)createMatchResultForMatchRange:(_NSRange)a3 sourceString:(id)a4;
- (id)matchesForString:(id)a3 searchRange:(_NSRange)a4;
- (int64_t)effectType;
- (int64_t)matchType;
- (void)configurePrecompiledRegularExpression;
- (void)setEffectType:(int64_t)a3;
- (void)setMatchMustBeWordOrSentenceTerminal:(BOOL)a3;
- (void)setMatchType:(int64_t)a3;
- (void)setPattern:(id)a3;
- (void)setRegularExpression:(id)a3;
@end

@implementation TESPatternMatcherBase

- (TESPatternMatcherBase)init
{
  v5.receiver = self;
  v5.super_class = (Class)TESPatternMatcherBase;
  v2 = [(TESPatternMatcherBase *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TESPatternMatcherBase *)v2 setMatchType:1];
    [(TESPatternMatcherBase *)v3 setMatchMustBeWordOrSentenceTerminal:1];
  }
  return v3;
}

- (void)configurePrecompiledRegularExpression
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a1 pattern];
  v6 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1B8C45000, a3, OS_LOG_TYPE_ERROR, "configurePrecompiledRegularExpression: regular expression pattern \"%{public}@\" could not be compiled. Error: '%{public}@'", v7, 0x16u);
}

- (id)createMatchResultForMatchRange:(_NSRange)a3 sourceString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(TESMatchResult);
  [(TESMatchResult *)v8 setMatchType:[(TESPatternMatcherBase *)self matchType]];
  [(TESMatchResult *)v8 setEffectType:[(TESPatternMatcherBase *)self effectType]];
  -[TESMatchResult setMatchRange:](v8, "setMatchRange:", location, length);
  [(TESMatchResult *)v8 setSourceString:v7];

  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [(TESMatchResult *)v8 setMatcherClass:v10];

  return v8;
}

- (id)matchesForString:(id)a3 searchRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [(TESPatternMatcherBase *)self regularExpression];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke;
  v14[3] = &unk_1E61A9928;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_msgSend(v9, "enumerateMatchesInString:options:range:usingBlock:", v11, 0, location, length, v14);

  v12 = (void *)[v10 copy];
  return v12;
}

void __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 range];
  id v7 = objc_msgSend(v4, "createMatchResultForMatchRange:sourceString:", v5, v6, *(void *)(a1 + 40));
  uint64_t v8 = [v3 range];
  [v3 range];
  uint64_t v10 = v9 + v8;
  uint64_t v11 = [*(id *)(a1 + 40) length];
  uint64_t v12 = [v3 range];
  uint64_t v13 = v12;
  if (v10 == v11)
  {
    int v14 = 1;
    if (!v12) {
      goto LABEL_11;
    }
  }
  else
  {
    id v15 = *(void **)(a1 + 40);
    uint64_t v16 = [v3 range];
    [v3 range];
    uint64_t v18 = [v15 characterAtIndex:v17 + v16];
    v19 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    if ([v19 characterIsMember:v18])
    {
      int v14 = 1;
    }
    else
    {
      v20 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      int v14 = [v20 characterIsMember:v18];
    }
    if (!v13) {
      goto LABEL_11;
    }
  }
  uint64_t v21 = objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", objc_msgSend(v3, "range") - 1);
  v22 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  if (([v22 characterIsMember:v21] & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [v23 characterIsMember:v21];
  }
LABEL_11:
  if (v14)
  {
    v24 = emf_logging_get_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke_cold_1(v7, v24);
    }

    [*(id *)(a1 + 48) addObject:v7];
  }
}

- (NSString)pattern
{
  return self->_pattern;
}

- (void)setPattern:(id)a3
{
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (void)setRegularExpression:(id)a3
{
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(int64_t)a3
{
  self->_effectType = a3;
}

- (int64_t)matchType
{
  return self->_matchType;
}

- (void)setMatchType:(int64_t)a3
{
  self->_matchType = a3;
}

- (BOOL)matchMustBeWordOrSentenceTerminal
{
  return self->_matchMustBeWordOrSentenceTerminal;
}

- (void)setMatchMustBeWordOrSentenceTerminal:(BOOL)a3
{
  self->_matchMustBeWordOrSentenceTerminal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularExpression, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
}

void __54__TESPatternMatcherBase_matchesForString_searchRange___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = [a1 matchingSubString];
  uint64_t v5 = [a1 matcherClass];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_DEBUG, "[TESPatternMatcherBase]: found result '%{private}@' (matcher class: %{public}@)", v6, 0x16u);
}

@end