@interface NEIPSecSASession
- (BOOL)addLarvalSA:(id)a3;
- (BOOL)addSA:(id)a3;
- (BOOL)migrateSA:(id)a3;
- (BOOL)removeSA:(id)a3;
- (BOOL)updateSA:(id)a3;
- (NEIPSecSASession)initWithName:(id)a3 delegate:(id)a4;
- (NEIPSecSASessionDelegate)delegate;
- (NSArray)securityAssociations;
- (NSString)name;
- (OS_dispatch_queue)delegateQueue;
- (id)copyEmptySASession;
- (id)description;
- (void)dealloc;
- (void)removeAllSAs;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation NEIPSecSASession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDelegateQueue, 0);
  objc_storeStrong((id *)&self->_larvalSAs, 0);
  objc_storeStrong((id *)&self->_internalSecurityAssociations, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setDelegate:(id)a3
{
}

- (NEIPSecSASessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NEIPSecSASessionDelegate *)WeakRetained;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)migrateSA:(id)a3
{
  id v5 = a3;
  if (!self)
  {
    if ([0 containsObject:v5])
    {
      [0 removeObject:v5];
      id Property = 0;
      goto LABEL_4;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(objc_getProperty(self, v4, 24, 1), "containsObject:", v5)) {
    goto LABEL_7;
  }
  objc_msgSend(objc_getProperty(self, v6, 24, 1), "removeObject:", v5);
  id Property = objc_getProperty(self, v7, 24, 1);
LABEL_4:
  [Property addObject:v5];
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)removeSA:(id)a3
{
  id v5 = a3;
  if (self)
  {
    if (objc_msgSend(objc_getProperty(self, v4, 24, 1), "containsObject:", v5))
    {
      BOOL v7 = 1;
      objc_msgSend(objc_getProperty(self, v6, 24, 1), "removeObject:", v5);
    }
    else
    {
      BOOL v7 = 0;
    }
    if (objc_msgSend(objc_getProperty(self, v6, 32, 1), "containsObject:", v5))
    {
      id Property = objc_getProperty(self, v8, 32, 1);
LABEL_7:
      [Property removeObject:v5];
      BOOL v7 = 1;
    }
  }
  else
  {
    if ([0 containsObject:v5])
    {
      [0 removeObject:v5];
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
    char v11 = [0 containsObject:v5];
    id Property = 0;
    if (v11) {
      goto LABEL_7;
    }
  }
  [v5 invalidate];

  return v7;
}

- (BOOL)addSA:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 24, 1);
    }
    else {
      id Property = 0;
    }
    [Property addObject:v5];
  }

  return v5 != 0;
}

- (BOOL)updateSA:(id)a3
{
  id v5 = a3;
  if (!self)
  {
    if ([0 containsObject:v5])
    {
      [0 addObject:v5];
      id Property = 0;
      goto LABEL_4;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (!objc_msgSend(objc_getProperty(self, v4, 32, 1), "containsObject:", v5)) {
    goto LABEL_7;
  }
  objc_msgSend(objc_getProperty(self, v6, 24, 1), "addObject:", v5);
  id Property = objc_getProperty(self, v7, 32, 1);
LABEL_4:
  [Property removeObject:v5];
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)addLarvalSA:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NEIPSecSASession;
  [(NEIPSecSASession *)&v4 doesNotRecognizeSelector:a2];
  return 0;
}

- (void)removeAllSAs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v32 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@ Removing all SAs", buf, 0xCu);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  if (self)
  {
    objc_msgSend(objc_getProperty(self, v11, 32, 1), "removeAllObjects");
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = objc_getProperty(self, v12, 24, 1);
  }
  else
  {
    [0 removeAllObjects];
    id v13 = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
  }
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "invalidate", (void)v21);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  if (self) {
    id v20 = objc_getProperty(self, v19, 24, 1);
  }
  else {
    id v20 = 0;
  }
  objc_msgSend(v20, "removeAllObjects", (void)v21);
}

- (OS_dispatch_queue)delegateQueue
{
  if (self)
  {
    self = (NEIPSecSASession *)objc_getProperty(self, a2, 48, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (void)setDelegateQueue:(id)a3
{
  if (self) {
    objc_setProperty_atomic(self, a2, a3, 48);
  }
}

- (void)dealloc
{
  [(NEIPSecSASession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NEIPSecSASession;
  [(NEIPSecSASession *)&v3 dealloc];
}

- (id)copyEmptySASession
{
  id v3 = objc_alloc((Class)objc_opt_class());
  objc_super v4 = [(NEIPSecSASession *)self name];
  id v5 = [(NEIPSecSASession *)self delegate];
  id v6 = (void *)[v3 initWithName:v4 delegate:v5];

  return v6;
}

- (NSArray)securityAssociations
{
  if (self)
  {
    self = (NEIPSecSASession *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return (NSArray *)self;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self) {
    unint64_t uniqueIndex = self->_uniqueIndex;
  }
  else {
    unint64_t uniqueIndex = 0;
  }
  id v5 = [(NEIPSecSASession *)self name];
  id v6 = (void *)[v3 initWithFormat:@"SASession[%llu, %@]", uniqueIndex, v5];

  return v6;
}

- (NEIPSecSASession)initWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NEIPSecSASession;
  uint64_t v8 = [(NEIPSecSASession *)&v19 init];
  uint64_t v10 = v8;
  if (v8)
  {
    v8->_unint64_t uniqueIndex = atomic_fetch_add_explicit(sNEIPSecSASessionIndex, 1uLL, memory_order_relaxed);
    objc_setProperty_atomic(v8, v9, v6, 8);
    [(NEIPSecSASession *)v10 setDelegate:v7];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_setProperty_atomic(v10, v12, v11, 24);

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_setProperty_atomic(v10, v14, v13, 32);

    uint64_t v15 = v10;
  }
  else
  {
    uint64_t v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "[super init] failed", v18, 2u);
    }
  }
  return v10;
}

@end