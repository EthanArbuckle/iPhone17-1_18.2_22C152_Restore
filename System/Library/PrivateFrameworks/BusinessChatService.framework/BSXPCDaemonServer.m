@interface BSXPCDaemonServer
- (BSXPCDaemonServer)initWithServices:(id)a3;
- (NSArray)services;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setServices:(id)a3;
@end

@implementation BSXPCDaemonServer

- (BSXPCDaemonServer)initWithServices:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSXPCDaemonServer;
  v6 = [(BSXPCDaemonServer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_services, a3);
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(BSXPCDaemonServer *)self services];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v11 = [v10 methodSignatureForSelector:a3];

          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)BSXPCDaemonServer;
  v11 = [(BSXPCDaemonServer *)&v13 methodSignatureForSelector:a3];
LABEL_11:

  return v11;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(BSXPCDaemonServer *)self services];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          [v4 invokeWithTarget:v10];

          goto LABEL_11;
        }
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)BSXPCDaemonServer;
  [(BSXPCDaemonServer *)&v11 forwardInvocation:v4];
LABEL_11:
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end