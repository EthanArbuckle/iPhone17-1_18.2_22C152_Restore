@interface MKFCKGuest
+ (BOOL)_importWeekDayScheduleRulesIntoLocalModel:(id)a3 fromCloudModel:(id)a4 localRelationship:(id)a5 cloudAttributeName:(id)a6 parentRelationshipName:(id)a7 context:(id)a8;
+ (BOOL)_importYearDayScheduleRulesIntoLocalModel:(id)a3 fromCloudModel:(id)a4 localRelationship:(id)a5 cloudAttributeName:(id)a6 parentRelationshipName:(id)a7 context:(id)a8;
+ (id)_dictionaryRepresentationFromWeekDayScheduleRules:(id)a3 cloudWeekDayScheduleRulesDictionary:(id)a4;
+ (id)_dictionaryRepresentationFromYearDayScheduleRules:(id)a3 cloudYearDayScheduleRulesDictionary:(id)a4;
+ (id)fetchRequest;
- (BOOL)_exportAllowedAccessoriesRelationshipFromGuestLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportGuestAccessCodeFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportWeekDaySchedulesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_exportYearDaySchedulesFromLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importAllowedAccessoriesRelationshipIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importGuestAccessCodeIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importWeekDayScheduleRulesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)_importYearDayScheduleRulesIntoLocalModel:(id)a3 context:(id)a4;
- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5;
@end

@implementation MKFCKGuest

+ (id)_dictionaryRepresentationFromYearDayScheduleRules:(id)a3 cloudYearDayScheduleRulesDictionary:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a3;
  v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __100__MKFCKGuest__dictionaryRepresentationFromYearDayScheduleRules_cloudYearDayScheduleRulesDictionary___block_invoke;
  v14 = &unk_264A17770;
  id v15 = v7;
  id v16 = a1;
  id v8 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);

  v9 = objc_msgSend(v8, "allObjects", v11, v12, v13, v14);

  return v9;
}

void __100__MKFCKGuest__dictionaryRepresentationFromYearDayScheduleRules_cloudYearDayScheduleRulesDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isValid])
  {
    v4 = [v3 dictionaryRepresentation];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      v9 = [v3 debugDescription];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot export yearDayRule as it is not valid : %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

+ (id)_dictionaryRepresentationFromWeekDayScheduleRules:(id)a3 cloudWeekDayScheduleRulesDictionary:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = a3;
  v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __100__MKFCKGuest__dictionaryRepresentationFromWeekDayScheduleRules_cloudWeekDayScheduleRulesDictionary___block_invoke;
  uint64_t v14 = &unk_264A17748;
  id v15 = v7;
  id v16 = a1;
  id v8 = v7;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);

  v9 = objc_msgSend(v8, "allObjects", v11, v12, v13, v14);

  return v9;
}

void __100__MKFCKGuest__dictionaryRepresentationFromWeekDayScheduleRules_cloudWeekDayScheduleRulesDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isValid])
  {
    v4 = [v3 dictionaryRepresentation];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      v9 = [v3 debugDescription];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot export weekDayRule as it is not valid : %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

+ (BOOL)_importYearDayScheduleRulesIntoLocalModel:(id)a3 fromCloudModel:(id)a4 localRelationship:(id)a5 cloudAttributeName:(id)a6 parentRelationshipName:(id)a7 context:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a5;
  v17 = [a4 valueForKey:a6];
  v18 = [v16 name];

  v19 = [v13 valueForKey:v18];

  v20 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke;
  v40[3] = &unk_264A176F8;
  id v22 = v21;
  id v41 = v22;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v40);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2;
  v34[3] = &unk_264A187A0;
  id v35 = v22;
  id v23 = v15;
  id v36 = v23;
  id v37 = v13;
  id v38 = v14;
  id v24 = v20;
  id v39 = v24;
  id v25 = v14;
  id v26 = v13;
  id v27 = v22;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3;
  v31[3] = &unk_264A17720;
  id v32 = v24;
  id v33 = v23;
  id v28 = v23;
  id v29 = v24;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

  return 1;
}

void __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = (void *)[v3 copy];
  id v6 = +[_MKFYearDayScheduleRule populateYearDayScheduleRuleFromDictionary:v4 existingLocalModels:v5 context:*(void *)(a1 + 40)];

  if (v6)
  {
    [v6 setValue:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
    [*(id *)(a1 + 64) addObject:v6];
  }
}

