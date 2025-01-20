@interface SANPVideoLanguageOption(AFMediaRemoteUtilities)
+ (id)_languageOptionFromMediaRemoteRepresentation:()AFMediaRemoteUtilities;
@end

@implementation SANPVideoLanguageOption(AFMediaRemoteUtilities)

+ (id)_languageOptionFromMediaRemoteRepresentation:()AFMediaRemoteUtilities
{
  v34[10] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MRLanguageOptionCopyIdentifier();
  if (v0)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F968C0]);
    [v1 setIdentifier:v0];
    v2 = (void *)MRLanguageOptionCopyLanguageTag();
    [v1 setLanguageTag:v2];

    v3 = (void *)MRLanguageOptionCopyDisplayName();
    [v1 setDisplayName:v3];

    uint64_t v4 = *MEMORY[0x1E4F974D0];
    uint64_t v5 = *MEMORY[0x1E4F771E0];
    v33[0] = *MEMORY[0x1E4F771E8];
    v33[1] = v5;
    uint64_t v6 = *MEMORY[0x1E4F974C8];
    v34[0] = v4;
    v34[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F974A0];
    uint64_t v8 = *MEMORY[0x1E4F771F8];
    v33[2] = *MEMORY[0x1E4F771B8];
    v33[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F974E0];
    v34[2] = v7;
    v34[3] = v9;
    uint64_t v10 = *MEMORY[0x1E4F974A8];
    uint64_t v11 = *MEMORY[0x1E4F771D8];
    v33[4] = *MEMORY[0x1E4F771C0];
    v33[5] = v11;
    uint64_t v12 = *MEMORY[0x1E4F974C0];
    v34[4] = v10;
    v34[5] = v12;
    uint64_t v13 = *MEMORY[0x1E4F974B0];
    uint64_t v14 = *MEMORY[0x1E4F771F0];
    v33[6] = *MEMORY[0x1E4F771C8];
    v33[7] = v14;
    uint64_t v15 = *MEMORY[0x1E4F974D8];
    v34[6] = v13;
    v34[7] = v15;
    uint64_t v16 = *MEMORY[0x1E4F77200];
    v33[8] = *MEMORY[0x1E4F771D0];
    v33[9] = v16;
    uint64_t v17 = *MEMORY[0x1E4F974E8];
    v34[8] = *MEMORY[0x1E4F974B8];
    v34[9] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:10];
    v19 = (void *)MRLanguageOptionCopyCharacteristics();
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = objc_msgSend(v18, "objectForKey:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
          if (v26) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v23);
    }

    [v1 setCharacteristics:v20];
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

@end