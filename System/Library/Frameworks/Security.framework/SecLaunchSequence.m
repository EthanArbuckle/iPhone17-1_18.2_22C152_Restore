@interface SecLaunchSequence
- (BOOL)firstLaunch;
- (BOOL)launched;
- (NSBlockOperation)launchOperation;
- (NSMutableDictionary)attributes;
- (NSMutableDictionary)dependantLaunches;
- (NSMutableDictionary)events;
- (NSString)name;
- (SecLaunchSequence)initWithRocketName:(id)a3;
- (id)eventsByTime;
- (id)eventsRelativeTime;
- (id)metricsReport;
- (void)addAttribute:(id)a3 value:(id)a4;
- (void)addDependantLaunch:(id)a3 child:(id)a4;
- (void)addEvent:(id)a3;
- (void)launch;
- (void)setAttributes:(id)a3;
- (void)setDependantLaunches:(id)a3;
- (void)setEvents:(id)a3;
- (void)setFirstLaunch:(BOOL)a3;
- (void)setLaunchOperation:(id)a3;
- (void)setLaunched:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation SecLaunchSequence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependantLaunches, 0);
  objc_storeStrong((id *)&self->_launchOperation, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setDependantLaunches:(id)a3
{
}

- (NSMutableDictionary)dependantLaunches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLaunchOperation:(id)a3
{
}

- (NSBlockOperation)launchOperation
{
  return (NSBlockOperation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEvents:(id)a3
{
}

- (NSMutableDictionary)events
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLaunched:(BOOL)a3
{
  self->_launched = a3;
}

- (BOOL)launched
{
  return self->_launched;
}

- (id)eventsByTime
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(SecLaunchSequence *)obj events];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __33__SecLaunchSequence_eventsByTime__block_invoke;
  v25[3] = &unk_1E5475A50;
  id v19 = v2;
  id v26 = v19;
  id v5 = v3;
  id v27 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];

  [v5 sortUsingSelector:sel_compare_];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(SecLaunchSequence *)obj attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = NSString;
        v12 = [(SecLaunchSequence *)obj attributes];
        v13 = [v12 objectForKeyedSubscript:v10];
        v14 = [v13 description];
        v15 = [v11 stringWithFormat:@"attr: %@: %@", v10, v14, v19];
        [v5 addObject:v15];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v7);
  }

  v16 = v27;
  id v17 = v5;

  objc_sync_exit(obj);

  return v17;
}

void __33__SecLaunchSequence_eventsByTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = NSString;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v6 date];
  uint64_t v8 = [v5 stringFromDate:v7];
  v9 = [v6 name];
  uint64_t v10 = [v6 counter];

  id v11 = [v4 stringWithFormat:@"%@ - %@:%u", v8, v9, v10];

  [*(id *)(a1 + 40) addObject:v11];
}

- (id)eventsRelativeTime
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(SecLaunchSequence *)self events];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__SecLaunchSequence_eventsRelativeTime__block_invoke;
  v17[3] = &unk_1E5475AA0;
  id v18 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v17];

  [v5 sortUsingComparator:&__block_literal_global_1387];
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 date];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__SecLaunchSequence_eventsRelativeTime__block_invoke_3;
  v14[3] = &unk_1E5475AE8;
  id v15 = v7;
  id v9 = v8;
  id v16 = v9;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v14];
  id v11 = v16;
  id v12 = v9;

  return v12;
}

uint64_t __39__SecLaunchSequence_eventsRelativeTime__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __39__SecLaunchSequence_eventsRelativeTime__block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [v9 name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  id v5 = NSNumber;
  id v6 = [v9 date];
  [v6 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"time"];

  if ([v9 counter])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "counter"));
    [v3 setObject:v8 forKeyedSubscript:@"counter"];
  }
  [*(id *)(a1 + 40) addObject:v3];
}

uint64_t __39__SecLaunchSequence_eventsRelativeTime__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)launch
{
  obj = self;
  objc_sync_enter(obj);
  if (![(SecLaunchSequence *)obj launched]) {
    [(SecLaunchSequence *)obj setLaunched:1];
  }
  objc_sync_exit(obj);
}

