@interface GEOVenueFloorInfo
+ (BOOL)isIntegerValidOrdinal:(int64_t)a3;
+ (id)floorInfosFromLevels:(id)a3;
- (GEOVenueFloorInfo)init;
- (GEOVenueFloorInfo)initWithLevel:(id)a3;
- (GEOVenueFloorInfo)initWithOrdinal:(signed __int16)a3 levelID:(unint64_t)a4;
- (signed)ordinal;
- (unint64_t)levelID;
@end

@implementation GEOVenueFloorInfo

- (GEOVenueFloorInfo)init
{
  result = (GEOVenueFloorInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOVenueFloorInfo)initWithOrdinal:(signed __int16)a3 levelID:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVenueFloorInfo;
  result = [(GEOVenueFloorInfo *)&v7 init];
  if (result)
  {
    result->_ordinal = a3;
    result->_levelID = a4;
  }
  return result;
}

- (GEOVenueFloorInfo)initWithLevel:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (v4
    && (~v4[36] & 3) == 0
    && +[GEOVenueFloorInfo isIntegerValidOrdinal:*((int *)v4 + 8)])
  {
    self = [(GEOVenueFloorInfo *)self initWithOrdinal:*((__int16 *)v5 + 16) levelID:*((void *)v5 + 3)];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)floorInfosFromLevels:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__GEOVenueFloorInfo_floorInfosFromLevels___block_invoke;
  v9[3] = &unk_1E53EB050;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  objc_super v7 = (void *)[v6 copy];

  return v7;
}

void __42__GEOVenueFloorInfo_floorInfosFromLevels___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[GEOVenueFloorInfo alloc] initWithLevel:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

+ (BOOL)isIntegerValidOrdinal:(int64_t)a3
{
  return a3 == (__int16)a3;
}

- (signed)ordinal
{
  return self->_ordinal;
}

- (unint64_t)levelID
{
  return self->_levelID;
}

@end