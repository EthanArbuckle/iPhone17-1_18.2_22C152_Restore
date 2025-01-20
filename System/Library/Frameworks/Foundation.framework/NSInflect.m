@interface NSInflect
@end

@implementation NSInflect

uint64_t ___NSInflect_block_invoke_38(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v6 = result;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v7 = *(void **)(result + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      unint64_t v11 = a3 + a4;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) rangeValue];
          if (v11 >= v13 + v14) {
            uint64_t v15 = v13 + v14;
          }
          else {
            uint64_t v15 = a3 + a4;
          }
          BOOL v16 = v13 > a3 || a3 >= v13 + v14;
          unint64_t v17 = a3;
          if (v16)
          {
            BOOL v18 = a3 > v13 || v13 >= v11;
            unint64_t v17 = v13;
            if (v18) {
              continue;
            }
          }
          if (v15 != v17)
          {
            v20 = *(uint64_t (**)(void))(*(void *)(v6 + 48) + 16);
            return v20();
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    if ([*(id *)(v6 + 40) count]
      && (uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(v6 + 56) + 16))()) != 0
      && v19 != [MEMORY[0x1E4F1CA98] null])
    {
      v20 = *(uint64_t (**)(void))(*(void *)(v6 + 64) + 16);
    }
    else
    {
      v20 = *(uint64_t (**)(void))(*(void *)(v6 + 64) + 16);
    }
    return v20();
  }
  return result;
}

_NSLexiconMorphunDictionary *___NSInflect_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (_NSLexiconMorphunDictionary *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:a2];
  if (!v4)
  {
    v4 = [[_NSLexiconMorphunDictionary alloc] initWithLanguage:a2];
    if (v4)
    {
      v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (!v5)
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      }
      [v5 setObject:v4 forKeyedSubscript:a2];
    }
  }
  return v4;
}

void ___NSInflect_block_invoke_2(uint64_t a1, NSInflectionRule *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v244 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  long long v247 = 0u;
  uint64_t v165 = a1;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v244 objects:v243 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v245;
    unint64_t v11 = a3 + a4;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v245 != v10) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = *(void **)(*((void *)&v244 + 1) + 8 * i);
        unint64_t v14 = [v13 replacementRangeInResult];
        if (v14 + v15 >= v11) {
          NSUInteger v16 = a3 + a4;
        }
        else {
          NSUInteger v16 = v14 + v15;
        }
        if (a3 > v14 || v14 >= v11)
        {
          BOOL v18 = v14 > a3 || a3 >= v14 + v15;
          unint64_t v14 = a3;
          if (v18) {
            continue;
          }
        }
        if (v16 != v14) {
          [v7 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v244 objects:v243 count:16];
    }
    while (v9);
  }
  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  uint64_t v19 = _NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v47 = [*(id *)(a1 + 32) count];
    uint64_t v48 = [v7 count];
    v249.location = a3;
    v249.length = a4;
    *(_DWORD *)buf = 134349570;
    *(void *)&buf[4] = v47;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2114;
    v236 = NSStringFromRange(v249);
    _os_log_debug_impl(&dword_181795000, v19, OS_LOG_TYPE_DEBUG, "%{public}lld format specifiers are relevant (out of %{public}lld) in range %{public}@", buf, 0x20u);
  }
  if (!*(unsigned char *)(a1 + 136))
  {
LABEL_45:
    uint64_t v215 = 0;
    v216 = &v215;
    uint64_t v217 = 0x2020000000;
    uint64_t v218 = 0;
    v163 = objc_alloc_init(NSMorphology);
    uint64_t v214 = 0;
    if ([(NSInflectionRule *)a2 isEqual:MEMORY[0x1E4F1CC28]])
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      long long v25 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
      {
        v250.location = a3;
        v250.length = a4;
        v49 = NSStringFromRange(v250);
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v49;
        _os_log_debug_impl(&dword_181795000, v25, OS_LOG_TYPE_DEBUG, "NSInflect attribute is NO, not inflecting in range %{public}@", buf, 0xCu);
      }

LABEL_286:
      _Block_object_dispose(&v215, 8);
      return;
    }
    if (([(NSInflectionRule *)a2 isEqual:MEMORY[0x1E4F1CC38]] & 1) == 0
      && +[NSInflectionRule automaticRule] != a2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[NSMorphology mergeMorphology:override:]((uint64_t)v163, [[NSMorphology alloc] initWithInflection:a2], 1);
          v216[3] |= 2uLL;
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v46 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v255.location = a3;
            v255.length = a4;
            v70 = NSStringFromRange(v255);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v163;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v70;
            _os_log_debug_impl(&dword_181795000, v46, OS_LOG_TYPE_DEBUG, "NSInflect attribute is an internal inflection object (%@), using it in range %{public}@", buf, 0x16u);
          }
        }
        int v156 = 0;
        v160 = 0;
        v161 = 0;
        v28 = 0;
        int v29 = 1;
        goto LABEL_140;
      }
      -[NSMorphology mergeMorphology:override:]((uint64_t)v163, (void *)[(NSInflectionRule *)a2 morphology], 1);
      v216[3] |= 2uLL;
      if ([(NSInflectionRule *)a2 referentConcept])
      {
        if ([(NSInflectionRule *)a2 referentConcept] < 1
          || (unint64_t v26 = [(NSInflectionRule *)a2 referentConcept],
              v26 > [*(id *)(v165 + 64) count]))
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          uint64_t v27 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_60;
          }
          v269.location = a3;
          v269.length = a4;
          v151 = NSStringFromRange(v269);
          uint64_t v152 = [(NSInflectionRule *)a2 referentConcept];
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v151;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = v152;
          v67 = "NSInflectionReferentConcept attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
          v68 = v27;
          uint32_t v69 = 22;
