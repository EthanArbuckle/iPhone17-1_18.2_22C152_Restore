@interface _NSLexiconMorphunDictionary
- (NSString)languageCode;
- (_NSLexiconMorphunDictionary)initWithLanguage:(id)a3;
- (id)allPossibleWordAttributesForWord:(id)a3;
- (id)preferredPronoun:(id)a3 forTermOfAddress:(id)a4 morphology:(id)a5 dependency:(id)a6;
- (void)_iterateFormsOfWord:(id)a3 usingBlock:(id)a4;
- (void)dealloc;
@end

@implementation _NSLexiconMorphunDictionary

- (_NSLexiconMorphunDictionary)initWithLanguage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)_NSLexiconMorphunDictionary;
  v4 = [(_NSLexiconMorphunDictionary *)&v18 init];
  if (v4)
  {
    if (qword_1EB1ED530 != -1) {
      dispatch_once(&qword_1EB1ED530, &__block_literal_global_30);
    }
    if (!off_1EB1ED400 || !_NSRequiresMorphunInflectionForLanguageIdentifier(a3)) {
      goto LABEL_49;
    }
    if (qword_1EB1ED530 != -1) {
      dispatch_once(&qword_1EB1ED530, &__block_literal_global_30);
    }
    if (!off_1EB1ED400) {
      __assert_rtn("_NSLexiconGetMorphunAnalyzerFactory", "NSLexiconMorphun.m", 564, "_NSLexiconLoadMorphunIfNeeded()");
    }
    if (qword_1EB1ED578 != -1) {
      dispatch_once(&qword_1EB1ED578, &__block_literal_global_350);
    }
    uint64_t v5 = qword_1EB1ED570;
    if (!qword_1EB1ED570) {
      goto LABEL_49;
    }
    v6 = (void *)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
    if (v6)
    {
      CFTypeRef cf = 0;
      uint64_t v7 = off_1EB1ED458(v5, v6, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v8 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v20 = a3;
          __int16 v21 = 2114;
          CFTypeRef v22 = cf;
          _os_log_error_impl(&dword_181795000, v8, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Getting analyzer from factory): %{public}@", buf, 0x16u);
        }
        CFRelease(cf);
      }
      if (v7)
      {
        CFTypeRef cf = 0;
        uint64_t v9 = off_1EB1ED460(v6, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v10 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v20 = a3;
            __int16 v21 = 2114;
            CFTypeRef v22 = cf;
            _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Creating a tokenizer): %{public}@", buf, 0x16u);
          }
          CFRelease(cf);
        }
        CFTypeRef cf = 0;
        off_1EB1ED468(v9, 2, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v11 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v20 = a3;
            __int16 v21 = 2114;
            CFTypeRef v22 = cf;
            _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Setting the tokenizer to use the unmodified style): %{public}@", buf, 0x16u);
          }
          CFRelease(cf);
          off_1EB1ED470(v9);
          int v12 = 0;
          uint64_t v9 = 0;
        }
        else
        {
          if (v9)
          {
            CFTypeRef cf = 0;
            uint64_t v13 = off_1EB1ED478(v6, &cf);
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v15 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                id v20 = a3;
                __int16 v21 = 2114;
                CFTypeRef v22 = cf;
                _os_log_error_impl(&dword_181795000, v15, OS_LOG_TYPE_ERROR, "Cannot use inflection engine for language %{public}@ (Getting the dictionary for this locale): %{public}@", buf, 0x16u);
              }
              CFRelease(cf);
            }
            int v12 = 1;
            goto LABEL_44;
          }
          int v12 = 0;
        }
        uint64_t v13 = 0;
LABEL_44:
        int v14 = 1;
        goto LABEL_45;
      }
      int v12 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      int v12 = 0;
      uint64_t v9 = 0;
      uint64_t v7 = 0;
    }
    int v14 = 0;
    uint64_t v13 = 0;
LABEL_45:
    v4->_languageCode = (NSString *)objc_msgSend((id)objc_msgSend(a3, "lowercaseString"), "copy");
    if (v12 && v14 && v13)
    {
      v4->_analyzer = (MANAConfigurableAnalyzer *)v7;
      v4->_tokenizer = (MTokenizer *)v9;
      v4->_dictionary = (const MDDictionaryMetaData *)v13;
      v4->_appropriateLocale = (NSLocale *)[v6 copy];
      return v4;
    }
