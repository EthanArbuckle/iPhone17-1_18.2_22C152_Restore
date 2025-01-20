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

- (void).cxx_destruct
{
  next = self->_stringCache.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
  self->_stringCache.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  v6 = self->_cache.__table_.__p1_.__value_.__next_;
  if (v6)
  {
    do
    {
      v7 = (void *)*v6;
      operator delete(v6);
      v6 = v7;
    }
    while (v7);
  }
  v8 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
  self->_cache.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8)
  {
    operator delete(v8);
  }
}

- (void)setExceptionHandler:(id)a3
{
}

- (id)exceptionHandler
{
  return self->_exceptionHandler;
}

- (JSContext)context
{
  return self->_context;
}

- (JSVirtualMachine)virtualMachine
{
  return self->_virtualMachine;
}

- (id)getGlobalJSONObject:(const char *)a3
{
  if (!a3) {
    return 0;
  }
  v5 = JSStringCreateWithUTF8CString(a3);
  JSValueRef exception = 0;
  JSValueRef Property = JSObjectGetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v5, &exception);
  if (exception)
  {
    v7 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v8 = [(NSString *)self->_filename UTF8String];
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
  v10 = Property;
  JSStringRelease(v5);
  id result = JSValueCreateJSONString([(JSContext *)self->_context JSGlobalContextRef], v10, 4u, 0);
  if (result)
  {
    v12 = (OpaqueJSString *)result;
    id result = (id)JSStringGetLength((JSStringRef)result);
    if (result)
    {
      v13 = (char *)result + 1;
      v14 = (char *)malloc_type_malloc((size_t)result + 1, 0x26B3501BuLL);
      __p[0] = 0;
      id result = +[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", +[NSData dataWithBytesNoCopy:v14 length:JSStringGetUTF8CString(v12, v14, (size_t)v13)], 0, __p);
      if (__p[0])
      {
        id v15 = [__p[0] localizedDescription];
        v16 = __stderrp;
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

- (BOOL)setGlobalJSONObject:(const char *)a3 value:(id)a4
{
  if (!a3) {
    return 0;
  }
  v7 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:");
  id v23 = 0;
  v8 = +[NSJSONSerialization dataWithJSONObject:a4 options:1 error:&v23];
  if (v23)
  {
    id v9 = [v23 localizedDescription];
    v10 = __stderrp;
    if (v9) {
      v11 = (const char *)[v9 UTF8String];
    }
    else {
      v11 = "";
    }
    fprintf(v10, "[DYJSScripting] \"%s\" when setting \"%s\" (%s)", v11, a3, [(NSString *)self->_filename UTF8String]);
    return 0;
  }
  id v12 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
  v13 = JSStringCreateWithUTF8CString((const char *)[v12 UTF8String]);

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
    v16 = __stderrp;
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

- (double)getGlobalDouble:(const char *)a3
{
  if (!a3) {
    return 0.0;
  }
  v5 = JSStringCreateWithUTF8CString(a3);
  JSValueRef Property = JSObjectGetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v5, 0);
  JSStringRelease(v5);
  JSValueRef exception = 0;
  double v7 = JSValueToNumber([(JSContext *)self->_context JSGlobalContextRef], Property, &exception);
  if (exception)
  {
    v8 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    id v9 = [(NSString *)self->_filename UTF8String];
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

- (void)setGlobalDouble:(const char *)a3 value:(double)a4
{
  if (a3)
  {
    double v7 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:");
    Number = JSValueMakeNumber([(JSContext *)self->_context JSGlobalContextRef], a4);
    JSValueRef exception = 0;
    JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v7, Number, 0, &exception);
    if (exception)
    {
      id v9 = __stderrp;
      -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
      v10 = [(NSString *)self->_filename UTF8String];
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

- (double)callGlobalFunction:(const char *)a3
{
  double v4 = 0.0;
  if (!a3) {
    return v4;
  }
  unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ ((unint64_t)a3 >> 32));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t value = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v12 = v9;
      if (v9 >= value) {
        unint64_t v12 = v9 % value;
      }
    }
    else
    {
      unint64_t v12 = v9 & (value - 1);
    }
    char v13 = (uint64_t ***)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v12];
    if (v13)
    {
      for (i = *v13; i; i = (uint64_t **)*i)
      {
        unint64_t v15 = (unint64_t)i[1];
        if (v15 == v9)
        {
          if (i[2] == (uint64_t *)a3)
          {
            JSValueRef exception = 0;
            v40 = (OpaqueJSValue *)i[3];
            goto LABEL_98;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v15 >= value) {
              v15 %= value;
            }
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v12) {
            break;
          }
        }
      }
    }
  }
  JSValueRef exception = 0;
  JSObjectRef v16 = JSValueToObject([(JSContext *)self->_context JSGlobalContextRef], [(JSValue *)[(JSContext *)self->_context objectForKeyedSubscript:+[NSString stringWithUTF8String:a3]] JSValueRef], &exception);
  if (exception)
  {
    v17 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v18 = [(NSString *)self->_filename UTF8String];
    if (v54 >= 0) {
      char v19 = __p;
    }
    else {
      char v19 = (void **)__p[0];
    }
    fprintf(v17, "[DYJSScripting] \"%s\" when calling \"%s\" (%s)", (const char *)v19, a3, v18);
    if (v54 < 0) {
      operator delete(__p[0]);
    }
    return v4;
  }
  v40 = v16;
  unint64_t v20 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v20)
  {
    uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] > 1uLL)
    {
      unint64_t v3 = v9;
      if (v9 >= v20) {
        unint64_t v3 = v9 % v20;
      }
    }
    else
    {
      unint64_t v3 = v9 & (v20 - 1);
    }
    v22 = (void **)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v22)
    {
      for (j = *v22; j; j = (void *)*j)
      {
        unint64_t v24 = j[1];
        if (v24 == v9)
        {
          if ((const char *)j[2] == a3) {
            goto LABEL_97;
          }
        }
        else
        {
          if (v21.u32[0] > 1uLL)
          {
            if (v24 >= v20) {
              v24 %= v20;
            }
          }
          else
          {
            v24 &= v20 - 1;
          }
          if (v24 != v3) {
            break;
          }
        }
      }
    }
  }
  j = operator new(0x20uLL);
  void *j = 0;
  j[1] = v9;
  j[2] = a3;
  j[3] = 0;
  float v25 = (float)(self->_cache.__table_.__p2_.__value_ + 1);
  float v26 = self->_cache.__table_.__p3_.__value_;
  if (!v20 || (float)(v26 * (float)v20) < v25)
  {
    BOOL v27 = 1;
    if (v20 >= 3) {
      BOOL v27 = (v20 & (v20 - 1)) != 0;
    }
    unint64_t v28 = v27 | (2 * v20);
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v20 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > v20) {
      goto LABEL_53;
    }
    if (*(void *)&prime < v20)
    {
      unint64_t v37 = vcvtps_u32_f32((float)self->_cache.__table_.__p2_.__value_ / self->_cache.__table_.__p3_.__value_);
      if (v20 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v20), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }
      else
      {
        uint64_t v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }
      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= v20)
      {
        unint64_t v20 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_53:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v31 = (void **)operator new(8 * *(void *)&prime);
          v32 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
          self->_cache.__table_.__bucket_list_.__ptr_.__value_ = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0;
          self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_cache.__table_.__bucket_list_.__ptr_.__value_[v33++] = 0;
          while (*(void *)&prime != v33);
          next = self->_cache.__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v35 = next[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }
            else
            {
              v35 &= *(void *)&prime - 1;
            }
            self->_cache.__table_.__bucket_list_.__ptr_.__value_[v35] = &self->_cache.__table_.__p1_;
            v41 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v42 = v41[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v42 >= *(void *)&prime) {
                    v42 %= *(void *)&prime;
                  }
                }
                else
                {
                  v42 &= *(void *)&prime - 1;
                }
                if (v42 != v35)
                {
                  v43 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v43[v42])
                  {
                    v43[v42] = next;
                    goto LABEL_78;
                  }
                  void *next = *v41;
                  void *v41 = *(void *)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v42];
                  *(void *)self->_cache.__table_.__bucket_list_.__ptr_.__value_[v42] = v41;
                  v41 = next;
                }
                unint64_t v42 = v35;
