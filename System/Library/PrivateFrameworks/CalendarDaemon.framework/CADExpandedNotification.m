@interface CADExpandedNotification
- (BOOL)expanded;
- (CADExpandedNotification)initWithType:(int)a3 objectID:(id)a4 occurrenceDate:(double)a5 expirationDate:(double)a6 attendeeObjectID:(id)a7;
- (CADObjectID)attendeeObjectID;
- (void)setAttendeeObjectID:(id)a3;
@end

@implementation CADExpandedNotification

- (CADExpandedNotification)initWithType:(int)a3 objectID:(id)a4 occurrenceDate:(double)a5 expirationDate:(double)a6 attendeeObjectID:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CADExpandedNotification;
  v14 = [(CADNotification *)&v17 initWithType:v11 objectID:a4 occurrenceDate:a5 expirationDate:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_attendeeObjectID, a7);
  }

  return v15;
}

- (BOOL)expanded
{
  return 1;
}

- (CADObjectID)attendeeObjectID
{
  return self->_attendeeObjectID;
}

- (void)setAttendeeObjectID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end