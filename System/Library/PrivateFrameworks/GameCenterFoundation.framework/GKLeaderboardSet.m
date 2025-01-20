@interface GKLeaderboardSet
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (id)instanceMethodSignatureForSelector:(SEL)a3;
+ (void)loadLeaderboardSetsForGame:(id)a3 withCompletionHandler:(id)a4;
+ (void)loadLeaderboardSetsWithCompletionHandler:(void *)completionHandler;
- (BOOL)isEqual:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (GKLeaderboardSet)init;
- (GKLeaderboardSet)initWithCoder:(id)a3;
- (GKLeaderboardSet)initWithInternalRepresentation:(id)a3;
- (GKLeaderboardSetInternal)internal;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)loadLeaderboardsForGame:(id)a3 forPlayer:(id)a4 withCompletionHandler:(id)a5;
- (void)loadLeaderboardsForGame:(id)a3 withCompletionHandler:(id)a4;
- (void)loadLeaderboardsWithCompletionHandler:(void *)completionHandler;
- (void)loadLeaderboardsWithHandler:(void *)handler;
- (void)setInternal:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GKLeaderboardSet

- (GKLeaderboardSet)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[GKInternalRepresentation internalRepresentation];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSet;
  v5 = [(GKLeaderboardSet *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_internal, v4);
  }

  return v6;
}

- (GKLeaderboardSet)init
{
  return [(GKLeaderboardSet *)self initWithInternalRepresentation:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"internal"];

  v6 = [(GKLeaderboardSet *)self initWithInternalRepresentation:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GKLeaderboardSet *)self internal];
  [v4 encodeObject:v5 forKey:@"internal"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [(GKLeaderboardSet *)self internal];
  v6 = [v4 internal];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(GKLeaderboardSet *)self internal];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSet;
  unint64_t v3 = [(GKLeaderboardSet *)&v8 description];
  id v4 = [(GKLeaderboardSet *)self identifier];
  id v5 = [(GKLeaderboardSet *)self title];
  v6 = [v3 stringByAppendingFormat:@"%@ - %@ ", v4, v5];

  return v6;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKLeaderboardSet;
  id v4 = objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKLeaderboardSet;
  id v5 = -[GKLeaderboardSet methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_super v8 = [(GKLeaderboardSet *)self forwardingTargetForSelector:a3];
    id v7 = [v8 methodSignatureForSelector:a3];
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSet;
  if (-[GKLeaderboardSet respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(GKLeaderboardSet *)self forwardingTargetForSelector:a3];
    char v5 = objc_opt_respondsToSelector();
  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      int v4 = GKApplicationLinkedOnOrAfter(393216, 657920);
      if (v4)
      {
        LOBYTE(v4) = +[GKLeaderboardSetInternal instancesRespondToSelector:a3];
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  char v5 = [(GKLeaderboardSet *)self internal];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKLeaderboardSet *)self internal];
  [v8 setValue:v7 forKey:v6];
}

- (void)loadLeaderboardsForGame:(id)a3 forPlayer:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardSet.m", 144, "-[GKLeaderboardSet loadLeaderboardsForGame:forPlayer:withCompletionHandler:]");
    v12 = +[GKDispatchGroup dispatchGroupWithName:v11];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E646E5C8;
    id v19 = v8;
    id v20 = v9;
    v21 = self;
    id v13 = v12;
    id v22 = v13;
    [v13 perform:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E646DC30;
    id v16 = v13;
    id v17 = v10;
    id v14 = v13;
    [v14 notifyOnMainQueueWithBlock:v15];
  }
}

void __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  char v5 = [v4 gameStatService];
  id v6 = [a1[4] gameDescriptor];
  id v7 = [a1[5] internal];
  id v8 = [a1[6] identifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E646DC78;
  id v11 = a1[7];
  id v12 = v3;
  id v9 = v3;
  [v5 getLeaderboardsForGameDescriptor:v6 player:v7 setIdentifier:v8 handler:v10];
}

void __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v8 count])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [v8 _gkMapConcurrentlyWithBlock:&__block_literal_global_53];
    [v6 setObject:v7 forKeyedSubscript:@"leaderboards"];
  }
  [*(id *)(a1 + 32) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

GKLeaderboard *__76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKLeaderboard alloc] initWithInternalRepresentation:v2];

  return v3;
}