LABEL_289:
          _os_log_error_impl(&dword_181795000, v68, OS_LOG_TYPE_ERROR, v67, buf, v69);
LABEL_60:
          v28 = 0;
          int v29 = 0;
          goto LABEL_96;
        }
        v28 = (NSString *)objc_msgSend(*(id *)(v165 + 64), "objectAtIndexedSubscript:", -[NSInflectionRule referentConcept](a2, "referentConcept") - 1);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          uint64_t v64 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_60;
          }
          v254.location = a3;
          v254.length = a4;
          v65 = NSStringFromRange(v254);
          uint64_t v66 = [(NSInflectionRule *)a2 referentConcept];
          *(_DWORD *)buf = 138543875;
          *(void *)&buf[4] = v65;
          *(_WORD *)&buf[12] = 2050;
          *(void *)&buf[14] = v66;
          *(_WORD *)&buf[22] = 2113;
          v236 = v28;
          v67 = "NSInflectionReferentConcept attribute in range %{public}@ is set to %{public}ld. Expected a 'TermOfAddre"
                "ss' concept, but found %{private}@ instead.";
          v68 = v64;
          uint32_t v69 = 32;
          goto LABEL_289;
        }
      }
      else
      {
        v28 = 0;
      }
      int v29 = 1;
LABEL_96:
      if ([(NSInflectionRule *)a2 agreeWithArgument])
      {
        if ([(NSInflectionRule *)a2 agreeWithArgument] >= 1)
        {
          long long v242 = 0u;
          long long v241 = 0u;
          long long v240 = 0u;
          long long v239 = 0u;
          v53 = *(void **)(v165 + 32);
          uint64_t v54 = [v53 countByEnumeratingWithState:&v239 objects:v238 count:16];
          if (v54)
          {
            uint64_t v55 = *(void *)v240;
LABEL_100:
            uint64_t v56 = 0;
            while (1)
            {
              if (*(void *)v240 != v55) {
                objc_enumerationMutation(v53);
              }
              v161 = *(void **)(*((void *)&v239 + 1) + 8 * v56);
              uint64_t v57 = [v161 index];
              if (v57 == [(NSInflectionRule *)a2 agreeWithArgument]) {
                break;
              }
              if (v54 == ++v56)
              {
                uint64_t v54 = [v53 countByEnumeratingWithState:&v239 objects:v238 count:16];
                if (v54) {
                  goto LABEL_100;
                }
                goto LABEL_120;
              }
            }
            if (!v161) {
              goto LABEL_120;
            }
            if ([(NSInflectionRule *)a2 agreeWithConcept])
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v63 = _NSInflectionLog_log;
              if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                v160 = 0;
                goto LABEL_137;
              }
              v270.location = a3;
              v270.length = a4;
              v153 = NSStringFromRange(v270);
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v153;
              _os_log_error_impl(&dword_181795000, v63, OS_LOG_TYPE_ERROR, "Both NSInflectionAgreementArgument and NSInflectionAgreementConcept attributes specified in range %{public}@. The latter will be discarded.", buf, 0xCu);
            }
            goto LABEL_125;
          }
        }
LABEL_120:
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v59 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
LABEL_123:
          int v29 = 0;
          v160 = 0;
          v161 = 0;
LABEL_137:
          v73 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v268.location = a3;
            v268.length = a4;
            v150 = NSStringFromRange(v268);
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = a2;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v163;
            *(_WORD *)&buf[22] = 2114;
            v236 = v150;
            _os_log_debug_impl(&dword_181795000, v73, OS_LOG_TYPE_DEBUG, "NSInflect attribute is an inflection rule (%@ / %@), using it in range %{public}@", buf, 0x20u);
          }
          int v156 = 0;
LABEL_140:
          uint64_t v158 = a4;
          uint64_t v159 = a3;
