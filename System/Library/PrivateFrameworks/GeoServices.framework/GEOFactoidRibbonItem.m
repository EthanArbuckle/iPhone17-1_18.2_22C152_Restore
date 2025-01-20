@interface GEOFactoidRibbonItem
- (GEOFactoidRibbonItem)initWithFactoidRibbonItem:(id)a3;
- (int)indexWithinFactoidComponent;
@end

@implementation GEOFactoidRibbonItem

- (GEOFactoidRibbonItem)initWithFactoidRibbonItem:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5 && (*((unsigned char *)v5 + 20) & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)GEOFactoidRibbonItem;
    v8 = [(GEOFactoidRibbonItem *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_factoidItem, a3);
    }
    self = v9;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)indexWithinFactoidComponent
{
  factoidItem = self->_factoidItem;
  if (factoidItem) {
    return factoidItem->_factoidItemIndex;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end