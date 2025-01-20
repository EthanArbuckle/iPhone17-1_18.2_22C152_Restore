@interface CUIKOROccurrenceStateCachedLocation
- (BOOL)originalHasNewTimeProposed;
- (BOOL)originalOccurrenceLocationIsPrediction;
- (CUIKOROccurrenceStateCachedLocation)initWithGeneratedLocationString:(id)a3 locationImageName:(id)a4 originalOccurrenceLocation:(id)a5 originalOccurrenceLocationWithoutPrediction:(id)a6 originalOccurrenceLocationIsPrediction:(BOOL)a7 originalHasNewTimeProposed:(BOOL)a8 originalConferenceURL:(id)a9;
- (NSAttributedString)generatedLocationString;
- (NSString)locationImageName;
- (NSString)originalOccurrenceLocation;
- (NSString)originalOccurrenceLocationWithoutPrediction;
- (NSURL)originalConferenceURL;
@end

@implementation CUIKOROccurrenceStateCachedLocation

- (NSString)originalOccurrenceLocation
{
  return self->_originalOccurrenceLocation;
}

- (NSString)originalOccurrenceLocationWithoutPrediction
{
  return self->_originalOccurrenceLocationWithoutPrediction;
}

- (BOOL)originalOccurrenceLocationIsPrediction
{
  return self->_originalOccurrenceLocationIsPrediction;
}

- (BOOL)originalHasNewTimeProposed
{
  return self->_originalHasNewTimeProposed;
}

- (NSURL)originalConferenceURL
{
  return self->_originalConferenceURL;
}

- (NSString)locationImageName
{
  return self->_locationImageName;
}

- (NSAttributedString)generatedLocationString
{
  return self->_generatedLocationString;
}

- (CUIKOROccurrenceStateCachedLocation)initWithGeneratedLocationString:(id)a3 locationImageName:(id)a4 originalOccurrenceLocation:(id)a5 originalOccurrenceLocationWithoutPrediction:(id)a6 originalOccurrenceLocationIsPrediction:(BOOL)a7 originalHasNewTimeProposed:(BOOL)a8 originalConferenceURL:(id)a9
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CUIKOROccurrenceStateCachedLocation;
  v18 = [(CUIKOROccurrenceStateCachedLocation *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_generatedLocationString, a3);
    objc_storeStrong((id *)&v19->_locationImageName, a4);
    objc_storeStrong((id *)&v19->_originalOccurrenceLocation, a5);
    objc_storeStrong((id *)&v19->_originalOccurrenceLocationWithoutPrediction, a6);
    v19->_originalOccurrenceLocationIsPrediction = a7;
    v19->_originalHasNewTimeProposed = a8;
    objc_storeStrong((id *)&v19->_originalConferenceURL, a9);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalConferenceURL, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceLocationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceLocation, 0);
  objc_storeStrong((id *)&self->_locationImageName, 0);

  objc_storeStrong((id *)&self->_generatedLocationString, 0);
}

@end