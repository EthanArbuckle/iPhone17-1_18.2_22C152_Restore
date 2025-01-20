@interface AVTCoreModelFramingModeOverrides
- (AVTCoreModelFramingModeOverrides)initWithCameraOverrides:(id)a3;
- (NSArray)orderedFramingModeOverrides;
- (NSArray)orderedTags;
@end

@implementation AVTCoreModelFramingModeOverrides

- (AVTCoreModelFramingModeOverrides)initWithCameraOverrides:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AVTCoreModelFramingModeOverrides;
  v5 = [(AVTCoreModelFramingModeOverrides *)&v47 init];
  v6 = v5;
  if (v5)
  {
    v30 = v5;
    uint64_t v7 = [v4 count];
    v35 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    v34 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v31 = v4;
    id obj = v4;
    uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v36)
    {
      uint64_t v33 = *(void *)v44;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(obj);
          }
          v37 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
          uint64_t v38 = v8;
          v9 = [v37 objectForKeyedSubscript:@"tags"];
          v10 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
          v11 = [v9 allKeys];
          v12 = (void *)[v11 copy];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                v19 = (void *)MEMORY[0x263EFF9D8];
                v20 = [v9 objectForKeyedSubscript:v18];
                v21 = [v19 orderedSetWithObject:v20];
                [v10 setObject:v21 forKeyedSubscript:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }
            while (v15);
          }

          v22 = (void *)[v10 copy];
          [v35 addObject:v22];

          v23 = [v37 objectForKeyedSubscript:@"camera"];
          v24 = +[AVTEditingModelMappings framingModeForCameraIdentifier:v23];

          [v34 addObject:v24];
          uint64_t v8 = v38 + 1;
        }
        while (v38 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v36);
    }

    uint64_t v25 = [v35 copy];
    v6 = v30;
    orderedTags = v30->_orderedTags;
    v30->_orderedTags = (NSArray *)v25;

    uint64_t v27 = [v34 copy];
    orderedFramingModeOverrides = v30->_orderedFramingModeOverrides;
    v30->_orderedFramingModeOverrides = (NSArray *)v27;

    id v4 = v31;
  }

  return v6;
}

- (NSArray)orderedTags
{
  return self->_orderedTags;
}

- (NSArray)orderedFramingModeOverrides
{
  return self->_orderedFramingModeOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFramingModeOverrides, 0);
  objc_storeStrong((id *)&self->_orderedTags, 0);
}

@end