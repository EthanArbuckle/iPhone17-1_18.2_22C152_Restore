@interface IDSUTunPeerServiceMap
- (BOOL)associateServiceName:(id)a3 withStreamID:(unsigned __int16)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:;
- (BOOL)setRemoteInstanceID:(unsigned __int8 *)(a3;
- (BOOL)translateServiceName:(id)a3 toStreamID:(unsigned __int16 *)a4 createIfNotFound:(BOOL)a5 mappingCreated:(BOOL *)a6 remoteInstanceID:(unsigned __int8 *)(a7 remoteInstanceIDChanged:;
- (BOOL)translateStreamID:(unsigned __int16)a3 toServiceName:(id *)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:;
- (IDSUTunPeerServiceMap)initWithName:(id)a3;
- (id)description;
- (unint64_t)count;
- (void)_dumpServiceMap;
- (void)_simulateCrashWithErrorString:(id)a3;
- (void)dumpServiceMap;
@end

@implementation IDSUTunPeerServiceMap

- (IDSUTunPeerServiceMap)initWithName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSUTunPeerServiceMap;
  v5 = [(IDSUTunPeerServiceMap *)&v13 init];
  if (v5)
  {
    v6 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:1282 capacity:20];
    serviceNameToStreamIDMap = v5->_serviceNameToStreamIDMap;
    v5->_serviceNameToStreamIDMap = v6;

    v8 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:1282 valueOptions:0 capacity:20];
    streamIDToServiceNameMap = v5->_streamIDToServiceNameMap;
    v5->_streamIDToServiceNameMap = v8;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_nextStreamID = 1;
    v10 = (NSString *)[v4 copy];
    name = v5->_name;
    v5->_name = v10;
  }
  return v5;
}

- (id)description
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse_upper(self->_remoteInstanceID, out);
  id v4 = +[NSString stringWithFormat:@"<%p> name %@ instanceID [%s] nextStreamID %u\n_serviceNameToStreamIDMap %@\n_streamIDToServiceNameMap %@\n", self, self->_name, out, self->_nextStreamID, self->_serviceNameToStreamIDMap, self->_streamIDToServiceNameMap];

  return v4;
}

