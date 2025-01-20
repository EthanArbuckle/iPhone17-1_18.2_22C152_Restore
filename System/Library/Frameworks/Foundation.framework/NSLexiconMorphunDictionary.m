@interface NSLexiconMorphunDictionary
@end

@implementation NSLexiconMorphunDictionary

void __64___NSLexiconMorphunDictionary_allPossibleWordAttributesForWord___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  CFTypeRef cf = 0;
  uint64_t v6 = off_1EB1ED480(*(void *)(*(void *)(a1 + 32) + 24), a2, &cf);
  p_inst_meths = &OBJC_PROTOCOL___NSFileAccessArbiterXPCInterface.inst_meths;
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v8 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl(&dword_181795000, v8, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining the token chain from a word): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v6)
  {
    CFArrayRef v16 = 0;
    uint64_t v9 = 0;
LABEL_34:
    id v18 = 0;
    char v19 = 1;
    char v17 = 1;
    goto LABEL_35;
  }
  CFTypeRef cf = 0;
  uint64_t v9 = off_1EB1ED488(*(void *)(*(void *)(a1 + 32) + 16), v6, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v10 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl(&dword_181795000, v10, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Annotating the token chain): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v9)
  {
    CFArrayRef v16 = 0;
    goto LABEL_34;
  }
  CFTypeRef cf = 0;
  uint64_t v11 = off_1EB1ED490(v9, 0, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v12 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl(&dword_181795000, v12, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining the first token): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  unsigned __int8 v13 = off_1EB1ED498(v11, 6, &cf);
  if ((v13 & (cf == 0)) != 0) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = 0;
  }
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v15 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl(&dword_181795000, v15, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Checking that the token is the correct type): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
    goto LABEL_30;
  }
  if (!v14)
  {
LABEL_30:
    CFArrayRef v16 = 0;
LABEL_31:
    char v17 = 0;
    id v18 = 0;
    char v19 = 1;
    goto LABEL_35;
  }
  CFTypeRef cf = 0;
  CFArrayRef v16 = (const __CFArray *)off_1EB1ED4A0(v14, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v20 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl(&dword_181795000, v20, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Casting a token to obtain a morphological word token): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v16) {
    goto LABEL_31;
  }
  CFTypeRef cf = 0;
  CFArrayRef v16 = (const __CFArray *)off_1EB1ED4A8(v16, &cf);
  if (cf)
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v21 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFTypeRef v34 = cf;
      _os_log_error_impl(&dword_181795000, v21, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining the lemma mappings for a morphological word token): %{public}@", buf, 0xCu);
    }
    CFRelease(cf);
  }
  if (!v16) {
    goto LABEL_31;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFIndex Count = CFArrayGetCount(v16);
  if (Count < 1)
  {
    char v19 = 0;
    char v17 = 0;
  }
  else
  {
    CFIndex v23 = Count;
    v31 = a4;
    for (CFIndex i = 0; i != v23; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v16, i);
      CFTypeRef cf = 0;
      uint64_t v26 = off_1EB1ED4B0(ValueAtIndex, &cf);
      if (cf)
      {
        if (_NSInflectionLog_onceToken != -1) {
          dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
        }
        v27 = p_inst_meths[139];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          CFTypeRef v34 = cf;
          _os_log_error_impl(&dword_181795000, v27, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining surface form grammemes): %{public}@", buf, 0xCu);
        }
        CFRelease(cf);
      }
      else
      {
        v28 = (void *)off_1EB1ED4B8(*(void *)(*(void *)(a1 + 32) + 32), v26, &cf);
        if (cf)
        {
          if (_NSInflectionLog_onceToken != -1) {
            dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
          }
          v29 = p_inst_meths[139];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            CFTypeRef v34 = cf;
            _os_log_error_impl(&dword_181795000, v29, OS_LOG_TYPE_ERROR, "Cannot use inflection engine (Obtaining dictionary names for grammemes): %{public}@", buf, 0xCu);
          }
          CFRelease(cf);
        }
        else
        {
          v30 = [[NSMorphology alloc] initWithMorphunAttributeValues:v28];
          if ([(NSMorphology *)v30 partOfSpeech] != (NSGrammaticalPartOfSpeechAbbreviation|NSGrammaticalPartOfSpeechDeterminer)) {
            [v18 addObject:v30];
          }
        }
        p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSFileAccessArbiterXPCInterface + 24);
      }
    }
    char v19 = 0;
    char v17 = 0;
    a4 = v31;
  }
LABEL_35:
  if ([v18 count])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v18;
    *a4 = 1;
    if (v19) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }

  if ((v19 & 1) == 0) {
LABEL_37:
  }
    CFRelease(v16);
LABEL_38:
  if ((v17 & 1) == 0) {
    off_1EB1ED4C0(v9);
  }
  if (v6) {
    off_1EB1ED4C0(v6);
  }
}

@end