LABEL_78:
                next = v41;
                v41 = (void *)*v41;
                unint64_t v35 = v42;
              }
              while (v41);
            }
          }
          unint64_t v20 = (unint64_t)prime;
          goto LABEL_82;
        }
        v52 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
        self->_cache.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v52) {
          operator delete(v52);
        }
        unint64_t v20 = 0;
        self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_82:
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v9 >= v20) {
        unint64_t v3 = v9 % v20;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v20 - 1) & v9;
    }
  }
  v44 = self->_cache.__table_.__bucket_list_.__ptr_.__value_;
  v45 = (void **)v44[v3];
  if (v45)
  {
    void *j = *v45;
LABEL_95:
    *v45 = j;
    goto LABEL_96;
  }
  void *j = self->_cache.__table_.__p1_.__value_.__next_;
  self->_cache.__table_.__p1_.__value_.__next_ = j;
  v44[v3] = &self->_cache.__table_.__p1_;
  if (*j)
  {
    unint64_t v46 = *(void *)(*j + 8);
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v46 >= v20) {
        v46 %= v20;
      }
    }
    else
    {
      v46 &= v20 - 1;
    }
    v45 = &self->_cache.__table_.__bucket_list_.__ptr_.__value_[v46];
    goto LABEL_95;
  }
