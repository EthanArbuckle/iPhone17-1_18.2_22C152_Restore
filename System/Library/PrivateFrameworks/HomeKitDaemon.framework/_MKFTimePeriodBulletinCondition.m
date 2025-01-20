@interface _MKFTimePeriodBulletinCondition
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (MKFHome)home;
- (MKFTimePeriodBulletinConditionDatabaseID)databaseID;
- (id)createEndElementRelationOfType:(id)a3 modelID:(id)a4;
- (id)createEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3;
- (id)createEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3;
- (id)createStartElementRelationOfType:(id)a3 modelID:(id)a4;
- (id)createStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3;
- (id)createStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3;
- (id)findEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3;
- (id)findEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3;
- (id)findStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3;
- (id)findStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3;
- (id)materializeOrCreateEndElementRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateStartElementRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (void)addEndElementObject:(id)a3;
- (void)addStartElementObject:(id)a3;
- (void)removeEndElementObject:(id)a3;
- (void)removeStartElementObject:(id)a3;
@end

@implementation _MKFTimePeriodBulletinCondition

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4DADE0;
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)removeStartElementObject:(id)a3
{
}

- (void)addStartElementObject:(id)a3
{
}

- (id)findStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"startElement" modelProtocol:@"MKFTimeOfDayTimeSpecification" keyValue:a3];
}

- (id)createStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"startElement" modelProtocol:@"MKFTimeOfDayTimeSpecification" keyValue:a3];
}

- (id)materializeOrCreateStartElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"startElement" modelProtocol:@"MKFTimeOfDayTimeSpecification" keyValue:a3 createdNew:a4];
}

- (id)findStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"startElement" modelProtocol:@"MKFSunriseSunsetTimeSpecification" keyValue:a3];
}

- (id)createStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"startElement" modelProtocol:@"MKFSunriseSunsetTimeSpecification" keyValue:a3];
}

- (id)materializeOrCreateStartElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"startElement" modelProtocol:@"MKFSunriseSunsetTimeSpecification" keyValue:a3 createdNew:a4];
}

- (id)createStartElementRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"startElement" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateStartElementRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  id v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"startElement" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (void)removeEndElementObject:(id)a3
{
}

- (void)addEndElementObject:(id)a3
{
}

- (id)findEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"endElement" modelProtocol:@"MKFTimeOfDayTimeSpecification" keyValue:a3];
}

- (id)createEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"endElement" modelProtocol:@"MKFTimeOfDayTimeSpecification" keyValue:a3];
}

- (id)materializeOrCreateEndElementRelationOfTypeTimeOfDayTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"endElement" modelProtocol:@"MKFTimeOfDayTimeSpecification" keyValue:a3 createdNew:a4];
}

- (id)findEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"endElement" modelProtocol:@"MKFSunriseSunsetTimeSpecification" keyValue:a3];
}

- (id)createEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"endElement" modelProtocol:@"MKFSunriseSunsetTimeSpecification" keyValue:a3];
}

- (id)materializeOrCreateEndElementRelationOfTypeSunriseSunsetTimeSpecificationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"endElement" modelProtocol:@"MKFSunriseSunsetTimeSpecification" keyValue:a3 createdNew:a4];
}

- (id)createEndElementRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  id v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"endElement" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateEndElementRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  id v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"endElement" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (MKFHome)home
{
  v2 = [(_MKFTimePeriodBulletinCondition *)self bulletinRegistration];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFTimePeriodBulletinConditionDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFTimePeriodBulletinConditionDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFTimePeriodBulletinCondition"];
}

@end