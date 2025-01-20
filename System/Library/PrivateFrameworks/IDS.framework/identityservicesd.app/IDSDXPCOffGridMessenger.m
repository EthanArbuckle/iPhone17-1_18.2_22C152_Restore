@interface IDSDXPCOffGridMessenger
- (BOOL)_isDeviceOnline;
- (BOOL)isCTClientActive;
- (IDSDXPCOffGridMessenger)initWithQueue:(id)a3;
- (IDSStewieCTMessagingClient)ctClient;
- (IMNetworkConnectionMonitor)connectionMonitor;
- (NSMutableDictionary)clientRemoteObjectsByService;
- (OS_dispatch_queue)queue;
- (id)identifierFromMessage:(id)a3 senderURI:(id)a4 receiverURI:(id)a5 senderKey:(id)a6 ratchetCounter:(unsigned int)a7 authTag:(id)a8;
- (id)peerIDManager;
- (void)decryptOffGridMessage:(id)a3 completion:(id)a4;
- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6;
- (void)encryptOffGridMessage:(id)a3 completion:(id)a4;
- (void)incomingOffGridMessage:(id)a3 completion:(id)a4;
- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4;
- (void)monitorConnection:(id)a3;
- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 service:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sendFetchRequestForHandles:(id)a3 fromHandle:(id)a4 completion:(id)a5;
- (void)setClientRemoteObjectsByService:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)setupOffGridMessengerClient:(id)a3 withUUID:(id)a4 forService:(id)a5;
@end

@implementation IDSDXPCOffGridMessenger

- (IDSDXPCOffGridMessenger)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSDXPCOffGridMessenger;
  v6 = [(IDSDXPCOffGridMessenger *)&v13 init];
  if (v6)
  {
    v7 = +[IDSFoundationLog IDSOffGridMessenger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Created IDSDXPCOffGridMessenger {self: %p}", buf, 0xCu);
    }

    uint64_t v8 = +[IDSStewieCTMessagingClient sharedInstance];
    ctClient = v6->_ctClient;
    v6->_ctClient = (IDSStewieCTMessagingClient *)v8;

    [(IDSStewieCTMessagingClient *)v6->_ctClient setMessagingDelegate:v6];
    objc_storeStrong((id *)&v6->_queue, a3);
    v10 = (IMNetworkConnectionMonitor *)[objc_alloc((Class)IMNetworkConnectionMonitor) initWithRemoteHost:0 delegate:0];
    connectionMonitor = v6->_connectionMonitor;
    v6->_connectionMonitor = v10;
  }
  return v6;
}

- (void)monitorConnection:(id)a3
{
  id v4 = a3;
  id v5 = +[IDSFoundationLog IDSOffGridMessenger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDSDXPCOffGridMessenger monitoring new connection {self: %p, connection: %@}", (uint8_t *)&v6, 0x16u);
  }
}

- (id)peerIDManager
{
  return +[IDSPeerIDManager sharedInstance];
}

- (BOOL)isCTClientActive
{
  BOOL v2 = [(IDSStewieCTMessagingClient *)self->_ctClient isActiveForIML];
  v3 = +[IDSFoundationLog IDSOffGridMessenger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CT Data client is active? %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (void)setupOffGridMessengerClient:(id)a3 withUUID:(id)a4 forService:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3)
  {
    v10 = [a3 remoteObjectProxy];
    v11 = +[IDSFoundationLog IDSOffGridMessenger];
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 134218498;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = v8;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Adding OffGrid messenger client {self: %p, uuid: %@, service: %@}", (uint8_t *)&v29, 0x20u);
      }

      objc_super v13 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];

      if (!v13)
      {
        id v14 = objc_alloc_init((Class)NSMutableDictionary);
        [(IDSDXPCOffGridMessenger *)self setClientRemoteObjectsByService:v14];
      }
      v15 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
      v16 = [v15 objectForKeyedSubscript:v9];

      if (!v16)
      {
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
        v18 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
        [v18 setObject:v17 forKeyedSubscript:v9];
      }
      v12 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
      v19 = [v12 objectForKeyedSubscript:v9];
      [v19 setObject:v10 forKeyedSubscript:v8];
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v29 = 134218498;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error creating proxy for OffGrid messenger client {self: %p, uuid: %@, service: %@}", (uint8_t *)&v29, 0x20u);
    }
  }
  else
  {
    v20 = +[IDSFoundationLog IDSOffGridMessenger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 134218498;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Removing OffGrid messenger client {self: %p, uuid: %@, service: %@}", (uint8_t *)&v29, 0x20u);
    }

    v21 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
    v22 = [v21 objectForKeyedSubscript:v9];
    [v22 setObject:0 forKeyedSubscript:v8];

    v23 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
    v24 = [v23 objectForKeyedSubscript:v9];
    id v25 = [v24 count];

    if (!v25)
    {
      v26 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
      [v26 setObject:0 forKeyedSubscript:v9];
    }
    v27 = [(IDSDXPCOffGridMessenger *)self clientRemoteObjectsByService];
    id v28 = [v27 count];

    if (!v28) {
      [(IDSDXPCOffGridMessenger *)self setClientRemoteObjectsByService:0];
    }
  }
}

