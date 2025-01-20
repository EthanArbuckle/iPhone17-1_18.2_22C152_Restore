@interface GEOServiceRequestDefaultConfig
- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4;
- (BOOL)supportsOffline;
- (id)additionalHTTPHeaders;
- (id)additionalURLQueryItems;
- (id)debugRequestName;
- (id)serviceTypeNumber;
- (unint64_t)urlType;
@end

@implementation GEOServiceRequestDefaultConfig

- (id)debugRequestName
{
  uint64_t v2 = [(GEOServiceRequestDefaultConfig *)self urlType];

  return GEOURLLogFacility(v2);
}

- (id)additionalURLQueryItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)additionalHTTPHeaders
{
  return 0;
}

- (unint64_t)urlType
{
  return 66;
}

- (id)serviceTypeNumber
{
  return 0;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKindForRequest:(id)a3 traits:(id)a4
{
  return ($C4D369C9F02205611300857CFD58F739)0;
}

- (BOOL)supportsOffline
{
  return 0;
}

@end