@interface IDSStewieCTMessagingClient
+ (IDSStewieCTMessagingClient)sharedInstance;
- (BOOL)isActiveForIML;
- (BOOL)isActiveForSMS;
- (BOOL)isAvailableForIML;
- (BOOL)isAvailableForSMS;
- (CTStewieDataClient)ctDataClient;
- (IDSStewieCTAvailabilityDelegate)availabilityDelegate;
- (IDSStewieCTMessagingClient)init;
- (IDSStewieCTMessagingDelegate)messagingDelegate;
- (OS_dispatch_queue)queue;
- (id)shortHandleBase64StringFromNumber:(id)a3;
- (id)shortHandleNumberFromBase64String:(id)a3;
- (id)uriForShortHandle:(id)a3;
- (void)connectedServicesChanged:(int64_t)a3;
- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5;
- (void)sendFetchRequestForHandles:(id)a3 completion:(id)a4;
- (void)sendOffGridMessage:(id)a3 completion:(id)a4;
- (void)sendOffGridStatusDecryptionKey:(id)a3 completion:(id)a4;
- (void)setAvailabilityDelegate:(id)a3;
- (void)setCtDataClient:(id)a3;
- (void)setMessagingDelegate:(id)a3;
@end

@implementation IDSStewieCTMessagingClient

- (IDSStewieCTMessagingClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)IDSStewieCTMessagingClient;
  v2 = [(IDSStewieCTMessagingClient *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ids.offgridstatus.ct", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (CTStewieDataClient *)[objc_alloc((Class)CTStewieDataClient) initWithServices:16 delegate:v2 delegateQueue:v2->_queue];
    ctDataClient = v2->_ctDataClient;
    v2->_ctDataClient = v7;

    unsigned int v9 = [(CTStewieDataClient *)v2->_ctDataClient start];
    v10 = +[IDSFoundationLog stewieMessaging];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      v12 = v2->_ctDataClient;
      if (v9) {
        CFStringRef v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v16 = v11;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Started data client %@ %@", buf, 0x16u);
    }
  }
  return v2;
}

+ (IDSStewieCTMessagingClient)sharedInstance
{
  if (qword_100A4C738 != -1) {
    dispatch_once(&qword_100A4C738, &stru_100988B38);
  }
  v2 = (void *)qword_100A4C740;

  return (IDSStewieCTMessagingClient *)v2;
}

- (void)setAvailabilityDelegate:(id)a3
{
}

- (void)setMessagingDelegate:(id)a3
{
}

- (BOOL)isActiveForIML
{
  v2 = [(CTStewieDataClient *)self->_ctDataClient getState];
  unsigned __int8 v3 = [v2 isActiveService:16];

  return v3;
}

- (BOOL)isActiveForSMS
{
  v2 = [(CTStewieDataClient *)self->_ctDataClient getState];
  unsigned __int8 v3 = [v2 isActiveService:32];

  return v3;
}

- (BOOL)isAvailableForIML
{
  v2 = [(CTStewieDataClient *)self->_ctDataClient getState];
  unsigned __int8 v3 = [v2 isAllowedService:16];

  return v3;
}

- (BOOL)isAvailableForSMS
{
  v2 = [(CTStewieDataClient *)self->_ctDataClient getState];
  unsigned __int8 v3 = [v2 isAllowedService:32];

  return v3;
}

