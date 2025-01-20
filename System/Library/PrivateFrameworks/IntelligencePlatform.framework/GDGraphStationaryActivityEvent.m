@interface GDGraphStationaryActivityEvent
- (GDGraphActivityEventTypeEntityIdentifier)activityTypeObject;
- (GDGraphDateRelationship)date;
- (GDGraphLocationEntityIdentifier)endLocation;
- (GDGraphLocationEntityIdentifier)startLocation;
- (GDGraphStationaryActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 allNameField:(id)a13 allDateField:(id)a14 allStartLocationField:(id)a15 allEndLocationField:(id)a16 allActivityTypeObjectField:(id)a17 allActivityTypeField:(id)a18 allConfidenceField:(id)a19;
- (GDGraphStationaryActivityEventEntityIdentifier)entityIdentifier;
- (NSArray)allActivityType;
- (NSArray)allActivityTypeObject;
- (NSArray)allConfidence;
- (NSArray)allDate;
- (NSArray)allEndLocation;
- (NSArray)allName;
- (NSArray)allStartLocation;
- (NSArray)attendees;
- (NSArray)locations;
- (NSNumber)activityType;
- (NSNumber)confidence;
- (NSString)name;
@end

@implementation GDGraphStationaryActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_confidence, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_activityTypeObject, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allConfidence
{
  return self->_allConfidence;
}

- (NSArray)allActivityType
{
  return self->_allActivityType;
}

- (NSArray)allActivityTypeObject
{
  return self->_allActivityTypeObject;
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

- (NSNumber)confidence
{
  return self->_confidence;
}

- (NSNumber)activityType
{
  return self->_activityType;
}

- (GDGraphActivityEventTypeEntityIdentifier)activityTypeObject
{
  return self->_activityTypeObject;
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

- (GDGraphStationaryActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphStationaryActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 allNameField:(id)a13 allDateField:(id)a14 allStartLocationField:(id)a15 allEndLocationField:(id)a16 allActivityTypeObjectField:(id)a17 allActivityTypeField:(id)a18 allConfidenceField:(id)a19
{
  id v47 = a3;
  id v34 = a4;
  id v46 = a4;
  id v35 = a5;
  id v45 = a5;
  id v44 = a6;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v38 = a12;
  id v37 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  id v27 = a17;
  id v28 = a18;
  id v29 = a19;
  v48.receiver = self;
  v48.super_class = (Class)GDGraphStationaryActivityEvent;
  v30 = [(GDGraphStationaryActivityEvent *)&v48 init];
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_entityIdentifier, a3);
    objc_storeStrong((id *)&v31->_name, v34);
    objc_storeStrong((id *)&v31->_date, v35);
    objc_storeStrong((id *)&v31->_attendees, a6);
    objc_storeStrong((id *)&v31->_locations, a7);
    objc_storeStrong((id *)&v31->_startLocation, a8);
    objc_storeStrong((id *)&v31->_endLocation, a9);
    objc_storeStrong((id *)&v31->_activityTypeObject, a10);
    objc_storeStrong((id *)&v31->_activityType, a11);
    objc_storeStrong((id *)&v31->_confidence, a12);
    objc_storeStrong((id *)&v31->_allName, a13);
    objc_storeStrong((id *)&v31->_allDate, a14);
    objc_storeStrong((id *)&v31->_allStartLocation, a15);
    objc_storeStrong((id *)&v31->_allEndLocation, a16);
    objc_storeStrong((id *)&v31->_allActivityTypeObject, a17);
    objc_storeStrong((id *)&v31->_allActivityType, a18);
    objc_storeStrong((id *)&v31->_allConfidence, a19);
  }

  return v31;
}

@end