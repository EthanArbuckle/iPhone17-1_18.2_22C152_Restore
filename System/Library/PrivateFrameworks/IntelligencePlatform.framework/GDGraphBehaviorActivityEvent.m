@interface GDGraphBehaviorActivityEvent
- (GDGraphActivityEventTypeEntityIdentifier)activityTypeObject;
- (GDGraphBehaviorActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 behaviorTypeField:(id)a13 allNameField:(id)a14 allDateField:(id)a15 allStartLocationField:(id)a16 allEndLocationField:(id)a17 allActivityTypeObjectField:(id)a18 allActivityTypeField:(id)a19 allConfidenceField:(id)a20 allBehaviorTypeField:(id)a21;
- (GDGraphBehaviorActivityEventEntityIdentifier)entityIdentifier;
- (GDGraphDateRelationship)date;
- (GDGraphLocationEntityIdentifier)endLocation;
- (GDGraphLocationEntityIdentifier)startLocation;
- (NSArray)allActivityType;
- (NSArray)allActivityTypeObject;
- (NSArray)allBehaviorType;
- (NSArray)allConfidence;
- (NSArray)allDate;
- (NSArray)allEndLocation;
- (NSArray)allName;
- (NSArray)allStartLocation;
- (NSArray)attendees;
- (NSArray)locations;
- (NSNumber)activityType;
- (NSNumber)confidence;
- (NSString)behaviorType;
- (NSString)name;
@end

@implementation GDGraphBehaviorActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allBehaviorType, 0);
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_behaviorType, 0);
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

- (NSArray)allBehaviorType
{
  return self->_allBehaviorType;
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

- (NSString)behaviorType
{
  return self->_behaviorType;
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

- (GDGraphBehaviorActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphBehaviorActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 behaviorTypeField:(id)a13 allNameField:(id)a14 allDateField:(id)a15 allStartLocationField:(id)a16 allEndLocationField:(id)a17 allActivityTypeObjectField:(id)a18 allActivityTypeField:(id)a19 allConfidenceField:(id)a20 allBehaviorTypeField:(id)a21
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
  v53.super_class = (Class)GDGraphBehaviorActivityEvent;
  v33 = [(GDGraphBehaviorActivityEvent *)&v53 init];
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
    objc_storeStrong((id *)&v34->_behaviorType, a13);
    objc_storeStrong((id *)&v34->_allName, a14);
    objc_storeStrong((id *)&v34->_allDate, a15);
    objc_storeStrong((id *)&v34->_allStartLocation, a16);
    objc_storeStrong((id *)&v34->_allEndLocation, a17);
    objc_storeStrong((id *)&v34->_allActivityTypeObject, a18);
    objc_storeStrong((id *)&v34->_allActivityType, a19);
    objc_storeStrong((id *)&v34->_allConfidence, a20);
    objc_storeStrong((id *)&v34->_allBehaviorType, a21);
  }

  return v34;
}

@end