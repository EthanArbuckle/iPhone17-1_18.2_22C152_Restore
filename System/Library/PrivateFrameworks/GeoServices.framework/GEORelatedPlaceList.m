@interface GEORelatedPlaceList
- (BOOL)hasInitialData;
- (GEOFollowUpRequestMetadata)followUpRequestMetadata;
- (GEORelatedPlaceList)initWithRelatedPlace:(id)a3;
- (GEORelatedPlaceList)initWithTemplatePlace:(id)a3 attributedMap:(id)a4;
- (GEORelatedPlaceList)initWithTemplates:(id)a3 type:(int)a4 hasInitialData:(BOOL)a5 numberOfInlineItem:(unint64_t)a6 followUpRequestMetadata:(id)a7;
- (NSArray)mapIdentifiers;
- (NSArray)placeTemplates;
- (int)type;
- (unint64_t)numberOfInlineItems;
@end

@implementation GEORelatedPlaceList

- (GEORelatedPlaceList)initWithRelatedPlace:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = -[GEOPDRelatedPlace mapsIds](v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [GEOPlaceTemplate alloc];
        v13 = -[GEOPlaceTemplate initWithIdentifier:supportsAreaHighlight:](v12, "initWithIdentifier:supportsAreaHighlight:", v11, 0, (void)v17);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  v15 = -[GEORelatedPlaceList initWithTemplates:type:hasInitialData:numberOfInlineItem:followUpRequestMetadata:](self, "initWithTemplates:type:hasInitialData:numberOfInlineItem:followUpRequestMetadata:", v14, -[GEOPDRelatedPlace type]((uint64_t)v4), 0, [v5 count], 0);

  return v15;
}

- (GEORelatedPlaceList)initWithTemplates:(id)a3 type:(int)a4 hasInitialData:(BOOL)a5 numberOfInlineItem:(unint64_t)a6 followUpRequestMetadata:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)GEORelatedPlaceList;
  v14 = [(GEORelatedPlaceList *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_hasInitialData = a5;
    uint64_t v16 = [v12 copy];
    placeTemplates = v15->_placeTemplates;
    v15->_placeTemplates = (NSArray *)v16;

    v15->_type = a4;
    v15->_numberOfInlineItems = a6;
    objc_storeStrong((id *)&v15->_followUpRequestMetadata, a7);
  }

  return v15;
}

- (NSArray)mapIdentifiers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_placeTemplates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "mapItemIdentifier", (void)v14);

        if (v10)
        {
          uint64_t v11 = [v9 mapItemIdentifier];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (int)type
{
  if ((self->_type - 1) >= 4) {
    return 0;
  }
  else {
    return self->_type;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpRequestMetadata, 0);

  objc_storeStrong((id *)&self->_placeTemplates, 0);
}

- (GEORelatedPlaceList)initWithTemplatePlace:(id)a3 attributedMap:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (id *)a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v27 = v5;
  uint64_t v8 = -[GEOPDTemplatePlace templateDatas](v5);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    LOBYTE(v12) = 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(id **)(*((void *)&v28 + 1) + 8 * i);
        long long v15 = [[GEOPlaceTemplate alloc] initWithPlaceTemplate:v14 attributionMap:v6];
        [v7 addObject:v15];
        if (v12)
        {
          long long v16 = -[GEOPDTemplateData footer](v14);
          BOOL v12 = -[GEOPDDataItem type]((uint64_t)v16) != 6;
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    BOOL v12 = 1;
  }

  uint64_t v17 = [v7 count];
  if (v27)
  {
    if ((_BYTE)v27[7])
    {
      unint64_t v18 = *((unsigned int *)v27 + 13);
      if ([v7 count] >= v18) {
        uint64_t v17 = *((unsigned int *)v27 + 13);
      }
    }
  }
  -[GEOPDTemplatePlace followUpRequestMetadata](v27);
  uint64_t v19 = (GEOFollowUpRequestMetadata *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    long long v20 = [GEOFollowUpRequestMetadata alloc];
    v21 = -[GEOPDTemplatePlace followUpRequestMetadata](v27);
    uint64_t v19 = [(GEOFollowUpRequestMetadata *)v20 initWithGEOPDFollowUpRequestMetadata:v21];
  }
  uint64_t v22 = objc_msgSend(v7, "copy", self);
  v23 = (GEORelatedPlaceList *)[v26 initWithTemplates:v22 type:4 hasInitialData:v12 numberOfInlineItem:v17 followUpRequestMetadata:v19];

  return v23;
}

- (NSArray)placeTemplates
{
  return self->_placeTemplates;
}

- (BOOL)hasInitialData
{
  return self->_hasInitialData;
}

- (unint64_t)numberOfInlineItems
{
  return self->_numberOfInlineItems;
}

- (GEOFollowUpRequestMetadata)followUpRequestMetadata
{
  return self->_followUpRequestMetadata;
}

@end