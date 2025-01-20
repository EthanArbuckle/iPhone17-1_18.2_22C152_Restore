@interface MOPassthroughSubject
+ (id)new;
- (BOOL)hasSubscriptionWithIdentifier:(id)a3;
- (MOPassthroughSubject)init;
- (NSMutableDictionary)downstreams;
- (void)disassociate:(id)a3;
- (void)sendCompletion:(id)a3;
- (void)sendValue:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation MOPassthroughSubject

+ (id)new
{
  return (id)MEMORY[0x1F4181648](a1, a2);
}

- (MOPassthroughSubject)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOPassthroughSubject;
  v2 = [(MOSubject *)&v6 initSubject];
  uint64_t v3 = objc_opt_new();
  downstreams = v2->_downstreams;
  v2->_downstreams = (NSMutableDictionary *)v3;

  return v2;
}

- (void)subscribe:(id)a3
{
  id v8 = a3;
  v4 = [[MOPassthroughSubjectConduit alloc] initWithDownstream:v8 parent:self];
  v5 = self->_downstreams;
  objc_sync_enter(v5);
  downstreams = self->_downstreams;
  v7 = [(MOPassthroughSubjectConduit *)v4 identifier];
  [(NSMutableDictionary *)downstreams setObject:v4 forKeyedSubscript:v7];

  objc_sync_exit(v5);
  [v8 receiveSubscription:v4];
}

- (void)disassociate:(id)a3
{
  id v5 = a3;
  v4 = self->_downstreams;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)self->_downstreams setObject:0 forKeyedSubscript:v5];
  objc_sync_exit(v4);
}

- (void)sendValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_downstreams;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)self->_downstreams allValues];
  v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasDemand", (void)v13)) {
          [v12 offerInput:v4];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)sendCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_downstreams;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)self->_downstreams allValues];
  v7 = (void *)[v6 copy];

  objc_sync_exit(v5);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "finishWithCompletion:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)hasSubscriptionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_downstreams;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)self->_downstreams objectForKeyedSubscript:v4];
  LOBYTE(self) = v6 != 0;

  objc_sync_exit(v5);
  return (char)self;
}

- (NSMutableDictionary)downstreams
{
  return self->_downstreams;
}

- (void).cxx_destruct
{
}

@end