LABEL_141:
          if (-[NSMorphology isIdentity](v163))
          {
            v74 = (_NSAttributedStringGrammarInflection *)(*(uint64_t (**)(void))(*(void *)(v165 + 88) + 16))();
            if (_NSIsNSDictionary()) {
              v74 = [[_NSAttributedStringGrammarInflection alloc] initWithExternalRepresentationDictionary:v74 error:0];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v74 = [[_NSAttributedStringGrammarInflection alloc] initWithMorphology:v74];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v75 = v74;
            }
            else {
              v75 = 0;
            }
            BOOL v76 = v75 != 0;
            if (v75)
            {
              -[NSMorphology mergeMorphology:override:]((uint64_t)v163, [[NSMorphology alloc] initWithInflection:v75], 1);
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v77 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
              {
                v265.location = a3;
                v265.length = a4;
                v146 = NSStringFromRange(v265);
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v163;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v146;
                _os_log_debug_impl(&dword_181795000, v77, OS_LOG_TYPE_DEBUG, "Inflection was identity; assumed inflection attribute value %{public}@ will be used instead in range %{public}@",
                  buf,
                  0x16u);
              }
              int v29 = 1;
            }
            (*(void (**)(void))(*(void *)(v165 + 96) + 16))();
          }
          else
          {
            BOOL v76 = 0;
          }
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v78 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v257.location = a3;
            v257.length = a4;
            v98 = NSStringFromRange(v257);
            uint64_t v99 = *(void *)(v165 + 128);
            *(_DWORD *)buf = 138544130;
            *(void *)&buf[4] = v98;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v99;
            *(_WORD *)&buf[22] = 2112;
            v236 = (NSString *)a2;
            LOWORD(v237) = 2112;
            *(void *)((char *)&v237 + 2) = v163;
            _os_log_debug_impl(&dword_181795000, v78, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld will be inflected with requested inflection: %@, resolved inflection %@", buf, 0x2Au);
          }
          BOOL v157 = v76;
          (*(void (**)(void))(*(void *)(v165 + 96) + 16))();
          (*(void (**)(void))(*(void *)(v165 + 96) + 16))();
          (*(void (**)(void))(*(void *)(v165 + 96) + 16))();
          (*(void (**)(void))(*(void *)(v165 + 96) + 16))();
          uint64_t v79 = [v7 count];
          NSUInteger range = a4;
          if (v161 || v79 || v160)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3052000000;
            v236 = (NSString *)__Block_byref_object_copy__7;
            *(void *)&long long v237 = __Block_byref_object_dispose__7;
            *((void *)&v237 + 1) = 0;
            uint64_t v208 = 0;
            v209 = &v208;
            uint64_t v210 = 0x3052000000;
            v211 = __Block_byref_object_copy__7;
            v212 = __Block_byref_object_dispose__7;
            uint64_t v213 = 0;
            uint64_t v202 = 0;
            v203 = &v202;
            uint64_t v204 = 0x3052000000;
            v205 = __Block_byref_object_copy__7;
            v206 = __Block_byref_object_dispose__7;
            v207 = 0;
            v207 = objc_alloc_init(NSMorphology);
            uint64_t v196 = 0;
            v197 = &v196;
            uint64_t v198 = 0x3052000000;
            v199 = __Block_byref_object_copy__7;
            v200 = __Block_byref_object_dispose__7;
            v201 = 0;
            v201 = objc_alloc_init(NSMorphology);
            uint64_t v190 = 0;
            v191 = &v190;
            uint64_t v192 = 0x3052000000;
            v193 = __Block_byref_object_copy__7;
            v194 = __Block_byref_object_dispose__7;
            v195 = 0;
            HIDWORD(v154) = v29;
            v155 = v28;
            v195 = objc_alloc_init(NSMorphology);
            uint64_t v184 = 0;
            v185 = &v184;
            uint64_t v186 = 0x3052000000;
            v187 = __Block_byref_object_copy__7;
            v188 = __Block_byref_object_dispose__7;
            v189 = 0;
            v189 = objc_alloc_init(NSMorphology);
            v176[0] = MEMORY[0x1E4F143A8];
            v176[1] = 3221225472;
            v177 = ___NSInflect_block_invoke_19;
            v178 = &unk_1E51F86A0;
            v179 = &v196;
            v180 = &v202;
            v181 = &v215;
            v182 = &v190;
            v183 = &v184;
            v167[0] = MEMORY[0x1E4F143A8];
            v167[1] = 3221225472;
            v168 = ___NSInflect_block_invoke_22;
            v169 = &unk_1E51F86C8;
            v174 = buf;
            v175 = &v208;
            uint64_t v80 = *(void *)(v165 + 88);
            uint64_t v172 = *(void *)(v165 + 104);
            v173 = v176;
            v170 = v163;
            uint64_t v171 = v80;
            if (v160)
            {
              v81 = _NSInflectionLanguageWithLensAndRange(v80, a3, a4);
              if (_NSIsNSString())
              {
                uint64_t v82 = [(id)(*(uint64_t (**)(void))(*(void *)(v165 + 104) + 16))() allPossibleWordAttributesForWord:v160];
                v177(v176, (void *)v82, 0);
              }
              else if (_NSIsNSArray())
              {
                long long v234 = 0u;
                long long v232 = 0u;
                long long v233 = 0u;
                long long v231 = 0u;
                uint64_t v83 = [v160 countByEnumeratingWithState:&v231 objects:v230 count:16];
                if (v83)
                {
                  uint64_t v84 = *(void *)v232;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v83; ++j)
                    {
                      if (*(void *)v232 != v84) {
                        objc_enumerationMutation(v160);
                      }
                      v86 = *(void **)(*((void *)&v231 + 1) + 8 * j);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0
                        && [v86 _isSupportedInLanguage:v81])
                      {
                        v87 = (void *)[v86 _withExtrapolatedPronouns];
                        goto LABEL_198;
                      }
                    }
                    uint64_t v83 = [v160 countByEnumeratingWithState:&v231 objects:v230 count:16];
                    if (v83) {
                      continue;
                    }
                    break;
                  }
                }
                v87 = 0;
