@interface HDAlarmEventChanges
- (BOOL)isEqual:(id)a3;
- (HDAlarmEventChanges)initWithOldEvents:(id)a3 scheduledEvents:(id)a4;
- (NSArray)oldEvents;
- (NSArray)scheduledEvents;
- (NSSet)addedEvents;
- (NSSet)removedEvents;
- (id)description;
- (unint64_t)hash;
@end

@implementation HDAlarmEventChanges

- (HDAlarmEventChanges)initWithOldEvents:(id)a3 scheduledEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDAlarmEventChanges;
  v8 = [(HDAlarmEventChanges *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    oldEvents = v8->_oldEvents;
    v8->_oldEvents = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    scheduledEvents = v8->_scheduledEvents;
    v8->_scheduledEvents = (NSArray *)v11;
  }
  return v8;
}

- (NSSet)removedEvents
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:self->_oldEvents];
  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_scheduledEvents];
  [v3 minusSet:v4];

  v5 = (void *)[v3 copy];

  return (NSSet *)v5;
}

- (NSSet)addedEvents
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:self->_scheduledEvents];
  v4 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_oldEvents];
  [v3 minusSet:v4];

  v5 = (void *)[v3 copy];

  return (NSSet *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDAlarmEventChanges *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      oldEvents = self->_oldEvents;
      id v7 = v5->_oldEvents;
      if (oldEvents != v7 && (!v7 || !-[NSArray isEqual:](oldEvents, "isEqual:"))) {
        goto LABEL_11;
      }
      scheduledEvents = self->_scheduledEvents;
      uint64_t v9 = v5->_scheduledEvents;
      if (scheduledEvents == v9)
      {
        char v10 = 1;
        goto LABEL_13;
      }
      if (v9) {
        char v10 = -[NSArray isEqual:](scheduledEvents, "isEqual:");
      }
      else {
LABEL_11:
      }
        char v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_oldEvents hash];
  return [(NSArray *)self->_scheduledEvents hash] ^ v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ (%ld old, %ld new) old: %@ new: %@>", objc_opt_class(), -[NSArray count](self->_oldEvents, "count"), -[NSArray count](self->_scheduledEvents, "count"), self->_oldEvents, self->_scheduledEvents];
}

- (NSArray)oldEvents
{
  return self->_oldEvents;
}

- (NSArray)scheduledEvents
{
  return self->_scheduledEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledEvents, 0);

  objc_storeStrong((id *)&self->_oldEvents, 0);
}

@end