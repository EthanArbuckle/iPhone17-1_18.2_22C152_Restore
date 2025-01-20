@interface _AXAssertionServer
- (NSMutableDictionary)heldAssertionMap;
- (_AXAssertionServer)init;
- (id)assertionWasAcquiredHandler;
- (id)assertionWasReleasedHandler;
- (id)clientsHoldingAssertionOfType:(id)a3;
- (id)description;
- (void)addHeldAssertionOfType:(id)a3 byClient:(id)a4;
- (void)removeHeldAssertionOfType:(id)a3 byClient:(id)a4;
- (void)setAssertionWasAcquiredHandler:(id)a3;
- (void)setAssertionWasReleasedHandler:(id)a3;
- (void)setHeldAssertionMap:(id)a3;
@end

@implementation _AXAssertionServer

- (_AXAssertionServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_AXAssertionServer;
  v2 = [(_AXAssertionServer *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_AXAssertionServer *)v2 setHeldAssertionMap:v3];
  }
  return v2;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"_AXAssertionServer:<%p> Held Assertions:\n", self);
  v4 = [(_AXAssertionServer *)self heldAssertionMap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33___AXAssertionServer_description__block_invoke;
  v7[3] = &unk_1E5587088;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)addHeldAssertionOfType:(id)a3 byClient:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  v7 = [(_AXAssertionServer *)self heldAssertionMap];
  uint64_t v8 = [v7 objectForKey:v18];

  v9 = (void *)v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA80] set];
    v10 = [(_AXAssertionServer *)self heldAssertionMap];
    [v10 setObject:v9 forKey:v18];
  }
  if ([v9 containsObject:v6])
  {
    id v16 = v18;
    v17 = v9;
    v14 = @"Trying to add assertion holder ID:(%@) with type:(%@), but that ID is already in the holders list: (%@). Something is out of wack";
    id v15 = v6;
    LOBYTE(v13) = 1;
    _AXLogWithFacility();
  }
  objc_msgSend(v9, "addObject:", v6, v13, v14, v15, v16, v17);
  if (!v8)
  {
    v11 = [(_AXAssertionServer *)self assertionWasAcquiredHandler];

    if (v11)
    {
      v12 = [(_AXAssertionServer *)self assertionWasAcquiredHandler];
      ((void (**)(void, id))v12)[2](v12, v18);
    }
  }
}

- (void)removeHeldAssertionOfType:(id)a3 byClient:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(_AXAssertionServer *)self heldAssertionMap];
  uint64_t v8 = [v7 objectForKey:v11];

  if (([v8 containsObject:v6] & 1) == 0)
  {
    _AXLogWithFacility();
    goto LABEL_6;
  }
  [v8 removeObject:v6];

  if (![v8 count])
  {
    v9 = [(_AXAssertionServer *)self heldAssertionMap];
    [v9 removeObjectForKey:v11];

    v10 = [(_AXAssertionServer *)self assertionWasReleasedHandler];

    if (v10)
    {
      id v6 = [(_AXAssertionServer *)self assertionWasReleasedHandler];
      (*((void (**)(id, id))v6 + 2))(v6, v11);
LABEL_6:
    }
  }
}

- (id)clientsHoldingAssertionOfType:(id)a3
{
  id v4 = a3;
  id v5 = [(_AXAssertionServer *)self heldAssertionMap];
  id v6 = [v5 objectForKey:v4];

  v7 = [v6 allObjects];

  return v7;
}

- (id)assertionWasAcquiredHandler
{
  return self->_assertionWasAcquiredHandler;
}

- (void)setAssertionWasAcquiredHandler:(id)a3
{
}

- (id)assertionWasReleasedHandler
{
  return self->_assertionWasReleasedHandler;
}

- (void)setAssertionWasReleasedHandler:(id)a3
{
}

- (NSMutableDictionary)heldAssertionMap
{
  return self->_heldAssertionMap;
}

- (void)setHeldAssertionMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heldAssertionMap, 0);
  objc_storeStrong(&self->_assertionWasReleasedHandler, 0);

  objc_storeStrong(&self->_assertionWasAcquiredHandler, 0);
}

@end