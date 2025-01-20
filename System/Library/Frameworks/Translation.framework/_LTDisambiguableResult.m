@interface _LTDisambiguableResult
+ (BOOL)isGenderDisambiguationEnabled;
+ (BOOL)supportsSecureCoding;
+ (id)combineResults:(id)a3 joinedWithString:(id)a4;
+ (id)combinedDisambiguableResultFromTranslationResults:(id)a3 joinedWithString:(id)a4;
- (BOOL)hasDisambiguations;
- (BOOL)hasDisambiguationsOfType:(unint64_t)a3;
- (NSArray)observers;
- (NSArray)sentences;
- (NSString)description;
- (NSString)romanization;
- (NSString)sourceText;
- (NSString)targetText;
- (_LTDisambiguableResult)initWithCoder:(id)a3;
- (_LTDisambiguableResult)initWithDictionary:(id)a3;
- (_LTDisambiguableResult)initWithSentences:(id)a3;
- (_LTDisambiguableResult)initWithSentences:(id)a3 joinedWithString:(id)a4;
- (_LTDisambiguableResultDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)excludedTypesForDisambiguableSentence:(id)a3;
- (id)generateAttributedStringForLocation:(unint64_t)a3 withGlobalAttributes:(id)a4 attributeProvider:(id)a5;
- (id)sentenceWithUUID:(id)a3;
- (void)_commonInit;
- (void)_insertPrefix:(id)a3;
- (void)addObserver:(id)a3;
- (void)disambiguableSentence:(id)a3 didSelectNode:(id)a4 atIndex:(unint64_t)a5 withSelection:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _LTDisambiguableResult

