@interface PatternLoadResult
- (NSDictionary)groups;
- (NSDictionary)meta;
- (NSDictionary)settings;
- (NSString)patternId;
- (id)getPrompts;
- (unint64_t)patternType;
- (void)setGroups:(id)a3;
- (void)setMeta:(id)a3;
- (void)setPatternId:(id)a3;
- (void)setPatternType:(unint64_t)a3;
- (void)setSettings:(id)a3;
@end

@implementation PatternLoadResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
}

- (void)setGroups:(id)a3
{
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (void)setMeta:(id)a3
{
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setSettings:(id)a3
{
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (void)setPatternType:(unint64_t)a3
{
  self->_patternType = a3;
}

- (unint64_t)patternType
{
  return self->_patternType;
}

- (void)setPatternId:(id)a3
{
}

- (NSString)patternId
{
  return self->_patternId;
}

- (id)getPrompts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_1F212ED50 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(&unk_1F212ED50);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v8 = [(PatternLoadResult *)self groups];
        v9 = [v8 objectForKey:v7];

        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v4 = [&unk_1F212ED50 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  return v3;
}

@end