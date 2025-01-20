@interface _EARUserProfileConfig
- (_EARPeopleSuggesterConfig)peopleSuggesterConfig;
- (_EARUserProfileConfig)initWithConfiguration:(id)a3 overrides:(id)a4;
- (id).cxx_construct;
@end

@implementation _EARUserProfileConfig

- (_EARUserProfileConfig)initWithConfiguration:(id)a3 overrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_EARUserProfileConfig;
  [(_EARUserProfileConfig *)&v22 init];
  id v8 = v7;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x5812000000;
  v16 = __Block_byref_object_copy__335;
  v17 = __Block_byref_object_dispose__336;
  memset(v18, 0, sizeof(v18));
  uint64_t v19 = 0;
  int v20 = 1065353216;
  v23 = (void *)MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = ___ZN10EARHelpers24DictionaryToUnorderedMapINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_Z57___EARUserProfileConfig_initWithConfiguration_overrides__E3__0S8_EENS1_13unordered_mapIT_T0_NS1_4hashISA_EENS1_8equal_toISA_EENS5_INS1_4pairIKSA_SB_EEEEEEP12NSDictionaryT1_T2__block_invoke;
  v26 = &unk_1E5FFE238;
  v27 = &v13;
  [v8 enumerateKeysAndObjectsUsingBlock:&v23];
  std::unordered_map<std::string,std::string>::unordered_map((uint64_t)v21, (uint64_t)(v14 + 6));
  _Block_object_dispose(&v13, 8);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v18 + 8);

  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&v13);
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v23 = 0;
    uint64_t v24 = 0;
    v25 = 0;
  }
  memset(v12, 0, sizeof(v12));
  int JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v13, (uint64_t)&v23, v12, (uint64_t)v21, 0, 0);
  v28 = (void **)v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v28);
  if (SHIBYTE(v25) < 0) {
    operator delete(v23);
  }
  if (JsonFile != 2) {
    operator new();
  }
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Config file version is not supported.");
  __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
}

- (_EARPeopleSuggesterConfig)peopleSuggesterConfig
{
  v2 = [[_EARPeopleSuggesterConfig alloc] initWithContactsCount:*(_DWORD *)self->lmeConfig.__ptr_.__value_ bestContactsCount:*((unsigned int *)self->lmeConfig.__ptr_.__value_ + 1) bestContactsBonus:*((unsigned int *)self->lmeConfig.__ptr_.__value_ + 2)];
  return v2;
}

- (void).cxx_destruct
{
  value = self->lmeConfig.__ptr_.__value_;
  self->lmeConfig.__ptr_.__value_ = 0;
  if (value) {
    JUMPOUT(0x1B3EA8670);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end