LABEL_96:
  ++self->_cache.__table_.__p2_.__value_;
LABEL_97:
  j[3] = v40;
LABEL_98:
  v47 = JSObjectCallAsFunction([(JSContext *)self->_context JSGlobalContextRef], v40, 0, 0, 0, &exception);
  if (exception)
  {
    v48 = __stderrp;
    -[DYJSScriptingContext _jsValueToString:](self, "_jsValueToString:");
    v49 = [(NSString *)self->_filename UTF8String];
    if (v54 >= 0) {
      v50 = __p;
    }
    else {
      v50 = (void **)__p[0];
    }
    fprintf(v48, "[DYJSScripting] \"%s\" when calling \"%s\" (%s)", (const char *)v50, a3, v49);
    if (v54 < 0) {
      operator delete(__p[0]);
    }
  }
  return JSValueToNumber([(JSContext *)self->_context JSGlobalContextRef], v47, 0);
}

- (OpaqueJSString)_cachedStringFromString:(const char *)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ ((unint64_t)a3 >> 32));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t value = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = v8;
      if (v8 >= value) {
        unint64_t v11 = v8 % value;
      }
    }
    else
    {
      unint64_t v11 = v8 & (value - 1);
    }
    char v13 = (uint64_t ***)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v11];
    if (v13)
    {
      for (i = *v13; i; i = (uint64_t **)*i)
      {
        unint64_t v15 = (unint64_t)i[1];
        if (v15 == v8)
        {
          if (i[2] == (uint64_t *)a3) {
            return (OpaqueJSString *)i[3];
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v15 >= value) {
              v15 %= value;
            }
          }
          else
          {
            v15 &= value - 1;
          }
          if (v15 != v11) {
            break;
          }
        }
      }
    }
  }
  unint64_t v12 = JSStringCreateWithUTF8CString(a3);
  JSStringRetain(v12);
  unint64_t v16 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (v16)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v16) {
        unint64_t v3 = v8 % v16;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v16 - 1);
    }
    v18 = (void **)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v18)
    {
      for (j = *v18; j; j = (void *)*j)
      {
        unint64_t v20 = j[1];
        if (v20 == v8)
        {
          if ((const char *)j[2] == a3) {
            goto LABEL_92;
          }
        }
        else
        {
          if (v17.u32[0] > 1uLL)
          {
            if (v20 >= v16) {
              v20 %= v16;
            }
          }
          else
          {
            v20 &= v16 - 1;
          }
          if (v20 != v3) {
            break;
          }
        }
      }
    }
  }
  j = operator new(0x20uLL);
  void *j = 0;
  j[1] = v8;
  j[2] = a3;
  j[3] = 0;
  float v21 = (float)(self->_stringCache.__table_.__p2_.__value_ + 1);
  float v22 = self->_stringCache.__table_.__p3_.__value_;
  if (!v16 || (float)(v22 * (float)v16) < v21)
  {
    BOOL v23 = 1;
    if (v16 >= 3) {
      BOOL v23 = (v16 & (v16 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v16);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v16 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    }
    if (*(void *)&prime > v16) {
      goto LABEL_48;
    }
    if (*(void *)&prime < v16)
    {
      unint64_t v33 = vcvtps_u32_f32((float)self->_stringCache.__table_.__p2_.__value_ / self->_stringCache.__table_.__p3_.__value_);
      if (v16 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= v16)
      {
        unint64_t v16 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      }
      else
      {
        if (prime)
        {
LABEL_48:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          BOOL v27 = (void **)operator new(8 * *(void *)&prime);
          unint64_t v28 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
          self->_stringCache.__table_.__bucket_list_.__ptr_.__value_ = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0;
          self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
          do
            self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v29++] = 0;
          while (*(void *)&prime != v29);
          next = self->_stringCache.__table_.__p1_.__value_.__next_;
          if (next)
          {
            unint64_t v31 = next[1];
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }
            else
            {
              v31 &= *(void *)&prime - 1;
            }
            self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v31] = &self->_stringCache.__table_.__p1_;
            uint8x8_t v36 = (void *)*next;
            if (*next)
            {
              do
              {
                unint64_t v37 = v36[1];
                if (v32.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }
                else
                {
                  v37 &= *(void *)&prime - 1;
                }
                if (v37 != v31)
                {
                  uint8x8_t v38 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
                  if (!v38[v37])
                  {
                    v38[v37] = next;
                    goto LABEL_73;
                  }
                  void *next = *v36;
                  *uint8x8_t v36 = *(void *)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v37];
                  *(void *)self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v37] = v36;
                  uint8x8_t v36 = next;
                }
                unint64_t v37 = v31;
LABEL_73:
                next = v36;
                uint8x8_t v36 = (void *)*v36;
                unint64_t v31 = v37;
              }
              while (v36);
            }
          }
          unint64_t v16 = (unint64_t)prime;
          goto LABEL_77;
        }
        v43 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
        self->_stringCache.__table_.__bucket_list_.__ptr_.__value_ = 0;
        if (v43) {
          operator delete(v43);
        }
        unint64_t v16 = 0;
        self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      }
    }
