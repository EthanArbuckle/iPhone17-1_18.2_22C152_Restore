@interface GEOPublisherViewResult
- (GEOPublisherViewResult)initWithPublisherViewResult:(id)a3;
- (GEOPublisherViewResult)initWithPublisherViewResult:(id)a3 withPlaces:(id)a4;
- (NSArray)collectionIdentifiers;
- (NSArray)resultFilters;
@end

@implementation GEOPublisherViewResult

- (GEOPublisherViewResult)initWithPublisherViewResult:(id)a3 withPlaces:(id)a4
{
  v7 = (id *)a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOPublisherViewResult;
  v9 = [(GEOPublisherViewResult *)&v15 init];
  if (!v9) {
    goto LABEL_5;
  }
  v10 = -[GEOPDPublisherViewResult collectionIds](v7);
  if (![v10 count])
  {

    goto LABEL_7;
  }
  v11 = -[GEOPDPublisherViewResult resultFilters](v7);
  uint64_t v12 = [v11 count];

  if (!v12)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v9->_publisherViewResult, a3);
  objc_storeStrong((id *)&v9->_places, a4);
LABEL_5:
  v13 = v9;
LABEL_8:

  return v13;
}

- (GEOPublisherViewResult)initWithPublisherViewResult:(id)a3
{
  v5 = (id *)a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOPublisherViewResult;
  v6 = [(GEOPublisherViewResult *)&v11 init];
  if (v6)
  {
    v7 = -[GEOPDPublisherViewResult collectionIds](v5);
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_publisherViewResult, a3);
  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (NSArray)collectionIdentifiers
{
  v2 = -[GEOPDPublisherViewResult collectionIds]((id *)&self->_publisherViewResult->super.super.isa);
  v3 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v2];

  return (NSArray *)v3;
}

- (NSArray)resultFilters
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = -[GEOPDPublisherViewResult resultFilters]((id *)&self->_publisherViewResult->super.super.isa);
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = -[GEOPDPublisherViewResult resultFilters]((id *)&self->_publisherViewResult->super.super.isa);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [GEOPublisherViewResultFilter alloc];
        v13 = -[GEOPublisherViewResultFilter initWithPublisherViewResultFilter:withPlaces:](v12, "initWithPublisherViewResultFilter:withPlaces:", v11, self->_places, (void)v16);
        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];

  return (NSArray *)v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);

  objc_storeStrong((id *)&self->_publisherViewResult, 0);
}

@end