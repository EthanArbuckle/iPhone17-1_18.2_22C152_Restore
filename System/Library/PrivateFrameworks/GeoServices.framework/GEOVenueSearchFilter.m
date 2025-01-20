@interface GEOVenueSearchFilter
- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4;
- (GEOVenueIdentifier)identifier;
- (GEOVenueSearchFilter)init;
- (GEOVenueSearchFilter)initWithIdentifier:(id)a3;
@end

@implementation GEOVenueSearchFilter

- (GEOVenueSearchFilter)init
{
  result = (GEOVenueSearchFilter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOVenueSearchFilter)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOVenueSearchFilter;
  v6 = [(GEOVenueSearchFilter *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = (uint64_t)v5;
  if (!v5 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v5), !*(void *)(v6 + 240)))
  {
    v7 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v6, v7);
  }
  v8 = objc_alloc_init(GEOPDSSearchVenueFilter);
  v9 = [(GEOVenueIdentifier *)self->_identifier placeDataVenueIdentifier];
  -[GEOPDSSearchVenueFilter setVenueFilter:]((uint64_t)v8, v9);

  if (v8)
  {
    *(unsigned char *)&v8->_flags |= 1u;
    v8->_venueSearchType = 1;
  }
  objc_super v10 = -[GEOPDSearchParameters searchFilter]((id *)v6);
  -[GEOPDSSearchFilter setVenueFilter:]((uint64_t)v10, v8);

  return 1;
}

- (GEOVenueIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end