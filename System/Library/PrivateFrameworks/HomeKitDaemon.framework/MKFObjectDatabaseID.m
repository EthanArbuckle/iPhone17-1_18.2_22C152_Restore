@interface MKFObjectDatabaseID
- (BOOL)isEqual:(id)a3;
- (MKFObjectDatabaseID)initWithMKFObject:(id)a3;
- (NSManagedObjectID)objectID;
- (id)description;
@end

@implementation MKFObjectDatabaseID

- (void).cxx_destruct
{
}

- (NSManagedObjectID)objectID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  return (id)[(NSManagedObjectID *)self->_objectID description];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MKFObjectDatabaseID *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6) {
      char v7 = [(NSManagedObjectID *)self->_objectID isEqual:v6->_objectID];
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (MKFObjectDatabaseID)initWithMKFObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKFObjectDatabaseID;
  v5 = [(MKFObjectDatabaseID *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectID];
    objectID = v5->_objectID;
    v5->_objectID = (NSManagedObjectID *)v6;
  }
  return v5;
}

@end