@interface IDSRemoteURLConnectionDaemonIDSInterface
+ (id)sharedInstance;
- (BOOL)isNearby;
- (BOOL)sendIDSMessage:(id)a3 forLoaderWithUniqueID:(id)a4;
- (IDSRemoteURLConnectionDaemonIDSInterface)init;
- (void)_handleCancelMessage:(id)a3;
- (void)_handleLoadRequestMessage:(id)a3;
- (void)_handleLoadRequestResponseMessage:(id)a3;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
@end

@implementation IDSRemoteURLConnectionDaemonIDSInterface

+ (id)sharedInstance
{
  if (qword_1000159A0 != -1) {
    dispatch_once(&qword_1000159A0, &stru_100010770);
  }
  v2 = (void *)qword_1000159A8;
  return v2;
}

- (IDSRemoteURLConnectionDaemonIDSInterface)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSRemoteURLConnectionDaemonIDSInterface;
  v2 = [(IDSRemoteURLConnectionDaemonIDSInterface *)&v6 init];
  if (v2)
  {
    v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.idsremoteurlconnection"];
    idsService = v2->_idsService;
    v2->_idsService = v3;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:&_dispatch_main_q];
  }
  return v2;
}

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)IDSRemoteURLConnectionDaemonIDSInterface;
  [(IDSRemoteURLConnectionDaemonIDSInterface *)&v3 dealloc];
}

- (BOOL)isNearby
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          LOBYTE(v3) = [v6 isNearby];
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)sendIDSMessage:(id)a3 forLoaderWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = JWEncodeDictionary();
  id v9 = [v8 _CUTCopyGzippedData];
  long long v10 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v10, IDSSendMessageOptionLocalDeliveryKey, &__kCFBooleanTrue);
  CFDictionarySetValue(v10, IDSSendMessageOptionEnforceRemoteTimeoutsKey, &__kCFBooleanFalse);
  idsService = self->_idsService;
  v12 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v22 = 0;
  id v23 = 0;
  unsigned int v13 = [(IDSService *)idsService sendData:v9 toDestinations:v12 priority:300 options:v10 identifier:&v23 error:&v22];
  id v14 = v23;
  id v15 = v22;

  v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v17 = @"NO";
    if (v13) {
      CFStringRef v17 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v25 = v6;
    __int16 v26 = 2112;
    CFStringRef v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Sending message to local account (messageDict %@) success: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  char v18 = v13 ^ 1;
  if (!v7) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    if (!self->_messageIDToLoaderUniqueIDMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      messageIDToLoaderUniqueIDMap = self->_messageIDToLoaderUniqueIDMap;
      self->_messageIDToLoaderUniqueIDMap = Mutable;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)self->_messageIDToLoaderUniqueIDMap, v14, v7);
  }

  return v13;
}

