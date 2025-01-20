@interface SAStructuredDictationPlaceResult
- (id)ad_transcriptionResultWithAddressBookManager:(id)a3;
@end

@implementation SAStructuredDictationPlaceResult

- (id)ad_transcriptionResultWithAddressBookManager:(id)a3
{
  v3 = self;
  id v4 = objc_alloc_init((Class)STSiriLocation);
  v5 = [(SAStructuredDictationPlaceResult *)v3 resultData];
  [v4 setGeoResult:v5];

  v6 = [(SAStructuredDictationPlaceResult *)v3 placeResultType];
  unsigned __int8 v7 = [v6 isEqualToString:SAStructuredDictationPlaceResultPlaceResultTypeFORWARD_GEOCODEValue];

  if (v7)
  {
    uint64_t v8 = 1;
  }
  else
  {
    v9 = [(SAStructuredDictationPlaceResult *)v3 placeResultType];
    unsigned int v10 = [v9 isEqualToString:SAStructuredDictationPlaceResultPlaceResultTypePLACE_SEARCHValue];

    if (!v10) {
      goto LABEL_6;
    }
    uint64_t v8 = 2;
  }
  [v4 setResultType:v8];
LABEL_6:

  return v4;
}

@end