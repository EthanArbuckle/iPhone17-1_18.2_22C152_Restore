@interface DYJSScriptingContext
+ (id)sharedContext;
- (BOOL)evaluteScript:(id)a3 scriptURL:(id)a4;
- (BOOL)setGlobalJSONObject:(const char *)a3 value:(id)a4;
- (DYJSScriptingContext)init;
- (JSContext)context;
- (JSVirtualMachine)virtualMachine;
- (OpaqueJSString)_cachedStringFromString:(const char *)a3;
- (OpaqueJSValue)createArrayRef:(id)a3;
- (basic_string<char,)_jsStringToString:(std::allocator<char>> *__return_ptr)retstr;
- (basic_string<char,)_jsValueToString:(std::allocator<char>> *__return_ptr)retstr;
- (double)callFunction:(id)a3 withArguments:(id)a4;
- (double)callGlobalFunction:(const char *)a3;
- (double)getGlobalDouble:(const char *)a3;
- (id).cxx_construct;
- (id)exceptionHandler;
- (id)getGlobalJSONObject:(const char *)a3;
- (id)getValue:(id)a3;
- (id)setValue:(id)a3 value:(id)a4;
- (void)_clearCache;
- (void)allocNewContext;
- (void)dealloc;
- (void)setExceptionHandler:(id)a3;
- (void)setGlobalDouble:(const char *)a3 value:(double)a4;
- (void)setRawArrayValues:(id)a3 withUint32Values:(unsigned int *)a4 andNumCounters:(unint64_t)a5;
- (void)setRawArrayValues:(id)a3 withUint64Values:(unint64_t *)a4 andNumCounters:(unint64_t)a5;
- (void)setValues:(id)a3;
@end

@implementation DYJSScriptingContext

+ (id)sharedContext
{
  if (+[DYJSScriptingContext sharedContext]::once != -1) {
    dispatch_once(&+[DYJSScriptingContext sharedContext]::once, &__block_literal_global_4);
  }
  return (id)+[DYJSScriptingContext sharedContext]::instance;
}

DYJSScriptingContext *__37__DYJSScriptingContext_sharedContext__block_invoke()
{
  result = objc_alloc_init(DYJSScriptingContext);
  +[DYJSScriptingContext sharedContext]::instance = (uint64_t)result;
  return result;
}

- (DYJSScriptingContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)DYJSScriptingContext;
  v2 = [(DYJSScriptingContext *)&v5 init];
  if (v2)
  {
    v3 = (JSVirtualMachine *)objc_alloc_init(MEMORY[0x263F10398]);
    v2->_filename = (NSString *)@"n/a";
    v2->_virtualMachine = v3;
    [(DYJSScriptingContext *)v2 allocNewContext];
  }
  return v2;
}

- (void)allocNewContext
{
  v3 = (JSContext *)[objc_alloc(MEMORY[0x263F10378]) initWithVirtualMachine:self->_virtualMachine];
  self->_context = v3;
  self->_globalObject = JSContextGetGlobalObject([(JSContext *)v3 JSGlobalContextRef]);
}

- (void)dealloc
{
  [(DYJSScriptingContext *)self _clearCache];
  v3.receiver = self;
  v3.super_class = (Class)DYJSScriptingContext;
  [(DYJSScriptingContext *)&v3 dealloc];
}

- (basic_string<char,)_jsStringToString:(std::allocator<char>> *__return_ptr)retstr
{
  if (v2
    && (v4 = v2,
        (result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)JSStringGetLength(v2)) != 0))
  {
    objc_super v5 = &result->var0.var0.var0.var0.var0[1];
    v6 = (char *)malloc_type_malloc((size_t)&result->var0.var0.var0.var0.var0[1], 0x20E9B781uLL);
    size_t UTF8CString = JSStringGetUTF8CString(v4, v6, (size_t)v5);
    std::string::__init_with_size[abi:ne180100]<char *,char *>(retstr, v6, &v6[UTF8CString], UTF8CString);
    free(v6);
  }
  else
  {
    retstr->var0.var0.var0.var1.var0 = 0;
    retstr->var0.var0.var0.var1.var1 = 0;
    *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  }
  return result;
}

- (basic_string<char,)_jsValueToString:(std::allocator<char>> *__return_ptr)retstr
{
  objc_super v3 = v1;
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)JSValueToStringCopy((JSContextRef)[v1[14] JSGlobalContextRef], v2, 0);
  if (result)
  {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)[v3 _jsStringToString:result];
  }
  else
  {
    retstr->var0.var0.var0.var1.var0 = 0;
    retstr->var0.var0.var0.var1.var1 = 0;
    *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  }
  return result;
}

