@interface AXLanguageTag
+ (AXLanguageTag)tagWithDialects:(id)a3 range:(_NSRange)a4 content:(id)a5 predictedByTagger:(BOOL)a6;
- (AXDialectMap)dialect;
- (AXDialectMap)preferredAmbiguousDialect;
- (AXDialectMap)preferredUnambiguousDialect;
- (BOOL)canBeSpokenByDialect:(id)a3;
- (BOOL)canBeSpokenByLanguage:(id)a3;
- (BOOL)createdFromNewline;
- (BOOL)hasAmbigiousDialects;
- (BOOL)wasPredicted;
- (NSMutableOrderedSet)ambiguousDialects;
- (NSMutableOrderedSet)predictedSecondaryDialects;
- (NSMutableOrderedSet)unambiguousDialects;
- (NSString)content;
- (NSString)contentSubstring;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAmbiguousDialect:(id)a3;
- (void)addAmbiguousDialects:(id)a3;
- (void)addPredictedSecondaryDialects:(id)a3;
- (void)addUnambiguousDialect:(id)a3;
- (void)contentSubstring;
- (void)setAmbiguousDialects:(id)a3;
- (void)setContent:(id)a3;
- (void)setCreatedFromNewline:(BOOL)a3;
- (void)setPredictedSecondaryDialects:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setUnambiguousDialects:(id)a3;
- (void)setWasPredicted:(BOOL)a3;
@end

@implementation AXLanguageTag

+ (AXLanguageTag)tagWithDialects:(id)a3 range:(_NSRange)a4 content:(id)a5 predictedByTagger:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = objc_alloc_init(AXLanguageTag);
  [(AXLanguageTag *)v12 setContent:v11];
  -[AXLanguageTag setRange:](v12, "setRange:", location, length);
  [(AXLanguageTag *)v12 setWasPredicted:v6];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "langMap", (void)v22);
        int v20 = [v19 isAmbiguous];

        if (v20) {
          [(AXLanguageTag *)v12 addAmbiguousDialect:v18];
        }
        else {
          [(AXLanguageTag *)v12 addUnambiguousDialect:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  return v12;
}

- (BOOL)hasAmbigiousDialects
{
  v2 = [(AXLanguageTag *)self ambiguousDialects];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (AXDialectMap)preferredAmbiguousDialect
{
  BOOL v3 = [(AXLanguageTag *)self ambiguousDialects];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(AXLanguageTag *)self ambiguousDialects];
    BOOL v6 = [v5 objectAtIndex:0];
  }
  else
  {
    BOOL v6 = 0;
  }

  return (AXDialectMap *)v6;
}

- (AXDialectMap)preferredUnambiguousDialect
{
  BOOL v3 = [(AXLanguageTag *)self unambiguousDialects];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(AXLanguageTag *)self unambiguousDialects];
    BOOL v6 = [v5 objectAtIndex:0];
  }
  else
  {
    BOOL v6 = 0;
  }

  return (AXDialectMap *)v6;
}

- (NSString)contentSubstring
{
  uint64_t v3 = [(AXLanguageTag *)self range];
  unint64_t v5 = v3 + v4;
  BOOL v6 = [(AXLanguageTag *)self content];
  unint64_t v7 = [v6 length];

  if (v5 > v7)
  {
    v8 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      [(AXLanguageTag *)self contentSubstring];
    }
  }
  uint64_t v9 = [(AXLanguageTag *)self range];
  unint64_t v11 = v9 + v10;
  v12 = [(AXLanguageTag *)self content];
  unint64_t v13 = [v12 length];

  if (v11 <= v13)
  {
    uint64_t v15 = [(AXLanguageTag *)self content];
    uint64_t v16 = [(AXLanguageTag *)self range];
    uint64_t v14 = objc_msgSend(v15, "substringWithRange:", v16, v17);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return (NSString *)v14;
}

