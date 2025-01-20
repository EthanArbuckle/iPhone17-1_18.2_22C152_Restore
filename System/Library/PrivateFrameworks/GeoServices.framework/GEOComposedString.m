@interface GEOComposedString
+ (BOOL)hasLocalizationProvider;
+ (BOOL)supportsSecureCoding;
+ (id)localizationProvider;
+ (void)setLocalizationProvider:(id)a3;
- (BOOL)_updateString:(id)a3 withArgument:(id)a4 options:(id)a5 results:(id)a6 isFinalString:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (GEOComposedString)composedStringWithOptions:(id)a3;
- (GEOComposedString)initWithCoder:(id)a3;
- (GEOComposedString)initWithGeoFormattedString:(id)a3;
- (GEOComposedString)initWithString:(id)a3;
- (GEOComposedString)stringWithDefaultOptions;
- (GEOComposedString)stringWithOptions:(id)a3;
- (NSArray)arguments;
- (id)_attributedStringForStrings:(id)a3 joinedBySeparators:(id)a4;
- (id)_processAttributedString:(id)a3 withOptions:(id)a4 isFinalString:(BOOL)a5;
- (id)_stringForStrings:(id)a3 joinedBySeparators:(id)a4;
- (id)_stringResultWithOptions:(id)a3 isFinalString:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultOptions;
- (id)description;
- (id)optionsWithArgumentHandler:(id)a3;
- (id)stringResultWithOptions:(id)a3;
- (void)_updateForFormatStylesInString:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedString

- (GEOComposedString)initWithGeoFormattedString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 formatStrings],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7)
    && (v35.receiver = self,
        v35.super_class = (Class)GEOComposedString,
        (self = [(GEOComposedString *)&v35 init]) != 0))
  {
    v8 = [v5 formatStrings];
    v9 = (NSArray *)[v8 copy];
    formatStrings = self->_formatStrings;
    self->_formatStrings = v9;

    v11 = [v5 formatArguments];
    objc_msgSend(v11, "_geo_compactMap:", &__block_literal_global_82);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    arguments = self->_arguments;
    self->_arguments = v12;

    v14 = [v5 separators];
    v15 = (NSArray *)[v14 copy];
    separators = self->_separators;
    self->_separators = v15;

    v17 = [v5 formatStyles];
    objc_msgSend(v17, "_geo_map:", &__block_literal_global_3_0);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    formatStyles = self->_formatStyles;
    self->_formatStyles = v18;

    v20 = [v5 alternativeString];

    if (v20)
    {
      v21 = [GEOComposedString alloc];
      v22 = [v5 alternativeString];
      v23 = [v22 formattedString];
      v24 = [(GEOComposedString *)v21 initWithGeoFormattedString:v23];
      alternativeString = self->_alternativeString;
      self->_alternativeString = v24;

      v26 = [GEOComposedStringCondition alloc];
      v27 = [v5 alternativeString];
      v28 = [v27 condition];
      v29 = [(GEOComposedStringCondition *)v26 initWithGeoCondition:v28];
      alternativeStringCondition = self->_alternativeStringCondition;
      self->_alternativeStringCondition = v29;
    }
    v31 = [v5 metaData];
    BOOL v32 = [v31 spokenPrivacyFilterType] != 1;

    self->_isPrivate = v32;
    self = self;
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

id __48__GEOComposedString_initWithGeoFormattedString___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOComposedStringArgument argumentForGeoFormatArgument:a2];
}

_DWORD *__48__GEOComposedString_initWithGeoFormattedString___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (_DWORD *)objc_opt_new();
  id v4 = [v2 token];
  v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 16);

    v3[2] = [v2 type];
  }
  else
  {

    [v2 type];
  }

  return v3;
}

- (GEOComposedString)initWithString:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)GEOComposedString,
        (self = [(GEOComposedString *)&v9 init]) != 0))
  {
    v10[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    formatStrings = self->_formatStrings;
    self->_formatStrings = v5;

    self->_isPrivate = 0;
    self = self;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)defaultOptions
{
  v3 = objc_alloc_init(GEOComposedStringOptions);
  id v4 = [(NSArray *)self->_arguments _geo_map:&__block_literal_global_11_1];
  [(GEOComposedStringOptions *)v3 setArguments:v4];

  return v3;
}

id __35__GEOComposedString_defaultOptions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 copy];

  return v2;
}

- (id)optionsWithArgumentHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  v5 = [(GEOComposedString *)self defaultOptions];
  v6 = v5;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = objc_msgSend(v5, "arguments", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }

  return v6;
}

- (id)stringResultWithOptions:(id)a3
{
  return [(GEOComposedString *)self _stringResultWithOptions:a3 isFinalString:1];
}

