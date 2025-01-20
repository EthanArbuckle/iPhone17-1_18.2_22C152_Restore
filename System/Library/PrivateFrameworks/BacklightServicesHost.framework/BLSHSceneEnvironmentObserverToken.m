@interface BLSHSceneEnvironmentObserverToken
+ (id)tokenWithObserver:(id)a3 sceneIdentityToken:(id)a4;
- (BLSHSceneEnvironmentObserverToken)initWithObserver:(id)a3 sceneIdentityToken:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation BLSHSceneEnvironmentObserverToken

+ (id)tokenWithObserver:(id)a3 sceneIdentityToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithObserver:v7 sceneIdentityToken:v6];

  return v8;
}

- (BLSHSceneEnvironmentObserverToken)initWithObserver:(id)a3 sceneIdentityToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BLSHSceneEnvironmentObserverToken;
  v8 = [(BLSHSceneEnvironmentObserverToken *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_sceneIdentityToken, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v5 = (id)[v3 appendPointer:WeakRetained];

  id v6 = (id)[v3 appendObject:self->_sceneIdentityToken];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke;
  v18[3] = &unk_264532560;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendPointer:WeakRetained counterpart:v18];

  sceneIdentityToken = self->_sceneIdentityToken;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke_2;
  v16 = &unk_264532588;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:sceneIdentityToken counterpart:&v13];
  LOBYTE(sceneIdentityToken) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)sceneIdentityToken;
}

id __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  return WeakRetained;
}

id __45__BLSHSceneEnvironmentObserverToken_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (id)description
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __48__BLSHSceneEnvironmentObserverToken_description__block_invoke;
  id v10 = &unk_2645322D0;
  id v11 = v3;
  v12 = self;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

void __48__BLSHSceneEnvironmentObserverToken_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"scene"];
  v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v4 = (id)[v3 appendObject:WeakRetained withName:@"observer"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentityToken, 0);

  objc_destroyWeak((id *)&self->_observer);
}

@end