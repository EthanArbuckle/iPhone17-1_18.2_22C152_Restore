@interface LoopQuicktimeMetadata
+ (id)arrayFromDictionary:(id)a3;
+ (id)metadataArrayForDictionary:(id)a3;
+ (id)metadataDictionaryForAssetURL:(id)a3;
+ (id)metadataStringArrayForAssetURL:(id)a3;
+ (id)metadataStringForArray:(id)a3;
+ (id)metadataStringForAssetURL:(id)a3;
@end

@implementation LoopQuicktimeMetadata

+ (id)metadataArrayForDictionary:(id)a3
{
  id v9 = 0;
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:1 error:&v9];
  id v4 = v9;
  if (v4)
  {
    NSLog(&cfstr_Metadataarrayf.isa);
    v5 = 0;
  }
  else
  {
    v6 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v7 setKeySpace:*MEMORY[0x1E4F15DF8]];
    [v7 setKey:qword_1EAB20CA0];
    [v7 setDataType:*MEMORY[0x1E4F1F078]];
    [v7 setValue:v6];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  }

  return v5;
}

+ (id)metadataDictionaryForAssetURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  v15 = objc_msgSend(MEMORY[0x1E4F16330], "assetWithURL:");
  v3 = [v15 metadataForFormat:*MEMORY[0x1E4F15D18]];
  [MEMORY[0x1E4F16558] metadataItemsFromArray:v3 withKey:qword_1EAB20CA0 keySpace:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      v10 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v9) stringValue];
        v12 = [v11 dataUsingEncoding:4];

        id v17 = 0;
        id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:&v17];
        id v13 = v17;

        if (v13) {
          sub_1DD3DC9BC();
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)arrayFromDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (long long v16 = 0u,
        long long v17 = 0u,
        long long v14 = 0u,
        long long v15 = 0u,
        (uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16]) != 0))
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v4 objectForKey:v10];
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        v12 = [NSString stringWithFormat:@"%@ : %@", v10, v11];
        [v7 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)metadataStringArrayForAssetURL:(id)a3
{
  id v4 = [a1 metadataDictionaryForAssetURL:a3];
  uint64_t v5 = [a1 arrayFromDictionary:v4];

  return v5;
}

+ (id)metadataStringForArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      unint64_t v5 = 0;
      uint64_t v6 = &stru_1F3892F38;
      do
      {
        id v7 = [v4 objectAtIndexedSubscript:v5];
        uint64_t v8 = v7;
        if (v5)
        {
          uint64_t v9 = [NSString stringWithFormat:@"%@; %@", v6, v7];
        }
        else
        {
          uint64_t v9 = v7;
        }
        uint64_t v10 = v9;

        ++v5;
        uint64_t v6 = v10;
      }
      while (v5 < [v4 count]);
    }
    else
    {
      uint64_t v10 = &stru_1F3892F38;
    }
    v12 = v10;
    v11 = v12;
  }
  else
  {
    v11 = 0;
    v12 = &stru_1F3892F38;
  }

  return v11;
}

+ (id)metadataStringForAssetURL:(id)a3
{
  id v3 = +[LoopQuicktimeMetadata metadataStringArrayForAssetURL:a3];
  id v4 = +[LoopQuicktimeMetadata metadataStringForArray:v3];

  return v4;
}

@end