- (void)sendOffGridMessage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v32 = a4;
  v7 = [v6 senderShortHandle];
  v8 = [(IDSStewieCTMessagingClient *)self shortHandleNumberFromBase64String:v7];

  unsigned int v9 = [v6 recipientShortHandle];
  v30 = self;
  v31 = [(IDSStewieCTMessagingClient *)self shortHandleNumberFromBase64String:v9];

  id v10 = objc_alloc((Class)CTStewieIMessageLiteMessageOutgoing);
  CFStringRef v11 = [v6 encryptionProperties];
  v12 = [v11 segmentNumber];
  id v13 = [v12 integerValue];
  objc_super v14 = [v6 encryptionProperties];
  v15 = [v14 totalSegments];
  id v16 = [v15 integerValue];
  __int16 v17 = [v6 payload];
  id v36 = 0;
  id v18 = [v10 initWithMyShortHandle:v8 otherShortHandle:v31 partNumber:v13 totalParts:v16 payload:v17 error:&v36];
  id v19 = v36;

  v20 = +[IDSFoundationLog stewieMessaging];
  v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10071EA5C((uint64_t)v19, v21);
    }

    v22 = v32;
    (*((void (**)(id, void, id))v32 + 2))(v32, 0, v19);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [v6 encryptionProperties];
      v23 = [v29 segmentNumber];
      v24 = [v6 encryptionProperties];
      v25 = [v24 totalSegments];
      v26 = [v6 payload];
      v27 = [v26 debugDescription];
      *(_DWORD *)buf = 138413314;
      v38 = v8;
      __int16 v39 = 2112;
      v40 = v31;
      __int16 v41 = 2112;
      v42 = v23;
      __int16 v43 = 2112;
      v44 = v25;
      __int16 v45 = 2112;
      v46 = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending off grid message {sURI: %@, rURI: %@, pn: %@, tp: %@, p: %@}", buf, 0x34u);
    }
    ctDataClient = v30->_ctDataClient;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10030C738;
    v33[3] = &unk_100988B60;
    id v34 = v6;
    v22 = v32;
    id v35 = v32;
    [(CTStewieDataClient *)ctDataClient sendMessage:v18 completion:v33];
  }
}

- (void)sendFetchRequestForHandles:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  id v7 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10030CAA4;
  v19[3] = &unk_100988B88;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v20 = v8;
  v21 = self;
  [v7 enumerateObjectsUsingBlock:v19];

  id v9 = objc_alloc((Class)CTStewieIMessageLiteFetchMessage);
  id v10 = [v8 allObjects];
  id v18 = 0;
  id v11 = [v9 initWithShortHandles:v10 error:&v18];
  id v12 = v18;

  if (v12)
  {
    id v13 = +[IDSFoundationLog stewieMessaging];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10071EAD4((uint64_t)v12, v13);
    }

    v6[2](v6, 0, v12);
  }
  else
  {
    ctDataClient = self->_ctDataClient;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10030CAFC;
    v15[3] = &unk_100988B60;
    id v16 = v11;
    __int16 v17 = v6;
    [(CTStewieDataClient *)ctDataClient sendMessage:v16 completion:v15];
  }
}

- (void)sendOffGridStatusDecryptionKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSFoundationLog stewieMessaging];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending key for offgrid mode: %@", buf, 0xCu);
  }

  if (v6)
  {
    id v15 = 0;
    id v9 = [objc_alloc((Class)CTStewieOffGridModeMessage) initWithOffGridModeKey:v6 error:&v15];
    id v10 = v15;
    ctDataClient = self->_ctDataClient;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10030CE54;
    v13[3] = &unk_100988BB0;
    id v14 = v7;
    [(CTStewieDataClient *)ctDataClient sendMessage:v9 completion:v13];
  }
  else
  {
    id v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"Invalid decryption key.", NSLocalizedDescriptionKey, 0);
    id v12 = objc_alloc((Class)NSError);
    id v10 = [v12 initWithDomain:IDSOffGridStatusErrorDomain code:5 userInfo:v9];
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
  }
}

- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = +[IDSFoundationLog stewieMessaging];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v79 = v8;
    __int16 v80 = 2112;
    id v81 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Incoming stewie message: {message: %@, metadata: %@}", buf, 0x16u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v57 = v10;
    id v59 = v8;
    id v12 = v8;
    id v13 = +[IDSFoundationLog stewieMessaging];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v79 = v12;
      __int16 v80 = 2112;
      id v81 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received incoming iMessage Lite: %@ with Metadata %@", buf, 0x16u);
    }

    id v14 = [v12 otherShortHandle];
    v60 = [(IDSStewieCTMessagingClient *)self shortHandleBase64StringFromNumber:v14];

    id v15 = [v12 myShortHandle];
    id v16 = [(IDSStewieCTMessagingClient *)self shortHandleBase64StringFromNumber:v15];

    id v17 = [(IDSStewieCTMessagingClient *)self uriForShortHandle:v60];
    uint64_t v18 = [(IDSStewieCTMessagingClient *)self uriForShortHandle:v16];
    id v19 = objc_alloc((Class)IDSOffGridEncryptedMessage);
    id v20 = [v12 payload];
    v61 = (void *)v18;
    id v21 = [v19 initWithPayload:v20 senderURI:v17 recipientURI:v18];

    v22 = [v12 timestamp];
    [v22 doubleValue];
    v24 = +[NSDate dateWithTimeIntervalSince1970:v23 / 1000000000.0];
    [v21 setDate:v24];

    v25 = [v21 encryptionProperties];
    v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 partNumber]);
    [v25 setSegmentNumber:v26];

    v27 = [v21 encryptionProperties];
    v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 totalParts]);
    [v27 setTotalSegments:v28];

    [v21 setSenderShortHandle:v60];
    [v21 setRecipientShortHandle:v16];
    v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 pendingTotalCount]);
    [v21 setPendingTotalCount:v29];

    v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 pendingCount]);
    [v21 setPendingCount:v30];

    v31 = +[IDSFoundationLog stewieMessaging];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413570;
      id v79 = v21;
      __int16 v80 = 2112;
      id v81 = v9;
      __int16 v82 = 2112;
      v83 = v60;
      __int16 v84 = 2112;
      v85 = v17;
      __int16 v86 = 2112;
      v87 = v16;
      __int16 v88 = 2112;
      uint64_t v89 = v18;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Received incoming iMessage Lite: %@ with Metadata %@ senderShortHandle: %@ senderURI: %@ recipientShortHandle: %@ recipientURI: %@", buf, 0x3Eu);
    }

    id v10 = v57;
    if (sub_1004039F4(v17))
    {
      id v32 = +[IDSFoundationLog stewieMessaging];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v79 = v17;
        __int16 v80 = 2112;
        id v81 = v61;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Incoming iMessage Lite with {senderURI: %@ recipientURI: %@} came from blocked URI - dropping", buf, 0x16u);
      }

      v57[2](v57);
    }
    else
    {
      messagingDelegate = self->_messagingDelegate;
      if (messagingDelegate)
      {
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_10030D810;
        v71[3] = &unk_1009800E8;
        id v72 = v9;
        v73 = self;
        v74 = v57;
        [(IDSStewieCTMessagingDelegate *)messagingDelegate incomingOffGridMessage:v21 completion:v71];
      }
    }

LABEL_38:
    id v8 = v59;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v56 = v9;
    v58 = v10;
    id v59 = v8;
    id v33 = v8;
    id v34 = +[IDSFoundationLog stewieMessaging];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v79 = v33;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received incoming iMessage Lite Summary: %@", buf, 0xCu);
    }

    id v62 = objc_alloc_init((Class)NSMutableDictionary);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v55 = v33;
    id v35 = [v33 pendingCounts];
    id v36 = [v35 countByEnumeratingWithState:&v67 objects:v77 count:16];
    if (!v36)
    {
LABEL_32:

      id v47 = objc_alloc((Class)IDSOffGridSummaryMessage);
      id v12 = v55;
      v48 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v55 pendingIMessageLiteTotalCount]);
      id v49 = [v47 initWithSummary:v62 totalPendingMessagesCount:v48];

      v50 = self->_messagingDelegate;
      id v9 = v56;
      id v10 = v58;
      if (v50)
      {
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_10030D93C;
        v63[3] = &unk_1009800E8;
        id v64 = v56;
        v65 = self;
        v66 = v58;
        [(IDSStewieCTMessagingDelegate *)v50 incomingOffGridSummaryMessage:v49 completion:v63];
      }
      goto LABEL_38;
    }
    id v37 = v36;
    uint64_t v38 = *(void *)v68;
