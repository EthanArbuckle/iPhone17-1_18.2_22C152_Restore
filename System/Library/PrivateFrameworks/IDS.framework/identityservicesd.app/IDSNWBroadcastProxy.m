@interface IDSNWBroadcastProxy
- (IDSNWBroadcastProxy)initWithTargets:(id)a3;
- (NSArray)targets;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)setTargets:(id)a3;
@end

@implementation IDSNWBroadcastProxy

- (IDSNWBroadcastProxy)initWithTargets:(id)a3
{
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_targets;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "methodSignatureForSelector:", a3, (void)v12);
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_targets count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = self->_targets;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v9);
          objc_msgSend(v4, "selector", (void)v11);
          if (objc_opt_respondsToSelector()) {
            [v4 invokeWithTarget:v10];
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (NSArray)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end