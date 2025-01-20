@interface _WKTargetedElementRequest
- (BOOL)canIncludeNearbyElements;
- (BOOL)shouldIgnorePointerEventsNone;
- (Object)_apiObject;
- (_WKTargetedElementRequest)init;
- (_WKTargetedElementRequest)initWithPoint:(CGPoint)a3;
- (_WKTargetedElementRequest)initWithSearchText:(id)a3;
- (_WKTargetedElementRequest)initWithSelectors:(id)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)setCanIncludeNearbyElements:(BOOL)a3;
- (void)setShouldIgnorePointerEventsNone:(BOOL)a3;
@end

@implementation _WKTargetedElementRequest

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    uint64_t v4 = *(unsigned int *)&self->_request.data.__lx[32];
    if (v4 != -1) {
      ((void (*)(char *, unsigned __int8 *))off_1EE9CACB0[v4])(&v6, &self->_request.data.__lx[16]);
    }
    *(_DWORD *)&self->_request.data.__lx[32] = -1;
    v5.receiver = self;
    v5.super_class = (Class)_WKTargetedElementRequest;
    [(_WKTargetedElementRequest *)&v5 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_request;
}

- (_WKTargetedElementRequest)init
{
  v9.receiver = self;
  v9.super_class = (Class)_WKTargetedElementRequest;
  v2 = [(_WKTargetedElementRequest *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v8 = 257;
    long long v7 = 0u;
    WebKit::InitializeWebKit2((WebKit *)v2);
    *((void *)&v6 + 1) = 0;
    DWORD2(v7) = 0;
    uint64_t v4 = [(_WKTargetedElementRequest *)v3 _apiObject];
    *(void *)uint64_t v4 = &unk_1EE9CACD8;
    *(void *)(v4 + 8) = 0;
    std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::FloatPoint,WTF::String,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,(std::__variant_detail::_Trait)1>::__move_constructor(v4 + 16, (uint64_t)&v6 + 8);
    *(_WORD *)(v4 + 40) = v8;
    *(void *)(v4 + 8) = v3;
    if (DWORD2(v7) != -1) {
      ((void (*)(char *, char *))off_1EE9CACB0[DWORD2(v7)])(&v10, (char *)&v6 + 8);
    }
  }
  return v3;
}

- (_WKTargetedElementRequest)initWithSearchText:(id)a3
{
  uint64_t v4 = [(_WKTargetedElementRequest *)self init];
  if (v4)
  {
    MEMORY[0x19972EAD0](&v8, a3);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<WebCore::FloatPoint,WTF::String,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>::__assign_alt[abi:sn180100]<1ul,WTF::String,WTF::String>((uint64_t *)&v4->_request.data.__lx[16], (uint64_t *)&v4->_request.data.__lx[16], (uint64_t *)&v8);
    long long v6 = v8;
    uint64_t v8 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
  return v4;
}

- (_WKTargetedElementRequest)initWithPoint:(CGPoint)a3
{
  CGPoint v9 = a3;
  v3 = [(_WKTargetedElementRequest *)self init];
  if (v3)
  {
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v8, &v9);
    int v5 = v8[0];
    int v4 = v8[1];
    uint64_t v6 = *(unsigned int *)&v3->_request.data.__lx[32];
    if (v6 != -1)
    {
      if (!v6)
      {
        *(_DWORD *)&v3->_request.data.__lx[16] = v8[0];
        *(_DWORD *)&v3->_request.data.__lx[20] = v4;
        return v3;
      }
      ((void (*)(char *, unsigned __int8 *))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJN7WebCore10FloatPointEN3WTF6StringENS8_6VectorINS8_7HashSetIS9_NS8_11DefaultHashIS9_EENS8_10HashTraitsIS9_EENS8_15HashTableTraitsEEELm0ENS8_15CrashOnOverflowELm16ENS8_10FastMallocEEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSN_EEEDcOSO_DpOT0____fmatrix[v6])(&v10, &v3->_request.data.__lx[16]);
    }
    *(_DWORD *)&v3->_request.data.__lx[16] = v5;
    *(_DWORD *)&v3->_request.data.__lx[20] = v4;
    *(_DWORD *)&v3->_request.data.__lx[32] = 0;
  }
  return v3;
}

- (_WKTargetedElementRequest)initWithSelectors:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v4 = [(_WKTargetedElementRequest *)self init];
  if (!v4) {
    return v4;
  }
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  result = (_WKTargetedElementRequest *)[a3 count];
  if (!result)
  {
LABEL_5:
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v33;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v33 != v7) {
            objc_enumerationMutation(a3);
          }
          CGPoint v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
          v31 = 0;
          unsigned int v10 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize([v9 count]);
          if (v10 <= 8) {
            unsigned int v11 = 8;
          }
          else {
            unsigned int v11 = v10;
          }
          uint64_t v12 = WTF::fastZeroedMalloc((WTF *)(8 * v11 + 16));
          v31 = (WTF::StringImpl **)(v12 + 16);
          *(_DWORD *)(v12 + 8) = v11 - 1;
          *(_DWORD *)(v12 + 12) = v11;
          *(_DWORD *)uint64_t v12 = 0;
          *((_DWORD *)v31 - 3) = 0;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v14 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v9);
                }
                MEMORY[0x19972EAD0](&v26, *(void *)(*((void *)&v27 + 1) + 8 * i));
                WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v31, &v26, v17, (uint64_t)&v25);
                v19 = v26;
                v26 = 0;
                if (v19)
                {
                  if (*(_DWORD *)v19 == 2) {
                    WTF::StringImpl::destroy(v19, v18);
                  }
                  else {
                    *(_DWORD *)v19 -= 2;
                  }
                }
              }
              uint64_t v14 = [v9 countByEnumeratingWithState:&v27 objects:v38 count:16];
            }
            while (v14);
          }
          uint64_t v20 = HIDWORD(v37);
          if (HIDWORD(v37) == v37)
          {
            v21 = (WTF::StringImpl ***)WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v36, HIDWORD(v37) + 1, (unint64_t)&v31);
            uint64_t v20 = HIDWORD(v37);
            uint64_t v22 = v36;
            *(void *)(v36 + 8 * HIDWORD(v37)) = 0;
            v23 = *v21;
            *v21 = 0;
          }
          else
          {
            uint64_t v22 = v36;
            *(void *)(v36 + 8 * HIDWORD(v37)) = 0;
            v23 = v31;
            v31 = 0;
          }
          *(void *)(v22 + 8 * v20) = v23;
          ++HIDWORD(v37);
          if (v31) {
            WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v31, v13);
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v6);
    }
    std::__variant_detail::__assignment<std::__variant_detail::__traits<WebCore::FloatPoint,WTF::String,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>::__assign_alt[abi:sn180100]<2ul,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)&v4->_request.data.__lx[16], (unsigned int *)&v4->_request.data.__lx[16], &v36);
    WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v36, v24);
    return v4;
  }
  if (!((unint64_t)result >> 29))
  {
    LODWORD(v37) = result;
    uint64_t v36 = WTF::fastMalloc((WTF *)(8 * (void)result));
    goto LABEL_5;
  }
  __break(0xC471u);
  return result;
}

- (BOOL)canIncludeNearbyElements
{
  return self->_request.data.__lx[40];
}

- (void)setCanIncludeNearbyElements:(BOOL)a3
{
  self->_request.data.__lx[40] = a3;
}

- (BOOL)shouldIgnorePointerEventsNone
{
  return self->_request.data.__lx[41];
}

- (void)setShouldIgnorePointerEventsNone:(BOOL)a3
{
  self->_request.data.__lx[41] = a3;
}

- (void).cxx_destruct
{
  m_ptr = self->_searchText.m_ptr;
  self->_searchText.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end