LABEL_77:
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v8 >= v16) {
        unint64_t v3 = v8 % v16;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v16 - 1) & v8;
    }
  }
  uint64_t v39 = self->_stringCache.__table_.__bucket_list_.__ptr_.__value_;
  v40 = (void **)v39[v3];
  if (v40)
  {
    void *j = *v40;
  }
  else
  {
    void *j = self->_stringCache.__table_.__p1_.__value_.__next_;
    self->_stringCache.__table_.__p1_.__value_.__next_ = j;
    v39[v3] = &self->_stringCache.__table_.__p1_;
    if (!*j) {
      goto LABEL_91;
    }
    unint64_t v41 = *(void *)(*j + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v41 >= v16) {
        v41 %= v16;
      }
    }
    else
    {
      v41 &= v16 - 1;
    }
    v40 = &self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[v41];
  }
  OpaqueJSValue *v40 = j;
LABEL_91:
  ++self->_stringCache.__table_.__p2_.__value_;
LABEL_92:
  j[3] = v12;
  return v12;
}

- (double)callFunction:(id)a3 withArguments:(id)a4
{
  double v4 = [(JSValue *)[(JSContext *)self->_context objectForKeyedSubscript:a3] callWithArguments:a4];

  [(JSValue *)v4 toDouble];
  return result;
}

- (id)getValue:(id)a3
{
  return [(JSContext *)self->_context objectForKeyedSubscript:a3];
}

