@interface _HFItemManagerDebugStateDumpController
+ (id)sharedInstance;
- (NSHashTable)itemManagers;
- (_HFItemManagerDebugStateDumpController)init;
- (id)_performStateDump;
- (void)registerItemManager:(id)a3;
- (void)setItemManagers:(id)a3;
@end

@implementation _HFItemManagerDebugStateDumpController

- (_HFItemManagerDebugStateDumpController)init
{
  v9.receiver = self;
  v9.super_class = (Class)_HFItemManagerDebugStateDumpController;
  v2 = [(_HFItemManagerDebugStateDumpController *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(_HFItemManagerDebugStateDumpController *)v2 setItemManagers:v3];

    v4 = +[HFDebugStateDumpManager sharedInstance];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46___HFItemManagerDebugStateDumpController_init__block_invoke;
    v7[3] = &unk_26408D748;
    v8 = v2;
    id v5 = (id)[v4 registerStateDumpHandler:v7 withName:@"HFItemManager"];
  }
  return v2;
}

- (void)setItemManagers:(id)a3
{
}

- (void)registerItemManager:(id)a3
{
  id v4 = a3;
  id v5 = [(_HFItemManagerDebugStateDumpController *)self itemManagers];
  [v5 addObject:v4];
}

- (NSHashTable)itemManagers
{
  return self->_itemManagers;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_212 != -1) {
    dispatch_once(&_MergedGlobals_212, &__block_literal_global_70);
  }
  v2 = (void *)qword_26AB2EC28;
  return v2;
}

- (id)_performStateDump
{
  v2 = [(_HFItemManagerDebugStateDumpController *)self itemManagers];
  v3 = [v2 allObjects];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_80);

  return v4;
}

- (void).cxx_destruct
{
}

@end