LABEL_198:
                v100 = (void *)[v87 _morphologyForLanguage:v81];
                if (v100) {
                  -[NSMorphology mergeMorphology:override:]((uint64_t)v163, v100, 0);
                }
              }
            }
            else if (v161)
            {
              ___NSInflect_block_invoke_22(v167, v161);
            }
            else
            {
              long long v228 = 0u;
              long long v229 = 0u;
              long long v226 = 0u;
              long long v227 = 0u;
              uint64_t v88 = [v7 countByEnumeratingWithState:&v226 objects:v225 count:16];
              if (v88)
              {
                uint64_t v89 = *(void *)v227;
                NSUInteger v90 = a3 + a4;
                do
                {
                  for (uint64_t k = 0; k != v88; ++k)
                  {
                    if (*(void *)v227 != v89) {
                      objc_enumerationMutation(v7);
                    }
                    v92 = *(void **)(*((void *)&v226 + 1) + 8 * k);
                    unint64_t v93 = [v92 replacementRangeInResult];
                    uint64_t v95 = v94;
                    if ([v92 replacementKind] != 2 && a3 <= v93 && v90 >= v93 + v95) {
                      v168(v167, v92);
                    }
                  }
                  uint64_t v88 = [v7 countByEnumeratingWithState:&v226 objects:v225 count:16];
                }
                while (v88);
              }
            }
            -[NSMorphology mergeMorphology:override:]((uint64_t)v163, (void *)v203[5], 0);
            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            v101 = _NSInflectionLog_log;
            if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
            {
              v259.location = a3;
              v259.length = range;
              v133 = NSStringFromRange(v259);
              uint64_t v134 = *(void *)(v165 + 128);
              *(_DWORD *)v219 = 138543874;
              v220 = v133;
              __int16 v221 = 2048;
              uint64_t v222 = v134;
              __int16 v223 = 2112;
              v224 = v163;
              _os_log_debug_impl(&dword_181795000, v101, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that are unambiguous nouns: %@.", v219, 0x20u);
            }
            -[NSMorphology mergeMorphology:override:]((uint64_t)v163, (void *)v197[5], 0);
            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            v102 = _NSInflectionLog_log;
            if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
            {
              v260.location = a3;
              v260.length = range;
              v135 = NSStringFromRange(v260);
              uint64_t v136 = *(void *)(v165 + 128);
              *(_DWORD *)v219 = 138543874;
              v220 = v135;
              __int16 v221 = 2048;
              uint64_t v222 = v136;
              __int16 v223 = 2112;
              v224 = v163;
              _os_log_debug_impl(&dword_181795000, v102, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that could be nouns or adjectives: %@.", v219, 0x20u);
            }
            -[NSMorphology mergeMorphology:override:]((uint64_t)v163, (void *)v191[5], 0);
            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            v103 = _NSInflectionLog_log;
            if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
            {
              v261.location = a3;
              v261.length = range;
              v137 = NSStringFromRange(v261);
              uint64_t v138 = *(void *)(v165 + 128);
              *(_DWORD *)v219 = 138543874;
              v220 = v137;
              __int16 v221 = 2048;
              uint64_t v222 = v138;
              __int16 v223 = 2112;
              v224 = v163;
              _os_log_debug_impl(&dword_181795000, v103, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that are unambiguous adjectives: %@.", v219, 0x20u);
            }
            -[NSMorphology mergeMorphology:override:]((uint64_t)v163, (void *)v185[5], 0);
            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            v104 = _NSInflectionLog_log;
            if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
            {
              v262.location = a3;
              v262.length = range;
              v139 = NSStringFromRange(v262);
              uint64_t v140 = *(void *)(v165 + 128);
              *(_DWORD *)v219 = 138543874;
              v220 = v139;
              __int16 v221 = 2048;
              uint64_t v222 = v140;
              __int16 v223 = 2112;
              v224 = v163;
              _os_log_debug_impl(&dword_181795000, v104, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with attributes from replacements that are other words: %@.", v219, 0x20u);
            }

            if (*(void *)(*(void *)&buf[8] + 40) && v209[5])
            {
              -[NSMorphology applyPluralityRulesForNumbers:inLanguages:](v163, "applyPluralityRulesForNumbers:inLanguages:");
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v105 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
              {
                v266.location = a3;
                v266.length = range;
                v147 = NSStringFromRange(v266);
                uint64_t v148 = *(void *)(v165 + 128);
                *(_DWORD *)v219 = 138543874;
                v220 = v147;
                __int16 v221 = 2048;
                uint64_t v222 = v148;
                __int16 v223 = 2112;
                v224 = v163;
                _os_log_debug_impl(&dword_181795000, v105, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- edited target inflection with numbers supplied as replacements with result: %@.", v219, 0x20u);
              }
            }

            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            a4 = range;
            v28 = v155;
            v106 = _NSInflectionLog_log;
            if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v219 = 138543362;
              v220 = v163;
              _os_log_debug_impl(&dword_181795000, v106, OS_LOG_TYPE_DEBUG, "Target inflection after applying inflections inferred from replacements: %{public}@", v219, 0xCu);
            }
            _Block_object_dispose(&v184, 8);
            _Block_object_dispose(&v190, 8);
            _Block_object_dispose(&v196, 8);
            _Block_object_dispose(&v202, 8);
            _Block_object_dispose(&v208, 8);
            _Block_object_dispose(buf, 8);
          }
          v107 = *(void **)(v165 + 40);
          if (v107)
          {
            uint64_t v108 = (*(uint64_t (**)(void))(*(void *)(v165 + 80) + 16))();
            uint64_t v109 = (*(uint64_t (**)(void))(*(void *)(v165 + 88) + 16))();
            LOBYTE(v154) = v157;
            objc_msgSend(v107, "willProcessInflectableRange:sourceSubstring:inflectionRule:target:alternative:assumedInflectionFallback:fallbackWasUsed:", a3, a4, v108, a2, v163, v109, (*(uint64_t (**)(void))(*(void *)(v165 + 88) + 16))(), v154);
          }
          if ((v216[3] & 1) == 0)
          {
            v166[7] = MEMORY[0x1E4F143A8];
            v166[8] = 3221225472;
            v166[9] = ___NSInflect_block_invoke_31;
            v166[10] = &unk_1E51F86F0;
            uint64_t v111 = *(void *)(v165 + 104);
            uint64_t v110 = *(void *)(v165 + 112);
            v166[11] = *(void *)(v165 + 88);
            v166[12] = v111;
            v166[13] = &v215;
            (*(void (**)(void))(v110 + 16))();
          }
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v112 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            v258.location = a3;
            v258.length = a4;
            v130 = NSStringFromRange(v258);
            uint64_t v131 = *(void *)(v165 + 128);
            v132 = (NSString *)v216[3];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v130;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v131;
            *(_WORD *)&buf[22] = 2048;
            v236 = v132;
            _os_log_debug_impl(&dword_181795000, v112, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld -- determined final disambiguation hints: %lld.", buf, 0x20u);
          }
          v113 = _NSInflectionLanguageWithLensAndRange(*(void *)(v165 + 88), a3, a4);
          BOOL v114 = _NSRequiresMorphunInflectionForLanguageIdentifier(v113);
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v115 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO))
          {
            v116 = "false";
            if (v114) {
              v116 = "true";
            }
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = v116;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v113;
            _os_log_impl(&dword_181795000, v115, OS_LOG_TYPE_INFO, "Inflection engine is enabled? %{public}s for language %{public}@", buf, 0x16u);
          }
          if ((v29 & v114) != 1) {
            goto LABEL_277;
          }
          v117 = (void *)(*(uint64_t (**)(void))(*(void *)(v165 + 80) + 16))();
          v118 = v160;
          if (v28)
          {
            uint64_t v119 = preferredTermOfAddressForLanguageFromList((uint64_t)v113, v28);
            if (!v119 || (v120 = (void *)(*(uint64_t (**)(void))(*(void *)(v165 + 104) + 16))()) == 0)
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              uint64_t v122 = range;
              v123 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
              {
                v267.location = a3;
                v267.length = range;
                v149 = NSStringFromRange(v267);
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v149;
                *(_WORD *)&buf[12] = 2114;
                *(void *)&buf[14] = v113;
                _os_log_debug_impl(&dword_181795000, v123, OS_LOG_TYPE_DEBUG, "Could not find a term of address string in range %{public}@ that is compatible with language %{public}@.", buf, 0x16u);
              }
              int v124 = 0;
              goto LABEL_284;
            }
            uint64_t v121 = (*(uint64_t (**)(void))(*(void *)(v165 + 88) + 16))();
            if (v161)
            {
              v118 = (void *)[v161 argument];
              if ((_NSIsNSString() & 1) == 0)
              {
                if (_NSIsNSAttributedString()) {
                  v118 = (void *)[v118 string];
                }
                else {
                  v118 = 0;
                }
              }
            }
            else if (v160 && !_NSIsNSString())
            {
              v118 = 0;
            }
            objc_opt_class();
            uint64_t v141 = (objc_opt_isKindOfClass() & 1) != 0 ? v121 : 0;
            v126 = (void *)[v120 preferredPronoun:v117 forTermOfAddress:v119 morphology:v141 dependency:v118];
          }
          else
          {
            v125 = (void *)_NSInflectionGrammarWithLensAndRange(*(void *)(v165 + 88), a3, range);
            if (v125)
            {
              -[NSMorphology mergeMorphology:override:]((uint64_t)v163, v125, 0);
              -[NSMorphology setPartOfSpeech:](v163, "setPartOfSpeech:", [v125 partOfSpeech]);
            }
            v126 = (void *)_NSLexiconInflectedStringUsingMorphun(v117, v159, v158, (uint64_t)v113, v163, v214, v7);
            if (v156)
            {
              v127 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v113];
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x3010000000;
              v236 = (NSString *)&unk_18246906D;
              long long v237 = 0uLL;
              uint64_t v208 = 0;
              v209 = &v208;
              uint64_t v210 = 0x3052000000;
              v211 = __Block_byref_object_copy__7;
              v212 = __Block_byref_object_dispose__7;
              uint64_t v213 = 0;
              uint64_t v128 = [v126 length];
              v166[0] = MEMORY[0x1E4F143A8];
              v166[1] = 3221225472;
              v166[2] = ___NSInflect_block_invoke_36;
              v166[3] = &unk_1E51F8718;
              v166[4] = v127;
              v166[5] = &v208;
              v166[6] = buf;
              objc_msgSend(v126, "enumerateSubstringsInRange:options:usingBlock:", 0, v128, 2, v166);

              v129 = (void *)v209[5];
              if (v129)
              {
                v126 = objc_msgSend(v129, "stringByAppendingString:", objc_msgSend(v126, "substringFromIndex:", *(void *)(*(void *)&buf[8] + 32) + *(void *)(*(void *)&buf[8] + 40)));
              }
              _Block_object_dispose(&v208, 8);
              _Block_object_dispose(buf, 8);
            }
          }
          if (!v126)
          {
LABEL_277:
            int v124 = 0;
            uint64_t v122 = range;
            goto LABEL_284;
          }
          if (range != v158) {
            v117 = (void *)(*(uint64_t (**)(void))(*(void *)(v165 + 80) + 16))();
          }
          if ([v126 isEqual:v117])
          {
            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            v142 = _NSInflectionLog_log;
            if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO)) {
              goto LABEL_283;
            }
            v263.location = a3;
            v263.length = range;
            v143 = NSStringFromRange(v263);
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v143;
            v144 = "Useful inflection but no replacement in range %{public}@";
          }
          else
          {
            (*(void (**)(void))(*(void *)(v165 + 120) + 16))();
            if (_NSInflectionLog_onceToken != -1) {
              dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
            }
            v142 = _NSInflectionLog_log;
            if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_INFO)) {
              goto LABEL_283;
            }
            v264.location = a3;
            v264.length = range;
            v145 = NSStringFromRange(v264);
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v145;
            v144 = "Useful inflection with new replacement in range %{public}@";
          }
          _os_log_impl(&dword_181795000, v142, OS_LOG_TYPE_INFO, v144, buf, 0xCu);
