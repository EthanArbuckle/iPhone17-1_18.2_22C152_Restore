@interface GKVoiceChatSessionListener
- (GKVoiceChatSessionListener)initWithSession:(id)a3;
- (id)currentSessions;
- (void)dealloc;
- (void)receivedNewVoiceChatOOBMessage:(id)a3 fromPeerID:(id)a4;
- (void)registerNewGKVoiceChatSession:(id)a3;
- (void)removeSession:(id)a3;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(unsigned int)a5;
@end

@implementation GKVoiceChatSessionListener

- (GKVoiceChatSessionListener)initWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKVoiceChatSessionListener;
  v4 = [(GKVoiceChatSessionListener *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_gkSession = (GKSessionInternal *)a3;
    v4->_conferenceList = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    v5->_rwlock = objc_alloc_init(GKRWLock);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatSessionListener;
  [(GKVoiceChatSessionListener *)&v3 dealloc];
}

- (void)registerNewGKVoiceChatSession:(id)a3
{
  [(GKRWLock *)self->_rwlock wrlock];
  if (([(NSMutableArray *)self->_conferenceList containsObject:a3] & 1) == 0) {
    [(NSMutableArray *)self->_conferenceList addObject:a3];
  }
  rwlock = self->_rwlock;
  [(GKRWLock *)rwlock unlock];
}

- (void)removeSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(GKRWLock *)self->_rwlock wrlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      v10 = "-[GKVoiceChatSessionListener removeSession:]";
      __int16 v11 = 1024;
      int v12 = 50;
      __int16 v13 = 2048;
      id v14 = a3;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatSessionListener removing listener %p", (uint8_t *)&v7, 0x26u);
    }
  }
  [(NSMutableArray *)self->_conferenceList removeObject:a3];
  [(GKRWLock *)self->_rwlock unlock];
}

- (id)currentSessions
{
  [(GKRWLock *)self->_rwlock wrlock];
  objc_super v3 = (void *)[MEMORY[0x263EFFA08] setWithArray:self->_conferenceList];
  [(GKRWLock *)self->_rwlock unlock];
  return v3;
}

- (void)receivedNewVoiceChatOOBMessage:(id)a3 fromPeerID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(GKRWLock *)self->_rwlock rdlock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  conferenceList = self->_conferenceList;
  uint64_t v8 = [(NSMutableArray *)conferenceList countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(conferenceList);
        }
        int v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v13 = [v12 conferenceID];
        if (v13 == [a3 conferenceID]) {
          [v12 session:self->_gkSession didReceiveOOBAudioPacket:a3 fromPeerID:a4];
        }
      }
      uint64_t v9 = [(NSMutableArray *)conferenceList countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [(GKRWLock *)self->_rwlock unlock];
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(GKRWLock *)self->_rwlock rdlock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  conferenceList = self->_conferenceList;
  uint64_t v9 = [(NSMutableArray *)conferenceList countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(conferenceList);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * i) session:self->_gkSession peer:a4 didChangeState:v5];
      }
      uint64_t v10 = [(NSMutableArray *)conferenceList countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
  [(GKRWLock *)self->_rwlock unlock];
}

@end