@interface IAPSessionList
- (IAPSessionList)init;
- (id).cxx_construct;
- (id)sessionWithProtocolID:(unsigned __int8)a3;
- (id)sessionWithSessionID:(unsigned __int16)a3;
- (id)sessions;
- (id)sessionsForClientID:(unsigned int)a3;
- (id)sessionsWithProtocolID:(unsigned __int8)a3;
- (void)addSession:(id)a3 withSessionID:(unsigned __int16)a4;
- (void)dealloc;
- (void)removeSessionWithSessionID:(unsigned __int16)a3;
@end

@implementation IAPSessionList

- (IAPSessionList)init
{
  v4.receiver = self;
  v4.super_class = (Class)IAPSessionList;
  v2 = [(IAPSessionList *)&v4 init];
  if (v2) {
    sub_1000EE49C(3u, @"%s:%s", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSessionList.mm", "-[IAPSessionList init]");
  }
  return v2;
}

- (void)dealloc
{
  sub_1000EE49C(3u, @"%s:%s", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSessionList.mm", "-[IAPSessionList dealloc]");
  begin_node = (IAPSessionList *)0xAAAAAAAAAAAAAAAALL;
  if (((unint64_t)&self->_iapSessionMap & 7) != 0
    || (begin_node = (IAPSessionList *)self->_iapSessionMap.__tree_.__begin_node_,
        ((unint64_t)&self->_iapSessionMap.__tree_.__pair1_ & 7) != 0))
  {
LABEL_9:
    __break(0x5516u);
  }
  else
  {
    while (begin_node != (IAPSessionList *)&self->_iapSessionMap.__tree_.__pair1_)
    {
      v3 = sub_100004C28((uint64_t *)&begin_node);
      if (!v3 || (v3 & 7) != 0 || ((unint64_t)(v3 + 1) & 7) != 0) {
        goto LABEL_9;
      }

      sub_10000B05C((uint64_t *)&begin_node);
    }
    sub_10000B13C((uint64_t)&self->_iapSessionMap);
    v4.receiver = self;
    v4.super_class = (Class)IAPSessionList;
    [(IAPSessionList *)&v4 dealloc];
  }
}

- (void)addSession:(id)a3 withSessionID:(unsigned __int16)a4
{
  unsigned __int16 v10 = a4;
  p_iapSessionMap = &self->_iapSessionMap;
  if (((unint64_t)&self->_iapSessionMap & 7) != 0
    || (v7 = (IAPSessionList *)sub_100017548((uint64_t)&self->_iapSessionMap, &v10),
        ((unint64_t)&self->_iapSessionMap.__tree_.__pair1_ & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    if (&self->_iapSessionMap.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned short, IAPSession *>, void *> > > *)v7) {
      NSLog(@"%s::%s %d - replacing a session (sessionID=%d) in the session list", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSessionList.mm", "-[IAPSessionList addSession:withSessionID:]", 43, v10);
    }
    id v8 = a3;
    sub_100016EEC((uint64_t)p_iapSessionMap, &v10);
    void *v9 = v8;
  }
}

- (void)removeSessionWithSessionID:(unsigned __int16)a3
{
  unsigned __int16 v8 = a3;
  v7 = (IAPSessionList *)0xAAAAAAAAAAAAAAAALL;
  p_iapSessionMap = (uint64_t *)&self->_iapSessionMap;
  if (((unint64_t)&self->_iapSessionMap & 7) != 0
    || (v5 = (IAPSessionList *)sub_100017548((uint64_t)&self->_iapSessionMap, &v8),
        v7 = v5,
        ((unint64_t)&self->_iapSessionMap.__tree_.__pair1_ & 7) != 0))
  {
LABEL_10:
    __break(0x5516u);
    return;
  }
  if (&self->_iapSessionMap.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned short, IAPSession *>, void *> > > *)v5)
  {
    v6 = sub_100004C28((uint64_t *)&v7);
    if (v6 && (v6 & 7) == 0 && ((unint64_t)(v6 + 1) & 7) == 0)
    {

      sub_10000BC30(p_iapSessionMap, (uint64_t)v7);
      return;
    }
    goto LABEL_10;
  }
  NSLog(@"%s::%s %d - session (sessionID=%d) was not found in the session list", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSessionList.mm", "-[IAPSessionList removeSessionWithSessionID:]", 58, v8, v7);
}

- (id)sessions
{
  v2 = self;
  if ((((_BYTE)self + 8) & 7) == 0 && (((unint64_t)self + 24) & 7) == 0)
  {
    if (!*((_DWORD *)self + 6)) {
      return 0;
    }
    self = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    v5 = (char *)v2[1];
    v3 = (char *)(v2 + 2);
    if ((v3 & 7) == 0)
    {
      id v4 = self;
      while (v5 != v3)
      {
        self = sub_100004C28((uint64_t *)&v5);
        if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
          goto LABEL_13;
        }
        [v4 addObject:*((void *)self + 1)];
        sub_10000B05C((uint64_t *)&v5);
      }
      return v4;
    }
  }
LABEL_13:
  __break(0x5516u);
  return self;
}

- (id)sessionsForClientID:(unsigned int)a3
{
  v3 = self;
  if ((((_BYTE)self + 8) & 7) == 0 && (((unint64_t)self + 24) & 7) == 0)
  {
    if (!*((_DWORD *)self + 6)) {
      return 0;
    }
    self = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    v7 = (char *)v3[1];
    v5 = (char *)(v3 + 2);
    if ((v5 & 7) == 0)
    {
      id v6 = self;
      while (v7 != v5)
      {
        self = sub_100004C28((uint64_t *)&v7);
        if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
          goto LABEL_18;
        }
        if (objc_msgSend(objc_msgSend(*((id *)self + 1), "client"), "clientID") == a3)
        {
          self = sub_100004C28((uint64_t *)&v7);
          if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
            goto LABEL_18;
          }
          [v6 addObject:*((void *)self + 1)];
        }
        sub_10000B05C((uint64_t *)&v7);
      }
      return v6;
    }
  }
LABEL_18:
  __break(0x5516u);
  return self;
}

- (id)sessionWithSessionID:(unsigned __int16)a3
{
  unsigned __int16 v6 = a3;
  id v5 = (id)0xAAAAAAAAAAAAAAAALL;
  id result = &self->_iapSessionMap;
  if ((result & 7) != 0
    || (id result = (id)sub_100017548((uint64_t)result, &v6),
        id v5 = result,
        ((unint64_t)&self->_iapSessionMap.__tree_.__pair1_ & 7) != 0))
  {
LABEL_10:
    __break(0x5516u);
    return result;
  }
  if (&self->_iapSessionMap.__tree_.__pair1_ != result)
  {
    id result = sub_100004C28((uint64_t *)&v5);
    if (result && (result & 7) == 0 && (((unint64_t)result + 8) & 7) == 0) {
      return (id)*((void *)result + 1);
    }
    goto LABEL_10;
  }
  sub_1000EE49C(3u, @"%s::%s %d - session (sessionID=%d) was not found in the session list", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSessionList.mm", "-[IAPSessionList sessionWithSessionID:]", 106, v6, v5);
  return 0;
}

- (id)sessionWithProtocolID:(unsigned __int8)a3
{
  unsigned __int16 v6 = (char *)0xAAAAAAAAAAAAAAAALL;
  if ((((_BYTE)self + 8) & 7) != 0
    || (unsigned __int16 v6 = (char *)*((void *)self + 1), v3 = (char *)self + 16, (((unint64_t)self + 16) & 7) != 0))
  {
LABEL_17:
    __break(0x5516u);
    return self;
  }
  if (v6 != v3)
  {
    int v4 = a3;
    id v5 = 0;
    while (1)
    {
      self = sub_100004C28((uint64_t *)&v6);
      if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
        goto LABEL_17;
      }
      if ([*((id *)self + 1) protocolID] == v4)
      {
        self = sub_100004C28((uint64_t *)&v6);
        if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
          goto LABEL_17;
        }
        id v5 = (void *)*((void *)self + 1);
      }
      sub_10000B05C((uint64_t *)&v6);
      if (v6 == v3) {
        return v5;
      }
    }
  }
  return 0;
}

