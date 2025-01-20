@interface BBObserverGatewayEnumerator
- (BBBulletin)bulletin;
- (BBObserverGatewayEnumerator)init;
- (BOOL)cancelled;
- (NSArray)gateways;
- (NSMutableSet)gatewaysPlayedLightsAndSirens;
- (double)gatewayTimeout;
- (id)defaultGateway;
- (unint64_t)feeds;
- (void)attemptNextGatewayInEnumerator:(id)a3 playLightsAndSirens:(BOOL)a4 completion:(id)a5;
- (void)cancel;
- (void)enumerateWithCompletion:(id)a3;
- (void)sendToDefaultGatewayToPlayLightsAndSirens:(BOOL)a3;
- (void)setBulletin:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setFeeds:(unint64_t)a3;
- (void)setGatewayTimeout:(double)a3;
- (void)setGateways:(id)a3;
- (void)setGatewaysPlayedLightsAndSirens:(id)a3;
@end

@implementation BBObserverGatewayEnumerator

- (BBObserverGatewayEnumerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)BBObserverGatewayEnumerator;
  v2 = [(BBObserverGatewayEnumerator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    gatewaysPlayedLightsAndSirens = v2->_gatewaysPlayedLightsAndSirens;
    v2->_gatewaysPlayedLightsAndSirens = v3;
  }
  return v2;
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(BBObserverGatewayEnumerator *)self bulletin];
    objc_super v6 = [v5 bulletinID];
    v7 = [(BBObserverGatewayEnumerator *)self bulletin];
    v8 = [v7 sectionID];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_217675000, v4, OS_LOG_TYPE_DEFAULT, "Gateway enumerator for bulletin %{public}@ in section %{public}@ cancelled", (uint8_t *)&v9, 0x16u);
  }
  self->_cancelled = 1;
}

- (void)enumerateWithCompletion:(id)a3
{
  gateways = self->_gateways;
  id v5 = a3;
  id v6 = [(NSArray *)gateways objectEnumerator];
  [(BBObserverGatewayEnumerator *)self attemptNextGatewayInEnumerator:v6 playLightsAndSirens:1 completion:v5];
}

- (void)attemptNextGatewayInEnumerator:(id)a3 playLightsAndSirens:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = (void (**)(void))a5;
  v10 = [(BBBulletin *)self->_bulletin bulletinID];
  __int16 v11 = [(BBBulletin *)self->_bulletin sectionID];
  v12 = [v8 nextObject];
  uint64_t v13 = [v12 name];
  if (self->_cancelled)
  {
    v14 = BBLogGateway;
    if (!os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      v9[2](v9);
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    __int16 v31 = 2114;
    v32 = v11;
    v15 = "Gateway enumerator was cancelled for bulletin %{public}@ in section %{public}@";
LABEL_4:
    _os_log_impl(&dword_217675000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
    goto LABEL_5;
  }
  if (!v12)
  {
    [(BBObserverGatewayEnumerator *)self sendToDefaultGatewayToPlayLightsAndSirens:v6];
    v14 = BBLogGateway;
    if (!os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    __int16 v31 = 2114;
    v32 = v11;
    v15 = "Gateway enumerator was completed for bulletin %{public}@ in section %{public}@";
    goto LABEL_4;
  }
  v16 = BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v30 = v13;
    __int16 v31 = 2114;
    v32 = v10;
    __int16 v33 = 2114;
    v34 = v11;
    _os_log_impl(&dword_217675000, v16, OS_LOG_TYPE_DEFAULT, "Attempt gateway %{public}@ for bulletin %{public}@ in section %{public}@", buf, 0x20u);
  }
  bulletin = self->_bulletin;
  unint64_t feeds = self->_feeds;
  double gatewayTimeout = self->_gatewayTimeout;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__BBObserverGatewayEnumerator_attemptNextGatewayInEnumerator_playLightsAndSirens_completion___block_invoke;
  v20[3] = &unk_2642974B8;
  id v21 = v13;
  id v22 = v10;
  id v23 = v11;
  v24 = self;
  id v25 = v12;
  BOOL v28 = v6;
  id v26 = v8;
  v27 = v9;
  [v25 sendAddBulletin:bulletin playLightsAndSirens:v6 forFeeds:feeds withTimeout:v20 handler:gatewayTimeout];

LABEL_10:
}

void __93__BBObserverGatewayEnumerator_attemptNextGatewayInEnumerator_playLightsAndSirens_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = (void *)BBLogGateway;
  if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      v7 = "DID";
    }
    else {
      v7 = "DID NOT";
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v10 = *(void **)(a1 + 56);
    v12 = v6;
    int v13 = [v10 cancelled];
    *(_DWORD *)v16 = 138544386;
    v14 = "NOT";
    *(void *)&v16[4] = v8;
    *(_WORD *)&v16[12] = 2082;
    if (v13) {
      v14 = "";
    }
    *(void *)&v16[14] = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    __int16 v21 = 2082;
    id v22 = v14;
    _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Gateway enumerator received from %{public}@ %{public}s play lights and sirens for %{public}@ in section %{public}@ currently %{public}s cancelled", v16, 0x34u);
  }
  if (a2) {
    [*(id *)(*(void *)(a1 + 56) + 48) addObject:*(void *)(a1 + 64)];
  }
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v15 = a2 ^ 1u;
  }
  else {
    uint64_t v15 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "attemptNextGatewayInEnumerator:playLightsAndSirens:completion:", *(void *)(a1 + 72), v15, *(void *)(a1 + 80), *(_OWORD *)v16);
}

- (id)defaultGateway
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_gateways;
  id v3 = (id)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "gatewayPriority", (void)v8) == 3)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)sendToDefaultGatewayToPlayLightsAndSirens:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(BBObserverGatewayEnumerator *)self defaultGateway];
  if (([(NSMutableSet *)self->_gatewaysPlayedLightsAndSirens containsObject:v5] & 1) == 0)
  {
    BOOL v6 = (void *)BBLogGateway;
    if (os_log_type_enabled((os_log_t)BBLogGateway, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      long long v8 = [v5 name];
      long long v9 = [(BBBulletin *)self->_bulletin bulletinID];
      long long v10 = [(BBBulletin *)self->_bulletin sectionID];
      int v11 = 138543874;
      v12 = v8;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_217675000, v7, OS_LOG_TYPE_DEFAULT, "Attempt default gateway %{public}@ for bulletin %{public}@ in section %{public}@", (uint8_t *)&v11, 0x20u);
    }
    [v5 sendObserversAddBulletin:self->_bulletin playLightsAndSirens:v3 forFeeds:self->_feeds];
  }
}

- (NSArray)gateways
{
  return self->_gateways;
}

- (void)setGateways:(id)a3
{
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (unint64_t)feeds
{
  return self->_feeds;
}

- (void)setFeeds:(unint64_t)a3
{
  self->_unint64_t feeds = a3;
}

- (double)gatewayTimeout
{
  return self->_gatewayTimeout;
}

- (void)setGatewayTimeout:(double)a3
{
  self->_double gatewayTimeout = a3;
}

- (NSMutableSet)gatewaysPlayedLightsAndSirens
{
  return self->_gatewaysPlayedLightsAndSirens;
}

- (void)setGatewaysPlayedLightsAndSirens:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatewaysPlayedLightsAndSirens, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_gateways, 0);
}

@end