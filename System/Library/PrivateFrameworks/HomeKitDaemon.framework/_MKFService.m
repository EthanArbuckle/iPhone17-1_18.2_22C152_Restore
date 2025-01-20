@interface _MKFService
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForKeyAttribute:(id)a3 parent:(id)a4;
- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3;
- (MKFHome)home;
- (MKFServiceDatabaseID)databaseID;
- (NSArray)actionCharacteristicWrites;
- (NSArray)characteristics;
- (NSArray)eventCharacteristics;
- (NSArray)serviceGroups;
- (id)createCharacteristicsRelationOfType:(id)a3 instanceID:(id)a4;
- (id)createCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3;
- (id)createCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3;
- (id)createCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3;
- (id)createCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3;
- (id)findCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3;
- (id)findCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3;
- (id)findCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3;
- (id)findCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3;
- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3;
- (id)materializeOrCreateCharacteristicsRelationOfType:(id)a3 instanceID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4;
- (id)pr_findCharacteristicWithInstanceID:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)synchronizeCharacteristicsRelationWith:(id)a3;
@end

@implementation _MKFService

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E50B0B0;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_82298 != -1) {
    dispatch_once(&homeRelation__hmf_once_t0_82298, &__block_literal_global_82299);
  }
  v2 = (void *)homeRelation__hmf_once_v1_82300;
  return (NSPredicate *)v2;
}

+ (id)modelIDForKeyAttribute:(id)a3 parent:(id)a4
{
  id v5 = a3;
  v6 = [a4 modelID];
  v7 = +[HMDService generateUUIDWithAccessoryUUID:v6 serviceID:v5];

  return v7;
}

- (NSArray)serviceGroups
{
  v2 = [(_MKFService *)self valueForKey:@"serviceGroups_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)eventCharacteristics
{
  v2 = [(_MKFService *)self valueForKey:@"eventCharacteristics_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)synchronizeCharacteristicsRelationWith:(id)a3
{
}

- (id)findCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"characteristics_" modelProtocol:@"MKFStringCharacteristic" keyValue:a3];
}

- (id)createCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"characteristics_" modelProtocol:@"MKFStringCharacteristic" keyValue:a3];
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeStringCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"characteristics_" modelProtocol:@"MKFStringCharacteristic" keyValue:a3 createdNew:a4];
}

- (id)findCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"characteristics_" modelProtocol:@"MKFIntegerCharacteristic" keyValue:a3];
}

- (id)createCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"characteristics_" modelProtocol:@"MKFIntegerCharacteristic" keyValue:a3];
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeIntegerCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"characteristics_" modelProtocol:@"MKFIntegerCharacteristic" keyValue:a3 createdNew:a4];
}

- (id)findCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"characteristics_" modelProtocol:@"MKFFloatCharacteristic" keyValue:a3];
}

- (id)createCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"characteristics_" modelProtocol:@"MKFFloatCharacteristic" keyValue:a3];
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeFloatCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"characteristics_" modelProtocol:@"MKFFloatCharacteristic" keyValue:a3 createdNew:a4];
}

- (id)findCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"characteristics_" modelProtocol:@"MKFCharacteristic" keyValue:a3];
}

- (id)createCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"characteristics_" modelProtocol:@"MKFCharacteristic" keyValue:a3];
}

- (id)materializeOrCreateCharacteristicsRelationOfTypeCharacteristicWithInstanceID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"characteristics_" modelProtocol:@"MKFCharacteristic" keyValue:a3 createdNew:a4];
}

- (id)createCharacteristicsRelationOfType:(id)a3 instanceID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"characteristics_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateCharacteristicsRelationOfType:(id)a3 instanceID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"characteristics_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (void)setCharacteristics:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(_MKFService *)self setValue:v4 forKey:@"characteristics_"];
  }
  else
  {
    -[_MKFService setValue:forKey:](self, "setValue:forKey:");
  }
}

- (NSArray)characteristics
{
  v2 = [(_MKFService *)self valueForKey:@"characteristics_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)materializeOrCreateApplicationDataRelation:(BOOL *)a3
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"applicationData" modelProtocol:@"MKFApplicationData" keyValue:0 createdNew:a3];
}

- (NSArray)actionCharacteristicWrites
{
  v2 = [(_MKFService *)self valueForKey:@"actionCharacteristicWrites_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFHome)home
{
  v2 = [(_MKFService *)self accessory];
  v3 = [v2 home];

  return (MKFHome *)v3;
}

- (MKFServiceDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFServiceDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)pr_findCharacteristicWithInstanceID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__82358;
  v16 = __Block_byref_object_dispose__82359;
  id v17 = 0;
  id v5 = [(_MKFService *)self characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51___MKFService_pr_findCharacteristicWithInstanceID___block_invoke;
  v9[3] = &unk_264A1D390;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)shouldIncludeForRestrictedGuestWithContext:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = objc_msgSend(MEMORY[0x263F0E6E8], "secureClassServices", a3);
  id v6 = [v4 setWithSet:v5];

  v11[0] = *MEMORY[0x263F0D640];
  v11[1] = @"00000260-0000-1000-8000-0026BB765291";
  v11[2] = @"00000266-0000-1000-8000-0026BB765291";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  [v6 addObjectsFromArray:v7];

  id v8 = [(_MKFService *)self serviceType];
  v9 = [v8 UUIDString];
  LOBYTE(self) = [v6 containsObject:v9];

  return (char)self;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFService"];
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end