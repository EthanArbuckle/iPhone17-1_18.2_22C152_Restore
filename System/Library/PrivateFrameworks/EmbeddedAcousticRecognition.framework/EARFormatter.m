@interface EARFormatter
@end

@implementation EARFormatter

void __111___EARFormatter_initWithQuasarConfig_overrideConfigFiles_supportEmojiRecognition_language_skipPathsExistCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    std::string::size_type v17 = 0;
  }
  unint64_t v6 = *(void *)(v5 + 64);
  unint64_t v7 = *(void *)(v5 + 56);
  if (v7 >= v6)
  {
    uint64_t v8 = *(void *)(v5 + 48);
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v8) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<int>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v8) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v5 + 64);
    if (v12) {
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v5 + 64, v12);
    }
    else {
      v13 = 0;
    }
    v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    v14->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v5 + 48), &__v);
    uint64_t v15 = *(void *)(v5 + 56);
    std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
    *(void *)(v5 + 56) = v15;
  }
  else
  {
    *(void *)(v7 + 16) = v17;
    *(_OWORD *)unint64_t v7 = *(_OWORD *)__p;
    *(void *)(v5 + 56) = v7 + 24;
  }
}

void __82___EARFormatter_recognizeEmojiForTokens_emojiTokenIndices_persistEmoji_choiceIdx___block_invoke(uint64_t a1, void *a2, BOOL a3, uint64_t a4)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3)
  {
    a3 = *(unsigned char *)(a1 + 40) == 0;
    a4 += *(unsigned __int8 *)(a1 + 40);
  }
  unint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v12[0] = v7;
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
  v12[1] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v9 addObject:v11];
}

uint64_t __82___EARFormatter_recognizeEmojiForTokens_emojiTokenIndices_persistEmoji_choiceIdx___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectAtIndex:1];
  unint64_t v6 = [v4 objectAtIndex:1];
  uint64_t v7 = [v5 rangeValue];
  uint64_t v8 = [v6 rangeValue];
  unint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
  unint64_t v10 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

@end