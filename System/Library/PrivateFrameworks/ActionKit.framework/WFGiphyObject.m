@interface WFGiphyObject
+ (BOOL)supportsSecureCoding;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allowedSecureCodingClassesByPropertyKey;
+ (id)captionJSONTransformer;
+ (id)imagesJSONTransformer;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)urlJSONTransformer;
- (NSDictionary)images;
- (NSString)caption;
- (NSString)objectId;
- (NSString)type;
- (NSString)wfName;
- (NSURL)url;
- (id)originalImage;
- (id)smallestImage;
- (id)wfSerializedRepresentation;
@end

@implementation WFGiphyObject

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        if ([v10 hasPrefix:@"link.contentkit.giphy."])
        {
          v11 = [v10 stringByReplacingOccurrencesOfString:@"link.contentkit.giphy.", &stru_26F008428, 0, 0, objc_msgSend(@"link.contentkit.giphy.", "length") withString options range];
          if ([v11 isEqualToString:@"images"]
            || [v11 isEqualToString:@"type"]
            || [v11 isEqualToString:@"url"]
            || [v11 isEqualToString:@"id"]
            || [v11 isEqualToString:@"caption"])
          {
            uint64_t v12 = [v5 wfObjectOfClass:objc_opt_class() forKey:v10];
          }
          else
          {
            uint64_t v12 = [v5 objectForKey:v10];
          }
          v13 = (void *)v12;
          if (v12) {
            [v4 setObject:v12 forKey:v11];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v14 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v7 = v14;
    }
    while (v14);
  }

  v15 = [MEMORY[0x263F86840] modelOfClass:a1 fromJSONDictionary:v4 error:0];

  return v15;
}

+ (id)captionJSONTransformer
{
  return (id)[MEMORY[0x263F86848] transformerUsingForwardBlock:&__block_literal_global_13638];
}

id __39__WFGiphyObject_captionJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (id)imagesJSONTransformer
{
  id v2 = [MEMORY[0x263F86840] dictionaryTransformerWithModelClass:objc_opt_class()];
  id v3 = (void *)MEMORY[0x263F86848];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__WFGiphyObject_imagesJSONTransformer__block_invoke;
  v9[3] = &unk_264E57850;
  id v10 = v2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__WFGiphyObject_imagesJSONTransformer__block_invoke_2;
  v7[3] = &unk_264E57850;
  id v8 = v10;
  id v4 = v10;
  id v5 = [v3 transformerUsingForwardBlock:v9 reverseBlock:v7];

  return v5;
}

id __38__WFGiphyObject_imagesJSONTransformer__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = (void *)[v6 mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = *(void **)(a1 + 32);
        v15 = [v8 objectForKey:v13];
        v16 = [v14 transformedValue:v15 success:a3 error:a4];
        [v7 setValue:v16 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

id __38__WFGiphyObject_imagesJSONTransformer__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = (void *)[v6 mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = *(void **)(a1 + 32);
        v15 = [v8 objectForKey:v13];
        v16 = [v14 reverseTransformedValue:v15 success:a3 error:a4];
        [v7 setValue:v16 forKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)urlJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x263F08D50], "mtl_URLValueTransformer");
}

+ (id)JSONKeyPathsByPropertyKey
{
  id v2 = objc_msgSend(NSDictionary, "mtl_identityPropertyMapWithModel:", a1);
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"id" forKey:@"objectId"];
  return v3;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  v8[3] = *MEMORY[0x263EF8340];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFGiphyObject;
  id v2 = objc_msgSendSuper2(&v7, sel_allowedSecureCodingClassesByPropertyKey);
  id v3 = (void *)[v2 mutableCopy];

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  [v3 setObject:v4 forKey:@"images"];

  id v5 = (void *)[v3 copy];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_objectId, 0);
}

- (NSDictionary)images
{
  return self->_images;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)caption
{
  return self->_caption;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)objectId
{
  return self->_objectId;
}

- (id)wfSerializedRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F86840] JSONDictionaryFromModel:self error:0];
  id v3 = (void *)[v2 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
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
        uint64_t v10 = objc_msgSend(v4, "objectForKey:", v9, (void)v14);
        uint64_t v11 = [@"link.contentkit.giphy." stringByAppendingString:v9];
        [v3 setObject:v10 forKey:v11];

        [v3 removeObjectForKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = WFRemoveNull(v3);

  return v12;
}

- (NSString)wfName
{
  id v3 = [(WFGiphyObject *)self caption];
  if ([v3 length]) {
    [(WFGiphyObject *)self caption];
  }
  else {
  id v4 = [(WFGiphyObject *)self objectId];
  }

  return (NSString *)v4;
}

- (id)smallestImage
{
  v11[1] = *MEMORY[0x263EF8340];
  id v2 = [(WFGiphyObject *)self images];
  id v3 = [v2 allValues];
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"fileSize > 0"];
  uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];
  uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"fileSize" ascending:1];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];
  uint64_t v9 = [v8 firstObject];

  return v9;
}

- (id)originalImage
{
  id v3 = [(WFGiphyObject *)self images];
  id v4 = [v3 objectForKey:@"fixed_height"];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(WFGiphyObject *)self images];
    id v8 = [v7 objectForKey:@"fixed_height_small"];
    uint64_t v9 = v8;
    if (v8)
    {
      id v6 = v8;
    }
    else
    {
      uint64_t v10 = [(WFGiphyObject *)self images];
      uint64_t v11 = [v10 allValues];
      id v6 = [v11 firstObject];
    }
  }

  return v6;
}

@end