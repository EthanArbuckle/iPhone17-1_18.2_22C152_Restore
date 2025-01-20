@interface WKWebViewContentProviderRegistry
- (Class)providerForMIMEType:(const void *)a3;
- (Vector<WTF::String,)_mimeTypesWithCustomContentProviders;
- (WKWebViewContentProviderRegistry)initWithConfiguration:(id)a3;
- (id).cxx_construct;
- (void)registerProvider:(Class)a3 forMIMEType:(const void *)a4;
@end

@implementation WKWebViewContentProviderRegistry

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (Vector<WTF::String,)_mimeTypesWithCustomContentProviders
{
  uint64_t v3 = v2;
  m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v5 = *(m_tableForLLDB - 1);
    v6 = &m_tableForLLDB[4 * v5];
    if (*(m_tableForLLDB - 3))
    {
      v7 = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
      if (v5)
      {
        uint64_t v8 = 16 * v5;
        v7 = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
        while ((unint64_t)(*(void *)v7 + 1) <= 1)
        {
          v7 += 4;
          v8 -= 16;
          if (!v8)
          {
            v7 = v6;
            goto LABEL_8;
          }
        }
      }
      goto LABEL_8;
    }
    v7 = &m_tableForLLDB[4 * v5];
  }
  else
  {
    v7 = 0;
    uint64_t v5 = 0;
  }
  v6 = &m_tableForLLDB[4 * v5];
  if (!m_tableForLLDB)
  {
    v9 = 0;
    self = 0;
    *(void *)uint64_t v3 = 0;
    *(void *)(v3 + 8) = 0;
    goto LABEL_15;
  }
LABEL_8:
  v9 = &m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
  *(void *)uint64_t v3 = 0;
  *(void *)(v3 + 8) = 0;
  uint64_t v10 = *(m_tableForLLDB - 3);
  if (v10)
  {
    if (v10 >> 29)
    {
      __break(0xC471u);
      goto LABEL_29;
    }
    self = (WKWebViewContentProviderRegistry *)WTF::fastMalloc((WTF *)(8 * v10));
    *(_DWORD *)(v3 + 8) = v10;
    *(void *)uint64_t v3 = self;
  }
  else
  {
    self = 0;
  }
LABEL_15:
  if (v9 != v7)
  {
    unsigned int v11 = 0;
    do
    {
      v12 = *(_DWORD **)v7;
      if (*(void *)v7) {
        *v12 += 2;
      }
      *((void *)&self->super.isa + v11) = v12;
      v13 = v7 + 4;
      v7 = v6;
      if (v13 != v6)
      {
        v7 = v13;
        while ((unint64_t)(*(void *)v7 + 1) <= 1)
        {
          v7 += 4;
          if (v7 == v6)
          {
            v7 = v6;
            break;
          }
        }
      }
      ++v11;
    }
    while (v7 != v9);
    *(_DWORD *)(v3 + 12) = v11;
  }
LABEL_29:
  result.m_capacity = a2;
  result.m_size = HIDWORD(a2);
  result.m_buffer = (String *)self;
  return result;
}

