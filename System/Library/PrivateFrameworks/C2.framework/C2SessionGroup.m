@interface C2SessionGroup
- (BOOL)isEmpty;
- (BOOL)removeSession:(id)a3;
- (C2Session)pinnedSession;
- (C2Session)pinnedSessionAllowingExpiredDNS;
- (C2Session)unpinnedSession;
- (C2SessionGroup)initWithConfigurationName:(id)a3;
- (NSArray)sessions;
- (NSString)configurationName;
- (id)sessionForOptions:(id)a3;
- (void)setConfigurationName:(id)a3;
- (void)setPinnedSession:(id)a3;
- (void)setPinnedSessionAllowingExpiredDNS:(id)a3;
- (void)setSession:(id)a3 forOptions:(id)a4;
- (void)setUnpinnedSession:(id)a3;
@end

@implementation C2SessionGroup

- (NSArray)sessions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"C2SessionGroup.m" lineNumber:55 description:@"Failed to alloc sessions array"];
  }
  if (self->_pinnedSessionAllowingExpiredDNS) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_pinnedSession) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_unpinnedSession) {
    objc_msgSend(v4, "addObject:");
  }
  return (NSArray *)v4;
}

- (void)setSession:(id)a3 forOptions:(id)a4
{
  id v12 = a3;
  id v8 = a4;
  if ([v8 allowExpiredDNSBehavior])
  {
    p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSessionAllowingExpiredDNS;
    if (!self->_pinnedSessionAllowingExpiredDNS) {
      goto LABEL_9;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"C2SessionGroup.m", 42, @"_pinnedSessionAllowingExpiredDNS already present for options %@", v8 object file lineNumber description];
LABEL_13:

    goto LABEL_9;
  }
  if (![v8 tlsPinning])
  {
    p_pinnedSessionAllowingExpiredDNS = &self->_unpinnedSession;
    if (!self->_unpinnedSession) {
      goto LABEL_9;
    }
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"C2SessionGroup.m", 48, @"_pinnedSession already present for options %@", v8 object file lineNumber description];
    goto LABEL_13;
  }
  if (self->_pinnedSessionAllowingExpiredDNS)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"C2SessionGroup.m", 45, @"_pinnedSession already present for options %@", v8 object file lineNumber description];
  }
  p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSession;
LABEL_9:
  objc_storeStrong((id *)p_pinnedSessionAllowingExpiredDNS, a3);
}

- (id)sessionForOptions:(id)a3
{
  id v4 = a3;
  v5 = self->_pinnedSessionAllowingExpiredDNS;
  if (!v5
    && (([v4 allowExpiredDNSBehavior] & 1) != 0 || (v5 = self->_pinnedSession) == 0))
  {
    if ([v4 allowExpiredDNSBehavior] & 1) != 0 || (objc_msgSend(v4, "tlsPinning")) {
      v5 = 0;
    }
    else {
      v5 = self->_unpinnedSession;
    }
  }

  return v5;
}

- (C2SessionGroup)initWithConfigurationName:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)C2SessionGroup;
    v6 = [(C2SessionGroup *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_configurationName, a3);
    }
    self = v7;
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (BOOL)removeSession:(id)a3
{
  id v4 = (C2Session *)a3;
  id v5 = v4;
  p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSessionAllowingExpiredDNS;
  if (self->_pinnedSessionAllowingExpiredDNS == v4) {
    goto LABEL_6;
  }
  p_pinnedSessionAllowingExpiredDNS = &self->_pinnedSession;
  if (self->_pinnedSession == v4) {
    goto LABEL_6;
  }
  unpinnedSession = self->_unpinnedSession;
  p_unpinnedSession = &self->_unpinnedSession;
  if (unpinnedSession == v4)
  {
    p_pinnedSessionAllowingExpiredDNS = p_unpinnedSession;
LABEL_6:
    *p_pinnedSessionAllowingExpiredDNS = 0;

    BOOL v9 = 1;
    goto LABEL_7;
  }
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)isEmpty
{
  v2 = [(C2SessionGroup *)self sessions];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpinnedSession, 0);
  objc_storeStrong((id *)&self->_pinnedSession, 0);
  objc_storeStrong((id *)&self->_pinnedSessionAllowingExpiredDNS, 0);
  objc_storeStrong((id *)&self->_configurationName, 0);
}

- (void)setConfigurationName:(id)a3
{
}

- (C2Session)pinnedSessionAllowingExpiredDNS
{
  return self->_pinnedSessionAllowingExpiredDNS;
}

- (void)setPinnedSessionAllowingExpiredDNS:(id)a3
{
}

- (C2Session)pinnedSession
{
  return self->_pinnedSession;
}

- (void)setPinnedSession:(id)a3
{
}

- (C2Session)unpinnedSession
{
  return self->_unpinnedSession;
}

- (void)setUnpinnedSession:(id)a3
{
}

@end