@interface _WKCustomHeaderFields
- (NSArray)thirdPartyDomains;
- (NSDictionary)fields;
- (Object)_apiObject;
- (_WKCustomHeaderFields)init;
- (uint64_t)setFields:;
- (void)dealloc;
- (void)setFields:(id)a3;
- (void)setThirdPartyDomains:(id)a3;
@end

@implementation _WKCustomHeaderFields

- (_WKCustomHeaderFields)init
{
  v6.receiver = self;
  v6.super_class = (Class)_WKCustomHeaderFields;
  v2 = [(_WKCustomHeaderFields *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(_WKCustomHeaderFields *)v2 _apiObject];
    *(_OWORD *)(v4 + 8) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(void *)(v4 + 40) = 0;
    *(void *)uint64_t v4 = &unk_1EE9D1E28;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(void *)uint64_t v4 = &unk_1EE9B2518;
    *(void *)(v4 + 8) = v3;
  }
  return v3;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fields.data.__lx[32], v4);
    WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fields.data.__lx[16], v5);
    v6.receiver = self;
    v6.super_class = (Class)_WKCustomHeaderFields;
    [(_WKCustomHeaderFields *)&v6 dealloc];
  }
}

- (NSDictionary)fields
{
  v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(unsigned int *)&self->_fields.data.__lx[28]];
  uint64_t v4 = *(unsigned int *)&self->_fields.data.__lx[28];
  if (v4)
  {
    uint64_t v5 = 16 * v4;
    objc_super v6 = (void *)(*(void *)&self->_fields.data.__lx[16] + 8);
    do
    {
      if (*v6) {
        v7 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        v7 = &stru_1EEA10550;
      }
      if (*(v6 - 1)) {
        v8 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        v8 = &stru_1EEA10550;
      }
      [(NSDictionary *)v3 setObject:v7 forKey:v8];
      v6 += 2;
      v5 -= 16;
    }
    while (v5);
  }
  return v3;
}

- (void)setFields:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v5 = [a3 count];
  if (v5)
  {
    if (v5 >> 28)
    {
      __break(0xC471u);
      return;
    }
    LODWORD(v12) = v5;
    uint64_t v11 = WTF::fastMalloc((WTF *)(16 * v5));
  }
  objc_super v6 = malloc_type_malloc(0x28uLL, 0x10E004053C0834CuLL);
  *objc_super v6 = MEMORY[0x1E4F14398];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(objc_object *,objc_object *,BOOL *)>::fromCallable<-[_WKCustomHeaderFields setFields:]::$_0>(-[_WKCustomHeaderFields setFields:]::$_0)::{lambda(void *,objc_object *,objc_object *,BOOL *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(objc_object *,objc_object *,BOOL *)>::fromCallable<-[_WKCustomHeaderFields setFields:]::$_0>(-[_WKCustomHeaderFields setFields:]::$_0)::descriptor;
  v6[4] = &v11;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  _Block_release(v6);
  uint64_t v8 = *(unsigned int *)&self->_fields.data.__lx[28];
  if (v8) {
    WTF::VectorDestructor<true,WebCore::HTTPHeaderField>::destruct(*(WTF::StringImpl **)&self->_fields.data.__lx[16], (WTF::StringImpl *)(*(void *)&self->_fields.data.__lx[16] + 16 * v8));
  }
  v9 = *(WTF **)&self->_fields.data.__lx[16];
  if (v9)
  {
    *(void *)&self->_fields.data.__lx[16] = 0;
    *(_DWORD *)&self->_fields.data.__lx[24] = 0;
    WTF::fastFree(v9, v7);
  }
  *(void *)&self->_fields.data.__lx[16] = v11;
  uint64_t v10 = v12;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  *(void *)&self->_fields.data.__lx[24] = v10;
  WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v7);
}

- (NSArray)thirdPartyDomains
{
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v11, (uint64_t)&self->_fields.data.__lx[32]);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = (void *)[v2 initWithCapacity:v12];
  if (v12)
  {
    unint64_t v5 = v11;
    uint64_t v6 = 8 * v12;
    do
    {
      WTF::makeNSArrayElement((uint64_t *)&cf, v5, v3);
      if (cf)
      {
        objc_msgSend(v4, "addObject:");
        CFTypeRef v7 = cf;
        CFTypeRef cf = 0;
        if (v7) {
          CFRelease(v7);
        }
      }
      unint64_t v5 = (WTF *)((char *)v5 + 8);
      v6 -= 8;
    }
    while (v6);
  }
  uint64_t v8 = (id)CFMakeCollectable(v4);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v9);
  return v8;
}

- (void)setThirdPartyDomains:(id)a3
{
  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  uint64_t v5 = *(unsigned int *)&self->_fields.data.__lx[44];
  if (v5) {
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self->_fields.data.__lx[32], (WTF::StringImpl *)(*(void *)&self->_fields.data.__lx[32] + 8 * v5));
  }
  uint64_t v6 = *(WTF **)&self->_fields.data.__lx[32];
  if (v6)
  {
    *(void *)&self->_fields.data.__lx[32] = 0;
    *(_DWORD *)&self->_fields.data.__lx[40] = 0;
    WTF::fastFree(v6, v4);
  }
  *(void *)&self->_fields.data.__lx[32] = v8;
  uint64_t v7 = v9;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  *(void *)&self->_fields.data.__lx[40] = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (Object)_apiObject
{
  return (Object *)&self->_fields;
}

- (uint64_t)setFields:
{
  MEMORY[0x19972EAD0](&v16);
  MEMORY[0x19972EAD0](&v15, a3);
  WebCore::HTTPHeaderField::create();
  uint64_t v6 = v15;
  v15 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v16;
  v16 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  if (!v19) {
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  }
  if (!v17) {
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  }
  uint64_t result = WTF::startsWithLettersIgnoringASCIICaseCommon<WTF::StringImpl>(v17, (uint64_t)"x-", 2uLL);
  if (!result) {
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  }
  if (v19)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(unsigned int *)(v9 + 12);
    if (v10 == *(_DWORD *)(v9 + 8))
    {
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::HTTPHeaderField>(v9, (unint64_t)&v17);
    }
    else
    {
      int v11 = v10 + 1;
      unsigned int v12 = (BOOL *)(*(void *)v9 + 16 * v10);
      BOOL v13 = v17;
      BOOL v17 = 0;
      *unsigned int v12 = v13;
      BOOL v14 = v18;
      BOOL v18 = 0;
      v12[1] = v14;
      *(_DWORD *)(v9 + 12) = v11;
    }
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  }
  __break(1u);
  return result;
}

@end