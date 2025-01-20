@interface GDGraphSportsGameEvent
- (GDGraphDateRelationship)date;
- (GDGraphLocationEntityIdentifier)endLocation;
- (GDGraphLocationEntityIdentifier)startLocation;
- (GDGraphSportsGameEvent)initWithEntityIdentifierField:(id)a3 eventTypesField:(id)a4 nameField:(id)a5 dateField:(id)a6 cooccurringEventsField:(id)a7 locationsField:(id)a8 startLocationField:(id)a9 endLocationField:(id)a10 teamsField:(id)a11 allNameField:(id)a12 allDateField:(id)a13 allStartLocationField:(id)a14 allEndLocationField:(id)a15;
- (GDGraphSportsGameEventEntityIdentifier)entityIdentifier;
- (NSArray)allDate;
- (NSArray)allEndLocation;
- (NSArray)allName;
- (NSArray)allStartLocation;
- (NSArray)cooccurringEvents;
- (NSArray)eventTypes;
- (NSArray)locations;
- (NSArray)teams;
- (NSString)name;
@end

@implementation GDGraphSportsGameEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_teams, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_cooccurringEvents, 0);
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

- (NSArray)teams
{
  return self->_teams;
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

- (GDGraphSportsGameEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphSportsGameEvent)initWithEntityIdentifierField:(id)a3 eventTypesField:(id)a4 nameField:(id)a5 dateField:(id)a6 cooccurringEventsField:(id)a7 locationsField:(id)a8 startLocationField:(id)a9 endLocationField:(id)a10 teamsField:(id)a11 allNameField:(id)a12 allDateField:(id)a13 allStartLocationField:(id)a14 allEndLocationField:(id)a15
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
  v41.super_class = (Class)GDGraphSportsGameEvent;
  v25 = [(GDGraphSportsGameEvent *)&v41 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_entityIdentifier, a3);
    objc_storeStrong((id *)&v26->_eventTypes, v29);
    objc_storeStrong((id *)&v26->_name, v30);
    objc_storeStrong((id *)&v26->_date, v31);
    objc_storeStrong((id *)&v26->_cooccurringEvents, a7);
    objc_storeStrong((id *)&v26->_locations, a8);
    objc_storeStrong((id *)&v26->_startLocation, a9);
    objc_storeStrong((id *)&v26->_endLocation, a10);
    objc_storeStrong((id *)&v26->_teams, a11);
    objc_storeStrong((id *)&v26->_allName, a12);
    objc_storeStrong((id *)&v26->_allDate, a13);
    objc_storeStrong((id *)&v26->_allStartLocation, a14);
    objc_storeStrong((id *)&v26->_allEndLocation, a15);
  }

  return v26;
}

@end