@interface _LTCombinedTranslationResult
+ (BOOL)supportsSecureCoding;
+ (id)_translatedTextWithAttributesForResult:(id)a3;
- (BOOL)isFinal;
- (NSArray)paragraphResults;
- (NSAttributedString)translatedText;
- (NSString)romanization;
- (_LTCombinedTranslationResult)initWithCoder:(id)a3;
- (_LTCombinedTranslationResult)initWithParagraphResults:(id)a3 localePair:(id)a4;
- (_LTDisambiguableResult)disambiguableResult;
- (_LTLocalePair)localePair;
- (int64_t)route;
- (void)encodeWithCoder:(id)a3;
- (void)setDisambiguableResult:(id)a3;
@end

@implementation _LTCombinedTranslationResult

- (_LTCombinedTranslationResult)initWithParagraphResults:(id)a3 localePair:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)_LTCombinedTranslationResult;
  v8 = [(_LTCombinedTranslationResult *)&v45 init];
  if (!v8)
  {
LABEL_19:
    v33 = 0;
    goto LABEL_31;
  }
  uint64_t v9 = [v6 copy];
  paragraphResults = v8->_paragraphResults;
  v8->_paragraphResults = (NSArray *)v9;

  if (![(NSArray *)v8->_paragraphResults count])
  {
    v32 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[_LTCombinedTranslationResult initWithParagraphResults:localePair:](v32);
    }
    goto LABEL_19;
  }
  v39 = v7;
  v40 = [v7 targetLocale];
  v11 = [(NSArray *)v8->_paragraphResults firstObject];
  uint64_t v12 = [v11 route];

  v13 = [(NSArray *)v8->_paragraphResults firstObject];
  int v14 = [v13 isFinal];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v15 = v8->_paragraphResults;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    id v38 = v6;
LABEL_5:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v42 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v41 + 1) + 8 * v19);
      v21 = [v20 locale];
      char v22 = [v21 isEqual:v40];

      if ((v22 & 1) == 0)
      {
        v34 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[_LTCombinedTranslationResult initWithParagraphResults:localePair:].cold.4(v34, v20);
        }
        goto LABEL_26;
      }
      if ([v20 route] != v12) {
        break;
      }
      if (v14 != [v20 isFinal])
      {
        v36 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[_LTCombinedTranslationResult initWithParagraphResults:localePair:](v14, v36, v20);
        }
LABEL_26:
        v33 = 0;
        id v6 = v38;
        id v7 = v39;
        goto LABEL_30;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v41 objects:v48 count:16];
        id v6 = v38;
        if (v17) {
          goto LABEL_5;
        }
        goto LABEL_13;
      }
    }
    v35 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[_LTCombinedTranslationResult initWithParagraphResults:localePair:](v35, v20);
    }
    goto LABEL_26;
  }
LABEL_13:

  id v7 = v39;
  uint64_t v23 = [v39 copy];
  localePair = v8->_localePair;
  v8->_localePair = (_LTLocalePair *)v23;

  v8->_route = v12;
  v8->_isFinal = v14;
  v15 = [(NSArray *)v8->_paragraphResults _ltCompactMap:&__block_literal_global];
  v25 = +[_LTDisambiguableResult combineResults:v15 joinedWithString:@"\n\n"];
  int v26 = [v25 hasDisambiguations];
  v27 = _LTOSLogDisambiguation();
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
  if (v26)
  {
    if (v28)
    {
      v29 = v8->_paragraphResults;
      v30 = v27;
      uint64_t v31 = [(NSArray *)v29 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v47 = v31;
      _os_log_impl(&dword_24639B000, v30, OS_LOG_TYPE_INFO, "Creating combined disambiguable result from %zu paragraphs since there are disambiguations somewhere", buf, 0xCu);
    }
    objc_storeStrong((id *)&v8->_disambiguableResult, v25);
  }
  else if (v28)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24639B000, v27, OS_LOG_TYPE_INFO, "Not creating combined disambiguable result for combined translation result since nothing in the result has disambiguations", buf, 2u);
  }
  v33 = v8;

LABEL_30:
LABEL_31:

  return v33;
}

- (NSAttributedString)translatedText
{
  uint64_t v3 = [(_LTCombinedTranslationResult *)self disambiguableResult];
  if (v3
    && (v4 = (void *)v3,
        BOOL v5 = +[_LTDisambiguableResult isGenderDisambiguationEnabled], v4, v5))
  {
    id v6 = objc_alloc(MEMORY[0x263F086A0]);
    id v7 = [(_LTCombinedTranslationResult *)self disambiguableResult];
    v8 = [v7 targetText];
    uint64_t v9 = (void *)[v6 initWithString:v8];
  }
  else
  {
    paragraphResults = self->_paragraphResults;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __46___LTCombinedTranslationResult_translatedText__block_invoke;
    v13[3] = &unk_2651DB610;
    v13[4] = self;
    v11 = [(NSArray *)paragraphResults _ltCompactMap:v13];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F086A0], "lt_attributedStringByJoiningComponents:withString:", v11, @"\n\n");
  }

  return (NSAttributedString *)v9;
}

