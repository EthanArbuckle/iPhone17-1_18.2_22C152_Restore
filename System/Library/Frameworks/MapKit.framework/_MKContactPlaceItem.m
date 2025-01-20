@interface _MKContactPlaceItem
+ (id)placeItemWithMapItem:(id)a3 contact:(id)a4 options:(unint64_t)a5;
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
@end

@implementation _MKContactPlaceItem

+ (id)placeItemWithMapItem:(id)a3 contact:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (id *)objc_alloc_init((Class)a1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 1, a3);
    objc_storeStrong(v12 + 2, a4);
    v12[3] = (id)a5;
  }

  return v12;
}

- (NSString)name
{
  contact = self->_contact;
  if (contact)
  {
    v4 = [(CNContact *)contact nickname];
    if ([v4 length])
    {
      id v5 = v4;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1B910] stringFromContact:self->_contact style:0];
    }
    v6 = v5;
    if ([v5 length])
    {

      goto LABEL_9;
    }
  }
  v6 = [(MKMapItem *)self->_mapItem name];
LABEL_9:

  return (NSString *)v6;
}

- (NSString)secondaryName
{
  return 0;
}

- (BOOL)representsPerson
{
  return ([(_MKContactPlaceItem *)self options] >> 5) & 1;
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
  return self->_contact;
}

- (BOOL)isContactPersisted
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)isIntermediateMapItem
{
  return 0;
}

- (BOOL)hasContactOnly
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end