@interface _GEOEncyclopedicInfo
- (BOOL)hasPairOfFactoids;
- (BOOL)hasStandAloneFactoids;
- (BOOL)hasTextBlock;
- (GEOMapItemAttribution)encyclopedicAttribution;
- (NSArray)factoids;
- (NSArray)placeSummaryFactoids;
- (NSString)textBlockText;
- (NSString)textBlockTitle;
- (_GEOEncyclopedicInfo)initWithPlaceData:(id)a3 attributionMap:(id)a4;
- (id)factoidAtIndex:(int)a3;
- (id)firstFactoidForSemantic:(int)a3;
@end

@implementation _GEOEncyclopedicInfo

- (_GEOEncyclopedicInfo)initWithPlaceData:(id)a3 attributionMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOEncyclopedicInfo;
  v9 = [(_GEOEncyclopedicInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeData, a3);
    objc_storeStrong((id *)&v10->_attributionMap, a4);
  }

  return v10;
}

- (BOOL)hasTextBlock
{
  v2 = [(_GEOEncyclopedicInfo *)self textBlockText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (NSString)textBlockTitle
{
  v2 = +[GEOPDTextBlock textBlockForPlaceData:self->_placeData];
  BOOL v3 = -[GEOPDTextBlock title](v2);

  return (NSString *)v3;
}

- (NSString)textBlockText
{
  v2 = +[GEOPDTextBlock textBlockForPlaceData:self->_placeData];
  BOOL v3 = -[GEOPDTextBlock text](v2);

  return (NSString *)v3;
}

- (BOOL)hasPairOfFactoids
{
  return +[GEOPDFactoid factoidPairAvailableForPlaceData:self->_placeData];
}

- (NSArray)factoids
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[GEOPDFactoid factoidsForPlaceData:self->_placeData];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [[GEOFactoid alloc] initWithFactoid:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  if ([v3 count]) {
    v10 = (void *)[v3 copy];
  }
  else {
    v10 = 0;
  }

  return (NSArray *)v10;
}

- (NSArray)placeSummaryFactoids
{
  v2 = [(_GEOEncyclopedicInfo *)self factoids];
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_47];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  if ([v4 count]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

- (GEOMapItemAttribution)encyclopedicAttribution
{
  BOOL v3 = +[GEOPDAttribution attributionForPlaceDataEncyclopedia:self->_placeData];
  v4 = v3;
  if (v3)
  {
    attributionMap = self->_attributionMap;
    uint64_t v6 = -[GEOPDAttribution vendorId](v3);
    uint64_t v7 = [(NSMapTable *)attributionMap objectForKey:v6];

    if (v7)
    {
      id v8 = [GEOMapItemEncyclopedicAttribution alloc];
      v9 = -[GEOPDAttribution attributionUrls](v4);
      v10 = -[GEOPDAttribution externalItemId](v4);
      v11 = [(GEOMapItemEncyclopedicAttribution *)v8 initWithSearchAttributionInfo:v7 attributionURLs:v9 poiID:v10];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return (GEOMapItemAttribution *)v11;
}

- (BOOL)hasStandAloneFactoids
{
  return 0;
}

- (id)factoidAtIndex:(int)a3
{
  if (a3 < 0
    || ([(_GEOEncyclopedicInfo *)self factoids],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v6 <= a3))
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v7 = [(_GEOEncyclopedicInfo *)self factoids];
    id v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)firstFactoidForSemantic:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(_GEOEncyclopedicInfo *)self factoids];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 semantic] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionMap, 0);

  objc_storeStrong((id *)&self->_placeData, 0);
}

@end