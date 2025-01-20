@interface NDApplication
+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3;
+ (id)applicationWithIdentifier:(id)a3;
+ (id)cloudContainerWithIdentifier:(id)a3;
+ (id)springboardApplicationWithBundleIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)hasForegroundBackgroundStates;
- (BOOL)isForeground;
- (NDApplication)initWithOperationID:(id)a3;
- (void)addObserver:(id)a3;
- (void)invokeSelectorForAllObservers:(SEL)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NDApplication

- (void)invokeSelectorForAllObservers:(SEL)a3
{
  v5 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003AB0;
  v6[3] = &unk_1000104C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

+ (void)initialize
{
  if (qword_100016458 != -1) {
    dispatch_once(&qword_100016458, &stru_100010498);
  }
}

+ (id)applicationWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = [(id)qword_100016460 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)objc_opt_class()) initWithOperationID:v3];
    [(id)qword_100016460 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_100016460 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

+ (id)springboardApplicationWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = [(id)qword_100016460 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [[NDSpringBoardApplication alloc] initWithOperationID:v3];
    [(id)qword_100016460 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_100016460 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

+ (BOOL)springBoardApplicationExistsWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[NDSpringBoard sharedSpringBoard];
  unsigned __int8 v5 = [v4 identifierIsForSpringBoardApplication:v3];

  return v5;
}

+ (id)cloudContainerWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  unsigned __int8 v5 = [(id)qword_100016460 objectForKeyedSubscript:v3];

  if (!v5)
  {
    id v6 = [[NDCloudContainer alloc] initWithOperationID:v3];
    [(id)qword_100016460 setObject:v6 forKeyedSubscript:v3];
  }
  v7 = [(id)qword_100016460 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  return v7;
}

- (NDApplication)initWithOperationID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NDApplication;
  id v6 = [(NDApplication *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    uint64_t v8 = +[NSMutableArray array];
    observers = v7->_observers;
    v7->_observers = (NSMutableArray *)v8;
  }
  return v7;
}

- (BOOL)hasForegroundBackgroundStates
{
  return 0;
}

- (BOOL)isForeground
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSMutableArray *)v4->_observers indexOfObject:v6];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)v4->_observers removeObjectAtIndex:v5];
  }
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end