- (id)setValue:(id)a3 value:(id)a4
{
  v6 = (void *)[MEMORY[0x263F10390] valueWithObject:a4 inContext:self->_context];
  [(JSContext *)self->_context setObject:v6 forKeyedSubscript:a3];
  return v6;
}

- (void)setRawArrayValues:(id)a3 withUint32Values:(unsigned int *)a4 andNumCounters:(unint64_t)a5
{
  v8 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", [a3 UTF8String]);
  JSValueRef exception = 0;
  Array = JSObjectMakeArray([(JSContext *)self->_context JSGlobalContextRef], 0, 0, &exception);
  if (a5)
  {
    uint64_t v10 = 0;
    do
    {
      v11 = [(JSContext *)self->_context JSGlobalContextRef];
      v12 = [(JSContext *)self->_context JSGlobalContextRef];
      LODWORD(v13) = a4[v10];
      Number = JSValueMakeNumber(v12, (double)v13);
      JSObjectSetPropertyAtIndex(v11, Array, v10++, Number, &exception);
    }
    while (a5 != v10);
  }
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v8, Array, 0, &exception);
}

- (OpaqueJSValue)createArrayRef:(id)a3
{
  v4 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", [a3 UTF8String]);
  JSValueRef exception = 0;
  Array = JSObjectMakeArray([(JSContext *)self->_context JSGlobalContextRef], 0, 0, &exception);
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v4, Array, 0, &exception);
  return Array;
}

- (void)setRawArrayValues:(id)a3 withUint64Values:(unint64_t *)a4 andNumCounters:(unint64_t)a5
{
  v8 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", [a3 UTF8String]);
  JSValueRef exception = 0;
  Array = JSObjectMakeArray([(JSContext *)self->_context JSGlobalContextRef], 0, 0, &exception);
  if (a5)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 0;
    do
    {
      v12 = [(JSContext *)self->_context JSGlobalContextRef];
      Number = JSValueMakeNumber([(JSContext *)self->_context JSGlobalContextRef], (double)a4[v10]);
      JSObjectSetPropertyAtIndex(v12, Array, v11++, Number, &exception);
      uint64_t v10 = v11;
    }
    while (v11 < a5);
  }
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v8, Array, 0, &exception);
}

- (void)setValues:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__DYJSScriptingContext_setValues___block_invoke;
  v3[3] = &unk_265333D98;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __34__DYJSScriptingContext_setValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setObject:a3 forKeyedSubscript:a2];
}

- (void)_clearCache
{
  for (JSStringRef i = (JSStringRef)self->_stringCache.__table_.__p1_.__value_.__next_; i; JSStringRef i = *(JSStringRef *)i)
    JSStringRelease(*((JSStringRef *)i + 3));
  std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::clear(&self->_stringCache.__table_.__bucket_list_.__ptr_.__value_);
  std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::clear(&self->_cache.__table_.__bucket_list_.__ptr_.__value_);
}

- (BOOL)evaluteScript:(id)a3 scriptURL:(id)a4
{
  [(DYJSScriptingContext *)self _clearCache];
  if (a4) {
    self->_filename = (NSString *)objc_msgSend((id)objc_msgSend(a4, "lastPathComponent"), "copy");
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  context = self->_context;
  id exceptionHandler = self->_exceptionHandler;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__DYJSScriptingContext_evaluteScript_scriptURL___block_invoke;
  v12[3] = &unk_265333DC0;
  v12[4] = exceptionHandler;
  v12[5] = &v13;
  [(JSContext *)context setExceptionHandler:v12];
  v9 = self->_context;
  if (a4) {
    [(JSContext *)v9 evaluateScript:a3 withSourceURL:a4];
  }
  else {
    [(JSContext *)v9 evaluateScript:a3];
  }
  BOOL v10 = *((unsigned char *)v14 + 24) == 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __48__DYJSScriptingContext_evaluteScript_scriptURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [a3 toString];
    objc_super v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
    return v5(v3, v4);
  }
  else
  {
    v7 = (FILE *)*MEMORY[0x263EF8348];
    v8 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"[DYJSScripting] %@ %@", objc_msgSend(a3, "toString"), objc_msgSend(a3, "toDictionary")), "UTF8String"];
    return fputs(v8, v7);
  }
}

- (id)getValue:(id)a3
{
  return [(JSContext *)self->_context objectForKeyedSubscript:a3];
}

