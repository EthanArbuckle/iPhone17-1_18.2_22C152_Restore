@interface GEOGuidesTestHelper
- (id)validCitySelectorResult:(id)a3;
- (id)validGuidesHomeResult:(id)a3;
@end

@implementation GEOGuidesTestHelper

- (id)validGuidesHomeResult:(id)a3
{
  id v3 = a3;
  v4 = [[GEOPDPlaceResponse alloc] initWithJSON:v3];

  v5 = [GEOGuidesHomeResult alloc];
  v6 = [(GEOPDPlaceResponse *)v4 globalResult];
  v7 = -[GEOPDPlaceGlobalResult guidesHomeResult](v6);
  v8 = [(GEOPDPlaceResponse *)v4 mapsResults];
  v9 = [(GEOGuidesHomeResult *)v5 initWithGuidesHomeFixedSection:v7 mapsResults:v8];

  return v9;
}

- (id)validCitySelectorResult:(id)a3
{
  id v3 = a3;
  v4 = [[GEOPDPlaceResponse alloc] initWithJSON:v3];

  v5 = [GEOAllGuidesLocationsViewResult alloc];
  v6 = [(GEOPDPlaceResponse *)v4 globalResult];
  v7 = -[GEOPDPlaceGlobalResult allGuidesLocationsViewresult](v6);
  v8 = [(GEOPDPlaceResponse *)v4 mapsResults];
  v9 = [(GEOAllGuidesLocationsViewResult *)v5 initWithAllGuidesLocationsViewResult:v7 mapsResults:v8];

  return v9;
}

@end