LABEL_49:

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    off_1EB1ED470(tokenizer);
  }

  v4.receiver = self;
  v4.super_class = (Class)_NSLexiconMorphunDictionary;
  [(_NSLexiconMorphunDictionary *)&v4 dealloc];
}

- (id)allPossibleWordAttributesForWord:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__10;
  int v12 = __Block_byref_object_dispose__10;
  uint64_t v13 = 0;
  appropriateLocale = self->_appropriateLocale;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64___NSLexiconMorphunDictionary_allPossibleWordAttributesForWord___block_invoke;
  v7[3] = &unk_1E51F95F0;
  v7[4] = self;
  v7[5] = &v8;
  _NSLexiconIterateFormsOfWord(a3, (uint64_t)appropriateLocale, (uint64_t)v7);
  objc_super v4 = (void *)v9[5];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)preferredPronoun:(id)a3 forTermOfAddress:(id)a4 morphology:(id)a5 dependency:(id)a6
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED530 != -1) {
    dispatch_once(&qword_1EB1ED530, &__block_literal_global_30);
  }
  if (!off_1EB1ED400) {
    return 0;
  }
  id result = (id)objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", -[_NSLexiconMorphunDictionary languageCode](self, "languageCode"));
  if (result)
  {
    id v12 = result;
    CFTypeRef cf = 0;
    uint64_t v13 = off_1EB1ED400(&cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mlccfp_getDefaultCommonConceptFactoryProvider(&error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
LABEL_27:
      _os_log_error_impl(&dword_181795000, v14, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_9:
      CFRelease(cf);
LABEL_10:
      v15 = 0;
      return v15;
    }
    if (!v13) {
      goto LABEL_10;
    }
    CFTypeRef cf = 0;
    uint64_t v16 = off_1EB1ED408(v13, v12, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mlccfp_getCommonConceptFactory(provider, (CFLocaleRef)locale, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
      goto LABEL_27;
    }
    if (!v16) {
      goto LABEL_10;
    }
    CFTypeRef cf = 0;
    uint64_t v17 = off_1EB1ED410(v16, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mccf_getSemanticFeatureModel(factory, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
      goto LABEL_27;
    }
    uint64_t v18 = v17;
    if (!v17) {
      goto LABEL_10;
    }
    CFTypeRef cf = 0;
    uint64_t v19 = off_1EB1ED4D0(v17, a3, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v14 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mpron_createFromInitialPronoun(model, (CFStringRef)original, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
      goto LABEL_27;
    }
    uint64_t v20 = v19;
    if (!v19) {
      goto LABEL_10;
    }
    uint64_t v86 = v18;
    CFTypeRef cf = 0;
    uint64_t v21 = off_1EB1ED4D8(v19, &cf);
    CFTypeRef v22 = &qword_1EB1ED000;
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      uint64_t v23 = _NSInflectionLog_log;
      if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136315394;
      v105 = "mpron_toSemanticFeatureConcept(pronoun, &error)";
      __int16 v106 = 2112;
      CFTypeRef v107 = cf;
LABEL_65:
      _os_log_error_impl(&dword_181795000, v23, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_39:
      CFRelease(cf);
LABEL_40:
      v15 = 0;
      v24 = 0;
      uint64_t v25 = v20;
      goto LABEL_41;
    }
    uint64_t v26 = v21;
    if (!v21) {
      goto LABEL_40;
    }
    id v79 = a3;
    id v80 = v12;
    if (objc_msgSend(a4, "isEqual:", +[NSTermOfAddress feminine](NSTermOfAddress, "feminine")))
    {
      CFTypeRef cf = 0;
      off_1EB1ED4E0(v26, @"gender", @"feminine", &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        uint64_t v23 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, @\"gender\", @\"feminine\", &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
        goto LABEL_65;
      }
      uint64_t v87 = v26;
      uint64_t v82 = v20;
LABEL_89:
      uint64_t v81 = 0;
      theArray = 0;
      id v78 = 0;
      if (!a5) {
        goto LABEL_103;
      }
LABEL_90:
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      v38 = objc_msgSend(a5, "_morphunConstraints", v76);
      uint64_t v39 = [v38 countByEnumeratingWithState:&v90 objects:v89 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v91;
        do
        {
          uint64_t v42 = 0;
          do
          {
            if (*(void *)v91 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v90 + 1) + 8 * v42);
            uint64_t v44 = objc_msgSend((id)objc_msgSend(a5, "_morphunConstraints"), "objectForKeyedSubscript:", v43);
            CFTypeRef cf = 0;
            off_1EB1ED4E0(v87, v43, v44, &cf);
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v45 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, (__bridge CFStringRef)grammeme, (__bridge"
                       " CFStringRef)value, &error)";
                __int16 v106 = 2112;
                CFTypeRef v107 = cf;
                _os_log_error_impl(&dword_181795000, v45, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
              }
              CFRelease(cf);
            }
            ++v42;
          }
          while (v40 != v42);
          uint64_t v40 = [v38 countByEnumeratingWithState:&v90 objects:v89 count:16];
        }
        while (v40);
      }
LABEL_103:
      CFTypeRef cf = 0;
      char v46 = off_1EB1ED508(v87, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v47 = _NSInflectionLog_log;
        if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
          goto LABEL_107;
        }
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_isExists(pronounSemanticFeatureConcept, &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
LABEL_137:
        _os_log_error_impl(&dword_181795000, v47, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_107:
        CFRelease(cf);
LABEL_188:
        v15 = 0;
        goto LABEL_189;
      }
      if ((v46 & 1) == 0) {
        goto LABEL_188;
      }
      if (a6)
      {
        CFTypeRef cf = 0;
        uint64_t v48 = off_1EB1ED418(a6, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v47 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_107;
          }
          *(_DWORD *)buf = 136315394;
          v105 = "mss_create((CFStringRef)dependency, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
          goto LABEL_137;
        }
        uint64_t v51 = v48;
        if (!v48) {
          goto LABEL_188;
        }
        CFTypeRef cf = 0;
        uint64_t v52 = off_1EB1ED420(v86, v48, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v53 = _NSInflectionLog_log;
          if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v105 = "minf_create(model, dependencySpeakableString, &error)";
            __int16 v106 = 2112;
            CFTypeRef v107 = cf;
            _os_log_error_impl(&dword_181795000, v53, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
          }
          CFRelease(cf);
          goto LABEL_135;
        }
        uint64_t v70 = v52;
        if (!v52)
        {
LABEL_135:
          off_1EB1ED448(v51);
          goto LABEL_188;
        }
        CFTypeRef cf = 0;
        uint64_t v71 = off_1EB1ED510(v52, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v72 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_186;
          }
          *(_DWORD *)buf = 136315394;
          v105 = "minf_toSemanticFeatureConcept(dependencyInflectableStringConcept, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
LABEL_214:
          _os_log_error_impl(&dword_181795000, v72, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
LABEL_186:
          CFRelease(cf);
LABEL_187:
          off_1EB1ED448(v51);
          off_1EB1ED450(v70);
          goto LABEL_188;
        }
        if (!v71) {
          goto LABEL_187;
        }
        CFTypeRef cf = 0;
        uint64_t v75 = off_1EB1ED518(v87, v71, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v72 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_186;
          }
          *(_DWORD *)buf = 136315394;
          v105 = "msfc_toSpeakableStringWithDependencyCopy(pronounSemanticFeatureConcept, dependencySemanticFeatureConcept, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
          goto LABEL_214;
        }
        uint64_t v54 = v75;
        if (!v75) {
          goto LABEL_187;
        }
        off_1EB1ED448(v51);
        off_1EB1ED450(v70);
      }
      else
      {
        CFTypeRef cf = 0;
        uint64_t v50 = off_1EB1ED520(v87, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v47 = _NSInflectionLog_log;
          if (!os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR)) {
            goto LABEL_107;
          }
          *(_DWORD *)buf = 136315394;
          v105 = "msfc_toSpeakableStringCopy(pronounSemanticFeatureConcept, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
          goto LABEL_137;
        }
        uint64_t v54 = v50;
        if (!v50) {
          goto LABEL_188;
        }
      }
      CFTypeRef cf = 0;
      uint64_t v55 = off_1EB1ED440(v54, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v56 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v105 = "(NSString *)mss_createPrintCopy(speakableResult, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
          _os_log_error_impl(&dword_181795000, v56, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        }
        CFRelease(cf);
      }
      else
      {
        v73 = (void *)v55;
        if (v55)
        {
          if (v81 && ![a4 _containsPronoun:v55 withGrammemes:v78])
          {
            v73 = 0;
            v15 = 0;
          }
          else
          {
            if (objc_msgSend(v79, "isEqualToString:", objc_msgSend(v79, "lowercaseStringWithLocale:", v80, v76)))
            {
              v74 = (void *)[v73 lowercaseStringWithLocale:v80];
            }
            else if (objc_msgSend(v79, "isEqualToString:", objc_msgSend(v79, "uppercaseStringWithLocale:", v80)))
            {
              v74 = (void *)[v73 uppercaseStringWithLocale:v80];
            }
            else if (objc_msgSend(v79, "isEqualToString:", objc_msgSend(v79, "capitalizedStringWithLocale:", v80)))
            {
              v74 = (void *)[v73 capitalizedStringWithLocale:v80];
            }
            else
            {
              v74 = v73;
            }
            v15 = (void *)[v74 copy];
          }

          goto LABEL_212;
        }
      }
      v15 = 0;
LABEL_212:
      off_1EB1ED448(v54);
LABEL_189:
      CFTypeRef v22 = &qword_1EB1ED000;
      off_1EB1ED528(v82);
      uint64_t v25 = v81;
      v24 = theArray;
      if (!v81)
      {
LABEL_42:
        if (v24) {
          CFRelease(v24);
        }
        return v15;
      }
LABEL_41:
      ((void (*)(uint64_t))v22[165])(v25);
      goto LABEL_42;
    }
    uint64_t v82 = v20;
    uint64_t v87 = v26;
    if (objc_msgSend(a4, "isEqual:", +[NSTermOfAddress masculine](NSTermOfAddress, "masculine")))
    {
      CFTypeRef cf = 0;
      off_1EB1ED4E0(v26, @"gender", @"masculine", &cf);
      if (!cf) {
        goto LABEL_89;
      }
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      v27 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_putConstraintByName(pronounSemanticFeatureConcept, @\"gender\", @\"masculine\", &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
LABEL_180:
        _os_log_error_impl(&dword_181795000, v27, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        goto LABEL_62;
      }
      goto LABEL_62;
    }
    if (objc_msgSend(a4, "isEqual:", +[NSTermOfAddress neutral](NSTermOfAddress, "neutral")))
    {
      CFTypeRef cf = 0;
      off_1EB1ED4E8(v26, @"gender", &cf);
      if (!cf) {
        goto LABEL_89;
      }
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      v27 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "msfc_clearConstraintByName(pronounSemanticFeatureConcept, @\"gender\", &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
        goto LABEL_180;
      }
LABEL_62:
      CFRelease(cf);
      v15 = 0;
      v24 = 0;
      uint64_t v25 = v20;
      goto LABEL_41;
    }
    if (!objc_msgSend((id)objc_msgSend(a4, "pronouns"), "count")) {
      goto LABEL_89;
    }
    theArray = CFArrayCreateMutable(0, objc_msgSend((id)objc_msgSend(a4, "pronouns"), "count"), &_DisplayValueArrayCallbacks);
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obj = (void *)[a4 pronouns];
    uint64_t v28 = [obj countByEnumeratingWithState:&v100 objects:v99 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v101;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v101 != v30) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v100 + 1) + 8 * v31);
          uint64_t v33 = [v32 _morphunConstraints];
          CFTypeRef cf = 0;
          v34 = (const void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, CFTypeRef *))off_1EB1ED4F0)(v86, [v32 pronoun], v33, &cf);
          if (v34)
          {
            v35 = v34;
            if (cf)
            {
              if (_NSInflectionLog_onceToken != -1) {
                dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
              }
              v36 = _NSInflectionLog_log;
              if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v105 = (const char *)cf;
                _os_log_error_impl(&dword_181795000, v36, OS_LOG_TYPE_ERROR, "Inflection engine reported an error in mdv_create: %@", buf, 0xCu);
              }
              off_1EB1ED4C8(v35);
            }
            else
            {
              CFArrayAppendValue(theArray, v34);
            }
          }
          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [obj countByEnumeratingWithState:&v100 objects:v99 count:16];
      }
      while (v29);
    }
    CFTypeRef cf = 0;
    uint64_t v81 = off_1EB1ED4F8(v86, theArray, 0, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      v37 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "mpron_createWithCustom(model, localizedPronouns, nil, &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
        _os_log_error_impl(&dword_181795000, v37, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
      }
      CFRelease(cf);
      goto LABEL_88;
    }
    if (!v81)
    {
LABEL_88:
      v15 = 0;
      uint64_t v25 = v82;
      v24 = theArray;
      CFTypeRef v22 = &qword_1EB1ED000;
      goto LABEL_41;
    }
    CFTypeRef cf = 0;
    uint64_t v77 = off_1EB1ED4D8(v81, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      v49 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v105 = "mpron_toSemanticFeatureConcept(localizedPronoun, &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
        _os_log_error_impl(&dword_181795000, v49, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
      }
      CFRelease(cf);
      goto LABEL_122;
    }
    if (!v77)
    {
LABEL_122:
      CFTypeRef v22 = &qword_1EB1ED000;
      off_1EB1ED528(v82);
      v15 = 0;
      uint64_t v25 = v81;
      v24 = theArray;
      goto LABEL_41;
    }
    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v57 = [&unk_1ECAB6188 countByEnumeratingWithState:&v95 objects:v94 count:16];
    if (!v57) {
      goto LABEL_177;
    }
    uint64_t v59 = v57;
    uint64_t obja = *(void *)v96;
    *(void *)&long long v58 = 136315394;
    long long v76 = v58;
