@interface C2RoutingTable
- (C2RoutingTable)init;
- (NSMutableDictionary)routingTable;
- (id)copyAndDecorateRequest:(id)a3;
- (void)setRoutingTable:(id)a3;
- (void)updateOriginalHostname:(id)a3 destinationHostname:(id)a4;
@end

@implementation C2RoutingTable

- (id)copyAndDecorateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 URL];
    v8 = [v7 host];

    if (v8)
    {
      v9 = self;
      objc_sync_enter(v9);
      v10 = [(NSMutableDictionary *)v9->_routingTable objectForKeyedSubscript:v8];
      objc_sync_exit(v9);

      if (v10)
      {
        [v10 lastUpdated];
        if (v11 < CFAbsoluteTimeGetCurrent() + 1800.0)
        {
          id v12 = objc_alloc(MEMORY[0x1E4F29088]);
          v13 = [v6 URL];
          v14 = (void *)[v12 initWithURL:v13 resolvingAgainstBaseURL:1];

          v15 = [v10 destination];
          [v14 setHost:v15];

          v16 = [v14 URL];
          if (v16) {
            [v6 setURL:v16];
          }
        }
      }
      id v17 = v6;
    }
    else
    {
      id v17 = v4;
    }
  }
  else
  {
    id v17 = v4;
  }

  return v17;
}

- (C2RoutingTable)init
{
  v7.receiver = self;
  v7.super_class = (Class)C2RoutingTable;
  v2 = [(C2RoutingTable *)&v7 init];
  if (v2
    && (v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]),
        routingTable = v2->_routingTable,
        v2->_routingTable = v3,
        routingTable,
        !v2->_routingTable))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)updateOriginalHostname:(id)a3 destinationHostname:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_super v7 = objc_alloc_init(C2Route);
  [(C2Route *)v7 setDestination:v6];
  [(C2Route *)v7 setLastUpdated:CFAbsoluteTimeGetCurrent()];
  v8 = self;
  objc_sync_enter(v8);
  [(NSMutableDictionary *)v8->_routingTable setObject:v7 forKeyedSubscript:v9];
  objc_sync_exit(v8);
}

- (NSMutableDictionary)routingTable
{
  return self->_routingTable;
}

- (void)setRoutingTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end