- (id)metricsReport
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(SecLaunchSequence *)self launched])
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = [(SecLaunchSequence *)v4 dependantLaunches];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __34__SecLaunchSequence_metricsReport__block_invoke;
    v17[3] = &unk_1E5475A78;
    void v17[4] = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:v17];

    id v6 = [SecLaunchEvent alloc];
    if ([(SecLaunchSequence *)v4 firstLaunch]) {
      uint64_t v7 = @"first-launch";
    }
    else {
      uint64_t v7 = @"re-launch";
    }
    uint64_t v8 = [(SecLaunchEvent *)v6 initWithName:v7];
    id v9 = [(SecLaunchSequence *)v4 events];
    id v10 = [(SecLaunchEvent *)v8 name];
    [v9 setObject:v8 forKeyedSubscript:v10];

    id v11 = [(SecLaunchSequence *)v4 eventsRelativeTime];
    [v3 setObject:v11 forKeyedSubscript:@"events"];

    id v12 = [(SecLaunchSequence *)v4 attributes];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v14 = [(SecLaunchSequence *)v4 attributes];
      [v3 setObject:v14 forKeyedSubscript:@"attributes"];
    }
    objc_sync_exit(v4);

    id v15 = v3;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __34__SecLaunchSequence_metricsReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 launched])
  {
    uint64_t v7 = [v6 events];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__SecLaunchSequence_metricsReport__block_invoke_2;
    v13[3] = &unk_1E5475A50;
    uint64_t v8 = *(void *)(a1 + 32);
    id v14 = v5;
    uint64_t v15 = v8;
    id v9 = v5;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];

    id v10 = [v6 attributes];
    id v11 = [*(id *)(a1 + 32) attributes];
    id v12 = [NSString stringWithFormat:@"c:%@", v9];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

void __34__SecLaunchSequence_metricsReport__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v12 = (id)[a3 copy];
  id v6 = NSString;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v12 name];
  id v9 = [v6 stringWithFormat:@"c:%@-%@", v7, v8];
  [v12 setName:v9];

  id v10 = [*(id *)(a1 + 40) events];
  id v11 = [NSString stringWithFormat:@"c:%@-%@", *(void *)(a1 + 32), v5];

  [v10 setObject:v12 forKeyedSubscript:v11];
}

- (void)addEvent:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (![(SecLaunchSequence *)v4 launched])
    {
      id v5 = [(SecLaunchSequence *)v4 events];
      unint64_t v6 = [v5 count];

      if (v6 <= 0x64)
      {
        uint64_t v7 = [(SecLaunchSequence *)v4 events];
        uint64_t v8 = [v7 objectForKeyedSubscript:v10];

        if (v8) {
          [(SecLaunchEvent *)v8 setCounter:[(SecLaunchEvent *)v8 counter] + 1];
        }
        else {
          uint64_t v8 = [[SecLaunchEvent alloc] initWithName:v10];
        }
        id v9 = [(SecLaunchSequence *)v4 events];
        [v9 setObject:v8 forKeyedSubscript:v10];
      }
    }
    objc_sync_exit(v4);
  }
}

- (void)addAttribute:(id)a3 value:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    if (![(SecLaunchSequence *)v7 launched])
    {
      uint64_t v8 = [(SecLaunchSequence *)v7 attributes];

      if (!v8)
      {
        id v9 = [MEMORY[0x1E4F1CA60] dictionary];
        [(SecLaunchSequence *)v7 setAttributes:v9];
      }
      id v10 = [(SecLaunchSequence *)v7 attributes];
      [v10 setObject:v6 forKeyedSubscript:v11];
    }
    objc_sync_exit(v7);
  }
}

- (void)addDependantLaunch:(id)a3 child:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (![(SecLaunchSequence *)v7 launched])
  {
    uint64_t v8 = [(SecLaunchSequence *)v7 dependantLaunches];
    id v9 = [v8 objectForKeyedSubscript:v13];

    if (!v9)
    {
      id v10 = [(SecLaunchSequence *)v7 dependantLaunches];
      [v10 setObject:v6 forKeyedSubscript:v13];

      id v11 = [(SecLaunchSequence *)v7 launchOperation];
      id v12 = [v6 launchOperation];
      [v11 addDependency:v12];
    }
  }
  objc_sync_exit(v7);
}

- (void)setFirstLaunch:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (![(SecLaunchSequence *)obj launched]) {
    obj->_firstLaunch = a3;
  }
  objc_sync_exit(obj);
}

- (BOOL)firstLaunch
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL firstLaunch = v2->_firstLaunch;
  objc_sync_exit(v2);

  return firstLaunch;
}

- (SecLaunchSequence)initWithRocketName:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SecLaunchSequence;
  id v6 = [(SecLaunchSequence *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    events = v7->_events;
    v7->_events = (NSMutableDictionary *)v8;

    id v10 = [[SecLaunchEvent alloc] initWithName:@"started"];
    [(NSMutableDictionary *)v7->_events setObject:v10 forKeyedSubscript:@"started"];

    id v11 = (NSBlockOperation *)objc_alloc_init(MEMORY[0x1E4F28B48]);
    launchOperation = v7->_launchOperation;
    v7->_launchOperation = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    dependantLaunches = v7->_dependantLaunches;
    v7->_dependantLaunches = (NSMutableDictionary *)v13;
  }
  return v7;
}

@end