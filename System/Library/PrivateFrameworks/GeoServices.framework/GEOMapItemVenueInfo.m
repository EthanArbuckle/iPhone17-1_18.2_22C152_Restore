@interface GEOMapItemVenueInfo
- (GEOMapItemParentVenue)parent;
- (GEOMapItemVenueContents)contents;
- (GEOMapItemVenueInfo)init;
- (GEOMapItemVenueInfo)initWithIdentifier:(id)a3 featureType:(int)a4 filters:(id)a5 parent:(id)a6 contents:(id)a7;
- (GEOMapItemVenueInfo)initWithVenueInfo:(id)a3;
- (GEOVenueIdentifier)venueIdentifier;
- (NSArray)filters;
- (id)_filtersFromVenueInfo:(id)a3;
- (int)venueFeatureType;
@end

@implementation GEOMapItemVenueInfo

- (GEOMapItemVenueInfo)init
{
  result = (GEOMapItemVenueInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapItemVenueInfo)initWithIdentifier:(id)a3 featureType:(int)a4 filters:(id)a5 parent:(id)a6 contents:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)GEOMapItemVenueInfo;
  v17 = [(GEOMapItemVenueInfo *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_venueIdentifier, a3);
    v18->_venueFeatureType = a4;
    uint64_t v19 = [v14 copy];
    filters = v18->_filters;
    v18->_filters = (NSArray *)v19;

    objc_storeStrong((id *)&v18->_parent, a6);
    objc_storeStrong((id *)&v18->_contents, a7);
  }

  return v18;
}

- (GEOMapItemVenueInfo)initWithVenueInfo:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (v4
    && (*((unsigned char *)v4 + 76) & 1) != 0
    && (-[GEOPDVenueInfo _readVenueFeatureIds]((uint64_t)v4), [v5[6] count]))
  {
    v6 = [GEOMapItemVenueContents alloc];
    v7 = -[GEOPDVenueInfo itemList](v5);
    v8 = [(GEOMapItemVenueContents *)v6 initWithItemList:v7];

    v9 = [GEOMapItemParentVenue alloc];
    v10 = -[GEOPDVenueInfo locatedInside](v5);
    v11 = [(GEOMapItemParentVenue *)v9 initWithLocatedInsideInfo:v10];

    v12 = [GEOVenueIdentifier alloc];
    id v13 = -[GEOPDVenueInfo venueFeatureIds](v5);
    id v14 = [(GEOVenueIdentifier *)v12 initWithVenueIdentifiers:v13];
    uint64_t v15 = -[GEOPDVenueInfo featureType]((uint64_t)v5);
    id v16 = [(GEOMapItemVenueInfo *)self _filtersFromVenueInfo:v5];
    self = [(GEOMapItemVenueInfo *)self initWithIdentifier:v14 featureType:v15 filters:v16 parent:v11 contents:v8];

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_filtersFromVenueInfo:(id)a3
{
  v3 = -[GEOPDVenueInfo filterElements]((id *)a3);
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__GEOMapItemVenueInfo__filtersFromVenueInfo___block_invoke;
  v7[3] = &unk_1E53F5FB8;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __45__GEOMapItemVenueInfo__filtersFromVenueInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[GEOVenueFilterItem alloc] initWithFilterElementInfo:v3];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

- (NSArray)filters
{
  return self->_filters;
}

- (GEOMapItemVenueContents)contents
{
  return self->_contents;
}

- (GEOMapItemParentVenue)parent
{
  return self->_parent;
}

- (int)venueFeatureType
{
  return self->_venueFeatureType;
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_filters, 0);

  objc_storeStrong((id *)&self->_venueIdentifier, 0);
}

@end