- (void)donateHandlesForMessagingKeys:(id)a3 fromURI:(id)a4 options:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  objc_super v13 = +[IDSFoundationLog IDSOffGridMessenger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v9;
    __int16 v35 = 2112;
    id v36 = v10;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client request to donate handles for messaging keys { destinationURIs: %@ fromURI: %@ options: %@ }", buf, 0x20u);
  }

  if (!v9 || ![v9 count])
  {
    uint64_t v20 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"DestinationURIs cannot be nil or empty";
    v21 = &v32;
    v22 = &v31;
LABEL_10:
    v23 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v22 count:1];
    id v17 = +[NSError errorWithDomain:v20 code:1 userInfo:v23];

    v12[2](v12, 0, v17);
    goto LABEL_11;
  }
  if (!v10
    || ([v10 prefixedURI],
        id v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = [v14 length],
        v14,
        !v15))
  {
    uint64_t v20 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    CFStringRef v30 = @"FromURI cannot be nil or empty";
    v21 = &v30;
    v22 = &v29;
    goto LABEL_10;
  }
  v16 = +[IDSDaemon sharedInstance];
  id v17 = [v16 senderKeyDistributionManager];

  id v18 = [v11 priority];
  id v19 = [v11 isInitialDonation];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002D07D0;
  v24[3] = &unk_1009815C0;
  id v25 = v9;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  [v17 processDonatedHandlesForMessagingKeysWithUris:v25 fromURI:v26 priority:v18 isInitialDonation:v19 completion:v24];

LABEL_11:
}

