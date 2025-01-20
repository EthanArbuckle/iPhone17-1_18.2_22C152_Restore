@interface _GEOPlaceSearchRequestTicket
- (NSString)searchQuery;
@end

@implementation _GEOPlaceSearchRequestTicket

- (NSString)searchQuery
{
  uint64_t v2 = [(GEOPDPlaceRequest *)self->super._request placeRequestParameters];
  uint64_t v3 = v2;
  if (v2)
  {
    -[GEOPDPlaceRequestParameters _readSearchParameters](v2);
    if (*(void *)(v3 + 376))
    {
      -[GEOPDPlaceRequestParameters searchParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = -[GEOPDSearchParameters searchString](v4);
LABEL_10:
      v6 = (void *)v5;

      goto LABEL_11;
    }
    -[GEOPDPlaceRequestParameters _readPlaceRefinementParameters](v3);
    if (*(void *)(v3 + 296))
    {
      -[GEOPDPlaceRequestParameters placeRefinementParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = -[GEOPDPlaceRefinementParameters placeNameHint](v4);
      goto LABEL_10;
    }
    -[GEOPDPlaceRequestParameters _readVendorSpecificPlaceRefinementParameters](v3);
    if (*(void *)(v3 + 448))
    {
      -[GEOPDPlaceRequestParameters vendorSpecificPlaceRefinementParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = -[GEOPDVendorSpecificPlaceRefinementParameters placeNameHint](v4);
      goto LABEL_10;
    }
    -[GEOPDPlaceRequestParameters _readLocationDirectedSearchParameters](v3);
    if (*(void *)(v3 + 216))
    {
      -[GEOPDPlaceRequestParameters locationDirectedSearchParameters]((id *)v3);
      v4 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = -[GEOPDLocationDirectedSearchParameters searchString](v4);
      goto LABEL_10;
    }
  }
  v6 = 0;
LABEL_11:

  return (NSString *)v6;
}

@end