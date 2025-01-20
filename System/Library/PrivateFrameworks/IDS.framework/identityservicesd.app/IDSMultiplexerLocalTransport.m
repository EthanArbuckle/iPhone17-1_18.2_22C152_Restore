@interface IDSMultiplexerLocalTransport
- (BOOL)addListenerConnection:(id)a3;
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (IDSGroupEncryptionKeyManager)fanoutEncryptionManager;
- (IDSMultiplexerLocalTransport)initWithIdentifier:(id)a3;
- (IDSMultiplexerTransportParticipantIDConverter)participantIDToAliasConverter;
- (NSString)description;
- (NSString)identifier;
- (id)routeClientConnections:(id)a3;
- (int)packetizationHeadroom;
- (void)cancelClientConnection:(id)a3;
- (void)setPacketBufferReadHandler:(id)a3;
- (void)setParticipantIDToAliasConverter:(id)a3;
@end

@implementation IDSMultiplexerLocalTransport

- (IDSMultiplexerLocalTransport)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IDSMultiplexerLocalTransport;
  v6 = [(IDSMultiplexerLocalTransport *)&v14 init];
  if (v6)
  {
    uint64_t v7 = +[NSMutableArray array];
    portSignatures = v6->_portSignatures;
    v6->_portSignatures = (NSMutableArray *)v7;

    uint64_t v9 = +[NSMutableArray array];
    routedConnections = v6->_routedConnections;
    v6->_routedConnections = (NSMutableArray *)v9;

    uint64_t v11 = +[NSMutableArray array];
    listeners = v6->_listeners;
    v6->_listeners = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v6;
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
  return 4;
}

- (IDSGroupEncryptionKeyManager)fanoutEncryptionManager
{
  return 0;
}

- (void)cancelClientConnection:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = -1;
  routedConnections = self->_routedConnections;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100166E0C;
  v16[3] = &unk_100982730;
  id v6 = v4;
  id v17 = v6;
  v18 = &v19;
  [(NSMutableArray *)routedConnections enumerateObjectsUsingBlock:v16];
  uint64_t v7 = v20;
  if (v20[3] != -1)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_portSignatures, "removeObjectAtIndex:");
    [(NSMutableArray *)self->_routedConnections removeObjectAtIndex:v20[3]];
    uint64_t v7 = v20;
  }
  v7[3] = -1;
  listeners = self->_listeners;
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100166E34;
  v13 = &unk_100982730;
  id v9 = v6;
  id v14 = v9;
  v15 = &v19;
  [(NSMutableArray *)listeners enumerateObjectsUsingBlock:&v10];
  if (v20[3] != -1) {
    -[NSMutableArray removeObjectAtIndex:](self->_listeners, "removeObjectAtIndex:", v10, v11, v12, v13);
  }
  objc_msgSend(v9, "invalidate", v10, v11, v12, v13);

  _Block_object_dispose(&v19, 8);
}

- (id)routeClientConnections:(id)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v21;
    *(void *)&long long v5 = 67109120;
    long long v17 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v10 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v11 = [v9 portsSignature];
          *(_DWORD *)buf = v17;
          unsigned int v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[IDSLocalMultiplexer routeClientConnections] portsSignature:%08X", buf, 8u);
        }

        portSignatures = self->_portSignatures;
        v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 portsSignature]);
        [(NSMutableArray *)portSignatures addObject:v13];

        [(NSMutableArray *)self->_routedConnections addObject:v9];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1001670A8;
        v19[3] = &unk_1009827D0;
        v19[4] = self;
        v19[5] = v9;
        id v14 = objc_retainBlock(v19);
        [v9 setPacketBufferReadHandler:v14];
        v15 = +[IDSLocalMultiplexer sharedInstance];
        [v15 setupTransportForConnection:v9];

        [v9 startReadOnTransportThread];
      }
      id v6 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  return obj;
}

