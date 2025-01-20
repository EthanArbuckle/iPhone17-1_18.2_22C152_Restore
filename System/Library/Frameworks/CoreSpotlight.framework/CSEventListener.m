@interface CSEventListener
- (CSEventListener)initWithEventListenerDelegate:(id)a3;
@end

@implementation CSEventListener

- (CSEventListener)initWithEventListenerDelegate:(id)a3
{
  id v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CSEventListener;
  v6 = [(CSEventListener *)&v50 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v7->_eventFlags = (unint64_t)[v5 eventFlags];
    v8 = [v5 includeBundleIDs];
    id v9 = [v8 count];
    if (v9)
    {
      v10 = +[NSMutableSet setWithCapacity:v9];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v11 = v8;
      id v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v47;
        do
        {
          v15 = 0;
          do
          {
            if (*(void *)v47 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = (const char *)[*(id *)(*((void *)&v46 + 1) + 8 * (void)v15) UTF8String];
            int v17 = strlen(v16);
            v18 = +[NSNumber numberWithUnsignedInt:sub_100058BD8((uint64_t)v16, v17 + 1)];
            [v10 addObject:v18];

            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
        }
        while (v13);
      }

      if ([v10 count])
      {
        v19 = (NSSet *)[v10 copy];
        includedBundleHashes = v7->_includedBundleHashes;
        v7->_includedBundleHashes = v19;
      }
    }
    v21 = [v5 excludeBundleIDs];

    id v22 = [v21 count];
    if (v22)
    {
      v23 = +[NSMutableSet setWithCapacity:v22];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v24 = v21;
      id v25 = [v24 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v43;
        do
        {
          v28 = 0;
          do
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = *(id *)(*((void *)&v42 + 1) + 8 * (void)v28);
            v30 = (const char *)objc_msgSend(v29, "UTF8String", (void)v42);
            int v31 = strlen(v30);
            v32 = +[NSNumber numberWithUnsignedInt:sub_100058BD8((uint64_t)v30, v31 + 1)];
            [v23 addObject:v32];

            v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          id v26 = [v24 countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v26);
      }

      if ([v23 count])
      {
        v33 = (NSSet *)[v23 copy];
        excludedBundleHashes = v7->_excludedBundleHashes;
        v7->_excludedBundleHashes = v33;
      }
    }
    v35 = objc_msgSend(v5, "requiredAttributes", (void)v42);
    v36 = (NSArray *)[v35 copy];
    requiredAttributes = v7->_requiredAttributes;
    v7->_requiredAttributes = v36;

    v38 = [v5 optionalAttribures];
    v39 = (NSArray *)[v38 copy];
    optionalAttribures = v7->_optionalAttribures;
    v7->_optionalAttribures = v39;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalAttribures, 0);
  objc_storeStrong((id *)&self->_requiredAttributes, 0);
  objc_storeStrong((id *)&self->_excludeContentTypes, 0);
  objc_storeStrong((id *)&self->_includeContentTypes, 0);
  objc_storeStrong((id *)&self->_excludedBundleHashes, 0);
  objc_storeStrong((id *)&self->_includedBundleHashes, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end