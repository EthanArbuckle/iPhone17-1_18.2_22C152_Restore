@interface IDSMultiplexerGroupSessionTransport
- (BOOL)_tryConsumeQUICShortHeaderPacketBuffer:(id *)a3;
- (BOOL)addListenerConnection:(id)a3;
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (IDSGroupEncryptionKeyManager)fanoutEncryptionManager;
- (IDSMultiplexerGroupSessionTransport)initWithIdentifier:(id)a3;
- (IDSMultiplexerTransportParticipantIDConverter)participantIDToAliasConverter;
- (NSString)description;
- (NSString)identifier;
- (id)routeClientConnections:(id)a3;
- (id)routedConnections;
- (int)packetizationHeadroom;
- (void)cancelClientConnection:(id)a3;
- (void)invalidate;
- (void)purgeQUICConnectionsForParticipants:(id)a3;
- (void)resetConnectionForPacketBuffer:(id *)a3;
- (void)setFanoutEncryptionManager:(id)a3;
- (void)setPacketBufferReadHandler:(id)a3;
- (void)setParticipantIDToAliasConverter:(id)a3;
@end

@implementation IDSMultiplexerGroupSessionTransport

- (IDSMultiplexerGroupSessionTransport)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IDSMultiplexerGroupSessionTransport;
  v6 = [(IDSMultiplexerGroupSessionTransport *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = +[NSMutableArray array];
    portSignatures = v7->_portSignatures;
    v7->_portSignatures = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray array];
    participantIDs = v7->_participantIDs;
    v7->_participantIDs = (NSMutableArray *)v10;

    uint64_t v12 = +[NSMutableArray array];
    routedConnections = v7->_routedConnections;
    v7->_routedConnections = (NSMutableArray *)v12;

    uint64_t v14 = +[NSMutableArray array];
    listeners = v7->_listeners;
    v7->_listeners = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v7->_identifier, a3);
    v16 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:1282 capacity:20];
    fanoutEncryptionMKIToReceivingStateMap = v7->_fanoutEncryptionMKIToReceivingStateMap;
    v7->_fanoutEncryptionMKIToReceivingStateMap = v16;
  }
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"%p MultiplexerLocalTransport %@", self, self->_identifier];
}

- (int)packetizationHeadroom
{
  return 88;
}

- (void)cancelClientConnection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire) & 1) == 0)
  {
    if (![v4 isTCP]) {
      goto LABEL_14;
    }
    v6 = [v5 remoteTCPSYN];

    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v7 = _IDSLinkPacketBufferCreate();
    *(_DWORD *)(v7 + 536) |= 1u;
    *(void *)(v7 + 488) = [v5 context];
    uint64_t v8 = *(unsigned char **)v7;
    **(_DWORD **)uint64_t v7 = 2009124602;
    unsigned int v9 = [v5 portsSignature];
    char v10 = HIBYTE(v9);
    unsigned int v11 = HIWORD(v9);
    unsigned __int16 v12 = (unsigned __int16)[v5 portsSignature];
    v8[4] = v10;
    v8[5] = v11;
    v8[6] = HIBYTE(v12);
    v8[7] = v12;
    v13 = [v5 remoteTCPSYN];
    unsigned int v14 = [v13 unsignedLongValue];

    v8[8] = HIBYTE(v14);
    v8[9] = BYTE2(v14);
    v8[10] = BYTE1(v14);
    v8[11] = v14;
    *(void *)(v7 + 16) = &v8[-*(void *)v7 + 12];
    *(_DWORD *)(v7 + 536) |= 0x4000u;
    kdebug_trace();
    LOBYTE(v14) = (*((uint64_t (**)(void))self->_readHandler + 2))();
    v15 = +[IDSFoundationLog Multiplexer];
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = sub_1002237D8(*(void *)v7, *(void *)(v7 + 16));
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v17;
        v18 = "Mutliplexer Transport cancelClientConnection: sent control packet for connection %@\n%s";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
      }
    }
    else if (v16)
    {
      v20 = sub_1002237D8(*(void *)v7, *(void *)(v7 + 16));
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v20;
      v18 = "Mutliplexer Transport cancelClientConnection: failed to send control packet for connection %@\n%s";
      goto LABEL_12;
    }

