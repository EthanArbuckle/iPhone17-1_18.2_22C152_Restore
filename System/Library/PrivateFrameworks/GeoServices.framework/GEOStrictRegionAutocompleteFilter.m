@interface GEOStrictRegionAutocompleteFilter
- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4;
@end

@implementation GEOStrictRegionAutocompleteFilter

- (BOOL)applyToAutocompleteParameters:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (([v4 hasAutocompleteFilter] & 1) == 0)
  {
    v5 = objc_alloc_init(GEOPDAutocompleteFilter);
    [v4 setAutocompleteFilter:v5];
  }
  v6 = [v4 autocompleteFilter];
  [v6 setIsStrictMapRegion:1];

  return 1;
}

@end