- (_LTDisambiguableResult)initWithDictionary:(id)a3
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [v6 objectForKeyedSubscript:@"alternative_descriptions"];
  if (v7 && (unint64_t v8 = 0x263EFF000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [v6 objectForKeyedSubscript:@"engine_input"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = [v6 objectForKeyedSubscript:@"n_best_translated_phrases"];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v11 = [MEMORY[0x263EFF980] array];
        v107 = v10;
        if ([v10 count])
        {
          uint64_t v12 = 0;
          while (1)
          {
            uint64_t v109 = v12;
            v13 = objc_msgSend(v10, "objectAtIndexedSubscript:", v12, v74);
            if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v72 = 0;
              goto LABEL_137;
            }
            v14 = [v13 objectForKeyedSubscript:@"translated_tokens"];
            if (!v14)
            {
              v72 = 0;
              goto LABEL_132;
            }
            objc_opt_class();
            v110 = v14;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v72 = 0;
              goto LABEL_132;
            }
            v15 = [v13 objectForKeyedSubscript:@"meta_info_data"];
            v108 = v13;
            if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v16 = [v15 objectForKeyedSubscript:@"romanization"];
              if (v16)
              {
                objc_opt_class();
                v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;
              }
              else
              {
                v17 = 0;
              }
              id v106 = v17;

              uint64_t v19 = [v15 objectForKeyedSubscript:@"selection_spans"];
              v105 = (void *)v19;
              if (v19)
              {
                v20 = (void *)v19;
                v101 = v11;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v94 = v15;
                  v21 = [MEMORY[0x263EFF980] array];
                  long long v120 = 0u;
                  long long v121 = 0u;
                  long long v122 = 0u;
                  long long v123 = 0u;
                  v22 = v20;
                  uint64_t v98 = [(_LTDisambiguationNode *)v22 countByEnumeratingWithState:&v120 objects:v127 count:16];
                  if (!v98) {
                    goto LABEL_118;
                  }
                  uint64_t v99 = *(void *)v121;
                  v100 = v22;
                  v103 = v21;
LABEL_30:
                  uint64_t v23 = 0;
LABEL_31:
                  if (*(void *)v121 != v99)
                  {
                    uint64_t v24 = v23;
                    objc_enumerationMutation(v22);
                    uint64_t v23 = v24;
                  }
                  uint64_t v102 = v23;
                  id v25 = *(id *)(*((void *)&v120 + 1) + 8 * v23);
                  if (v25)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      char v119 = 0;
                      v26 = [v25 objectForKeyedSubscript:@"source"];
                      uint64_t v27 = rangeFromDictionary(v26, &v119);
                      uint64_t v29 = v28;

                      if (v119) {
                        goto LABEL_124;
                      }
                      v104 = v25;
                      uint64_t v30 = objc_msgSend(v9, "lt_codeUnitsRangeFromCodePointsRange:", v27, v29);
                      uint64_t v96 = v31;
                      uint64_t v97 = v30;
                      v21 = v103;
                      if (v30 == 0x7FFFFFFFFFFFFFFFLL)
                      {
LABEL_39:
                        v22 = v100;
                        goto LABEL_40;
                      }
                      id v25 = v104;
                      v32 = [v104 objectForKeyedSubscript:@"projection"];
                      uint64_t v33 = rangeFromDictionary(v32, &v119);
                      uint64_t v35 = v34;

                      if (v119)
                      {
LABEL_124:
                        v22 = v100;
                        goto LABEL_125;
                      }
                      uint64_t v36 = objc_msgSend(v110, "lt_codeUnitsRangeFromCodePointsRange:", v33, v35);
                      v21 = v103;
                      if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
                        goto LABEL_39;
                      }
                      uint64_t v90 = v37;
                      uint64_t v91 = v36;
                      v92 = [MEMORY[0x263EFF980] array];
                      v38 = [v104 objectForKeyedSubscript:@"alternatives"];
                      v22 = v100;
                      if (!v38 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
LABEL_123:

                        id v25 = v104;
                        goto LABEL_125;
                      }
                      long long v117 = 0u;
                      long long v118 = 0u;
                      long long v115 = 0u;
                      long long v116 = 0u;
                      id obj = v38;
                      uint64_t v39 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
                      if (!v39) {
                        goto LABEL_116;
                      }
                      uint64_t v40 = *(void *)v116;
                      v87 = v38;
                      uint64_t v85 = *(void *)v116;
                      while (1)
                      {
                        uint64_t v84 = v39;
                        uint64_t v41 = 0;
                        do
                        {
                          if (*(void *)v116 != v40)
                          {
                            uint64_t v42 = v41;
                            objc_enumerationMutation(obj);
                            uint64_t v41 = v42;
                          }
                          uint64_t v89 = v41;
                          id v95 = *(id *)(*((void *)&v115 + 1) + 8 * v41);
                          if (!v95) {
                            goto LABEL_121;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_121;
                          }
                          long long v113 = 0u;
                          long long v114 = 0u;
                          long long v111 = 0u;
                          long long v112 = 0u;
                          uint64_t v43 = [&unk_26FABA888 countByEnumeratingWithState:&v111 objects:v125 count:16];
                          if (v43)
                          {
                            uint64_t v44 = v43;
                            uint64_t v45 = *(void *)v112;
LABEL_53:
                            uint64_t v46 = 0;
                            while (1)
                            {
                              if (*(void *)v112 != v45) {
                                objc_enumerationMutation(&unk_26FABA888);
                              }
                              id v47 = *(id *)(*((void *)&v111 + 1) + 8 * v46);
                              if (v47)
                              {
                                objc_opt_class();
                                id v48 = (objc_opt_isKindOfClass() & 1) != 0 ? v47 : 0;
                              }
                              else
                              {
                                id v48 = 0;
                              }

                              if (!v48) {
                                break;
                              }
                              if (v44 == ++v46)
                              {
                                uint64_t v44 = [&unk_26FABA888 countByEnumeratingWithState:&v111 objects:v125 count:16];
                                if (v44) {
                                  goto LABEL_53;
                                }
                                goto LABEL_64;
                              }
                            }
LABEL_121:

                            unint64_t v8 = 0x263EFF000;
                            v22 = v100;
LABEL_122:

                            v38 = v87;
                            goto LABEL_123;
                          }
LABEL_64:
                          v49 = objc_msgSend(v95, "objectForKeyedSubscript:", @"alternative_description_index", v74);
                          if (v49)
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              v50 = v49;
                            }
                            else {
                              v50 = 0;
                            }
                          }
                          else
                          {
                            v50 = 0;
                          }
                          id v88 = v50;

                          v51 = [v95 objectForKeyedSubscript:@"translation_phrase_index"];
                          unint64_t v8 = 0x263EFF000;
                          v21 = v103;
                          v22 = v100;
                          if (v51)
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              v52 = v51;
                            }
                            else {
                              v52 = 0;
                            }
                          }
                          else
                          {
                            v52 = 0;
                          }
                          id v86 = v52;

                          v53 = [v95 objectForKeyedSubscript:@"selection_span_index"];
                          if (v53)
                          {
                            objc_opt_class();
                            if (objc_opt_isKindOfClass()) {
                              v54 = v53;
                            }
                            else {
                              v54 = 0;
                            }
                          }
                          else
                          {
                            v54 = 0;
                          }
                          id v83 = v54;

                          int v55 = 1;
                          if (!v88 || !v86) {
                            goto LABEL_109;
                          }
                          v56 = v83;
                          if (!v83) {
                            goto LABEL_110;
                          }
                          uint64_t v81 = [v88 unsignedIntegerValue];
                          uint64_t v80 = [v86 unsignedIntegerValue];
                          uint64_t v79 = [v83 unsignedIntegerValue];
                          uint64_t v57 = [v7 objectAtIndexedSubscript:v81];
                          v82 = (void *)v57;
                          if (v57)
                          {
                            v58 = (void *)v57;
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              v78 = genderPayloadValueForDescription(v58, @"gender");
                              v59 = genderPayloadValueForDescription(v58, @"default_gender");
                              v77 = v59;
                              if (v78 && v59)
                              {
                                v60 = +[_LTUnvalidatedEdgeInfo genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:](_LTUnvalidatedEdgeInfo, "genderEdgeInfoWithTargetPhraseIndex:targetLinkIndex:gender:defaultGender:", v80, v79, [v78 unsignedIntegerValue], objc_msgSend(v59, "unsignedIntegerValue"));
                                [v92 addObject:v60];
                                goto LABEL_106;
                              }
                              id v76 = v58;
                              objc_opt_class();
                              char isKindOfClass = objc_opt_isKindOfClass();
                              v62 = v76;
                              if ((isKindOfClass & 1) == 0) {
                                v62 = 0;
                              }
                              id v63 = v62;
                              v74 = v63;
                              if (v63)
                              {
                                v64 = [v63 objectForKeyedSubscript:@"type"];
                                if (!v64)
                                {
                                  v65 = 0;
                                  goto LABEL_100;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  uint64_t v75 = 0;
                                  v65 = v64;
                                  v64 = 0;
                                  goto LABEL_102;
                                }
                                if ([v64 isEqualToString:@"meaning"])
                                {
                                  v65 = [v74 objectForKeyedSubscript:@"payload"];
                                  if (v65)
                                  {
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      uint64_t v75 = [v65 objectForKeyedSubscript:@"definition"];
                                      goto LABEL_102;
                                    }
                                  }
LABEL_100:
                                  uint64_t v75 = 0;
LABEL_102:
                                }
                                else
                                {
                                  uint64_t v75 = 0;
                                }

                                v21 = v103;
                                v22 = v100;
                              }
                              else
                              {
                                uint64_t v75 = 0;
                              }

                              if (v75)
                              {
                                v66 = +[_LTUnvalidatedEdgeInfo meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:](_LTUnvalidatedEdgeInfo, "meaningEdgeInfoWithTargetPhraseIndex:targetLinkIndex:meaningDescription:", v80, v79);
                                [v92 addObject:v66];

                                v60 = (void *)v75;
LABEL_106:

                                int v55 = 0;
                              }
                              else
                              {
                                int v55 = 1;
                              }

                              goto LABEL_108;
                            }
                          }
                          int v55 = 1;