- (void)resultsForDestinationURIs:(id)a3 senderURI:(id)a4 service:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v18 = [v12 allObjects];
  v71 = +[NSMutableArray arrayWithArray:v18];

  unsigned __int8 v19 = [v15 cached];
  if ([(IDSDXPCOffGridMessenger *)self _isDeviceOnline])
  {
    char v65 = v19;
  }
  else
  {
    uint64_t v20 = +[IDSFoundationLog IDSOffGridMessenger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Forcing cached results as we are offline", buf, 2u);
    }

    char v65 = 1;
  }
  v21 = +[IDSDAccountController sharedInstance];
  v22 = +[IDSDServiceController sharedInstance];
  v23 = [v22 serviceWithIdentifier:v14];
  uint64_t v24 = [v21 registeredAccountsOnService:v23];

  v67 = (void *)v24;
  id v25 = +[IDSQueryUtilities accountToQueryFrom:v24 fromURI:v13 destinationURIs:&__NSArray0__struct allowLocalAccount:0];
  v66 = v25;
  if (v25)
  {
    id v26 = v25;
    id v27 = [v25 primaryRegistration];
    id v28 = [v27 registrationCert];

    NSErrorUserInfoKey v29 = +[IDSQueryUtilities prefixedAliasStringToQueryFrom:v26 withPreferredFromURI:0];
    CFStringRef v30 = +[IDSURI URIWithPrefixedURI:v29 withServiceLoggingHint:v14];

    NSErrorUserInfoKey v31 = +[IDSFoundationLog IDSOffGridMessenger];
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    id v64 = v13;
    if (v30 && v28)
    {
      v63 = v28;
      v59 = (void (**)(void, void, void))v16;
      id v60 = v15;
      id v61 = v14;
      if (v32)
      {
        *(_DWORD *)buf = 138412290;
        v85 = (const char *)v12;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Checking cache to get shortHandles for destinationURIs {%@}", buf, 0xCu);
      }

      __int16 v33 = +[IDSDaemon sharedInstance];
      id v34 = [v33 senderKeyDistributionManager];

      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v62 = v12;
      id obj = v12;
      id v35 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
      v72 = v17;
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v78;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v78 != v37) {
              objc_enumerationMutation(obj);
            }
            v39 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            if ([v39 isTokenURI])
            {
              id v40 = [v39 tokenFreeURI];
            }
            else
            {
              id v40 = v39;
            }
            v41 = v40;
            id v42 = objc_alloc_init((Class)IDSOffGridDeliveryQueryResult);
            [v42 setUri:v39];
            if ([v39 isTokenURI])
            {
              v43 = [v39 pushToken];
              v44 = [v39 tokenFreeURI];
              [v34 markLastActivePeerToken:v43 localURI:v30 remoteURI:v44];
            }
            objc_msgSend(v42, "setHasUsableSenderKey:", objc_msgSend(v34, "hasUsableSenderKeyFor:from:", v41, v30));
            v45 = +[IDSPeerIDManager sharedInstance];
            v46 = [v45 shortHandleForURI:v41 fromURI:v30];

            if (v46)
            {
              [v42 setShortHandle:v46];
              [v42 setStatus:1];
              [v71 removeObject:v39];
            }
            else
            {
              v47 = +[IDSFoundationLog IDSOffGridMessenger];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v85 = (const char *)v39;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Missing short handle for %@ - returning status invalid", buf, 0xCu);
              }

              [v42 setStatus:2];
            }
            id v17 = v72;
            [v72 setObject:v42 forKey:v39];
          }
          id v36 = [obj countByEnumeratingWithState:&v77 objects:v81 count:16];
        }
        while (v36);
      }

      if ((v65 & 1) != 0 || ![v71 count])
      {
        id v16 = v59;
        ((void (**)(void, id, void))v59)[2](v59, v17, 0);
        id v14 = v61;
        id v12 = v62;
        id v13 = v64;
        id v15 = v60;
      }
      else
      {
        v48 = +[IDSFoundationLog IDSOffGridMessenger];
        id v13 = v64;
        id v15 = v60;
        id v14 = v61;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v85 = (const char *)v71;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Still need to query shortHandles for uris {%@}", buf, 0xCu);
        }

        objc_msgSend(v71, "__imArrayByApplyingBlock:", &stru_100988028);
        id obja = (id)objc_claimAutoreleasedReturnValue();
        v49 = +[IDSPeerIDManager sharedInstance];
        uint64_t v68 = IDSServiceNameiMessage;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 3221225472;
        v73[2] = sub_1002D12B8;
        v73[3] = &unk_100988050;
        id v16 = v59;
        v76 = v59;
        id v17 = v72;
        id v74 = v72;
        id v75 = v71;
        LOBYTE(v58) = 0;
        [v49 startQueryForURIs:obja fromIdentity:v63 fromURI:v30 fromService:v68 forSending:0 forRefresh:0 isForced:v58 reason:@"ShortHandles" completionBlock:v73];

        id v12 = v62;
      }

      id v28 = v63;
    }
    else
    {
      v53 = (void (**)(void, id, void *))v16;
      if (v32)
      {
        CFStringRef v54 = @"NO";
        *(_DWORD *)buf = 136315906;
        v85 = "-[IDSDXPCOffGridMessenger resultsForDestinationURIs:senderURI:service:options:completion:]";
        if (v28) {
          CFStringRef v54 = @"YES";
        }
        __int16 v86 = 2112;
        id v87 = v14;
        __int16 v88 = 2112;
        v89 = v30;
        __int16 v90 = 2112;
        CFStringRef v91 = v54;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: No registered account found for service %@. localURI {%@} cert {%@}", buf, 0x2Au);
      }

      uint64_t v55 = IDSOffGridDeliveryErrorDomain;
      NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
      CFStringRef v83 = @"Failed to query due to nil local uri or cert";
      v56 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      v57 = +[NSError errorWithDomain:v55 code:6 userInfo:v56];

      id v16 = v53;
      v53[2](v53, v17, v57);

      id v13 = v64;
    }
  }
  else
  {
    v50 = +[IDSFoundationLog IDSOffGridMessenger];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[IDSDXPCOffGridMessenger resultsForDestinationURIs:senderURI:service:options:completion:]";
      __int16 v86 = 2112;
      id v87 = v14;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s: No account found for service %@.", buf, 0x16u);
    }

    uint64_t v51 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
    CFStringRef v93 = @"Failed to as there was no account found";
    v52 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    id v28 = +[NSError errorWithDomain:v51 code:6 userInfo:v52];

    (*((void (**)(id, id, void *))v16 + 2))(v16, v17, v28);
  }
}

