@interface SGLexicon
+ (BOOL)profanityInTokens:(id)a3 forLocaleIdentifier:(id)a4;
+ (unsigned)_lexiconTokenForToken:(id)a3 inLexicon:(_LXLexicon *)a4;
@end

@implementation SGLexicon

+ (unsigned)_lexiconTokenForToken:(id)a3 inLexicon:(_LXLexicon *)a4
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  LXLexiconEnumerateEntriesForString();
  unsigned int v5 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);

  return v5;
}

void __45__SGLexicon__lexiconTokenForToken_inLexicon___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef v5 = (const __CFString *)LXEntryCopyString();
  if (CFEqual(v5, *(CFStringRef *)(a1 + 40)))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = LXEntryGetTokenID();
    *a3 = 1;
  }
  CFRelease(v5);
}

+ (BOOL)profanityInTokens:(id)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F72458], v7);
  CFErrorRef err = 0;
  uint64_t v9 = (const void *)LXLexiconCreate();
  CFRelease(Mutable);
  if (v9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(__CFString **)(*((void *)&v23 + 1) + 8 * v14);
        if (!CFStringGetCStringPtr(v15, 4u)
          && !-[__CFString lengthOfBytesUsingEncoding:](v15, "lengthOfBytesUsingEncoding:", 4, (void)v23))
        {
          break;
        }
        if (objc_msgSend(a1, "_lexiconTokenForToken:inLexicon:", v15, v9, (void)v23))
        {
          v16 = (const void *)LXLexiconCopyEntryForTokenID();
          int MetaFlags = LXEntryGetMetaFlags();
          if ((MetaFlags & 0x1800000) != 0)
          {
            CFRelease(v16);
LABEL_24:
            BOOL v20 = 1;
            goto LABEL_25;
          }
          int v18 = MetaFlags;
          CFRelease(v16);
          if ((v18 & 0x2000000) != 0) {
            goto LABEL_24;
          }
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_18;
        }
      }
      v21 = sgLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v21, OS_LOG_TYPE_ERROR, "SGLexicon: non utf-8 token passed", buf, 2u);
      }

      goto LABEL_24;
    }
  }
  else
  {
    CFStringRef v19 = CFErrorCopyDescription(err);
    if (!v19)
    {
      BOOL v20 = 0;
      goto LABEL_26;
    }
    uint64_t v9 = v19;
    int v10 = sgLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v9;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGLexicon: Unable to load lexicon, %@", buf, 0xCu);
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_25:

  CFRelease(v9);
LABEL_26:

  return v20;
}

@end