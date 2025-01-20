@interface AXUIServiceEntitlementChecker
- (AXUIServiceEntitlementChecker)initWithServiceClass:(Class)a3;
- (BOOL)_clientProcessWithAuditToken:(id *)a3 hasEntitlement:(id)a4;
- (BOOL)_isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3;
- (BOOL)serviceCanProcessMessageWithIdentifier:(unint64_t)a3 fromClientWithConnection:(id)a4 possibleRequiredEntitlements:(id *)a5 needsToRequireEntitlements:(BOOL *)a6;
- (Class)serviceClass;
- (NSMutableArray)clientConnections;
- (NSMutableArray)entitlementsCaches;
- (id)_possibleRequiredEntitlementForMessageWithIdentifier:(unint64_t)a3;
- (id)_singleRequiredEntitlementForMessageWithIdentifier:(unint64_t)a3;
- (unint64_t)_indexOfClientConnection:(id)a3;
- (void)clientConnectionWillBeTerminated:(id)a3;
- (void)dealloc;
- (void)setClientConnections:(id)a3;
- (void)setEntitlementsCaches:(id)a3;
- (void)setServiceClass:(Class)a3;
@end

@implementation AXUIServiceEntitlementChecker

- (AXUIServiceEntitlementChecker)initWithServiceClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXUIServiceEntitlementChecker;
  v4 = [(AXUIServiceEntitlementChecker *)&v7 init];
  v5 = v4;
  if (v4) {
    [(AXUIServiceEntitlementChecker *)v4 setServiceClass:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(AXUIServiceEntitlementChecker *)self setClientConnections:0];
  [(AXUIServiceEntitlementChecker *)self setEntitlementsCaches:0];
  v3.receiver = self;
  v3.super_class = (Class)AXUIServiceEntitlementChecker;
  [(AXUIServiceEntitlementChecker *)&v3 dealloc];
}

- (BOOL)serviceCanProcessMessageWithIdentifier:(unint64_t)a3 fromClientWithConnection:(id)a4 possibleRequiredEntitlements:(id *)a5 needsToRequireEntitlements:(BOOL *)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a4;
  v10 = [(AXUIServiceEntitlementChecker *)self clientConnections];
  uint64_t v11 = [v10 count];
  v12 = [(AXUIServiceEntitlementChecker *)self entitlementsCaches];
  uint64_t v13 = [v12 count];

  if (v11 != v13)
  {
    v14 = AXLogUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[AXUIServiceEntitlementChecker serviceCanProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:]((uint64_t)self, v14);
    }
  }
  unint64_t v15 = [(AXUIServiceEntitlementChecker *)self _indexOfClientConnection:v9];
  v16 = [(AXUIServiceEntitlementChecker *)self entitlementsCaches];
  unint64_t v17 = a3;
  v18 = [NSNumber numberWithUnsignedInteger:a3];
  v41 = v9;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    v19 = [v16 objectAtIndex:v15];
    v20 = [v19 objectForKey:v18];
    if (v20)
    {
      v21 = v20;
      LOBYTE(v22) = [v20 BOOLValue];
      v23 = a5;
      goto LABEL_36;
    }
  }
  v39 = v18;
  v21 = [(AXUIServiceEntitlementChecker *)self _singleRequiredEntitlementForMessageWithIdentifier:a3];
  if (v21)
  {
    v24 = 0;
LABEL_12:
    memset(v46, 0, sizeof(v46));
    if (v9) {
      [v9 auditToken];
    }
    v38 = v16;
    if (v21)
    {
      LODWORD(v25) = [(AXUIServiceEntitlementChecker *)self _clientProcessWithAuditToken:v46 hasEntitlement:v21];
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v26 = v24;
      uint64_t v25 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v25)
      {
        v37 = a6;
        uint64_t v27 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v26);
            }
            if ([(AXUIServiceEntitlementChecker *)self _clientProcessWithAuditToken:v46 hasEntitlement:*(void *)(*((void *)&v42 + 1) + 8 * i)])
            {
              LODWORD(v25) = 1;
              goto LABEL_26;
            }
          }
          uint64_t v25 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
          if (v25) {
            continue;
          }
          break;
        }
LABEL_26:
        a6 = v37;
        unint64_t v17 = a3;
      }
    }
    v23 = a5;
    uint64_t v22 = v25 != 0;

    v16 = v38;
    goto LABEL_29;
  }
  v24 = [(AXUIServiceEntitlementChecker *)self _possibleRequiredEntitlementForMessageWithIdentifier:a3];
  if (v24) {
    goto LABEL_12;
  }
  uint64_t v22 = [(AXUIServiceEntitlementChecker *)self _isSafeToProcessMessageFromUnentitledProcessWithIdentifier:a3];
  v23 = a5;
