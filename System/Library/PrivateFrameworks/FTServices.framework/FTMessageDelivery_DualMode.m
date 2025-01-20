@interface FTMessageDelivery_DualMode
- (BOOL)_isInBackoffMode;
- (BOOL)_shouldUseDualDeliveryForMessage:(id)a3;
- (FTMessageDelivery_DualMode)initWithPreferedType:(int64_t)a3;
- (NSArray)queuedMessages;
- (int64_t)_randomPercentageChanceForDualDelivery;
- (void)_enterBackOffMode;
- (void)addRequestObserver:(id)a3;
- (void)cancelMessage:(id)a3;
- (void)dequeueMessageIfNeeded;
- (void)handleTranslationAndDeliveryOnAPS:(id)a3;
- (void)invalidate;
- (void)queue:(id)a3 hitTimeoutForMessage:(id)a4;
- (void)sendMessage:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)signDataWithPushIdentity:(id)a3 serverTimestamp:(id)a4 withCompletion:(id)a5;
@end

@implementation FTMessageDelivery_DualMode

- (int64_t)_randomPercentageChanceForDualDelivery
{
  return arc4random() % 0x65;
}

- (BOOL)_shouldUseDualDeliveryForMessage:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    v8 = objc_msgSend_topic(v4, v5, v6);
    v11 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v9, v10);
    v13 = objc_msgSend_objectForKey_(v11, v12, @"apns-webtunnel-blacklisted-topics");

    if (objc_msgSend_containsObject_(v13, v14, (uint64_t)v8))
    {
      v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v60 = (uint64_t)v8;
        __int16 v61 = 2112;
        v62 = v13;
        _os_log_impl(&dword_1A7BC0000, v17, OS_LOG_TYPE_DEFAULT, "Message topic (%@) is in the list of blocklisted topics (%@)", buf, 0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
    v18 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v15, v16);
    v20 = objc_msgSend_objectForKey_(v18, v19, @"apns-ids-query-min-version");

    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v21 = v20;
      uint64_t v24 = objc_msgSend_intValue(v21, v22, v23);
      v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v60) = v24;
        _os_log_impl(&dword_1A7BC0000, v25, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d Web Tunnel Version", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v58 = v24;
        _IDSLogV();
      }

      uint64_t v24 = (int)v24;
    }
    else
    {
      v26 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v60 = 0x4000000000000000;
        _os_log_impl(&dword_1A7BC0000, v26, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for Min Version, using the default: %f", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v58 = 0x4000000000000000;
        _IDSLogV();
      }
      uint64_t v24 = 2;
    }

    v27 = _IDSWebTunnelServiceVersionNumber();
    uint64_t v30 = objc_msgSend_integerValue(v27, v28, v29);

    if (v30 < v24)
    {
      v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v33, OS_LOG_TYPE_DEFAULT, "We do not meet the version requirements for web tunnel ID queries", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
    if (objc_msgSend_importanceLevel(v4, v31, v32) == 2)
    {
      if (objc_msgSend__isInBackoffMode(self, v34, v35))
      {
        v38 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v38, OS_LOG_TYPE_DEFAULT, "We are in backoff mode ", buf, 2u);
        }

        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
          goto LABEL_78;
        }
        goto LABEL_77;
      }
      v40 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v36, v37);
      v42 = objc_msgSend_objectForKey_(v40, v41, @"apns-ids-query-percentage-2");

      if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v43 = v42;
        uint64_t v46 = objc_msgSend_intValue(v43, v44, v45);
        v47 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v60) = v46;
          _os_log_impl(&dword_1A7BC0000, v47, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %d Web Tunnel Percentage", buf, 8u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v58 = v46;
          _IDSLogV();
        }

        if (!v46)
        {
          v56 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7BC0000, v56, OS_LOG_TYPE_DEFAULT, "Server gave us 0 quota to use this feature", buf, 2u);
          }

          if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
            goto LABEL_78;
          }
          goto LABEL_77;
        }
        uint64_t v50 = (int)v46;
      }
      else
      {
        v51 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v60 = 0x4059000000000000;
          _os_log_impl(&dword_1A7BC0000, v51, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for percentage, using the default: %f percentage", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v58 = 0x4059000000000000;
          _IDSLogV();
        }

        uint64_t v50 = 100;
      }
      uint64_t v52 = objc_msgSend__randomPercentageChanceForDualDelivery(self, v48, v49, v58);
      v53 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v60 = v52;
        _os_log_impl(&dword_1A7BC0000, v53, OS_LOG_TYPE_DEFAULT, "Diceroll Was %ld", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      if (v52 <= v50)
      {
        v55 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7BC0000, v55, OS_LOG_TYPE_DEFAULT, "Diceroll Sucesss, dual query will be performed", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        BOOL v7 = 1;
        goto LABEL_79;
      }
      v54 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v54, OS_LOG_TYPE_DEFAULT, "Diceroll failed", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
      {
LABEL_78:
        BOOL v7 = 0;
LABEL_79:

        goto LABEL_80;
      }
    }
    else
    {
      v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7BC0000, v39, OS_LOG_TYPE_DEFAULT, "This query is not important enough to perform a web tunnel ID query", buf, 2u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
        goto LABEL_78;
      }
    }