LABEL_14:
    os_unfair_lock_lock(&self->_lock);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v46 = -1;
    routedConnections = self->_routedConnections;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100109168;
    v36[3] = &unk_100982730;
    v22 = v5;
    v37 = v22;
    v38 = buf;
    [(NSMutableArray *)routedConnections enumerateObjectsUsingBlock:v36];
    if (*(void *)(*(void *)&buf[8] + 24) == -1)
    {
      v26 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_routedConnections;
        *(_DWORD *)v39 = 138412546;
        v40 = v22;
        __int16 v41 = 2112;
        v42 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport cancelClientConnection: did not find connection %@ in _routedConnections %@", v39, 0x16u);
      }
    }
    else
    {
      v23 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(NSMutableArray **)(*(void *)&buf[8] + 24);
        v25 = self->_routedConnections;
        *(_DWORD *)v39 = 134218498;
        v40 = v24;
        __int16 v41 = 2112;
        v42 = v22;
        __int16 v43 = 2112;
        v44 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport cancelClientConnection: removing (at index %lu) connection %@ from _routedConnections %@", v39, 0x20u);
      }

      [(NSMutableArray *)self->_portSignatures removeObjectAtIndex:*(void *)(*(void *)&buf[8] + 24)];
      [(NSMutableArray *)self->_participantIDs removeObjectAtIndex:*(void *)(*(void *)&buf[8] + 24)];
      [(NSMutableArray *)self->_routedConnections removeObjectAtIndex:*(void *)(*(void *)&buf[8] + 24)];
    }
    *(void *)(*(void *)&buf[8] + 24) = -1;
    listeners = self->_listeners;
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    v32 = sub_100109190;
    v33 = &unk_100982730;
    v29 = v22;
    v34 = v29;
    v35 = buf;
    [(NSMutableArray *)listeners enumerateObjectsUsingBlock:&v30];
    if (*(void *)(*(void *)&buf[8] + 24) != -1) {
      -[NSMutableArray removeObjectAtIndex:](self->_listeners, "removeObjectAtIndex:", v30, v31, v32, v33);
    }
    [(NSMutableArray *)v29 invalidate];

    _Block_object_dispose(buf, 8);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_24;
  }
  objc_super v19 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport cancelClientConnection: failed because transport is invalidated", buf, 2u);
  }

LABEL_24:
}

- (id)routeClientConnections:(id)a3
{
  id v4 = a3;
  unsigned __int8 explicit = atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire);
  v6 = &IDSRegistrationPropertySupportsAVLess_ptr;
  uint64_t v7 = +[IDSFoundationLog Multiplexer];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (explicit)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Multiplexer Transport routeClientConnections: failed because transport is invalidated", buf, 2u);
    }

    id v43 = +[NSSet set];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v60 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GroupSessionTransport routing %@", buf, 0xCu);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    id v45 = v4;
    id obj = v4;
    id v48 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v48)
    {
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v47 = *(void *)v56;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v56 != v47) {
            objc_enumerationMutation(obj);
          }
          char v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          unsigned int v11 = [v10 multiplexerParams];
          id v12 = [v11 participantID];

          if (v12)
          {
            v13 = [v10 multiplexerParams];
            unsigned int v14 = [v13 salt];

            if (v14)
            {
              participantIDToAliasConverter = self->_participantIDToAliasConverter;
              BOOL v16 = [v10 multiplexerParams];
              id v17 = [v16 participantID];
              v18 = [v10 multiplexerParams];
              objc_super v19 = [v18 salt];
              id v20 = [(IDSMultiplexerTransportParticipantIDConverter *)participantIDToAliasConverter participantIDForAlias:v17 salt:v19];

              v21 = +[IMLockdownManager sharedInstance];
              LODWORD(v18) = [v21 isInternalInstall];

              if (v18 && IMGetDomainBoolForKeyWithDefaultValue())
              {
                v22 = [v6[288] Multiplexer];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Internal: failParticipantIDTranslation triggers participant ID being set to 0 for aliases", buf, 2u);
                }

LABEL_32:
                v42 = +[IDSGroupSessionMultiplexer sharedInstance];
                [v42 resetConnection:v10 errorCode:61];

                [v10 invalidate];
                continue;
              }
              if (!v20) {
                goto LABEL_32;
              }
              [v10 setContext:v20];
            }
            else
            {
              uint64_t v31 = [v10 multiplexerParams];
              objc_msgSend(v10, "setContext:", objc_msgSend(v31, "participantID"));
            }
          }
          else
          {
            v23 = v6;
            os_unfair_lock_lock(lock);
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            v24 = self->_listeners;
            id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v51 objects:v61 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v52;
              do
              {
                for (j = 0; j != v26; j = (char *)j + 1)
                {
                  if (*(void *)v52 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
                  unsigned int v30 = [v29 localPort];
                  if (v30 == [v10 localPort]) {
                    objc_msgSend(v10, "setContext:", objc_msgSend(v29, "context"));
                  }
                }
                id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v51 objects:v61 count:16];
              }
              while (v26);
            }

            os_unfair_lock_unlock(lock);
            v6 = v23;
          }
          id v32 = [v10 context];
          v33 = [v6[288] Multiplexer];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v34 = [v10 portsSignature];
            id v35 = [v10 context];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v60 = v34;
            *(_WORD *)&v60[4] = 2048;
            *(void *)&v60[6] = v35;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[IDSSessionMultiplexer routeClientConnections] portsSignature:%08X participantID:%llu", buf, 0x12u);
          }

          os_unfair_lock_lock(lock);
          portSignatures = self->_portSignatures;
          v37 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v10 portsSignature]);
          [(NSMutableArray *)portSignatures addObject:v37];

          participantIDs = self->_participantIDs;
          v39 = +[NSNumber numberWithUnsignedLongLong:v32];
          [(NSMutableArray *)participantIDs addObject:v39];

          [(NSMutableArray *)self->_routedConnections addObject:v10];
          os_unfair_lock_unlock(lock);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1001097C4;
          v50[3] = &unk_100982780;
          v50[4] = self;
          v50[5] = v10;
          v50[6] = v32;
          v40 = objc_retainBlock(v50);
          [v10 setPacketBufferReadHandler:v40];
          __int16 v41 = +[IDSGroupSessionMultiplexer sharedInstance];
          [v41 setupTransportForConnection:v10];

          [v10 startReadOnTransportThread];
        }
        id v48 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v48);
    }

    id v43 = obj;
    id v4 = v45;
  }

  return v43;
}

