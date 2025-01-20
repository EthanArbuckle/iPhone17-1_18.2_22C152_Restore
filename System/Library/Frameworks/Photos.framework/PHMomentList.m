@interface PHMomentList
+ (BOOL)managedObjectSupportsTrashedState;
+ (id)entityKeyMap;
+ (id)fetchType;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
- (BOOL)collectionHasFixedOrder;
- (BOOL)hasLocalizedTitle;
- (BOOL)hasLocationInfo;
- (Class)changeRequestClass;
- (PHMomentList)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (id)description;
- (id)localizedLocationNames;
- (id)localizedTitle;
- (int64_t)collectionListType;
@end

@implementation PHMomentList

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)PHMomentList;
  v3 = [(PHCollectionList *)&v16 description];
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int64_t collectionListSubtype = self->super._collectionListSubtype;
  if (collectionListSubtype == 2)
  {
    v9 = [(PHCollectionList *)self startDate];
    v10 = [v4 components:4 fromDate:v9];
    uint64_t v11 = [v10 year];

    v12 = [(PHCollectionList *)self endDate];
    v13 = [v4 components:4 fromDate:v12];
    uint64_t v14 = [v13 year];

    uint64_t v8 = objc_msgSend(v3, "stringByAppendingFormat:", @" [%ld - %ld]", v11, v14);
  }
  else
  {
    if (collectionListSubtype != 1) {
      goto LABEL_6;
    }
    uint64_t v6 = [(PHCollectionList *)self startDate];
    v7 = [(PHCollectionList *)self endDate];
    uint64_t v8 = [v3 stringByAppendingFormat:@" [%@ - %@]", v6, v7];

    v3 = (void *)v6;
  }

  v3 = (void *)v8;
LABEL_6:

  return v3;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (BOOL)hasLocationInfo
{
  return 0;
}

- (BOOL)hasLocalizedTitle
{
  if ([(NSString *)self->super._localizedTitle length]) {
    return 1;
  }

  return [(PHMomentList *)self hasLocationInfo];
}

- (id)localizedLocationNames
{
  return self->super._localizedLocationNames;
}

- (id)localizedTitle
{
  return self->super._localizedTitle;
}

- (int64_t)collectionListType
{
  return self->super._collectionListType;
}

- (PHMomentList)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PHMomentList;
  v10 = [(PHCollectionList *)&v20 initWithFetchDictionary:v9 propertyHint:a4 photoLibrary:a5];
  if (v10)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"startDate"];
    startDate = v10->super._startDate;
    v10->super._startDate = (NSDate *)v11;

    uint64_t v13 = [v9 objectForKeyedSubscript:@"endDate"];
    endDate = v10->super._endDate;
    v10->super._endDate = (NSDate *)v13;

    v10->super._collectionListType = 1;
    v15 = [v9 objectForKeyedSubscript:@"kind"];
    __int16 v16 = [v15 integerValue];

    if (v16 == 2)
    {
      uint64_t v17 = 2;
    }
    else
    {
      if (v16 != 1)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:v10 file:@"PHMomentList.m" lineNumber:94 description:@"invalid kind"];

        goto LABEL_8;
      }
      uint64_t v17 = 1;
    }
    v10->super._int64_t collectionListSubtype = v17;
  }
LABEL_8:

  return v10;
}

- (Class)changeRequestClass
{
  return 0;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PHMomentList_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_1934 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_1934, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_1935 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __52__PHMomentList_transformValueExpression_forKeyPath___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"startDate";
  v4[1] = @"endDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_1935;
  transformValueExpression_forKeyPath___passThroughSet_1935 = v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  uint64_t v2 = (void *)entityKeyMap_pl_once_object_15_1939;

  return v2;
}

void __28__PHMomentList_entityKeyMap__block_invoke()
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v0 = [PHEntityKeyMap alloc];
  uint64_t v11 = @"uuid";
  v12[0] = @"uuid";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[0] = v1;
  v12[1] = @"startDate";
  v10 = @"startDate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v13[1] = v2;
  v12[2] = @"endDate";
  id v9 = @"endDate";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v13[2] = v3;
  v12[3] = @"title";
  id v8 = @"localizedTitle";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v13[3] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  uint64_t v6 = [(PHEntityKeyMap *)v0 initWithPropertyKeysByEntityKey:v5];
  id v7 = (void *)entityKeyMap_pl_once_object_15_1939;
  entityKeyMap_pl_once_object_15_1939 = v6;
}

+ (id)identifierCode
{
  return @"030";
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHMomentList";
  return @"PHMomentList";
}

+ (id)managedEntityName
{
  return @"PhotosHighlight";
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F8AAB8], "defaultPropertiesToFetchForMomentList", a3);
}

@end