- (BOOL)addListenerConnection:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_listeners addObject:v4];
  long long v5 = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    listeners = self->_listeners;
    *(_DWORD *)buf = 138412802;
    id v17 = v4;
    __int16 v18 = 2112;
    uint64_t v19 = listeners;
    __int16 v20 = 2112;
    long long v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "added listener connection %@ to listeners %@\nLocalMUXTransport %@", buf, 0x20u);
  }

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_100167294;
  v13 = &unk_1009827D0;
  id v14 = self;
  id v15 = v4;
  id v7 = v4;
  v8 = objc_retainBlock(&v10);
  objc_msgSend(v7, "setPacketBufferReadHandler:", v8, v10, v11, v12, v13, v14);
  [v7 startReadOnTransportThread];

  return 1;
}

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  if (a3->var2 <= 3)
  {
    id v4 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t var2 = a3->var2;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = var2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "not enough header %ld to consume", (uint8_t *)&buf, 0xCu);
    }

    return 0;
  }
  if (bswap32(*(_DWORD *)a3->var0) != -87133353) {
    return 0;
  }
  kdebug_trace();
  [(IDSMultiplexerLocalTransport *)self packetizationHeadroom];
  IDSLinkPacketBufferAddBufferStart();
  if (a3->var2 > 3)
  {
    unsigned int v10 = *(unsigned __int16 *)a3->var0;
    unsigned int v11 = __rev16(*((unsigned __int16 *)a3->var0 + 1));
    int v12 = __PAIR64__(v11, bswap32(v10)) >> 16;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = -1;
    portSignatures = self->_portSignatures;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100167794;
    v25[3] = &unk_100984080;
    int v26 = v12;
    v25[4] = &buf;
    [(NSMutableArray *)portSignatures enumerateObjectsUsingBlock:v25];
    if (*(void *)(*((void *)&buf + 1) + 24) == -1)
    {
      id v15 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        listeners = self->_listeners;
        *(_DWORD *)v27 = 138412546;
        *(void *)v28 = listeners;
        *(_WORD *)&v28[8] = 2112;
        v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "check listeners %@\nLocalMUXTransport %@", v27, 0x16u);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = self->_listeners;
      id v17 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v22;
LABEL_20:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v19), "tryConsumePacketBuffer:", a3, (void)v21))break; {
          if (v17 == (id)++v19)
          }
          {
            id v17 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v31 count:16];
            if (v17) {
              goto LABEL_20;
            }
            goto LABEL_26;
          }
        }
      }
      else
      {
LABEL_26:

        id v14 = +[IDSFoundationLog Multiplexer];
        if (os_log_type_enabled(&v14->super.super, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = sub_1002237D8((uint64_t)a3->var0, a3->var2);
          *(_DWORD *)v27 = 67109890;
          *(_DWORD *)v28 = v11;
          *(_WORD *)&v28[4] = 1024;
          *(_DWORD *)&v28[6] = __rev16(v10);
          LOWORD(v29) = 1024;
          *(_DWORD *)((char *)&v29 + 2) = v12;
          HIWORD(v29) = 2080;
          v30 = v20;
          _os_log_impl((void *)&_mh_execute_header, &v14->super.super, OS_LOG_TYPE_DEFAULT, "Cannot find corresponding connection (localPort:%d, remotePort:%d, portSignature %08X), for incoming packet %s", v27, 0x1Eu);
        }
      }
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_routedConnections, "objectAtIndexedSubscript:");
      id v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      [(NSMutableArray *)v14 writePacketBuffer:a3];
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v7 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = a3->var2;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cannot retrieve port signature, invalid packetBuffer size: %ld", (uint8_t *)&buf, 0xCu);
    }
  }
  return 1;
}

- (void)setPacketBufferReadHandler:(id)a3
{
  self->_readHandler = objc_retainBlock(a3);

  _objc_release_x1();
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
  objc_storeStrong(&self->_readHandler, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_routedConnections, 0);
  objc_storeStrong((id *)&self->_portSignatures, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end