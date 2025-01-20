@interface GEOResultRefinementSortElement
- (GEOPDResultRefinementMetadata)metadata;
- (GEOResultRefinementSortElement)initWithDisplayName:(id)a3 metadata:(id)a4;
- (GEOResultRefinementSortElement)initWithResultRefinementSortElement:(id)a3;
- (NSString)displayName;
- (id)convertToGEOPDResultRefinementSortElement;
- (void)setDisplayName:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation GEOResultRefinementSortElement

- (GEOResultRefinementSortElement)initWithDisplayName:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOResultRefinementSortElement;
    v8 = [(GEOResultRefinementSortElement *)&v13 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      displayName = v8->_displayName;
      v8->_displayName = (NSString *)v9;

      objc_storeStrong((id *)&v8->_metadata, a4);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (GEOResultRefinementSortElement)initWithResultRefinementSortElement:(id)a3
{
  v4 = (id *)a3;
  v5 = -[GEOPDResultRefinementSortElement displayName](v4);
  id v6 = -[GEOPDResultRefinementSortElement metadata](v4);

  id v7 = [(GEOResultRefinementSortElement *)self initWithDisplayName:v5 metadata:v6];
  return v7;
}

- (id)convertToGEOPDResultRefinementSortElement
{
  v3 = objc_alloc_init(GEOPDResultRefinementSortElement);
  v4 = [(GEOResultRefinementSortElement *)self displayName];
  -[GEOPDResultRefinementSortElement setDisplayName:]((uint64_t)v3, v4);

  v5 = [(GEOResultRefinementSortElement *)self metadata];
  -[GEOPDResultRefinementSortElement setMetadata:]((uint64_t)v3, v5);

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (GEOPDResultRefinementMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end