- (GEOComposedString)stringWithOptions:(id)a3
{
  v3 = [(GEOComposedString *)self _stringResultWithOptions:a3 isFinalString:1];
  id v4 = [v3 string];

  return (GEOComposedString *)v4;
}

- (GEOComposedString)stringWithDefaultOptions
{
  v3 = [(GEOComposedString *)self defaultOptions];
  id v4 = [(GEOComposedString *)self _stringResultWithOptions:v3 isFinalString:1];
  v5 = [v4 string];

  return (GEOComposedString *)v5;
}

- (GEOComposedString)composedStringWithOptions:(id)a3
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4) {
    *((unsigned char *)v4 + 11) = 1;
  }
  v6 = objc_opt_new();
  if (![v5 shouldUpdateFormatStrings])
  {
    v59 = v6;
    v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_arguments, "count"));
    arguments = self->_arguments;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __47__GEOComposedString_composedStringWithOptions___block_invoke;
    v66[3] = &unk_1E53E20D0;
    id v7 = v31;
    id v67 = v7;
    [(NSArray *)arguments enumerateObjectsUsingBlock:v66];
    v60 = v5;
    v61 = (void *)[(NSArray *)self->_arguments mutableCopy];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v33 = [v5 arguments];
    uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v63 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v39 = [v38 token];
          v40 = [v7 objectForKeyedSubscript:v39];

          if (v40)
          {
            unint64_t v41 = [v40 unsignedIntegerValue];
            if (v41 < [(NSArray *)self->_arguments count])
            {
              id v42 = v7;
              v43 = self;
              v44 = objc_msgSend(v61, "objectAtIndexedSubscript:", objc_msgSend(v40, "unsignedIntegerValue"));
              int v45 = [v44 type];
              if (v45 == [v38 type]) {
                objc_msgSend(v61, "replaceObjectAtIndex:withObject:", objc_msgSend(v40, "unsignedIntegerValue"), v38);
              }

              self = v43;
              id v7 = v42;
            }
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v35);
    }

    uint64_t v46 = [(NSArray *)self->_formatStrings copy];
    v6 = v59;
    v47 = (void *)v59[1];
    v59[1] = v46;

    v48 = (void *)v59[2];
    v59[2] = v61;
    v49 = self;
    id v50 = v61;

    uint64_t v51 = [(NSArray *)v49->_separators copy];
    v52 = (void *)v59[3];
    v59[3] = v51;

    uint64_t v53 = [(GEOComposedString *)v49->_alternativeString copy];
    v54 = (void *)v59[5];
    v59[5] = v53;

    uint64_t v55 = [(GEOComposedStringCondition *)v49->_alternativeStringCondition copy];
    v56 = (void *)v59[6];
    v59[6] = v55;

    *((unsigned char *)v59 + 56) = v49->_isPrivate;
    uint64_t v9 = v67;
    v5 = v60;
    goto LABEL_29;
  }
  id v7 = [(GEOComposedString *)self _stringResultWithOptions:v5 isFinalString:0];
  uint64_t v8 = [v7 string];

  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v10 = [v7 tokenReplacementResults];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unint64_t v12 = 0;
      do
      {
        long long v13 = [v7 tokenReplacementResults];
        long long v14 = [v13 objectAtIndexedSubscript:v12];

        if ([v14 success]) {
          [v9 addIndex:v12];
        }

        ++v12;
        long long v15 = [v7 tokenReplacementResults];
        unint64_t v16 = [v15 count];
      }
      while (v12 < v16);
    }
    v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_arguments, "count"));
    if ([(NSArray *)self->_arguments count])
    {
      unint64_t v18 = 0;
      do
      {
        if (([v9 containsIndex:v18] & 1) == 0)
        {
          v19 = [(NSArray *)self->_arguments objectAtIndexedSubscript:v18];
          v20 = (void *)[v19 copy];
          [v17 addObject:v20];
        }
        ++v18;
      }
      while (v18 < [(NSArray *)self->_arguments count]);
    }
    v21 = [v7 string];
    v69[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
    v23 = (void *)v6[1];
    v6[1] = v22;

    v24 = self;
    v25 = (void *)v6[2];
    v6[2] = v17;
    id v26 = v17;

    uint64_t v27 = [(GEOComposedString *)v24->_alternativeString copy];
    v28 = (void *)v6[5];
    v6[5] = v27;

    uint64_t v29 = [(GEOComposedStringCondition *)v24->_alternativeStringCondition copy];
    v30 = (void *)v6[6];
    v6[6] = v29;

LABEL_29:
    v57 = v6;
    goto LABEL_30;
  }

  v57 = 0;
LABEL_30:

  return (GEOComposedString *)v57;
}

