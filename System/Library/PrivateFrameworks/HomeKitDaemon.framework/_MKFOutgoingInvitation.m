@interface _MKFOutgoingInvitation
+ (Class)cd_modelClass;
+ (NSPredicate)homeRelation;
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
+ (id)modelIDForParentRelationshipTo:(id)a3;
- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3;
- (MKFOutgoingInvitationDatabaseID)databaseID;
- (NSArray)allowedAccessories;
- (id)allowedAccessoryUUIDs;
- (id)createAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4;
- (id)createAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3;
- (id)createAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3;
- (id)createAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3;
- (id)findAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3;
- (id)findAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3;
- (id)findAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3;
- (id)materializeOrCreateAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5;
- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)restrictedGuestSchedule;
- (void)addAllowedAccessoriesObject:(id)a3;
- (void)removeAllowedAccessoriesObject:(id)a3;
@end

@implementation _MKFOutgoingInvitation

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFOutgoingInvitation"];
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E561650;
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t2 != -1) {
    dispatch_once(&homeRelation__hmf_once_t2, &__block_literal_global_15_171748);
  }
  v2 = (void *)homeRelation__hmf_once_v3;
  return (NSPredicate *)v2;
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

- (void)removeAllowedAccessoriesObject:(id)a3
{
}

- (void)addAllowedAccessoriesObject:(id)a3
{
}

- (id)findAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)createAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3];
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeHAPAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFHAPAccessory" keyValue:a3 createdNew:a4];
}

- (id)findAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3];
}

- (id)createAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3];
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAppleMediaAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAppleMediaAccessory" keyValue:a3 createdNew:a4];
}

- (id)findAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3];
}

- (id)createAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3];
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfTypeAirPlayAccessoryWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:@"MKFAirPlayAccessory" keyValue:a3 createdNew:a4];
}

- (id)createAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromProtocol((Protocol *)a3);
  v8 = [(NSManagedObject *)self mkf_createRelationOnProperty:@"allowedAccessories_" modelProtocol:v7 keyValue:v6];

  return v8;
}

- (id)materializeOrCreateAllowedAccessoriesRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8 = a4;
  v9 = NSStringFromProtocol((Protocol *)a3);
  id v10 = [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"allowedAccessories_" modelProtocol:v9 keyValue:v8 createdNew:a5];

  return v10;
}

- (NSArray)allowedAccessories
{
  v2 = [(_MKFOutgoingInvitation *)self valueForKey:@"allowedAccessories_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFOutgoingInvitationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFOutgoingInvitationDatabaseID alloc] initWithMKFObject:self];
  return v2;
}

- (id)restrictedGuestSchedule
{
  v3 = [(_MKFInvitation *)self weekDayScheduleRules];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_171838);

  v5 = [(_MKFInvitation *)self yearDayScheduleRules];
  id v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_10_171839);

  v7 = (void *)[objc_alloc(MEMORY[0x263F0E6E0]) initWithWeekDayRules:v4 yearDayRules:v6];
  return v7;
}

- (id)allowedAccessoryUUIDs
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = [(_MKFOutgoingInvitation *)self allowedAccessories];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(_MKFOutgoingInvitation *)self allowedAccessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x230FBD990]();
        v13 = [v11 modelID];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3
{
  id v4 = a3;
  v5 = v4;
  BOOL v6 = 1;
  if (v4)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    uint64_t v7 = [v4 weekDayRules];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74___MKFOutgoingInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke;
    v11[3] = &unk_264A23280;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

    uint64_t v8 = [v5 yearDayRules];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __74___MKFOutgoingInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke_4;
    v10[3] = &unk_264A232A8;
    v10[4] = self;
    v10[5] = &v12;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

    BOOL v6 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

@end