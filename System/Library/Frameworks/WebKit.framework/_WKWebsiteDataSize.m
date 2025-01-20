@interface _WKWebsiteDataSize
- (_WKWebsiteDataSize)initWithSize:(const void *)a3;
- (id).cxx_construct;
- (unint64_t)sizeOfDataTypes:(id)a3;
- (unint64_t)totalSize;
@end

@implementation _WKWebsiteDataSize

- (_WKWebsiteDataSize)initWithSize:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKWebsiteDataSize;
  v4 = [(_WKWebsiteDataSize *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_size = *(void *)a3;
    WTF::HashTable<unsigned int,WTF::KeyValuePair<unsigned int,unsigned long long>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned int,unsigned long long>>,WTF::DefaultHash<unsigned int>,WTF::HashMap<unsigned int,unsigned long long,WTF::DefaultHash<unsigned int>,WTF::HashTraits<unsigned int>,WTF::HashTraits<unsigned long long>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned int>>::HashTable((uint64_t *)&v10, (_DWORD **)a3 + 1);
    uint64_t isa = (uint64_t)v5[1].super.isa;
    v5[1].super.uint64_t isa = v10;
    v10 = (objc_class *)isa;
    if (isa) {
      WTF::fastFree((WTF *)(isa - 16), v6);
    }
  }
  return v5;
}

- (unint64_t)totalSize
{
  return self->_size;
}

- (unint64_t)sizeOfDataTypes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  uint64_t v8 = *(void *)v24;
  v22 = @"_WKWebsiteDataTypeAlternativeServices";
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(a3);
      }
      v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      if (objc_msgSend(v10, "isEqualToString:", @"WKWebsiteDataTypeCookies", v22))
      {
        int v11 = 1;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeFetchCache"])
      {
        int v11 = 0x8000;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeDiskCache"])
      {
        int v11 = 2;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeMemoryCache"])
      {
        int v11 = 4;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeOfflineWebApplicationCache"])
      {
        int v11 = 8;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeSessionStorage"])
      {
        int v11 = 16;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeLocalStorage"])
      {
        int v11 = 32;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeWebSQLDatabases"])
      {
        int v11 = 64;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeIndexedDBDatabases"])
      {
        int v11 = 128;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeServiceWorkerRegistrations"])
      {
        int v11 = 0x4000;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeFileSystem"])
      {
        int v11 = 0x80000;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"_WKWebsiteDataTypeHSTSCache"])
      {
        int v11 = 512;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeMediaKeys"])
      {
        int v11 = 256;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeHashSalt"])
      {
        int v11 = 0x10000;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"WKWebsiteDataTypeSearchFieldRecentSearches"])
      {
        int v11 = 1024;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"_WKWebsiteDataTypeResourceLoadStatistics"])
      {
        int v11 = 4096;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:@"_WKWebsiteDataTypeCredentials"])
      {
        int v11 = 0x2000;
        goto LABEL_43;
      }
      if (([v10 isEqualToString:@"_WKWebsiteDataTypeAdClickAttributions"] & 1) != 0
        || ([v10 isEqualToString:@"_WKWebsiteDataTypePrivateClickMeasurements"] & 1) != 0)
      {
        int v11 = 0x20000;
        goto LABEL_43;
      }
      if ([v10 isEqualToString:v22])
      {
        int v11 = 0x40000;
LABEL_43:
        Class isa = self[1].super.isa;
        if (isa)
        {
          unsigned int v13 = *((_DWORD *)isa - 2);
          unsigned int v14 = 9 * ((v11 + ~(v11 << 15)) ^ ((v11 + ~(v11 << 15)) >> 10));
          unsigned int v15 = (v14 ^ (v14 >> 6)) + ~((v14 ^ (v14 >> 6)) << 11);
          uint64_t v16 = v13 & (v15 ^ HIWORD(v15));
          int v17 = *((_DWORD *)isa + 4 * v16);
          if (v17 != v11)
          {
            int v18 = 1;
            while (v17)
            {
              uint64_t v16 = (v16 + v18) & v13;
              int v17 = *((_DWORD *)isa + 4 * v16);
              ++v18;
              if (v17 == v11) {
                goto LABEL_48;
              }
            }
            goto LABEL_49;
          }
LABEL_48:
          uint64_t v19 = *((void *)isa + 2 * v16 + 1);
        }
        else
        {
LABEL_49:
          uint64_t v19 = 0;
        }
        v7 += v19;
      }
      ++v9;
    }
    while (v9 != v6);
    uint64_t v20 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v6 = v20;
  }
  while (v20);
  return v7;
}

- (void).cxx_destruct
{
  Class isa = self[1].super.isa;
  if (isa) {
    WTF::fastFree((Class)((char *)isa - 16), (void *)a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end