void __47__GEOComposedString_composedStringWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSNumber;
  id v6 = a2;
  id v9 = [v5 numberWithUnsignedInteger:a3];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 token];

  [v7 setObject:v9 forKeyedSubscript:v8];
}

- (id)_stringResultWithOptions:(id)a3 isFinalString:(BOOL)a4
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = 0x1E4F1C000uLL;
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_formatStrings, "count"));
  if ([v6 preserveIndividualComponents])
  {
    BOOL v58 = a4;
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_formatStrings, "count"));
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v10 = self;
    uint64_t v11 = self->_formatStrings;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v74 objects:v81 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v75 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:*(void *)(*((void *)&v74 + 1) + 8 * i)];
          [v9 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v74 objects:v81 count:16];
      }
      while (v13);
    }

    v17 = (void *)[v9 copy];
    self = v10;
    unint64_t v7 = 0x1E4F1C000;
    a4 = v58;
  }
  else
  {
    id v9 = [(GEOComposedString *)self _stringForStrings:self->_formatStrings joinedBySeparators:self->_separators];
    if (v9)
    {
      unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9];
      v80 = v18;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
    }
    else
    {
      v17 = 0;
    }
  }

  [v8 addObjectsFromArray:v17];
  v19 = objc_msgSend(objc_alloc(*(Class *)(v7 + 2632)), "initWithCapacity:", objc_msgSend(v17, "count"));
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __60__GEOComposedString__stringResultWithOptions_isFinalString___block_invoke;
  void v69[3] = &unk_1E53E20F8;
  v69[4] = self;
  id v20 = v6;
  id v70 = v20;
  BOOL v73 = a4;
  id v21 = v8;
  id v71 = v21;
  id v22 = v19;
  id v72 = v22;
  [v17 enumerateObjectsUsingBlock:v69];
  if (![v22 count])
  {
    id v26 = objc_alloc_init(GEOComposedStringReplacementResult);
    v24 = v26;
    v25 = 0;
    if (!v26) {
      goto LABEL_50;
    }
    v26->success = 0;
    goto LABEL_49;
  }
  if ([v22 count] == 1)
  {
    v24 = [v22 firstObject];
    v25 = 0;
  }
  else
  {
    id v56 = v20;
    if (([v20 preserveIndividualComponents] & 1) == 0)
    {
      uint64_t v27 = GEOGetGEOComposedStringLog_0();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_FAULT, "Multiple results when we expected to have pre-joined the components and separators", buf, 2u);
      }
    }
    v57 = v17;
    v59 = self;
    v24 = objc_alloc_init(GEOComposedStringReplacementResult);
    v28 = objc_msgSend(objc_alloc(*(Class *)(v7 + 2632)), "initWithCapacity:", objc_msgSend(v22, "count"));
    uint64_t v29 = objc_msgSend(objc_alloc(*(Class *)(v7 + 2632)), "initWithCapacity:", objc_msgSend(v22, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v54 = v22;
    id v30 = v22;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v64 objects:v79 count:16];
    id v55 = v21;
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v65;
      char v34 = 1;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v65 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v36 = *(void **)(*((void *)&v64 + 1) + 8 * j);
          if (v34) {
            char v34 = [*(id *)(*((void *)&v64 + 1) + 8 * j) success];
          }
          else {
            char v34 = 0;
          }
          v37 = [v36 tokenReplacementResults];
          [v28 addObjectsFromArray:v37];

          v38 = [v36 styleReplacementResults];
          [v29 addObjectsFromArray:v38];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v64 objects:v79 count:16];
      }
      while (v32);
    }
    else
    {
      char v34 = 1;
    }

    if (v24) {
      v24->success = v34;
    }
    v39 = (void *)[v28 copy];
    -[GEOComposedStringReplacementResult setTokenReplacementResults:]((uint64_t)v24, v39);

    v40 = (void *)[v29 copy];
    -[GEOComposedStringReplacementResult setStyleReplacementResults:]((uint64_t)v24, v40);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v59->_separators, "count"));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    unint64_t v41 = v59->_separators;
    uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v60 objects:v78 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v61 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(*((void *)&v60 + 1) + 8 * k)];
          [v25 addObject:v46];
        }
        uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v60 objects:v78 count:16];
      }
      while (v43);
    }

    id v21 = v55;
    v48 = [(GEOComposedString *)v59 _attributedStringForStrings:v55 joinedBySeparators:v25];
    id v22 = v54;
    if (v24) {
      objc_setProperty_nonatomic_copy(v24, v47, v48, 24);
    }

    v49 = [(GEOComposedStringReplacementResult *)v24 attributedString];
    uint64_t v51 = [v49 string];
    if (v24) {
      objc_setProperty_nonatomic_copy(v24, v50, v51, 16);
    }

    id v20 = v56;
    v17 = v57;
  }
  if (v24)
  {
LABEL_49:
    objc_setProperty_nonatomic_copy(v24, v23, v21, 32);
    objc_setProperty_nonatomic_copy(v24, v52, v25, 40);
  }