- (BOOL)evaluteScript:(id)a3 scriptURL:(id)a4
{
  [(DYJSScriptingContext *)self _clearCache];
  if (a4) {
    self->_filename = (NSString *)objc_msgSend(objc_msgSend(a4, "lastPathComponent"), "copy");
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  context = self->_context;
  id exceptionHandler = self->_exceptionHandler;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __48__DYJSScriptingContext_evaluteScript_scriptURL___block_invoke;
  v12[3] = &unk_745938;
  v12[4] = exceptionHandler;
  v12[5] = &v13;
  [(JSContext *)context setExceptionHandler:v12];
  unint64_t v9 = self->_context;
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
    id v4 = [a3 toString];
    v5 = *(uint64_t (**)(uint64_t, id))(v3 + 16);
    return v5(v3, v4);
  }
  else
  {
    unint64_t v7 = __stderrp;
    unint64_t v8 = -[NSString UTF8String][NSString stringWithFormat:@"[DYJSScripting] %@ %@", [a3 toString], [a3 toDictionary]];
    return fputs(v8, v7);
  }
}

- (void)_clearCache
{
  for (JSStringRef i = (JSStringRef)self->_stringCache.__table_.__p1_.__value_.__next_; i; JSStringRef i = *(JSStringRef *)i)
    JSStringRelease(*((JSStringRef *)i + 3));
  if (self->_stringCache.__table_.__p2_.__value_)
  {
    next = self->_stringCache.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v5 = (void *)*next;
        operator delete(next);
        next = v5;
      }
      while (v5);
    }
    self->_stringCache.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = self->_stringCache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t j = 0; j != value; ++j)
        self->_stringCache.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
    }
    self->_stringCache.__table_.__p2_.__value_ = 0;
  }
  if (self->_cache.__table_.__p2_.__value_)
  {
    unint64_t v8 = self->_cache.__table_.__p1_.__value_.__next_;
    if (v8)
    {
      do
      {
        unint64_t v9 = (void *)*v8;
        operator delete(v8);
        unint64_t v8 = v9;
      }
      while (v9);
    }
    self->_cache.__table_.__p1_.__value_.__next_ = 0;
    unint64_t v10 = self->_cache.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (v10)
    {
      for (uint64_t k = 0; k != v10; ++k)
        self->_cache.__table_.__bucket_list_.__ptr_.__value_[k] = 0;
    }
    self->_cache.__table_.__p2_.__value_ = 0;
  }
}

- (void)setValues:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __34__DYJSScriptingContext_setValues___block_invoke;
  v3[3] = &unk_745910;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

id __34__DYJSScriptingContext_setValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) setObject:a3 forKeyedSubscript:a2];
}

- (void)setRawArrayValues:(id)a3 withUint64Values:(unint64_t *)a4 andNumCounters:(unint64_t)a5
{
  unint64_t v8 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", [a3 UTF8String]);
  JSValueRef exception = 0;
  Array = JSObjectMakeArray([(JSContext *)self->_context JSGlobalContextRef], 0, 0, &exception);
  if (a5)
  {
    unint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      unint64_t v12 = [(JSContext *)self->_context JSGlobalContextRef];
      Number = JSValueMakeNumber([(JSContext *)self->_context JSGlobalContextRef], (double)a4[v10]);
      JSObjectSetPropertyAtIndex(v12, Array, v11 - 1, Number, &exception);
      unint64_t v10 = v11++;
    }
    while (v10 < a5);
  }
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v8, Array, 0, &exception);
}

- (OpaqueJSValue)createArrayRef:(id)a3
{
  id v4 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", [a3 UTF8String]);
  JSValueRef exception = 0;
  Array = JSObjectMakeArray([(JSContext *)self->_context JSGlobalContextRef], 0, 0, &exception);
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v4, Array, 0, &exception);
  return Array;
}

- (void)setRawArrayValues:(id)a3 withUint32Values:(unsigned int *)a4 andNumCounters:(unint64_t)a5
{
  unint64_t v8 = -[DYJSScriptingContext _cachedStringFromString:](self, "_cachedStringFromString:", [a3 UTF8String]);
  JSValueRef exception = 0;
  Array = JSObjectMakeArray([(JSContext *)self->_context JSGlobalContextRef], 0, 0, &exception);
  if (a5)
  {
    uint64_t v10 = 0;
    do
    {
      unsigned int v11 = [(JSContext *)self->_context JSGlobalContextRef];
      unint64_t v12 = [(JSContext *)self->_context JSGlobalContextRef];
      LODWORD(v13) = a4[v10];
      Number = JSValueMakeNumber(v12, (double)v13);
      JSObjectSetPropertyAtIndex(v11, Array, v10++, Number, &exception);
    }
    while (a5 != v10);
  }
  JSObjectSetProperty([(JSContext *)self->_context JSGlobalContextRef], self->_globalObject, v8, Array, 0, &exception);
}

