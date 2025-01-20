@interface CHLogServer
+ (id)sharedInstance;
- (CHLogServer)init;
- (NSMutableDictionary)logHandleToDomain;
- (id)logHandleForDomain:(const char *)a3;
- (os_unfair_lock_s)accessorLock;
@end

@implementation CHLogServer

- (id)logHandleForDomain:(const char *)a3
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v6 = [NSString stringWithUTF8String:a3];
  v7 = [(CHLogServer *)self logHandleToDomain];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    v8 = os_log_create("com.apple.callhistory", a3);
    v9 = [(CHLogServer *)self logHandleToDomain];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(p_accessorLock);
  return v8;
}

- (NSMutableDictionary)logHandleToDomain
{
  return self->_logHandleToDomain;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sLogServer;
  return v2;
}

uint64_t __29__CHLogServer_sharedInstance__block_invoke()
{
  sharedInstance_sLogServer = objc_alloc_init(CHLogServer);
  return MEMORY[0x1F41817F8]();
}

- (CHLogServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)CHLogServer;
  v2 = [(CHLogServer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    logHandleToDomain = v3->_logHandleToDomain;
    v3->_logHandleToDomain = v4;
  }
  return v3;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
}

@end