- (AXDialectMap)dialect
{
  uint64_t v3 = [(AXLanguageTag *)self unambiguousDialects];

  if (v3)
  {
    uint64_t v4 = [(AXLanguageTag *)self preferredUnambiguousDialect];
  }
  else
  {
    unint64_t v5 = [(AXLanguageTag *)self preferredAmbiguousDialect];

    if (v5)
    {
      uint64_t v4 = [(AXLanguageTag *)self preferredAmbiguousDialect];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return (AXDialectMap *)v4;
}

- (void)addUnambiguousDialect:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AXLanguageTag *)self unambiguousDialects];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(AXLanguageTag *)self setUnambiguousDialects:v6];
  }
  id v7 = [(AXLanguageTag *)self unambiguousDialects];
  [v7 addObject:v4];
}

- (void)addAmbiguousDialect:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(AXLanguageTag *)self ambiguousDialects];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(AXLanguageTag *)self setAmbiguousDialects:v6];
  }
  id v7 = [(AXLanguageTag *)self ambiguousDialects];
  [v7 addObject:v4];
}

- (void)addAmbiguousDialects:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AXLanguageTag *)self addAmbiguousDialect:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addPredictedSecondaryDialects:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXLanguageTag *)self predictedSecondaryDialects];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(AXLanguageTag *)self setPredictedSecondaryDialects:v6];
  }
  id v7 = [(AXLanguageTag *)self predictedSecondaryDialects];
  [v7 unionOrderedSet:v4];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(AXLanguageTag *)self dialect];
  uint64_t v5 = [v4 specificLanguageID];
  id v6 = [(AXLanguageTag *)self contentSubstring];
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"$"];
  uint64_t v8 = [v3 stringWithFormat:@"%@ - %@", v5, v7];

  return v8;
}

- (BOOL)canBeSpokenByDialect:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(AXLanguageTag *)self contentSubstring];
  char v6 = [v4 canSpeakString:v5 allowsTransliteration:0];

  return v6;
}

- (BOOL)canBeSpokenByLanguage:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = +[AXLanguageManager sharedInstance];
  char v6 = [v5 dialectForLanguageID:v4];

  LOBYTE(self) = [(AXLanguageTag *)self canBeSpokenByDialect:v6];
  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_NSRange *)(v5 + 48) = self->_range;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  objc_storeWeak((id *)(v5 + 16), WeakRetained);

  uint64_t v7 = [(NSMutableOrderedSet *)self->_unambiguousDialects mutableCopyWithZone:a3];
  uint64_t v8 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v7;

  uint64_t v9 = [(NSMutableOrderedSet *)self->_ambiguousDialects mutableCopyWithZone:a3];
  long long v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  *(unsigned char *)(v5 + 8) = self->_wasPredicted;
  return (id)v5;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)content
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_content);

  return (NSString *)WeakRetained;
}

- (void)setContent:(id)a3
{
}

- (NSMutableOrderedSet)unambiguousDialects
{
  return self->_unambiguousDialects;
}

- (void)setUnambiguousDialects:(id)a3
{
}

- (NSMutableOrderedSet)ambiguousDialects
{
  return self->_ambiguousDialects;
}

- (void)setAmbiguousDialects:(id)a3
{
}

- (BOOL)wasPredicted
{
  return self->_wasPredicted;
}

- (void)setWasPredicted:(BOOL)a3
{
  self->_wasPredicted = a3;
}

- (NSMutableOrderedSet)predictedSecondaryDialects
{
  return self->_predictedSecondaryDialects;
}

- (void)setPredictedSecondaryDialects:(id)a3
{
}

- (BOOL)createdFromNewline
{
  return self->_createdFromNewline;
}

- (void)setCreatedFromNewline:(BOOL)a3
{
  self->_createdFromNewline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSecondaryDialects, 0);
  objc_storeStrong((id *)&self->_ambiguousDialects, 0);
  objc_storeStrong((id *)&self->_unambiguousDialects, 0);

  objc_destroyWeak((id *)&self->_content);
}

- (void)contentSubstring
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 content];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_fault_impl(&dword_18D308000, a2, OS_LOG_TYPE_FAULT, "The range of the tagged chunk is greater than the content. Something went awry %@", (uint8_t *)&v4, 0xCu);
}

@end