LABEL_50:

  return v24;
}

void __60__GEOComposedString__stringResultWithOptions_isFinalString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [*(id *)(a1 + 32) _processAttributedString:a2 withOptions:*(void *)(a1 + 40) isFinalString:*(unsigned __int8 *)(a1 + 64)];
  if (([v7 success] & 1) == 0)
  {
    v5 = *(void **)(a1 + 48);
    id v6 = [v7 attributedString];
    [v5 replaceObjectAtIndex:a3 withObject:v6];
  }
  [*(id *)(a1 + 56) addObject:v7];
}

- (id)_processAttributedString:(id)a3 withOptions:(id)a4 isFinalString:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(GEOComposedString *)self _updateForFormatStylesInString:v8 options:v9];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v11 = [v9 arguments];
  uint64_t v12 = [v11 count];
  uint64_t v13 = v10;
  uint64_t v14 = v9;
  uint64_t v51 = [v13 arrayWithCapacity:v12];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v15 = [v9 arguments];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v62;
    int v19 = 1;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v62 != v18) {
          objc_enumerationMutation(v15);
        }
        v19 &= [(GEOComposedString *)self _updateString:v8 withArgument:*(void *)(*((void *)&v61 + 1) + 8 * i) options:v14 results:v51 isFinalString:v5];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v17);

    if (!(v19 | !v5))
    {
      if (self->_alternativeString
        && [(GEOComposedStringCondition *)self->_alternativeStringCondition conditionType] == 5)
      {
        id v21 = GEOGetGEOComposedStringLog_0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          alternativeString = self->_alternativeString;
          *(_DWORD *)buf = 138412290;
          long long v67 = alternativeString;
          _os_log_impl(&dword_188D96000, v21, OS_LOG_TYPE_ERROR, "Token replacement failed. Falling back to alternative string: %@", buf, 0xCu);
        }

        v23 = self->_alternativeString;
        v24 = [(GEOComposedString *)v23 defaultOptions];
        v25 = [(GEOComposedString *)v23 stringResultWithOptions:v24];

        id v26 = v51;
      }
      else
      {
        uint64_t v42 = GEOGetGEOComposedStringLog_0();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_ERROR, "Token replacement failed. No alternative string was provided, returning empty string.", buf, 2u);
        }

        uint64_t v43 = objc_alloc_init(GEOComposedStringReplacementResult);
        v25 = v43;
        if (v43)
        {
          v43->success = 0;
          objc_setProperty_nonatomic_copy(v43, v44, &stru_1ED51F370, 16);
        }
        uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED51F370];
        if (v25) {
          objc_setProperty_nonatomic_copy(v25, v45, v46, 24);
        }

        id v26 = v51;
        -[GEOComposedStringReplacementResult setTokenReplacementResults:]((uint64_t)v25, v51);
      }
      goto LABEL_39;
    }
  }
  else
  {

    LOBYTE(v19) = 1;
  }
  if ([(NSArray *)self->_formatStyles count])
  {
    v48 = v14;
    id v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_formatStyles, "count"));
    uint64_t v27 = [v8 length];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = self->_formatStyles;
    uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v58;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v57 + 1) + 8 * v31);
          if (v32) {
            uint64_t v33 = *(void **)(v32 + 16);
          }
          else {
            uint64_t v33 = 0;
          }
          id v34 = v33;
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __72__GEOComposedString__processAttributedString_withOptions_isFinalString___block_invoke;
          v52[3] = &unk_1E53E2120;
          id v35 = v8;
          id v53 = v35;
          id v54 = v34;
          uint64_t v55 = v32;
          id v56 = v50;
          id v36 = v34;
          objc_msgSend(v35, "enumerateAttribute:inRange:options:usingBlock:", v36, 0, v27, 0, v52);
          objc_msgSend(v35, "removeAttribute:range:", v36, 0, v27);

          ++v31;
        }
        while (v29 != v31);
        uint64_t v37 = [(NSArray *)obj countByEnumeratingWithState:&v57 objects:v65 count:16];
        uint64_t v29 = v37;
      }
      while (v37);
    }

    uint64_t v14 = v48;
  }
  else
  {
    id v50 = 0;
  }
  v38 = objc_alloc_init(GEOComposedStringReplacementResult);
  v25 = v38;
  id v26 = v51;
  if (v38)
  {
    v38->success = v19;
    v39 = [v8 string];
    objc_setProperty_nonatomic_copy(v25, v40, v39, 16);

    objc_setProperty_nonatomic_copy(v25, v41, v8, 24);
  }
  else
  {
    [v8 string];
  }
  -[GEOComposedStringReplacementResult setTokenReplacementResults:]((uint64_t)v25, v51);
  -[GEOComposedStringReplacementResult setStyleReplacementResults:]((uint64_t)v25, v50);