- (id)setValue:(id)a3 value:(id)a4
{
  unint64_t v6 = +[JSValue valueWithObject:a4 inContext:self->_context];
  [(JSContext *)self->_context setObject:v6 forKeyedSubscript:a3];
  return v6;
}

- (basic_string<char,)_jsValueToString:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v3 = v1;
  double result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)JSValueToStringCopy((JSContextRef)[v1[14] JSGlobalContextRef], v2, 0);
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

- (basic_string<char,)_jsStringToString:(std::allocator<char>> *__return_ptr)retstr
{
  if (!v2
    || (id v4 = v2,
        (double result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)JSStringGetLength(v2)) == 0))
  {
    retstr->var0.var0.var0.var1.var0 = 0;
    retstr->var0.var0.var0.var1.var1 = 0;
    *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
    return result;
  }
  v5 = &result->var0.var0.var0.var0.var0[1];
  unint64_t v6 = (char *)malloc_type_malloc((size_t)&result->var0.var0.var0.var0.var0[1], 0x20E9B781uLL);
  size_t UTF8CString = JSStringGetUTF8CString(v4, v6, (size_t)v5);
  if (UTF8CString >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  unint64_t v8 = UTF8CString;
  if (UTF8CString >= 0x17)
  {
    uint64_t v9 = (UTF8CString & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((UTF8CString | 7) != 0x17) {
      uint64_t v9 = UTF8CString | 7;
    }
    uint64_t v10 = v9 + 1;
    unsigned int v11 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v9 + 1);
    retstr->var0.var0.var0.var1.var1 = v8;
    *((void *)&retstr->var0.var0.var0.var1 + 2) = v10 | 0x8000000000000000;
    retstr->var0.var0.var0.var1.var0 = (char *)v11;
    retstr = v11;
  }
  else
  {
    *((unsigned char *)&retstr->var0.var0.var0.var1 + 23) = UTF8CString;
    if (!UTF8CString) {
      goto LABEL_13;
    }
  }
  unint64_t v12 = v6;
  do
  {
    char v13 = *v12++;
    retstr->var0.var0.var0.var0.var0[0] = v13;
    retstr = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)retstr + 1);
    --v8;
  }
  while (v8);
LABEL_13:
  retstr->var0.var0.var0.var0.var0[0] = 0;

  free(v6);
  return result;
}

- (void)dealloc
{
  [(DYJSScriptingContext *)self _clearCache];
  v3.receiver = self;
  v3.super_class = (Class)DYJSScriptingContext;
  [(DYJSScriptingContext *)&v3 dealloc];
}

- (void)allocNewContext
{
  objc_super v3 = (JSContext *)[objc_alloc((Class)JSContext) initWithVirtualMachine:self->_virtualMachine];
  self->_context = v3;
  self->_globalObject = JSContextGetGlobalObject([(JSContext *)v3 JSGlobalContextRef]);
}

- (DYJSScriptingContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)DYJSScriptingContext;
  v2 = [(DYJSScriptingContext *)&v5 init];
  if (v2)
  {
    objc_super v3 = (JSVirtualMachine *)objc_alloc_init((Class)JSVirtualMachine);
    v2->_filename = (NSString *)@"n/a";
    v2->_virtualMachine = v3;
    [(DYJSScriptingContext *)v2 allocNewContext];
  }
  return v2;
}

+ (id)sharedContext
{
  if (+[DYJSScriptingContext sharedContext]::once != -1) {
    dispatch_once(&+[DYJSScriptingContext sharedContext]::once, &__block_literal_global_2767);
  }
  return (id)+[DYJSScriptingContext sharedContext]::instance;
}

void __37__DYJSScriptingContext_sharedContext__block_invoke(id a1)
{
  +[DYJSScriptingContext sharedContext]::instance = objc_alloc_init(DYJSScriptingContext);
}

@end