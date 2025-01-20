@interface _CDInteractionHarvester
- (id)harvestInteractionsBetweenStartDate:(id)a3 endDate:(id)a4;
@end

@implementation _CDInteractionHarvester

- (id)harvestInteractionsBetweenStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  context = (void *)MEMORY[0x192FB2F20]();
  v7 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteractionHarvester harvestInteractionsBetweenStartDate:endDate:](v5, v6, v7);
  }

  v8 = +[_CDSpotlightItemUtils querySpotlightItemsWithStartDate:v5 endDate:v6 getMail:1 getMessages:1];
  v9 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteractionHarvester harvestInteractionsBetweenStartDate:endDate:](v8);
  }

  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v11 = NSUserName();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = +[_CDSpotlightItemUtils interactionForSearchableItem:*(void *)(*((void *)&v21 + 1) + 8 * i) nsUserName:v11];
        if (v17) {
          [v10 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  v18 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteractionHarvester harvestInteractionsBetweenStartDate:endDate:](v10);
  }

  return v10;
}

- (void)harvestInteractionsBetweenStartDate:(void *)a1 endDate:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%lu items were valid interactions", v3, v4, v5, v6, 0);
}

- (void)harvestInteractionsBetweenStartDate:(void *)a1 endDate:.cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "Converting %lu items into interactions", v3, v4, v5, v6, 0);
}

- (void)harvestInteractionsBetweenStartDate:(NSObject *)a3 endDate:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a1 timeIntervalSinceNow];
  double v6 = v5 / -86400.0;
  [a2 timeIntervalSinceNow];
  int v8 = 134218240;
  double v9 = v6;
  __int16 v10 = 2048;
  double v11 = v7 / -86400.0;
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "Harvesting Mail and Message data between %2.1f  and %2.1f  days ago", (uint8_t *)&v8, 0x16u);
}

@end