void __76__GKLeaderboardSet_loadLeaderboardsForGame_forPlayer_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"leaderboards"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)loadLeaderboardsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = +[GKGame currentGame];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__GKLeaderboardSet_loadLeaderboardsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E646DCF0;
  id v8 = v4;
  id v6 = v4;
  [(GKLeaderboardSet *)self loadLeaderboardsForGame:v5 withCompletionHandler:v7];
}

void __58__GKLeaderboardSet_loadLeaderboardsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

- (void)loadLeaderboardsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v7 = +[GKGame currentGame];
  id v6 = +[GKLocalPlayer localPlayer];
  [(GKLeaderboardSet *)self loadLeaderboardsForGame:v7 forPlayer:v6 withCompletionHandler:v5];
}

- (void)loadLeaderboardsWithHandler:(void *)handler
{
  id v4 = handler;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardSet.m", 183, "-[GKLeaderboardSet loadLeaderboardsWithHandler:]");
  id v6 = +[GKDispatchGroup dispatchGroupWithName:v5];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke;
  v13[3] = &unk_1E646D928;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  [v7 perform:v13];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_4;
  v10[3] = &unk_1E646DC30;
  id v11 = v7;
  id v12 = v4;
  id v8 = v7;
  id v9 = v4;
  [v8 notifyOnMainQueueWithBlock:v10];
}

void __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = +[GKGame currentGame];
  id v7 = [v6 gameDescriptor];
  id v8 = +[GKLocalPlayer local];
  id v9 = [v8 internal];
  id v10 = [*(id *)(a1 + 32) identifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_2;
  v12[3] = &unk_1E646DC78;
  id v13 = *(id *)(a1 + 40);
  id v14 = v3;
  id v11 = v3;
  [v5 getLeaderboardsForGameDescriptor:v7 player:v9 leaderboardIDs:0 setIdentifier:v10 handler:v12];
}

void __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 count])
  {
    id v6 = [v7 _gkMapWithBlock:&__block_literal_global_32];
    [*(id *)(a1 + 32) setResult:v6];
  }
  [*(id *)(a1 + 32) setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

GKLeaderboard *__48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKLeaderboard alloc] initWithInternalRepresentation:v2];

  return v3;
}

void __48__GKLeaderboardSet_loadLeaderboardsWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) result];
  id v6 = (id)v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CBF0];
  }
  id v5 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);
}

+ (void)loadLeaderboardSetsForGame:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLeaderboardSet.m", 210, "+[GKLeaderboardSet loadLeaderboardSetsForGame:withCompletionHandler:]");
    id v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke;
    v14[3] = &unk_1E646D928;
    id v15 = v5;
    id v9 = v8;
    id v16 = v9;
    [v9 perform:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_4;
    v11[3] = &unk_1E646DC30;
    id v12 = v9;
    id v13 = v6;
    id v10 = v9;
    [v10 notifyOnMainQueueWithBlock:v11];
  }
}

void __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GKDaemonProxy proxyForLocalPlayer];
  id v5 = [v4 gameStatService];
  id v6 = [*(id *)(a1 + 32) gameDescriptor];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E646DC78;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v7 = v3;
  [v5 getLeaderboardSetsForGameDescriptor:v6 handler:v8];
}

void __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  [*(id *)(a1 + 32) setError:a3];
  if ([v7 count])
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v7 _gkMapConcurrentlyWithBlock:&__block_literal_global_35];
    [v5 setObject:v6 forKeyedSubscript:@"leaderboardSets"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

GKLeaderboardSet *__69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[GKLeaderboardSet alloc] initWithInternalRepresentation:v2];

  return v3;
}

void __69__GKLeaderboardSet_loadLeaderboardSetsForGame_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"leaderboardSets"];
  id v3 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

+ (void)loadLeaderboardSetsWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  id v4 = +[GKGame currentGame];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__GKLeaderboardSet_loadLeaderboardSetsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E646DCF0;
  id v7 = v3;
  id v5 = v3;
  +[GKLeaderboardSet loadLeaderboardSetsForGame:v4 withCompletionHandler:v6];
}

void __61__GKLeaderboardSet_loadLeaderboardSetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
    else if (v9)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0);
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1C978] array];
      (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
    }
  }
}

- (GKLeaderboardSetInternal)internal
{
  return (GKLeaderboardSetInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end