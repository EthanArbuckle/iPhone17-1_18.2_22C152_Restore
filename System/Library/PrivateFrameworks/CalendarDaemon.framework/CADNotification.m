@interface CADNotification
- (BOOL)expanded;
- (CADNotification)initWithType:(int)a3 objectID:(id)a4 occurrenceDate:(double)a5 expirationDate:(double)a6;
- (CADObjectID)objectID;
- (NSArray)expandedNotifications;
- (NSMutableArray)mutableExpandedNotifications;
- (double)expirationDate;
- (double)occurrenceDate;
- (int)type;
- (void)addExpandedNotification:(id)a3;
- (void)setMutableExpandedNotifications:(id)a3;
@end

@implementation CADNotification

- (CADObjectID)objectID
{
  return self->_objectID;
}

- (int)type
{
  return self->_type;
}

- (double)occurrenceDate
{
  return self->_occurrenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableExpandedNotifications, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (CADNotification)initWithType:(int)a3 objectID:(id)a4 occurrenceDate:(double)a5 expirationDate:(double)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CADNotification;
  v12 = [(CADNotification *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    objc_storeStrong((id *)&v12->_objectID, a4);
    v13->_occurrenceDate = a5;
    v13->_expirationDate = a6;
  }

  return v13;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (BOOL)expanded
{
  return 0;
}

- (NSArray)expandedNotifications
{
  v2 = (void *)[(NSMutableArray *)self->_mutableExpandedNotifications copy];
  return (NSArray *)v2;
}

- (void)addExpandedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CADNotification *)self mutableExpandedNotifications];
  [v5 addObject:v4];
}

- (NSMutableArray)mutableExpandedNotifications
{
  mutableExpandedNotifications = self->_mutableExpandedNotifications;
  if (!mutableExpandedNotifications)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = self->_mutableExpandedNotifications;
    self->_mutableExpandedNotifications = v4;

    mutableExpandedNotifications = self->_mutableExpandedNotifications;
  }
  return mutableExpandedNotifications;
}

- (void)setMutableExpandedNotifications:(id)a3
{
}

@end