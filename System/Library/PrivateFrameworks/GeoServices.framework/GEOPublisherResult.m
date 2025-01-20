@interface GEOPublisherResult
+ (id)publisherResultsFromResponse:(id)a3;
- (GEOPublisher)publisher;
- (GEOPublisherResult)initWithPublisherResult:(id)a3;
@end

@implementation GEOPublisherResult

- (GEOPublisherResult)initWithPublisherResult:(id)a3
{
  v5 = (id *)a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOPublisherResult;
  v6 = [(GEOPublisherResult *)&v21 init];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  v7 = -[GEOPDPublisherResult components](v5);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__GEOPublisherResult_initWithPublisherResult___block_invoke;
  v14[3] = &unk_1E53DAA50;
  v14[4] = &v15;
  [v7 enumerateObjectsUsingBlock:v14];

  uint64_t v8 = v16[5];
  if (v8)
  {
    objc_storeStrong((id *)&v6->_publisherResult, a3);
    v9 = (GEOPDComponent *)(id)v16[5];
    p_super = &v6->_publisherComponent->super.super;
    v6->_publisherComponent = v9;
  }
  else
  {
    p_super = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "PublisherResult cannot be initialized, publisherComponent is nil", v13, 2u);
    }
  }

  _Block_object_dispose(&v15, 8);
  if (!v8) {
    v11 = 0;
  }
  else {
LABEL_7:
  }
    v11 = v6;

  return v11;
}

void __46__GEOPublisherResult_initWithPublisherResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = a2;
  if (v7)
  {
    __int16 v8 = v7[50];
    if ((v8 & 0x80) != 0 && *((_DWORD *)v7 + 22) == 71 && ((v8 & 0x20) == 0 || !*((_DWORD *)v7 + 20)))
    {
      if (*((void *)v7 + 2))
      {
        v9 = v7;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
        v7 = v9;
        *a4 = 1;
      }
    }
  }
}

- (GEOPublisher)publisher
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  publisher = self->_publisher;
  if (!publisher)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = -[GEOPDComponent values]((id *)&self->_publisherComponent->super.super.isa);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (v9)
          {
            if (*(void *)(v9 + 464))
            {
              publisherComponent = self->_publisherComponent;
              if (publisherComponent)
              {
                if (publisherComponent->_attribution)
                {
                  v11 = [GEOPublisher alloc];
                  v12 = -[GEOPDComponentValue publisher]((id *)v9);
                  v13 = -[GEOPDComponent attribution]((id *)&self->_publisherComponent->super.super.isa);
                  v14 = -[GEOPublisher initWithPublisher:usingAttribution:](v11, "initWithPublisher:usingAttribution:", v12, v13, (void)v17);
                  uint64_t v15 = self->_publisher;
                  self->_publisher = v14;

                  goto LABEL_15;
                }
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    publisher = self->_publisher;
  }

  return publisher;
}

+ (id)publisherResultsFromResponse:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 mapsResults];

  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__GEOPublisherResult_publisherResultsFromResponse___block_invoke;
  v13[3] = &unk_1E53DAA78;
  id v14 = v5;
  id v8 = v5;
  uint64_t v9 = [v7 predicateWithBlock:v13];
  id v10 = (id)[v6 filteredArrayUsingPredicate:v9];

  v11 = (void *)[v8 copy];

  return v11;
}

uint64_t __51__GEOPublisherResult_publisherResultsFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] == 3
    && [v3 hasPublisher]
    && (id v4 = [GEOPublisherResult alloc],
        [v3 publisher],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [(GEOPublisherResult *)v4 initWithPublisherResult:v5],
        v5,
        v6))
  {
    [*(id *)(a1 + 32) addObject:v6];

    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_publisherComponent, 0);

  objc_storeStrong((id *)&self->_publisherResult, 0);
}

@end