LABEL_283:
          int v124 = 1;
          uint64_t v122 = [v126 length];
LABEL_284:

          if (v124) {
            objc_msgSend(*(id *)(v165 + 48), "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, v122));
          }
          goto LABEL_286;
        }
        v256.location = a3;
        v256.length = a4;
        v71 = NSStringFromRange(v256);
        uint64_t v72 = [(NSInflectionRule *)a2 agreeWithArgument];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v71;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v72;
        v62 = "NSInflectionAgreementArgument attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
      }
      else
      {
        if (![(NSInflectionRule *)a2 agreeWithConcept])
        {
          v161 = 0;
LABEL_125:
          v160 = 0;
          goto LABEL_135;
        }
        if ([(NSInflectionRule *)a2 agreeWithConcept] >= 1)
        {
          unint64_t v58 = [(NSInflectionRule *)a2 agreeWithConcept];
          if (v58 <= [*(id *)(v165 + 64) count])
          {
            v160 = objc_msgSend(*(id *)(v165 + 64), "objectAtIndexedSubscript:", -[NSInflectionRule agreeWithConcept](a2, "agreeWithConcept") - 1);
            v161 = 0;
            goto LABEL_135;
          }
        }
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v59 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_123;
        }
        v253.location = a3;
        v253.length = a4;
        v60 = NSStringFromRange(v253);
        uint64_t v61 = [(NSInflectionRule *)a2 agreeWithConcept];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2050;
        *(void *)&buf[14] = v61;
        v62 = "NSInflectionAgreementConcept attribute in range %{public}@ is set to %{public}ld which is out of bounds.";
      }
      _os_log_error_impl(&dword_181795000, v59, OS_LOG_TYPE_ERROR, v62, buf, 0x16u);
      v160 = 0;
      v161 = 0;
      int v29 = 0;
