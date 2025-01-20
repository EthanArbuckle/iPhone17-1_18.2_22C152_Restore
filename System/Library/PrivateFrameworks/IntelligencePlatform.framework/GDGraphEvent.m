@interface GDGraphEvent
- (GDGraphDateRelationship)date;
- (GDGraphEvent)initWithEntityIdentifierField:(id)a3 eventTypesField:(id)a4 nameField:(id)a5 dateField:(id)a6 attendeesField:(id)a7 cooccurringEventsField:(id)a8 locationsField:(id)a9 startLocationField:(id)a10 endLocationField:(id)a11 allNameField:(id)a12 allDateField:(id)a13 allStartLocationField:(id)a14 allEndLocationField:(id)a15;
- (GDGraphEventEntityIdentifier)entityIdentifier;
- (GDGraphLocationEntityIdentifier)endLocation;
- (GDGraphLocationEntityIdentifier)startLocation;
- (NSArray)allDate;
- (NSArray)allEndLocation;
- (NSArray)allName;
- (NSArray)allStartLocation;
- (NSArray)attendees;
- (NSArray)cooccurringEvents;
- (NSArray)eventTypes;
- (NSArray)locations;
- (NSString)name;
@end

@implementation GDGraphEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_cooccurringEvents, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_eventTypes, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allEndLocation
{
  return self->_allEndLocation;
}

- (NSArray)allStartLocation
{
  return self->_allStartLocation;
}

- (NSArray)allDate
{
  return self->_allDate;
}

- (NSArray)allName
{
  return self->_allName;
}

- (GDGraphLocationEntityIdentifier)endLocation
{
  return self->_endLocation;
}

- (GDGraphLocationEntityIdentifier)startLocation
{
  return self->_startLocation;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)cooccurringEvents
{
  return self->_cooccurringEvents;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (GDGraphDateRelationship)date
{
  return self->_date;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)eventTypes
{
  return self->_eventTypes;
}

- (GDGraphEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphEvent)initWithEntityIdentifierField:(id)a3 eventTypesField:(id)a4 nameField:(id)a5 dateField:(id)a6 attendeesField:(id)a7 cooccurringEventsField:(id)a8 locationsField:(id)a9 startLocationField:(id)a10 endLocationField:(id)a11 allNameField:(id)a12 allDateField:(id)a13 allStartLocationField:(id)a14 allEndLocationField:(id)a15
{
  id v40 = a3;
  id v29 = a4;
  id v39 = a4;
  id v30 = a5;
  id v38 = a5;
  id v31 = a6;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  v41.receiver = self;
  v41.super_class = (Class)GDGraphEvent;
  v25 = [(GDGraphEvent *)&v41 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_entityIdentifier, a3);
    objc_storeStrong((id *)&v26->_eventTypes, v29);
    objc_storeStrong((id *)&v26->_name, v30);
    objc_storeStrong((id *)&v26->_date, v31);
    objc_storeStrong((id *)&v26->_attendees, a7);
    objc_storeStrong((id *)&v26->_cooccurringEvents, a8);
    objc_storeStrong((id *)&v26->_locations, a9);
    objc_storeStrong((id *)&v26->_startLocation, a10);
    objc_storeStrong((id *)&v26->_endLocation, a11);
    objc_storeStrong((id *)&v26->_allName, a12);
    objc_storeStrong((id *)&v26->_allDate, a13);
    objc_storeStrong((id *)&v26->_allStartLocation, a14);
    objc_storeStrong((id *)&v26->_allEndLocation, a15);
  }

  return v26;
}

@end