- (void)encryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)IDSOffGridEncryptionProperties);
  id v8 = +[IDSDaemon sharedInstance];
  uint64_t v9 = [v8 persistenceManager];

  v48 = (void *)v9;
  id v10 = [[IDSSenderKeyEncryptionController alloc] initWithPersistenceManager:v9];
  id v11 = [v5 message];
  id v12 = [v5 recipientURI];
  id v13 = [v5 senderURI];
  v47 = v10;
  id v14 = [(IDSSenderKeyEncryptionController *)v10 paddyEncryptData:v11 to:v12 from:v13];

  uint64_t v15 = [v14 encryptedData];
  if (!v15
    || (id v16 = (void *)v15,
        [v14 error],
        id v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    id v18 = [v14 error];
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v18);
  }
  v49 = (void (**)(void, void, void, void))v6;
  unsigned __int8 v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 keyIndex]);
  [v7 setRatchetCounter:v19];

  uint64_t v20 = [v14 keyID];
  uint64_t v21 = objc_msgSend(v20, "subdataWithRange:", 0, 1);

  v50 = (void *)v21;
  [v7 setEncryptionKeyID:v21];
  v22 = [v14 authTag];
  [v7 setAuthTag:v22];

  [v7 setSegmentNumber:&off_1009D1C98];
  [v7 setTotalSegments:&off_1009D1C98];
  id v23 = objc_alloc((Class)IDSOffGridEncryptedMessage);
  uint64_t v24 = [v14 encryptedData];
  id v25 = [v5 senderURI];
  id v26 = [v5 recipientURI];
  id v27 = [v23 initWithMessage:v24 senderURI:v25 recipientURI:v26 encryptionProperties:v7];

  id v28 = [v5 message];
  NSErrorUserInfoKey v29 = [v5 senderURI];
  CFStringRef v30 = [v5 recipientURI];
  NSErrorUserInfoKey v31 = [v14 key];
  id v32 = [v14 keyIndex];
  __int16 v33 = [v14 authTag];
  id v34 = [(IDSDXPCOffGridMessenger *)self identifierFromMessage:v28 senderURI:v29 receiverURI:v30 senderKey:v31 ratchetCounter:v32 authTag:v33];
  [v27 setIdentifier:v34];

  id v35 = [v5 service];
  [v27 setService:v35];

  id v36 = +[IDSFoundationLog IDSOffGridMessenger];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = [v5 senderURI];
    [v5 recipientURI];
    id v38 = v46 = v7;
    v44 = [v14 encryptedData];
    v39 = [v44 debugDescription];
    id v40 = [v50 debugDescription];
    v41 = [v14 authTag];
    id v42 = [v41 debugDescription];
    *(_DWORD *)buf = 138413314;
    v52 = v37;
    __int16 v53 = 2112;
    CFStringRef v54 = v38;
    __int16 v55 = 2112;
    v56 = v39;
    __int16 v57 = 2112;
    uint64_t v58 = v40;
    __int16 v59 = 2112;
    id v60 = v42;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Encrypted off grid message {sURI: %@, rURI: %@, data: %@, kID: %@, (aTag: %@)}", buf, 0x34u);

    id v7 = v46;
  }

  v43 = [v27 identifier];
  ((void (**)(void, id, void *, void))v49)[2](v49, v27, v43, 0);
}

