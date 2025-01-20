@interface GDGraphTransportationActivityEvent
- (GDGraphActivityEventTypeEntityIdentifier)activityTypeObject;
- (GDGraphDateRelationship)date;
- (GDGraphLocationEntityIdentifier)endLocation;
- (GDGraphLocationEntityIdentifier)startLocation;
- (GDGraphModeOfTransportationEntityIdentifier)modeOfTransportation;
- (GDGraphTransportationActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 uncertaintyField:(id)a13 modeOfTransportationField:(id)a14 transportationTypeField:(id)a15 allNameField:(id)a16 allDateField:(id)a17 allStartLocationField:(id)a18 allEndLocationField:(id)a19 allActivityTypeObjectField:(id)a20 allActivityTypeField:(id)a21 allConfidenceField:(id)a22 allUncertaintyField:(id)a23 allModeOfTransportationField:(id)a24 allTransportationTypeField:(id)a25;
- (GDGraphTransportationActivityEventEntityIdentifier)entityIdentifier;
- (NSArray)allActivityType;
- (NSArray)allActivityTypeObject;
- (NSArray)allConfidence;
- (NSArray)allDate;
- (NSArray)allEndLocation;
- (NSArray)allModeOfTransportation;
- (NSArray)allName;
- (NSArray)allStartLocation;
- (NSArray)allTransportationType;
- (NSArray)allUncertainty;
- (NSArray)attendees;
- (NSArray)locations;
- (NSNumber)activityType;
- (NSNumber)confidence;
- (NSNumber)transportationType;
- (NSNumber)uncertainty;
- (NSString)name;
@end

@implementation GDGraphTransportationActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTransportationType, 0);
  objc_storeStrong((id *)&self->_allModeOfTransportation, 0);
  objc_storeStrong((id *)&self->_allUncertainty, 0);
  objc_storeStrong((id *)&self->_allConfidence, 0);
  objc_storeStrong((id *)&self->_allActivityType, 0);
  objc_storeStrong((id *)&self->_allActivityTypeObject, 0);
  objc_storeStrong((id *)&self->_allEndLocation, 0);
  objc_storeStrong((id *)&self->_allStartLocation, 0);
  objc_storeStrong((id *)&self->_allDate, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_transportationType, 0);
  objc_storeStrong((id *)&self->_modeOfTransportation, 0);
  objc_storeStrong((id *)&self->_uncertainty, 0);
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

- (NSArray)allTransportationType
{
  return self->_allTransportationType;
}

- (NSArray)allModeOfTransportation
{
  return self->_allModeOfTransportation;
}

- (NSArray)allUncertainty
{
  return self->_allUncertainty;
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

- (NSNumber)transportationType
{
  return self->_transportationType;
}

- (GDGraphModeOfTransportationEntityIdentifier)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (NSNumber)uncertainty
{
  return self->_uncertainty;
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

- (GDGraphTransportationActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphTransportationActivityEvent)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 dateField:(id)a5 attendeesField:(id)a6 locationsField:(id)a7 startLocationField:(id)a8 endLocationField:(id)a9 activityTypeObjectField:(id)a10 activityTypeField:(id)a11 confidenceField:(id)a12 uncertaintyField:(id)a13 modeOfTransportationField:(id)a14 transportationTypeField:(id)a15 allNameField:(id)a16 allDateField:(id)a17 allStartLocationField:(id)a18 allEndLocationField:(id)a19 allActivityTypeObjectField:(id)a20 allActivityTypeField:(id)a21 allConfidenceField:(id)a22 allUncertaintyField:(id)a23 allModeOfTransportationField:(id)a24 allTransportationTypeField:(id)a25
{
  id v61 = a3;
  id v41 = a4;
  id v60 = a4;
  id v42 = a5;
  id v59 = a5;
  id v43 = a6;
  id v58 = a6;
  id v57 = a7;
  id v44 = a8;
  id v56 = a8;
  id v55 = a9;
  id v54 = a10;
  id v53 = a11;
  id v52 = a12;
  id v51 = a13;
  id v50 = a14;
  id v49 = a15;
  id v48 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  id v35 = a22;
  id v36 = a23;
  id v47 = a24;
  id v46 = a25;
  v62.receiver = self;
  v62.super_class = (Class)GDGraphTransportationActivityEvent;
  v37 = [(GDGraphTransportationActivityEvent *)&v62 init];
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_entityIdentifier, a3);
    objc_storeStrong((id *)&v38->_name, v41);
    objc_storeStrong((id *)&v38->_date, v42);
    objc_storeStrong((id *)&v38->_attendees, v43);
    objc_storeStrong((id *)&v38->_locations, a7);
    objc_storeStrong((id *)&v38->_startLocation, v44);
    objc_storeStrong((id *)&v38->_endLocation, a9);
    objc_storeStrong((id *)&v38->_activityTypeObject, a10);
    objc_storeStrong((id *)&v38->_activityType, a11);
    objc_storeStrong((id *)&v38->_confidence, a12);
    objc_storeStrong((id *)&v38->_uncertainty, a13);
    objc_storeStrong((id *)&v38->_modeOfTransportation, a14);
    objc_storeStrong((id *)&v38->_transportationType, a15);
    objc_storeStrong((id *)&v38->_allName, a16);
    objc_storeStrong((id *)&v38->_allDate, a17);
    objc_storeStrong((id *)&v38->_allStartLocation, a18);
    objc_storeStrong((id *)&v38->_allEndLocation, a19);
    objc_storeStrong((id *)&v38->_allActivityTypeObject, a20);
    objc_storeStrong((id *)&v38->_allActivityType, a21);
    objc_storeStrong((id *)&v38->_allConfidence, a22);
    objc_storeStrong((id *)&v38->_allUncertainty, a23);
    objc_storeStrong((id *)&v38->_allModeOfTransportation, a24);
    objc_storeStrong((id *)&v38->_allTransportationType, a25);
  }

  return v38;
}

@end