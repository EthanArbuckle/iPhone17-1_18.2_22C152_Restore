@interface EARLMTKaldiVocab
@end

@implementation EARLMTKaldiVocab

void __52___EARLMTKaldiVocab_initWithContentsOfUrl_outError___block_invoke(void *a1, void *a2, unint64_t a3, unsigned char *a4)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (([v7 isEqualToString:&stru_1F0A64AB0] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v9 = [v7 componentsSeparatedByCharactersInSet:v8];

    if ([v9 count] == 2)
    {
      v10 = [v9 objectAtIndex:0];
      v11 = [v9 objectAtIndex:1];
      if (a3 > 3)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v10 UTF8String]);
        uint64_t v18 = a1[4];
        uint64_t v19 = *(void *)(v18 + 64);
        v22 = __p;
        *((void *)std::__hash_table<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::__list_iterator<std::pair<std::string,std::vector<std::string>>,void *>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v18 + 40, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v22)+ 5) = (int)v19;
        if (v21 < 0) {
          operator delete(__p[0]);
        }
      }
      else if ([v10 isEqualToString:@"<VocabSize>"])
      {
        *(void *)(*(void *)(a1[6] + 8) + 24) = (int)[v11 intValue];
      }
      else if ([v10 isEqualToString:@"<UnknownWord>"])
      {
        objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v11);
      }
      else if ([v10 isEqualToString:@"<BeginOfSentenceWord>"])
      {
        objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v11);
      }
      else if ([v10 isEqualToString:@"<EndOfSentenceWord>"])
      {
        objc_storeStrong((id *)(*(void *)(a1[9] + 8) + 40), v11);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v13 = [NSString stringWithFormat:@"Incorrect format of vocab file for line=%@", v7];
      v24[0] = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      uint64_t v15 = [v12 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v14];
      uint64_t v16 = *(void *)(a1[5] + 8);
      v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      *a4 = 1;
    }
  }
}

@end