@interface GEOPlaceRibbonItem
- (BOOL)isValid;
- (GEOAmenityRibbonItem)amenityItem;
- (GEOFactoidRibbonItem)factoidItem;
- (GEOPlaceRibbonItem)initWithFactoidRibbonItem:(id)a3;
- (GEOPlaceRibbonItem)initWithType:(int)a3;
- (id)initAmenityWithAmenityItem:(id)a3;
- (int)type;
@end

@implementation GEOPlaceRibbonItem

- (id)initAmenityWithAmenityItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceRibbonItem;
  v5 = [(GEOPlaceRibbonItem *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 3;
    v7 = [[GEOAmenityRibbonItem alloc] initWithRibbonItem:v4];
    amenityItem = v6->_amenityItem;
    v6->_amenityItem = v7;
  }
  return v6;
}

- (GEOPlaceRibbonItem)initWithFactoidRibbonItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceRibbonItem;
  v5 = [(GEOPlaceRibbonItem *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 6;
    v7 = [[GEOFactoidRibbonItem alloc] initWithFactoidRibbonItem:v4];
    factoidItem = v6->_factoidItem;
    v6->_factoidItem = v7;
  }
  return v6;
}

- (GEOPlaceRibbonItem)initWithType:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceRibbonItem;
  result = [(GEOPlaceRibbonItem *)&v6 init];
  if (result)
  {
    if ((a3 - 1) >= 9) {
      int v5 = 0;
    }
    else {
      int v5 = a3;
    }
    result->_type = v5;
  }
  return result;
}

- (BOOL)isValid
{
  BOOL v2 = 0;
  unsigned int type = self->_type;
  if (type <= 9)
  {
    if (((1 << type) & 0x3B6) != 0)
    {
      return 1;
    }
    else if (type == 3)
    {
      int v5 = [(GEOAmenityRibbonItem *)self->_amenityItem indexesWithinAmenityComponent];
      BOOL v2 = [v5 count] != 0;
    }
    else if (type == 6)
    {
      return self->_factoidItem != 0;
    }
  }
  return v2;
}

- (GEOAmenityRibbonItem)amenityItem
{
  return self->_amenityItem;
}

- (GEOFactoidRibbonItem)factoidItem
{
  return self->_factoidItem;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factoidItem, 0);

  objc_storeStrong((id *)&self->_amenityItem, 0);
}

@end