@interface CLSFaceIdentificationFetch
- (id)requestIdentificationOfFaces:(id)a3 error:(id *)a4;
@end

@implementation CLSFaceIdentificationFetch

- (id)requestIdentificationOfFaces:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "personLocalIdentifier", (void)v18);
        v13 = (void *)v12;
        if (v12)
        {
          uint64_t v22 = v12;
          v23 = &unk_1F28F2C00;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          v15 = [v11 localIdentifier];
          v16 = [v5 objectForKeyedSubscript:v15];

          if (!v16) {
            [v5 setObject:v14 forKeyedSubscript:v15];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

@end