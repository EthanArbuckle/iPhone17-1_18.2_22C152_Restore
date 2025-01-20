@interface WFWebArchive
+ (BOOL)supportsSecureCoding;
- (NSArray)subframeArchives;
- (NSArray)subresources;
- (NSData)data;
- (WFWebArchive)initWithCoder:(id)a3;
- (WFWebArchive)initWithData:(id)a3;
- (WFWebArchive)initWithMainResource:(id)a3 subresources:(id)a4 subframeArchives:(id)a5;
- (WFWebArchive)initWithSerializedRepresentation:(id)a3;
- (WFWebResource)mainResource;
- (id)containedImageFiles;
- (id)serializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWebArchive

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subframeArchives, 0);
  objc_storeStrong((id *)&self->_subresources, 0);
  objc_storeStrong((id *)&self->_mainResource, 0);
}

- (NSArray)subframeArchives
{
  return self->_subframeArchives;
}

- (NSArray)subresources
{
  return self->_subresources;
}

- (WFWebResource)mainResource
{
  return self->_mainResource;
}

- (void)encodeWithCoder:(id)a3
{
  mainResource = self->_mainResource;
  id v5 = a3;
  [v5 encodeObject:mainResource forKey:@"WebMainResource"];
  [v5 encodeObject:self->_subresources forKey:@"WebSubresources"];
  [v5 encodeObject:self->_subframeArchives forKey:@"WebSubframeArchives"];
}

- (WFWebArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WebMainResource"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"WebSubresources"];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"WebSubframeArchives"];

  v14 = [(WFWebArchive *)self initWithMainResource:v5 subresources:v9 subframeArchives:v13];
  return v14;
}

- (id)serializedRepresentation
{
  v3 = objc_opt_new();
  mainResource = self->_mainResource;
  if (mainResource)
  {
    id v5 = [(WFWebResource *)mainResource serializedRepresentation];
    [v3 setObject:v5 forKey:@"WebMainResource"];
  }
  if ([(NSArray *)self->_subresources count])
  {
    v6 = [(NSArray *)self->_subresources if_map:&__block_literal_global_15];
    [v3 setObject:v6 forKey:@"WebSubresources"];
  }
  if ([(NSArray *)self->_subframeArchives count])
  {
    uint64_t v7 = [(NSArray *)self->_subframeArchives if_map:&__block_literal_global_18];
    [v3 setObject:v7 forKey:@"WebSubframeArchives"];
  }
  return v3;
}

uint64_t __40__WFWebArchive_serializedRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

uint64_t __40__WFWebArchive_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

- (WFWebArchive)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWebArchive *)self init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [WFWebResource alloc];
  uint64_t v7 = [v4 objectForKey:@"WebMainResource"];
  uint64_t v8 = [(WFWebResource *)v6 initWithSerializedRepresentation:v7];
  mainResource = v5->_mainResource;
  v5->_mainResource = (WFWebResource *)v8;

  if (v5->_mainResource)
  {
    v10 = [v4 objectForKey:@"WebSubresources"];
    uint64_t v11 = objc_msgSend(v10, "if_map:", &__block_literal_global_5501);
    subresources = v5->_subresources;
    v5->_subresources = (NSArray *)v11;

    v13 = [v4 objectForKey:@"WebSubframeArchives"];
    uint64_t v14 = objc_msgSend(v13, "if_map:", &__block_literal_global_10);
    subframeArchives = v5->_subframeArchives;
    v5->_subframeArchives = (NSArray *)v14;

    v16 = v5;
  }
  else
  {
LABEL_4:
    v16 = 0;
  }

  return v16;
}

WFWebArchive *__49__WFWebArchive_initWithSerializedRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFWebArchive alloc] initWithSerializedRepresentation:v2];

  return v3;
}

WFWebResource *__49__WFWebArchive_initWithSerializedRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFWebResource alloc] initWithSerializedRepresentation:v2];

  return v3;
}

- (NSData)data
{
  id v2 = [(WFWebArchive *)self serializedRepresentation];
  v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:0];

  return (NSData *)v3;
}

- (WFWebArchive)initWithData:(id)a3
{
  id v4 = [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  id v5 = [(WFWebArchive *)self initWithSerializedRepresentation:v4];

  return v5;
}

- (WFWebArchive)initWithMainResource:(id)a3 subresources:(id)a4 subframeArchives:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && (v12 = [(WFWebArchive *)self init], (self = v12) != 0))
  {
    objc_storeStrong((id *)&v12->_mainResource, a3);
    objc_storeStrong((id *)&self->_subresources, a4);
    objc_storeStrong((id *)&self->_subframeArchives, a5);
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)containedImageFiles
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(WFWebArchive *)self subresources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) containedImageFile];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [(WFWebArchive *)self subframeArchives];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) containedImageFiles];
        [v3 addObjectsFromArray:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  return v3;
}

@end