- (void)setPacketBufferReadHandler:(id)a3
{
  if (atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire))
  {
    v3 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport setPacketBufferReadHandler: failed because transport is invalidated", v4, 2u);
    }
  }
  else
  {
    self->_readHandler = objc_retainBlock(a3);
    _objc_release_x1();
  }
}

- (void)resetConnectionForPacketBuffer:(id *)a3
{
  if (atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire))
  {
    id v5 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport resetConnectionForPacketBuffer: failed because transport is invalidated", (uint8_t *)&buf, 2u);
    }
    goto LABEL_5;
  }
  int64_t var2 = a3->var2;
  if (var2 <= 3)
  {
    id v5 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = sub_1002237D8((uint64_t)a3->var0, a3->var2);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Control packet doesn't have enough bytes %s", (uint8_t *)&buf, 0xCu);
    }
LABEL_5:

    return;
  }
  var0 = a3->var0;
  if ((unint64_t)var2 < 8) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = bswap32(*((_DWORD *)var0 + 1));
  }
  BOOL v10 = (unint64_t)var2 > 7;
  int v11 = (var0[2] << 24) | (var0[3] << 16) | (*var0 << 8) | var0[1];
  os_unfair_lock_lock(&self->_lock);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = -1;
  portSignatures = self->_portSignatures;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10010A0F4;
  v16[3] = &unk_1009827A8;
  v16[5] = &buf;
  v16[6] = a3;
  BOOL v19 = v10;
  int v17 = v11;
  unsigned int v18 = v9;
  v16[4] = self;
  [(NSMutableArray *)portSignatures enumerateObjectsUsingBlock:v16];
  if (*(void *)(*((void *)&buf + 1) + 24) == -1)
  {
    v13 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = sub_1002237D8((uint64_t)a3->var0, a3->var2);
      *(_DWORD *)id v20 = 67109378;
      int v21 = v11;
      __int16 v22 = 2080;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot find connection to reset for portSignature %08X packet %s", v20, 0x12u);
    }
  }
  else
  {
    v13 = +[IDSGroupSessionMultiplexer sharedInstance];
    unsigned int v14 = [(NSMutableArray *)self->_routedConnections objectAtIndexedSubscript:*(void *)(*((void *)&buf + 1) + 24)];
    [v13 resetConnection:v14];
  }
  _Block_object_dispose(&buf, 8);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)purgeQUICConnectionsForParticipants:(id)a3
{
  id v4 = a3;
  if (atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire))
  {
    BOOL v16 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport purgeQUICConnectionsForParticipants: failed because transport is invalidated", buf, 2u);
    }
  }
  else
  {
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = self->_routedConnections;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          unsigned int v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          BOOL v10 = +[IDSFoundationLog Multiplexer];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v11 = [v9 isQUIC];
            *(_DWORD *)long long buf = 138412802;
            CFStringRef v12 = @"NO";
            if (v11) {
              CFStringRef v12 = @"YES";
            }
            v23 = v9;
            __int16 v24 = 2112;
            CFStringRef v25 = v12;
            __int16 v26 = 2112;
            id v27 = v4;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "purgeQUICConnectionsForParticipants: checking connection %@ isQUIC: %@ for participants %@", buf, 0x20u);
          }

          if ([v9 isQUIC])
          {
            if (!v4
              || (+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 context]), v13 = objc_claimAutoreleasedReturnValue(), unsigned int v14 = objc_msgSend(v4, "containsObject:", v13), v13, v14))
            {
              v15 = +[IDSGroupSessionMultiplexer sharedInstance];
              [v15 resetConnection:v9];

              [v9 invalidate];
            }
          }
        }
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v6);
    }

    os_unfair_lock_unlock(lock);
  }
}