LABEL_39:

  return v25;
}

void __72__GEOComposedString__processAttributedString_withOptions_isFinalString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    self = (id)objc_opt_new();
    id v7 = [*(id *)(a1 + 32) string];
    id v8 = objc_msgSend(v7, "substringWithRange:", a3, a4);
    id v9 = v8;
    if (self)
    {
      objc_setProperty_nonatomic_copy(self, (SEL)self, v8, 16);

      *((void *)self + 5) = a3;
      *((void *)self + 6) = a4;
      objc_setProperty_nonatomic_copy(self, v10, *(id *)(a1 + 40), 24);
    }
    else
    {
    }
    uint64_t v11 = *(void *)(a1 + 48);
    if (v11) {
      LODWORD(v11) = *(_DWORD *)(v11 + 8);
    }
    if (self) {
      *((_DWORD *)self + 2) = v11;
    }
    [*(id *)(a1 + 56) addObject:self];
  }
}

- (id)_attributedStringForStrings:(id)a3 joinedBySeparators:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 count];
  if (v7 <= [v6 count] + 1)
  {
    unint64_t v10 = [v5 count];
    if (v10 < [v6 count] + 1)
    {
      uint64_t v11 = GEOGetGEOComposedStringLog_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v16 = 67109376;
        int v17 = [v5 count];
        __int16 v18 = 1024;
        int v19 = [v6 count];
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Number of attributed strings (%d) is less than number of separators (%d) + 1. Some separators will be ignored.", (uint8_t *)&v16, 0xEu);
      }
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    if ([v5 count])
    {
      unint64_t v12 = 0;
      do
      {
        uint64_t v13 = [v5 objectAtIndexedSubscript:v12];
        if ([v13 length])
        {
          [v9 appendAttributedString:v13];
          if (v12 < [v5 count] - 1)
          {
            uint64_t v14 = [v6 objectAtIndexedSubscript:v12];
            [v9 appendAttributedString:v14];
          }
        }

        ++v12;
      }
      while (v12 < [v5 count]);
    }
  }
  else
  {
    id v8 = GEOGetGEOComposedStringLog_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 67109376;
      int v17 = [v5 count];
      __int16 v18 = 1024;
      int v19 = [v6 count];
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Number of attributed strings (%d) is greater than number of separators (%d) + 1. Unable to join attributed strings.", (uint8_t *)&v16, 0xEu);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)_stringForStrings:(id)a3 joinedBySeparators:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 count];
  if (v7 <= [v6 count] + 1)
  {
    unint64_t v10 = [v5 count];
    if (v10 < [v6 count] + 1)
    {
      uint64_t v11 = GEOGetGEOComposedStringLog_0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        int v18 = [v5 count];
        __int16 v19 = 1024;
        int v20 = [v6 count];
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Number of strings (%d) is less than number of separators (%d) + 1. Some separators will be ignored.", buf, 0xEu);
      }
    }
    id v9 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v12 = 0;
      do
      {
        unint64_t v13 = [v5 count] - 1;
        uint64_t v14 = [v5 objectAtIndexedSubscript:v12];
        if (v12 >= v13)
        {
          [v9 appendString:v14];
        }
        else
        {
          long long v15 = [v6 objectAtIndexedSubscript:v12];
          [v9 appendFormat:@"%@%@", v14, v15];
        }
        ++v12;
      }
      while (v12 < [v5 count]);
    }
  }
  else
  {
    id v8 = GEOGetGEOComposedStringLog_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v18 = [v5 count];
      __int16 v19 = 1024;
      int v20 = [v6 count];
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "Number of strings (%d) is greater than number of separators (%d) + 1. Unable to join strings.", buf, 0xEu);
    }

    id v9 = 0;
  }

  return v9;
}

- (void)_updateForFormatStylesInString:(id)a3 options:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [GEOServerFormatStyleParser alloc];
    uint64_t v31 = v6;
    id v9 = [v6 string];
    uint64_t v10 = [(GEOServerFormatStyleParser *)v8 initWithString:v9];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    obuint64_t j = self->_formatStyles;
    uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    uint64_t v30 = (void *)v10;
    if (!v11)
    {
      unint64_t v13 = 0;
      goto LABEL_31;
    }
    uint64_t v12 = v11;
    uint64_t v32 = self;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v35;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * v15);
        if (!v13)
        {
          unint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v32->_formatStyles, "count"));
        }
        int v17 = objc_opt_new();
        if (v16)
        {
          int v18 = [NSNumber numberWithInt:*(unsigned int *)(v16 + 8)];
          uint64_t v19 = *(void *)(v16 + 16);
        }
        else
        {
          int v18 = [NSNumber numberWithInt:0];
          uint64_t v19 = 0;
        }
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v19, v30);

        if (![v7 createAttributedString]) {
          goto LABEL_20;
        }
        int v20 = [v7 formatStyleHandler];

        if (!v20)
        {
          v25 = GEOGetGEOComposedStringLog_0();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v32;
            _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_FAULT, "No formatStyleHandler was provided for string with format styles:\n%@", buf, 0xCu);
          }

