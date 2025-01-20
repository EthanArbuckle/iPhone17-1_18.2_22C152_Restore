@interface IDSGroupContextNotifyingObserver
- (IDSGroupContextNotifyingObserver)init;
- (NSMutableSet)delegates;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)didCacheGroup:(id)a3 completion:(id)a4;
- (void)didCreateGroup:(id)a3 completion:(id)a4;
- (void)didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4;
- (void)didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3;
- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
@end

@implementation IDSGroupContextNotifyingObserver

- (IDSGroupContextNotifyingObserver)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = [MEMORY[0x1E4F61160] groupContext];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v3);
    }

    v4 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IDSGroupContextNotifyingObserver;
    v5 = [(IDSGroupContextNotifyingObserver *)&v9 init];
    if (v5)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      delegates = v5->_delegates;
      v5->_delegates = v6;
    }
    self = v5;
    v4 = self;
  }

  return v4;
}

- (void)addDelegate:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_delegates, "addObject:");
  }
}

- (void)removeDelegate:(id)a3
{
  if (a3) {
    -[NSMutableSet removeObject:](self->_delegates, "removeObject:");
  }
}

- (void)dealloc
{
  delegates = self->_delegates;
  self->_delegates = 0;

  v4.receiver = self;
  v4.super_class = (Class)IDSGroupContextNotifyingObserver;
  [(IDSGroupContextNotifyingObserver *)&v4 dealloc];
}

- (void)didCreateGroup:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = self->_delegates;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v13, "didCreateGroup:completion:", v6, v7, (void)v14);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)didCacheGroup:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = self->_delegates;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v13, "didCacheGroup:completion:", v6, v7, (void)v14);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)didUpdateGroup:(id)a3 withNewGroup:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = self->_delegates;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v16, "didUpdateGroup:withNewGroup:completion:", v8, v9, v10, (void)v17);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)didReceiveDecryptionFailureForGroup:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = self->_delegates;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v13, "didReceiveDecryptionFailureForGroup:completion:", v6, v7, (void)v14);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)didReceiveRegistrationIdentityUpdateWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F61160] groupContext];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    delegates = self->_delegates;
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = delegates;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_INFO, "Did receive registration identity update {delegates: %{public}@}", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = self->_delegates;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "didReceiveRegistrationIdentityUpdateWithCompletion:", v4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSMutableSet)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end