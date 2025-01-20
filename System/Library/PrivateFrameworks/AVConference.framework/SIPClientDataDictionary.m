@interface SIPClientDataDictionary
- (SIPClientDataDictionary)init;
- (id)copyObjectForKey:(id)a3 p2pID:(unsigned int)a4;
- (void)dealloc;
- (void)setObject:(id)a3 forKey:(id)a4 forP2PID:(unsigned int)a5;
@end

@implementation SIPClientDataDictionary

- (SIPClientDataDictionary)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)SIPClientDataDictionary;
  v2 = [(SIPClientDataDictionary *)&v4 init];
  if (v2) {
    v2->allCalls = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[SIPClientDataDictionary dealloc]";
      __int16 v10 = 1024;
      int v11 = 25;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SIPClientDataDictionary dealloc", buf, 0x1Cu);
    }
  }
  [(NSMutableDictionary *)self->allCalls removeAllObjects];

  v5.receiver = self;
  v5.super_class = (Class)SIPClientDataDictionary;
  [(SIPClientDataDictionary *)&v5 dealloc];
}

- (id)copyObjectForKey:(id)a3 p2pID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_sync_enter(self);
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v4];
  __int16 v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->allCalls, "objectForKeyedSubscript:", v7), "objectForKeyedSubscript:", a3);

  id v9 = v8;
  objc_sync_exit(self);
  return v8;
}

- (void)setObject:(id)a3 forKey:(id)a4 forP2PID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  objc_sync_enter(self);
  id v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:v5];
  __int16 v10 = (void *)[(NSMutableDictionary *)self->allCalls objectForKeyedSubscript:v9];
  if (!v10)
  {
    __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    [(NSMutableDictionary *)self->allCalls setObject:v10 forKeyedSubscript:v9];
  }
  if (a3) {
    [v10 setObject:a3 forKeyedSubscript:a4];
  }
  else {
    [v10 removeObjectForKey:a4];
  }

  objc_sync_exit(self);
}

@end