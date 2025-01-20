@interface GEOMapItemParentVenue
- (GEOMapItemParentVenue)init;
- (GEOMapItemParentVenue)initWithBusinessID:(unint64_t)a3 featureType:(int)a4;
- (GEOMapItemParentVenue)initWithLocatedInsideInfo:(id)a3;
- (int)featureType;
- (unint64_t)businessID;
@end

@implementation GEOMapItemParentVenue

- (GEOMapItemParentVenue)init
{
  result = (GEOMapItemParentVenue *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMapItemParentVenue)initWithBusinessID:(unint64_t)a3 featureType:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMapItemParentVenue;
  result = [(GEOMapItemParentVenue *)&v7 init];
  if (result)
  {
    result->_businessID = a3;
    result->_featureType = a4;
  }
  return result;
}

- (GEOMapItemParentVenue)initWithLocatedInsideInfo:(id)a3
{
  v4 = (unsigned int *)a3;
  v5 = v4;
  if (!v4 || (~*((unsigned __int8 *)v4 + 28) & 3) != 0)
  {
    v6 = 0;
  }
  else
  {
    self = [(GEOMapItemParentVenue *)self initWithBusinessID:*((void *)v4 + 2) featureType:v4[6]];
    v6 = self;
  }

  return v6;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (int)featureType
{
  return self->_featureType;
}

@end