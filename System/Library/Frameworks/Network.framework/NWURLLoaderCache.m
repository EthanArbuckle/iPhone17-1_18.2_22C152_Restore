@interface NWURLLoaderCache
- (void)copyVaryStateFromRequest:(void *)a1 varyValueToCopy:(void *)a2;
@end

@implementation NWURLLoaderCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_dataToCache, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)copyVaryStateFromRequest:(void *)a1 varyValueToCopy:(void *)a2
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = v4;
  v6 = [v4 componentsSeparatedByString:@","];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v13 = [v11 stringByTrimmingCharactersInSet:v12];

        v14 = [v3 valueForHTTPHeaderField:v13];
        if (v14) {
          [v5 setObject:v14 forKeyedSubscript:v13];
        }
        else {
          [v13 caseInsensitiveCompare:@"Cookie"];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

@end