- (void)_handleLoadRequestMessage:(id)a3
{
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v40 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received load request message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v31 = v4;
    _IDSLogV();
  }
  v32 = objc_msgSend(v4, "objectForKey:", IDSRemoteURLConnectionKeyRequest, v31);
  id v6 = [v4 objectForKey:IDSRemoteURLConnectionKeyTryForceCellular];
  [v6 BOOLValue];

  id v7 = [v4 objectForKey:IDSRemoteURLConnectionKeyRequireIDSHost];
  [v7 BOOLValue];

  long long v8 = [v4 objectForKey:IDSRemoteURLConnectionKeyVersion];
  int v9 = [v8 intValue];

  long long v10 = [v4 objectForKey:IDSRemoteURLConnectionShouldUsePipelining];
  [v10 BOOLValue];

  long long v11 = [v4 objectForKey:IDSRemoteURLConnectionConcurrentConnections];
  [v11 intValue];

  v12 = [v4 objectForKey:IDSRemoteURLConnectionDisableKeepAlive];
  [v12 BOOLValue];

  unsigned int v13 = [v4 objectForKey:IDSRemoteURLConnectionKeepAliveWifi];
  [v13 intValue];

  id v14 = [v4 objectForKey:IDSRemoteURLConnectionKeepAliveCell];
  [v14 intValue];

  if (v9 <= 0)
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "We received a request from a local device which did not have a request version specified, we will not allow this to require IDS host", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  objc_opt_class();
  v16 = JWDecodeKeyedCodableObjectWithSecureCoding();
  if (v16)
  {
    CFStringRef v17 = [v4 objectForKey:IDSRemoteURLConnectionKeyDataUsageBundleIdentifier];
    char v18 = [v4 objectForKey:IDSRemoteURLConnectionKeyUniqueID];
    pendingResponseUniqueIDs = self->_pendingResponseUniqueIDs;
    if (!pendingResponseUniqueIDs)
    {
      v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v21 = self->_pendingResponseUniqueIDs;
      self->_pendingResponseUniqueIDs = v20;

      pendingResponseUniqueIDs = self->_pendingResponseUniqueIDs;
    }
    [(NSMutableSet *)pendingResponseUniqueIDs addObject:v18];
    id v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = self->_pendingResponseUniqueIDs;
      *(_DWORD *)buf = 138412546;
      id v40 = v18;
      __int16 v41 = 2112;
      v42 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Added uniqueID %@ to _pendingResponseUniqueIDs. New map: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000088F8;
    v35[3] = &unk_100010798;
    v35[4] = self;
    id v36 = v18;
    id v24 = v16;
    id v37 = v24;
    id v25 = v17;
    id v38 = v25;
    id v26 = v18;
    id v27 = [v35 copy];
    v34 = v25;
    id v33 = v24;
    id v28 = v25;
    id v29 = v27;
    im_dispatch_after_primary_queue();
  }
  else
  {
    v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v4;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Unable to decode request -- ignoring! {message: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_handleLoadRequestResponseMessage:(id)a3
{
  id v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received load request response message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v3;
    _IDSLogV();
  }
  id v23 = objc_msgSend(v3, "objectForKey:", IDSRemoteURLConnectionKeyHeaders, v18);
  id v22 = [v3 objectForKey:IDSRemoteURLConnectionKeyURL];
  v21 = [v3 objectForKey:IDSRemoteURLConnectionKeyHTTPVersion];
  v5 = [v3 objectForKey:IDSRemoteURLConnectionKeyResponseStatusCode];
  id v6 = [v5 integerValue];

  v20 = [v3 objectForKey:IDSRemoteURLConnectionKeyResultData];
  id v7 = [v3 objectForKey:IDSRemoteURLConnectionKeyResponseError];
  objc_opt_class();
  v19 = JWDecodeKeyedCodableObjectWithSecureCoding();
  objc_opt_class();
  long long v8 = JWDecodeKeyedCodableObjectWithSecureCoding();
  objc_opt_class();
  int v9 = JWDecodeKeyedCodableObjectWithSecureCoding();
  long long v10 = [v3 objectForKey:IDSRemoteURLConnectionKeyUniqueID];
  long long v11 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  v12 = [v11 urlLoaderForUniqueID:v10];

  if (v12)
  {
    unsigned int v13 = [v12 block];
    id v14 = (void (**)(id, id, id, void *, void *, void))[v13 copy];

    if (v14)
    {
      id v15 = [objc_alloc((Class)NSHTTPURLResponse) initWithURL:v8 statusCode:v6 HTTPVersion:v21 headerFields:v19];
      v14[2](v14, v15, v6, v20, v9, 0);
    }
    v16 = +[IDSRemoteURLConnectionDaemon sharedInstance];
    [v16 removeURLLoaderForUniqueID:v10];
  }
  else
  {
    CFStringRef v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No URLLoader for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_handleCancelMessage:(id)a3
{
  id v4 = a3;
  v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received cancel message: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v11 = v4;
    _IDSLogV();
  }
  id v6 = objc_msgSend(v4, "objectForKey:", IDSRemoteURLConnectionKeyUniqueID, v11);
  id v7 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  long long v8 = [v7 urlLoaderForUniqueID:v6];

  if (v8)
  {
    [v8 cancel];
  }
  else
  {
    int v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No URLLoader for uniqueID %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v12 = v6;
      _IDSLogV();
    }
  }
  long long v10 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  [v10 removeURLLoaderForUniqueID:v6];

  [(NSMutableSet *)self->_pendingResponseUniqueIDs removeObject:v6];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  CFStringRef v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v15;
    __int16 v36 = 2112;
    id v37 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "incomingData on service %@, account %@ data %@ fromID %@ context %@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v26 = v15;
    id v27 = v16;
    id v24 = v13;
    id v25 = v14;
    id v23 = v12;
    _IDSLogV();
  }
  id v18 = objc_msgSend(v14, "_CUTOptionallyDecompressData", v23, v24, v25, v26, v27);
  v19 = JWDecodeDictionary();
  v20 = [v19 objectForKey:IDSRemoteURLConnectionKeyCommand];
  unsigned int v21 = [v20 unsignedIntValue];

  switch(v21)
  {
    case 3u:
      [(IDSRemoteURLConnectionDaemonIDSInterface *)self _handleCancelMessage:v19];
      break;
    case 2u:
      [(IDSRemoteURLConnectionDaemonIDSInterface *)self _handleLoadRequestResponseMessage:v19];
      break;
    case 1u:
      [(IDSRemoteURLConnectionDaemonIDSInterface *)self _handleLoadRequestMessage:v19];
      break;
    default:
      id v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v29) = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Unknown command %d, ignoring...", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      break;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = a7;
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v33 = v14;
    __int16 v34 = 2112;
    CFStringRef v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "didSendWithSuccess %@ success %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v18 = @"NO";
    if (v8) {
      CFStringRef v18 = @"YES";
    }
    id v28 = v14;
    CFStringRef v29 = v18;
    _IDSLogV();
  }
  -[NSMutableDictionary objectForKey:](self->_messageIDToLoaderUniqueIDMap, "objectForKey:", v14, v28, v29);
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_messageIDToLoaderUniqueIDMap removeObjectForKey:v14];
  if ([(__CFString *)v19 length])
  {
    if (v8)
    {
      __int16 v30 = v19;
      id v31 = v14;
      im_dispatch_after_primary_queue();
    }
    else
    {
      unsigned int v21 = +[IDSRemoteURLConnectionDaemon sharedInstance];
      id v22 = [v21 urlLoaderForUniqueID:v19];

      if (v22)
      {
        id v23 = [v22 block];
        id v24 = [v23 copy];

        if (v24)
        {
          id v25 = +[NSError errorWithDomain:IDSRemoteURLConnectionErrorDomain code:1 userInfo:0];
          (*((void (**)(id, void, void, void, void *, void))v24 + 2))(v24, 0, 0, 0, v25, 0);
        }
        id v26 = +[IDSRemoteURLConnectionDaemon sharedInstance];
        [v26 removeURLLoaderForUniqueID:v19];
      }
      else
      {
        id v27 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v19;
          __int16 v34 = 2112;
          CFStringRef v35 = v14;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No URLLoader for uniqueID %@ message ID %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Did not find loader ID for identifier %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = a3;
  int v9 = (NSMutableSet *)a4;
  long long v10 = (void (**)(void))a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didSwitchActivePairedDevice %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v9;
    _IDSLogV();
  }
  if ([(NSMutableSet *)self->_pendingResponseUniqueIDs count])
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      pendingResponseUniqueIDs = self->_pendingResponseUniqueIDs;
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = pendingResponseUniqueIDs;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dropping all pending responses for previously active watch. _pendingResponseUniqueIDs: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v16 = self->_pendingResponseUniqueIDs;
      _IDSLogV();
    }
    id v14 = +[IDSRemoteURLConnectionDaemon sharedInstance];
    [v14 removeURLLoadersForUniqueIDs:self->_pendingResponseUniqueIDs];

    [(NSMutableSet *)self->_pendingResponseUniqueIDs removeAllObjects];
  }
  v10[2](v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingResponseUniqueIDs, 0);
  objc_storeStrong((id *)&self->_messageIDToLoaderUniqueIDMap, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end