LABEL_108:

LABEL_109:
                          v56 = v83;
LABEL_110:

                          if (v55) {
                            goto LABEL_122;
                          }
                          uint64_t v41 = v89 + 1;
                          uint64_t v40 = v85;
                        }
                        while (v89 + 1 != v84);
                        uint64_t v39 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
                        uint64_t v40 = v85;
                        if (!v39)
                        {
LABEL_116:

                          v67 = -[_LTDisambiguationLinkConfiguration initWithSourceRange:targetRange:unvalidatedAdjacencyList:]([_LTDisambiguationLinkConfiguration alloc], "initWithSourceRange:targetRange:unvalidatedAdjacencyList:", v97, v96, v91, v90, v92);
                          [v21 addObject:v67];

LABEL_40:
                          uint64_t v23 = v102 + 1;
                          if (v102 + 1 == v98)
                          {
                            uint64_t v68 = [(_LTDisambiguationNode *)v22 countByEnumeratingWithState:&v120 objects:v127 count:16];
                            uint64_t v98 = v68;
                            if (!v68)
                            {
LABEL_118:

                              v22 = [[_LTDisambiguationNode alloc] initWithText:v110 links:v21 romanization:v106];
                              [v101 addObject:v22];
                              int v18 = 0;
                              goto LABEL_126;
                            }
                            goto LABEL_30;
                          }
                          goto LABEL_31;
                        }
                      }
                    }
                  }
