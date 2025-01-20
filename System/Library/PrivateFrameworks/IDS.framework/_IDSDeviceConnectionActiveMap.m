@interface _IDSDeviceConnectionActiveMap
+ (id)sharedInstance;
- (BOOL)hasActiveConnection:(id)a3 forKey:(id)a4;
- (_IDSDeviceConnectionActiveMap)init;
- (int)getActiveConnectionCount;
- (void)removeActiveConnection:(id)a3 forKey:(id)a4;
- (void)setActiveConnection:(id)a3 forKey:(id)a4;
@end

@implementation _IDSDeviceConnectionActiveMap

+ (id)sharedInstance
{
  if (qword_1EB2BD858 != -1) {
    dispatch_once(&qword_1EB2BD858, &unk_1EE2465E8);
  }
  v2 = (void *)qword_1EB2BD818;

  return v2;
}

- (_IDSDeviceConnectionActiveMap)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v4 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_IDSDeviceConnectionActiveMap;
    v5 = [(_IDSDeviceConnectionActiveMap *)&v11 init];
    if (v5)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      activeConnectionMap = v5->_activeConnectionMap;
      v5->_activeConnectionMap = v6;

      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      openConnections = v5->_openConnections;
      v5->_openConnections = v8;

      v5->_writeLock._os_unfair_lock_opaque = 0;
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)setActiveConnection:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  os_unfair_lock_lock(&self->_writeLock);
  v8 = [(NSMutableDictionary *)self->_activeConnectionMap objectForKey:v6];
  if (v8)
  {
    v9 = +[IDSTransportLog IDSDeviceConnection];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412802;
      id v11 = v6;
      __int16 v12 = 2112;
      v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Warning. Setting active connection %@ without closing existing %@ for key %@", (uint8_t *)&v10, 0x20u);
    }
  }
  [(NSMutableDictionary *)self->_activeConnectionMap setObject:v7 forKey:v6];
  [(NSMutableSet *)self->_openConnections addObject:v7];

  os_unfair_lock_unlock(&self->_writeLock);
}

- (BOOL)hasActiveConnection:(id)a3 forKey:(id)a4
{
  p_writeLock = &self->_writeLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_writeLock);
  v9 = [(NSMutableDictionary *)self->_activeConnectionMap objectForKey:v7];

  os_unfair_lock_unlock(p_writeLock);
  LOBYTE(p_writeLock) = [v9 isEqualToString:v8];

  return (char)p_writeLock;
}

- (void)removeActiveConnection:(id)a3 forKey:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_writeLock);
  id v7 = [(NSMutableDictionary *)self->_activeConnectionMap objectForKey:v9];
  int v8 = [v7 isEqualToString:v6];

  if (v8)
  {
    [(NSMutableDictionary *)self->_activeConnectionMap removeObjectForKey:v9];
    [(NSMutableSet *)self->_openConnections removeObject:v7];
  }
  os_unfair_lock_unlock(&self->_writeLock);
}

- (int)getActiveConnectionCount
{
  v2 = self;
  p_writeLock = &self->_writeLock;
  os_unfair_lock_lock(&self->_writeLock);
  LODWORD(v2) = [(NSMutableDictionary *)v2->_activeConnectionMap count];
  os_unfair_lock_unlock(p_writeLock);
  return (int)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openConnections, 0);

  objc_storeStrong((id *)&self->_activeConnectionMap, 0);
}

@end