- (WKWebViewContentProviderRegistry)initWithConfiguration:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)WKWebViewContentProviderRegistry;
  v4 = [(WKWebViewContentProviderRegistry *)&v24 init];
  if (v4)
  {
    if (+[WKPDFView platformSupportsPDFView])
    {
      uint64_t BoolValueForKey = [a3 preferences];
      if (!BoolValueForKey) {
        goto LABEL_7;
      }
      uint64_t v6 = [a3 preferences];
      {
        WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::$_0::operator() const(void)::impl += 2;
        WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::$_0::operator() const(void)::impl;
      }
      uint64_t BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 48), (WTF::StringImpl **)&WebKit::WebPreferencesKey::unifiedPDFEnabledKey(void)::key, v7);
      if ((BoolValueForKey & 1) == 0)
      {
LABEL_7:
        WebCore::MIMETypeRegistry::pdfMIMETypes((uint64_t *)&v23, (WebCore::MIMETypeRegistry *)BoolValueForKey);
        v9 = v23;
        if (v23) {
          uint64_t v10 = (char *)v23 + 8;
        }
        else {
          uint64_t v10 = 0;
        }
        if (v23) {
          unsigned int v11 = (char *)v23 + 16 * *(unsigned int *)v23 + 8;
        }
        else {
          unsigned int v11 = 0;
        }
        if (v10 != v11)
        {
          do
          {
            uint64_t v12 = objc_opt_class();
            MEMORY[0x19972EAD0](&v22, [NSString stringWithUTF8String:*(void *)v10]);
            [(WKWebViewContentProviderRegistry *)v4 registerProvider:v12 forMIMEType:&v22];
            v13 = v22;
            v22 = 0;
            if (v13)
            {
              if (*(_DWORD *)v13 == 2) {
                WTF::StringImpl::destroy(v13, v8);
              }
              else {
                *(_DWORD *)v13 -= 2;
              }
            }
            v10 += 16;
          }
          while (v10 != v11);
          v9 = v23;
        }
        v23 = 0;
        if (v9) {
          WTF::fastFree(v9, v8);
        }
      }
    }
    if (objc_msgSend(a3, "_systemPreviewEnabled", v22))
    {
      v14 = (WebCore::MIMETypeRegistry *)objc_msgSend((id)objc_msgSend(a3, "preferences"), "_modelDocumentEnabled");
      if ((v14 & 1) == 0)
      {
        WebCore::MIMETypeRegistry::usdMIMETypes((uint64_t *)&v23, v14);
        v16 = v23;
        if (v23) {
          v17 = (char *)v23 + 8;
        }
        else {
          v17 = 0;
        }
        if (v23) {
          v18 = (char *)v23 + 16 * *(unsigned int *)v23 + 8;
        }
        else {
          v18 = 0;
        }
        if (v17 != v18)
        {
          do
          {
            uint64_t v19 = objc_opt_class();
            MEMORY[0x19972EAD0](&v22, [NSString stringWithUTF8String:*(void *)v17]);
            [(WKWebViewContentProviderRegistry *)v4 registerProvider:v19 forMIMEType:&v22];
            v20 = v22;
            v22 = 0;
            if (v20)
            {
              if (*(_DWORD *)v20 == 2) {
                WTF::StringImpl::destroy(v20, v15);
              }
              else {
                *(_DWORD *)v20 -= 2;
              }
            }
            v17 += 16;
          }
          while (v17 != v18);
          v16 = v23;
        }
        v23 = 0;
        if (v16) {
          WTF::fastFree(v16, v15);
        }
      }
    }
  }
  return v4;
}