LABEL_17:
    uint64_t v39 = 0;
    while (1)
    {
      if (*(void *)v68 != v38) {
        objc_enumerationMutation(v35);
      }
      v40 = *(void **)(*((void *)&v67 + 1) + 8 * v39);
      __int16 v41 = [v40 otherShortHandle];
      v42 = [(IDSStewieCTMessagingClient *)self shortHandleBase64StringFromNumber:v41];

      if (!v42)
      {
        v44 = +[IDSFoundationLog stewieMessaging];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_10071EB4C(buf, v40, &v79, v44);
        }
        goto LABEL_30;
      }
      __int16 v43 = [(IDSStewieCTMessagingClient *)self uriForShortHandle:v42];
      v44 = v43;
      if (!v43) {
        break;
      }
      __int16 v45 = [v43 prefixedURI];

      if (!v45) {
        break;
      }
      if (!sub_1004039F4(v44))
      {
        v46 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v40 pendingCount]);
        [v62 setObject:v46 forKey:v44];
LABEL_27:
      }
LABEL_30:

      if (v37 == (id)++v39)
      {
        id v37 = [v35 countByEnumeratingWithState:&v67 objects:v77 count:16];
        if (!v37) {
          goto LABEL_32;
        }
        goto LABEL_17;
      }
    }
    v46 = +[IDSFoundationLog stewieMessaging];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v75 = 138412290;
      v76 = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Unable to fetch URI from short handle %@, dropping", v75, 0xCu);
    }
    goto LABEL_27;
  }
  v52 = +[IDSFoundationLog stewieMessaging];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v79 = v53;
    __int16 v80 = 2112;
    id v81 = v9;
    id v54 = v53;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Received incoming message of unhandled type: %@ with metadata %@. Dropping!", buf, 0x16u);
  }
  v10[2](v10);
LABEL_42:
}

- (void)connectedServicesChanged:(int64_t)a3
{
  dispatch_queue_t v5 = +[IDSFoundationLog stewieMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"YES";
    if ((a3 & 0x10) != 0) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    int v8 = 134218498;
    int64_t v9 = a3;
    CFStringRef v11 = v7;
    __int16 v10 = 2112;
    if ((a3 & 0x20) == 0) {
      CFStringRef v6 = @"NO";
    }
    __int16 v12 = 2112;
    CFStringRef v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "connectedServicesChanged %ld: iml(%@) sms(%@)", (uint8_t *)&v8, 0x20u);
  }

  if (self->_availabilityDelegate)
  {
    if (objc_opt_respondsToSelector()) {
      [(IDSStewieCTAvailabilityDelegate *)self->_availabilityDelegate availabilityChangedForIML:((unint64_t)a3 >> 4) & 1];
    }
  }
}

- (id)uriForShortHandle:(id)a3
{
  id v3 = a3;
  v4 = +[IDSPeerIDManager sharedInstance];
  dispatch_queue_t v5 = [v4 uriForShortHandle:v3];

  return v5;
}

- (id)shortHandleNumberFromBase64String:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];

  dispatch_queue_t v5 = 0;
  if ([v4 length] == (id)7)
  {
    unint64_t v7 = 0;
    [v4 getBytes:&v7 length:8];
    unint64_t v7 = bswap64(v7) >> 8;
    dispatch_queue_t v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  }

  return v5;
}

- (id)shortHandleBase64StringFromNumber:(id)a3
{
  unint64_t v6 = bswap64((unint64_t)[a3 unsignedLongLongValue]) >> 8;
  id v3 = +[NSData dataWithBytes:&v6 length:7];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

- (CTStewieDataClient)ctDataClient
{
  return self->_ctDataClient;
}

- (void)setCtDataClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (IDSStewieCTAvailabilityDelegate)availabilityDelegate
{
  return self->_availabilityDelegate;
}

- (IDSStewieCTMessagingDelegate)messagingDelegate
{
  return self->_messagingDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingDelegate, 0);
  objc_storeStrong((id *)&self->_availabilityDelegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_ctDataClient, 0);
}

@end