- (void)decryptOffGridMessage:(id)a3 completion:(id)a4
{
  id v34 = self;
  id v38 = a3;
  id v5 = a4;
  id v6 = +[IDSDaemon sharedInstance];
  uint64_t v7 = [v6 persistenceManager];

  uint64_t v37 = (void *)v7;
  id v8 = [[IDSSenderKeyEncryptionController alloc] initWithPersistenceManager:v7];
  uint64_t v9 = [v38 encryptionProperties];
  id v10 = [v9 authTag];

  id v11 = [v38 encryptionProperties];
  id v12 = [v11 ratchetCounter];

  id v13 = [v38 encryptionProperties];
  id v14 = [v13 encryptionKeyID];

  uint64_t v15 = [v38 message];
  id v16 = [v12 unsignedIntValue];
  id v17 = [v38 senderURI];
  id v18 = [v38 recipientURI];
  id v36 = v8;
  unsigned __int8 v19 = [(IDSSenderKeyEncryptionController *)v8 paddyDecryptData:v15 keyIndex:v16 keyIDByte:v14 from:v17 to:v18];

  uint64_t v20 = [v19 decryptedData];
  if (!v20
    || (uint64_t v21 = (void *)v20,
        [v19 error],
        v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        v22))
  {
    id v23 = objc_msgSend(v19, "error", v34);
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v23);
  }
  uint64_t v24 = objc_msgSend(v19, "decryptedData", v34);
  id v25 = [v38 senderURI];
  id v26 = [v19 originalRecipientURI];
  id v27 = [v19 key];
  id v28 = objc_msgSend(v35, "identifierFromMessage:senderURI:receiverURI:senderKey:ratchetCounter:authTag:", v24, v25, v26, v27, objc_msgSend(v12, "unsignedIntValue"), v10);

  id v29 = objc_alloc((Class)IDSOffGridMessage);
  CFStringRef v30 = [v19 decryptedData];
  NSErrorUserInfoKey v31 = [v38 senderURI];
  id v32 = [v19 originalRecipientURI];
  id v33 = [v29 initWithMessage:v30 senderURI:v31 recipientURI:v32];

  (*((void (**)(id, id, void *, void))v5 + 2))(v5, v33, v28, 0);
}

- (void)sendEncryptedOffGridMessage:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IDSDXPCOffGridMessenger *)self isCTClientActive])
  {
    id v11 = objc_alloc_init((Class)IDSOffGridDeliveryQueryOptions);
    objc_msgSend(v11, "setCached:", objc_msgSend(v9, "transportType") == (id)2);
    id v12 = objc_alloc((Class)NSSet);
    id v13 = [v8 senderURI];
    id v14 = [v8 recipientURI];
    id v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, 0);

    id v16 = [v8 senderURI];
    id v17 = [v8 service];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002D2048;
    v21[3] = &unk_1009880A0;
    id v22 = v8;
    id v23 = self;
    id v24 = v10;
    [(IDSDXPCOffGridMessenger *)self resultsForDestinationURIs:v15 senderURI:v16 service:v17 options:v11 completion:v21];

    id v18 = v22;
  }
  else
  {
    id v11 = +[NSString stringWithFormat:@"Core Telephony Client is not active"];
    id v19 = objc_alloc((Class)NSError);
    uint64_t v20 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    id v26 = v11;
    id v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v18 = [v19 initWithDomain:v20 code:10 userInfo:v15];
    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v18);
  }
}

