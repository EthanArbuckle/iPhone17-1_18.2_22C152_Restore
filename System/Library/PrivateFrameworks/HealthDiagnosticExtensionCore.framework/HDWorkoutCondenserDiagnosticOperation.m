@interface HDWorkoutCondenserDiagnosticOperation
- (id)reportFilename;
- (void)_reportCondensableWorkoutsWithTaskClient:(id)a3;
- (void)_reportCondensedWorkoutsWithTaskClient:(id)a3;
- (void)_reportWorkoutCondenserTTRValuesWithDatabase:(id)a3;
- (void)run;
@end

@implementation HDWorkoutCondenserDiagnosticOperation

- (id)reportFilename
{
  return @"WorkoutCondenser.txt";
}

- (void)run
{
  id v7 = objc_alloc_init(MEMORY[0x263F0A410]);
  v3 = (void *)[objc_alloc(MEMORY[0x263F0A910]) initWithHealthStore:v7];
  [(HDWorkoutCondenserDiagnosticOperation *)self _reportCondensedWorkoutsWithTaskClient:v3];
  [(HDWorkoutCondenserDiagnosticOperation *)self _reportCondensableWorkoutsWithTaskClient:v3];
  v4 = [(HDDiagnosticOperation *)self healthDirectoryURL];
  v5 = [v4 URLByAppendingPathComponent:@"healthdb.sqlite" isDirectory:0];

  v6 = [(HDDiagnosticOperation *)self openReadOnlyDatabaseAtURL:v5];
  [(HDWorkoutCondenserDiagnosticOperation *)self _reportWorkoutCondenserTTRValuesWithDatabase:v6];
  [v6 close];
}

- (void)_reportCondensedWorkoutsWithTaskClient:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __80__HDWorkoutCondenserDiagnosticOperation__reportCondensedWorkoutsWithTaskClient___block_invoke;
  v11 = &unk_264867250;
  v12 = self;
  v6 = v5;
  v13 = v6;
  [v4 condensedWorkoutsWithCompletion:&v8];

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting to get condensed workouts", v8, v9, v10, v11, v12];
  }
}

void __80__HDWorkoutCondenserDiagnosticOperation__reportCondensedWorkoutsWithTaskClient___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 appendString:@"Condensed Workouts"];
    [*(id *)(a1 + 32) appendStrongSeparator];
    dispatch_time_t v7 = [v5 workouts];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F0A808] formatterForCodableCondensedWorkouts];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v10 = [v5 workouts];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            [v9 appendWorkout:*(void *)(*((void *)&v17 + 1) + 8 * v14++)];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }

      v15 = *(void **)(a1 + 32);
      v16 = [v9 formattedTable];
      [v15 appendString:v16];
    }
    else
    {
      [*(id *)(a1 + 32) appendString:@"No condensed workouts found"];
    }
    [*(id *)(a1 + 32) appendNewline];
    [*(id *)(a1 + 32) appendNewline];
  }
  else
  {
    [v6 log:@"ERROR: Failed to fetch condensed workouts: %@", a3];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reportCondensableWorkoutsWithTaskClient:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __82__HDWorkoutCondenserDiagnosticOperation__reportCondensableWorkoutsWithTaskClient___block_invoke;
  uint64_t v11 = &unk_264867250;
  uint64_t v12 = self;
  v6 = v5;
  uint64_t v13 = v6;
  [v4 condensableWorkoutsWithCompletion:&v8];

  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting to get condensable workouts", v8, v9, v10, v11, v12];
  }
}

void __82__HDWorkoutCondenserDiagnosticOperation__reportCondensableWorkoutsWithTaskClient___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 appendString:@"Condensable Workouts"];
    [*(id *)(a1 + 32) appendStrongSeparator];
    dispatch_time_t v7 = [v5 workouts];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x263F0A808] formatterForCodableCondensedWorkouts];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v10 = [v5 workouts];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            [v9 appendWorkout:*(void *)(*((void *)&v17 + 1) + 8 * v14++)];
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }

      v15 = *(void **)(a1 + 32);
      v16 = [v9 formattedTable];
      [v15 appendString:v16];
    }
    else
    {
      [*(id *)(a1 + 32) appendString:@"No condensable workouts found"];
    }
    [*(id *)(a1 + 32) appendNewline];
    [*(id *)(a1 + 32) appendNewline];
  }
  else
  {
    [v6 log:@"ERROR: Failed to fetch condensable workouts: %@", a3];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reportWorkoutCondenserTTRValuesWithDatabase:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F43128];
  id v8 = 0;
  id v5 = [MEMORY[0x263F433E0] formattedPersistedValuesForDomainName:v4 database:a3 error:&v8];
  id v6 = v8;
  dispatch_time_t v7 = v6;
  if (v5)
  {
    [(HDDiagnosticOperation *)self appendNewline];
    [(HDDiagnosticOperation *)self appendFormat:@"%@", v5];
  }
  else
  {
    [(HDDiagnosticOperation *)self log:@"ERROR: Failed to get TTR values for domain \"%@\": %@", v4, v6];
  }
}

@end