LABEL_20:
          v24 = 0;
          goto LABEL_21;
        }
        uint64_t v21 = [v7 formatStyleHandler];
        id v22 = (void *)v21;
        if (v16) {
          uint64_t v23 = *(unsigned int *)(v16 + 8);
        }
        else {
          uint64_t v23 = 0;
        }
        v24 = (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, v23);

        if (v24) {
          [v17 addEntriesFromDictionary:v24];
        }
LABEL_21:
        if (v16) {
          uint64_t v26 = *(void *)(v16 + 16);
        }
        else {
          uint64_t v26 = 0;
        }
        [v13 setObject:v17 forKeyedSubscript:v26];

        ++v15;
      }
      while (v12 != v15);
      uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      uint64_t v12 = v27;
      if (!v27)
      {
LABEL_31:

        uint64_t v28 = [v7 stringAttributes];
        uint64_t v29 = [v30 attributedStringWithStyleAttributes:v13 defaultAttributes:v28];

        id v6 = v31;
        [v31 setAttributedString:v29];

        break;
      }
    }
  }
}

- (BOOL)_updateString:(id)a3 withArgument:(id)a4 options:(id)a5 results:(id)a6 isFinalString:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = a5;
  id v62 = a6;
  uint64_t v15 = [v13 token];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
    uint64_t v28 = GEOGetGEOComposedStringLog_0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [v13 type];
      if v29 < 0x13 && ((0x7FF7Fu >> v29))
      {
        uint64_t v30 = off_1E53E2180[(int)v29];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
        uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 138543362;
      long long v64 = v30;
      _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Error replacing token because argument of type %{public}@ has no token.", buf, 0xCu);
    }
    goto LABEL_50;
  }
  int v17 = [v12 string];
  int v18 = [v13 token];
  unint64_t v19 = objc_msgSend(v17, "rangeOfString:options:range:", v18, 0, 0, objc_msgSend(v12, "length"));
  uint64_t v21 = v20;

  if (v21)
  {
    id v22 = [v12 string];
    unint64_t v23 = [v22 length];

    if (v19 < v23)
    {
      v24 = objc_opt_new();
      char v25 = [v14 createAttributedString];
      if (v24) {
        LOBYTE(v24[1].isa) = v25;
      }
      if (v14 && v14[11]) {
        int v26 = [v14 shouldUpdateFormatStrings] ^ 1;
      }
      else {
        LOBYTE(v26) = 1;
      }
      long long v61 = v14;
      if (v24)
      {
        BYTE1(v24[1].isa) = v26;
        uint64_t v33 = [v12 attributesAtIndex:v19 effectiveRange:0];
        objc_setProperty_nonatomic_copy(v24, v34, v33, 16);
      }
      else
      {
        uint64_t v33 = [v12 attributesAtIndex:v19 effectiveRange:0];
      }

      long long v60 = v24;
      long long v35 = [v13 replaceTokenWithOptions:v24];
      char v36 = [v35 success];
      BOOL v27 = v36;
      if (v36)
      {
        BOOL v59 = v36;
        if ([v14 createAttributedString])
        {
          long long v37 = [v35 attributedString];
        }
        else
        {
          id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v42 = [v35 string];
          long long v37 = (void *)[v41 initWithString:v42];
        }
        do
        {
          if ([v61 createAttributedString])
          {
            uint64_t v43 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v37];
            uint64_t v44 = [v12 attributesAtIndex:v19 effectiveRange:0];
            if (v44)
            {
              uint64_t v45 = [v43 length];
              objc_msgSend(v43, "addAttributes:range:", v44, 0, v45);
              uint64_t v46 = [v13 stringAttributes];

              if (v46)
              {
                v47 = [v13 stringAttributes];
                objc_msgSend(v43, "addAttributes:range:", v47, 0, v45);
              }
              id v48 = v43;

              long long v37 = v48;
            }
          }
          objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", v19, v21, v37);
          uint64_t v49 = [v37 length];
          [v35 range];
          if (v50)
          {
            uint64_t v51 = [v35 copy];

            long long v35 = (void *)v51;
          }
          if (v35)
          {
            v35[4] = v19;
            v35[5] = v49;
          }
          [v62 addObject:v35];
          unint64_t v52 = v49 + v19;
          if ([v12 length] >= v52) {
            unint64_t v53 = [v12 length] - v52;
          }
          else {
            unint64_t v53 = 0;
          }
          id v54 = [v12 string];
          uint64_t v55 = [v13 token];
          unint64_t v19 = objc_msgSend(v54, "rangeOfString:options:range:", v55, 0, v52, v53);
          uint64_t v21 = v56;
        }
        while (v21);

        BOOL v27 = v59;
      }
      else if (v7)
      {
        BOOL v38 = v36;
        v39 = GEOGetGEOComposedStringLog_0();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          SEL v40 = [v13 token];
          *(_DWORD *)buf = 138543362;
          long long v64 = v40;
          _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_ERROR, "Error replacing token %{public}@ because no override value was provided and it has no default value.", buf, 0xCu);
        }
        BOOL v27 = v38;
      }

      uint64_t v28 = v60;
      uint64_t v14 = v61;
      goto LABEL_51;
    }
  }
  if (([v14 preserveIndividualComponents] & 1) == 0)
  {
    uint64_t v28 = GEOGetGEOComposedStringLog_0();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      uint64_t v31 = [v13 type];
      if v31 < 0x13 && ((0x7FF7Fu >> v31))
      {
        uint64_t v32 = off_1E53E2180[(int)v31];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
        uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      long long v57 = [v13 token];
      *(_DWORD *)buf = 138543875;
      long long v64 = v32;
      __int16 v65 = 2114;
      long long v66 = v57;
      __int16 v67 = 2113;
      v68 = self;
      _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_FAULT, "Error using argument %{public}@ because token %{public}@ was not found in format string: %{private}@", buf, 0x20u);
    }