void __139__MKFCKGuest__importYearDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) deleteObject:v3];
  }
}

+ (BOOL)_importWeekDayScheduleRulesIntoLocalModel:(id)a3 fromCloudModel:(id)a4 localRelationship:(id)a5 cloudAttributeName:(id)a6 parentRelationshipName:(id)a7 context:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a5;
  v17 = [a4 valueForKey:a6];
  v18 = [v16 name];

  v19 = [v13 valueForKey:v18];

  v20 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v17, "count"));
  v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke;
  v40[3] = &unk_264A176A8;
  id v22 = v21;
  id v41 = v22;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v40);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2;
  v34[3] = &unk_264A187A0;
  id v35 = v22;
  id v23 = v15;
  id v36 = v23;
  id v37 = v13;
  id v38 = v14;
  id v24 = v20;
  id v39 = v24;
  id v25 = v14;
  id v26 = v13;
  id v27 = v22;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3;
  v31[3] = &unk_264A176D0;
  id v32 = v24;
  id v33 = v23;
  id v28 = v23;
  id v29 = v24;
  objc_msgSend(v19, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v31);

  return 1;
}

void __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 modelID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = (void *)[v3 copy];
  id v6 = +[_MKFWeekDayScheduleRule populateWeekDayScheduleRuleFromDictionary:v4 existingLocalModels:v5 context:*(void *)(a1 + 40)];

  if (v6)
  {
    [v6 setValue:*(void *)(a1 + 48) forKey:*(void *)(a1 + 56)];
    [*(id *)(a1 + 64) addObject:v6];
  }
}

void __139__MKFCKGuest__importWeekDayScheduleRulesIntoLocalModel_fromCloudModel_localRelationship_cloudAttributeName_parentRelationshipName_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) deleteObject:v3];
  }
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MKFCKModel *)self copyPropertiesFromLocalModel:v8 context:v10]
    && [(MKFCKGuest *)self _exportAllowedAccessoriesRelationshipFromGuestLocalModel:v8 context:v10]&& [(MKFCKGuest *)self _exportGuestAccessCodeFromLocalModel:v8 context:v10]&& (![(MKFCKModel *)self shouldExportUpdatedPropertyInSet:v9 name:@"weekDayScheduleRules_"]|| [(MKFCKGuest *)self _exportWeekDaySchedulesFromLocalModel:v8 context:v10]))
  {
    if ([(MKFCKModel *)self shouldExportUpdatedPropertyInSet:v9 name:@"yearDayScheduleRules_"])
    {
      BOOL v11 = [(MKFCKGuest *)self _exportYearDaySchedulesFromLocalModel:v8 context:v10];
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_exportGuestAccessCodeFromLocalModel:(id)a3 context:(id)a4
{
  v5 = [a3 accessCode];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 accessCode];
    [(MKFCKGuest *)self setHomeAccessCode:v7];
  }
  return 1;
}

- (BOOL)_exportAllowedAccessoriesRelationshipFromGuestLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHomeObject _exportSiblingRelationshipsFromLocalModel:localRelationship:context:](self, a3, @"allowedAccessories_", a4);
}

- (BOOL)_exportYearDaySchedulesFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  uint64_t v7 = [v5 yearDayScheduleRules];

  id v8 = [(MKFCKGuest *)self yearDayScheduleRules];
  id v9 = [v6 _dictionaryRepresentationFromYearDayScheduleRules:v7 cloudYearDayScheduleRulesDictionary:v8];

  id v10 = [(MKFCKGuest *)self yearDayScheduleRules];
  LOBYTE(v7) = HMFEqualObjects();

  if ((v7 & 1) == 0) {
    [(MKFCKGuest *)self setYearDayScheduleRules:v9];
  }

  return 1;
}

