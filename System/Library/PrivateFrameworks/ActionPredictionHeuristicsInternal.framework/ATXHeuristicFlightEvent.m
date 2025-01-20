@interface ATXHeuristicFlightEvent
- (id)heuristicResultWithEnvironment:(id)a3;
- (id)permanentRefreshTriggers;
@end

@implementation ATXHeuristicFlightEvent

- (id)permanentRefreshTriggers
{
  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v2 initWithNotification:*MEMORY[0x1E4F25460] type:0];
  v4 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXTravelTimeUpdated" type:0];
  v5 = [[ATXInformationHeuristicRefreshNotitifcationTrigger alloc] initWithNotification:@"ATXCellularEnabledNotification" type:0];
  v6 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v7 = [(ATXInformationHeuristicRefreshNotitifcationTrigger *)v6 initWithNotification:*MEMORY[0x1E4F1C4F8] type:0];
  v8 = (void *)MEMORY[0x1D25F43D0]();
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v3, v4, v5, v7, 0);

  return v9;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = (void *)MEMORY[0x1D25F43D0]();
  v7 = [v3 heuristicDevice];
  v8 = +[ATXHeuristicUpcomingFlightEventUtilities suggestionsForFlightsWithHeuristicDevice:v7];

  v9 = [v8 suggestions];
  [v4 addObjectsFromArray:v9];

  v10 = [v8 additionalRefreshTriggers];
  [v5 unionSet:v10];

  v11 = (void *)MEMORY[0x1D25F43D0]();
  v12 = [v3 heuristicDevice];
  v13 = +[ATXHeuristicOngoingFlightEventUtilities suggestionsForFlightsWithHeuristicDevice:v12];

  v14 = [v13 suggestions];
  [v4 addObjectsFromArray:v14];

  v15 = [v13 additionalRefreshTriggers];
  [v5 unionSet:v15];

  v16 = (void *)MEMORY[0x1D25F43D0]();
  v17 = [v3 heuristicDevice];
  v18 = +[ATXHeuristicConcludedFlightEventUtilities suggestionsForFlightsWithHeuristicDevice:v17];

  v19 = [v18 suggestions];
  [v4 addObjectsFromArray:v19];

  v20 = [v18 additionalRefreshTriggers];
  [v5 unionSet:v20];

  v21 = [ATXInformationHeuristicRefreshTimeTrigger alloc];
  v22 = [v3 heuristicDevice];
  v23 = [v22 now];
  v24 = [v23 dateByAddingTimeInterval:7200.0];
  v25 = [(ATXInformationHeuristicRefreshTimeTrigger *)v21 initWithFireDate:v24];

  [v5 addObject:v25];
  v26 = [[ATXContextHeuristicResult alloc] initWithSuggestions:v4 additionalRefreshTriggers:v5];

  return v26;
}

@end