- (double)callFunction:(id)a3 withArguments:(id)a4
{
  uint64_t v4 = [(JSValue *)[(JSContext *)self->_context objectForKeyedSubscript:a3] callWithArguments:a4];
  [(JSValue *)v4 toDouble];
  return result;
}

- (OpaqueJSString)_cachedStringFromString:(const char *)a3
{
  string = (char *)a3;
  if (!a3) {
    return 0;
  }
  p_stringCache = &self->_stringCache;
  uint64_t v4 = std::__hash_table<std::__hash_value_type<char const*,OpaqueJSString *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSString *>>>::find<char const*>(&self->_stringCache.__table_.__bucket_list_.__ptr_.__value_, &string);
  if (v4) {
    return (OpaqueJSString *)v4[3];
  }
  objc_super v5 = JSStringCreateWithUTF8CString(string);
  JSStringRetain(v5);
  p_string = &string;
  std::__hash_table<std::__hash_value_type<char const*,OpaqueJSString *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSString *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const* const&>,std::tuple<>>((uint64_t)p_stringCache, &string, (uint64_t)&std::piecewise_construct, &p_string)[3] = v5;
  return v5;
}

- (double)callGlobalFunction:(const char *)a3
{
  v24 = a3;
  double v3 = 0.0;
  if (!a3) {
    return v3;
  }
  p_cache = &self->_cache;
  v6 = std::__hash_table<std::__hash_value_type<char const*,OpaqueJSString *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSString *>>>::find<char const*>(&self->_cache.__table_.__bucket_list_.__ptr_.__value_, &v24);
  JSValueRef exception = 0;
  if (v6)
  {
    v7 = (OpaqueJSValue *)v6[3];
LABEL_4:
    v8 = JSObjectCallAsFunction([(JSContext *)self->_context JSGlobalContextRef], v7, 0, 0, 0, &exception);
    if (exception)
    {
      v9 = (FILE *)*MEMORY[0x263EF8348];
      -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
      int v10 = v22;
      unsigned int v11 = (void **)__p[0];
      v12 = v24;
      uint64_t v13 = [(NSString *)self->_filename UTF8String];
      if (v10 >= 0) {
        v14 = __p;
      }
      else {
        v14 = v11;
      }
      fprintf(v9, "[DYJSScripting] \"%s\" when calling \"%s\" (%s)", (const char *)v14, v12, v13);
      if (v22 < 0) {
        operator delete(__p[0]);
      }
    }
    return JSValueToNumber([(JSContext *)self->_context JSGlobalContextRef], v8, 0);
  }
  JSObjectRef v16 = JSValueToObject(-[JSContext JSGlobalContextRef](self->_context, "JSGlobalContextRef"), -[JSValue JSValueRef](-[JSContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", [NSString stringWithUTF8String:v24]), "JSValueRef"), &exception);
  if (!exception)
  {
    v7 = v16;
    __p[0] = &v24;
    std::__hash_table<std::__hash_value_type<char const*,OpaqueJSValue *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSValue *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSValue *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSValue *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const* const&>,std::tuple<>>((uint64_t)p_cache, &v24, (uint64_t)&std::piecewise_construct, (void **)__p)[3] = v16;
    goto LABEL_4;
  }
  v17 = (FILE *)*MEMORY[0x263EF8348];
  -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
  v18 = v24;
  v19 = [(NSString *)self->_filename UTF8String];
  if (v22 >= 0) {
    v20 = __p;
  }
  else {
    v20 = (void **)__p[0];
  }
  fprintf(v17, "[DYJSScripting] \"%s\" when calling \"%s\" (%s)", (const char *)v20, v18, v19);
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

- (void)setGlobalDouble:(const char *)a3 value:(double)a4
{
  if (a3)
  {
    v7 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:");
    Number = JSValueMakeNumber([(JSContext *)self->_context JSGlobalContextRef], a4);
    JSValueRef exception = 0;
    JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v7, Number, 0, &exception);
    if (exception)
    {
      v9 = (FILE *)*MEMORY[0x263EF8348];
      -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
      int v10 = [(NSString *)self->_filename UTF8String];
      if (v13 >= 0) {
        p_p = (const char *)&__p;
      }
      else {
        p_p = (const char *)__p;
      }
      fprintf(v9, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", p_p, a3, v10);
      if (v13 < 0) {
        operator delete(__p);
      }
    }
  }
}

- (double)getGlobalDouble:(const char *)a3
{
  if (!a3) {
    return 0.0;
  }
  objc_super v5 = JSStringCreateWithUTF8CString(a3);
  Property = JSObjectGetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v5, 0);
  JSStringRelease(v5);
  JSValueRef exception = 0;
  double v7 = JSValueToNumber([(JSContext *)self->_context JSGlobalContextRef], Property, &exception);
  if (exception)
  {
    v8 = (FILE *)*MEMORY[0x263EF8348];
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v9 = [(NSString *)self->_filename UTF8String];
    if (v13 >= 0) {
      p_p = (const char *)&__p;
    }
    else {
      p_p = (const char *)__p;
    }
    fprintf(v8, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", p_p, a3, v9);
    if (v13 < 0) {
      operator delete(__p);
    }
  }
  return v7;
}

- (BOOL)setGlobalJSONObject:(const char *)a3 value:(id)a4
{
  if (!a3) {
    return 0;
  }
  double v7 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:");
  id v23 = 0;
  uint64_t v8 = [MEMORY[0x263F08900] dataWithJSONObject:a4 options:1 error:&v23];
  if (v23)
  {
    v9 = (void *)[v23 localizedDescription];
    int v10 = (FILE *)*MEMORY[0x263EF8348];
    if (v9) {
      unsigned int v11 = (const char *)[v9 UTF8String];
    }
    else {
      unsigned int v11 = "";
    }
    fprintf(v10, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", v11, a3, [(NSString *)self->_filename UTF8String]);
    return 0;
  }
  v12 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
  char v13 = JSStringCreateWithUTF8CString((const char *)[v12 UTF8String]);

  if (!v13) {
    return 0;
  }
  v14 = JSValueMakeFromJSONString([(JSContext *)self->_context JSGlobalContextRef], v13);
  JSValueRef exception = 0;
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v7, v14, 0, &exception);
  JSStringRelease(v13);
  BOOL v15 = exception == 0;
  if (exception)
  {
    JSObjectRef v16 = (FILE *)*MEMORY[0x263EF8348];
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v17 = [(NSString *)self->_filename UTF8String];
    v18 = v21 >= 0 ? (const char *)&__p : (const char *)__p;
    fprintf(v16, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", v18, a3, v17);
    if (v21 < 0) {
      operator delete(__p);
    }
  }
  return v15;
}

- (id)getGlobalJSONObject:(const char *)a3
{
  if (!a3) {
    return 0;
  }
  objc_super v5 = JSStringCreateWithUTF8CString(a3);
  JSValueRef exception = 0;
  JSValueRef Property = JSObjectGetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v5, &exception);
  if (exception)
  {
    double v7 = (FILE *)*MEMORY[0x263EF8348];
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    uint64_t v8 = [(NSString *)self->_filename UTF8String];
    if (v19 >= 0) {
      v9 = __p;
    }
    else {
      v9 = (void **)__p[0];
    }
    fprintf(v7, "[DYJSScripting] \"%s\" when getting \"%s\" (%s)", (const char *)v9, a3, v8);
    if (v19 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  int v10 = Property;
  JSStringRelease(v5);
  id result = JSValueCreateJSONString([(JSContext *)self->_context JSGlobalContextRef], v10, 4u, 0);
  if (result)
  {
    v12 = (OpaqueJSString *)result;
    id result = (id)JSStringGetLength((JSStringRef)result);
    if (result)
    {
      char v13 = (char *)result + 1;
      v14 = (char *)malloc_type_malloc((size_t)result + 1, 0x26B3501BuLL);
      __p[0] = 0;
      id result = (id)objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:", objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:", v14, JSStringGetUTF8CString(v12, v14, (size_t)v13)), 0, __p);
      if (__p[0])
      {
        BOOL v15 = (void *)[__p[0] localizedDescription];
        JSObjectRef v16 = (FILE *)*MEMORY[0x263EF8348];
        if (v15) {
          v17 = (const char *)[v15 UTF8String];
        }
        else {
          v17 = "";
        }
        fprintf(v16, "[DYJSScripting] \"%s\" when getting \"%s\" (%s)", v17, a3, [(NSString *)self->_filename UTF8String]);
        return 0;
      }
    }
  }
  return result;
}

- (JSVirtualMachine)virtualMachine
{
  return self->_virtualMachine;
}

- (JSContext)context
{
  return self->_context;
}

- (id)exceptionHandler
{
  return self->_exceptionHandler;
}

- (void)setExceptionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)&self->_stringCache);
  std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)&self->_cache);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end