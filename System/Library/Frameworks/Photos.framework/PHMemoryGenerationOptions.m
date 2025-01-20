@interface PHMemoryGenerationOptions
- (CLLocation)location;
- (NSArray)blockedMemories;
- (NSArray)existingMemories;
- (NSArray)peopleNames;
- (NSDate)date;
- (NSDictionary)extraParameters;
- (PHMemoryGenerationOptions)init;
- (PHPhotoLibrary)photoLibrary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)reason;
- (void)setBlockedMemories:(id)a3;
- (void)setDate:(id)a3;
- (void)setExistingMemories:(id)a3;
- (void)setExtraParameters:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPeopleNames:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation PHMemoryGenerationOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_extraParameters, 0);
  objc_storeStrong((id *)&self->_blockedMemories, 0);
  objc_storeStrong((id *)&self->_existingMemories, 0);
  objc_storeStrong((id *)&self->_peopleNames, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setExtraParameters:(id)a3
{
}

- (NSDictionary)extraParameters
{
  return self->_extraParameters;
}

- (void)setBlockedMemories:(id)a3
{
}

- (NSArray)blockedMemories
{
  return self->_blockedMemories;
}

- (void)setExistingMemories:(id)a3
{
}

- (NSArray)existingMemories
{
  return self->_existingMemories;
}

- (void)setPeopleNames:(id)a3
{
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PHMemoryGenerationOptions *)self date];
  [v3 setObject:v4 forKeyedSubscript:@"PHMemoryOptionDateKey"];

  v5 = [(PHMemoryGenerationOptions *)self location];
  [v3 setObject:v5 forKeyedSubscript:@"PHMemoryOptionLocationKey"];

  v6 = [(PHMemoryGenerationOptions *)self peopleNames];
  [v3 setObject:v6 forKeyedSubscript:@"PHMemoryOptionPeopleNamesKey"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHMemoryGenerationOptions reason](self, "reason"));
  [v3 setObject:v7 forKeyedSubscript:@"PHMemoryOptionReasonKey"];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PHMemoryGenerationOptions_dictionaryRepresentation__block_invoke;
  aBlock[3] = &unk_1E5843D00;
  id v8 = v3;
  id v16 = v8;
  v9 = (void (**)(void *, void *, __CFString *))_Block_copy(aBlock);
  v10 = [(PHMemoryGenerationOptions *)self existingMemories];
  v9[2](v9, v10, @"PHMemoryOptionExistingMemoryIdentifiersKey");

  v11 = [(PHMemoryGenerationOptions *)self blockedMemories];
  v9[2](v9, v11, @"PHMemoryOptionBlockedMemoryIdentifiersKey");

  v12 = [(PHMemoryGenerationOptions *)self extraParameters];
  [v8 setObject:v12 forKeyedSubscript:@"PHMemoryOptionExtraParametersKey"];

  id v13 = v8;
  return v13;
}

void __53__PHMemoryGenerationOptions_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v7 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "localIdentifier", (void)v14);
          if (v13) {
            [v7 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }

    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setReason:", -[PHMemoryGenerationOptions reason](self, "reason"));
  id v5 = [(PHMemoryGenerationOptions *)self date];
  [v4 setDate:v5];

  id v6 = [(PHMemoryGenerationOptions *)self location];
  [v4 setLocation:v6];

  v7 = [(PHMemoryGenerationOptions *)self peopleNames];
  id v8 = (void *)[v7 copy];
  [v4 setPeopleNames:v8];

  uint64_t v9 = [(PHMemoryGenerationOptions *)self existingMemories];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setExistingMemories:v10];

  uint64_t v11 = [(PHMemoryGenerationOptions *)self blockedMemories];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setBlockedMemories:v12];

  id v13 = [(PHMemoryGenerationOptions *)self extraParameters];
  long long v14 = (void *)[v13 copy];
  [v4 setExtraParameters:v14];

  long long v15 = [(PHMemoryGenerationOptions *)self photoLibrary];
  [v4 setPhotoLibrary:v15];

  return v4;
}

- (PHMemoryGenerationOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHMemoryGenerationOptions;
  v2 = [(PHMemoryGenerationOptions *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    date = v2->_date;
    v2->_date = (NSDate *)v3;

    v2->_reason = 1;
  }
  return v2;
}

@end