@interface MRAVDistantExternalDeviceFactory
- (MRAVDistantExternalDeviceFactory)init;
- (NSArray)externalDevices;
- (id)_withLock_createDistantExternalDeviceForEndpoint:(id)a3;
- (id)description;
- (id)distantExternalDeviceForEndpoint:(id)a3;
- (void)_withLock_purgeCache;
@end

@implementation MRAVDistantExternalDeviceFactory

- (MRAVDistantExternalDeviceFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRAVDistantExternalDeviceFactory;
  result = [(MRAVDistantExternalDeviceFactory *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_distantExternalDevices];

  return v2;
}

- (NSArray)externalDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_distantExternalDevices allValues];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (id)distantExternalDeviceForEndpoint:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(MRAVDistantExternalDeviceFactory *)self _withLock_purgeCache];
  distantExternalDevices = self->_distantExternalDevices;
  v7 = [v4 uniqueIdentifier];
  v8 = [(NSMutableDictionary *)distantExternalDevices objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [v4 debugName];
      int v18 = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Reusing distantExternalDevice for endpoint %@ %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v8 = [(MRAVDistantExternalDeviceFactory *)self _withLock_createDistantExternalDeviceForEndpoint:v4];
    if (v8)
    {
      if (!self->_distantExternalDevices)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v12 = self->_distantExternalDevices;
        self->_distantExternalDevices = v11;
      }
      v13 = _MRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v4 debugName];
        int v18 = 138412546;
        v19 = v14;
        __int16 v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Caching distantExternalDevice for endpoint %@ %@", (uint8_t *)&v18, 0x16u);
      }
      v15 = self->_distantExternalDevices;
      v9 = [v4 uniqueIdentifier];
      [(NSMutableDictionary *)v15 setObject:v8 forKeyedSubscript:v9];
    }
    else
    {
      v9 = _MRLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [v4 debugName];
        int v18 = 138412546;
        v19 = v16;
        __int16 v20 = 2112;
        v21 = 0;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Failed to create distantExternalDevice for endpoint %@ %@", (uint8_t *)&v18, 0x16u);

        v8 = 0;
      }
    }
  }

  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)_withLock_createDistantExternalDeviceForEndpoint:(id)a3
{
  id v3 = a3;
  id v4 = [v3 externalDeviceListenerEndpoint];
  if (v4) {
    v5 = [[MRDistantExternalDevice alloc] initWithExternalDeviceListenerEndpoint:v4 endpoint:v3];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)_withLock_purgeCache
{
  id v3 = (void *)[(NSMutableDictionary *)self->_distantExternalDevices copy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MRAVDistantExternalDeviceFactory__withLock_purgeCache__block_invoke;
  v4[3] = &unk_1E57D53B0;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __56__MRAVDistantExternalDeviceFactory__withLock_purgeCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v6 isValid] & 1) == 0)
  {
    v7 = _MRLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRAVDistantExternalDeviceFactory] Purging distantExternalDevice %@ %@", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v5];
  }
}

- (void).cxx_destruct
{
}

@end