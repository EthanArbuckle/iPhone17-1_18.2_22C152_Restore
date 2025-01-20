@interface EKExceptionDateChange
+ (int)entityType;
- (EKExceptionDateChange)initWithChangeProperties:(id)a3;
- (EKObjectID)ownerID;
- (NSDate)date;
- (id)owningEventInEventStore:(id)a3;
@end

@implementation EKExceptionDateChange

+ (int)entityType
{
  return 10;
}

- (EKExceptionDateChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EKExceptionDateChange;
  v5 = [(EKObjectChange *)&v14 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"owner_id"];
    uint64_t v7 = [v6 intValue];

    if (v7)
    {
      v8 = [(EKObjectChange *)v5 changedObjectID];
      uint64_t v9 = +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 2, v7, [v8 databaseID]);
      ownerID = v5->_ownerID;
      v5->_ownerID = (EKObjectID *)v9;
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v11;
  }
  return v5;
}

- (id)owningEventInEventStore:(id)a3
{
  id v4 = a3;
  v5 = [(EKExceptionDateChange *)self ownerID];
  if (v5)
  {
    v6 = [v4 publicObjectWithObjectID:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EKObjectID)ownerID
{
  return self->_ownerID;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_ownerID, 0);
}

@end