LABEL_50:
    BOOL v27 = 1;
LABEL_51:

    goto LABEL_52;
  }
  BOOL v27 = 1;
LABEL_52:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_formatStrings copyItems:1];
  id v6 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v5;

  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_arguments copyItems:1];
  id v8 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v7;

  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_separators copyItems:1];
  uint64_t v10 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v9;

  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_formatStyles copyItems:1];
  id v12 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v11;

  uint64_t v13 = [(GEOComposedString *)self->_alternativeString copy];
  uint64_t v14 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v13;

  uint64_t v15 = [(GEOComposedStringCondition *)self->_alternativeStringCondition copy];
  uint64_t v16 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v15;

  *(unsigned char *)(v4 + 56) = self->_isPrivate;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOComposedString;
  uint64_t v5 = [(GEOComposedString *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_formatStrings"];
    formatStrings = v5->_formatStrings;
    v5->_formatStrings = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_arguments"];
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_separators"];
    separators = v5->_separators;
    v5->_separators = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_formatStyles"];
    formatStyles = v5->_formatStyles;
    v5->_formatStyles = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alternativeString"];
    alternativeString = v5->_alternativeString;
    v5->_alternativeString = (GEOComposedString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alternativeStringCondition"];
    alternativeStringCondition = v5->_alternativeStringCondition;
    v5->_alternativeStringCondition = (GEOComposedStringCondition *)v16;

    v5->_isPrivate = [v4 decodeBoolForKey:@"_isPrivate"];
    int v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  formatStrings = self->_formatStrings;
  id v5 = a3;
  [v5 encodeObject:formatStrings forKey:@"_formatStrings"];
  [v5 encodeObject:self->_arguments forKey:@"_arguments"];
  [v5 encodeObject:self->_separators forKey:@"_separators"];
  [v5 encodeObject:self->_formatStyles forKey:@"_formatStyles"];
  [v5 encodeObject:self->_alternativeString forKey:@"_alternativeString"];
  [v5 encodeObject:self->_alternativeStringCondition forKey:@"_alternativeStringCondition"];
  [v5 encodeBool:self->_isPrivate forKey:@"_isPrivate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    uint64_t v6 = (void *)v5[1];
    unint64_t v7 = self->_formatStrings;
    unint64_t v8 = v6;
    if (v7 | v8)
    {
      uint64_t v9 = (void *)v8;
      int v10 = [(id)v7 isEqual:v8];

      if (!v10) {
        goto LABEL_16;
      }
    }
    uint64_t v11 = (void *)v5[2];
    unint64_t v12 = self->_arguments;
    unint64_t v13 = v11;
    if (v12 | v13)
    {
      uint64_t v14 = (void *)v13;
      int v15 = [(id)v12 isEqual:v13];

      if (!v15) {
        goto LABEL_16;
      }
    }
    uint64_t v16 = (void *)v5[3];
    unint64_t v17 = self->_separators;
    unint64_t v18 = v16;
    if (v17 | v18)
    {
      unint64_t v19 = (void *)v18;
      int v20 = [(id)v17 isEqual:v18];

      if (!v20) {
        goto LABEL_16;
      }
    }
    uint64_t v21 = (void *)v5[4];
    unint64_t v22 = self->_formatStyles;
    unint64_t v23 = v21;
    if (v22 | v23)
    {
      v24 = (void *)v23;
      int v25 = [(id)v22 isEqual:v23];

      if (!v25) {
        goto LABEL_16;
      }
    }
    int v26 = (void *)v5[5];
    unint64_t v27 = self->_alternativeString;
    unint64_t v28 = v26;
    if (v27 | v28)
    {
      uint64_t v29 = (void *)v28;
      BOOL v30 = [(id)v27 isEqual:v28];

      if (!v30) {
        goto LABEL_16;
      }
    }
    uint64_t v31 = (void *)v5[6];
    unint64_t v32 = self->_alternativeStringCondition;
    unint64_t v33 = v31;
    if (v32 | v33
      && (v34 = (void *)v33, BOOL v35 = [(id)v32 isEqual:v33],
                             v34,
                             (id)v32,
                             !v35))
    {
LABEL_16:
      BOOL v36 = 0;
    }
    else
    {
      BOOL v36 = self->_isPrivate == *((unsigned __int8 *)v5 + 56);
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)GEOComposedString;
  v3 = [(GEOComposedString *)&v13 description];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(NSArray *)self->_formatStrings _geo_map:&__block_literal_global_56];
  uint64_t v6 = [(NSArray *)self->_separators _geo_map:&__block_literal_global_61_0];
  unint64_t v7 = [(GEOComposedString *)self _stringForStrings:v5 joinedBySeparators:v6];
  unint64_t v8 = (void *)[v7 mutableCopy];
  [v4 appendString:v8];

  if ([(NSArray *)self->_arguments count])
  {
    uint64_t v9 = [(NSArray *)self->_arguments componentsJoinedByString:@"\n\t"];
    [v4 appendFormat:@"\n\t%@", v9];
  }
  if ([(NSArray *)self->_formatStyles count])
  {
    int v10 = [(NSArray *)self->_formatStyles _geo_map:&__block_literal_global_73];
    uint64_t v11 = [v10 componentsJoinedByString:@"\n\t"];
    [v4 appendFormat:@"\n\t%@", v11];
  }
  if (self->_alternativeString) {
    [v4 appendFormat:@"\n\tAlternative: %@", self->_alternativeString];
  }

  return v4;
}

uint64_t __32__GEOComposedString_description__block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"\"%@\"", a2];
}

