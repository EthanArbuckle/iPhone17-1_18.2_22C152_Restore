@interface PHAssetKeywordProperties
+ (BOOL)createsPropertySetObjectWithCustomImplementation;
+ (BOOL)isToMany;
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertySetName;
- (NSSet)keywordTitles;
- (PHAssetKeywordProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5;
@end

@implementation PHAssetKeywordProperties

- (void).cxx_destruct
{
}

- (NSSet)keywordTitles
{
  return self->_keywordTitles;
}

- (PHAssetKeywordProperties)initWithFetchDictionary:(id)a3 asset:(id)a4 prefetched:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHAssetKeywordProperties;
  v9 = [(PHAssetKeywordProperties *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->super._asset, v8);
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [v7 objectForKeyedSubscript:@"keywordTitles"];
    uint64_t v13 = [v11 setWithArray:v12];
    keywordTitles = v10->_keywordTitles;
    v10->_keywordTitles = (NSSet *)v13;
  }
  return v10;
}

+ (id)propertiesToFetch
{
  return 0;
}

+ (BOOL)createsPropertySetObjectWithCustomImplementation
{
  return 1;
}

+ (BOOL)isToMany
{
  return 1;
}

+ (id)keyPathToPrimaryObject
{
  return 0;
}

+ (id)keyPathFromPrimaryObject
{
  return 0;
}

+ (id)entityName
{
  return @"Keyword";
}

+ (id)propertySetName
{
  return @"PHAssetPropertySetKeywords";
}

@end