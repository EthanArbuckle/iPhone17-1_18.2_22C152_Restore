@interface _BPSInnerBiomeSubscription
- (_BPSInnerBiomeSubscription)initWithStreamEnumerator:(id)a3 downstream:(id)a4 streamId:(id)a5 accessClient:(id)a6;
- (id)newBookmark;
- (id)upstreamSubscriptions;
- (void)cancel;
- (void)requestDemand:(int64_t)a3;
@end

@implementation _BPSInnerBiomeSubscription

- (_BPSInnerBiomeSubscription)initWithStreamEnumerator:(id)a3 downstream:(id)a4 streamId:(id)a5 accessClient:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_BPSInnerBiomeSubscription;
  v15 = [(_BPSInnerBiomeSubscription *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_enumerator, a3);
    objc_storeStrong((id *)&v16->_downstream, a4);
    v16->_pendingDemand = 0;
    objc_storeStrong((id *)&v16->_streamId, a5);
    v16->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v16->_accessClient, a6);
  }

  return v16;
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  v6 = v4->_downstream;
  if (!v6)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      streamId = v4->_streamId;
      *(_DWORD *)buf = 138412546;
      v44 = v11;
      __int16 v45 = 2112;
      v46 = streamId;
      _os_log_impl(&dword_18E67D000, v9, OS_LOG_TYPE_DEFAULT, "%@ - Downstream is nil. StreamId: %@", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    id v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v14 stringWithFormat:@"%@ - Downstream is nil. StreamId: %@", v16, v4->_streamId];
    v42 = v17;
    objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    v19 = [v13 errorWithDomain:@"com.apple.biome.BiomeStreams" code:-1 userInfo:v18];

    os_unfair_lock_unlock(p_lock);
    v20 = [MEMORY[0x1E4F501F8] failureWithError:v19];
    v21 = 0;
    goto LABEL_16;
  }
  enumerator = v4->_enumerator;
  if (!enumerator)
  {
    v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[_BPSInnerBiomeSubscription requestDemand:]();
    }

    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40 = @"Can't form store enumerator. Going to complete this source";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v25 = v23;
    uint64_t v26 = -1;
    goto LABEL_15;
  }
  if (([(BMStoreEnumerator *)enumerator isDataAccessible] & 1) == 0)
  {
    v27 = __biome_log_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[_BPSInnerBiomeSubscription requestDemand:]();
    }

    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38 = @"Enumerator doesn't have access to data. Going to complete this source";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v25 = v28;
    uint64_t v26 = 1;
LABEL_15:
    v19 = [v25 errorWithDomain:@"com.apple.biome.BiomeStreams" code:v26 userInfo:v24];

    downstream = v4->_downstream;
    v4->_downstream = 0;

    os_unfair_lock_unlock(p_lock);
    v20 = [MEMORY[0x1E4F501F8] failureWithError:v19];
    v21 = v6;
LABEL_16:
    [(BPSSubscriber *)v21 receiveCompletion:v20];

    goto LABEL_17;
  }
  int64_t v8 = v4->_pendingDemand + a3;
  v4->_pendingDemand = v8;
  if (v4->_recursion || v8 < 1)
  {
LABEL_5:
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    while (1)
    {
      v30 = (void *)MEMORY[0x192FB0D60]();
      v31 = v4->_enumerator;
      if (!v31) {
        break;
      }
      uint64_t v32 = [(BMStoreEnumerator *)v31 nextEvent];
      if (!v32)
      {
        v36 = v4->_downstream;
        v4->_downstream = 0;

        os_unfair_lock_unlock(p_lock);
        v35 = [MEMORY[0x1E4F501F8] success];
        [(BPSSubscriber *)v6 receiveCompletion:v35];
        goto LABEL_26;
      }
      v33 = (void *)v32;
      --v4->_pendingDemand;
      v4->_recursion = 1;
      os_unfair_lock_unlock(p_lock);
      uint64_t v34 = [(BPSSubscriber *)v6 receiveInput:v33];
      os_unfair_lock_lock(p_lock);
      v4->_pendingDemand += v34;
      v4->_recursion = 0;

      if (v4->_pendingDemand <= 0) {
        goto LABEL_5;
      }
    }
    v35 = __biome_log_for_category();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[_BPSInnerBiomeSubscription requestDemand:]();
    }
LABEL_26:
  }
LABEL_17:
}

- (void)cancel
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = self;
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_18E67D000, v3, OS_LOG_TYPE_INFO, "%@ - cancel", (uint8_t *)&v8, 0xCu);
  }
  os_unfair_lock_lock(&v2->_lock);
  downstream = v2->_downstream;
  v2->_downstream = 0;

  enumerator = v2->_enumerator;
  v2->_enumerator = 0;

  os_unfair_lock_unlock(&v2->_lock);
}

- (id)upstreamSubscriptions
{
  return 0;
}

- (id)newBookmark
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    streamId = self->_streamId;
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    id v11 = streamId;
    _os_log_impl(&dword_18E67D000, v3, OS_LOG_TYPE_INFO, "%@ - get new store bookmark for stream: %@", (uint8_t *)&v8, 0x16u);
  }
  [(BMStoreEnumerator *)self->_enumerator bookmark];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_downstream, 0);

  objc_storeStrong((id *)&self->_enumerator, 0);
}

- (void)requestDemand:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v2, v3, "%@ - Can't form store enumerator. Going to early return and tell downstream to complete. StreamId: %@", v4, v5, v6, v7, v8);
}

- (void)requestDemand:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_5(&dword_18E67D000, v2, v3, "%@ - Enumerator shouldn't become nil during enumeration. StreamId: %@", v4, v5, v6, v7, v8);
}

- (void)requestDemand:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v2, v3, "%@ - Can't access data for stream: %@. Going to early return and tell downstream to complete.", v4, v5, v6, v7, v8);
}

@end