@interface IDSFTGL
- (BOOL)_postProcessAllocbindResponse:(id)a3 candidatePair:(id)a4 candidatePairToken:(id)a5;
- (BOOL)_postProcessQUICAllocbindResponse:(id)a3 candidatePair:(id)a4;
- (BOOL)_setupNewQRLinkIfNecessary:(id)a3;
- (void)_resetRetryCountForCandidatePair:(id)a3;
- (void)disconnectWithCompletionHandler:(id)a3 isReinitiating:(BOOL)a4;
- (void)sendSKEData:(id)a3;
- (void)setDefaultUnderlyingLink:(char)a3;
- (void)setHasPendingAllocation:(BOOL)a3;
- (void)startWithOptions:(id)a3;
@end

@implementation IDSFTGL

- (void)startWithOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8 = objc_msgSend_FTGL(IDSFoundationLog, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    idsSessionID = self->super._idsSessionID;
    *(_DWORD *)buf = 138412546;
    v12 = self;
    __int16 v13 = 2112;
    v14 = idsSessionID;
    _os_log_impl(&dword_19D9BE000, v8, OS_LOG_TYPE_DEFAULT, "Start GL %@ for IDSSessionID: %@ (FaceTime:YES, isMultiway:NO).", buf, 0x16u);
  }

  self->super._startPort = 16393;
  self->super._portRange = 10;
  v10.receiver = self;
  v10.super_class = (Class)IDSFTGL;
  [(IDSGlobalLink *)&v10 startWithOptions:v4];

  self->super._shouldProcessBasebandNotification = 1;
  self->super._supportChannelData = 1;
}

- (void)disconnectWithCompletionHandler:(id)a3 isReinitiating:(BOOL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)IDSFTGL;
  [(IDSGlobalLink *)&v11 disconnectWithCompletionHandler:a3 isReinitiating:a4];
  objc_msgSend__sendSessionDisconnectedCommand(self, v5, v6, v7);
  objc_msgSend__startDisconnectTimer(self, v8, v9, v10);
}

- (BOOL)_postProcessAllocbindResponse:(id)a3 candidatePair:(id)a4 candidatePairToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v12 = a5;
  if (!self->super._enableSKE || self->super._skeToRemoteComplete)
  {
LABEL_3:
    BOOL v14 = 0;
    goto LABEL_4;
  }
  if (!self->super._skeData
    || (objc_msgSend_isAcceptedRelaySession(v9, v10, v11, v13) & 1) == 0 && self->super._isInitiator)
  {
    if (!self->super._delaySessionConnected)
    {
      self->super._delaySessionConnected = 1;
      v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_19D9BE000, v16, OS_LOG_TYPE_DEFAULT, "_postProcessAllocbindResponse: SKE data is not ready, delay session connected.", v21, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"_postProcessAllocbindResponse: SKE data is not ready, delay session connected.");
          BOOL v14 = 0;
          if (!_IDSShouldLog()) {
            goto LABEL_4;
          }
          _IDSLogV(0, @"IDSFoundation", @"GL", @"_postProcessAllocbindResponse: SKE data is not ready, delay session connected.");
        }
      }
    }
    goto LABEL_3;
  }
  v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "_postProcessAllocbindResponse: send SKE data", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport(@"GL", @"IDS", @"_postProcessAllocbindResponse: send SKE data");
      if (_IDSShouldLog()) {
        _IDSLogV(0, @"IDSFoundation", @"GL", @"_postProcessAllocbindResponse: send SKE data");
      }
    }
  }
  objc_msgSend__sendSKEDataWithSelectedCandidatePair(self, v18, v19, v20);
  BOOL v14 = 1;
LABEL_4:

  return v14;
}

- (void)setHasPendingAllocation:(BOOL)a3
{
  self->super._hasPendingAllocation = a3;
}