LABEL_77:
    _IDSLogV();
    goto LABEL_78;
  }
  BOOL v7 = 1;
LABEL_80:

  return v7;
}

- (BOOL)_isInBackoffMode
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IMGetAppIntForKey();
  if (v2 < 1) {
    return 0;
  }
  uint64_t v3 = v2;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v4, OS_LOG_TYPE_DEFAULT, "We have a cached vale for server backoff mode", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  BOOL v7 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6);
  uint64_t v10 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v8, v9, (double)v3);
  v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, "Back off End Date is %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v24 = v10;
    _IDSLogV();
  }
  v14 = objc_msgSend_dateByAddingTimeInterval_(v7, v12, v13, 3600.0, v24);
  uint64_t v16 = objc_msgSend_earlierDate_(v10, v15, (uint64_t)v14);

  objc_msgSend_timeIntervalSinceNow(v16, v17, v18);
  BOOL v20 = v19 >= 0.0;
  if (v19 < 0.0)
  {
    v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v22, OS_LOG_TYPE_DEFAULT, "Back off Interval is in the past, we are good to go", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    IMRemoveAppValueForKey();
  }
  else
  {
    id v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7BC0000, v21, OS_LOG_TYPE_DEFAULT, "Back off Interval is in the future, we are in backoff", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }

  return v20;
}

- (void)_enterBackOffMode
{
  objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_dateByAddingTimeInterval_(v12, v3, v4, 3600.0);
  uint64_t v6 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(v5, v7, v8);
  v11 = objc_msgSend_numberWithDouble_(v6, v9, v10);
  IMSetAppValueForKey();
}

- (FTMessageDelivery_DualMode)initWithPreferedType:(int64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)FTMessageDelivery_DualMode;
  v5 = [(FTMessageDelivery_DualMode *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (FTMessageDelivery *)objc_alloc_init((Class)objc_msgSend_APNSMessageDeliveryClass(FTMessageDelivery, v3, v4));
    apsDelivery = v5->_apsDelivery;
    v5->_apsDelivery = v6;

    id v10 = objc_alloc((Class)objc_msgSend_HTTPMessageDeliveryClass(FTMessageDelivery, v8, v9));
    uint64_t v13 = objc_msgSend_connection(v5->_apsDelivery, v11, v12);
    uint64_t v15 = objc_msgSend_initWithAPSConnection_(v10, v14, (uint64_t)v13);
    httpDelivery = v5->_httpDelivery;
    v5->_httpDelivery = (FTMessageDelivery *)v15;

    objc_msgSend_setMaxConcurrentMessages_(v5->_apsDelivery, v17, 8);
    uint64_t v18 = objc_alloc_init(FTMessageQueue);
    dualModeQueue = v5->_dualModeQueue;
    v5->_dualModeQueue = v18;

    objc_msgSend_setDelegate_(v5->_dualModeQueue, v20, (uint64_t)v5);
    objc_msgSend_setUserAgent_(v5, v21, @"com.apple.identityservicesd");
  }
  return v5;
}

- (void)setUserAgent:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentString, a3);
  id v7 = a3;
  objc_msgSend_setUserAgent_(self->_httpDelivery, v5, (uint64_t)v7);
  objc_msgSend_setUserAgent_(self->_apsDelivery, v6, (uint64_t)v7);
}

