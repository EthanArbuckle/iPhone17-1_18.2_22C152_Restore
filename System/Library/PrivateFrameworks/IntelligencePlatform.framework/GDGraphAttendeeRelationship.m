@interface GDGraphAttendeeRelationship
- (GDGraphAttendeeRelationship)initWithEventParticipationTypeField:(id)a3 attendeeIdField:(id)a4 allEventParticipationTypeField:(id)a5 allAttendeeIdField:(id)a6;
- (GDGraphEntityIdentifier)attendeeId;
- (NSArray)allAttendeeId;
- (NSArray)allEventParticipationType;
- (NSString)eventParticipationType;
@end

@implementation GDGraphAttendeeRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAttendeeId, 0);
  objc_storeStrong((id *)&self->_allEventParticipationType, 0);
  objc_storeStrong((id *)&self->_attendeeId, 0);

  objc_storeStrong((id *)&self->_eventParticipationType, 0);
}

- (NSArray)allAttendeeId
{
  return self->_allAttendeeId;
}

- (NSArray)allEventParticipationType
{
  return self->_allEventParticipationType;
}

- (GDGraphEntityIdentifier)attendeeId
{
  return self->_attendeeId;
}

- (NSString)eventParticipationType
{
  return self->_eventParticipationType;
}

- (GDGraphAttendeeRelationship)initWithEventParticipationTypeField:(id)a3 attendeeIdField:(id)a4 allEventParticipationTypeField:(id)a5 allAttendeeIdField:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphAttendeeRelationship;
  v15 = [(GDGraphAttendeeRelationship *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_eventParticipationType, a3);
    objc_storeStrong((id *)&v16->_attendeeId, a4);
    objc_storeStrong((id *)&v16->_allEventParticipationType, a5);
    objc_storeStrong((id *)&v16->_allAttendeeId, a6);
  }

  return v16;
}

@end