- (void)sendSKEData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->super._enableSKE)
  {
    p_skeData = &self->super._skeData;
    if (self->super._skeData)
    {
      double v7 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = *p_skeData;
        *(_DWORD *)buf = 134217984;
        uint64_t v19 = (__CFString *)v8;
        _os_log_impl(&dword_19D9BE000, v7, OS_LOG_TYPE_DEFAULT, "already has pending SKE data %p, ignore.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"already has pending SKE data %p, ignore.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"already has pending SKE data %p, ignore.");
          }
        }
      }
    }
    else
    {
      objc_storeStrong((id *)&self->super._skeData, a3);
      uint64_t v11 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *p_skeData;
        *(_DWORD *)buf = 134217984;
        uint64_t v19 = (__CFString *)v12;
        _os_log_impl(&dword_19D9BE000, v11, OS_LOG_TYPE_DEFAULT, "add SKE data %p.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          v17 = *p_skeData;
          _IDSLogTransport(@"GL", @"IDS", @"add SKE data %p.");
          if (_IDSShouldLog())
          {
            v17 = *p_skeData;
            _IDSLogV(0, @"IDSFoundation", @"GL", @"add SKE data %p.");
          }
        }
      }
      self->super._skeToRemoteComplete = 0;
      if (self->super._delaySessionConnected)
      {
        double v13 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19D9BE000, v13, OS_LOG_TYPE_DEFAULT, "session connected is delayed, send SKE data immediately.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport(@"GL", @"IDS", @"session connected is delayed, send SKE data immediately.");
            if (_IDSShouldLog()) {
              _IDSLogV(0, @"IDSFoundation", @"GL", @"session connected is delayed, send SKE data immediately.");
            }
          }
        }
        objc_msgSend__sendSKEDataToSucceededCandidatePairs(self, v14, v15, v16, v17);
      }
    }
  }
  else
  {
    id v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._enableSKE) {
        double v10 = @"YES";
      }
      else {
        double v10 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v10;
      _os_log_impl(&dword_19D9BE000, v9, OS_LOG_TYPE_DEFAULT, "send SKE data failed (EnableSKE:%@).", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"send SKE data failed (EnableSKE:%@).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"send SKE data failed (EnableSKE:%@).");
        }
      }
    }
  }
}

- (void)setDefaultUnderlyingLink:(char)a3
{
  uint64_t v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->super._isInitiator)
  {
    if (!self->super._linkIDToCandidatePairs) {
      goto LABEL_8;
    }
    double v7 = objc_msgSend_numberWithChar_(NSNumber, a2, a3, v3);
    if (!v7) {
      goto LABEL_8;
    }
    linkIDToCandidatePairs = self->super._linkIDToCandidatePairs;
    double v10 = objc_msgSend_numberWithChar_(NSNumber, v6, v4, v8);
    id v20 = (id)CFDictionaryGetValue((CFDictionaryRef)linkIDToCandidatePairs, v10);

    if (v20)
    {
      BOOL v14 = objc_msgSend_candidatePairToken(v20, v11, v12, v13);
      objc_msgSend__nominateCandidatePair_(self, v15, (uint64_t)v14, v16);
    }
    else
    {
LABEL_8:
      v17 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = v4;
        _os_log_impl(&dword_19D9BE000, v17, OS_LOG_TYPE_DEFAULT, "failed to find candidate pair for linkID:%d.", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport(@"GL", @"IDS", @"failed to find candidate pair for linkID:%d.");
          if (_IDSShouldLog()) {
            _IDSLogV(0, @"IDSFoundation", @"GL", @"failed to find candidate pair for linkID:%d.");
          }
        }
      }
    }
  }
  else
  {
    v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (self->super._isInitiator) {
        uint64_t v19 = @"YES";
      }
      else {
        uint64_t v19 = @"NO";
      }
      *(_DWORD *)buf = 67109378;
      int v22 = v4;
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_19D9BE000, v18, OS_LOG_TYPE_DEFAULT, "set default underlying link (linkID:%d) failed (isInitiator:%@).", buf, 0x12u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(@"GL", @"IDS", @"set default underlying link (linkID:%d) failed (isInitiator:%@).");
        if (_IDSShouldLog()) {
          _IDSLogV(0, @"IDSFoundation", @"GL", @"set default underlying link (linkID:%d) failed (isInitiator:%@).");
        }
      }
    }
  }
}