LABEL_29:
  v18 = v39;
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = [(AXUIServiceEntitlementChecker *)self clientConnections];
    if (!v29)
    {
      v29 = objc_opt_new();
      [(AXUIServiceEntitlementChecker *)self setClientConnections:v29];
    }
    [v29 addObject:v41];
    if (!v16)
    {
      v16 = objc_opt_new();
      [(AXUIServiceEntitlementChecker *)self setEntitlementsCaches:v16];
    }
    uint64_t v30 = objc_opt_new();

    [v16 addObject:v30];
    v19 = (void *)v30;
    v18 = v39;
  }
  v31 = [NSNumber numberWithBool:v22];
  [v19 setObject:v31 forKey:v18];

LABEL_36:
  if (!v23)
  {
    if (!a6) {
      goto LABEL_51;
    }
    if (v22)
    {
LABEL_42:
      *a6 = 0;
      goto LABEL_51;
    }
    goto LABEL_47;
  }
  if (v22)
  {
    id *v23 = 0;
    if (!a6) {
      goto LABEL_51;
    }
    goto LABEL_42;
  }
  v32 = [(AXUIServiceEntitlementChecker *)self _singleRequiredEntitlementForMessageWithIdentifier:v17];
  if (v32) {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v32, 0);
  }
  else {
  id v33 = [(AXUIServiceEntitlementChecker *)self _possibleRequiredEntitlementForMessageWithIdentifier:v17];
  }
  id *v23 = v33;

  if (a6)
  {
LABEL_47:
    v34 = [(AXUIServiceEntitlementChecker *)self _singleRequiredEntitlementForMessageWithIdentifier:v17];
    if (v34)
    {
      *a6 = 0;
    }
    else
    {
      v35 = [(AXUIServiceEntitlementChecker *)self _possibleRequiredEntitlementForMessageWithIdentifier:v17];
      *a6 = v35 == 0;
    }
  }
LABEL_51:

  return v22;
}

- (void)clientConnectionWillBeTerminated:(id)a3
{
  unint64_t v4 = [(AXUIServiceEntitlementChecker *)self _indexOfClientConnection:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v7 = [(AXUIServiceEntitlementChecker *)self clientConnections];
    [v7 removeObjectAtIndex:v5];
    if (![v7 count]) {
      [(AXUIServiceEntitlementChecker *)self setClientConnections:0];
    }
    v6 = [(AXUIServiceEntitlementChecker *)self entitlementsCaches];
    [v6 removeObjectAtIndex:v5];
    if (![v6 count]) {
      [(AXUIServiceEntitlementChecker *)self setEntitlementsCaches:0];
    }
  }
}

- (unint64_t)_indexOfClientConnection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(AXUIServiceEntitlementChecker *)self clientConnections];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "isEqual:", v4, (void)v14))
        {
          unint64_t v12 = v8 + v10;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (BOOL)_clientProcessWithAuditToken:(id *)a3 hasEntitlement:(id)a4
{
  [a4 UTF8String];
  uint64_t v4 = xpc_copy_entitlement_for_token();
  id v5 = (void *)v4;
  BOOL v6 = v4 && MEMORY[0x223C899E0](v4) == MEMORY[0x263EF86E0] && xpc_BOOL_get_value(v5);

  return v6;
}

- (id)_singleRequiredEntitlementForMessageWithIdentifier:(unint64_t)a3
{
  uint64_t v4 = [(AXUIServiceEntitlementChecker *)self serviceClass];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(objc_class *)v4 requiredEntitlementForProcessingMessageWithIdentifier:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_possibleRequiredEntitlementForMessageWithIdentifier:(unint64_t)a3
{
  uint64_t v4 = [(AXUIServiceEntitlementChecker *)self serviceClass];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(objc_class *)v4 possibleRequiredEntitlementsForProcessingMessageWithIdentifier:a3];
    BOOL v6 = v5;
    if (v5 && ![v5 count])
    {
      uint64_t v7 = AXLogUI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[AXUIServiceEntitlementChecker _possibleRequiredEntitlementForMessageWithIdentifier:](v7);
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3
{
  uint64_t v4 = [(AXUIServiceEntitlementChecker *)self serviceClass];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(objc_class *)v4 isSafeToProcessMessageFromUnentitledProcessWithIdentifier:a3];
}

- (Class)serviceClass
{
  return self->_serviceClass;
}

- (void)setServiceClass:(Class)a3
{
  self->_serviceClass = a3;
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSMutableArray)entitlementsCaches
{
  return self->_entitlementsCaches;
}

- (void)setEntitlementsCaches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlementsCaches, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

- (void)serviceCanProcessMessageWithIdentifier:(uint64_t)a1 fromClientWithConnection:(NSObject *)a2 possibleRequiredEntitlements:needsToRequireEntitlements:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_221750000, a2, OS_LOG_TYPE_FAULT, "The client connections array and the entitlements caches array are supposed to have the same number of elements (%@).", (uint8_t *)&v2, 0xCu);
}

- (void)_possibleRequiredEntitlementForMessageWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_221750000, log, OS_LOG_TYPE_FAULT, "Unexpectedly received an empty array from possibleRequiredEntitlementsForProcessingMessageWithIdentifier:. The array must have at least one object.", v1, 2u);
}

@end