LABEL_125:

                  int v18 = 1;
                  v21 = v103;
LABEL_126:

                  v15 = v94;
                }
                else
                {
                  int v18 = 1;
                }
                v11 = v101;
              }
              else
              {
                int v18 = 1;
              }
            }
            else
            {
              int v18 = 1;
            }

            if (v18) {
              break;
            }
            uint64_t v12 = v109 + 1;
            v10 = v107;
            if (v109 + 1 >= (unint64_t)[v107 count]) {
              goto LABEL_131;
            }
          }
          v72 = 0;
          v10 = v107;
        }
        else
        {
LABEL_131:
          v69 = [[_LTDisambiguableSentence alloc] initWithSourceText:v9 targetPhrases:v11 selectedPhraseIndex:0];
          v70 = [_LTDisambiguableResult alloc];
          v124 = v69;
          v14 = [*(id *)(v8 + 2240) arrayWithObjects:&v124 count:1];
          v71 = v70;
          v13 = v69;
          v72 = [(_LTDisambiguableResult *)v71 initWithSentences:v14];
LABEL_132:

          v10 = v107;
LABEL_137:
        }
      }
      else
      {

        v72 = 0;
      }
    }
    else
    {

      v72 = 0;
    }
  }
  else
  {

    v72 = 0;
  }

  return v72;
}

- (_LTDisambiguableResult)initWithSentences:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTDisambiguableResult;
  v5 = [(_LTDisambiguableResult *)&v12 init];
  if (!v5)
  {
LABEL_6:
    unint64_t v8 = 0;
    goto LABEL_7;
  }
  if (![v4 count])
  {
    v9 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_24639B000, v9, OS_LOG_TYPE_INFO, "Not creating disambiguable result because there's no sentences to create it with", v11, 2u);
    }
    goto LABEL_6;
  }
  uint64_t v6 = [v4 copy];
  sentences = v5->_sentences;
  v5->_sentences = (NSArray *)v6;

  [(_LTDisambiguableResult *)v5 _commonInit];
  unint64_t v8 = v5;
LABEL_7:

  return v8;
}

