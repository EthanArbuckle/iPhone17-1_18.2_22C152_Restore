@interface _BPSCorrelateInner
- (BPSCorrelateHandler)correlateHandler;
- (_BPSCorrelateInner)initWithDownstream:(id)a3 correlateHandler:(id)a4;
- (id)newBookmark;
- (id)receiveNewValue:(id)a3 source:(int64_t)a4;
@end

@implementation _BPSCorrelateInner

- (_BPSCorrelateInner)initWithDownstream:(id)a3 correlateHandler:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSCorrelateInner;
  v8 = [(BPSCorrelationProducer *)&v11 initWithDownstream:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_correlateHandler, a4);
  }

  return v9;
}

- (id)receiveNewValue:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    [(BPSCorrelateHandler *)self->_correlateHandler receiveCurrentEvent:v6];
    id v7 = [(BPSCorrelateHandler *)self->_correlateHandler correlateWithCurrentEvent:v6];
  }
  else
  {
    if (a4 == 1) {
      [(BPSCorrelateHandler *)self->_correlateHandler receivePriorEvent:v6];
    }
    id v7 = 0;
  }
  v8 = [[BPSPartialCompletion alloc] initWithState:1 value:v7 error:0];

  return v8;
}

- (id)newBookmark
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [(BPSCorrelationProducer *)self upstreamSubscriptions];
  v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1F040FEE8])
        {
          uint64_t v10 = [v9 newBookmark];
          if (v10) {
            goto LABEL_13;
          }
        }
        else
        {
          objc_super v11 = __biome_log_for_category();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v9;
            _os_log_error_impl(&dword_1AD01F000, v11, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", buf, 0xCu);
          }
        }
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
LABEL_13:
        v12 = (void *)v10;
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  v13 = [BMBookmarkNode alloc];
  v14 = [(BPSCorrelateHandler *)self->_correlateHandler context];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [(BMBookmarkNode *)v13 initWithValue:v14 upstreams:v3 name:v16];

  return v17;
}

- (BPSCorrelateHandler)correlateHandler
{
  return self->_correlateHandler;
}

- (void).cxx_destruct
{
}

@end