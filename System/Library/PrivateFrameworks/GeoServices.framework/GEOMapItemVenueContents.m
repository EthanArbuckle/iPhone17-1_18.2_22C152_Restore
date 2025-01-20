@interface GEOMapItemVenueContents
- (GEOMapItemVenueContents)init;
- (GEOMapItemVenueContents)initWithItemList:(id)a3;
- (GEOMapItemVenueContents)initWithTitle:(id)a3 items:(id)a4;
- (NSArray)items;
- (NSString)title;
@end

@implementation GEOMapItemVenueContents

- (GEOMapItemVenueContents)init
{
  result = (GEOMapItemVenueContents *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapItemVenueContents)initWithTitle:(id)a3 items:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapItemVenueContents;
  v9 = [(GEOMapItemVenueContents *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    uint64_t v11 = [v8 copy];
    items = v10->_items;
    v10->_items = (NSArray *)v11;
  }
  return v10;
}

- (GEOMapItemVenueContents)initWithItemList:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)v4;
  if (v4 && (-[GEOPDVenueItemList _readTitle]((uint64_t)v4), *(void *)(v5 + 32)))
  {
    v6 = -[GEOPDVenueItemList title]((id *)v5);
    if (![v6 length])
    {
      id v7 = 0;
      goto LABEL_8;
    }
    -[GEOPDVenueItemList _readItems](v5);
    id v7 = (GEOMapItemVenueContents *)[*(id *)(v5 + 24) count];

    if (v7)
    {
      v6 = -[GEOPDVenueItemList title]((id *)v5);
      id v8 = -[GEOPDVenueItemList items]((id *)v5);
      v9 = (void *)[v8 copy];
      self = [(GEOMapItemVenueContents *)self initWithTitle:v6 items:v9];

      id v7 = self;
LABEL_8:
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end