- (BOOL)_setupNewQRLinkIfNecessary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    if (self->super._allowOnlyOneQR || !self->super._isInitiator)
    {
      double v10 = objc_msgSend_FTGL(IDSFoundationLog, v4, v5, v7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL isInitiator = self->super._isInitiator;
        if (self->super._allowOnlyOneQR) {
          uint64_t v12 = @"YES";
        }
        else {
          uint64_t v12 = @"NO";
        }
        *(_DWORD *)buf = 138412802;
        if (isInitiator) {
          double v13 = @"YES";
        }
        else {
          double v13 = @"NO";
        }
        uint64_t v19 = 0;
        __int16 v20 = 2112;
        v21 = v12;
        __int16 v22 = 2112;
        __int16 v23 = v13;
        _os_log_impl(&dword_19D9BE000, v10, OS_LOG_TYPE_DEFAULT, "skip set up new QR link (relaySessionID:%@, FaceTime:YES, allowOnlyOneQR:%@, isInitiator:%@).", buf, 0x20u);
      }
    }
    else
    {
      if (!self->super._hasPendingAllocation) {
        goto LABEL_2;
      }
      uint64_t v15 = objc_msgSend_FTGL(IDSFoundationLog, v4, v5, v7);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = 0;
        _os_log_impl(&dword_19D9BE000, v15, OS_LOG_TYPE_DEFAULT, "skip set up new QR link, allocation is pending, relaySessionID: %@", buf, 0xCu);
      }
    }
    BOOL v9 = 0;
    goto LABEL_16;
  }
LABEL_2:
  v17.receiver = self;
  v17.super_class = (Class)IDSFTGL;
  unsigned int v8 = [(IDSGlobalLink *)&v17 _setupNewQRLinkIfNecessary:v6];
  BOOL v9 = v8;
  if (!v6 && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)IDSFTGL;
    [(IDSGlobalLink *)&v16 _requestNewTwoWayQRAllocation:0];
    BOOL v9 = 1;
  }
LABEL_16:

  return v9;
}

- (void)_resetRetryCountForCandidatePair:(id)a3
{
  id v4 = a3;
  double v7 = v4;
  if (self->super._isInitiator)
  {
    v29 = v4;
    int isRelayStunCandidatePair = objc_msgSend_isRelayStunCandidatePair(v4, (const char *)v4, v5, v6);
    double v7 = v29;
    if (isRelayStunCandidatePair)
    {
      uint64_t v9 = GLUtilLinkTypeMaskForCandidatePair(v29);
      retryCountPerLinkType = self->super._retryCountPerLinkType;
      double v13 = objc_msgSend_numberWithInt_(NSNumber, v11, v9, v12);
      objc_super v16 = objc_msgSend_objectForKey_(retryCountPerLinkType, v14, (uint64_t)v13, v15);
      int v20 = objc_msgSend_intValue(v16, v17, v18, v19);

      double v7 = v29;
      if (v20 >= 1)
      {
        __int16 v22 = self->super._retryCountPerLinkType;
        __int16 v23 = objc_msgSend_numberWithInt_(NSNumber, (const char *)v29, 0, v21);
        v26 = objc_msgSend_numberWithInt_(NSNumber, v24, v9, v25);
        objc_msgSend_setObject_forKey_(v22, v27, (uint64_t)v23, v28, v26);

        double v7 = v29;
      }
    }
  }
}

- (BOOL)_postProcessQUICAllocbindResponse:(id)a3 candidatePair:(id)a4
{
  id v5 = a4;
  uint64_t v9 = objc_msgSend_candidatePairToken(v5, v6, v7, v8);
  LOBYTE(self) = objc_msgSend__postProcessAllocbindResponse_candidatePair_candidatePairToken_(self, v10, 0, v11, v5, v9);

  return (char)self;
}

@end