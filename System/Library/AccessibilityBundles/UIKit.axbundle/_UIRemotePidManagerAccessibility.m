@interface _UIRemotePidManagerAccessibility
+ (id)sharedInstance;
- (NSMutableDictionary)pidToAssertions;
- (_UIRemotePidManagerAccessibility)init;
- (void)_main_suspendPid:(int)a3 forAssertionPointer:(id)a4;
- (void)_main_unsuspendPid:(int)a3 forAssertionPointer:(id)a4;
- (void)setPidToAssertions:(id)a3;
- (void)suspendPid:(int)a3 forAssertionPointer:(id)a4;
- (void)unsuspendPid:(int)a3 forAssertionPointer:(id)a4;
@end

@implementation _UIRemotePidManagerAccessibility

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance__shared;

  return v2;
}

- (_UIRemotePidManagerAccessibility)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIRemotePidManagerAccessibility;
  v7 = [(_UIRemotePidManagerAccessibility *)&v5 init];
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    v4 = v7;
    AXPerformBlockOnMainThread();
    objc_storeStrong((id *)&v4, 0);
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)unsuspendPid:(int)a3 forAssertionPointer:(id)a4
{
  v15 = self;
  SEL v14 = a2;
  int v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __69___UIRemotePidManagerAccessibility_unsuspendPid_forAssertionPointer___block_invoke;
  v8 = &unk_2650AE0C0;
  v9 = v15;
  int v11 = v13;
  id v10 = location;
  AXPerformBlockOnMainThread();
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)_main_unsuspendPid:(int)a3 forAssertionPointer:(id)a4
{
  int v13 = self;
  SEL v12 = a2;
  unsigned int v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  pidToAssertions = v13->_pidToAssertions;
  id v8 = (id)[NSNumber numberWithInt:v11];
  id v9 = (id)-[NSMutableDictionary objectForKey:](pidToAssertions, "objectForKey:");

  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);

    int v5 = v13->_pidToAssertions;
    id v6 = (id)[NSNumber numberWithInt:v11];
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v9);

    AXPidUnsuspend();
  }
  objc_msgSend(v9, "addObject:", location, &v9);
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

- (void)suspendPid:(int)a3 forAssertionPointer:(id)a4
{
  v15 = self;
  SEL v14 = a2;
  int v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __67___UIRemotePidManagerAccessibility_suspendPid_forAssertionPointer___block_invoke;
  id v8 = &unk_2650AE0C0;
  id v9 = v15;
  int v11 = v13;
  id v10 = location;
  AXPerformBlockOnMainThread();
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)_main_suspendPid:(int)a3 forAssertionPointer:(id)a4
{
  SEL v12 = self;
  SEL v11 = a2;
  unsigned int v10 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  pidToAssertions = v12->_pidToAssertions;
  id v7 = (id)[NSNumber numberWithInt:v10];
  id v8 = (id)-[NSMutableDictionary objectForKey:](pidToAssertions, "objectForKey:");

  if (v8)
  {
    [v8 removeObject:location];
    if (![v8 count])
    {
      uint64_t v4 = v12->_pidToAssertions;
      id v5 = (id)[NSNumber numberWithInt:v10];
      -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:");

      AXPidSuspend();
    }
  }
  else
  {
    AXPidSuspend();
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
}

- (NSMutableDictionary)pidToAssertions
{
  return self->_pidToAssertions;
}

- (void)setPidToAssertions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end