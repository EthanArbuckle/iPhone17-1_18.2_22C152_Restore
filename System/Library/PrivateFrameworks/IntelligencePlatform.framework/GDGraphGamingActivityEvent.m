@interface GDGraphGamingActivityEvent
- (GDGraphActivityEventTypeEntityIdentifier)activityTypeObject;
- (GDGraphDateRelationship)date;
- (GDGraphGamingActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 softwareField:(id)a13 allNameField:(id)a14 allDateField:(id)a15 allStartLocationField:(id)a16 allEndLocationField:(id)a17 allActivityTypeObjectField:(id)a18 allActivityTypeField:(id)a19 allConfidenceField:(id)a20 allSoftwareField:(id)a21;
- (GDGraphGamingActivityEventEntityIdentifier)entityIdentifier;
- (GDGraphLocationEntityIdentifier)endLocation;
- (GDGraphLocationEntityIdentifier)startLocation;
- (GDGraphSoftwareRelationship)software;
- (NSArray)allActivityType;
- (NSArray)allActivityTypeObject;
- (NSArray)allConfidence;
- (NSArray)allDate;
- (NSArray)allEndLocation;
- (NSArray)allName;
- (NSArray)allSoftware;
- (NSArray)allStartLocation;
- (NSArray)attendees;
- (NSArray)locations;
- (NSNumber)activityType;
- (NSNumber)confidence;
- (NSString)name;
@end

@implementation GDGraphGamingActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSoftware, 0);
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_software, 0);
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

- (NSArray)allSoftware
{
  return self->_allSoftware;
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

- (GDGraphSoftwareRelationship)software
{
  return self->_software;
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

- (GDGraphGamingActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphGamingActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 softwareField:(id)a13 allNameField:(id)a14 allDateField:(id)a15 allStartLocationField:(id)a16 allEndLocationField:(id)a17 allActivityTypeObjectField:(id)a18 allActivityTypeField:(id)a19 allConfidenceField:(id)a20 allSoftwareField:(id)a21
{
  id v52 = a3;
  id v37 = a4;
  id v51 = a4;
  id v38 = a5;
  id v50 = a5;
  id v39 = a6;
  id v49 = a6;
  id v48 = a7;
  id v47 = a8;
  id v46 = a9;
  id v45 = a10;
  id v44 = a11;
  id v43 = a12;
  id v42 = a13;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v41 = a21;
  v53.receiver = self;
  v53.super_class = (Class)GDGraphGamingActivityEvent;
  v33 = [(GDGraphGamingActivityEvent *)&v53 init];
  v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_entityIdentifier, a3);
    objc_storeStrong((id *)&v34->_name, v37);
    objc_storeStrong((id *)&v34->_date, v38);
    objc_storeStrong((id *)&v34->_attendees, v39);
    objc_storeStrong((id *)&v34->_locations, a7);
    objc_storeStrong((id *)&v34->_startLocation, a8);
    objc_storeStrong((id *)&v34->_endLocation, a9);
    objc_storeStrong((id *)&v34->_activityTypeObject, a10);
    objc_storeStrong((id *)&v34->_activityType, a11);
    objc_storeStrong((id *)&v34->_confidence, a12);
    objc_storeStrong((id *)&v34->_software, a13);
    objc_storeStrong((id *)&v34->_allName, a14);
    objc_storeStrong((id *)&v34->_allDate, a15);
    objc_storeStrong((id *)&v34->_allStartLocation, a16);
    objc_storeStrong((id *)&v34->_allEndLocation, a17);
    objc_storeStrong((id *)&v34->_allActivityTypeObject, a18);
    objc_storeStrong((id *)&v34->_allActivityType, a19);
    objc_storeStrong((id *)&v34->_allConfidence, a20);
    objc_storeStrong((id *)&v34->_allSoftware, a21);
  }

  return v34;
}

@end