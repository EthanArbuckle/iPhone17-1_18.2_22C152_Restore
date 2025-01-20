@interface IDSUTunControlMessage_Hello
- (BOOL)_isSupportIPsecLinkFlagSet;
- (BOOL)_isTinkerFlagSet;
- (IDSUTunControlMessage_Hello)init;
- (IDSUTunControlMessage_Hello)initWithBytes:(const void *)a3 length:(unint64_t)a4 loggingPrefixString:(id)a5;
- (NSNumber)capabilityFlags;
- (NSNumber)maxCompatibilityVersion;
- (NSNumber)minCompatibilityVersion;
- (NSNumber)pairingProtocolVersion;
- (NSNumber)serviceMinCompatibilityVersion;
- (NSString)controlChannelVersion;
- (NSString)model;
- (NSString)productBuildVersion;
- (NSString)productName;
- (NSString)productVersion;
- (NSUUID)deviceUniqueID;
- (NSUUID)instanceID;
- (id)data;
- (id)description;
- (void)setCapabilityFlags:(id)a3;
- (void)setControlChannelVersion:(id)a3;
- (void)setDeviceUniqueID:(id)a3;
- (void)setInstanceID:(id)a3;
- (void)setMaxCompatibilityVersion:(id)a3;
- (void)setMinCompatibilityVersion:(id)a3;
- (void)setModel:(id)a3;
- (void)setPairingProtocolVersion:(id)a3;
- (void)setProductBuildVersion:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setServiceMinCompatibilityVersion:(id)a3;
@end

@implementation IDSUTunControlMessage_Hello

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  long long v12 = *(_OWORD *)&self->_productVersion;
  long long v13 = *(_OWORD *)&self->_controlChannelVersion;
  long long v11 = *(_OWORD *)&self->_model;
  long long v10 = *(_OWORD *)&self->_minCompatibilityVersion;
  instanceID = self->_instanceID;
  deviceUniqueID = self->_deviceUniqueID;
  v6 = +[NSNumber numberWithBool:[(IDSUTunControlMessage_Hello *)self _isSupportIPsecLinkFlagSet]];
  v7 = +[NSNumber numberWithBool:[(IDSUTunControlMessage_Hello *)self _isTinkerFlagSet]];
  id v8 = [v3 initWithFormat:@"hello (controlChannelVersion: [%@], productName: [%@], productVersion: [%@], productBuildVersion: [%@], model: [%@], protocol: %@ minCompatibilityVersion: %@ maxCompatibilityVersion: %@ deviceUniqueID: %@ instanceID: %@, supportIPsecLink:%@, isTinker: %@)", v13, v12, v11, v10, deviceUniqueID, instanceID, v6, v7];

  return v8;
}

- (BOOL)_isSupportIPsecLinkFlagSet
{
  capabilityFlags = self->_capabilityFlags;
  if (capabilityFlags) {
    return ([(NSNumber *)capabilityFlags unsignedLongLongValue] >> 8) & 1;
  }
  return (char)capabilityFlags;
}

- (BOOL)_isTinkerFlagSet
{
  capabilityFlags = self->_capabilityFlags;
  if (capabilityFlags) {
    return ([(NSNumber *)capabilityFlags unsignedLongLongValue] >> 10) & 1;
  }
  return (char)capabilityFlags;
}

- (IDSUTunControlMessage_Hello)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSUTunControlMessage_Hello;
  return [(IDSUTunControlMessage_Hello *)&v3 init];
}

