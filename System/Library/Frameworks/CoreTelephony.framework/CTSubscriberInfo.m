@interface CTSubscriberInfo
+ (CTSubscriber)subscriber;
+ (NSArray)subscribers;
+ (void)subscribers;
@end

@implementation CTSubscriberInfo

+ (NSArray)subscribers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v19 = 0;
  v3 = [v2 getDescriptorsForDomain:1 error:&v19];
  id v4 = v19;
  if (v4)
  {
    v5 = CTLogSubscriber();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CTSubscriberInfo subscribers];
    }
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CA48];
    v8 = [v3 descriptors];
    v6 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = objc_msgSend(v3, "descriptors", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = [[CTSubscriber alloc] initWithDescriptor:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v6 addObject:v13];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }

  return (NSArray *)v6;
}

+ (CTSubscriber)subscriber
{
  v2 = [a1 subscribers];
  if ([v2 count])
  {
    v3 = [v2 objectAtIndexedSubscript:0];
  }
  else
  {
    v3 = 0;
  }

  return (CTSubscriber *)v3;
}

+ (void)subscribers
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "Unable to get service descriptors: %@", (uint8_t *)&v2, 0xCu);
}

@end