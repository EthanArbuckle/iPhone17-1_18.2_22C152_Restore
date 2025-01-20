@interface EARNLTokenizer
@end

@implementation EARNLTokenizer

void __28___EARNLTokenizer_tokenize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  v8 = (quasar *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 17))
  {
    PunctuationReplacements = (void *)quasar::getPunctuationReplacements(v8);
    if (v9)
    {
      [(quasar *)v9 ear_toString];
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v18 = 0;
    }
    v11 = std::__hash_table<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::variant<kaldi::quasar::ShortlistDataInManyFiles::NotLoadedShortListDataOnDisk,std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>>>>>::find<std::string>(PunctuationReplacements, (unsigned __int8 *)__p);
    v12 = v11;
    if (SHIBYTE(v18) < 0)
    {
      operator delete(__p[0]);
      if (!v12) {
        goto LABEL_13;
      }
    }
    else if (!v11)
    {
      goto LABEL_13;
    }
    v13 = v12 + 40;
    if ((char)v12[63] < 0) {
      v13 = (void *)*v13;
    }
    v14 = [NSString stringWithUTF8String:v13];
    if (v14)
    {
      [*(id *)(a1 + 48) addObject:v14];
      goto LABEL_17;
    }
  }
LABEL_13:
  if (*(unsigned char *)(*(void *)(a1 + 40) + 16))
  {
    v15 = [(quasar *)v9 lowercaseString];
  }
  else
  {
    v15 = v9;
  }
  v16 = v15;
  [*(id *)(a1 + 48) addObject:v15];

  v14 = 0;
LABEL_17:
}

@end