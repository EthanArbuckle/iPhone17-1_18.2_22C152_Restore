@interface GDGraphCalendarEvent
- (GDGraphCalendarEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 datesField:(id)a5 isAllDayField:(id)a6 identifiersField:(id)a7 attendeesField:(id)a8 organizersField:(id)a9 locationsField:(id)a10 sgeventTypeField:(id)a11 allNameField:(id)a12 allIsAllDayField:(id)a13;
- (GDGraphCalendarEventEntityIdentifier)entityIdentifier;
- (NSArray)allIsAllDay;
- (NSArray)allName;
- (NSArray)attendees;
- (NSArray)dates;
- (NSArray)identifiers;
- (NSArray)locations;
- (NSArray)organizers;
- (NSArray)sgeventType;
- (NSNumber)isAllDay;
- (NSString)name;
@end

@implementation GDGraphCalendarEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIsAllDay, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_sgeventType, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_organizers, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_isAllDay, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allIsAllDay
{
  return self->_allIsAllDay;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)sgeventType
{
  return self->_sgeventType;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)organizers
{
  return self->_organizers;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSNumber)isAllDay
{
  return self->_isAllDay;
}

- (NSArray)dates
{
  return self->_dates;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphCalendarEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphCalendarEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 datesField:(id)a5 isAllDayField:(id)a6 identifiersField:(id)a7 attendeesField:(id)a8 organizersField:(id)a9 locationsField:(id)a10 sgeventTypeField:(id)a11 allNameField:(id)a12 allIsAllDayField:(id)a13
{
  id v35 = a3;
  id v34 = a4;
  id v27 = a5;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v28 = a8;
  id v30 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  v36.receiver = self;
  v36.super_class = (Class)GDGraphCalendarEvent;
  v23 = [(GDGraphCalendarEvent *)&v36 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_entityIdentifier, a3);
    objc_storeStrong((id *)&v24->_name, a4);
    objc_storeStrong((id *)&v24->_dates, v27);
    objc_storeStrong((id *)&v24->_isAllDay, a6);
    objc_storeStrong((id *)&v24->_identifiers, a7);
    objc_storeStrong((id *)&v24->_attendees, v28);
    objc_storeStrong((id *)&v24->_organizers, a9);
    objc_storeStrong((id *)&v24->_locations, a10);
    objc_storeStrong((id *)&v24->_sgeventType, a11);
    objc_storeStrong((id *)&v24->_allName, a12);
    objc_storeStrong((id *)&v24->_allIsAllDay, a13);
  }

  return v24;
}

@end