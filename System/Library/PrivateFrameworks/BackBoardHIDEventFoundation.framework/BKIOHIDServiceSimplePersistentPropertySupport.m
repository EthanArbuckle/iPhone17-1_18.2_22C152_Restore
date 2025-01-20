@interface BKIOHIDServiceSimplePersistentPropertySupport
- (BKIOHIDServiceSimplePersistentPropertySupport)initWithSenderDescriptor:(id)a3 matcherDataProvider:(id)a4 persistentPropertyController:(id)a5;
- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3;
- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4;
- (void)invalidate;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
@end

@implementation BKIOHIDServiceSimplePersistentPropertySupport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_persistentPropertyController, 0);

  objc_storeStrong((id *)&self->_matcher, 0);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138543362;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        persistentPropertyController = self->_persistentPropertyController;
        v13 = objc_msgSend(v11, "senderDescriptor", v19);
        v14 = [(BKIOHIDServicePersistentPropertyController *)persistentPropertyController allPersistentPropertiesForServicesMatchingDescriptor:v13];

        uint64_t v15 = [v14 count];
        v16 = BKLogHID();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v17)
          {
            v18 = [MEMORY[0x1E4F4F720] descriptionForRootObject:v14];
            *(_DWORD *)buf = 138543618;
            v25 = v18;
            __int16 v26 = 2114;
            v27 = v11;
            _os_log_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_DEFAULT, "sending persistent properties %{public}@ to %{public}@", buf, 0x16u);
          }
          [v11 setProperties:v14];
        }
        else
        {
          if (v17)
          {
            *(_DWORD *)buf = v19;
            v25 = v11;
            _os_log_impl(&dword_1CFDE2000, v16, OS_LOG_TYPE_DEFAULT, "no persistent properties for %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(BKIOHIDServiceMatcher *)self->_matcher existingServices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setProperties:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return 2;
}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  return [(BKSHIDEventSenderDescriptor *)self->_senderDescriptor matchesDescriptor:a3 failureReason:0];
}

- (void)invalidate
{
  [(BKIOHIDServiceMatcher *)self->_matcher invalidate];
  matcher = self->_matcher;
  self->_matcher = 0;
}

- (BKIOHIDServiceSimplePersistentPropertySupport)initWithSenderDescriptor:(id)a3 matcherDataProvider:(id)a4 persistentPropertyController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BKIOHIDServiceSimplePersistentPropertySupport;
  long long v12 = [(BKIOHIDServiceSimplePersistentPropertySupport *)&v17 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_senderDescriptor, a3);
    objc_storeStrong((id *)&v13->_persistentPropertyController, a5);
    long long v14 = [[BKIOHIDServiceMatcher alloc] initWithSenderDescriptor:v9 dataProvider:v10];
    matcher = v13->_matcher;
    v13->_matcher = v14;

    [(BKIOHIDServiceMatcher *)v13->_matcher startObserving:v13 queue:MEMORY[0x1E4F14428]];
  }

  return v13;
}

@end