- (BOOL)addListenerConnection:(id)a3
{
  id v4 = a3;
  unsigned __int8 explicit = atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire);
  if (explicit)
  {
    BOOL v10 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport addListenerConnection: failed because transport is invalidated", buf, 2u);
    }
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableArray *)self->_listeners addObject:v4];
    os_unfair_lock_unlock(&self->_lock);
    id v6 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      listeners = self->_listeners;
      *(_DWORD *)long long buf = 138412802;
      id v19 = v4;
      __int16 v20 = 2112;
      long long v21 = listeners;
      __int16 v22 = 2112;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "added listener connection %@ to listeners %@\nLocalMUXTransport %@", buf, 0x20u);
    }

    CFStringRef v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    unsigned int v14 = sub_10010A7F4;
    v15 = &unk_1009827D0;
    BOOL v16 = self;
    id v8 = v4;
    id v17 = v8;
    unsigned int v9 = objc_retainBlock(&v12);
    objc_msgSend(v8, "setPacketBufferReadHandler:", v9, v12, v13, v14, v15, v16);
    [v8 startReadOnTransportThread];
  }
  return (explicit & 1) == 0;
}

- (BOOL)_tryConsumeQUICShortHeaderPacketBuffer:(id *)a3
{
  if ([(NSMutableArray *)self->_routedConnections count])
  {
    id v5 = [(NSMutableArray *)self->_routedConnections objectAtIndexedSubscript:0];
    [v5 writePacketBuffer:a3];
  }
  else
  {
    id v6 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "_tryConsumeQUICShortHeaderPacketBuffer: no reliable unicast connection to consume packetBuffer.", v8, 2u);
    }
  }
  return 1;
}

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  if (atomic_load_explicit((atomic_uchar *volatile)&self->_invalidated, memory_order_acquire))
  {
    id v6 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Mutliplexer Transport tryConsumePacketBuffer: failed because transport is invalidated", buf, 2u);
    }

    return 0;
  }
  if (a3->var2 <= 3)
  {
    id v4 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t var2 = a3->var2;
      *(_DWORD *)long long buf = 134217984;
      *(void *)v65 = var2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "not enough header %ld to consume", buf, 0xCu);
    }

    return 0;
  }
  unsigned int v9 = bswap32(*(_DWORD *)a3->var0);
  if (v9 == -87113609)
  {
    IDSLinkPacketBufferAddBufferStart();
    BOOL v10 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)v65 = -87113609;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "header %08X is is control packet", buf, 8u);
    }

    [(IDSMultiplexerGroupSessionTransport *)self resetConnectionForPacketBuffer:a3];
    return 1;
  }
  if (!a3->var15)
  {
    if (v9 != -87133353) {
      return 0;
    }
    kdebug_trace();
    unint64_t var4 = a3->var24[0].var4;
    if (var4 || byte_100A531E8)
    {
      IDSLinkPacketBufferAddBufferStart();
      goto LABEL_24;
    }
    if (a3->var2 <= 33)
    {
      v29 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v30 = a3->var2;
        *(_DWORD *)long long buf = 134217984;
        *(void *)v65 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "packet is fanout but doest not have enough bytes for encryption header %ld", buf, 0xCu);
      }

      return 1;
    }
    unsigned int v51 = *((unsigned __int16 *)a3->var0 + 2);
    int v32 = *((unsigned __int8 *)a3->var0 + 6);
    int v33 = *((unsigned __int8 *)a3->var0 + 7);
    int v34 = *((unsigned __int8 *)a3->var0 + 8);
    int v35 = *((unsigned __int8 *)a3->var0 + 9);
    id v36 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a3->var0 + 10];
    value = (void *)0xAAAAAAAAAAAAAAAALL;
    if (NSMapMember(self->_fanoutEncryptionMKIToReceivingStateMap, v36, 0, &value))
    {
      v37 = value;
    }
    else
    {
      v37 = malloc_type_malloc(0x11F0uLL, 0x10300408CDAB1FBuLL);
      fanoutEncryptionManager = self->_fanoutEncryptionManager;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10010B330;
      v62[3] = &unk_1009827F0;
      v62[4] = v37;
      int v63 = (v32 << 24) | (v33 << 16) | (v34 << 8) | v35;
      if (([(IDSGroupEncryptionKeyManager *)fanoutEncryptionManager useDecryptingKeyForKeyIndex:v36 handler:v62] & 1) == 0)
      {
        free(v37);
        v42 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)v65 = v36;
          id v43 = "Fanout encryption - useDecryptingKeyForKeyIndex %@ failed - dropping incoming packet";
          v44 = v42;
          uint32_t v45 = 12;
          goto LABEL_68;
        }