uint64_t __32__GEOComposedString_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@" \"%@\" ", a2];
}

id __32__GEOComposedString_description__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (unsigned int *)v2;
  id v4 = NSString;
  if (v2)
  {
    id v5 = *((id *)v2 + 2);
    uint64_t v6 = @"DEFAULT";
    switch(v3[2])
    {
      case 0u:
        break;
      case 1u:
        uint64_t v6 = @"REAL_TIME_ON_TIME";
        break;
      case 2u:
        uint64_t v6 = @"REAL_TIME_DELAYS";
        break;
      case 3u:
        uint64_t v6 = @"CLICKABLE";
        break;
      default:
        objc_msgSend((id)cfstr_Default_0.length, "stringWithFormat:", @"(unknown: %i)", v3[2]);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
    id v5 = 0;
    uint64_t v6 = @"DEFAULT";
  }
  unint64_t v7 = [v4 stringWithFormat:@"{s:%@} [GEOFormatStyle_FormatStyleType_%@]", v5, v6];

  return v7;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeStringCondition, 0);
  objc_storeStrong((id *)&self->_alternativeString, 0);
  objc_storeStrong((id *)&self->_formatStyles, 0);
  objc_storeStrong((id *)&self->_separators, 0);
  objc_storeStrong((id *)&self->_arguments, 0);

  objc_storeStrong((id *)&self->_formatStrings, 0);
}

+ (id)localizationProvider
{
  id v2 = (void *)_localizationProvider;
  if (_localizationProvider)
  {
    id v3 = (id)_localizationProvider;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GEOComposedString.localizationProvider must be set before building any strings that require localization.", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _localizationProvider != nil", v5, 2u);
    }
  }

  return v2;
}

+ (void)setLocalizationProvider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_storeStrong((id *)&_localizationProvider, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: localizationProvider != ((void *)0)", v5, 2u);
  }
}

+ (BOOL)hasLocalizationProvider
{
  return _localizationProvider != 0;
}

- (NSArray)arguments
{
  if (self->_arguments) {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_arguments copyItems:1];
  }
  else {
    id v2 = 0;
  }

  return (NSArray *)v2;
}

@end