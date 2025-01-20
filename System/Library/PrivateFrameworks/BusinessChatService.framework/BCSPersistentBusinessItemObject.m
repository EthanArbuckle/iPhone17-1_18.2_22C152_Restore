@interface BCSPersistentBusinessItemObject
- (BCSBusinessItem)businessItem;
- (BCSPersistentBusinessItemObject)initWithBusinessItem:(id)a3 lastRetrievedDate:(id)a4 TTLDate:(id)a5;
- (NSDate)TTLDate;
- (NSDate)lastRetrievedDate;
@end

@implementation BCSPersistentBusinessItemObject

- (BCSPersistentBusinessItemObject)initWithBusinessItem:(id)a3 lastRetrievedDate:(id)a4 TTLDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BCSPersistentBusinessItemObject;
  v12 = [(BCSPersistentBusinessItemObject *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_businessItem, a3);
    objc_storeStrong((id *)&v13->_lastRetrievedDate, a4);
    objc_storeStrong((id *)&v13->_TTLDate, a5);
  }

  return v13;
}

- (BCSBusinessItem)businessItem
{
  return self->_businessItem;
}

- (NSDate)TTLDate
{
  return self->_TTLDate;
}

- (NSDate)lastRetrievedDate
{
  return self->_lastRetrievedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRetrievedDate, 0);
  objc_storeStrong((id *)&self->_TTLDate, 0);

  objc_storeStrong((id *)&self->_businessItem, 0);
}

@end