- (void)registerProvider:(Class)a3 forMIMEType:(const void *)a4
{
  p_contentProviderForMIMEType = (uint64_t *)&self->_contentProviderForMIMEType;
  m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::ASCIICaseInsensitiveHash,WTF::HashMap<WTF::String,objc_class  {objcproto24WKWebViewContentProvider},WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::HashTraits<WTF::String>,WTF::HashMap<objc_class  {objcproto24WKWebViewContentProvider}>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits>::expand((uint64_t *)&self->_contentProviderForMIMEType),
        (m_tableForLLDB = (_DWORD *)*p_contentProviderForMIMEType) != 0))
  {
    unsigned int v8 = *(m_tableForLLDB - 2);
  }
  else
  {
    unsigned int v8 = 0;
  }
  int v9 = WTF::ASCIICaseInsensitiveHash::hash(*(WTF::ASCIICaseInsensitiveHash **)a4, (const WTF::StringImpl *)a2);
  uint64_t v10 = 0;
  for (int i = 1; ; ++i)
  {
    uint64_t v12 = v9 & v8;
    v13 = (uint64_t *)&m_tableForLLDB[4 * v12];
    uint64_t v14 = *v13;
    if (*v13 == -1)
    {
      uint64_t v10 = (uint64_t *)&m_tableForLLDB[4 * v12];
      goto LABEL_10;
    }
    if (!v14) {
      break;
    }
    if (WTF::equalIgnoringASCIICaseCommon<WTF::StringImpl,WTF::StringImpl>(v14, *(void *)a4))
    {
      *(void *)&m_tableForLLDB[4 * v12 + 2] = a3;
      return;
    }
LABEL_10:
    int v9 = i + v12;
  }
  if (v10)
  {
    *uint64_t v10 = 0;
    v10[1] = 0;
    --*(_DWORD *)(*p_contentProviderForMIMEType - 16);
    v13 = v10;
  }
  WTF::String::operator=(v13, (WTF::StringImpl **)a4);
  v13[1] = (uint64_t)a3;
  uint64_t v15 = *p_contentProviderForMIMEType;
  if (*p_contentProviderForMIMEType) {
    int v16 = *(_DWORD *)(v15 - 12) + 1;
  }
  else {
    int v16 = 1;
  }
  *(_DWORD *)(v15 - 12) = v16;
  uint64_t v17 = *p_contentProviderForMIMEType;
  if (*p_contentProviderForMIMEType) {
    int v18 = *(_DWORD *)(v17 - 12);
  }
  else {
    int v18 = 0;
  }
  uint64_t v19 = (*(_DWORD *)(v17 - 16) + v18);
  unint64_t v20 = *(unsigned int *)(v17 - 4);
  if (v20 > 0x400)
  {
    if (v20 <= 2 * v19) {
      goto LABEL_24;
    }
  }
  else
  {
    if (3 * v20 > 4 * v19) {
      return;
    }
LABEL_24:
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::ASCIICaseInsensitiveHash,WTF::HashMap<WTF::String,objc_class  {objcproto24WKWebViewContentProvider},WTF::KeyValuePairKeyExtractor<objc_class  {objcproto24WKWebViewContentProvider}*>,WTF::HashTraits<WTF::String>,WTF::HashMap<objc_class  {objcproto24WKWebViewContentProvider}>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits>::expand(p_contentProviderForMIMEType);
  }
}

- (Class)providerForMIMEType:(const void *)a3
{
  Class result = *(Class *)a3;
  if (*(void *)a3)
  {
    if (!*((_DWORD *)result + 1)) {
      return 0;
    }
    m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
    if (!m_tableForLLDB) {
      return 0;
    }
    unsigned int v7 = *(m_tableForLLDB - 2);
    int v8 = WTF::ASCIICaseInsensitiveHash::hash(result, (const WTF::StringImpl *)a2);
    for (i = 0; ; int v8 = ++i + v10)
    {
      uint64_t v10 = v8 & v7;
      uint64_t v11 = *(void *)&m_tableForLLDB[4 * v10];
      if (v11 != -1)
      {
        if (!v11)
        {
          m_table = (Class *)self->_contentProviderForMIMEType.m_impl.var0.m_table;
          if (!m_table) {
            return 0;
          }
          v13 = &m_table[2 * *((unsigned int *)m_table - 1)];
          goto LABEL_12;
        }
        if (WTF::equalIgnoringASCIICaseCommon<WTF::StringImpl,WTF::StringImpl>(v11, *(void *)a3)) {
          break;
        }
      }
    }
    v13 = (Class *)&m_tableForLLDB[4 * v10];
    m_table = (Class *)self->_contentProviderForMIMEType.m_impl.var0.m_table;
    if (!m_table) {
      goto LABEL_13;
    }
LABEL_12:
    m_table += 2 * *((unsigned int *)m_table - 1);
LABEL_13:
    if (m_table != v13) {
      return v13[1];
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  m_tableForLLDB = self->_contentProviderForMIMEType.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v3 = *(m_tableForLLDB - 1);
    if (v3)
    {
      m_table = (WTF::StringImpl **)self->_contentProviderForMIMEType.m_impl.var0.m_table;
      do
      {
        uint64_t v5 = *m_table;
        if (*m_table != (WTF::StringImpl *)-1)
        {
          Class *m_table = 0;
          if (v5)
          {
            if (*(_DWORD *)v5 == 2) {
              WTF::StringImpl::destroy(v5, (WTF::StringImpl *)a2);
            }
            else {
              *(_DWORD *)v5 -= 2;
            }
          }
        }
        m_table += 2;
        --v3;
      }
      while (v3);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
}

@end