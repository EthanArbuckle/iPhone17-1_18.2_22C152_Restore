@interface TESMatchResult
+ (id)resultWithMatchRange:(_NSRange)a3 effectType:(int64_t)a4 matchType:(int64_t)a5 sourceString:(id)a6;
- (NSString)matcherClass;
- (NSString)matchingSubString;
- (NSString)sourceString;
- (_NSRange)matchRange;
- (id)debugDescription;
- (int64_t)effectType;
- (int64_t)matchType;
- (unint64_t)suggestionBehavior;
- (void)setEffectType:(int64_t)a3;
- (void)setMatchRange:(_NSRange)a3;
- (void)setMatchType:(int64_t)a3;
- (void)setMatcherClass:(id)a3;
- (void)setSourceString:(id)a3;
- (void)setSuggestionBehavior:(unint64_t)a3;
@end

@implementation TESMatchResult

+ (id)resultWithMatchRange:(_NSRange)a3 effectType:(int64_t)a4 matchType:(int64_t)a5 sourceString:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = a6;
  v11 = objc_alloc_init(TESMatchResult);
  -[TESMatchResult setMatchRange:](v11, "setMatchRange:", location, length);
  [(TESMatchResult *)v11 setEffectType:a4];
  [(TESMatchResult *)v11 setMatchType:a5];
  [(TESMatchResult *)v11 setSourceString:v10];

  [(TESMatchResult *)v11 setSuggestionBehavior:1];
  return v11;
}

- (NSString)matchingSubString
{
  v3 = [(TESMatchResult *)self sourceString];

  if (v3)
  {
    v4 = [(TESMatchResult *)self sourceString];
    uint64_t v5 = [(TESMatchResult *)self matchRange];
    v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TESMatchResult *)self matchingSubString];
  v14.NSUInteger location = [(TESMatchResult *)self matchRange];
  uint64_t v6 = NSStringFromRange(v14);
  int64_t v7 = [(TESMatchResult *)self effectType];
  int64_t v8 = [(TESMatchResult *)self matchType];
  unint64_t v9 = [(TESMatchResult *)self suggestionBehavior];
  id v10 = [(TESMatchResult *)self sourceString];
  v11 = [v3 stringWithFormat:@"<%@: %p> matchingSubstring: %@, matchRange: %@, effectType: %ld, matchType: %ld, suggestionBehavior: %ld, sourceString: %@", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)sourceString
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceString);
  return (NSString *)WeakRetained;
}

- (void)setSourceString:(id)a3
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

- (unint64_t)suggestionBehavior
{
  return self->_suggestionBehavior;
}

- (void)setSuggestionBehavior:(unint64_t)a3
{
  self->_suggestionBehavior = a3;
}

- (_NSRange)matchRange
{
  NSUInteger length = self->_matchRange.length;
  NSUInteger location = self->_matchRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setMatchRange:(_NSRange)a3
{
  self->_matchRange = a3;
}

- (NSString)matcherClass
{
  return self->_matcherClass;
}

- (void)setMatcherClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherClass, 0);
  objc_destroyWeak((id *)&self->_sourceString);
}

@end