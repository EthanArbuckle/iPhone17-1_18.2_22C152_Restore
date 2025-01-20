@interface IDSRegistrationHashProcessor
- (IDSDAccountController)accountController;
- (IDSIDStatusQueryController)idStatusQueryController;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSPeerIDManager)peerIDManager;
- (IDSRateLimiter)negativeRegistrationUpdateCache;
- (IDSRegistrationHashProcessor)initWithAccountController:(id)a3 peerIDManager:(id)a4 negativeRegistrationUpdateCache:(id)a5 registrationKeyManager:(id)a6;
- (IDSRegistrationHashProcessorDelegate)delegate;
- (IDSRegistrationKeyManager)registrationKeyManager;
- (id)devicesHashForURI:(id)a3 andService:(id)a4;
- (id)senderKeyDistributionManager;
- (void)handleRegistrationUpdateForHash:(id)a3 localURI:(id)a4 remoteURI:(id)a5 service:(id)a6 guid:(id)a7 forceUpdate:(BOOL)a8;
- (void)setAccountController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdStatusQueryController:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setNegativeRegistrationUpdateCache:(id)a3;
- (void)setPeerIDManager:(id)a3;
- (void)setRegistrationKeyManager:(id)a3;
@end

@implementation IDSRegistrationHashProcessor

- (IDSRegistrationHashProcessor)initWithAccountController:(id)a3 peerIDManager:(id)a4 negativeRegistrationUpdateCache:(id)a5 registrationKeyManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSRegistrationHashProcessor;
  v15 = [(IDSRegistrationHashProcessor *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountController, a3);
    objc_storeStrong((id *)&v16->_peerIDManager, a4);
    objc_storeStrong((id *)&v16->_negativeRegistrationUpdateCache, a5);
    objc_storeStrong((id *)&v16->_registrationKeyManager, a6);
  }

  return v16;
}

- (IDSKeyTransparencyVerifier)keyTransparencyVerifier
{
  return +[IDSKeyTransparencyVerifier sharedInstance];
}

- (IDSIDStatusQueryController)idStatusQueryController
{
  return +[IDSIDStatusQueryController sharedInstance];
}

- (id)senderKeyDistributionManager
{
  v2 = +[IDSDaemon sharedInstance];
  v3 = [v2 senderKeyDistributionManager];

  return v3;
}

- (id)devicesHashForURI:(id)a3 andService:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  v7 = [(IDSRegistrationHashProcessor *)self accountController];
  v36 = [v7 appleIDAccountOnService:v35];

  v8 = [v36 lastGDRDate];
  v34 = v8;
  v9 = v8;
  if (!v8) {
    goto LABEL_22;
  }
  [v8 timeIntervalSinceNow];
  double v11 = v10 >= 0.0 ? v10 : -v10;
  id v12 = +[IDSServerBag sharedInstanceForBagType:0];
  id v13 = [v12 objectForKey:@"reg-hash-time-since-gdr"];

  double v14 = 28800.0;
  if (v13)
  {
    objc_opt_class();
    v9 = v34;
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      double v14 = v15;
    }
  }
  else
  {
    v9 = v34;
  }

  if (v11 < v14)
  {
    id v16 = objc_alloc_init((Class)NSMutableSet);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v17 = [v36 registeredDevices];
    id v18 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v38;
LABEL_12:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * v20);
        v22 = [v21 URIs];
        unsigned int v23 = [v22 containsObject:v6];

        if (v23)
        {
          v24 = [v21 publicDeviceIdentity];
          BOOL v25 = v24 == 0;

          if (v25)
          {
            v31 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v21;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Registered device missing public key! -- aborting hash {device: %@}", buf, 0xCu);
            }

            if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
              goto LABEL_33;
            }
LABEL_32:
            _IDSLogV();
LABEL_33:
            id v30 = 0;
            goto LABEL_34;
          }
          v26 = [v21 publicDeviceIdentity];
          [v16 addObject:v26];
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v17 countByEnumeratingWithState:&v37 objects:v43 count:16];
          if (v18) {
            goto LABEL_12;
          }
          break;
        }
      }
    }

    v27 = [(IDSRegistrationHashProcessor *)self registrationKeyManager];
    v17 = [v27 publicMessageProtectionData];

    if (!v17)
    {
      v32 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Local device missing public key! -- aborting hash", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    [v16 addObject:v17];
    v28 = sub_100404060(v16);
    v29 = [v28 SHA256Data];
    id v30 = [objc_alloc((Class)NSMutableData) initWithBytes:&unk_100794AD8 length:1];
    [v30 appendData:v29];

LABEL_34:
    v9 = v34;
  }
  else
  {
LABEL_22:
    id v30 = 0;
  }

  return v30;
}