LABEL_135:
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      goto LABEL_137;
    }
    if ([v7 count])
    {
      if ([v7 count] == 1)
      {
        v30 = _NSInflectionLanguageWithLensAndRange(*(void *)(v165 + 88), a3, a4);
        uint64_t v31 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "replacementRangeInResult");
        uint64_t v33 = v32;
        uint64_t v159 = v31;
        NSUInteger v34 = v31 - a3;
        v35 = (void *)(*(uint64_t (**)(void))(*(void *)(v165 + 80) + 16))();
        uint64_t v36 = objc_msgSend(v35, "lowercaseStringWithLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", v30));
        NSUInteger v37 = a4 - v33 - v34;
        uint64_t v38 = (*(uint64_t (**)(void))(*(void *)(v165 + 80) + 16))();
        LOBYTE(v208) = 0;
        LOBYTE(v202) = 0;
        id v39 = +[NSMorphology _heuristicMorphologyForLanguage:v30 prefix:v36 suffix:v38 featureName:&v214 matchedPrefix:&v208 matchedSuffix:&v202];
        if (v208 | v202)
        {
          v40 = v39;
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v41 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v214;
            _os_log_debug_impl(&dword_181795000, v41, OS_LOG_TYPE_DEBUG, "Found heuristic for prefix / suffix pair: %@, %@", buf, 0x16u);
            if (!v40) {
              goto LABEL_69;
            }
          }
          else if (!v40)
          {
LABEL_69:
            [v7 removeAllObjects];
            if ((_BYTE)v208) {
              NSUInteger v42 = v34;
            }
            else {
              NSUInteger v42 = 0;
            }
            if ((_BYTE)v202) {
              NSUInteger v43 = v37;
            }
            else {
              NSUInteger v43 = 0;
            }
            uint64_t v158 = a4 - v42 - v43;
            if ((_BYTE)v208)
            {
              int v156 = [v35 isEqualToString:v36] ^ 1;
            }
            else
            {
              int v156 = 0;
              uint64_t v159 = a3;
            }
            goto LABEL_80;
          }
          -[NSMorphology mergeMorphology:override:]((uint64_t)v163, v40, 1);
          goto LABEL_69;
        }
      }
    }
    else
    {
      v44 = objc_msgSend(*(id *)(v165 + 56), "_morphologyForLanguage:", _NSInflectionLanguageWithLensAndRange(*(void *)(v165 + 88), a3, a4));
      -[NSMorphology mergeMorphology:override:]((uint64_t)v163, v44, 1);
      if ([(NSMorphology *)v163 grammaticalGender] == NSGrammaticalGenderNeuter) {
        [(NSMorphology *)v163 setGrammaticalGender:4];
      }
    }
    int v156 = 0;
    uint64_t v158 = a4;
    uint64_t v159 = a3;
