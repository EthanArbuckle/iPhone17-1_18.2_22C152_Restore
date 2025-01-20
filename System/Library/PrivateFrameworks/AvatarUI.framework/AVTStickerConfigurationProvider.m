@interface AVTStickerConfigurationProvider
- (AVTStickerConfigurationProvider)initWithEnvironment:(id)a3 forStickerPacks:(id)a4 stickerConfigurationNames:(id)a5;
- (AVTStickerPack)stickerPacks;
- (AVTUIEnvironment)environment;
- (NSArray)stickerConfigurationNames;
- (NSCache)stickerConfigurationCache;
- (id)availableStickerNamesForAvatarRecord:(id)a3;
- (id)filteredStickerConfigurations:(id)a3;
- (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4;
- (id)stickerConfigurationsForAvatarRecord:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setStickerConfigurationCache:(id)a3;
- (void)setStickerConfigurationNames:(id)a3;
- (void)setStickerPacks:(id)a3;
@end

@implementation AVTStickerConfigurationProvider

- (AVTStickerConfigurationProvider)initWithEnvironment:(id)a3 forStickerPacks:(id)a4 stickerConfigurationNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AVTStickerConfigurationProvider;
  v12 = [(AVTStickerConfigurationProvider *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a3);
    objc_storeStrong((id *)&v13->_stickerPacks, a4);
    v14 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    stickerConfigurationCache = v13->_stickerConfigurationCache;
    v13->_stickerConfigurationCache = v14;

    [(NSCache *)v13->_stickerConfigurationCache setCountLimit:3];
    objc_storeStrong((id *)&v13->_stickerConfigurationNames, a5);
  }

  return v13;
}

- (id)stickerConfigurationsForAvatarRecord:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEditable])
  {
    v5 = @"memoji";
  }
  else
  {
    v5 = [v4 identifier];
    if (!v5)
    {
      id v18 = 0;
      goto LABEL_17;
    }
  }
  v6 = [(NSCache *)self->_stickerConfigurationCache objectForKey:v5];
  if (!v6)
  {
    v20 = v5;
    v7 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = [(AVTStickerConfigurationProvider *)self stickerPacks];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          int v14 = [v4 isEditable];
          v15 = (void *)MEMORY[0x263F296C8];
          if (v14)
          {
            v16 = [MEMORY[0x263F296C8] stickerConfigurationsForMemojiInStickerPack:v13];
            [v7 addObjectsFromArray:v16];
          }
          else
          {
            v16 = [v4 identifier];
            objc_super v17 = [v15 stickerConfigurationsForAnimojiNamed:v16 inStickerPack:v13];
            [v7 addObjectsFromArray:v17];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    v6 = [(AVTStickerConfigurationProvider *)self filteredStickerConfigurations:v7];

    v5 = v20;
    [(NSCache *)self->_stickerConfigurationCache setObject:v6 forKey:v20];
  }
  id v18 = v6;

LABEL_17:
  return v18;
}

- (id)stickerConfigurationForAvatarRecord:(id)a3 stickerName:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    [(AVTStickerConfigurationProvider *)self stickerConfigurationsForAvatarRecord:a3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "name", (void)v15);
          char v13 = [v6 isEqualToString:v12];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)availableStickerNamesForAvatarRecord:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(AVTStickerConfigurationProvider *)self stickerPacks];
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
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        int v12 = [v4 isEditable];
        char v13 = (void *)MEMORY[0x263F296C8];
        if (v12)
        {
          int v14 = [MEMORY[0x263F296C8] availableStickerNamesForMemojiInStickerPack:v11];
          [v5 addObjectsFromArray:v14];
        }
        else
        {
          int v14 = [v4 identifier];
          long long v15 = [v13 availableStickerNamesForAnimojiNamed:v14 inStickerPack:v11];
          [v5 addObjectsFromArray:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)filteredStickerConfigurations:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AVTStickerConfigurationProvider *)self stickerConfigurationNames];
  long long v21 = self;
  if (v5)
  {
    id v6 = [(AVTStickerConfigurationProvider *)self stickerConfigurationNames];
    BOOL v7 = [v6 count] != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  id v20 = [MEMORY[0x263EFF980] array];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "name", v20);
        long long v16 = [v15 lowercaseString];

        if (!v7
          || ([(AVTStickerConfigurationProvider *)v21 stickerConfigurationNames],
              long long v17 = objc_claimAutoreleasedReturnValue(),
              int v18 = [v17 containsObject:v16],
              v17,
              v18))
        {
          if (([v8 containsObject:v16] & 1) == 0)
          {
            [v20 addObject:v14];
            [v8 addObject:v16];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  return v20;
}

- (NSCache)stickerConfigurationCache
{
  return self->_stickerConfigurationCache;
}

- (void)setStickerConfigurationCache:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (AVTStickerPack)stickerPacks
{
  return self->_stickerPacks;
}

- (void)setStickerPacks:(id)a3
{
}

- (NSArray)stickerConfigurationNames
{
  return self->_stickerConfigurationNames;
}

- (void)setStickerConfigurationNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerConfigurationNames, 0);
  objc_storeStrong((id *)&self->_stickerPacks, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_stickerConfigurationCache, 0);
}

@end