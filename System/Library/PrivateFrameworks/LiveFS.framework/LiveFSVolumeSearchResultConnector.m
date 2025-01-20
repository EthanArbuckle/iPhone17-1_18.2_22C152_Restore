@interface LiveFSVolumeSearchResultConnector
+ (id)newSearchConnector:(id)a3 connection:(id)a4 maxData:(unsigned int)a5 maxDelay:(double)a6 initialCredits:(unsigned int)a7;
- (BOOL)active;
- (BOOL)throttlingActive;
- (NSString)ourToken;
- (NSXPCConnection)conn;
- (double)maxDelay;
- (id)initForToken:(id)a3 connection:(id)a4 maxData:(unsigned int)a5 maxDelay:(double)a6 initialCredits:(unsigned int)a7;
- (int)flushBufferedResults:(id)a3;
- (int)grabACredit;
- (unsigned)currentCredits;
- (unsigned)maxData;
- (void)addSearchResult:(id)a3 attributes:(_LIFileAttributes *)a4 attributeSize:(unsigned int)a5 xAttrs:(id)a6;
- (void)replenishCredits:(unsigned int)a3 reply:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setConn:(id)a3;
- (void)setCurrentCredits:(unsigned int)a3;
- (void)setMaxData:(unsigned int)a3;
- (void)setMaxDelay:(double)a3;
- (void)setOurToken:(id)a3;
- (void)setThrottlingActive:(BOOL)a3;
- (void)tokenDone:(int)a3;
@end

@implementation LiveFSVolumeSearchResultConnector

- (id)initForToken:(id)a3 connection:(id)a4 maxData:(unsigned int)a5 maxDelay:(double)a6 initialCredits:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a4;
  v29.receiver = self;
  v29.super_class = (Class)LiveFSVolumeSearchResultConnector;
  v15 = [(LiveFSVolumeSearchResultConnector *)&v29 init];
  v16 = v15;
  if (v15)
  {
    *(void *)&v15->pendingAttributesValidSize = 0x2E0000000000;
    uint64_t v17 = objc_opt_new();
    condVar = v16->condVar;
    v16->condVar = (NSCondition *)v17;

    uint64_t v19 = [MEMORY[0x263EFF990] dataWithCapacity:v16->pendingAttributesSize];
    pendingAttributes = v16->pendingAttributes;
    v16->pendingAttributes = (NSMutableData *)v19;

    uint64_t v21 = [MEMORY[0x263EFF980] arrayWithCapacity:32];
    pendingPaths = v16->pendingPaths;
    v16->pendingPaths = (NSMutableArray *)v21;

    uint64_t v23 = [MEMORY[0x263EFF980] arrayWithCapacity:32];
    pendingXAttrs = v16->pendingXAttrs;
    v16->pendingXAttrs = (NSMutableArray *)v23;

    if (!v16->condVar || !v16->pendingAttributes || !v16->pendingPaths || !v16->pendingXAttrs)
    {
      v27 = 0;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v16->_conn, a4);
    objc_storeStrong((id *)&v16->_ourToken, a3);
    v16->_maxData = a5;
    v16->pendingData = 0;
    v16->_maxDelay = a6;
    if (a6 > 0.0)
    {
      uint64_t v25 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a6];
      nextReplyDeadline = v16->nextReplyDeadline;
      v16->nextReplyDeadline = (NSDate *)v25;
    }
    v16->_currentCredits = a7;
    v16->_throttlingActive = a7 != 0;
    v16->waiter = 0;
    v16->_active = 1;
  }
  v27 = v16;
LABEL_11:

  return v27;
}

+ (id)newSearchConnector:(id)a3 connection:(id)a4 maxData:(unsigned int)a5 maxDelay:(double)a6 initialCredits:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initForToken:v13 connection:v12 maxData:v9 maxDelay:v7 initialCredits:a6];

  return v14;
}

- (void)replenishCredits:(unsigned int)a3 reply:(id)a4
{
  id v6 = a4;
  id v9 = v6;
  if (a3)
  {
    if (__CFADD__(a3, self->_currentCredits))
    {
      uint64_t v7 = 34;
    }
    else
    {
      [(NSCondition *)self->condVar lock];
      BOOL waiter = self->waiter;
      self->_currentCredits += a3;
      [(NSCondition *)self->condVar unlock];
      if (waiter) {
        [(NSCondition *)self->condVar broadcast];
      }
      uint64_t v7 = 0;
      id v6 = v9;
    }
  }
  else
  {
    uint64_t v7 = 22;
  }
  (*((void (**)(id, uint64_t))v6 + 2))(v6, v7);
}

- (int)grabACredit
{
  if (!self->_throttlingActive) {
    return 0;
  }
  unsigned int currentCredits = self->_currentCredits;
  if (currentCredits)
  {
LABEL_5:
    if (self->_active)
    {
      int result = 0;
      self->_unsigned int currentCredits = currentCredits - 1;
      return result;
    }
  }
  else
  {
    while (self->_active)
    {
      self->BOOL waiter = 1;
      [(NSCondition *)self->condVar wait];
      self->BOOL waiter = 0;
      unsigned int currentCredits = self->_currentCredits;
      if (currentCredits) {
        goto LABEL_5;
      }
    }
  }
  return 4;
}

