@interface CNContactBufferDecoderFactory
+ (id)decoderForFetchRequest:(id)a3;
@end

@implementation CNContactBufferDecoderFactory

+ (id)decoderForFetchRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(v3, "effectiveKeysToFetch", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "_cn_requiredKeys");
        [v4 unionKeyVector:v11];

        v12 = objc_msgSend(v10, "_cn_optionalKeys");
        [v4 unionKeyVector:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  +[CNAccessAuthorization removeUnavailableKeysFromContactKeyVector:v4];
  v13 = -[CNContactBufferDecoder initWithKeyDescriptorToMakeAvailable:mutableResults:]([CNContactBufferDecoder alloc], "initWithKeyDescriptorToMakeAvailable:mutableResults:", v4, [v3 mutableObjects]);

  return v13;
}

@end