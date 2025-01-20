@interface MKCuratedCollectionsTestManager
- (BOOL)collectionIsSaved:(id)a3;
- (BOOL)collectionIsSavedWithIdentifier:(id)a3;
- (id)placeWithCollectionUsingJSONAtPath:(id)a3;
@end

@implementation MKCuratedCollectionsTestManager

- (id)placeWithCollectionUsingJSONAtPath:(id)a3
{
  id v12 = 0;
  v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3 options:0 error:&v12];
  id v4 = v12;
  id v11 = v4;
  v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v11];
  id v6 = v11;

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F647E8]) initWithJSON:v5];
  v8 = [v7 legacyPlaceResults];
  v9 = [v8 firstObject];

  return v9;
}

- (BOOL)collectionIsSaved:(id)a3
{
  return 1;
}

- (BOOL)collectionIsSavedWithIdentifier:(id)a3
{
  return 1;
}

@end