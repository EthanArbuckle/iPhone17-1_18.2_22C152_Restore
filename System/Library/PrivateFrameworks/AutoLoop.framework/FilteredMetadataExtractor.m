@interface FilteredMetadataExtractor
- (FilteredMetadataExtractor)init;
- (NSMutableArray)filteredKeysArray;
- (int)processFile;
- (void)removeMetadataFromInterpolatedFrameDict:(id)a3;
- (void)setFilteredKeysArray:(id)a3;
@end

@implementation FilteredMetadataExtractor

- (FilteredMetadataExtractor)init
{
  v8[7] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)FilteredMetadataExtractor;
  v2 = [(IrisVideoMetadataExtractor *)&v7 init];
  v8[0] = @"privET";
  v8[1] = @"privImgG";
  v8[2] = @"privTZF";
  v8[3] = @"privAFS";
  v8[4] = @"privAFSt";
  v8[5] = @"privFM";
  v8[6] = @"privECMVct";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  uint64_t v4 = [v3 mutableCopy];
  filteredKeysArray = v2->filteredKeysArray;
  v2->filteredKeysArray = (NSMutableArray *)v4;

  return v2;
}

- (void)removeMetadataFromInterpolatedFrameDict:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"InterpolatedFrame"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 BOOLValue])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = self->filteredKeysArray;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v12 = objc_msgSend(v4, "objectForKey:", v11, (void)v13);

          if (v12) {
            [v4 removeObjectForKey:v11];
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (int)processFile
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)FilteredMetadataExtractor;
  int v3 = [(IrisVideoMetadataExtractor *)&v17 processFile];
  if (!v3 && self->super._framesMetadataArray)
  {
    id v4 = (NSArray *)objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->super._framesMetadataArray;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
          [(FilteredMetadataExtractor *)self removeMetadataFromInterpolatedFrameDict:v10];
          [(NSArray *)v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }

    framesMetadataArray = self->super._framesMetadataArray;
    self->super._framesMetadataArray = v4;
  }
  return v3;
}

- (NSMutableArray)filteredKeysArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFilteredKeysArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end