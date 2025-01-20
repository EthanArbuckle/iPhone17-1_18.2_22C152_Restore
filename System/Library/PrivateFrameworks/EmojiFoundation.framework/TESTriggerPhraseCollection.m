@interface TESTriggerPhraseCollection
- (BOOL)_shouldRecompileTrie:(id)a3;
- (NSLocale)locale;
- (TESTriggerPhraseCollection)initWithLocale:(id)a3;
- (TESTriggerPhraseLoader)triggerPhraseLoader;
- (id).cxx_construct;
- (id)_dispatchQueue;
- (id)_trieBlobURL;
- (void)_buildAndLoadTrie;
- (void)_loadTrie;
- (void)dealloc;
- (void)enumerateMatchStringsInString:(id)a3 searchRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)waitForSync;
@end

@implementation TESTriggerPhraseCollection

- (TESTriggerPhraseCollection)initWithLocale:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TESTriggerPhraseCollection;
  v5 = [(TESTriggerPhraseCollection *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v6;

    v8 = [TESTriggerPhraseLoader alloc];
    v9 = [(TESTriggerPhraseCollection *)v5 locale];
    v10 = [v9 localeIdentifier];
    uint64_t v11 = [(TESTriggerPhraseLoader *)v8 initWithLocaleIdentifier:v10];
    v12 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v11;

    uint64_t v13 = *((void *)v5 + 1);
    *((void *)v5 + 1) = 0;
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
    [(TESTriggerPhraseCollection *)v5 _loadTrie];
  }

  return v5;
}

- (id)_dispatchQueue
{
  if (-[TESTriggerPhraseCollection _dispatchQueue]::onceToken != -1) {
    dispatch_once(&-[TESTriggerPhraseCollection _dispatchQueue]::onceToken, &__block_literal_global_13);
  }
  v2 = (void *)-[TESTriggerPhraseCollection _dispatchQueue]::__queue;
  return v2;
}

uint64_t __44__TESTriggerPhraseCollection__dispatchQueue__block_invoke()
{
  -[TESTriggerPhraseCollection _dispatchQueue]::__queue = (uint64_t)dispatch_queue_create("com.apple.EmojiFoundation.triggers-collection", 0);
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  uint64_t v3 = *((void *)self + 1);
  if (v3)
  {
    *((void *)self + 1) = 0;
    (*(void (**)(uint64_t, SEL))(*(void *)v3 + 8))(v3, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)TESTriggerPhraseCollection;
  [(TESTriggerPhraseCollection *)&v4 dealloc];
}

- (void)enumerateMatchStringsInString:(id)a3 searchRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v30 = (void (**)(id, NSUInteger, NSUInteger, void, char *))a5;
  v29 = (std::mutex *)((char *)self + 40);
  std::mutex::lock((std::mutex *)((char *)self + 40));
  if (*((void *)self + 1))
  {
    v32 = objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet", v29);
    v31 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    unint64_t v10 = [v9 length];
    if (v10 >= length) {
      NSUInteger v11 = length;
    }
    else {
      NSUInteger v11 = v10;
    }
    if (location < [v9 length])
    {
      v38[0] = 0;
      memset(&v37, 0, sizeof(v37));
      if (location < v11)
      {
        while (1)
        {
          (*(void (**)(uint64_t *__return_ptr))(**((void **)self + 1) + 104))(&v35);
          NSUInteger v12 = location;
          while (1)
          {
            if (((*(uint64_t (**)(void, uint64_t *))(**((void **)self + 1) + 112))(*((void *)self + 1), &v35) & 1) == 0)
            {
LABEL_38:
              char v27 = 0;
              goto LABEL_39;
            }
            uint64_t v13 = [(TESTriggerPhraseCollection *)self locale];
            v14 = [v9 getLowercaseCharacterAt:v12 locale:v13];

            std::basic_string<char16_t>::size_type v15 = [v14 length];
            std::basic_string<char16_t>::size_type size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
            char v17 = HIBYTE(v37.__r_.__value_.__r.__words[2]);
            if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              std::basic_string<char16_t>::size_type size = v37.__r_.__value_.__l.__size_;
            }
            if (v15 > size)
            {
              std::basic_string<char16_t>::resize(&v37, v15, 0);
              char v17 = HIBYTE(v37.__r_.__value_.__r.__words[2]);
            }
            if (v17 >= 0) {
              v18 = &v37;
            }
            else {
              v18 = (std::basic_string<char16_t> *)v37.__r_.__value_.__r.__words[0];
            }
            [v14 getCharacters:v18];
            (*(void (**)(uint64_t *__return_ptr))(**((void **)self + 1) + 120))(&v33);
            uint64_t v35 = v33;
            std::string::operator=(&v36, &__p);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            LOWORD(v33) = 0;
            v19 = v9;
            if ((*(uint64_t (**)(void, uint64_t *, uint64_t *))(**((void **)self + 1) + 128))(*((void *)self + 1), &v35, &v33))break; {
            NSUInteger v20 = v12 + 1;
            }
LABEL_36:

            NSUInteger v12 = v20;
            BOOL v26 = v20 >= v11;
            id v9 = v19;
            if (v26) {
              goto LABEL_38;
            }
          }
          NSUInteger v20 = v12 + 1;
          if (v12 + 1 == v11)
          {
            int v21 = 0;
            if (!location) {
              goto LABEL_28;
            }
          }
          else
          {
            uint64_t v22 = [v19 characterAtIndex:v12 + 1];
            if ([v32 characterIsMember:v22])
            {
              int v21 = 1;
              if (!location) {
                goto LABEL_28;
              }
            }
            else
            {
              int v21 = [v31 characterIsMember:v22];
              if (!location) {
                goto LABEL_28;
              }
            }
          }
          uint64_t v23 = [v19 characterAtIndex:location - 1];
          if ([v32 characterIsMember:v23])
          {
LABEL_28:
            int v24 = 1;
            goto LABEL_30;
          }
          int v24 = [v31 characterIsMember:v23];
LABEL_30:
          if (v20 == v11) {
            int v25 = 1;
          }
          else {
            int v25 = v21;
          }
          if (v25 != 1) {
            goto LABEL_36;
          }
          if (!v24) {
            goto LABEL_36;
          }
          v30[2](v30, location, v12 - location + 1, (unsigned __int16)v33, v38);
          if (!v38[0]) {
            goto LABEL_36;
          }

          char v27 = 1;
          id v9 = v19;
LABEL_39:
          if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v36.__r_.__value_.__l.__data_);
          }
          if (++location == v11) {
            char v28 = 1;
          }
          else {
            char v28 = v27;
          }
          if (v28)
          {
            if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v37.__r_.__value_.__l.__data_);
            }
            break;
          }
        }
      }
    }
  }
  std::mutex::unlock(v29);
}