- (void)addRequestObserver:(id)a3
{
  httpDelivery = self->_httpDelivery;
  id v7 = a3;
  objc_msgSend_addRequestObserver_(httpDelivery, v5, (uint64_t)v7);
  objc_msgSend_addRequestObserver_(self->_apsDelivery, v6, (uint64_t)v7);
}

- (void)sendMessage:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1A7BC0000, v5, OS_LOG_TYPE_DEFAULT, "Incoming request to send a dualMode message %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v9 = v4;
    _IDSLogV();
  }
  objc_msgSend_addMessage_(self->_dualModeQueue, v6, (uint64_t)v4, v9);
  objc_msgSend_dequeueMessageIfNeeded(self, v7, v8);
}

- (void)cancelMessage:(id)a3
{
  apsDelivery = self->_apsDelivery;
  id v7 = a3;
  objc_msgSend_cancelMessage_(apsDelivery, v5, (uint64_t)v7);
  objc_msgSend_cancelMessage_(self->_httpDelivery, v6, (uint64_t)v7);
}

- (void)dequeueMessageIfNeeded
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7BC0000, v3, OS_LOG_TYPE_DEFAULT, "Dequeing message if needed", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (objc_msgSend_count(self->_dualModeQueue, v4, v5) >= 1)
  {
    uint64_t v8 = objc_msgSend_dequeueTopMessage(self->_dualModeQueue, v6, v7);
    if (objc_msgSend_allowDualDelivery(v8, v9, v10))
    {
      id v11 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1A7BC0000, v11, OS_LOG_TYPE_DEFAULT, "Message Allow Dual Delivery", v22, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      if (objc_msgSend__shouldUseDualDeliveryForMessage_(self, v12, (uint64_t)v8))
      {
        uint64_t v13 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v21 = 0;
          _os_log_impl(&dword_1A7BC0000, v13, OS_LOG_TYPE_DEFAULT, "Server says yes for APS delivery, lets go ahead and use that", v21, 2u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
        objc_msgSend_setHasAttemptedAPSDelivery_(v8, v14, 1);
        objc_msgSend_handleTranslationAndDeliveryOnAPS_(self, v15, (uint64_t)v8);
LABEL_29:

        return;
      }
      uint64_t v16 = OSLogHandleForIDSCategory();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        objc_msgSend_sendMessage_(self->_httpDelivery, v18, (uint64_t)v8, v19);
        goto LABEL_29;
      }
      *(_WORD *)BOOL v20 = 0;
      v17 = v20;
    }
    else
    {
      uint64_t v16 = OSLogHandleForIDSCategory();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      LOWORD(v19) = 0;
      v17 = (uint8_t *)&v19;
    }
    _os_log_impl(&dword_1A7BC0000, v16, OS_LOG_TYPE_DEFAULT, "Not allowed to use APS delivery, using HTTP", v17, 2u);
    goto LABEL_25;
  }
}