- (BOOL)setRemoteInstanceID:(unsigned __int8 *)(a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v7 = uuid_compare((const unsigned __int8 *)a3, self->_remoteInstanceID);
  if (v7)
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v8;
    *(_OWORD *)&out[16] = v8;
    *(void *)&v23[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t v23 = v8;
    *(_OWORD *)&v23[16] = v8;
    uuid_unparse_upper(self->_remoteInstanceID, out);
    uuid_unparse_upper((const unsigned __int8 *)a3, v23);
    v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = out;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote instance ID reset: old [%s] new [%s]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    uint64_t v10 = 0;
    previousRemoteInstanceIDs = self->_previousRemoteInstanceIDs;
    while (1)
    {
      int v12 = uuid_compare((const unsigned __int8 *)a3, previousRemoteInstanceIDs[v10]);
      BOOL v3 = v12 != 0;
      if (!v12) {
        break;
      }
      if (++v10 == 8)
      {
        uuid_copy(self->_remoteInstanceID, (const unsigned __int8 *)a3);
        [(NSMapTable *)self->_serviceNameToStreamIDMap removeAllObjects];
        [(NSMapTable *)self->_streamIDToServiceNameMap removeAllObjects];
        self->_nextStreamID = 1;
        uuid_copy(previousRemoteInstanceIDs[self->_nextRemoteInstanceIDIndex], (const unsigned __int8 *)a3);
        int v13 = self->_nextRemoteInstanceIDIndex + 1;
        BOOL v14 = -v13 < 0;
        int v15 = -v13 & 7;
        int v16 = v13 & 7;
        if (!v14) {
          int v16 = -v15;
        }
        self->_nextRemoteInstanceIDIndex = v16;
        goto LABEL_21;
      }
    }
    *(void *)&buf[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v17;
    uuid_unparse_upper((const unsigned __int8 *)a3, buf);
    v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v20 = 136315138;
      v21 = buf;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Asked to set remote instanceID for previous ID [%s]", v20, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
LABEL_21:
  os_unfair_lock_unlock(p_lock);
  return v7 == 0 || v3;
}

- (BOOL)associateServiceName:(id)a3 withStreamID:(unsigned __int16)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:
{
  unsigned int v8 = a4;
  id v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (uuid_compare((const unsigned __int8 *)a5, self->_remoteInstanceID))
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v12;
    *(_OWORD *)&out[16] = v12;
    *(void *)((char *)&value[1] + 13) = 0xAAAAAAAAAAAAAAAALL;
    value[0] = v12;
    value[1] = v12;
    uuid_unparse_upper(self->_remoteInstanceID, out);
    uuid_unparse_upper((const unsigned __int8 *)a5, (char *)value);
    int v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = out;
      __int16 v35 = 2080;
      v36 = value;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remote instance ID do not match: old [%s] new [%s]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    BOOL v14 = 0;
    *a6 = 1;
    goto LABEL_48;
  }
  if (v8)
  {
    *(void *)&value[0] = 0xAAAAAAAAAAAAAAAALL;
    BOOL v15 = NSMapMember(self->_streamIDToServiceNameMap, (const void *)v8, 0, (void **)value);
    BOOL v16 = v15;
    uint64_t v17 = *(void *)&value[0];
    if (v15) {
      v18 = *(void **)&value[0];
    }
    else {
      v18 = 0;
    }
    id v19 = v18;
    BOOL v20 = NSMapMember(self->_serviceNameToStreamIDMap, v10, 0, (void **)value);
    BOOL v21 = v20;
    if (v20) {
      unsigned __int16 v22 = value[0];
    }
    else {
      unsigned __int16 v22 = 0;
    }
    if (v16)
    {
      unsigned int v23 = [v10 isEqualToString:v17];
      BOOL v24 = v8 != v22 && v21;
      if (v24 || !v23)
      {
        CFStringRef v25 = @"YES";
        CFStringRef v26 = @"NO";
        if (v23) {
          CFStringRef v25 = @"NO";
        }
        if (!v24) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }
    else if (v8 != v22 && v20)
    {
      CFStringRef v25 = @"NO";
LABEL_38:
      CFStringRef v26 = @"YES";
LABEL_39:
      v29 = +[NSString stringWithFormat:@"serviceMap[%@ <=> %lu] serviceNameMismatch %@ streamIDMismatch %@ [%@ <=> %lu]", v10, v8, v25, v26, v19, v22];
      v30 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uuid_string_t out = 138412290;
        *(void *)&out[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)out, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v32 = v29;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            v32 = v29;
            _IDSLogV();
          }
        }
      }
      -[IDSUTunPeerServiceMap _simulateCrashWithErrorString:](self, "_simulateCrashWithErrorString:", v29, v32);

      BOOL v14 = 0;
      goto LABEL_47;
    }
    [(NSMapTable *)self->_serviceNameToStreamIDMap setObject:v8 forKey:v10];
    [(NSMapTable *)self->_streamIDToServiceNameMap setObject:v10 forKey:v8];
    BOOL v14 = 1;
LABEL_47:

    goto LABEL_48;
  }
  v27 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uuid_string_t out = 138412290;
    *(void *)&out[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "cannot associate %@ with streamID 0", (uint8_t *)out, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled()
    && _IDSShouldLogTransport()
    && (_IDSLogTransport(), _IDSShouldLog()))
  {
    _IDSLogV();
    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_48:
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (BOOL)translateStreamID:(unsigned __int16)a3 toServiceName:(id *)a4 remoteInstanceID:(unsigned __int8 *)(a5 remoteInstanceIDChanged:
{
  unsigned int v9 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (uuid_compare((const unsigned __int8 *)a5, self->_remoteInstanceID))
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v12;
    *(_OWORD *)&out[16] = v12;
    *(void *)&v20[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t v20 = v12;
    *(_OWORD *)&v20[16] = v12;
    uuid_unparse_upper(self->_remoteInstanceID, out);
    uuid_unparse_upper((const unsigned __int8 *)a5, v20);
    int v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = out;
      __int16 v18 = 2080;
      id v19 = v20;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remote instance ID do not match: old [%s] new [%s]", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    BOOL v14 = 0;
    *a6 = 1;
  }
  else
  {
    *(void *)uuid_string_t out = 0xAAAAAAAAAAAAAAAALL;
    BOOL v14 = NSMapMember(self->_streamIDToServiceNameMap, (const void *)v9, 0, (void **)out);
    if (v14) {
      *a4 = *(id *)out;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (BOOL)translateServiceName:(id)a3 toStreamID:(unsigned __int16 *)a4 createIfNotFound:(BOOL)a5 mappingCreated:(BOOL *)a6 remoteInstanceID:(unsigned __int8 *)(a7 remoteInstanceIDChanged:
{
  BOOL v11 = a5;
  id v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!uuid_compare((const unsigned __int8 *)a7, self->_remoteInstanceID))
  {
    *(void *)&value[0] = 0xAAAAAAAAAAAAAAAALL;
    if (NSMapMember(self->_serviceNameToStreamIDMap, v14, 0, (void **)value))
    {
      if (*(void *)&value[0] >= 0x10000uLL)
      {
        id v19 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uuid_string_t out = 134218242;
          *(void *)&out[4] = *(void *)&value[0];
          *(_WORD *)&out[12] = 2112;
          *(void *)&out[14] = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unexpected streamID %lu found when asked to translate %@", (uint8_t *)out, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              _IDSLogV();
              BOOL v18 = 0;
              goto LABEL_28;
            }
          }
        }
LABEL_20:
        BOOL v18 = 0;
        goto LABEL_28;
      }
      *a4 = value[0];
    }
    else
    {
      if (!v11) {
        goto LABEL_20;
      }
      if ([(NSMapTable *)self->_serviceNameToStreamIDMap count] > 0xFFFE)
      {
        [(NSMapTable *)self->_serviceNameToStreamIDMap count];
        _IMWarn();
        BOOL v18 = 0;
        *a6 = 0;
        goto LABEL_28;
      }
      do
      {
        nextStreamID = (const void *)self->_nextStreamID;
        if (((nextStreamID + 1) & 0x10000) != 0) {
          unsigned __int16 v21 = 1;
        }
        else {
          unsigned __int16 v21 = (_WORD)nextStreamID + 1;
        }
        self->_nextStreamID = v21;
      }
      while (NSMapMember(self->_streamIDToServiceNameMap, nextStreamID, 0, (void **)value));
      *a4 = (unsigned __int16)nextStreamID;
      *a6 = 1;
      [(NSMapTable *)self->_serviceNameToStreamIDMap setObject:nextStreamID forKey:v14];
      [(NSMapTable *)self->_streamIDToServiceNameMap setObject:v14 forKey:nextStreamID];
    }
    BOOL v18 = 1;
    goto LABEL_28;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v16;
  *(_OWORD *)&out[16] = v16;
  *(void *)((char *)&value[1] + 13) = 0xAAAAAAAAAAAAAAAALL;
  value[0] = v16;
  value[1] = v16;
  uuid_unparse_upper(self->_remoteInstanceID, out);
  uuid_unparse_upper((const unsigned __int8 *)a7, (char *)value);
  uint64_t v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v24 = out;
    __int16 v25 = 2080;
    CFStringRef v26 = value;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote instance ID do not match: old [%s] new [%s]", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  BOOL v18 = 0;
  *a8 = 1;
LABEL_28:
  os_unfair_lock_unlock(p_lock);

  return v18;
}

- (unint64_t)count
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMapTable *)self->_serviceNameToStreamIDMap count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_dumpServiceMap
{
  BOOL v3 = +[NSMutableString string];
  for (uint64_t i = 58; i != 186; i += 16)
  {
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v5;
    *(_OWORD *)&out[16] = v5;
    uuid_unparse_upper((const unsigned __int8 *)self + i, out);
    objc_msgSend(v3, "appendFormat:", @"%s\n", out);
  }
  v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int nextRemoteInstanceIDIndex = self->_nextRemoteInstanceIDIndex;
    *(_DWORD *)uuid_string_t out = 138412802;
    *(void *)&out[4] = self;
    *(_WORD *)&out[12] = 1024;
    *(_DWORD *)&out[14] = nextRemoteInstanceIDIndex;
    *(_WORD *)&out[18] = 2112;
    *(void *)&out[20] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@\nPrevious Remote Instance IDs (next:%d) {%@}", (uint8_t *)out, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)dumpServiceMap
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(IDSUTunPeerServiceMap *)self _dumpServiceMap];

  os_unfair_lock_unlock(p_lock);
}

- (void)_simulateCrashWithErrorString:(id)a3
{
  id v5 = a3;
  BOOL v3 = +[NSProcessInfo processInfo];
  unint64_t v4 = [v3 processName];
  IMLogSimulateCrashForProcess();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamIDToServiceNameMap, 0);
  objc_storeStrong((id *)&self->_serviceNameToStreamIDMap, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end