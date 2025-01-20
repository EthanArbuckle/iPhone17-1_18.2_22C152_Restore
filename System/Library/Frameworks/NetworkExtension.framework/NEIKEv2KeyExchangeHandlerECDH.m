@interface NEIKEv2KeyExchangeHandlerECDH
- (BOOL)processPeerPayload:(id)a3;
@end

@implementation NEIKEv2KeyExchangeHandlerECDH

- (void).cxx_destruct
{
}

- (BOOL)processPeerPayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self) {
      unint64_t method = self->super._method;
    }
    else {
      unint64_t method = 0;
    }
    *(_DWORD *)buf = 134217984;
    v20 = (const char *)method;
    _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "Compute ECDH %zu shared secret", buf, 0xCu);
  }

  if (v4)
  {
    if (self) {
      ecdhHandler = self->_ecdhHandler;
    }
    else {
      ecdhHandler = 0;
    }
    id v18 = 0;
    v7 = ecdhHandler;
    BOOL v8 = [(NEIKEv2CryptoKitECDH *)v7 processPeerPayload:v4 error:&v18];
    v9 = v18;

    if (v8)
    {
      if (self) {
        v10 = self->_ecdhHandler;
      }
      else {
        v10 = 0;
      }
      v11 = v10;
      v12 = [(NEIKEv2CryptoKitECDH *)v11 sharedSecret];
      -[NEIKEv2KeyExchangeHandler setSharedSecret:]((uint64_t)self, v12);

      v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (self) {
          unint64_t v14 = self->super._method;
        }
        else {
          unint64_t v14 = 0;
        }
        *(_DWORD *)buf = 134217984;
        v20 = (const char *)v14;
        _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "Computed ECDH %zu shared secret", buf, 0xCu);
      }
    }
    else
    {
      v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        if (self) {
          unint64_t v17 = self->super._method;
        }
        else {
          unint64_t v17 = 0;
        }
        *(_DWORD *)buf = 134218242;
        v20 = (const char *)v17;
        __int16 v21 = 2112;
        v22 = v9;
        _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "Failed to compute ECDH %zu shared secret: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[NEIKEv2KeyExchangeHandlerECDH processPeerPayload:]";
      _os_log_fault_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_FAULT, "%s called with null peerPayload", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

@end