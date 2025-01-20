@interface COMeshNodeStateTrackerSet
- (COMeshNodeStateTrackerSet)init;
- (NSDictionary)trackers;
- (id)description;
- (id)nodeStateTrackerForNode:(id)a3;
- (id)nodeStateTrackersWithStatus:(int64_t)a3;
- (void)_withLock:(id)a3;
- (void)addNodeStateTracker:(id)a3;
- (void)enumerateNodeStateTrackersOfStatus:(int64_t)a3 usingBlock:(id)a4;
- (void)enumerateNodeStateTrackersUsingBlock:(id)a3;
- (void)removeAllNodeStateTrackers;
- (void)removeNodeStateTrackerForNode:(id)a3;
- (void)setNodeDormant:(id)a3 withState:(unint64_t)a4 error:(id)a5;
- (void)setTrackers:(id)a3;
@end

@implementation COMeshNodeStateTrackerSet

- (COMeshNodeStateTrackerSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)COMeshNodeStateTrackerSet;
  v2 = [(COMeshNodeStateTrackerSet *)&v6 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(NSDictionary);
    trackers = v2->_trackers;
    v2->_trackers = v3;
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(COMeshNodeStateTrackerSet *)self trackers];
  v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"<%@: %p, trackers = %@>", v5, self, v7];

  return v8;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)addNodeStateTracker:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__COMeshNodeStateTrackerSet_addNodeStateTracker___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMeshNodeStateTrackerSet *)self _withLock:v6];
}

void __49__COMeshNodeStateTrackerSet_addNodeStateTracker___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) trackers];
  id v5 = (id)[v2 mutableCopy];

  v3 = *(void **)(a1 + 40);
  id v4 = [v3 node];
  [v5 setObject:v3 forKey:v4];

  [*(id *)(a1 + 32) setTrackers:v5];
}

- (id)nodeStateTrackerForNode:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__COMeshNodeStateTrackerSet_nodeStateTrackerForNode___block_invoke;
  v8[3] = &unk_2645CB1E8;
  v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(COMeshNodeStateTrackerSet *)self _withLock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __53__COMeshNodeStateTrackerSet_nodeStateTrackerForNode___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) trackers];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeNodeStateTrackerForNode:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__COMeshNodeStateTrackerSet_removeNodeStateTrackerForNode___block_invoke;
  v6[3] = &unk_2645CAE80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(COMeshNodeStateTrackerSet *)self _withLock:v6];
}

void __59__COMeshNodeStateTrackerSet_removeNodeStateTrackerForNode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) trackers];
  id v3 = (id)[v2 mutableCopy];

  [v3 removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTrackers:v3];
}

- (void)removeAllNodeStateTrackers
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__COMeshNodeStateTrackerSet_removeAllNodeStateTrackers__block_invoke;
  v2[3] = &unk_2645CB288;
  v2[4] = self;
  [(COMeshNodeStateTrackerSet *)self _withLock:v2];
}

void __55__COMeshNodeStateTrackerSet_removeAllNodeStateTrackers__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = objc_alloc_init(NSDictionary);
  [v1 setTrackers:v2];
}

- (id)nodeStateTrackersWithStatus:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke;
  v10[3] = &unk_2645CD7A8;
  v10[4] = self;
  int64_t v12 = a3;
  id v6 = v5;
  id v11 = v6;
  [(COMeshNodeStateTrackerSet *)self _withLock:v10];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke_2;
  v3[3] = &unk_2645CBBA8;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateNodeStateTrackersOfStatus:v1 usingBlock:v3];
}

uint64_t __57__COMeshNodeStateTrackerSet_nodeStateTrackersWithStatus___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)setNodeDormant:(id)a3 withState:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__COMeshNodeStateTrackerSet_setNodeDormant_withState_error___block_invoke;
  v12[3] = &unk_2645CD7D0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [(COMeshNodeStateTrackerSet *)self _withLock:v12];
}

void __60__COMeshNodeStateTrackerSet_setNodeDormant_withState_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) trackers];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  [v3 setState:*(void *)(a1 + 56)];
  [v3 setStatus:2];
  id v4 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)MEMORY[0x263EFF910];
    [v3 lastHeard];
    id v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
    id v7 = [v3 node];
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_impl(&dword_2217C1000, v4, OS_LOG_TYPE_DEFAULT, "Going dormant since last heard at %@ on %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)enumerateNodeStateTrackersUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(COMeshNodeStateTrackerSet *)self trackers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersUsingBlock___block_invoke;
  v7[3] = &unk_2645CD7F8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __66__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateNodeStateTrackersOfStatus:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersOfStatus_usingBlock___block_invoke;
  v8[3] = &unk_2645CD820;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(COMeshNodeStateTrackerSet *)self enumerateNodeStateTrackersUsingBlock:v8];
}

void __75__COMeshNodeStateTrackerSet_enumerateNodeStateTrackersOfStatus_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == *(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSDictionary)trackers
{
  return self->_trackers;
}

- (void)setTrackers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end