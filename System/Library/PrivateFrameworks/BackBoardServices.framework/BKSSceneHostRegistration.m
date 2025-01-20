@interface BKSSceneHostRegistration
- (NSString)description;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)invalidate;
- (void)updateSettings:(id)a3;
@end

@implementation BKSSceneHostRegistration

- (void)updateSettings:(id)a3
{
  v5 = (BKSSceneHostSettings *)a3;
  p_sceneHostSettings = &self->_sceneHostSettings;
  if (self->_sceneHostSettings != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_sceneHostSettings, a3);
    -[BKSTouchEventService _updateRegistration:]((uint64_t)self->_service, self);
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_sceneHostSettings, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHostSettings, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__BKSSceneHostRegistration_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E5441BB0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

id __57__BKSSceneHostRegistration_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(unsigned int *)(*(void *)(a1 + 40) + 8) withName:@"contextID" format:1];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"sceneHostSettings"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)invalidate
{
  service = self->_service;
  v3 = self;
  if (service)
  {
    v12 = v3;
    os_unfair_lock_lock(&service->_registrationLock);
    id v4 = [NSNumber numberWithUnsignedInt:v12->_contextID];
    id v5 = [(NSMutableDictionary *)service->_registrationLock_registrationsByContextID objectForKey:v4];
    v6 = v5;
    if (v5) {
      [v5 removeObject:v12];
    }
    if (![v6 count]) {
      [(NSMutableDictionary *)service->_registrationLock_registrationsByContextID removeObjectForKey:v4];
    }
    uint64_t v7 = [v6 lastObject];
    v8 = (void *)v7;
    if (v7) {
      v9 = *(void **)(v7 + 24);
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    os_unfair_lock_unlock(&service->_registrationLock);
    v11 = [(BSServiceConnection *)service->_connection remoteTarget];
    [v11 setSceneHostSettings:v10 forContextID:v4];

    v3 = v12;
  }
}

@end