- (BOOL)_exportWeekDaySchedulesFromLocalModel:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  uint64_t v7 = [v5 weekDayScheduleRules];

  id v8 = [(MKFCKGuest *)self weekDayScheduleRules];
  id v9 = [v6 _dictionaryRepresentationFromWeekDayScheduleRules:v7 cloudWeekDayScheduleRulesDictionary:v8];

  id v10 = [(MKFCKGuest *)self weekDayScheduleRules];
  LOBYTE(v7) = HMFEqualObjects();

  if ((v7 & 1) == 0) {
    [(MKFCKGuest *)self setWeekDayScheduleRules:v9];
  }

  return 1;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [(MKFCKModel *)self copyPropertiesIntoLocalModel:v7 context:v8]
    && [(MKFCKGuest *)self _importAllowedAccessoriesRelationshipIntoLocalModel:v7 context:v8]&& [(MKFCKGuest *)self _importGuestAccessCodeIntoLocalModel:v7 context:v8]&& [(MKFCKGuest *)self _importWeekDayScheduleRulesIntoLocalModel:v7 context:v8]&& [(MKFCKGuest *)self _importYearDayScheduleRulesIntoLocalModel:v7 context:v8];

  return v9;
}

- (BOOL)_importGuestAccessCodeIntoLocalModel:(id)a3 context:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MKFCKGuest *)self homeAccessCode];
  uint64_t v9 = [v8 length];

  id v10 = [v6 accessCode];
  BOOL v11 = v10;
  if (v9)
  {
    if (!v10)
    {
      BOOL v11 = [[_MKFUserAccessCode alloc] initWithContext:v7];
      __int16 v12 = [(MKFCKGuest *)self modelID];
      id v13 = +[HMDUserAccessCodeModel modelUUIDWithUUID:v12];
      [(_MKFUserAccessCode *)v11 setModelID:v13];
    }
    id v14 = [(_MKFUserAccessCode *)v11 accessCode];
    id v15 = [(MKFCKGuest *)self homeAccessCode];
    char v16 = HMFEqualObjects();

    if ((v16 & 1) == 0)
    {
      v17 = [(MKFCKGuest *)self homeAccessCode];
      [(_MKFUserAccessCode *)v11 setAccessCode:v17];
    }
    v18 = [(_MKFUserAccessCode *)v11 guest];
    char v19 = HMFEqualObjects();

    if ((v19 & 1) == 0) {
      [(_MKFUserAccessCode *)v11 setGuest:v6];
    }
    v20 = [v6 accessCode];
    char v21 = HMFEqualObjects();

    if ((v21 & 1) == 0) {
      [v6 setAccessCode:v11];
    }
LABEL_14:

    goto LABEL_15;
  }

  if (v11)
  {
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      id v26 = [v6 accessCode];
      id v27 = [v6 debugDescription];
      int v29 = 138543874;
      v30 = v25;
      __int16 v31 = 2112;
      id v32 = v26;
      __int16 v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Deleting the MKFUserAccessCode %@ for Guest %@", (uint8_t *)&v29, 0x20u);
    }
    BOOL v11 = [v6 accessCode];
    [v7 deleteObject:v11];
    goto LABEL_14;
  }
LABEL_15:

  return 1;
}

- (BOOL)_importAllowedAccessoriesRelationshipIntoLocalModel:(id)a3 context:(id)a4
{
  return -[MKFCKHomeObject _importSiblingRelationshipsIntoLocalModel:localRelationship:context:](self, a3, @"allowedAccessories_", a4);
}

- (BOOL)_importYearDayScheduleRulesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  uint64_t v9 = [v7 entity];
  id v10 = [v9 relationshipsByName];
  BOOL v11 = [v10 objectForKeyedSubscript:@"yearDayScheduleRules_"];
  LOBYTE(self) = [v8 _importYearDayScheduleRulesIntoLocalModel:v7 fromCloudModel:self localRelationship:v11 cloudAttributeName:@"yearDayScheduleRules" parentRelationshipName:@"guest" context:v6];

  return (char)self;
}

- (BOOL)_importWeekDayScheduleRulesIntoLocalModel:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  uint64_t v9 = [v7 entity];
  id v10 = [v9 relationshipsByName];
  BOOL v11 = [v10 objectForKeyedSubscript:@"weekDayScheduleRules_"];
  LOBYTE(self) = [v8 _importWeekDayScheduleRulesIntoLocalModel:v7 fromCloudModel:self localRelationship:v11 cloudAttributeName:@"weekDayScheduleRules" parentRelationshipName:@"guest" context:v6];

  return (char)self;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MKFCKGuest"];
}

@end