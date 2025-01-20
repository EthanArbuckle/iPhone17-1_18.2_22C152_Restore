@interface _WKSmartCardSlotObserver
- (WTF::StringImpl)observeValueForKeyPath:(WTF::StringImpl *)result ofObject:change:context:;
- (_WKSmartCardSlotObserver)initWithService:(void *)a3;
- (id).cxx_construct;
- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observeValueForKeyPath:(void *)a1 ofObject:(void *)a2 change:context:;
@end

@implementation _WKSmartCardSlotObserver

- (_WKSmartCardSlotObserver)initWithService:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_WKSmartCardSlotObserver;
  v4 = [(_WKSmartCardSlotObserver *)&v10 init];
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(void *)a3 = 0;
    m_ptr = (unsigned int *)v4->m_service.m_impl.m_ptr;
    v6->m_service.m_impl.m_ptr = v7;
    if (m_ptr)
    {
      if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
  }
  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  m_ptr = self->m_service.m_impl.m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr, 1u);
  }
  if (a5) {
    CFRetain(a5);
  }
  v8 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v8 = &unk_1EE9D2708;
  v8[1] = m_ptr;
  v8[2] = a5;
  v9 = v8;
  WTF::callOnMainRunLoop();
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->m_service.m_impl.m_ptr;
  self->m_service.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)observeValueForKeyPath:(void *)a1 ofObject:(void *)a2 change:context:
{
  *a1 = &unk_1EE9D2708;
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  *(void *)this = &unk_1EE9D2708;
  v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (unsigned int *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4 && atomic_fetch_add((atomic_uint *volatile)v4, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, v4);
    WTF::fastFree((WTF *)v4, a2);
  }

  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)observeValueForKeyPath:(WTF::StringImpl *)result ofObject:change:context:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v1 = result[1];
  if (v1)
  {
    uint64_t v47 = *((void *)v1 + 1);
    if (v47)
    {
      v2 = (void *)[(WTF::StringImpl *)result[2] objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      v55 = 0;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v3 = [v2 countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v3)
      {
        uint64_t v4 = *(void *)v52;
        v5 = (uint64_t *)(v47 + 80);
        do
        {
          for (uint64_t i = 0; i != v3; ++i)
          {
            if (*(void *)v52 != v4) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            MEMORY[0x19972EAD0](&v50, v7);
            WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v55, &v50, v8, (uint64_t)v49);
            uint64_t v10 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::find<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(v5, &v50, v9);
            uint64_t v12 = *v5;
            if (*v5) {
              v12 += 16 * *(unsigned int *)(v12 - 4);
            }
            if (v12 == v10)
            {
              v13 = (void *)[MEMORY[0x1E4F25248] defaultManager];
              v14 = v50;
              if (v50) {
                *(_DWORD *)v50 += 2;
              }
              v15 = malloc_type_malloc(0x30uLL, 0x10E0040FAC56454uLL);
              void *v15 = MEMORY[0x1E4F14398];
              v15[1] = 50331650;
              v15[2] = WTF::BlockPtr<void ()(TKSmartCardSlot *)>::fromCallable<WebKit::CcidService::updateSlots(NSArray *)::$_0>(WebKit::CcidService::updateSlots(NSArray *)::$_0)::{lambda(void *,TKSmartCardSlot *)#1}::__invoke;
              v15[3] = &WTF::BlockPtr<void ()(TKSmartCardSlot *)>::fromCallable<WebKit::CcidService::updateSlots(NSArray *)::$_0>(WebKit::CcidService::updateSlots(NSArray *)::$_0)::descriptor;
              v15[4] = v47;
              v15[5] = v14;
              [v13 getSlotWithName:v7 reply:v15];
              _Block_release(v15);
            }
            v16 = v50;
            v50 = 0;
            if (v16)
            {
              if (*(_DWORD *)v16 == 2) {
                WTF::StringImpl::destroy(v16, v11);
              }
              else {
                *(_DWORD *)v16 -= 2;
              }
            }
          }
          uint64_t v3 = [v2 countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v3);
      }
      v50 = 0;
      v17 = *(void **)(v47 + 80);
      v48 = (uint64_t *)(v47 + 80);
      v18 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WebKit::SimulatedInputSource,WTF::RawPtrTraits<WebKit::SimulatedInputSource>,WTF::DefaultRefDerefTraits<WebKit::SimulatedInputSource>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin(v17);
      v20 = v18;
      v22 = v21;
      if (v17) {
        v23 = (WTF::StringImpl **)&v17[2 * *((unsigned int *)v17 - 1)];
      }
      else {
        v23 = 0;
      }
      if (v23 != v18)
      {
        do
        {
          v24 = v55;
          if (!v55)
          {
LABEL_25:
            WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v50, v20, v19, (uint64_t)v49);
            [(WTF::StringImpl *)v20[1] removeObserver];
            goto LABEL_26;
          }
          int v25 = *((_DWORD *)v55 - 2);
          unsigned int v26 = *((_DWORD *)*v20 + 4);
          if (v26 >= 0x100) {
            unsigned int v27 = v26 >> 8;
          }
          else {
            unsigned int v27 = WTF::StringImpl::hashSlowCase(*v20);
          }
          for (j = 0; ; unsigned int v27 = j + v29)
          {
            int v29 = v27 & v25;
            v30 = v24[v27 & v25];
            if (v30 != (WTF *)-1)
            {
              if (!v30) {
                goto LABEL_25;
              }
              if (WTF::equal(v30, *v20, v19)) {
                break;
              }
            }
            ++j;
          }
LABEL_26:
          while (1)
          {
            v20 += 2;
            if (v20 == v22) {
              break;
            }
            if ((unint64_t)*v20 + 1 > 1) {
              goto LABEL_30;
            }
          }
          v20 = v22;
LABEL_30:
          ;
        }
        while (v20 != v23);
      }
      v33 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin((void **)&v50);
      v34 = (WTF::StringImpl **)v31;
      v35 = (WTF::StringImpl **)v50;
      if (v50) {
        v36 = (WTF::StringImpl **)((char *)v50 + 8 * *((unsigned int *)v50 - 1));
      }
      else {
        v36 = 0;
      }
      if (v36 != v33)
      {
        do
        {
          v37 = (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::find<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(v48, v33, v32);
          v38 = v37;
          if (*v48)
          {
            uint64_t v39 = *v48 + 16 * *(unsigned int *)(*v48 - 4);
            if ((WTF::StringImpl **)v39 == v37) {
              goto LABEL_61;
            }
          }
          else
          {
            if (!v37) {
              goto LABEL_61;
            }
            uint64_t v39 = 0;
          }
          if ((WTF::StringImpl **)v39 != v37)
          {
            WTF::HashTraits<WTF::String>::customDeleteBucket(v37, v31);
            v40 = v38[1];
            v38[1] = 0;
            if (v40) {
              CFRelease(v40);
            }
            ++*(_DWORD *)(*v48 - 16);
            uint64_t v41 = *v48;
            if (*v48) {
              int v42 = *(_DWORD *)(v41 - 12) - 1;
            }
            else {
              int v42 = -1;
            }
            *(_DWORD *)(v41 - 12) = v42;
            uint64_t v43 = *v48;
            if (*v48)
            {
              unsigned int v44 = 6 * *(_DWORD *)(v43 - 12);
              unsigned int v45 = *(_DWORD *)(v43 - 4);
              if (v44 < v45 && v45 >= 9) {
                WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RetainPtr<_WKSmartCardSlotStateObserver>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RetainPtr<_WKSmartCardSlotStateObserver>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(v48, v45 >> 1);
              }
            }
          }
LABEL_61:
          while (++v33 != v34)
          {
            if ((unint64_t)*v33 + 1 > 1) {
              goto LABEL_65;
            }
          }
          v33 = v34;
LABEL_65:
          ;
        }
        while (v33 != v36);
        v35 = (WTF::StringImpl **)v50;
      }
      if (v35) {
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v35, v31);
      }
      result = v55;
      if (v55) {
        return (WTF::StringImpl **)WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v55, v31);
      }
    }
  }
  return result;
}

@end