- (id)data
{
  if (self->_controlChannelVersion
    && self->_productName
    && self->_productVersion
    && self->_productBuildVersion
    && self->_model
    && self->_capabilityFlags
    && (instanceID = self->_instanceID) != 0
    && self->_deviceUniqueID)
  {
    v44[0] = 0xAAAAAAAAAAAAAAAALL;
    v44[1] = 0xAAAAAAAAAAAAAAAALL;
    [(NSUUID *)instanceID getUUIDBytes:v44];
    v43[0] = 0xAAAAAAAAAAAAAAAALL;
    v43[1] = 0xAAAAAAAAAAAAAAAALL;
    [(NSUUID *)self->_deviceUniqueID getUUIDBytes:v43];
    controlChannelVersion = self->_controlChannelVersion;
    productName = self->_productName;
    productVersion = self->_productVersion;
    productBuildVersion = self->_productBuildVersion;
    model = self->_model;
    unsigned int v40 = [(NSNumber *)self->_pairingProtocolVersion unsignedIntValue];
    [(NSNumber *)self->_minCompatibilityVersion unsignedIntValue];
    [(NSNumber *)self->_maxCompatibilityVersion unsignedIntValue];
    [(NSNumber *)self->_capabilityFlags unsignedLongLongValue];
    [(NSNumber *)self->_serviceMinCompatibilityVersion unsignedShortValue];
    v9 = controlChannelVersion;
    v42 = productName;
    long long v10 = productVersion;
    long long v11 = productBuildVersion;
    long long v12 = model;
    uint64_t v13 = _IDSLinkPacketBufferCreate();
    *(unsigned char *)(v13 + 1297) = 1;
    v41 = v9;
    if (v9 && (v14 = [(NSString *)v9 UTF8String]) != 0)
    {
      v15 = v14;
      unsigned int v16 = strlen(v14);
      *(_WORD *)(v13 + 1298) = bswap32(v16) >> 16;
      uint64_t v17 = (unsigned __int16)v16;
      if ((_WORD)v16) {
        memcpy((void *)(v13 + 1300), v15, (unsigned __int16)v16);
      }
    }
    else
    {
      uint64_t v17 = 0;
      *(_WORD *)(v13 + 1298) = 0;
    }
    v20 = (_WORD *)(v13 + v17 + 1300);
    if (v42 && (v21 = [(NSString *)v42 UTF8String]) != 0)
    {
      v22 = v21;
      unsigned int v23 = strlen(v21);
      _WORD *v20 = bswap32(v23) >> 16;
      uint64_t v24 = (unsigned __int16)v23;
      if ((_WORD)v23) {
        memcpy(v20 + 1, v22, (unsigned __int16)v23);
      }
    }
    else
    {
      uint64_t v24 = 0;
      _WORD *v20 = 0;
    }
    v25 = (_WORD *)((char *)v20 + v24 + 2);
    if (v10 && (v26 = [(NSString *)v10 UTF8String]) != 0)
    {
      v27 = v26;
      unsigned int v28 = strlen(v26);
      _WORD *v25 = bswap32(v28) >> 16;
      uint64_t v29 = (unsigned __int16)v28;
      if ((_WORD)v28) {
        memcpy(v25 + 1, v27, (unsigned __int16)v28);
      }
    }
    else
    {
      uint64_t v29 = 0;
      _WORD *v25 = 0;
    }
    v30 = (_WORD *)((char *)v25 + v29 + 2);
    if (v11 && (v31 = [(NSString *)v11 UTF8String]) != 0)
    {
      v32 = v31;
      unsigned int v33 = strlen(v31);
      _WORD *v30 = bswap32(v33) >> 16;
      uint64_t v34 = (unsigned __int16)v33;
      if ((_WORD)v33) {
        memcpy(v30 + 1, v32, (unsigned __int16)v33);
      }
    }
    else
    {
      uint64_t v34 = 0;
      _WORD *v30 = 0;
    }
    v35 = (_WORD *)((char *)v30 + v34 + 2);
    if (v12 && (v36 = [(NSString *)v12 UTF8String]) != 0)
    {
      v37 = v36;
      unsigned int v38 = strlen(v36);
      _WORD *v35 = bswap32(v38) >> 16;
      uint64_t v39 = (unsigned __int16)v38;
      if ((_WORD)v38) {
        memcpy(v35 + 1, v37, (unsigned __int16)v38);
      }
    }
    else
    {
      uint64_t v39 = 0;
      _WORD *v35 = 0;
    }
    *(_DWORD *)((char *)v35 + v39 + 2) = bswap32(v40);
    IDSByteBufferInitForWriteWithAllocatedSpace();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferRelease();
    v18 = +[NSData dataWithBytes:v13 + 1297 length:0xAAAAAAAAAAAAA599 - v13];
    _IDSLinkPacketBufferRelease();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (IDSUTunControlMessage_Hello)initWithBytes:(const void *)a3 length:(unint64_t)a4 loggingPrefixString:(id)a5
{
  id v8 = a5;
  v48.receiver = self;
  v48.super_class = (Class)IDSUTunControlMessage_Hello;
  v9 = [(IDSUTunControlMessage_Hello *)&v48 init];
  if (!v9) {
    goto LABEL_83;
  }
  if (a4)
  {
    long long v10 = (unsigned int *)((char *)a3 + 1);
    unint64_t v11 = a4 - 1;
    if (a4 - 1 < 2)
    {
      id v43 = 0;
      id v44 = 0;
      id v45 = 0;
      id v46 = 0;
      v25 = 0;
      uint64_t v24 = 0;
      unint64_t v23 = 0;
LABEL_58:
      id obj = v25;
      objc_storeStrong((id *)&v9->_controlChannelVersion, v25);
      objc_storeStrong((id *)&v9->_productName, v46);
      objc_storeStrong((id *)&v9->_productVersion, v45);
      objc_storeStrong((id *)&v9->_productBuildVersion, v44);
      objc_storeStrong((id *)&v9->_model, v43);
      uint64_t v30 = +[NSNumber numberWithUnsignedInt:v24];
      pairingProtocolVersion = v9->_pairingProtocolVersion;
      v9->_pairingProtocolVersion = (NSNumber *)v30;

      v32 = v9->_pairingProtocolVersion;
      objc_storeStrong((id *)&v9->_maxCompatibilityVersion, v32);
      objc_storeStrong((id *)&v9->_minCompatibilityVersion, v32);
      unint64_t v57 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v33;
      long long v56 = v33;
      uint64_t v34 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v49 = 134217984;
        unint64_t v50 = v23;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Optional field data byte size: %lu", v49, 0xCu);
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
      IDSByteBufferInitForRead();
      if (IDSByteBufferReadField())
      {
        do
        {
          v35 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v49 = 67109120;
            LODWORD(v50) = 170;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Unknown field type: %u", v49, 8u);
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
        while ((IDSByteBufferReadField() & 1) != 0);
      }
      IDSByteBufferRelease();
      v36 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v9->_pairingProtocolVersion;
        minCompatibilityVersion = v9->_minCompatibilityVersion;
        maxCompatibilityVersion = v9->_maxCompatibilityVersion;
        *(_DWORD *)v49 = 138412802;
        unint64_t v50 = (unint64_t)v37;
        __int16 v51 = 2112;
        v52 = minCompatibilityVersion;
        __int16 v53 = 2112;
        v54 = maxCompatibilityVersion;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "ProtocolVersion: %@, min/max: %@ %@", v49, 0x20u);
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

      int v29 = 0;
LABEL_79:

LABEL_80:
      goto LABEL_81;
    }
    id obj = 0;
    uint64_t v12 = __rev16(*(unsigned __int16 *)((char *)a3 + 1));
    if (v12)
    {
      unsigned int v13 = a4 - 3 - v12;
      if ((int)a4 - 3 >= (int)v12)
      {
        id obj = [objc_alloc((Class)NSString) initWithBytes:(char *)a3 + 3 length:v12 encoding:4];
        if (!obj)
        {
          v26 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v8;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: control message: hello cannot decode controlChannelVersion", buf, 0xCu);
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
          goto LABEL_82;
        }
        long long v10 = (unsigned int *)((char *)a3 + v12 + 3);
        if (v13 < 2)
        {
          id v43 = 0;
          id v45 = 0;
          id v46 = 0;
          goto LABEL_55;
        }
        unint64_t v11 = (int)v13;
      }
    }
    id v46 = 0;
    uint64_t v14 = __rev16(*(unsigned __int16 *)v10);
    if (v14)
    {
      int v15 = v11 - 2 - v14;
      if ((int)v11 - 2 >= (int)v14)
      {
        id v46 = [objc_alloc((Class)NSString) initWithBytes:(char *)v10 + 2 length:v14 encoding:4];
        if (!v46)
        {
          v27 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v8;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@: control message: hello cannot decode productName", buf, 0xCu);
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

          goto LABEL_82;
        }
        long long v10 = (unsigned int *)((char *)v10 + v14 + 2);
        unint64_t v11 = v15;
      }
    }
    if (v11 < 2)
    {
      id v43 = 0;
      id v45 = 0;
    }
    else
    {
      id v45 = 0;
      uint64_t v16 = __rev16(*(unsigned __int16 *)v10);
      int v17 = v11 - 2;
      if (!v16 || (unsigned int v18 = v17 - v16, v17 < (int)v16))
      {
LABEL_19:
        id v44 = 0;
        uint64_t v19 = __rev16(*(unsigned __int16 *)v10);
        if (v19)
        {
          int v20 = v17 - v19;
          if (v17 >= (int)v19)
          {
            id v44 = [objc_alloc((Class)NSString) initWithBytes:(char *)v10 + 2 length:v19 encoding:4];
            if (!v44)
            {
              v41 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v8;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@: control message: hello cannot decode productBuildVersion", buf, 0xCu);
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
              int v29 = 1;
              goto LABEL_80;
            }
            long long v10 = (unsigned int *)((char *)v10 + v19 + 2);
            unint64_t v11 = v20;
          }
        }
        if (v11 < 2)
        {
          id v43 = 0;
        }
        else
        {
          id v43 = 0;
          uint64_t v21 = __rev16(*(unsigned __int16 *)v10);
          if (v21)
          {
            int v22 = v11 - 2 - v21;
            if ((int)v11 - 2 >= (int)v21)
            {
              id v43 = [objc_alloc((Class)NSString) initWithBytes:(char *)v10 + 2 length:v21 encoding:4];
              if (!v43)
              {
                v42 = OSLogHandleForTransportCategory();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v8;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@: control message: hello cannot decode model", buf, 0xCu);
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
                int v29 = 1;
                goto LABEL_79;
              }
              long long v10 = (unsigned int *)((char *)v10 + v21 + 2);
              unint64_t v11 = v22;
            }
          }
          unint64_t v23 = v11 - 4;
          if (v11 >= 4)
          {
            uint64_t v24 = bswap32(*v10);
LABEL_57:
            v25 = obj;
            goto LABEL_58;
          }
        }
LABEL_56:
        uint64_t v24 = 0;
        unint64_t v23 = 0;
        goto LABEL_57;
      }
      id v45 = [objc_alloc((Class)NSString) initWithBytes:(char *)v10 + 2 length:v16 encoding:4];
      if (!v45)
      {
        unsigned int v28 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: control message: hello cannot decode productVersion", buf, 0xCu);
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
        int v29 = 1;
LABEL_81:

        if (v29)
        {
LABEL_82:
          a4 = 0;
          goto LABEL_84;
        }
LABEL_83:
        a4 = v9;
        goto LABEL_84;
      }
      long long v10 = (unsigned int *)((char *)v10 + v16 + 2);
      int v17 = v18 - 2;
      if (v18 >= 2)
      {
        unint64_t v11 = (int)v18;
        goto LABEL_19;
      }
      id v43 = 0;
    }
LABEL_55:
    id v44 = 0;
    goto LABEL_56;
  }
LABEL_84:

  return (IDSUTunControlMessage_Hello *)a4;
}

- (NSString)controlChannelVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControlChannelVersion:(id)a3
{
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProductName:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)productBuildVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProductBuildVersion:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModel:(id)a3
{
}

- (NSNumber)pairingProtocolVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPairingProtocolVersion:(id)a3
{
}

- (NSNumber)minCompatibilityVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMinCompatibilityVersion:(id)a3
{
}

- (NSNumber)maxCompatibilityVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMaxCompatibilityVersion:(id)a3
{
}

- (NSNumber)capabilityFlags
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCapabilityFlags:(id)a3
{
}

- (NSNumber)serviceMinCompatibilityVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setServiceMinCompatibilityVersion:(id)a3
{
}

- (NSUUID)instanceID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInstanceID:(id)a3
{
}

- (NSUUID)deviceUniqueID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceUniqueID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUniqueID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_serviceMinCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_capabilityFlags, 0);
  objc_storeStrong((id *)&self->_maxCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_minCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_pairingProtocolVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);

  objc_storeStrong((id *)&self->_controlChannelVersion, 0);
}

@end