- (_LTDisambiguableResult)initWithSentences:(id)a3 joinedWithString:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263EFF980];
  id v8 = a3;
  v9 = objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __61___LTDisambiguableResult_initWithSentences_joinedWithString___block_invoke;
  v17 = &unk_2651DB658;
  id v18 = v6;
  id v19 = v9;
  id v10 = v9;
  id v11 = v6;
  [v8 enumerateObjectsUsingBlock:&v14];

  objc_super v12 = -[_LTDisambiguableResult initWithSentences:](self, "initWithSentences:", v10, v14, v15, v16, v17);
  return v12;
}

+ (id)combineResults:(id)a3 joinedWithString:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __58___LTDisambiguableResult_combineResults_joinedWithString___block_invoke;
  v21 = &unk_2651DB680;
  id v22 = v7;
  id v9 = v8;
  id v23 = v9;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:&v18];
  id v11 = objc_alloc((Class)a1);
  objc_super v12 = objc_msgSend(v11, "initWithSentences:", v9, v18, v19, v20, v21);
  v13 = _LTOSLogDisambiguation();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v13;
    uint64_t v16 = [v6 count];
    uint64_t v17 = [v9 count];
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = v16;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v12;
    _os_log_debug_impl(&dword_24639B000, v15, OS_LOG_TYPE_DEBUG, "Combined %zu disambiguationResults with total of %zu sentences into combined disambiguationResult: %{public}@", buf, 0x20u);
  }

  return v12;
}

+ (id)combinedDisambiguableResultFromTranslationResults:(id)a3 joinedWithString:(id)a4
{
  id v4 = a3;
  v5 = [v4 _ltCompactMap:&__block_literal_global_0];
  uint64_t v6 = [v5 count];
  if (v6 == [v4 count])
  {
    id v7 = +[_LTDisambiguableResult combineResults:v5 joinedWithString:@" "];
    int v8 = [v7 hasDisambiguations];
    id v9 = _LTOSLogDisambiguation();
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[_LTDisambiguableResult combinedDisambiguableResultFromTranslationResults:joinedWithString:]((uint64_t)v7, v10, v4);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_24639B000, v10, OS_LOG_TYPE_INFO, "Combined paragraph disambiguableResult has no disambiguations, but returning it anyway since it may be later combined with other disambiguable results", v13, 2u);
    }
  }
  else
  {
    id v11 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_LTDisambiguableResult combinedDisambiguableResultFromTranslationResults:joinedWithString:](v11, v5, v4);
    }
    id v7 = 0;
  }

  return v7;
}

- (id)sentenceWithUUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    sentences = self->_sentences;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43___LTDisambiguableResult_sentenceWithUUID___block_invoke;
    v9[3] = &unk_2651DB6A8;
    id v10 = v4;
    id v7 = [(NSArray *)sentences lt_firstObjectPassingTest:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)targetText
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_sentences;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "targetText", (void)v12);
        [v3 appendString:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];

  return (NSString *)v10;
}

- (NSString)sourceText
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_sentences;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "sourceText", (void)v12);
        [v3 appendString:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];

  return (NSString *)v10;
}

