@interface _MKMapItemPlaceItem
+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4;
+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4 isIntermediateMapItem:(BOOL)a5;
+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4 isIntermediateMapItem:(BOOL)a5 preferredName:(id)a6 preferredSecondaryName:(id)a7;
- (BOOL)hasContactOnly;
- (BOOL)isContactPersisted;
- (BOOL)isIntermediateMapItem;
- (BOOL)representsPerson;
- (CNContact)contact;
- (EKCalendarItem)calendarItem;
- (MKMapItem)mapItem;
- (NSString)name;
- (NSString)secondaryName;
- (unint64_t)options;
- (void)setIsSuggestedFavorite:(BOOL)a3;
@end

@implementation _MKMapItemPlaceItem

+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)v8 + 1, a3);
    v9[2] = a4;
  }

  return v9;
}

+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4 isIntermediateMapItem:(BOOL)a5
{
  return (id)[a1 placeItemWithMapItem:a3 options:a4 isIntermediateMapItem:a5 preferredName:0 preferredSecondaryName:0];
}

+ (id)placeItemWithMapItem:(id)a3 options:(unint64_t)a4 isIntermediateMapItem:(BOOL)a5 preferredName:(id)a6 preferredSecondaryName:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v16 = (id *)objc_alloc_init((Class)a1);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(v16 + 1, a3);
    v17[2] = (id)a4;
    *((unsigned char *)v17 + 24) = a5;
    objc_storeStrong(v17 + 4, a6);
    id v18 = (id)[v15 length];
    if (v18) {
      id v18 = v15;
    }
    id v19 = v17[5];
    v17[5] = v18;
  }

  return v17;
}

- (NSString)name
{
  if ([(NSString *)self->_preferredName length])
  {
    v3 = self->_preferredName;
  }
  else
  {
    v3 = [(MKMapItem *)self->_mapItem name];
  }

  return v3;
}

- (NSString)secondaryName
{
  return self->_preferredSecondaryName;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (EKCalendarItem)calendarItem
{
  return 0;
}

- (CNContact)contact
{
  return 0;
}

- (BOOL)isContactPersisted
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setIsSuggestedFavorite:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_options = self->_options & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)isIntermediateMapItem
{
  return self->_isIntermediateMapItem;
}

- (BOOL)hasContactOnly
{
  return 0;
}

- (BOOL)representsPerson
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSecondaryName, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end