- (void)sendFetchRequestForHandles:(id)a3 fromHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IDSDXPCOffGridMessenger *)self isCTClientActive])
  {
    id v11 = objc_alloc_init((Class)NSMutableSet);
    uint64_t v12 = IDSServiceNameiMessageLite;
    id v13 = objc_alloc_init((Class)IDSOffGridDeliveryQueryOptions);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002D2968;
    v19[3] = &unk_1009880C8;
    id v20 = v8;
    id v21 = v11;
    id v22 = self;
    id v23 = v10;
    id v14 = v11;
    [(IDSDXPCOffGridMessenger *)self resultsForDestinationURIs:v20 senderURI:v9 service:v12 options:v13 completion:v19];

    id v15 = v20;
  }
  else
  {
    id v14 = +[NSString stringWithFormat:@"Core Telephony Client is not active"];
    id v16 = objc_alloc((Class)NSError);
    uint64_t v17 = IDSOffGridDeliveryErrorDomain;
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    id v25 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v18 = [v16 initWithDomain:v17 code:10 userInfo:v15];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v18);
  }
}

- (void)incomingOffGridMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = IDSServiceNameiMessageLite;
  id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_clientRemoteObjectsByService, "objectForKeyedSubscript:", IDSServiceNameiMessageLite, 0);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
        id v15 = [(NSMutableDictionary *)self->_clientRemoteObjectsByService objectForKeyedSubscript:v8];
        id v16 = [v15 objectForKeyedSubscript:v14];

        [v16 incomingOffGridMessage:v6 completion:v7];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)incomingOffGridSummaryMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = IDSServiceNameiMessageLite;
  id v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_clientRemoteObjectsByService, "objectForKeyedSubscript:", IDSServiceNameiMessageLite, 0);
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v13);
        id v15 = [(NSMutableDictionary *)self->_clientRemoteObjectsByService objectForKeyedSubscript:v8];
        id v16 = [v15 objectForKeyedSubscript:v14];

        [v16 incomingOffGridSummaryMessage:v6 completion:v7];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (BOOL)_isDeviceOnline
{
  return [(IMNetworkConnectionMonitor *)self->_connectionMonitor isImmediatelyReachable];
}

- (id)identifierFromMessage:(id)a3 senderURI:(id)a4 receiverURI:(id)a5 senderKey:(id)a6 ratchetCounter:(unsigned int)a7 authTag:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  unsigned int v31 = a7;
  id v17 = a8;
  long long v18 = +[IDSFoundationLog IDSOffGridMessenger];
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v13 && v14 && v15 && v16 && v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v17;
      __int16 v36 = 2048;
      uint64_t v37 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will generate offgrid message identifier from senderURI: %@, receiverURI: %@, authTag: %@, ratchetCounter: %ld", buf, 0x2Au);
    }

    long long v20 = +[NSMutableData data];
    [v20 appendData:v13];
    id v21 = [v14 unprefixedURI];
    id v22 = [v21 dataUsingEncoding:4];
    [v20 appendData:v22];

    id v23 = [v15 unprefixedURI];
    NSErrorUserInfoKey v24 = [v23 dataUsingEncoding:4];
    [v20 appendData:v24];

    [v20 appendData:v16];
    [v20 appendData:v17];
    [v20 appendBytes:&v31 length:4];
    *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v25;
    *(_OWORD *)&buf[16] = v25;
    long long v18 = v20;
    CC_SHA256([v18 bytes], (CC_LONG)[v18 length], buf);
    id v26 = +[NSData dataWithBytes:&buf[16] length:16];
    v34[0] = 0xAAAAAAAAAAAAAAAALL;
    v34[1] = 0xAAAAAAAAAAAAAAAALL;
    [v26 getBytes:v34 length:16];
    id v27 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v34];
    id v28 = [v27 UUIDString];
    id v29 = +[IDSFoundationLog IDSOffGridMessenger];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v32 = 138412290;
      id v33 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Generated offgrid message identifier: %@", v32, 0xCu);
    }
  }
  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error: cannot generate offgrid message identifier - one or more fields are null.", buf, 2u);
    }
    id v28 = 0;
  }

  return v28;
}

- (IDSStewieCTMessagingClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)clientRemoteObjectsByService
{
  return self->_clientRemoteObjectsByService;
}

- (void)setClientRemoteObjectsByService:(id)a3
{
}

- (IMNetworkConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_clientRemoteObjectsByService, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_ctClient, 0);
}

@end