- (void)handleRegistrationUpdateForHash:(id)a3 localURI:(id)a4 remoteURI:(id)a5 service:(id)a6 guid:(id)a7 forceUpdate:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v94 = a4;
  id v15 = a5;
  id v16 = a6;
  id v92 = a7;
  v93 = v14;
  if (v14 && !v8)
  {
    id v17 = [v14 length];
    if (!v16 || !v15 || !v94 || (unint64_t)v17 < 0x21) {
      goto LABEL_65;
    }
    unsigned __int8 v103 = 0;
    [v14 getBytes:&v103 length:1];
    if (v103 != 1)
    {
      long long v38 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = v103;
        long long v40 = [v93 debugDescription];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v105 = v39;
        *(_WORD *)&v105[4] = 2112;
        *(void *)&v105[6] = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Received unsupported query update hash {version: %d, hash: %@}", buf, 0x12u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v83 = [v93 debugDescription];
        _IDSLogV();
      }
      goto LABEL_65;
    }
    v90 = objc_msgSend(v14, "subdataWithRange:", 1, 32);
    id v18 = [(IDSRegistrationHashProcessor *)self peerIDManager];
    id v110 = v15;
    uint64_t v19 = +[NSArray arrayWithObjects:&v110 count:1];
    uint64_t v20 = [v16 identifier];
    v21 = [v18 endpointsForURIs:v19 service:v20 fromURI:v94];
    v22 = [v21 objectForKey:v15];

    id v23 = objc_alloc_init((Class)NSMutableSet);
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v24 = v22;
    id v25 = [v24 countByEnumeratingWithState:&v99 objects:v109 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v100;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v100 != v26) {
            objc_enumerationMutation(v24);
          }
          v28 = [*(id *)(*((void *)&v99 + 1) + 8 * i) serializedPublicLegacyIdentity];
          if (v28) {
            [v23 addObject:v28];
          }
        }
        id v25 = [v24 countByEnumeratingWithState:&v99 objects:v109 count:16];
      }
      while (v25);
    }

    v87 = sub_100404060(v23);
    v88 = [v87 SHA256Data];
    unsigned __int8 v29 = [v88 isEqualToData:v90];
    if (v29)
    {
      id v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = v103;
        id v32 = [v90 debugDescription];
        uint64_t v33 = [v88 debugDescription];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v105 = v31;
        *(_WORD *)&v105[4] = 2112;
        *(void *)&v105[6] = v32;
        *(_WORD *)&v105[14] = 2112;
        v34 = (void *)v33;
        *(void *)&v105[16] = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Query update hashes match -- doing nothing {version: %d, remoteHash: %@, localHash: %@}", buf, 0x1Cu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        unint64_t v35 = v103;
        v36 = [v90 debugDescription];
        long long v37 = [v88 debugDescription];
        v82 = v36;
        v85 = v37;
        v80 = (void *)v35;
        _IDSLogV();
LABEL_33:
      }
    }
    else
    {
      v41 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = [v90 debugDescription];
        v43 = [v88 debugDescription];
        *(_DWORD *)buf = 138412546;
        *(void *)v105 = v42;
        *(_WORD *)&v105[8] = 2112;
        *(void *)&v105[10] = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Query update hash does not match, we should clear {remoteHash: %@, localHash: %@}", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v36 = [v90 debugDescription];
        long long v37 = [v88 debugDescription];
        v80 = v36;
        v82 = v37;
        _IDSLogV();
        goto LABEL_33;
      }
    }

    if (v29) {
      goto LABEL_65;
    }
  }
  v44 = [(IDSRegistrationHashProcessor *)self negativeRegistrationUpdateCache];
  v45 = [v15 prefixedURI];
  unsigned int v46 = [v44 underLimitForItem:v45];

  if (v46 | v8)
  {
    v47 = [(IDSRegistrationHashProcessor *)self negativeRegistrationUpdateCache];
    v48 = [v15 prefixedURI];
    [v47 noteItem:v48];

    v49 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v105 = v15;
      *(_WORD *)&v105[8] = 2112;
      *(void *)&v105[10] = v94;
      *(_WORD *)&v105[18] = 2112;
      *(void *)&v105[20] = v16;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, " => Purging Peer ID Cache for: %@   caller URI: %@   service: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v84 = v94;
      id v86 = v16;
      id v81 = v15;
      _IDSLogV();
    }
    v50 = +[IDSDServiceController sharedInstance];
    v51 = [v16 identifier];
    v89 = [v50 adHocServicesForIdentifier:v51];

    uint64_t v52 = objc_msgSend(v89, "__imArrayByApplyingBlock:", &stru_10098CB70);
    v53 = (void *)v52;
    v54 = &__NSArray0__struct;
    if (v52) {
      v54 = (void *)v52;
    }
    id v91 = v54;

    v55 = +[IDSServerBag sharedInstanceForBagType:0];
    v56 = [v55 objectForKey:@"should-clear-id-status-on-130"];

    if (v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned int v57 = [v56 BOOLValue];

      if (!v57)
      {
LABEL_62:
        id v69 = objc_alloc((Class)NSMutableArray);
        v70 = [v16 identifier];
        id v71 = objc_msgSend(v69, "initWithObjects:", v70, 0);

        [v71 addObjectsFromArray:v91];
        v72 = [(IDSRegistrationHashProcessor *)self peerIDManager];
        [v72 forgetPeerTokensForURI:v15 fromURI:v94 services:v71];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v74 = [v16 identifier];
        v75 = [v15 prefixedURI];
        v76 = [v94 prefixedURI];
        [WeakRetained registrationHashProcessor:self didFlushCacheForService:v74 remoteURI:v75 localURI:v76 guid:v92];

        v77 = [v16 identifier];
        unsigned int v78 = [v77 isEqualToString:IDSServiceNameiMessage];

        if (v78)
        {
          v79 = [(IDSRegistrationHashProcessor *)self senderKeyDistributionManager];
          [v79 handleRemoteDeviceUpdateWithRemoteURI:v15 localURI:v94];
        }
        goto LABEL_65;
      }
    }
    else
    {
    }
    v59 = [v16 identifier];
    unsigned int v60 = [v59 isEqualToString:@"com.apple.madrid"];

    if (v60)
    {
      v61 = [(IDSRegistrationHashProcessor *)self idStatusQueryController];
      v62 = [v16 identifier];
      [v61 removeCachedIDStatusForURI:v15 service:v62];

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v63 = v91;
      id v64 = [v63 countByEnumeratingWithState:&v95 objects:v108 count:16];
      if (v64)
      {
        uint64_t v65 = *(void *)v96;
        do
        {
          for (j = 0; j != v64; j = (char *)j + 1)
          {
            if (*(void *)v96 != v65) {
              objc_enumerationMutation(v63);
            }
            uint64_t v67 = *(void *)(*((void *)&v95 + 1) + 8 * (void)j);
            v68 = [(IDSRegistrationHashProcessor *)self idStatusQueryController];
            [v68 removeCachedIDStatusForURI:v15 service:v67];
          }
          id v64 = [v63 countByEnumeratingWithState:&v95 objects:v108 count:16];
        }
        while (v64);
      }
    }
    goto LABEL_62;
  }
  v58 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)v105 = v15;
    *(_WORD *)&v105[8] = 2112;
    *(void *)&v105[10] = v16;
    *(_WORD *)&v105[18] = 2112;
    *(void *)&v105[20] = v94;
    __int16 v106 = 2112;
    id v107 = v92;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Received too many registration updates, ignoring {remoteURI: %@, service: %@, localURI: %@, guid: %@}", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_65:
}

- (IDSRateLimiter)negativeRegistrationUpdateCache
{
  return self->_negativeRegistrationUpdateCache;
}

- (void)setNegativeRegistrationUpdateCache:(id)a3
{
}

- (IDSRegistrationHashProcessorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSRegistrationHashProcessorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSPeerIDManager)peerIDManager
{
  return self->_peerIDManager;
}

- (void)setPeerIDManager:(id)a3
{
}

- (IDSRegistrationKeyManager)registrationKeyManager
{
  return self->_registrationKeyManager;
}

- (void)setRegistrationKeyManager:(id)a3
{
}

- (void)setKeyTransparencyVerifier:(id)a3
{
}

- (void)setIdStatusQueryController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idStatusQueryController, 0);
  objc_storeStrong((id *)&self->_keyTransparencyVerifier, 0);
  objc_storeStrong((id *)&self->_registrationKeyManager, 0);
  objc_storeStrong((id *)&self->_peerIDManager, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_negativeRegistrationUpdateCache, 0);
}

@end