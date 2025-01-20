@interface MCMCommandFlushContainerCache
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (BOOL)transient;
- (MCMCommandFlushContainerCache)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerConfiguration)containerConfig;
- (MCMXPCMessage)message;
- (void)execute;
@end

@implementation MCMCommandFlushContainerCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_containerConfig, 0);
}

- (MCMXPCMessage)message
{
  return self->_message;
}

- (BOOL)transient
{
  return self->_transient;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (void)execute
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9478DF0](self, a2);
  v4 = [(MCMCommand *)self context];
  v5 = [v4 containerCache];
  v6 = [(MCMCommand *)self context];
  v7 = [v6 clientIdentity];
  v8 = [v7 userIdentity];
  v9 = [(MCMCommandFlushContainerCache *)self containerConfig];
  objc_msgSend(v5, "flushCacheForUserIdentity:containerClass:transient:", v8, objc_msgSend(v9, "containerClass"), -[MCMCommandFlushContainerCache transient](self, "transient"));

  v10 = container_log_handle_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D7739000, v10, OS_LOG_TYPE_DEFAULT, "Cache flushed", v13, 2u);
  }

  v11 = [[MCMResultBase alloc] initWithError:0];
  v12 = [(MCMCommand *)self resultPromise];
  [v12 completeWithResult:v11];
}

- (BOOL)preflightClientAllowed
{
  v2 = [(MCMCommand *)self context];
  v3 = [v2 clientIdentity];
  char v4 = [v3 isAllowedToControlCaches];

  return v4;
}

- (MCMCommandFlushContainerCache)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMCommandFlushContainerCache;
  v10 = [(MCMCommand *)&v14 initWithMessage:v9 context:a4 reply:a5];
  if (v10)
  {
    uint64_t v11 = [v9 containerConfig];
    containerConfig = v10->_containerConfig;
    v10->_containerConfig = (MCMContainerConfiguration *)v11;

    v10->_transient = [v9 transient];
    objc_storeStrong((id *)&v10->_message, a3);
  }

  return v10;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)command
{
  return 33;
}

@end