LABEL_69:

        return 1;
      }
      [(NSMapTable *)self->_fanoutEncryptionMKIToReceivingStateMap setObject:v37 forKey:v36];
    }
    IDSLinkPacketBufferAddBufferStart();
    int v41 = sub_100221370((uint64_t)v37, bswap32(v51) >> 16, (unsigned __int8 *)a3->var0, a3->var2, 0);
    if (!v41)
    {

LABEL_24:
      if (a3->var2 <= 3)
      {
        CFStringRef v12 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v13 = a3->var2;
          *(_DWORD *)long long buf = 134217984;
          *(void *)v65 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Cannot retrieve port signature, invalid packetBuffer size: %ld", buf, 0xCu);
        }

        return 1;
      }
      unsigned int v14 = *(unsigned __int16 *)a3->var0;
      unsigned int v15 = __rev16(*((unsigned __int16 *)a3->var0 + 1));
      int v16 = __PAIR64__(v15, bswap32(v14)) >> 16;
      p_os_unfair_lock_t lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      value = 0;
      p_value = &value;
      uint64_t v60 = 0x2020000000;
      uint64_t v61 = -1;
      portSignatures = self->_portSignatures;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_10010B450;
      v56[3] = &unk_100982818;
      int v57 = v16;
      v56[5] = &value;
      v56[6] = var4;
      v56[4] = self;
      [(NSMutableArray *)portSignatures enumerateObjectsUsingBlock:v56];
      if (p_value[3] == (void *)-1)
      {
        __int16 v22 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          listeners = self->_listeners;
          *(_DWORD *)long long buf = 138412546;
          *(void *)v65 = listeners;
          *(_WORD *)&v65[8] = 2112;
          *(void *)&v65[10] = self;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "check listeners %@\nGroupSessionMUXTransport %@", buf, 0x16u);
        }

        int v49 = v16;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v19 = self->_listeners;
        id v24 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v52 objects:v70 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v53;
          v50 = p_lock;
          while (2)
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v53 != v25) {
                objc_enumerationMutation(v19);
              }
              id v27 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              if ([v27 tryConsumePacketBuffer:a3])
              {
                uint64_t v31 = v27;
                p_os_unfair_lock_t lock = v50;
                [v31 setContext:var4];
                goto LABEL_55;
              }
            }
            id v24 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v52 objects:v70 count:16];
            p_os_unfair_lock_t lock = v50;
            if (v24) {
              continue;
            }
            break;
          }
        }

        id v19 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
        {
          v28 = sub_1002237D8((uint64_t)a3->var0, a3->var2);
          *(_DWORD *)long long buf = 67110146;
          *(_DWORD *)v65 = v15;
          *(_WORD *)&v65[4] = 1024;
          *(_DWORD *)&v65[6] = __rev16(v14);
          *(_WORD *)&v65[10] = 2048;
          *(void *)&v65[12] = var4;
          __int16 v66 = 1024;
          int v67 = v49;
          __int16 v68 = 2080;
          v69 = v28;
          _os_log_impl((void *)&_mh_execute_header, &v19->super.super, OS_LOG_TYPE_DEFAULT, "Cannot find corresponding connection (localPort:%d, remotePort:%d, participantID:%llu, portSignature %08X), for incoming packet %s", buf, 0x28u);
        }
        goto LABEL_55;
      }
      -[NSMutableArray objectAtIndexedSubscript:](self->_routedConnections, "objectAtIndexedSubscript:");
      id v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      if ([(NSMutableArray *)v19 isTCP])
      {
        __int16 v20 = [(NSMutableArray *)v19 remoteTCPSYN];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          if (a3->var2 <= 19)
          {
            v38 = +[IDSFoundationLog Multiplexer];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              int64_t v39 = a3->var2;
              *(_DWORD *)long long buf = 134217984;
              *(void *)v65 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "connection is tcp but packet does not have enough bytes for header %ld", buf, 0xCu);
            }

            goto LABEL_55;
          }
          if ((a3->var0[13] & 2) != 0)
          {
            uint64_t v46 = bswap32(*((_DWORD *)a3->var0 + 1));
            uint64_t v47 = +[NSNumber numberWithUnsignedInt:v46];
            [(NSMutableArray *)v19 setRemoteTCPSYN:v47];

            id v48 = +[IDSFoundationLog Multiplexer];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 67109378;
              *(_DWORD *)v65 = v46;
              *(_WORD *)&v65[4] = 2112;
              *(void *)&v65[6] = v19;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "saved remote SYN %08X for connection %@", buf, 0x12u);
            }
          }
        }
      }
      [(NSMutableArray *)v19 writePacketBuffer:a3];
