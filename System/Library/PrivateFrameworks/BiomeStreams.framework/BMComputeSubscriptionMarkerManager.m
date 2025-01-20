@interface BMComputeSubscriptionMarkerManager
- (BMComputeSubscriptionMarkerManager)initWithUserStorage:(id)a3 systemStorage:(id)a4 domain:(unint64_t)a5;
- (BMComputeXPCPublisherStorage)systemStorage;
- (BMComputeXPCPublisherStorage)userStorage;
- (NSCountedSet)activelySubscribedStreams;
- (id)_subscriptionMarkerStorageForDomain:(unint64_t)a3;
- (unint64_t)domain;
- (void)addSubscriptionWithStreamIdentifier:(id)a3;
- (void)removeSubscriptionWithStreamIdentifier:(id)a3;
@end

@implementation BMComputeSubscriptionMarkerManager

- (BMComputeSubscriptionMarkerManager)initWithUserStorage:(id)a3 systemStorage:(id)a4 domain:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMComputeSubscriptionMarkerManager;
  v11 = [(BMComputeSubscriptionMarkerManager *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userStorage, a3);
    objc_storeStrong((id *)&v12->_systemStorage, a4);
    v12->_domain = a5;
    v13 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    activelySubscribedStreams = v12->_activelySubscribedStreams;
    v12->_activelySubscribedStreams = v13;
  }
  return v12;
}

- (id)_subscriptionMarkerStorageForDomain:(unint64_t)a3
{
  return self->_userStorage;
}

- (void)addSubscriptionWithStreamIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (([v4 hasSuffix:@":subscriptions"] & 1) == 0)
  {
    v5 = v4;
    if ([v4 hasSuffix:@":tombstones"])
    {
      v6 = [v4 componentsSeparatedByString:@":"];
      v5 = [v6 firstObject];
    }
    v7 = BiomeLibraryAndInternalLibraryNode();
    id v17 = 0;
    v8 = [v7 streamWithIdentifier:v5 error:&v17];
    id v9 = v17;

    if (v9)
    {
      id v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BMComputeSubscriptionMarkerManager addSubscriptionWithStreamIdentifier:]();
      }
    }
    else
    {
      v11 = [v8 configuration];
      v12 = [v11 storeConfig];
      uint64_t v13 = [v12 domain];

      v14 = [(BMComputeSubscriptionMarkerManager *)self activelySubscribedStreams];
      uint64_t v15 = [v14 countForObject:v4];

      if (!v15)
      {
        objc_super v16 = [(BMComputeSubscriptionMarkerManager *)self _subscriptionMarkerStorageForDomain:v13];
        [v16 writeActiveSubscriptionMarkerForStream:v4];
      }
      id v10 = [(BMComputeSubscriptionMarkerManager *)self activelySubscribedStreams];
      [v10 addObject:v4];
    }
  }
}

- (void)removeSubscriptionWithStreamIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (([v4 hasSuffix:@":subscriptions"] & 1) == 0)
  {
    v5 = v4;
    if ([v4 hasSuffix:@":tombstones"])
    {
      v6 = [v4 componentsSeparatedByString:@":"];
      v5 = [v6 firstObject];
    }
    v7 = BiomeLibraryAndInternalLibraryNode();
    id v20 = 0;
    v8 = [v7 streamWithIdentifier:v5 error:&v20];
    id v9 = v20;

    if (v9)
    {
      id v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[BMComputeSubscriptionMarkerManager removeSubscriptionWithStreamIdentifier:]();
      }
    }
    else
    {
      v11 = [v8 configuration];
      v12 = [v11 storeConfig];
      uint64_t v13 = [v12 domain];

      v14 = [(BMComputeSubscriptionMarkerManager *)self activelySubscribedStreams];
      uint64_t v15 = [v14 countForObject:v4];

      if (!v15)
      {
        objc_super v16 = __biome_log_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[BMComputeSubscriptionMarkerManager removeSubscriptionWithStreamIdentifier:]((uint64_t)v4, v16);
        }
      }
      id v17 = [(BMComputeSubscriptionMarkerManager *)self activelySubscribedStreams];
      [v17 removeObject:v4];

      v18 = [(BMComputeSubscriptionMarkerManager *)self activelySubscribedStreams];
      uint64_t v19 = [v18 countForObject:v4];

      if (v19) {
        goto LABEL_13;
      }
      id v10 = [(BMComputeSubscriptionMarkerManager *)self _subscriptionMarkerStorageForDomain:v13];
      [v10 removeActiveSubscriptionMarkerForStream:v4];
    }

LABEL_13:
  }
}

- (NSCountedSet)activelySubscribedStreams
{
  return self->_activelySubscribedStreams;
}

- (BMComputeXPCPublisherStorage)systemStorage
{
  return self->_systemStorage;
}

- (BMComputeXPCPublisherStorage)userStorage
{
  return self->_userStorage;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorage, 0);
  objc_storeStrong((id *)&self->_systemStorage, 0);

  objc_storeStrong((id *)&self->_activelySubscribedStreams, 0);
}

- (void)addSubscriptionWithStreamIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "addSubscriptionWithStreamIdentifier: could not find stream for streamIdentifier: %@, err: %@");
}

- (void)removeSubscriptionWithStreamIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "unexpected removal of stream %@ that currently has an active subscription count of 0", (uint8_t *)&v2, 0xCu);
}

- (void)removeSubscriptionWithStreamIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "removeSubscriptionWithStreamIdentifier: could not find stream for streamIdentifier: %@, err: %@");
}

@end