LABEL_80:
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v45 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      v251.location = a3;
      v251.length = a4;
      v50 = NSStringFromRange(v251);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v50;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v163;
      _os_log_debug_impl(&dword_181795000, v45, OS_LOG_TYPE_DEBUG, "NSInflect attribute is YES, using automatic inflection in range %{public}@, initial target: %@", buf, 0x16u);
    }
    v160 = 0;
    v161 = 0;
    v28 = 0;
    int v29 = 1;
    goto LABEL_141;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v20 = [(NSInflectionRule *)a2 agreeWithConcept]
       || [(NSInflectionRule *)a2 agreeWithArgument]
       || [(NSInflectionRule *)a2 referentConcept] != 0;
    if ([v7 count])
    {
      if (!v20) {
        goto LABEL_45;
      }
      goto LABEL_38;
    }
  }
  else
  {
    if ([v7 count]) {
      goto LABEL_45;
    }
    BOOL v20 = 0;
  }
  if ((((*(unsigned int (**)(void))(*(void *)(v165 + 72) + 16))() | v20) & 1) == 0) {
    goto LABEL_45;
  }
LABEL_38:
  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  v21 = _NSInflectionLog_log;
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    v252.location = a3;
    v252.length = a4;
    v51 = NSStringFromRange(v252);
    uint64_t v52 = *(void *)(v165 + 128);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v51;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v52;
    _os_log_debug_impl(&dword_181795000, v21, OS_LOG_TYPE_DEBUG, "Range %{public}@ of string with length %lld has a format specifier or external dependency; not inflecting during preflight.",
      buf,
      0x16u);
  }
  uint64_t v22 = v165;
  long long v23 = *(void **)(v165 + 40);
  if (v23)
  {
    uint64_t v24 = (*(uint64_t (**)(void))(*(void *)(v165 + 80) + 16))();
    objc_msgSend(v23, "didSkipInflectableRangeWithUnfilledFormatSpecifiers:sourceSubstring:inflectionRule:alternative:", a3, a4, v24, a2, (*(uint64_t (**)(void))(*(void *)(v165 + 88) + 16))());
    uint64_t v22 = v165;
  }
  objc_msgSend(*(id *)(v22 + 48), "addObject:", +[NSValue valueWithRange:](NSValue, "valueWithRange:", a3, a4));
}

uint64_t ___NSInflect_block_invoke_19(void *a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![a2 count]) {
    return 5;
  }
  if (_NSInflectionLog_onceToken != -1) {
    dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
  }
  if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v24 = "Adding attributes of a single word";
      __int16 v25 = 2114;
      unint64_t v26 = a2;
      _os_log_debug_impl(&dword_181795000, v6, OS_LOG_TYPE_DEBUG, "%{public}s: %{public}@", buf, 0x16u);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (!v7) {
    return 4;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v12 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(a2);
      }
      unint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v15 = [v14 partOfSpeech];
      if (!a3 || v15 != a3)
      {
        if (v9 || v15 != 9)
        {
          if (v10 || v15 != 6)
          {
            if (!v11) {
              unint64_t v11 = v14;
            }
          }
          else
          {
            uint64_t v10 = v14;
          }
        }
        else
        {
          uint64_t v9 = v14;
        }
        if (v9 && v10 != 0)
        {
          -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[4] + 8) + 40), v9, 1);
LABEL_33:
          -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[4] + 8) + 40), v9, 0);
          return 2;
        }
      }
    }
    uint64_t v8 = [a2 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  if (v9 && !v10)
  {
    -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[5] + 8) + 40), v9, 0);
    *(void *)(*(void *)(a1[6] + 8) + 24) |= 1uLL;
    return 1;
  }
  if (v9) {
    goto LABEL_33;
  }
  if (v10)
  {
    -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[7] + 8) + 40), v10, 0);
    return 3;
  }
  if (v11) {
    -[NSMorphology mergeMorphology:override:](*(void *)(*(void *)(a1[8] + 8) + 40), v11, 0);
  }
  return 4;
}

