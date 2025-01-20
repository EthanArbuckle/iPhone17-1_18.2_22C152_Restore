@interface GEOGuideLocationSuggestionResults
- (GEOGuideLocationSuggestionResults)initWithGuideLocationSuggestionResult:(id)a3 mapsResults:(id)a4;
- (NSArray)guideLocations;
@end

@implementation GEOGuideLocationSuggestionResults

- (GEOGuideLocationSuggestionResults)initWithGuideLocationSuggestionResult:(id)a3 mapsResults:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v8 = -[GEOPDGuidesLocationsSuggestionResult entrys](v6);
  v9 = (GEOGuideLocationSuggestionResults *)[v8 count];

  if (v9)
  {
    v10 = -[GEOPDGuidesLocationsSuggestionResult entrys](v6);
    v11 = +[GEOGuideLocation guideLocationsForEntries:v10 mapsResults:v7];

    if ([v11 count])
    {
      v16.receiver = self;
      v16.super_class = (Class)GEOGuideLocationSuggestionResults;
      v12 = [(GEOGuideLocationSuggestionResults *)&v16 init];
      v13 = v12;
      if (v12) {
        objc_storeStrong((id *)&v12->_guideLocations, v11);
      }
      self = v13;
      v9 = self;
    }
    else
    {
      v14 = GEOGetCuratedCollectionsLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Guide Location suggestion is not valid.", buf, 2u);
      }

      v9 = 0;
    }
  }
  return v9;
}

- (NSArray)guideLocations
{
  return self->_guideLocations;
}

- (void).cxx_destruct
{
}

@end