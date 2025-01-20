@interface ABSChangeCallbacks
- (ABSChangeCallbacks)initWithAddressBook:(id)a3;
- (BOOL)hasExternalCallback:(void *)a3 onThread:(id)a4 withContext:(void *)a5;
- (void)addExternalCallback:(void *)a3 onThread:(id)a4 withContext:(void *)a5;
- (void)contactStoreChanged:(id)a3;
- (void)dealloc;
- (void)removeExternalCallback:(void *)a3 withContext:(void *)a4;
@end

@implementation ABSChangeCallbacks

- (ABSChangeCallbacks)initWithAddressBook:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ABSChangeCallbacks;
  v5 = [(ABSChangeCallbacks *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_addressBook, v4);
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    externalCallbacks = v6->_externalCallbacks;
    v6->_externalCallbacks = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    externalCallBackThreads = v6->_externalCallBackThreads;
    v6->_externalCallBackThreads = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    externalCallbackContexts = v6->_externalCallbackContexts;
    v6->_externalCallbackContexts = (NSMutableArray *)v11;

    v6->_initialAccessStatus = +[ABSAddressBook authorizationStatus];
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v6 selector:sel_contactStoreChanged_ name:*MEMORY[0x263EFE118] object:0];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v6 selector:sel_contactStoreChanged_ name:@"ABSInvokeAllLocalCallbacksNotification" object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  objc_storeWeak((id *)&self->_addressBook, 0);
  externalCallbacks = self->_externalCallbacks;
  self->_externalCallbacks = 0;

  externalCallBackThreads = self->_externalCallBackThreads;
  self->_externalCallBackThreads = 0;

  externalCallbackContexts = self->_externalCallbackContexts;
  self->_externalCallbackContexts = 0;

  v7.receiver = self;
  v7.super_class = (Class)ABSChangeCallbacks;
  [(ABSChangeCallbacks *)&v7 dealloc];
}

- (void)contactStoreChanged:(id)a3
{
  id v18 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([(NSMutableArray *)v4->_externalCallbacks count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_addressBook);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&v4->_addressBook);
      objc_super v7 = (void *)[(NSMutableArray *)v4->_externalCallbacks copy];
      v8 = (void *)[(NSMutableArray *)v4->_externalCallBackThreads copy];
      uint64_t v9 = (void *)[(NSMutableArray *)v4->_externalCallbackContexts copy];
      for (unint64_t i = 0; ; ++i)
      {
        if (i >= [v7 count])
        {
          CFRelease(v6);

          goto LABEL_12;
        }
        uint64_t v11 = [v7 objectAtIndexedSubscript:i];
        uint64_t v12 = [v11 unsignedLongValue];

        v13 = [v9 objectAtIndexedSubscript:i];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          break;
        }
        v15 = [v9 objectAtIndexedSubscript:i];
        uint64_t v16 = [v15 unsignedLongValue];

        if (v12) {
          goto LABEL_9;
        }
LABEL_10:
        ;
      }
      uint64_t v16 = 0;
      if (!v12) {
        goto LABEL_10;
      }
LABEL_9:
      v17 = [v8 objectAtIndexedSubscript:i];
      +[ABSCallbackInvoker invokeOnThread:v17 callback:v12 withAddressBook:v6 context:v16];

      goto LABEL_10;
    }
  }
LABEL_12:
  objc_sync_exit(v4);
}

- (void)addExternalCallback:(void *)a3 onThread:(id)a4 withContext:(void *)a5
{
  id v18 = a4;
  if (CNLinkedOnOrAfter()
    || self->_initialAccessStatus
    || +[ABSAddressBook authorizationStatus] != 3)
  {
    int v9 = 0;
  }
  else
  {
    v8 = [MEMORY[0x263F08B88] currentThread];
    int v9 = ![(ABSChangeCallbacks *)self hasExternalCallback:a3 onThread:v8 withContext:a5];
  }
  v10 = self;
  objc_sync_enter(v10);
  if (a3)
  {
    externalCallbacks = v10->_externalCallbacks;
    uint64_t v12 = [NSNumber numberWithUnsignedLong:a3];
    [(NSMutableArray *)externalCallbacks addObject:v12];

    externalCallBackThreads = v10->_externalCallBackThreads;
    v14 = [MEMORY[0x263F08B88] currentThread];
    [(NSMutableArray *)externalCallBackThreads addObject:v14];

    externalCallbackContexts = v10->_externalCallbackContexts;
    if (a5) {
      [NSNumber numberWithUnsignedLong:a5];
    }
    else {
    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
    }
    [(NSMutableArray *)externalCallbackContexts addObject:v16];
  }
  objc_sync_exit(v10);

  if (v9)
  {
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 postNotificationName:@"ABSInvokeAllLocalCallbacksNotification" object:v10];
  }
}

- (BOOL)hasExternalCallback:(void *)a3 onThread:(id)a4 withContext:(void *)a5
{
  id v8 = a4;
  int v9 = self;
  objc_sync_enter(v9);
  if (a3 && [(NSMutableArray *)v9->_externalCallbacks count])
  {
    v10 = [NSNumber numberWithUnsignedLong:a3];
    if (a5) {
      [NSNumber numberWithUnsignedLong:a5];
    }
    else {
    uint64_t v12 = [MEMORY[0x263EFF9D0] null];
    }
    char v13 = 0;
    for (unint64_t i = 0; ; ++i)
    {
      BOOL v11 = v13 & 1;
      if (i >= [(NSMutableArray *)v9->_externalCallbacks count] || v11) {
        break;
      }
      uint64_t v16 = [(NSMutableArray *)v9->_externalCallbacks objectAtIndexedSubscript:i];
      if (v16 == v10)
      {
        v17 = [(NSMutableArray *)v9->_externalCallbackContexts objectAtIndexedSubscript:i];
        if (v17 == v12)
        {
          id v18 = [(NSMutableArray *)v9->_externalCallBackThreads objectAtIndexedSubscript:i];

          if (v18 == v8) {
            char v13 = 1;
          }
        }
        else
        {
        }
      }
      else
      {
      }
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  objc_sync_exit(v9);

  return v11;
}

- (void)removeExternalCallback:(void *)a3 withContext:(void *)a4
{
  obj = self;
  objc_sync_enter(obj);
  if (a3 && [(NSMutableArray *)obj->_externalCallbacks count])
  {
    id v6 = [NSNumber numberWithUnsignedLong:a3];
    if (a4) {
      [NSNumber numberWithUnsignedLong:a4];
    }
    else {
    objc_super v7 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v8 = [(NSMutableArray *)obj->_externalCallbacks count] - 1;
    if (v8 >= 0)
    {
      do
      {
        int v9 = [(NSMutableArray *)obj->_externalCallbacks objectAtIndexedSubscript:v8];
        if (v9 == v6)
        {
          v10 = [(NSMutableArray *)obj->_externalCallbackContexts objectAtIndexedSubscript:v8];

          if (v10 == v7)
          {
            [(NSMutableArray *)obj->_externalCallbacks removeObjectAtIndex:v8];
            [(NSMutableArray *)obj->_externalCallBackThreads removeObjectAtIndex:v8];
            [(NSMutableArray *)obj->_externalCallbackContexts removeObjectAtIndex:v8];
            break;
          }
        }
        else
        {
        }
        --v8;
      }
      while (v8 != -1);
    }
  }
  objc_sync_exit(obj);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalCallbackContexts, 0);
  objc_storeStrong((id *)&self->_externalCallBackThreads, 0);
  objc_storeStrong((id *)&self->_externalCallbacks, 0);

  objc_destroyWeak((id *)&self->_addressBook);
}

@end