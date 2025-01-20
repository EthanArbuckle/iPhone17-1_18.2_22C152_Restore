@interface BuddyTestFundamentalFlow
+ (id)allowedFlowItems;
+ (id)classes;
- (BuddyTestFundamentalFlow)init;
- (BuddyTestFundamentalFlow)initWithClasses:(id)a3;
- (Class)debutFlowItemClass;
- (Class)initialFlowItemClass;
- (Class)potentialNextFlowItemClassFollowingFlowItemClass:(Class)a3;
- (NSArray)classes;
- (NSDictionary)nextClassByCurrentClassNameMap;
- (id)willSupplyInitialFlowItemClass;
- (void)configureFlowItem:(id)a3;
- (void)prepareWithCompletion:(id)a3;
- (void)setClasses:(id)a3;
- (void)setNextClassByCurrentClassNameMap:(id)a3;
- (void)setWillSupplyInitialFlowItemClass:(id)a3;
@end

@implementation BuddyTestFundamentalFlow

- (BuddyTestFundamentalFlow)init
{
  id v3 = +[BuddyTestFundamentalFlow classes];
  id location = [(BuddyTestFundamentalFlow *)self initWithClasses:v3];
  objc_storeStrong(&location, location);

  v4 = (BuddyTestFundamentalFlow *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyTestFundamentalFlow)initWithClasses:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v18;
  id v18 = 0;
  v16.receiver = v3;
  v16.super_class = (Class)BuddyTestFundamentalFlow;
  id v18 = [(BuddyTestFundamentalFlow *)&v16 init];
  objc_storeStrong(&v18, v18);
  if (v18)
  {
    objc_storeStrong((id *)v18 + 2, location[0]);
    id v15 = 0;
    id obj = objc_alloc_init((Class)NSMutableDictionary);
    memset(__b, 0, sizeof(__b));
    id v4 = location[0];
    id v5 = [v4 countByEnumeratingWithState:__b objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v5; ++i)
        {
          if (*(void *)__b[2] != v6) {
            objc_enumerationMutation(v4);
          }
          Class aClass = 0;
          Class aClass = *(Class *)(__b[1] + 8 * i);
          if (v15) {
            [obj setObject:aClass forKeyedSubscript:v15];
          }
          v8 = NSStringFromClass(aClass);
          id v9 = v15;
          id v15 = v8;
        }
        id v5 = [v4 countByEnumeratingWithState:__b objects:v19 count:16];
      }
      while (v5);
    }

    objc_storeStrong((id *)v18 + 3, obj);
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v15, 0);
  }
  v10 = (BuddyTestFundamentalFlow *)v18;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v18, 0);
  return v10;
}

+ (id)classes
{
  v12[2] = a1;
  v12[1] = (id)a2;
  id v2 = +[BYPreferencesController buddyPreferencesInternal];
  v12[0] = [v2 objectForKey:@"DebugFlowItemClassNames"];

  id location = objc_alloc_init((Class)NSMutableArray);
  memset(v9, 0, sizeof(v9));
  id v3 = v12[0];
  id v4 = [v3 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)v9[2] != v5) {
          objc_enumerationMutation(v3);
        }
        aClassName = *(NSString **)(v9[1] + 8 * i);
        [location addObject:NSClassFromString(aClassName)];
      }
      id v4 = [v3 countByEnumeratingWithState:v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v12, 0);
  return v7;
}

- (void)prepareWithCompletion:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0]) {
    (*((void (**)(void))location[0] + 2))();
  }
  objc_storeStrong(location, 0);
}

- (Class)initialFlowItemClass
{
  id v2 = [(BuddyTestFundamentalFlow *)self classes];
  id v8 = [(NSArray *)v2 firstObject];

  char v6 = 0;
  BOOL v3 = 0;
  if (v8)
  {
    id v7 = [(BuddyTestFundamentalFlow *)self willSupplyInitialFlowItemClass];
    char v6 = 1;
    BOOL v3 = v7 != 0;
  }
  if (v6) {

  }
  if (v3)
  {
    id v4 = (void (**)(id, id))[(BuddyTestFundamentalFlow *)self willSupplyInitialFlowItemClass];
    v4[2](v4, v8);
  }

  return (Class)v8;
}

- (Class)debutFlowItemClass
{
  return 0;
}

- (void)configureFlowItem:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (Class)potentialNextFlowItemClassFollowingFlowItemClass:(Class)a3
{
  BOOL v3 = [(BuddyTestFundamentalFlow *)self nextClassByCurrentClassNameMap];
  id v4 = NSStringFromClass(a3);
  id v5 = [(NSDictionary *)v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

+ (id)allowedFlowItems
{
  id v5 = (dispatch_once_t *)&unk_100321E88;
  id location = 0;
  objc_storeStrong(&location, &stru_1002B4808);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  id v2 = (void *)qword_100321E80;

  return v2;
}

- (id)willSupplyInitialFlowItemClass
{
  return self->willSupplyInitialFlowItemClass;
}

- (void)setWillSupplyInitialFlowItemClass:(id)a3
{
}

- (NSArray)classes
{
  return self->_classes;
}

- (void)setClasses:(id)a3
{
}

- (NSDictionary)nextClassByCurrentClassNameMap
{
  return self->_nextClassByCurrentClassNameMap;
}

- (void)setNextClassByCurrentClassNameMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end