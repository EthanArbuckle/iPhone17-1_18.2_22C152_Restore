@interface CNMetricsReporterSpy
- (CNMetricsReporterSpy)init;
- (NSArray)events;
- (void)clearEvents;
- (void)logSimpleEvent:(id)a3 forApplication:(id)a4 andLog:(BOOL)a5;
- (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5;
@end

@implementation CNMetricsReporterSpy

- (CNMetricsReporterSpy)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNMetricsReporterSpy;
  v2 = [(CNMetricsReporterSpy *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)events
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableArray *)v2->_entries copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)clearEvents
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_entries removeAllObjects];
  objc_sync_exit(obj);
}

- (void)sendDictionary:(id)a3 forEvent:(id)a4 andLog:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  v9 = [[CNMetricsReporterSpiedEntry alloc] initWithDictionary:v11 event:v8 logged:v5];
  v10 = self;
  objc_sync_enter(v10);
  [(NSMutableArray *)v10->_entries addObject:v9];
  objc_sync_exit(v10);
}

- (void)logSimpleEvent:(id)a3 forApplication:(id)a4 andLog:(BOOL)a5
{
  BOOL v5 = a5;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  v14 = @"application";
  v15[0] = v9;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  v13 = (void *)[v11 initWithDictionary:v12];
  [(CNMetricsReporterSpy *)self sendDictionary:v13 forEvent:v10 andLog:v5];
}

- (void).cxx_destruct
{
}

@end