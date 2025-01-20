@interface ENWebArchive
+ (ENWebArchive)webArchiveWithData:(id)a3;
+ (ENWebArchive)webArchiveWithDictionary:(id)a3;
- (ENWebArchive)initWithMainResource:(id)a3 subresources:(id)a4 subframeArchives:(id)a5;
- (ENWebResource)mainResource;
- (NSArray)subframeArchives;
- (NSArray)subresources;
- (id)data;
- (id)propertyList;
- (void)setMainResource:(id)a3;
- (void)setSubframeArchives:(id)a3;
- (void)setSubresources:(id)a3;
@end

@implementation ENWebArchive

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subframeArchives, 0);
  objc_storeStrong((id *)&self->_subresources, 0);
  objc_storeStrong((id *)&self->_mainResource, 0);
}

- (void)setSubframeArchives:(id)a3
{
}

- (NSArray)subframeArchives
{
  return self->_subframeArchives;
}

- (void)setSubresources:(id)a3
{
}

- (NSArray)subresources
{
  return self->_subresources;
}

- (void)setMainResource:(id)a3
{
}

- (ENWebResource)mainResource
{
  return self->_mainResource;
}

- (id)data
{
  v2 = [(ENWebArchive *)self propertyList];
  uint64_t v7 = 0;
  v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:&v7];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    NSLog(&cfstr_ErrorSerializi.isa, v7);
  }

  return v4;
}

- (id)propertyList
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(ENWebArchive *)self mainResource];

  if (v4)
  {
    id v5 = [(ENWebArchive *)self mainResource];
    v6 = [v5 propertyList];
    [v3 setObject:v6 forKeyedSubscript:@"WebMainResource"];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v8 = [(ENWebArchive *)self subresources];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) propertyList];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  [v3 setObject:v7 forKeyedSubscript:@"WebSubresources"];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = [(ENWebArchive *)self subframeArchives];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v22 + 1) + 8 * j) propertyList];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  [v3 setObject:v14 forKeyedSubscript:@"WebSubframeArchives"];
  return v3;
}

- (ENWebArchive)initWithMainResource:(id)a3 subresources:(id)a4 subframeArchives:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ENWebArchive;
  uint64_t v11 = [(ENWebArchive *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ENWebArchive *)v11 setMainResource:v8];
    [(ENWebArchive *)v12 setSubresources:v9];
    [(ENWebArchive *)v12 setSubframeArchives:v10];
  }

  return v12;
}

+ (ENWebArchive)webArchiveWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v24 = [v3 objectForKeyedSubscript:@"WebMainResource"];
  v4 = [v3 objectForKeyedSubscript:@"WebSubresources"];
  long long v25 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"WebSubframeArchives"];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = +[ENWebResource webResourceWithDictionary:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }

  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[ENWebArchive webArchiveWithDictionary:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  v20 = [ENWebArchive alloc];
  v21 = +[ENWebResource webResourceWithDictionary:v24];
  long long v22 = [(ENWebArchive *)v20 initWithMainResource:v21 subresources:v6 subframeArchives:v13];

  return v22;
}

+ (ENWebArchive)webArchiveWithData:(id)a3
{
  uint64_t v6 = 0;
  id v3 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:&v6];
  if (v3)
  {
    v4 = +[ENWebArchive webArchiveWithDictionary:v3];
  }
  else
  {
    NSLog(&cfstr_ErrorDeseriali.isa, v6);
    v4 = 0;
  }

  return (ENWebArchive *)v4;
}

@end