- (void)handleTranslationAndDeliveryOnAPS:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [IDSWebTunnelRequestMessage alloc];
  uint64_t v7 = objc_msgSend_initWithMessage_(v5, v6, (uint64_t)v4);
  uint64_t v10 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v8, v9);
  uint64_t v12 = objc_msgSend_objectForKey_(v10, v11, @"apns-ids-query-wait-time");

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = v12;
    objc_msgSend_doubleValue(v13, v14, v15);
    double v17 = v16;
    uint64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v102 = *(void *)&v17;
      _os_log_impl(&dword_1A7BC0000, v18, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with a wait time interval of %f ", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v93 = *(void *)&v17;
      _IDSLogV();
    }
  }
  else
  {
    uint64_t v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v102 = 0x4024000000000000;
      _os_log_impl(&dword_1A7BC0000, v19, OS_LOG_TYPE_DEFAULT, "Server Bag has no value for wait time interval , using the default: %f interval", buf, 0xCu);
    }

    double v17 = 10.0;
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v93 = 0x4024000000000000;
      _IDSLogV();
    }
  }

  objc_msgSend_setTimeout_(v7, v20, v21, v17);
  int v24 = objc_msgSend_wantsIDSServer(v4, v22, v23);
  objc_msgSend_setDisableIDSTranslation_(v7, v25, v24 ^ 1u);
  v28 = objc_msgSend_messageBodyDataOverride(v4, v26, v27);

  if (v28)
  {
    v31 = objc_msgSend_messageBodyDataOverride(v4, v29, v30);
    objc_msgSend_setMessageRequestBodyData_(v7, v32, (uint64_t)v31);
    v33 = 0;
  }
  else
  {
    v31 = objc_msgSend_messageBodyUsingCache(v4, v29, v30);
    id v100 = 0;
    uint64_t v35 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v34, (uint64_t)v31, 100, 0, &v100);
    id v36 = v100;
    v33 = objc_msgSend__FTCopyGzippedData(v35, v37, v38);
    objc_msgSend_setMessageRequestBodyData_(v7, v39, (uint64_t)v33);
  }
  v42 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6B598], v40, v41);
  uint64_t v45 = objc_msgSend_bagKey(v4, v43, v44);
  v47 = objc_msgSend_urlWithKey_(v42, v46, (uint64_t)v45);

  uint64_t v50 = objc_msgSend_URLOverride(v4, v48, v49);

  if (v50)
  {
    uint64_t v53 = objc_msgSend_URLOverride(v4, v51, v52);

    v47 = (void *)v53;
  }
  id v54 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v57 = objc_msgSend_additionalQueryStringParameters(v4, v55, v56);
  BOOL v60 = objc_msgSend_count(v57, v58, v59) == 0;

  if (!v60)
  {
    uint64_t v63 = objc_msgSend_additionalQueryStringParameters(v4, v61, v62);
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = sub_1A7BCBBD4;
    v98[3] = &unk_1E5D1AD50;
    id v64 = v54;
    id v99 = v64;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v63, v65, (uint64_t)v98);

    if (objc_msgSend_length(v64, v66, v67))
    {
      v70 = objc_msgSend_absoluteString(v47, v68, v69);
      v72 = objc_msgSend_stringByAppendingFormat_(v70, v71, @"?%@", v64);

      uint64_t v74 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v73, (uint64_t)v72);

      v47 = (void *)v74;
    }
  }
  v75 = objc_msgSend_absoluteString(v47, v61, v62, v93);
  objc_msgSend_setMessageURL_(v7, v76, (uint64_t)v75);

  v79 = objc_msgSend_underlyingService(v4, v77, v78);
  objc_msgSend_setTopic_(v7, v80, (uint64_t)v79);

  if (objc_msgSend_length(self->_userAgentString, v81, v82)) {
    objc_msgSend_setUserAgentOverride_(v7, v83, (uint64_t)self->_userAgentString);
  }
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = sub_1A7BCBC84;
  v94[3] = &unk_1E5D1ADC8;
  id v84 = v4;
  id v95 = v84;
  id v85 = v7;
  id v96 = v85;
  v97 = self;
  v86 = (void (**)(void, void))MEMORY[0x1AD0D56D0](v94);
  if (objc_msgSend_wantsIDSSignatures(v84, v87, v88))
  {
    apsDelivery = self->_apsDelivery;
    if (objc_msgSend_wantsBodySignature(v84, v89, v90)) {
      objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(apsDelivery, v92, (uint64_t)v84, 0, v33, v54, v86);
    }
    else {
      objc_msgSend__signMessage_useDataSignatures_body_queryString_completion_(apsDelivery, v92, (uint64_t)v84, 0, 0, v54, v86);
    }
  }
  else
  {
    v86[2](v86, 0);
  }
}

- (void)signDataWithPushIdentity:(id)a3 serverTimestamp:(id)a4 withCompletion:(id)a5
{
}

- (void)queue:(id)a3 hitTimeoutForMessage:(id)a4
{
  id v8 = a4;
  if (objc_msgSend_hasAttemptedAPSDelivery(v8, v5, v6)) {
    objc_msgSend_sendMessage_(self->_httpDelivery, v7, (uint64_t)v8);
  }
}

- (NSArray)queuedMessages
{
  return (NSArray *)objc_msgSend_messages(self->_dualModeQueue, a2, v2);
}

- (void)invalidate
{
  objc_msgSend_invalidate(self->_httpDelivery, a2, v2);
  apsDelivery = self->_apsDelivery;

  objc_msgSend_invalidate(apsDelivery, v4, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_dualModeQueue, 0);
  objc_storeStrong((id *)&self->_apsDelivery, 0);

  objc_storeStrong((id *)&self->_httpDelivery, 0);
}

@end