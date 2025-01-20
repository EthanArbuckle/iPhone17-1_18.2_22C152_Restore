@interface ASDDSPGraphInterpreter
+ (id)compileFile:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5;
+ (id)compileText:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5;
+ (unordered_map<std::string,)stringMapFromStringDictionary:()std:()std:(std:(std:(id)a2 :(SEL)a3 string>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>;
+ (vector<std::string,)stringVectorFromStringArray:(id)a2;
- (ASDDSPGraphInterpreter)init;
- (id).cxx_construct;
- (id)compileFile:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5;
- (id)compileText:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5;
@end

@implementation ASDDSPGraphInterpreter

- (ASDDSPGraphInterpreter)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)ASDDSPGraphInterpreter;
  v2 = [(ASDDSPGraphInterpreter *)&v8 init];
  if (!v2) {
    return 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__ASDDSPGraphInterpreter_init__block_invoke;
  v6[3] = &unk_264772E28;
  v3 = v2;
  v7 = v3;
  v9 = &unk_26D96F928;
  char v10 = 0;
  v11 = &v9;
  char v4 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](&v9);
  if ((v4 & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

void __30__ASDDSPGraphInterpreter_init__block_invoke()
{
}

+ (id)compileFile:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = [v10 compileFile:v7 withSubstitutions:v8 includingPaths:v9];

  return v11;
}

+ (id)compileText:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  v11 = [v10 compileText:v7 withSubstitutions:v8 includingPaths:v9];

  return v11;
}

- (id)compileFile:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  v20[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke;
  v16[3] = &unk_2647734C0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v20[0] = &unk_26D96F8E0;
  v20[1] = 0;
  v20[3] = v20;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v16);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v20);

  return v14;
}

id __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke(uint64_t *a1)
{
  v2 = a1 + 5;
  [ (id) a1[5] UTF8String];
  v3 = objc_opt_class();
  if (v3)
  {
    [v3 stringMapFromStringDictionary:a1[6]];
  }
  else
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
  }
  char v4 = objc_opt_class();
  if (v4) {
    [v4 stringVectorFromStringArray:a1[7]];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  DSPGraph::Interpreter::compileFile();
  if (v9) {
    operator new();
  }
  uint64_t v9 = 0;
  id v10 = (void **)v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v10);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v7);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke_cold_1(v2);
  }
  return 0;
}

- (id)compileText:(id)a3 withSubstitutions:(id)a4 includingPaths:(id)a5
{
  v20[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke;
  v16[3] = &unk_2647734C0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v20[0] = &unk_26D96F8E0;
  v20[1] = 0;
  v20[3] = v20;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  v14 = ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v16);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v20);

  return v14;
}

id __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) UTF8String];
  v2 = objc_opt_class();
  if (v2)
  {
    [v2 stringMapFromStringDictionary:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
  }
  v3 = objc_opt_class();
  if (v3) {
    [v3 stringVectorFromStringArray:*(void *)(a1 + 56)];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  DSPGraph::Interpreter::compileText();
  if (v8) {
    operator new();
  }
  uint64_t v8 = 0;
  id v9 = (void **)v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v9);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v6);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke_cold_1();
  }
  return 0;
}

+ (unordered_map<std::string,)stringMapFromStringDictionary:()std:()std:(std:(std:(id)a2 :(SEL)a3 string>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)std::string :equal_to<std::string> :hash<std::string>
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v6 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = (char *)[v10 UTF8String];
          id v13 = (char *)[v11 UTF8String];
          std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_impl<char const*,char const*>(retstr, &v14, &v13);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return result;
}

+ (vector<std::string,)stringVectorFromStringArray:(id)a2
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = (char *)objc_msgSend(v11, "UTF8String", (void)v16);
          uint64_t v20 = v12;
          var1 = (char *)retstr->var1;
          if (var1 >= retstr->var2.var0)
          {
            v14 = (void *)std::vector<std::string>::__emplace_back_slow_path<char const*>((uint64_t *)retstr, &v20);
          }
          else
          {
            std::string::basic_string[abi:ne180100]<0>((void *)retstr->var1, v12);
            v14 = var1 + 24;
            retstr->var1 = var1 + 24;
          }
          retstr->var1 = v14;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  return result;
}

- (void).cxx_destruct
{
  value = self->_interpreter.__ptr_.__value_;
  self->_interpreter.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

void __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Graph %@ couldn't be compiled", (uint8_t *)&v2, 0xCu);
}

uint64_t __71__ASDDSPGraphInterpreter_compileFile_withSubstitutions_includingPaths___block_invoke_cold_2(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void __71__ASDDSPGraphInterpreter_compileText_withSubstitutions_includingPaths___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Graph couldn't be compiled from text", v0, 2u);
}

@end