@interface FIUIWeeklyGoalModel
- (FIUIWeeklyGoalModel)init;
- (FIUIWeeklyGoalModel)initWithHealthStore:(id)a3;
- (void)fetchMostRecentWeeklyGoalWithCompletion:(id)a3;
- (void)saveNewWeeklyGoal:(id)a3 forDate:(id)a4;
- (void)saveNewWeeklyGoal:(id)a3 forDate:(id)a4 completion:(id)a5;
- (void)saveNewWeeklyGoal:(id)a3 quantityType:(id)a4 forDate:(id)a5 completion:(id)a6;
- (void)saveNewWeeklyGoals:(id)a3;
@end

@implementation FIUIWeeklyGoalModel

- (FIUIWeeklyGoalModel)init
{
  return [(FIUIWeeklyGoalModel *)self initWithHealthStore:0];
}

- (FIUIWeeklyGoalModel)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWeeklyGoalModel;
  v6 = [(FIUIWeeklyGoalModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_healthStore, a3);
  }

  return v7;
}

- (void)fetchMostRecentWeeklyGoalWithCompletion:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F08A98];
    v6 = [MEMORY[0x263EFF910] date];
    v7 = [v5 predicateWithFormat:@"startDate <= %@", v6];

    v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:*MEMORY[0x263F09F88] ascending:0];
    id v9 = objc_alloc(MEMORY[0x263F0A6E0]);
    v10 = [MEMORY[0x263F0A598] calorieGoal];
    v15[0] = v8;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__FIUIWeeklyGoalModel_fetchMostRecentWeeklyGoalWithCompletion___block_invoke;
    v13[3] = &unk_2644A8788;
    id v14 = v4;
    v12 = (void *)[v9 initWithSampleType:v10 predicate:v7 limit:1 sortDescriptors:v11 resultsHandler:v13];

    [(HKHealthStore *)self->_healthStore executeQuery:v12];
  }
}

void __63__FIUIWeeklyGoalModel_fetchMostRecentWeeklyGoalWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v8 = [a3 lastObject];
  v7 = [v8 quantity];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveNewWeeklyGoal:(id)a3 forDate:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0A598];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 calorieGoal];
  [(FIUIWeeklyGoalModel *)self saveNewWeeklyGoal:v8 quantityType:v9 forDate:v7 completion:0];
}

- (void)saveNewWeeklyGoal:(id)a3 forDate:(id)a4 completion:(id)a5
{
  id v8 = (void *)MEMORY[0x263F0A598];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 calorieGoal];
  [(FIUIWeeklyGoalModel *)self saveNewWeeklyGoal:v11 quantityType:v12 forDate:v10 completion:v9];
}

- (void)saveNewWeeklyGoal:(id)a3 quantityType:(id)a4 forDate:(id)a5 completion:(id)a6
{
  v18[1] = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = [MEMORY[0x263F0A648] quantitySampleWithType:a4 quantity:a3 startDate:a5 endDate:a5];
  _HKInitializeLogging();
  id v12 = (void *)*MEMORY[0x263F098C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F098C8], OS_LOG_TYPE_DEBUG)) {
    -[FIUIWeeklyGoalModel saveNewWeeklyGoal:quantityType:forDate:completion:](v12, (uint64_t)v11, (uint64_t)self);
  }
  healthStore = self->_healthStore;
  v18[0] = v11;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke;
  v16[3] = &unk_2644A87D8;
  id v17 = v10;
  id v15 = v10;
  [(HKHealthStore *)healthStore saveObjects:v14 withCompletion:v16];
}

void __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2;
  v8[3] = &unk_2644A87B0;
  char v10 = a2;
  id v6 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v6);
  }
}

void __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F098C8];
  id v4 = *MEMORY[0x263F098C8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21E433000, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved new weekly goal", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2_cold_1(a1, v3);
  }
}

- (void)saveNewWeeklyGoals:(id)a3
{
}

void __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2;
  v6[3] = &unk_2644A87B0;
  char v8 = a2;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F098C8];
  id v4 = *MEMORY[0x263F098C8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21E433000, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved new weekly goal", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2_cold_1(a1, v3);
  }
}

- (void).cxx_destruct
{
}

- (void)saveNewWeeklyGoal:(uint64_t)a3 quantityType:forDate:completion:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v5 = HKLogSafeDescription();
  uint64_t v6 = *(void *)(a3 + 8);
  int v7 = 138412546;
  char v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_21E433000, v4, OS_LOG_TYPE_DEBUG, "Saving weekly goal, quantity sample = %@. healthStore = %@", (uint8_t *)&v7, 0x16u);
}

void __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "Could not save weekly goal to HealthKit database: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E433000, a2, OS_LOG_TYPE_ERROR, "Could not save weekly goals to HealthKit database: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end