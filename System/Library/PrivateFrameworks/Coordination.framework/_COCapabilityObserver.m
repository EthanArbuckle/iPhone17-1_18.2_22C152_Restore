@interface _COCapabilityObserver
- (BOOL)lastValue;
- (BOOL)notified;
- (NSString)capability;
- (_COCapabilityObserver)initWithCapability:(id)a3 cluster:(id)a4 block:(id)a5;
- (id)block;
- (id)cluster;
- (id)description;
- (void)notify:(BOOL)a3;
- (void)setLastValue:(BOOL)a3;
- (void)setNotified:(BOOL)a3;
@end

@implementation _COCapabilityObserver

- (_COCapabilityObserver)initWithCapability:(id)a3 cluster:(id)a4 block:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_COCapabilityObserver;
  v11 = [(_COCapabilityObserver *)&v22 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    capability = v11->_capability;
    v11->_capability = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    id cluster = v11->_cluster;
    v11->_id cluster = (id)v14;

    uint64_t v16 = [v10 copy];
    id block = v11->_block;
    v11->_id block = (id)v16;

    *(_WORD *)&v11->_notified = 0;
    v18 = COLogForCategory(3);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = v11->_capability;
      id v21 = v11->_cluster;
      *(_DWORD *)buf = 134218498;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v20;
      __int16 v27 = 2112;
      id v28 = v21;
      _os_log_debug_impl(&dword_21D3E0000, v18, OS_LOG_TYPE_DEBUG, "%p observing Capability(%@) in Cluster(%@)", buf, 0x20u);
    }
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(_COCapabilityObserver *)self capability];
  v5 = [(_COCapabilityObserver *)self cluster];
  BOOL v6 = [(_COCapabilityObserver *)self notified];
  BOOL v7 = [(_COCapabilityObserver *)self lastValue];
  uint64_t v8 = 78;
  if (v7) {
    uint64_t v9 = 89;
  }
  else {
    uint64_t v9 = 78;
  }
  if (v6) {
    uint64_t v8 = 89;
  }
  id v10 = [v3 stringWithFormat:@"{ Capability Observer = %p, for Capability(%@) in Cluster(%@), notified(%c) lastValue(%c) }", self, v4, v5, v8, v9];

  return v10;
}

- (void)notify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(_COCapabilityObserver *)self notified])
  {
    uint64_t v9 = COLogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 134218498;
      if (v3) {
        int v10 = 89;
      }
      else {
        int v10 = 78;
      }
      *(void *)&v11[4] = self;
      __int16 v12 = 2112;
      v13 = self;
      __int16 v14 = 1024;
      int v15 = v10;
      _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "Observer(%p/%@) invoking block for initial value(%c)", v11, 0x1Cu);
    }

    [(_COCapabilityObserver *)self setNotified:1];
    goto LABEL_15;
  }
  BOOL v5 = [(_COCapabilityObserver *)self lastValue];
  uint64_t v6 = COLogForCategory(3);
  BOOL v7 = os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT);
  if (v5 != v3)
  {
    if (v7)
    {
      *(_DWORD *)v11 = 134218498;
      if (v3) {
        int v8 = 89;
      }
      else {
        int v8 = 78;
      }
      *(void *)&v11[4] = self;
      __int16 v12 = 2112;
      v13 = self;
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl(&dword_21D3E0000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Observer(%p/%@) invoking block for changed value(%c)", v11, 0x1Cu);
    }

LABEL_15:
    -[_COCapabilityObserver setLastValue:](self, "setLastValue:", v3, *(void *)v11);
    uint64_t v6 = [(_COCapabilityObserver *)self block];
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3);
    goto LABEL_16;
  }
  if (v7)
  {
    *(_DWORD *)v11 = 134218242;
    *(void *)&v11[4] = self;
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_21D3E0000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Observer(%p/%@) not invoking block due to no change", v11, 0x16u);
  }
LABEL_16:
}

- (NSString)capability
{
  return self->_capability;
}

- (id)cluster
{
  return self->_cluster;
}

- (id)block
{
  return self->_block;
}

- (BOOL)notified
{
  return self->_notified;
}

- (void)setNotified:(BOOL)a3
{
  self->_notified = a3;
}

- (BOOL)lastValue
{
  return self->_lastValue;
}

- (void)setLastValue:(BOOL)a3
{
  self->_lastValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong(&self->_cluster, 0);

  objc_storeStrong((id *)&self->_capability, 0);
}

@end