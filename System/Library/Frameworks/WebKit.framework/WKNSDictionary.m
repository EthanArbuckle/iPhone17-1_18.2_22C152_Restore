@interface WKNSDictionary
- (Object)_apiObject;
- (WKNSDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation WKNSDictionary

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    uint64_t v5 = *(void *)&self->_dictionary.data.__lx[16];
    if (v5) {
      WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::RefPtr<API::Object,WTF::RawPtrTraits<API::Object>,WTF::DefaultRefDerefTraits<API::Object>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v5, v4);
    }
    v6.receiver = self;
    v6.super_class = (Class)WKNSDictionary;
    [(WKNSDictionary *)&v6 dealloc];
  }
}

- (WKNSDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)WKNSDictionary;
  return [(WKNSDictionary *)&v6 initWithObjects:a3 forKeys:a4 count:a5];
}

- (unint64_t)count
{
  uint64_t v2 = *(void *)&self->_dictionary.data.__lx[16];
  if (v2) {
    return *(unsigned int *)(v2 - 12);
  }
  else {
    return 0;
  }
}

- (id)objectForKey:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  p_dictionary = &self->_dictionary;
  MEMORY[0x19972EAD0](&v23, a3);
  uint64_t v8 = *(void *)&p_dictionary->data.__lx[16];
  if (!v8) {
    goto LABEL_19;
  }
  unsigned int v9 = *(_DWORD *)(v8 - 8);
  unsigned int v10 = *((_DWORD *)v23 + 4);
  int v11 = v10 >= 0x100 ? v10 >> 8 : WTF::StringImpl::hashSlowCase(v23);
  for (i = 0; ; int v11 = ++i + v14)
  {
    uint64_t v14 = v11 & v9;
    v15 = *(WTF **)(v8 + 16 * v14);
    if (!v15)
    {
      uint64_t v16 = *(void *)&p_dictionary->data.__lx[16];
      if (!v16) {
        goto LABEL_19;
      }
      uint64_t v17 = v16 + 16 * *(unsigned int *)(v16 - 4);
      goto LABEL_15;
    }
    if (v15 != (WTF *)-1 && (WTF::equal(v15, v23, v7) & 1) != 0) {
      break;
    }
  }
  uint64_t v17 = v8 + 16 * v14;
  uint64_t v16 = *(void *)&p_dictionary->data.__lx[16];
  if (!v16) {
    goto LABEL_16;
  }
LABEL_15:
  v16 += 16 * *(unsigned int *)(v16 - 4);
LABEL_16:
  if (v16 == v17)
  {
LABEL_19:
    uint64_t v18 = 0;
    char v19 = 1;
  }
  else
  {
    uint64_t v18 = *(void *)(v17 + 8);
    if (v18)
    {
      CFRetain(*(CFTypeRef *)(v18 + 8));
      char v19 = 0;
      char v20 = 0;
      goto LABEL_21;
    }
    char v19 = 0;
  }
  char v20 = 1;
LABEL_21:
  v21 = v23;
  v23 = 0;
  if (!v21) {
    goto LABEL_24;
  }
  if (*(_DWORD *)v21 != 2)
  {
    *(_DWORD *)v21 -= 2;
LABEL_24:
    if (v19) {
      goto LABEL_25;
    }
LABEL_29:
    if (v18)
    {
      v12 = *(void **)(v18 + 8);
      if (v20) {
        return v12;
      }
    }
    else
    {
      v12 = (void *)[MEMORY[0x1E4F1CA98] null];
      if (v20) {
        return v12;
      }
    }
    goto LABEL_26;
  }
  WTF::StringImpl::destroy(v21, v6);
  if ((v19 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_25:
  v12 = 0;
  if ((v20 & 1) == 0) {
LABEL_26:
  }
    CFRelease(*(CFTypeRef *)(v18 + 8));
  return v12;
}

- (id)keyEnumerator
{
  API::Dictionary::keys((API::Dictionary *)&self->_dictionary, &v6);
  uint64_t v2 = v6;
  v3 = *(void **)(v6 + 8);
  if (v3) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  v4 = (void *)[v3 objectEnumerator];
  if (v3) {
    CFRelease(v3);
  }
  CFRelease(*(CFTypeRef *)(v2 + 8));
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_dictionary;
}

@end