- (NSString)romanization
{
  uint64_t v3 = [(_LTCombinedTranslationResult *)self disambiguableResult];

  if (v3)
  {
    v4 = [(_LTCombinedTranslationResult *)self disambiguableResult];
    uint64_t v5 = [v4 romanization];
LABEL_5:
    id v7 = (void *)v5;
    goto LABEL_7;
  }
  v4 = [(NSArray *)self->_paragraphResults _ltCompactMap:&__block_literal_global_6];
  NSUInteger v6 = [(NSArray *)self->_paragraphResults count];
  if (v6 == [v4 count])
  {
    uint64_t v5 = [v4 componentsJoinedByString:@"\n\n"];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return (NSString *)v7;
}

+ (id)_translatedTextWithAttributesForResult:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 alignments];
  uint64_t v5 = [v4 count];

  NSUInteger v6 = [v3 translations];
  uint64_t v7 = [v6 count];

  BOOL v9 = v5 == 1 && v7 == 1;
  if (!v5 || v9)
  {
    v21 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[_LTCombinedTranslationResult _translatedTextWithAttributesForResult:](v21);
    }
    char v22 = [v3 translations];
    v11 = [v22 firstObject];

    uint64_t v23 = [v11 sanitizedFormattedString];
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      uint64_t v26 = [v11 formattedString];
      v27 = (void *)v26;
      BOOL v28 = &stru_26FAADE68;
      if (v26) {
        BOOL v28 = (__CFString *)v26;
      }
      v25 = v28;
    }
    id v10 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v25];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x263F089B8]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v11 = objc_msgSend(v3, "alignments", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v17 = objc_alloc(MEMORY[0x263F086A0]);
          uint64_t v18 = [v16 text];
          uint64_t v19 = [v16 sourceAttributes];
          v20 = (void *)[v17 initWithString:v18 attributes:v19];

          [v10 appendAttributedString:v20];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v13);
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  paragraphResults = self->_paragraphResults;
  id v5 = a3;
  [v5 encodeObject:paragraphResults forKey:@"paragraphResults"];
  [v5 encodeObject:self->_disambiguableResult forKey:@"disambiguableResult"];
  [v5 encodeObject:self->_localePair forKey:@"localePair"];
  [v5 encodeInteger:self->_route forKey:@"route"];
  [v5 encodeBool:self->_isFinal forKey:@"isFinal"];
}

- (_LTCombinedTranslationResult)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_LTCombinedTranslationResult;
  id v5 = [(_LTCombinedTranslationResult *)&v20 init];
  if (v5)
  {
    NSUInteger v6 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"paragraphResults"];
    paragraphResults = v5->_paragraphResults;
    v5->_paragraphResults = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    uint64_t v13 = [v11 setWithArray:v12];

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"disambiguableResult"];
    disambiguableResult = v5->_disambiguableResult;
    v5->_disambiguableResult = (_LTDisambiguableResult *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localePair"];
    localePair = v5->_localePair;
    v5->_localePair = (_LTLocalePair *)v16;

    v5->_route = [v4 decodeIntegerForKey:@"route"];
    v5->_isFinal = [v4 decodeBoolForKey:@"isFinal"];
    uint64_t v18 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSArray)paragraphResults
{
  return self->_paragraphResults;
}

- (int64_t)route
{
  return self->_route;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (_LTDisambiguableResult)disambiguableResult
{
  return self->_disambiguableResult;
}

- (void)setDisambiguableResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguableResult, 0);
  objc_storeStrong((id *)&self->_paragraphResults, 0);

  objc_storeStrong((id *)&self->_localePair, 0);
}

- (void)initWithParagraphResults:(os_log_t)log localePair:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Not creating _LTCombinedTranslationResult instance because there are no paragraph results", v1, 2u);
}

- (void)initWithParagraphResults:(void *)a3 localePair:.cold.2(char a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = a1 & 1;
  id v5 = a2;
  v6[0] = 67109376;
  v6[1] = [a3 isFinal];
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_24639B000, v5, OS_LOG_TYPE_ERROR, "Not creating _LTCombinedTranslationResult instance because a translation result has isFinal %{BOOL}i, which is mismatched from other results with isFinal %{BOOL}i", (uint8_t *)v6, 0xEu);
}

- (void)initWithParagraphResults:(void *)a1 localePair:(void *)a2 .cold.3(void *a1, void *a2)
{
  id v3 = a1;
  [a2 route];
  OUTLINED_FUNCTION_0_0(&dword_24639B000, v4, v5, "Not creating _LTCombinedTranslationResult instance because a translation result has route %zd, which is mismatched from other results with route %zd", v6, v7, v8, v9, 0);
}

- (void)initWithParagraphResults:(void *)a1 localePair:(void *)a2 .cold.4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 locale];
  OUTLINED_FUNCTION_0_0(&dword_24639B000, v5, v6, "Not creating _LTCombinedTranslationResult instance because a translation result is locale %{public}@ instead of expected locale %{public}@", v7, v8, v9, v10, 2u);
}

+ (void)_translatedTextWithAttributesForResult:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24639B000, log, OS_LOG_TYPE_DEBUG, "Skipping alignment information in translation result since there's nothing to re-align", v1, 2u);
}

@end