uint64_t ___NSInflect_block_invoke_22(void *a1, void *a2)
{
  uint64_t v4 = [a2 replacementRangeInResult];
  uint64_t v6 = v5;
  if ([a2 replacementKind] == 1 || (objc_msgSend(a2, "argument"), _NSIsNSNumber()))
  {
    if ([a2 replacementKind] == 1)
    {
      [a2 argument];
      if ((_NSIsNSNumber() & 1) == 0) {
        [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void _NSInflect(NSLocale * _Nullable, NSArray<_NSAttributedStringReplacement *> * _Nonnull, NSArray<NSObject *> * _Nullable, NSTermOfAddress * _Nullable, NSUInteger (^ _Nonnull)(void), BOOL, void (^ _Nonnull)(NSAttributedStringKey, NSRange, __attribute__(noescape) void (^)(id _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, __attribute__(noescape) void (^)(id _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, __attribute__(noescape) void (^)(NSLocalizedNumberFormatRule *, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSAttributedStringKey, NSRange), BOOL (^ _Nonnull)(NSRange), id  _Nullable (^ _Nonnull)(NSAttributedStringKey, NSRange), NSString *(^ _Nonnull)(NSRange), void (^ _Nonnull)(NSRange, __attribute__(noescape) void (^)(NSString * _Nullable, NSRange, BOOL * _Nonnull)), void (^ _Nonnull)(NSRange, id), void (^ _Nonnull)(NSRange, NSAttributedStringKey, id), id  _Nullable (^ _Nonnull)(id))_block_invoke"] file:@"NSAttributedString_Inflection.m" lineNumber:513 description:@"Attribute string replacement argument should be a NSNumber when the formatting specifier is numeric"];
      }
    }
    uint64_t v7 = *(void **)(*(void *)(a1[8] + 8) + 40);
    if (!v7)
    {
      *(void *)(*(void *)(a1[8] + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(*(void *)(a1[8] + 8) + 40);
    }
    objc_msgSend(v7, "addObject:", objc_msgSend(a2, "argument"));
    uint64_t v8 = *(void **)(*(void *)(a1[9] + 8) + 40);
    if (!v8)
    {
      *(void *)(*(void *)(a1[9] + 8) + 40) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void **)(*(void *)(a1[9] + 8) + 40);
    }
    uint64_t v9 = _NSInflectionLanguageWithLensAndRange(a1[5], v4, v6);
    return [v8 addObject:v9];
  }
  unint64_t v11 = (void *)[a2 argument];
  uint64_t v12 = a1[5];
  uint64_t v13 = [a2 replacementRangeInResult];
  uint64_t v15 = (void *)_NSInflectionGrammarWithLensAndRange(v12, v13, v14);
  uint64_t result = _NSIsNSString();
  if (result) {
    goto LABEL_16;
  }
  uint64_t result = _NSIsNSAttributedString();
  if (result)
  {
    uint64_t result = [v11 string];
    unint64_t v11 = (void *)result;
LABEL_16:
    if (v11)
    {
      if (v15) {
        uint64_t v16 = [v15 partOfSpeech];
      }
      else {
        uint64_t v16 = 0;
      }
      _NSInflectionLanguageWithLensAndRange(a1[5], v4, v6);
      unint64_t v17 = (void *)(*(uint64_t (**)(void))(a1[6] + 16))();
      uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[7] + 16))(a1[7], [v17 allPossibleWordAttributesForWord:v11], v16);
    }
  }
  if (v15)
  {
    uint64_t v18 = a1[4];
    return -[NSMorphology mergeMorphology:override:](v18, v15, 0);
  }
  return result;
}

void *___NSInflect_block_invoke_31(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _NSInflectionLanguageWithLensAndRange(a1[4], a3, a4);
  uint64_t result = (void *)(*(uint64_t (**)(void))(a1[5] + 16))();
  if (result)
  {
    uint64_t v9 = (void *)[result allPossibleWordAttributesForWord:a2];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t result = (void *)[v9 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (result)
    {
      uint64_t v10 = result;
      uint64_t v11 = *(void *)v15;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t result = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v12) partOfSpeech];
        if (result != (void *)9) {
          break;
        }
        if (v10 == (void *)++v12)
        {
          uint64_t result = (void *)[v9 countByEnumeratingWithState:&v14 objects:v13 count:16];
          uint64_t v10 = result;
          if (result) {
            goto LABEL_4;
          }
          *(void *)(*(void *)(a1[6] + 8) + 24) |= 1uLL;
          *a5 = 1;
          return result;
        }
      }
    }
  }
  return result;
}

void *___NSInflect_block_invoke_36(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (a2)
  {
    uint64_t v10 = result;
    uint64_t result = (id)[a2 capitalizedStringWithLocale:result[4]];
    *(void *)(*(void *)(v10[5] + 8) + 40) = result;
    uint64_t v11 = *(void *)(v10[6] + 8);
    *(void *)(v11 + 32) = a3;
    *(void *)(v11 + 40) = a4;
  }
  *a7 = 1;
  return result;
}

void ___NSInflect_block_invoke_2_40(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v9 = (*(uint64_t (**)(void))(a1[5] + 16))();
    if (!v9 || (uint64_t v10 = v9, (_NSIsNSString() & 1) == 0)) {
      uint64_t v10 = (*(uint64_t (**)(void))(a1[6] + 16))();
    }
    uint64_t v11 = objc_msgSend(a2, "_formattedString:withStringLocale:andDisplayLocale:", v10, objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", _NSInflectionLanguageWithLensAndRange(a1[5], a3, a4)), a1[4]);
    if (v11 && ([v11 isEqualToString:v10] & 1) == 0)
    {
      (*(void (**)(void))(a1[7] + 16))();
      uint64_t v12 = *(void (**)(void))(a1[8] + 16);
      v12();
    }
  }
  else
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    long long v14 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v15 = 0;
    }
    *a5 = 1;
  }
}

@end