LABEL_55:

      _Block_object_dispose(&value, 8);
      os_unfair_lock_unlock(p_lock);
      return 1;
    }
    v42 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)v65 = v41;
      id v43 = "Fanout encryptinon - decryption failed with error code %d";
      v44 = v42;
      uint32_t v45 = 8;
LABEL_68:
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
      goto LABEL_69;
    }
    goto LABEL_69;
  }

  return -[IDSMultiplexerGroupSessionTransport _tryConsumeQUICShortHeaderPacketBuffer:](self, "_tryConsumeQUICShortHeaderPacketBuffer:");
}

- (void)invalidate
{
  atomic_store(1u, (unsigned __int8 *)&self->_invalidated);
  id readHandler = self->_readHandler;
  self->_id readHandler = 0;

  participantIDToAliasConverter = self->_participantIDToAliasConverter;
  self->_participantIDToAliasConverter = 0;

  fanoutEncryptionSendingEncryptionState = self->_fanoutEncryptionSendingEncryptionState;
  if (fanoutEncryptionSendingEncryptionState)
  {
    sub_100221340((uint64_t)fanoutEncryptionSendingEncryptionState);
    free(self->_fanoutEncryptionSendingEncryptionState);
    self->_fanoutEncryptionSendingEncryptionState = 0;
  }
  fanoutEncryptionSendingMKI = self->_fanoutEncryptionSendingMKI;
  self->_fanoutEncryptionSendingMKI = 0;

  memset(&enumerator, 170, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, self->_fanoutEncryptionMKIToReceivingStateMap);
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  while (NSNextMapEnumeratorPair(&enumerator, 0, &value))
  {
    uint64_t v7 = value;
    sub_100221340((uint64_t)value);
    free(v7);
  }
  NSEndMapTableEnumeration(&enumerator);
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unsigned int v9 = self->_routedConnections;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      CFStringRef v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) invalidate];
        CFStringRef v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v10);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v13 = self->_listeners;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      int v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v16), "invalidate", (void)v17);
        int v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)routedConnections
{
  return self->_routedConnections;
}

- (IDSGroupEncryptionKeyManager)fanoutEncryptionManager
{
  return self->_fanoutEncryptionManager;
}

- (void)setFanoutEncryptionManager:(id)a3
{
}

- (IDSMultiplexerTransportParticipantIDConverter)participantIDToAliasConverter
{
  return self->_participantIDToAliasConverter;
}

- (void)setParticipantIDToAliasConverter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantIDToAliasConverter, 0);
  objc_storeStrong((id *)&self->_fanoutEncryptionMKIToReceivingStateMap, 0);
  objc_storeStrong((id *)&self->_fanoutEncryptionSendingMKI, 0);
  objc_storeStrong((id *)&self->_fanoutEncryptionManager, 0);
  objc_storeStrong(&self->_readHandler, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_routedConnections, 0);
  objc_storeStrong((id *)&self->_participantIDs, 0);
  objc_storeStrong((id *)&self->_portSignatures, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end