- (id)sessionsWithProtocolID:(unsigned __int8)a3
{
  v3 = self;
  if ((((_BYTE)self + 8) & 7) == 0 && (((unint64_t)self + 24) & 7) == 0)
  {
    if (!*((_DWORD *)self + 6)) {
      return 0;
    }
    int v4 = a3;
    self = +[NSMutableArray arrayWithCapacity:0];
    v7 = (char *)v3[1];
    id v5 = (char *)(v3 + 2);
    if ((v5 & 7) == 0)
    {
      id v6 = self;
      while (v7 != v5)
      {
        self = sub_100004C28((uint64_t *)&v7);
        if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
          goto LABEL_18;
        }
        if ([*((id *)self + 1) protocolID] == v4)
        {
          self = sub_100004C28((uint64_t *)&v7);
          if (!self || (self & 7) != 0 || (((unint64_t)self + 8) & 7) != 0) {
            goto LABEL_18;
          }
          [v6 addObject:*((void *)self + 1)];
        }
        sub_10000B05C((uint64_t *)&v7);
      }
      return v6;
    }
  }
LABEL_18:
  __break(0x5516u);
  return self;
}

- (void).cxx_destruct
{
  uint64_t p_iapSessionMap = (uint64_t)&self->_iapSessionMap;
  if ((p_iapSessionMap & 7) != 0) {
    __break(0x5516u);
  }
  else {
    sub_10000C538(p_iapSessionMap);
  }
}

- (id).cxx_construct
{
  id result = &self->_iapSessionMap;
  if ((result & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    sub_10000C500(result);
    return self;
  }
  return result;
}

@end