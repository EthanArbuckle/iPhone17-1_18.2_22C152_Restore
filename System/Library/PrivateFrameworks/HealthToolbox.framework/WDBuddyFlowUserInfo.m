@interface WDBuddyFlowUserInfo
+ (id)buddyFlowUserInfoWithDemographicsInformation:(id)a3;
- (NSDateComponents)dateOfBirthComponents;
- (NSNumber)heightInCm;
- (NSNumber)originalHeightInCm;
- (NSNumber)originalWeightInKg;
- (NSNumber)sex;
- (NSNumber)weightInKg;
- (NSString)firstName;
- (NSString)lastName;
- (WDBuddyFlowUserInfo)init;
- (WDBuddyFlowUserInfoDelegate)delegate;
- (id)_createDateOfBirthEntryItem;
- (id)_createSexEntryItem;
- (id)_dataEntryItemForRegistrantField:(unint64_t)a3;
- (id)_todayBirthdayDateComponents;
- (id)defaultDataEntryItems;
- (void)dataEntryItemDidUpdateValue:(id)a3;
- (void)saveChangesToHealthStore:(id)a3 andSaveNameCompletion:(id)a4 andOverallCompletion:(id)a5;
- (void)setDateOfBirthComponents:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHeightInCm:(id)a3;
- (void)setLastName:(id)a3;
- (void)setOriginalHeightInCm:(id)a3;
- (void)setOriginalWeightInKg:(id)a3;
- (void)setSex:(id)a3;
- (void)setWeightInKg:(id)a3;
@end

@implementation WDBuddyFlowUserInfo

- (WDBuddyFlowUserInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)WDBuddyFlowUserInfo;
  v2 = [(WDBuddyFlowUserInfo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    dataEntryItems = v2->_dataEntryItems;
    v2->_dataEntryItems = (NSMutableDictionary *)v3;

    uint64_t v5 = HKCreateSerialDispatchQueueWithQOSClass();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)buddyFlowUserInfoWithDemographicsInformation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WDBuddyFlowUserInfo);
  uint64_t v5 = [v3 firstName];
  [(WDBuddyFlowUserInfo *)v4 setFirstName:v5];

  v6 = [v3 lastName];
  [(WDBuddyFlowUserInfo *)v4 setLastName:v6];

  v7 = [v3 dateOfBirthComponents];
  [(WDBuddyFlowUserInfo *)v4 setDateOfBirthComponents:v7];

  objc_super v8 = NSNumber;
  v9 = [v3 biologicalSexObject];
  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "biologicalSex"));
  [(WDBuddyFlowUserInfo *)v4 setSex:v10];

  v11 = NSNumber;
  v12 = [v3 heightQuantity];
  v13 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
  [v12 doubleValueForUnit:v13];
  v14 = objc_msgSend(v11, "numberWithDouble:");

  v15 = NSNumber;
  v16 = [v3 weightQuantity];

  v17 = [MEMORY[0x263F0A830] gramUnitWithMetricPrefix:9];
  [v16 doubleValueForUnit:v17];
  v18 = objc_msgSend(v15, "numberWithDouble:");

  [(WDBuddyFlowUserInfo *)v4 setOriginalHeightInCm:v14];
  [(WDBuddyFlowUserInfo *)v4 setOriginalWeightInKg:v18];
  if (v14)
  {
    [v14 doubleValue];
    if (v19 > 0.0) {
      [(WDBuddyFlowUserInfo *)v4 setHeightInCm:v14];
    }
  }
  if (v18)
  {
    [v18 doubleValue];
    if (v20 > 0.0) {
      [(WDBuddyFlowUserInfo *)v4 setWeightInKg:v18];
    }
  }

  return v4;
}

- (id)defaultDataEntryItems
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(MEMORY[0x263F08A68]);
  unsigned int v5 = [v4 isGivenNameFirst];
  uint64_t v6 = v5;
  v7 = [(WDBuddyFlowUserInfo *)self _dataEntryItemForRegistrantField:v5 ^ 1];
  [v3 addObject:v7];

  objc_super v8 = [(WDBuddyFlowUserInfo *)self _dataEntryItemForRegistrantField:v6];
  [v3 addObject:v8];

  v9 = [(WDBuddyFlowUserInfo *)self _dataEntryItemForRegistrantField:2];
  [v3 addObject:v9];

  v10 = [(WDBuddyFlowUserInfo *)self _dataEntryItemForRegistrantField:3];
  [v3 addObject:v10];

  v11 = [(WDBuddyFlowUserInfo *)self _dataEntryItemForRegistrantField:4];
  [v3 addObject:v11];

  v12 = [(WDBuddyFlowUserInfo *)self _dataEntryItemForRegistrantField:5];
  [v3 addObject:v12];

  return v3;
}

