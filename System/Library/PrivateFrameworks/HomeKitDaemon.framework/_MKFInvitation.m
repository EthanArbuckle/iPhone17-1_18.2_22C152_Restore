@interface _MKFInvitation
+ (Protocol)backingModelProtocol;
+ (id)fetchRequest;
- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3;
- (MKFInvitationDatabaseID)databaseID;
- (NSArray)weekDayScheduleRules;
- (NSArray)yearDayScheduleRules;
- (id)findWeekDayScheduleRulesRelationWithModelID:(id)a3;
- (id)findYearDayScheduleRulesRelationWithModelID:(id)a3;
- (id)materializeOrCreateWeekDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)materializeOrCreateYearDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4;
- (id)restrictedGuestSchedule;
- (void)addWeekDayScheduleRulesObject:(id)a3;
- (void)addYearDayScheduleRulesObject:(id)a3;
- (void)removeWeekDayScheduleRulesObject:(id)a3;
- (void)removeYearDayScheduleRulesObject:(id)a3;
@end

@implementation _MKFInvitation

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_26E4D5210;
}

- (void)removeYearDayScheduleRulesObject:(id)a3
{
}

- (void)addYearDayScheduleRulesObject:(id)a3
{
}

- (id)findYearDayScheduleRulesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"yearDayScheduleRules_" modelProtocol:@"MKFYearDayScheduleRule" keyValue:a3];
}

- (id)materializeOrCreateYearDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"yearDayScheduleRules_" modelProtocol:@"MKFYearDayScheduleRule" keyValue:a3 createdNew:a4];
}

- (NSArray)yearDayScheduleRules
{
  v2 = [(_MKFInvitation *)self valueForKey:@"yearDayScheduleRules_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (void)removeWeekDayScheduleRulesObject:(id)a3
{
}

- (void)addWeekDayScheduleRulesObject:(id)a3
{
}

- (id)findWeekDayScheduleRulesRelationWithModelID:(id)a3
{
  return [(NSManagedObject *)self mkf_findRelationOnProperty:@"weekDayScheduleRules_" modelProtocol:@"MKFWeekDayScheduleRule" keyValue:a3];
}

- (id)materializeOrCreateWeekDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return [(NSManagedObject *)self mkf_materializeOrCreateRelationOnProperty:@"weekDayScheduleRules_" modelProtocol:@"MKFWeekDayScheduleRule" keyValue:a3 createdNew:a4];
}

- (NSArray)weekDayScheduleRules
{
  v2 = [(_MKFInvitation *)self valueForKey:@"weekDayScheduleRules_"];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (MKFInvitationDatabaseID)databaseID
{
  v2 = [(MKFObjectDatabaseID *)[MKFInvitationDatabaseID alloc] initWithMKFObject:self];
  return v2;
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
    v7 = [v4 weekDayRules];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66___MKFInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke;
    v11[3] = &unk_264A23280;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

    v8 = [v5 yearDayRules];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66___MKFInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke_6;
    v10[3] = &unk_264A232A8;
    v10[4] = self;
    v10[5] = &v12;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

    BOOL v6 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (id)restrictedGuestSchedule
{
  v3 = [(_MKFInvitation *)self weekDayScheduleRules];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_38601);

  v5 = [(_MKFInvitation *)self yearDayScheduleRules];
  BOOL v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_3_38602);

  v7 = (void *)[objc_alloc(MEMORY[0x263F0E6E0]) initWithWeekDayRules:v4 yearDayRules:v6];
  return v7;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFInvitation"];
}

@end