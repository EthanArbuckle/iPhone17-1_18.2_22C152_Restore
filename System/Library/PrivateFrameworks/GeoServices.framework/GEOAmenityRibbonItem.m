@interface GEOAmenityRibbonItem
- (GEOAmenityRibbonItem)initWithRibbonItem:(id)a3;
- (NSArray)indexesWithinAmenityComponent;
@end

@implementation GEOAmenityRibbonItem

- (GEOAmenityRibbonItem)initWithRibbonItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAmenityRibbonItem;
  v6 = [(GEOAmenityRibbonItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_amenityItem, a3);
  }

  return v7;
}

- (NSArray)indexesWithinAmenityComponent
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; ; ++i)
  {
    amenityItem = self->_amenityItem;
    unint64_t v6 = amenityItem ? amenityItem->_amenityItemIndexs.count : 0;
    if (i >= v6) {
      break;
    }
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOPDAmenityRibbonItem amenityItemIndexAtIndex:]((uint64_t)amenityItem, i));
    [v3 addObject:v7];
  }
  v8 = GEOGetPlaceCardLayoutLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_INFO, "Amenity ribbon item has the following component indices: %@", (uint8_t *)&v11, 0xCu);
  }

  objc_super v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

- (void).cxx_destruct
{
}

@end