- (void)saveChangesToHealthStore:(id)a3 andSaveNameCompletion:(id)a4 andOverallCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v30 = a5;
  v10 = [MEMORY[0x263EFF910] date];
  v11 = [(NSString *)self->_firstName hk_copyNonEmptyString];
  v12 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v13 = [v11 stringByTrimmingCharactersInSet:v12];

  v14 = [(NSString *)self->_lastName hk_copyNonEmptyString];
  v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v16 = [v14 stringByTrimmingCharactersInSet:v15];

  v17 = [MEMORY[0x263EFF9A0] dictionary];
  v18 = v17;
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x263F0ADF0]];
  }
  if (v16) {
    [v18 setObject:v16 forKeyedSubscript:*MEMORY[0x263F0ADF8]];
  }
  double v19 = dispatch_group_create();
  double v20 = [MEMORY[0x263F0A470] healthAppDefaultsDomainWithHealthStore:v8];
  dispatch_group_enter(v19);
  uint64_t v21 = *MEMORY[0x263F0AE00];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke;
  v37[3] = &unk_26458EE68;
  id v39 = v9;
  v22 = v19;
  v38 = v22;
  id v23 = v9;
  [v20 setPropertyListValue:v18 forKey:v21 completion:v37];
  dispatch_group_enter(v22);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_304;
  block[3] = &unk_26458E068;
  block[4] = self;
  id v34 = v8;
  id v35 = v10;
  v36 = v22;
  v25 = v22;
  id v26 = v10;
  id v27 = v8;
  dispatch_async(queue, block);
  v28 = self->_queue;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_310;
  v31[3] = &unk_26458EE90;
  id v32 = v30;
  id v29 = v30;
  dispatch_group_notify(v25, v28, v31);
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_304(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 48);
  id v3 = (os_log_t *)MEMORY[0x263F09968];
  if (v2)
  {
    id v4 = *(void **)(a1 + 40);
    id v32 = 0;
    [v4 _setDateOfBirthComponents:v2 error:&v32];
    id v5 = v32;
    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
        __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_304_cold_2();
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) integerValue];
  id v31 = v5;
  [v6 _setBiologicalSex:v7 error:&v31];
  id v8 = v31;

  if (v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR)) {
      __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_304_cold_1();
    }
  }
  id v9 = [MEMORY[0x263EFF980] array];
  [*(id *)(*(void *)(a1 + 32) + 64) doubleValue];
  double v11 = v10;
  [*(id *)(*(void *)(a1 + 32) + 80) doubleValue];
  double v13 = vabdd_f64(v11, v12);
  [*(id *)(*(void *)(a1 + 32) + 72) doubleValue];
  double v15 = v14;
  [*(id *)(*(void *)(a1 + 32) + 88) doubleValue];
  double v17 = vabdd_f64(v15, v16);
  if (v13 > 0.00000011920929)
  {
    v18 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09E50]];
    double v19 = (void *)MEMORY[0x263F0A630];
    double v20 = [MEMORY[0x263F0A830] meterUnitWithMetricPrefix:5];
    [*(id *)(*(void *)(a1 + 32) + 64) doubleValue];
    uint64_t v21 = objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);

    v22 = [MEMORY[0x263F0A648] quantitySampleWithType:v18 quantity:v21 startDate:*(void *)(a1 + 48) endDate:*(void *)(a1 + 48)];
    [v9 addObject:v22];
  }
  if (v17 > 0.00000011920929)
  {
    id v23 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09C38]];
    v24 = (void *)MEMORY[0x263F0A630];
    v25 = [MEMORY[0x263F0A830] gramUnitWithMetricPrefix:9];
    [*(id *)(*(void *)(a1 + 32) + 72) doubleValue];
    id v26 = objc_msgSend(v24, "quantityWithUnit:doubleValue:", v25);

    id v27 = [MEMORY[0x263F0A648] quantitySampleWithType:v23 quantity:v26 startDate:*(void *)(a1 + 48) endDate:*(void *)(a1 + 48)];
    [v9 addObject:v27];
  }
  if ([v9 count])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    v28 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_308;
    v29[3] = &unk_26458DC48;
    id v30 = *(id *)(a1 + 56);
    [v28 saveObjects:v9 withCompletion:v29];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_308(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_ERROR)) {
      __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_308_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_dataEntryItemForRegistrantField:(unint64_t)a3
{
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v6 = [(NSMutableDictionary *)self->_dataEntryItems objectForKeyedSubscript:v5];
  if (!v6)
  {
    switch(a3)
    {
      case 0uLL:
        id v7 = objc_alloc(MEMORY[0x263F46988]);
        id v8 = WDBundle();
        id v9 = [v8 localizedStringForKey:@"FIRST_NAME" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
        double v10 = [(WDBuddyFlowUserInfo *)self firstName];
        uint64_t v6 = (void *)[v7 initWithTitle:v9 registrantModelKey:@"firstName" defaultText:v10 intention:0];

        double v11 = @"FirstNameEntry";
        goto LABEL_11;
      case 1uLL:
        id v12 = objc_alloc(MEMORY[0x263F46988]);
        double v13 = WDBundle();
        double v14 = [v13 localizedStringForKey:@"LAST_NAME" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
        double v15 = [(WDBuddyFlowUserInfo *)self lastName];
        uint64_t v6 = (void *)[v12 initWithTitle:v14 registrantModelKey:@"lastName" defaultText:v15 intention:2];

        double v11 = @"LastNameEntry";
        goto LABEL_11;
      case 2uLL:
        double v16 = [(WDBuddyFlowUserInfo *)self _createDateOfBirthEntryItem];
        uint64_t v6 = v16;
        double v17 = @"DateOfBirthEntry";
        goto LABEL_8;
      case 3uLL:
        double v16 = [(WDBuddyFlowUserInfo *)self _createSexEntryItem];
        uint64_t v6 = v16;
        double v17 = @"SexEntry";
LABEL_8:
        [v16 setAccessibilityIdentifier:v17];
        break;
      case 4uLL:
        id v18 = objc_alloc(MEMORY[0x263F46978]);
        double v19 = WDBundle();
        double v20 = [v19 localizedStringForKey:@"HEIGHT" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
        uint64_t v21 = [(WDBuddyFlowUserInfo *)self heightInCm];
        uint64_t v6 = (void *)[v18 initWithTitle:v20 registrantModelKey:@"heightInCm" heightInCm:v21 defaultHeightInCm:0];

        double v11 = @"HeightEntry";
        goto LABEL_11;
      case 5uLL:
        id v22 = objc_alloc(MEMORY[0x263F46990]);
        id v23 = WDBundle();
        v24 = [v23 localizedStringForKey:@"WEIGHT" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
        v25 = [(WDBuddyFlowUserInfo *)self weightInKg];
        uint64_t v6 = (void *)[v22 initWithTitle:v24 registrantModelKey:@"weightInKg" weightInKg:v25 defaultWeightInKg:0];

        double v11 = @"WeightEntry";
LABEL_11:
        [v6 setAccessibilityIdentifier:v11];
        [v6 setDelegate:self];
        break;
      default:
        uint64_t v6 = 0;
        break;
    }
    [v6 setPlaceholderType:0];
    [(NSMutableDictionary *)self->_dataEntryItems setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (id)_createDateOfBirthEntryItem
{
  uint64_t v3 = [(WDBuddyFlowUserInfo *)self _todayBirthdayDateComponents];
  id v4 = [MEMORY[0x263F46970] gregorianGMTCalendar];
  double v15 = (void *)v3;
  id v5 = [v4 dateFromComponents:v3];
  uint64_t v6 = [v4 dateByAddingUnit:4 value:-130 toDate:v5 options:0];
  id v7 = [v4 dateByAddingUnit:4 value:-30 toDate:v5 options:0];
  if (self->_dateOfBirthComponents)
  {
    id v8 = objc_msgSend(v4, "dateFromComponents:");
  }
  else
  {
    id v8 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x263F46970]);
  double v10 = HKHealthKitFrameworkBundle();
  double v11 = [v10 localizedStringForKey:@"DATE_OF_BIRTH" value:&stru_26D2EA890 table:*MEMORY[0x263F09880]];
  id v12 = [MEMORY[0x263F46A50] valueRangeWithMinValue:v6 maxValue:v5];
  double v13 = (void *)[v9 initWithTitle:v11 registrantModelKey:@"dateOfBirthComponents" date:v8 defaultDate:v7 dateRange:v12 exportFormatter:0];

  [v13 setDelegate:self];

  return v13;
}

- (id)_createSexEntryItem
{
  v19[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = WDBundle();
  id v4 = [v3 localizedStringForKey:@"BIOLOGICAL_SEX_NOT_SET" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v19[0] = v4;
  id v5 = WDBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"FEMALE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v19[1] = v6;
  id v7 = WDBundle();
  id v8 = [v7 localizedStringForKey:@"MALE" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v19[2] = v8;
  id v9 = WDBundle();
  double v10 = [v9 localizedStringForKey:@"OTHER" value:&stru_26D2EA890 table:@"WellnessDashboard-Localizable"];
  v19[3] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];

  id v12 = [(WDBuddyFlowUserInfo *)self sex];
  if ([v12 isEqualToNumber:&unk_26D2FD398])
  {
    double v13 = 0;
  }
  else
  {
    double v13 = [(WDBuddyFlowUserInfo *)self sex];
  }

  id v14 = objc_alloc(MEMORY[0x263F46980]);
  double v15 = HKHealthKitFrameworkBundle();
  double v16 = [v15 localizedStringForKey:@"BIOLOGICAL_SEX" value:&stru_26D2EA890 table:*MEMORY[0x263F09880]];
  double v17 = (void *)[v14 initWithTitle:v16 registrantModelKey:@"sex" choices:&unk_26D2FD5F0 choiceDisplayNames:v11 defaultChoice:v13];

  [v17 setDelegate:self];

  return v17;
}

- (id)_todayBirthdayDateComponents
{
  uint64_t v2 = [MEMORY[0x263F46970] gregorianGMTCalendar];
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  id v4 = objc_msgSend(v2, "hk_dateOfBirthDateComponentsWithDate:", v3);

  return v4;
}

- (void)dataEntryItemDidUpdateValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = [a3 formattedKeyAndValue];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        double v10 = [v4 objectForKeyedSubscript:v9];
        double v11 = [(WDBuddyFlowUserInfo *)self valueForKey:v9];
        if (([v10 isEqual:v11] & 1) == 0) {
          [(WDBuddyFlowUserInfo *)self setValue:v10 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (WDBuddyFlowUserInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WDBuddyFlowUserInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSDateComponents)dateOfBirthComponents
{
  return self->_dateOfBirthComponents;
}

- (void)setDateOfBirthComponents:(id)a3
{
}

- (NSNumber)sex
{
  return self->_sex;
}

- (void)setSex:(id)a3
{
}

- (NSNumber)heightInCm
{
  return self->_heightInCm;
}

- (void)setHeightInCm:(id)a3
{
}

- (NSNumber)weightInKg
{
  return self->_weightInKg;
}

- (void)setWeightInKg:(id)a3
{
}

- (NSNumber)originalHeightInCm
{
  return self->_originalHeightInCm;
}

- (void)setOriginalHeightInCm:(id)a3
{
}

- (NSNumber)originalWeightInKg
{
  return self->_originalWeightInKg;
}

- (void)setOriginalWeightInKg:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWeightInKg, 0);
  objc_storeStrong((id *)&self->_originalHeightInCm, 0);
  objc_storeStrong((id *)&self->_weightInKg, 0);
  objc_storeStrong((id *)&self->_heightInCm, 0);
  objc_storeStrong((id *)&self->_sex, 0);
  objc_storeStrong((id *)&self->_dateOfBirthComponents, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_dataEntryItems, 0);
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to save first/last name in buddy: %@", v2, v3, v4, v5, v6);
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_304_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to save biological sex in buddy: %@", v2, v3, v4, v5, v6);
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_304_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to save date of birth in buddy: %@", v2, v3, v4, v5, v6);
}

void __91__WDBuddyFlowUserInfo_saveChangesToHealthStore_andSaveNameCompletion_andOverallCompletion___block_invoke_308_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2210D2000, v0, v1, "Failed to save height and weight samples in buddy: %@", v2, v3, v4, v5, v6);
}

@end