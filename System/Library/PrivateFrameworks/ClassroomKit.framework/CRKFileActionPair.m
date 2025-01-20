@interface CRKFileActionPair
- (BOOL)isEqual:(id)a3;
- (CRKFileActionPair)initWithSourceURL:(id)a3 destinationURL:(id)a4;
- (NSURL)destinationURL;
- (NSURL)sourceURL;
- (unint64_t)hash;
@end

@implementation CRKFileActionPair

- (CRKFileActionPair)initWithSourceURL:(id)a3 destinationURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFileActionPair;
  v9 = [(CRKFileActionPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceURL, a3);
    objc_storeStrong((id *)&v10->_destinationURL, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(@"sourceURL, destinationURL", "componentsSeparatedByString:", @",");
  v4 = (void *)[v3 mutableCopy];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __crk_tokenized_properties_block_invoke_10;
  v19[3] = &unk_2646F3750;
  id v5 = v4;
  id v20 = v5;
  [v5 enumerateObjectsUsingBlock:v19];

  v6 = self;
  id v7 = v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = [(CRKFileActionPair *)v6 valueForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        v10 ^= [v13 hash];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(@"sourceURL, destinationURL", "componentsSeparatedByString:", @",");
  v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_10;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  uint64_t v9 = (CRKFileActionPair *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKFileActionPair *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          long long v17 = v9;
          uint64_t v18 = [(CRKFileActionPair *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKFileActionPair *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURL, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

@end