@interface ACHActivitySummaryUtility
- (ACHActivitySummaryUtility)initWithProfile:(id)a3 shouldIncludePrivateProperties:(BOOL)a4;
- (BOOL)_enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4 error:(id *)a5;
- (HDActivitySummaryBuilder)summaryBuilder;
- (HDDatabaseTransactionContext)databaseContext;
- (HDProfile)profile;
- (id)newEmptyActivitySummaryFromSummary:(id)a3;
- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4;
- (void)setDatabaseContext:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSummaryBuilder:(id)a3;
@end

@implementation ACHActivitySummaryUtility

- (ACHActivitySummaryUtility)initWithProfile:(id)a3 shouldIncludePrivateProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACHActivitySummaryUtility;
  v7 = [(ACHActivitySummaryUtility *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    uint64_t v9 = [objc_alloc(MEMORY[0x263F43140]) initWithProfile:v6];
    summaryBuilder = v8->_summaryBuilder;
    v8->_summaryBuilder = (HDActivitySummaryBuilder *)v9;

    [(HDActivitySummaryBuilder *)v8->_summaryBuilder setShouldIncludePrivateProperties:v4];
  }

  return v8;
}

- (void)setDatabaseContext:(id)a3
{
}

- (HDDatabaseTransactionContext)databaseContext
{
  return (HDDatabaseTransactionContext *)[(HDActivitySummaryBuilder *)self->_summaryBuilder databaseTransactionContext];
}

- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4
{
  uint64_t v4 = 0;
  [(ACHActivitySummaryUtility *)self _enumerateActivitySummariesForDateComponentInterval:a3 handler:a4 error:&v4];
}

- (BOOL)_enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 startDateComponents];
  v11 = [v9 endDateComponents];

  objc_super v12 = HDActivityCacheEntityPredicateForCachesInDateComponentsRange();

  v13 = [(ACHActivitySummaryUtility *)self summaryBuilder];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __95__ACHActivitySummaryUtility__enumerateActivitySummariesForDateComponentInterval_handler_error___block_invoke;
  v18[3] = &unk_2645177F8;
  id v14 = v8;
  id v19 = v14;
  char v15 = [v13 enumerateActivitySummariesWithPredicate:v12 error:a5 handler:v18];

  if ((v15 & 1) == 0)
  {
    v16 = ACHLogDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ACHActivitySummaryUtility _enumerateActivitySummariesForDateComponentInterval:handler:error:]((uint64_t *)a5, v16);
    }
  }
  return v15;
}

uint64_t __95__ACHActivitySummaryUtility__enumerateActivitySummariesForDateComponentInterval_handler_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newEmptyActivitySummaryFromSummary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F0A090];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "_setActivitySummaryIndex:", objc_msgSend(v4, "_activitySummaryIndex"));
  objc_msgSend(v5, "setActivityMoveMode:", objc_msgSend(v4, "activityMoveMode"));
  id v6 = [v4 activeEnergyBurnedGoal];
  [v5 setActiveEnergyBurnedGoal:v6];

  v7 = [v4 appleMoveTimeGoal];
  [v5 setAppleMoveTimeGoal:v7];

  id v8 = [v4 appleStandHoursGoal];
  [v5 setAppleStandHoursGoal:v8];

  id v9 = [v4 appleExerciseTimeGoal];

  [v5 setAppleExerciseTimeGoal:v9];
  return v5;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDActivitySummaryBuilder)summaryBuilder
{
  return self->_summaryBuilder;
}

- (void)setSummaryBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryBuilder, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_enumerateActivitySummariesForDateComponentInterval:(uint64_t *)a1 handler:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error enumerating activity summaries: %@", (uint8_t *)&v3, 0xCu);
}

@end