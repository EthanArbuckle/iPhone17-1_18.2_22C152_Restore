@interface MKFCKOutgoingInvitation
+ (id)fetchRequest;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
@end

@implementation MKFCKOutgoingInvitation

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (![(MKFCKModel *)self copyPropertiesFromLocalModel:v7 context:v8]) {
    goto LABEL_19;
  }
  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  BOOL v12 = self != 0;
  if (self)
  {
    v13 = [v9 pendingUser];
    if (v13)
    {
      v14 = +[MKFCKModel fetchWithLocalModel:v13 context:v11];
      if (v14)
      {
        v15 = [(MKFCKOutgoingInvitation *)self pendingUser];

        if (v15 != v14)
        {
          context = (void *)MEMORY[0x230FBD990]();
          v16 = self;
          v17 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v28 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v33 = v28;
            __int16 v34 = 2112;
            id v35 = v14;
            __int16 v36 = 2112;
            v37 = v16;
            _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Linking user [%@] to invitation : [%@]", buf, 0x20u);
          }
          [(MKFCKOutgoingInvitation *)v16 setPendingUser:v14];
        }
      }
      else
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        v18 = self;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v33 = v29;
          __int16 v34 = 2112;
          id v35 = v9;
          __int16 v36 = 2112;
          v37 = v13;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between outgoing invitation and pending user yet: %@.pendingUser = %@", buf, 0x20u);
        }
      }
    }
    if (-[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:context:](self, v9, @"allowedAccessories_", v11))
    {
      v20 = [v9 weekDayScheduleRules];
      uint64_t v21 = [(MKFCKOutgoingInvitation *)self guestWeekDayScheduleRules];
      v22 = +[MKFCKGuest _dictionaryRepresentationFromWeekDayScheduleRules:v20 cloudWeekDayScheduleRulesDictionary:v21];

      v23 = [(MKFCKOutgoingInvitation *)self guestWeekDayScheduleRules];
      LOBYTE(v21) = HMFEqualObjects();

      if ((v21 & 1) == 0) {
        [(MKFCKOutgoingInvitation *)self setGuestWeekDayScheduleRules:v22];
      }

      uint64_t v24 = [v9 yearDayScheduleRules];
      v25 = [(MKFCKOutgoingInvitation *)self guestYearDayScheduleRules];
      id v9 = +[MKFCKGuest _dictionaryRepresentationFromYearDayScheduleRules:v24 cloudYearDayScheduleRulesDictionary:v25];

      v26 = [(MKFCKOutgoingInvitation *)self guestYearDayScheduleRules];
      LOBYTE(v24) = HMFEqualObjects();

      if ((v24 & 1) == 0) {
        [(MKFCKOutgoingInvitation *)self setGuestYearDayScheduleRules:v9];
      }
      goto LABEL_18;
    }
LABEL_19:
    BOOL v12 = 0;
    goto LABEL_20;
  }

LABEL_18:
LABEL_20:

  return v12;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (![(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:v8]) {
    goto LABEL_18;
  }
  id v9 = v7;
  id v10 = v8;
  if (self)
  {
    v11 = [(MKFCKOutgoingInvitation *)self pendingUser];
    if (v11)
    {
      BOOL v12 = [(MKFCKOutgoingInvitation *)self pendingUser];
      v13 = [v12 fetchLocalModelWithContext:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
      id v15 = v14;

      if (v15)
      {
        id v16 = [v9 pendingUser];

        if (v16 != v15) {
          [v9 setPendingUser:v15];
        }
      }
      else
      {
        v17 = (void *)MEMORY[0x230FBD990]();
        v18 = self;
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = v31 = v17;
          *(_DWORD *)buf = 138543874;
          v33 = v20;
          __int16 v34 = 2112;
          id v35 = v18;
          __int16 v36 = 2112;
          uint64_t v37 = 0;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship between outgoing invitation and pending user yet: %@.pendingUser = %@", buf, 0x20u);

          v17 = v31;
        }
      }
    }
    if (-[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:context:](self, v9, @"allowedAccessories_", v10))
    {
      id v21 = v10;
      id v22 = v9;
      v23 = [v22 entity];
      uint64_t v24 = [v23 relationshipsByName];
      v25 = [v24 objectForKeyedSubscript:@"weekDayScheduleRules_"];
      BOOL v26 = +[MKFCKGuest _importWeekDayScheduleRulesIntoLocalModel:v22 fromCloudModel:self localRelationship:v25 cloudAttributeName:@"guestWeekDayScheduleRules" parentRelationshipName:@"invitation" context:v21];

      if (v26)
      {
        id v27 = v21;
        id v28 = v22;
        id v9 = [v28 entity];
        id v10 = [v9 relationshipsByName];
        v29 = [v10 objectForKeyedSubscript:@"yearDayScheduleRules_"];
        LOBYTE(self) = +[MKFCKGuest _importYearDayScheduleRulesIntoLocalModel:v28 fromCloudModel:self localRelationship:v29 cloudAttributeName:@"guestYearDayScheduleRules" parentRelationshipName:@"invitation" context:v27];

        goto LABEL_17;
      }
    }
LABEL_18:
    LOBYTE(self) = 0;
    goto LABEL_19;
  }
LABEL_17:

LABEL_19:
  return (char)self;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKOutgoingInvitation"];
}

@end