- (NSString)romanization
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(NSArray *)self->_sentences _ltCompactMap:&__block_literal_global_9];
  NSUInteger v4 = [(NSArray *)self->_sentences count];
  if (v4 == [v3 count])
  {
    uint64_t v5 = [v3 componentsJoinedByString:&stru_26FAADE68];
  }
  else
  {
    uint64_t v6 = _LTOSLogRomanization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v3 count];
      NSUInteger v9 = [(NSArray *)self->_sentences count];
      int v11 = 134218240;
      uint64_t v12 = v8;
      __int16 v13 = 2048;
      NSUInteger v14 = v9;
      _os_log_impl(&dword_24639B000, v7, OS_LOG_TYPE_INFO, "Not returning romanization for disambiguable result since only %zu out of %zu sentences had romanization", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (id)generateAttributedStringForLocation:(unint64_t)a3 withGlobalAttributes:(id)a4 attributeProvider:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v21 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = WeakRetained;
  if (objc_opt_respondsToSelector())
  {
    id v10 = objc_msgSend(WeakRetained, "excludedTypesForResult:", self, WeakRetained);
  }
  else
  {
    id v10 = 0;
  }
  id v11 = objc_alloc_init(MEMORY[0x263F089B8]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v12 = [(_LTDisambiguableResult *)self sentences];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "_generateAttributedStringForLocation:result:excludedTypes:globalAttributes:attributeProvider:", a3, self, v10, v21, v8, v20);
        [v11 appendAttributedString:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  uint64_t v18 = (void *)[v11 copy];

  return v18;
}

- (BOOL)hasDisambiguations
{
  return [(NSArray *)self->_sentences lt_hasObjectPassingTest:&__block_literal_global_17];
}

- (BOOL)hasDisambiguationsOfType:(unint64_t)a3
{
  sentences = self->_sentences;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51___LTDisambiguableResult_hasDisambiguationsOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e34_B16__0___LTDisambiguableSentence_8l;
  v5[4] = a3;
  return [(NSArray *)sentences lt_hasObjectPassingTest:v5];
}

+ (BOOL)isGenderDisambiguationEnabled
{
  if (isGenderDisambiguationEnabled_onceToken != -1) {
    dispatch_once(&isGenderDisambiguationEnabled_onceToken, &__block_literal_global_20);
  }
  return isGenderDisambiguationEnabled_isGenderDisambiguationEnabled;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (NSArray)observers
{
  v2 = [(NSHashTable *)self->_observers allObjects];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSString)description
{
  v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(NSArray *)self->_sentences count];
  [(_LTDisambiguableResult *)self hasDisambiguations];
  uint64_t v7 = NSStringFromBOOL();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; number of sentences: %zu; hasDisambiguations: %@>",
    v5,
    self,
    v6,
  id v8 = v7);

  return (NSString *)v8;
}

- (void)_insertPrefix:(id)a3
{
  sentences = self->_sentences;
  id v4 = a3;
  id v5 = [(NSArray *)sentences firstObject];
  [v5 _insertPrefix:v4];
}

- (void)disambiguableSentence:(id)a3 didSelectNode:(id)a4 atIndex:(unint64_t)a5 withSelection:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    [v11 disambiguableResult:self didChangeResultForSentence:v8 withSelection:v9];
  }
  uint64_t v18 = v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 disambiguableResultDidUpdate:self];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (id)excludedTypesForDisambiguableSentence:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v5 = [WeakRetained excludedTypesForResult:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_LTDisambiguableResult)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTDisambiguableResult;
  id v5 = [(_LTDisambiguableResult *)&v13 init];
  if (v5)
  {
    NSUInteger v6 = (void *)MEMORY[0x263EFFA08];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sentences"];
    sentences = v5->_sentences;
    v5->_sentences = (NSArray *)v9;

    [(_LTDisambiguableResult *)v5 _commonInit];
    id v11 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "allocWithZone:"), "initWithArray:copyItems:", self->_sentences, 1);
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSentences:", v4);

  return v5;
}

- (void)_commonInit
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  observers = self->_observers;
  self->_observers = v3;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_sentences;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setDelegate:", self, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)sentences
{
  return self->_sentences;
}

- (_LTDisambiguableResultDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTDisambiguableResultDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sentences, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)combinedDisambiguableResultFromTranslationResults:(void *)a3 joinedWithString:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a2;
  [a3 count];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_24639B000, v4, OS_LOG_TYPE_DEBUG, "Created combined disambiguation result: %{public}@; from %zu individual translation results",
    v5,
    0x16u);
}

+ (void)combinedDisambiguableResultFromTranslationResults:(void *)a3 joinedWithString:.cold.2(void *a1, void *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v5 = a1;
  [a2 count];
  [a3 count];
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_24639B000, v5, OS_LOG_TYPE_ERROR, "Unable to create combined paragraph disambiguableResult from array of translationResults because only %zu out of %zu translationResults had disambiguableResults set", v6, 0x16u);
}

@end