- (void)waitForSync
{
  uint64_t v3 = [(TESTriggerPhraseCollection *)self _dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__TESTriggerPhraseCollection_waitForSync__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __41__TESTriggerPhraseCollection_waitForSync__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = emf_logging_get_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) locale];
    int v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1B8C45000, v2, OS_LOG_TYPE_INFO, "[TESTriggerPhraseCollection] preheat for %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_trieBlobURL
{
  CFURLRef v3 = CEM::copyLibraryKeyboardDirectoryURL((CEM *)self);
  int v4 = [(TESTriggerPhraseCollection *)self locale];
  v5 = [v4 languageCode];

  uint64_t v6 = [NSString stringWithFormat:@"TextEffectPhrases_%@.dat", v5];
  v7 = [(__CFURL *)v3 URLByAppendingPathComponent:v6];

  return v7;
}

- (BOOL)_shouldRecompileTrie:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9B8] SHA224ChecksumSize];
  uint64_t v6 = objc_msgSend(v4, "subdataWithRange:", 0, v5);
  v7 = [(TESTriggerPhraseCollection *)self triggerPhraseLoader];
  v8 = [v7 plistPath];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
    unint64_t v10 = v9;
    if (v9 && (unint64_t v11 = [v9 length], v11 >= objc_msgSend(MEMORY[0x1E4F1C9B8], "SHA224ChecksumSize")))
    {
      uint64_t v13 = objc_msgSend(v10, "subdataWithRange:", 0, v5);
      int v12 = [v6 isEqualToData:v13] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_loadTrie
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_ERROR, "Failed to open file for serialized trie: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_buildAndLoadTrie
{
  uint64_t v3 = [(TESTriggerPhraseCollection *)self _dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke;
  block[3] = &unk_1E61A9BD0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) triggerPhraseLoader];
  int v2 = [v1 items];

  v40[0] = 0;
  v40[1] = 0;
  v39 = v40;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v8 = [v2 objectForKeyedSubscript:v7];
        __int16 v9 = +[TESLocaleData textEffectTypeForAnimationName:v8];

        unint64_t v10 = [v7 lowercaseString];
        CEM::getUTF16StringFromCFString(v10, (uint64_t)&__p);
        LOWORD(v29) = v9;
        std::__tree<std::__value_type<std::basic_string<char16_t>,unsigned short>,std::__map_value_compare<std::basic_string<char16_t>,std::__value_type<std::basic_string<char16_t>,unsigned short>,std::less<std::basic_string<char16_t>>,true>,std::allocator<std::__value_type<std::basic_string<char16_t>,unsigned short>>>::__emplace_unique_key_args<std::basic_string<char16_t>,std::basic_string<char16_t> const&,unsigned short>(&v39, (unsigned __int16 *)&__p, (uint64_t)&__p, &v29);
        if (SHIBYTE(v34) < 0) {
          operator delete(__p);
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v4);
  }

  std::string __p = 0;
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  unint64_t v11 = v39;
  if (v39 != v40)
  {
    do
    {
      int v12 = (long long *)(v11 + 4);
      uint64_t v13 = v33;
      if ((unint64_t)v33 >= v34)
      {
        std::basic_string<char16_t>::size_type v15 = (std::basic_string<char16_t> *)std::vector<std::basic_string<char16_t>>::__emplace_back_slow_path<std::basic_string<char16_t> const&>((uint64_t)&__p, v12);
      }
      else
      {
        if (*((char *)v11 + 55) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v33, (const std::basic_string<char16_t>::value_type *)v11[4], v11[5]);
        }
        else
        {
          long long v14 = *v12;
          v33->__r_.__value_.__r.__words[2] = v11[6];
          *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
        }
        std::basic_string<char16_t>::size_type v15 = v13 + 1;
      }
      uint64_t v33 = v15;
      v16 = v30;
      if (v30 >= v31)
      {
        v18 = (char *)v29;
        uint64_t v19 = v30 - (unsigned char *)v29;
        if (v30 - (unsigned char *)v29 <= -3) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v20 = v19 >> 1;
        if (v31 - (unsigned char *)v29 <= (unint64_t)((v19 >> 1) + 1)) {
          uint64_t v21 = v20 + 1;
        }
        else {
          uint64_t v21 = v31 - (unsigned char *)v29;
        }
        if ((unint64_t)(v31 - (unsigned char *)v29) >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v22 = v21;
        }
        if (v22)
        {
          uint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>((uint64_t)&v31, v22);
          v18 = (char *)v29;
          v16 = v30;
        }
        else
        {
          uint64_t v23 = 0;
        }
        int v24 = &v23[2 * v20];
        *(_WORD *)int v24 = *((_WORD *)v11 + 28);
        char v17 = v24 + 2;
        while (v16 != v18)
        {
          __int16 v25 = *((_WORD *)v16 - 1);
          v16 -= 2;
          *((_WORD *)v24 - 1) = v25;
          v24 -= 2;
        }
        v29 = v24;
        v30 = v17;
        v31 = &v23[2 * v22];
        if (v18) {
          operator delete(v18);
        }
      }
      else
      {
        *(_WORD *)v30 = *((_WORD *)v11 + 28);
        char v17 = v16 + 2;
      }
      v30 = v17;
      BOOL v26 = (uint64_t *)v11[1];
      if (v26)
      {
        do
        {
          char v27 = v26;
          BOOL v26 = (uint64_t *)*v26;
        }
        while (v26);
      }
      else
      {
        do
        {
          char v27 = (uint64_t *)v11[2];
          BOOL v28 = *v27 == (void)v11;
          unint64_t v11 = v27;
        }
        while (!v28);
      }
      unint64_t v11 = v27;
    }
    while (v27 != v40);
  }
  operator new();
}

- (NSLocale)locale
{
  return (NSLocale *)*((void *)self + 13);
}

- (TESTriggerPhraseLoader)triggerPhraseLoader
{
  return (TESTriggerPhraseLoader *)*((void *)self + 14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 14, 0);
  objc_storeStrong((id *)self + 13, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 40));
  if (*((char *)self + 39) < 0) {
    operator delete(*((void **)self + 2));
  }
  uint64_t v3 = *((void *)self + 1);
  *((void *)self + 1) = 0;
  if (v3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)v3 + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((void *)self + 5) = 850045863;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  return self;
}

void __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B8C45000, a2, OS_LOG_TYPE_ERROR, "Failed to open file path for trie serialization: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __47__TESTriggerPhraseCollection__buildAndLoadTrie__block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1B8C45000, log, OS_LOG_TYPE_ERROR, "Failed to compile the trie for locale: %{public}@", buf, 0xCu);
}

@end