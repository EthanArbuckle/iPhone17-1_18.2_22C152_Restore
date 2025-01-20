@interface LSContextCreateVisualizer
@end

@implementation LSContextCreateVisualizer

void ___LSContextCreateVisualizer_block_invoke(uint64_t a1, id *a2)
{
  if (a2)
  {

    JUMPOUT(0x18530EAF0);
  }
}

void ___LSContextCreateVisualizer_block_invoke_16(uint64_t a1, int a2, void *a3)
{
  LODWORD(v23) = a2;
  v6 = *(void **)(*(void *)(a1 + 32) + 8);
  v7 = (char *)v6[7];
  unint64_t v8 = v6[8];
  if ((unint64_t)v7 >= v8)
  {
    v10 = (char *)v6[6];
    uint64_t v11 = (v7 - v10) >> 2;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62) {
      abort();
    }
    uint64_t v13 = v8 - (void)v10;
    if (v13 >> 1 > v12) {
      unint64_t v12 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)(v6 + 8), v14);
      v10 = (char *)v6[6];
      v7 = (char *)v6[7];
    }
    else
    {
      v15 = 0;
    }
    v16 = &v15[4 * v11];
    v17 = &v15[4 * v14];
    *(_DWORD *)v16 = a2;
    v9 = v16 + 4;
    while (v7 != v10)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v16 - 1) = v18;
      v16 -= 4;
    }
    v6[6] = v16;
    v6[7] = v9;
    v6[8] = v17;
    if (v10) {
      operator delete(v10);
    }
  }
  else
  {
    *(_DWORD *)v7 = a2;
    v9 = v7 + 4;
  }
  v6[7] = v9;
  uint64_t v19 = objc_msgSend(a3, "copy", v23);
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8) + 48;
  v24 = &v23;
  v21 = std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v20, (unsigned int *)&v23, (uint64_t)&std::piecewise_construct, (_DWORD **)&v24);
  v22 = (void *)v21[3];
  v21[3] = v19;
}

id ___LSContextCreateVisualizer_block_invoke_25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4 = (*(void (**)(void, uint64_t, uint64_t))(a1 + 32))(*(void *)(a1 + 64), a3, a4);

  return v4;
}

id ___LSContextCreateVisualizer_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  unint64_t v8 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  LaunchServices::DumpWriter::DumpWriter((LaunchServices::DumpWriter *)v15, **(_LSDatabase ***)(a1 + 40), v8);
  CSStore2::AttributedStringWriter::setVisualizer();
  v9 = [v7 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"Options"];
  [v10 unsignedLongLongValue];

  CSStore2::AttributedStringWriter::setElidesEmptyValues((CSStore2::AttributedStringWriter *)v15);
  uint64_t v11 = *(NSString **)(a1 + 32);
  if (v11)
  {
    CSStore2::AttributedStringWriter::link((CSStore2::AttributedStringWriter *)v15, a3, a4, 0);
    unint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)v15, v11, v12);
  }
  if ((*(unsigned int (**)(void, uint64_t, uint64_t, id *))(a1 + 56))(*(void *)(a1 + 40), a3, a4, v15)) {
    uint64_t v13 = (void *)[(NSMutableAttributedString *)v8 copy];
  }
  else {
    uint64_t v13 = 0;
  }
  LaunchServices::DumpWriter::~DumpWriter(v15);

  return v13;
}

@end