LABEL_149:
    uint64_t v60 = 0;
    while (1)
    {
      if (*(void *)v96 != obja) {
        objc_enumerationMutation(&unk_1ECAB6188);
      }
      uint64_t v61 = *(void *)(*((void *)&v95 + 1) + 8 * v60);
      CFTypeRef cf = 0;
      uint64_t v62 = off_1EB1ED500(v87, v61, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v63 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v76;
          v105 = "msfc_createFeatureValueByNameCopy(pronounSemanticFeatureConcept, (CFStringRef)grammeme, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
          _os_log_error_impl(&dword_181795000, v63, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        }
        CFRelease(cf);
        goto LABEL_175;
      }
      uint64_t v64 = v62;
      if (v62) {
        break;
      }
LABEL_175:
      if (v59 == ++v60)
      {
        uint64_t v59 = [&unk_1ECAB6188 countByEnumeratingWithState:&v95 objects:v94 count:16];
        if (!v59)
        {
LABEL_177:
          uint64_t v87 = v77;
          if (!a5) {
            goto LABEL_103;
          }
          goto LABEL_90;
        }
        goto LABEL_149;
      }
    }
    CFTypeRef cf = 0;
    uint64_t v65 = off_1EB1ED440(v62, &cf);
    if (cf)
    {
      if (_NSInflectionLog_onceToken != -1) {
        dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
      }
      v66 = _NSInflectionLog_log;
      if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v76;
        v105 = "mss_createPrintCopy(grammemeValue, &error)";
        __int16 v106 = 2112;
        CFTypeRef v107 = cf;
        _os_log_error_impl(&dword_181795000, v66, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
      }
      CFTypeRef v67 = cf;
    }
    else
    {
      v68 = (const void *)v65;
      if (!v65)
      {
LABEL_174:
        off_1EB1ED448(v64);
        goto LABEL_175;
      }
      [v78 setObject:v65 forKeyedSubscript:v61];
      CFTypeRef cf = 0;
      off_1EB1ED4E0(v77, v61, v68, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v69 = _NSInflectionLog_log;
        if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v76;
          v105 = "msfc_putConstraintByName(localizedSemanticFeatureConcept, (__bridge CFStringRef)grammeme, grammemeValueString, &error)";
          __int16 v106 = 2112;
          CFTypeRef v107 = cf;
          _os_log_error_impl(&dword_181795000, v69, OS_LOG_TYPE_ERROR, "Inflection engine reported an error for '%s' while attempting to inflect: %@", buf, 0x16u);
        }
        CFRelease(cf);
      }
      CFTypeRef v67 = v68;
    }
    CFRelease(v67);
    goto LABEL_174;
  }
  return result;
}

- (void)_iterateFormsOfWord:(id)a3 usingBlock:(id)a4
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

@end