- (int)flushBufferedResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v4 = (NSMutableArray *)a3;
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    uint64_t v17 = v4;
    _os_log_impl(&dword_23AB0B000, v5, OS_LOG_TYPE_DEFAULT, "Flushing, from resume point %@", (uint8_t *)&v16, 0xCu);
  }

  int v6 = [(LiveFSVolumeSearchResultConnector *)self grabACredit];
  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      pendingPaths = self->pendingPaths;
      pendingAttributes = self->pendingAttributes;
      unsigned int pendingAttributesValidSize = self->pendingAttributesValidSize;
      int v16 = 138412802;
      uint64_t v17 = pendingPaths;
      __int16 v18 = 2048;
      uint64_t v19 = pendingAttributes;
      __int16 v20 = 1024;
      unsigned int v21 = pendingAttributesValidSize;
      _os_log_impl(&dword_23AB0B000, v8, OS_LOG_TYPE_DEFAULT, "About to send paths %@, pendingAttr %p, valid sz %u", (uint8_t *)&v16, 0x1Cu);
    }

    uint64_t v7 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
    [v7 searchResults:self->_ourToken paths:self->pendingPaths attributes:self->pendingAttributes attributeSize:184 xAttrs:self->pendingXAttrs resumePath:v4];
    [(NSMutableArray *)self->pendingPaths removeAllObjects];
    self->unsigned int pendingAttributesValidSize = 0;
    id v12 = [MEMORY[0x263EFF990] dataWithCapacity:self->pendingAttributesSize];
    id v13 = self->pendingAttributes;
    self->pendingAttributes = v12;

    pendingXAttrs = self->pendingXAttrs;
    if (pendingXAttrs) {
      [(NSMutableArray *)pendingXAttrs removeAllObjects];
    }
  }

  return v6;
}

- (void)tokenDone:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl(&dword_23AB0B000, v5, OS_LOG_TYPE_DEFAULT, "Done: got code %d", (uint8_t *)v7, 8u);
  }

  [(NSCondition *)self->condVar lock];
  if (v3)
  {
    if (self->waiter) {
      [(NSCondition *)self->condVar broadcast];
    }
  }
  else
  {
    [(LiveFSVolumeSearchResultConnector *)self flushBufferedResults:0];
  }
  self->_active = 0;
  int v6 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
  [v6 tokenDone:self->_ourToken result:v3];
  [(NSCondition *)self->condVar unlock];
}

- (void)addSearchResult:(id)a3 attributes:(_LIFileAttributes *)a4 attributeSize:(unsigned int)a5 xAttrs:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  int v12 = [v10 length];
  *((_DWORD *)v23 + 6) = 2 * v12 + 16;
  pendingXAttrs = self->pendingXAttrs;
  if (pendingXAttrs)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke;
    v21[3] = &unk_264DC7C98;
    v21[4] = &v22;
    [(NSMutableArray *)pendingXAttrs enumerateObjectsUsingBlock:v21];
  }
  [(NSCondition *)self->condVar lock];
  if (self->pendingData <= self->_maxData - *((_DWORD *)v23 + 6))
  {
    nextReplyDeadline = self->nextReplyDeadline;
    if (!nextReplyDeadline) {
      goto LABEL_8;
    }
    v15 = [MEMORY[0x263EFF910] date];
    uint64_t v16 = [(NSDate *)nextReplyDeadline compare:v15];

    if (v16 != -1) {
      goto LABEL_8;
    }
    uint64_t v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:self->_maxDelay];
    __int16 v20 = self->nextReplyDeadline;
    self->nextReplyDeadline = v19;
  }
  if ([(NSMutableArray *)self->pendingPaths count]) {
    [(LiveFSVolumeSearchResultConnector *)self flushBufferedResults:v10];
  }
LABEL_8:
  [(NSMutableArray *)self->pendingPaths addObject:v10];
  [(NSMutableData *)self->pendingAttributes appendBytes:a4 length:a5];
  self->pendingAttributesValidSize += a5;
  uint64_t v17 = self->pendingXAttrs;
  if (v17)
  {
    if (v11) {
      id v18 = v11;
    }
    else {
      id v18 = (id)MEMORY[0x263EFFA78];
    }
    [(NSMutableArray *)v17 addObject:v18];
  }
  [(NSCondition *)self->condVar unlock];
  _Block_object_dispose(&v22, 8);
}

uint64_t __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke_2;
  v3[3] = &unk_264DC7C70;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __85__LiveFSVolumeSearchResultConnector_addSearchResult_attributes_attributeSize_xAttrs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  LODWORD(a2) = [a2 length];
  int v6 = [v5 length];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v6 + 2 * a2 + 32;
}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConn:(id)a3
{
}

- (NSString)ourToken
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOurToken:(id)a3
{
}

- (unsigned)maxData
{
  return self->_maxData;
}

- (void)setMaxData:(unsigned int)a3
{
  self->_maxData = a3;
}

- (double)maxDelay
{
  return self->_maxDelay;
}

- (void)setMaxDelay:(double)a3
{
  self->_maxDelay = a3;
}

- (BOOL)throttlingActive
{
  return self->_throttlingActive;
}

- (void)setThrottlingActive:(BOOL)a3
{
  self->_throttlingActive = a3;
}

- (unsigned)currentCredits
{
  return self->_currentCredits;
}

- (void)setCurrentCredits:(unsigned int)a3
{
  self->_unsigned int currentCredits = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourToken, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong((id *)&self->pendingXAttrs, 0);
  objc_storeStrong((id *)&self->pendingAttributes, 0);
  objc_storeStrong((id *)&self->pendingPaths, 0);
  objc_storeStrong((id *)&self->condVar, 0);

  objc_storeStrong((id *)&self->nextReplyDeadline, 0);
}

@end