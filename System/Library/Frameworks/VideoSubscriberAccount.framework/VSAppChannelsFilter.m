@interface VSAppChannelsFilter
- (NSArray)allChannelMappings;
- (NSArray)personalAppDescriptions;
- (NSDictionary)appsByChannelID;
- (NSSet)genericAppAdamIDs;
- (NSSet)personalAppAdamIDs;
- (NSSet)personalChannelIDs;
- (VSAppChannelsFilter)init;
- (void)_updateAdamIDs;
- (void)setAllChannelMappings:(id)a3;
- (void)setAppsByChannelID:(id)a3;
- (void)setGenericAppAdamIDs:(id)a3;
- (void)setPersonalAppAdamIDs:(id)a3;
- (void)setPersonalChannelIDs:(id)a3;
@end

@implementation VSAppChannelsFilter

- (VSAppChannelsFilter)init
{
  v11.receiver = self;
  v11.super_class = (Class)VSAppChannelsFilter;
  v2 = [(VSAppChannelsFilter *)&v11 init];
  if (v2)
  {
    v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    personalChannelIDs = v2->_personalChannelIDs;
    v2->_personalChannelIDs = v3;

    allChannelMappings = v2->_allChannelMappings;
    v2->_allChannelMappings = (NSArray *)MEMORY[0x1E4F1CBF0];

    v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    genericAppAdamIDs = v2->_genericAppAdamIDs;
    v2->_genericAppAdamIDs = v6;

    v8 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    personalAppAdamIDs = v2->_personalAppAdamIDs;
    v2->_personalAppAdamIDs = v8;
  }
  return v2;
}

- (void)_updateAdamIDs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(VSAppChannelsFilter *)self allChannelMappings];
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "appAdamID", v16);
        [v3 addObject:v9];
        v10 = [(VSAppChannelsFilter *)self personalChannelIDs];
        if ([v10 count])
        {
          objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
          v12 = [v8 channelIDs];
          v13 = [v11 setWithArray:v12];

          if ([v10 intersectsSet:v13]) {
            [v16 addObject:v9];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  v14 = v16;
  if ([v16 count])
  {
    id v15 = v16;

    id v3 = v15;
  }
  -[VSAppChannelsFilter setPersonalAppAdamIDs:](self, "setPersonalAppAdamIDs:", v16, v16);
  [(VSAppChannelsFilter *)self setGenericAppAdamIDs:v3];
}

- (void)setPersonalChannelIDs:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The personalChannelIDs parameter must not be nil."];
    uint64_t v4 = 0;
  }
  if (self->_personalChannelIDs != v4)
  {
    uint64_t v5 = (NSSet *)[(NSSet *)v7 copy];
    personalChannelIDs = self->_personalChannelIDs;
    self->_personalChannelIDs = v5;

    [(VSAppChannelsFilter *)self _updateAdamIDs];
    uint64_t v4 = v7;
  }
}

- (void)setAllChannelMappings:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The allChannelMappings parameter must not be nil."];
    uint64_t v4 = 0;
  }
  if (self->_allChannelMappings != v4)
  {
    uint64_t v5 = (NSArray *)[(NSArray *)v7 copy];
    allChannelMappings = self->_allChannelMappings;
    self->_allChannelMappings = v5;

    [(VSAppChannelsFilter *)self _updateAdamIDs];
    uint64_t v4 = v7;
  }
}

- (NSArray)personalAppDescriptions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(VSAppChannelsFilter *)self personalChannelIDs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(VSAppChannelsFilter *)self appsByChannelID];
        objc_super v11 = [v10 objectForKey:v9];

        if (v11) {
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v3 allObjects];

  return (NSArray *)v12;
}

- (NSSet)personalChannelIDs
{
  return self->_personalChannelIDs;
}

- (NSArray)allChannelMappings
{
  return self->_allChannelMappings;
}

- (NSSet)personalAppAdamIDs
{
  return self->_personalAppAdamIDs;
}

- (void)setPersonalAppAdamIDs:(id)a3
{
}

- (NSSet)genericAppAdamIDs
{
  return self->_genericAppAdamIDs;
}

- (void)setGenericAppAdamIDs:(id)a3
{
}

- (NSDictionary)appsByChannelID
{
  return self->_appsByChannelID;
}

- (void)setAppsByChannelID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsByChannelID, 0);
  objc_storeStrong((id *)&self->_genericAppAdamIDs, 0);
  objc_storeStrong((id *)&self->_personalAppAdamIDs, 0);
  objc_storeStrong((id *)&self->_allChannelMappings, 0);

  objc_storeStrong((id *)&self->_personalChannelIDs, 0);
}

@end