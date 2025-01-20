@interface IDSMultiplexerGroupConnection
- (BOOL)tryConsumePacketBuffer:(id *)a3;
- (BOOL)verboseFunctionalLogging;
- (OS_nw_framer)framer;
- (OS_nw_protocol_definition)protocol;
- (id)getProtocolDefinition;
- (void)callPacketBufferReadHandler:(id *)a3;
- (void)invalidate;
- (void)setFramer:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setVerboseFunctionalLogging:(BOOL)a3;
- (void)writePacketBuffer:(id *)a3;
@end

@implementation IDSMultiplexerGroupConnection

- (void)invalidate
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->super._invalidated = 1;
  objc_storeWeak((id *)&self->_framer, 0);
  protocol = self->_protocol;
  self->_protocol = 0;

  id readHandler = self->super._readHandler;
  self->super._id readHandler = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)getProtocolDefinition
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  protocol = self->_protocol;
  if (!protocol)
  {
    self->_verboseFunctionalLogging = IMGetCachedDomainBoolForKeyWithDefaultValue();
    v5 = (OS_nw_protocol_definition *)sub_100401868(self);
    v6 = self->_protocol;
    self->_protocol = v5;

    protocol = self->_protocol;
  }
  v7 = protocol;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)callPacketBufferReadHandler:(id *)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (self->super._invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return;
    }
    *(_DWORD *)buf = 138412290;
    v12 = self;
    v7 = "readPacketBuffer called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);

  if (!WeakRetained)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v12 = self;
    v7 = "readPacketBuffer called but framer is nil - %@";
    goto LABEL_4;
  }
  id readHandler = self->super._readHandler;
  if (!readHandler)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_DWORD *)buf = 138412290;
    v12 = self;
    v7 = "readPacketBuffer called but readHandler is nil - %@";
    goto LABEL_4;
  }
  v10 = (void (**)(id, $7E5B20AA39B03BD07413883FE2814EDA *))objc_retainBlock(readHandler);
  os_unfair_lock_unlock(p_lock);
  v10[2](v10, a3);
}

- (void)writePacketBuffer:(id *)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (!self->super._invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);
    if (WeakRetained)
    {
      if (a3->var2 > 7)
      {
        var0 = a3->var0;
        *(_WORD *)var0 = __rev16([(IDSMultiplexerConnection *)self remotePort]);
        *((_WORD *)var0 + 1) = __rev16([(IDSMultiplexerConnection *)self localPort]);
        v11 = [(IDSMultiplexerConnection *)self localEndpoint];
        address = nw_endpoint_get_address(v11);

        v13 = [(IDSMultiplexerConnection *)self remoteEndpoint];
        v14 = nw_endpoint_get_address(v13);

        if (address->sa_family != 30) {
          sub_10072403C();
        }
        if (v14->sa_family != 30) {
          sub_100724010();
        }
        udp6checksum((uint64_t)&address->sa_data[6], (uint64_t)&v14->sa_data[6], (int8x16_t *)a3->var0, a3->var2);
        if (self->_verboseFunctionalLogging)
        {
          v15 = +[IDSFoundationLog Multiplexer];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = sub_1002237D8((uint64_t)a3->var0, a3->var2);
            *(_DWORD *)buf = 136315138;
            v22 = (IDSMultiplexerGroupConnection *)v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "writePacketBuffer whole packet:\n%s", buf, 0xCu);
          }
        }
        os_unfair_lock_unlock(p_lock);
        dispatch_data_t v17 = dispatch_data_create(a3->var0, a3->var2, 0, 0);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100402368;
        v18[3] = &unk_10097E440;
        v19 = WeakRetained;
        dispatch_data_t v20 = v17;
        v7 = v17;
        nw_framer_async(v19, v18);

        goto LABEL_18;
      }
      os_unfair_lock_unlock(p_lock);
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var2 = a3->var2;
        *(_DWORD *)buf = 134217984;
        v22 = (IDSMultiplexerGroupConnection *)var2;
        v9 = "packet doest not have enough bytes for header %ld";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_unlock(p_lock);
      v7 = +[IDSFoundationLog Multiplexer];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = self;
        v9 = "writePacketBuffer called but framer is nil - %@";
        goto LABEL_10;
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  os_unfair_lock_unlock(p_lock);
  id WeakRetained = +[IDSFoundationLog Multiplexer];
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "writePacketBuffer called but invalidated - %@", buf, 0xCu);
  }
LABEL_19:
}

- (BOOL)tryConsumePacketBuffer:(id *)a3
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  if (self->super._invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return 0;
    }
    int v18 = 138412290;
    *(void *)v19 = self;
    v7 = "writePacketBuffer called but invalidated - %@";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, 0xCu);
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);

  if (!WeakRetained)
  {
    os_unfair_lock_unlock(p_lock);
    v6 = +[IDSFoundationLog Multiplexer];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v18 = 138412290;
    *(void *)v19 = self;
    v7 = "writePacketBuffer called but framer is nil - %@";
    goto LABEL_4;
  }
  if (a3->var2 > 3)
  {
    unsigned int v12 = __rev16(*(unsigned __int16 *)a3->var0);
    unsigned int v13 = __rev16(*((unsigned __int16 *)a3->var0 + 1));
    v14 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [(IDSMultiplexerConnection *)self localPort];
      unsigned int v16 = [(IDSMultiplexerConnection *)self remotePort];
      int64_t var2 = a3->var2;
      int v18 = 67110144;
      *(_DWORD *)v19 = v15;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v16;
      __int16 v20 = 1024;
      unsigned int v21 = v13;
      __int16 v22 = 1024;
      unsigned int v23 = v12;
      __int16 v24 = 2048;
      int64_t v25 = var2;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "connection local:%u remote:%u tryConsume packet dst:%u src:%u packetBufferLength:%ld", (uint8_t *)&v18, 0x24u);
    }

    if ([(IDSMultiplexerConnection *)self localPort] == v13
      && (![(IDSMultiplexerConnection *)self remotePort]
       || [(IDSMultiplexerConnection *)self remotePort] == v12))
    {
      os_unfair_lock_unlock(p_lock);
      [(IDSMultiplexerGroupConnection *)self writePacketBuffer:a3];
      return 1;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v10 = +[IDSFoundationLog Multiplexer];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = a3->var2;
      int v18 = 134217984;
      *(void *)v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Connection cannot retrieve port signature, invalid packetBuffer size: %ld", (uint8_t *)&v18, 0xCu);
    }
  }
  return 0;
}

- (OS_nw_framer)framer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_framer);

  return (OS_nw_framer *)WeakRetained;
}

- (void)setFramer:(id)a3
{
}

- (OS_nw_protocol_definition)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
}

- (BOOL)verboseFunctionalLogging
{
  return self->_verboseFunctionalLogging;
}

- (void)setVerboseFunctionalLogging:(BOOL)a3
{
  self->_verboseFunctionalLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);

  objc_destroyWeak((id *)&self->_framer);
}

@end