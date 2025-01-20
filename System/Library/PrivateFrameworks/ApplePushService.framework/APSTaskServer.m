@interface APSTaskServer
- (APSDaemon)daemon;
- (APSTaskServer)initWithConnection:(id)a3 queue:(id)a4 apsDaemon:(id)a5;
- (BOOL)_handleTaskControlResponse:(id)a3 controlResponse:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (id)_getCacheEntryForHostname:(id)a3;
- (id)_getCourierForEnvironmentName:(id)a3;
- (id)getTaskWithMessageId:(unint64_t)a3;
- (id)getTaskWithTaskId:(unint64_t)a3;
- (void)dealloc;
- (void)handleTaskControlResponseMessage:(id)a3 message:(id)a4;
- (void)handleTaskNotificationMessage:(id)a3 message:(id)a4;
- (void)resolveDNS:(id)a3 reply:(id)a4;
@end

@implementation APSTaskServer

- (APSTaskServer)initWithConnection:(id)a3 queue:(id)a4 apsDaemon:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)APSTaskServer;
  v12 = [(APSTaskServer *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    outstandingTaskList = v13->_outstandingTaskList;
    v13->_outstandingTaskList = v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dnsCache = v13->_dnsCache;
    v13->_dnsCache = v16;

    id remoteDNSResponseHandler = v13->_remoteDNSResponseHandler;
    v13->_id remoteDNSResponseHandler = 0;

    objc_storeStrong((id *)&v13->_queue, a4);
    objc_storeStrong((id *)&v13->_daemon, a5);
  }

  return v13;
}

- (void)dealloc
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(NSXPCConnection *)self->_connection setExportedInterface:0];
  v3 = [(APSTaskServer *)self _getCourierForEnvironmentName:self->_environmentName];
  [v3 removeTaskServer:self];
  connection = self->_connection;
  self->_connection = 0;

  outstandingTaskList = self->_outstandingTaskList;
  self->_outstandingTaskList = 0;

  dnsCache = self->_dnsCache;
  self->_dnsCache = 0;

  daemon = self->_daemon;
  self->_daemon = 0;

  environmentName = self->_environmentName;
  self->_environmentName = 0;

  v9.receiver = self;
  v9.super_class = (Class)APSTaskServer;
  [(APSTaskServer *)&v9 dealloc];
}

- (id)_getCourierForEnvironmentName:(id)a3
{
  return [(APSDaemon *)self->_daemon courierForEnvironmentName:a3];
}

- (void)resolveDNS:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v42 = a4;
  v7 = +[APSLog taskManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 hostname];
    *(_DWORD *)buf = 138412290;
    v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received DNS request for hostname %@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v43 = +[NSDate date];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  objc_super v9 = self->_dnsCache;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v45;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v45 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
      v15 = [v14 hostname];
      v16 = [v6 hostname];
      unsigned int v17 = [v15 isEqualToString:v16];

      if (v17) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    v19 = [v6 hostname];
    objc_super v20 = (void *)v43;
    v21 = [v14 getAddressListForHostname:v19 now:v43 addressFamily:1];

    v22 = [v6 hostname];
    v23 = [v14 getAddressListForHostname:v22 now:v43 addressFamily:2];

    id v24 = [v21 count];
    if ((char *)[(TASKEdgeDnsInput *)v23 count] + (void)v24)
    {
      v38 = [APSDNSResponse alloc];
      v39 = [v6 hostname];
      v40 = [v21 componentsJoinedByString:@","];
      v41 = [(TASKEdgeDnsInput *)v23 componentsJoinedByString:@","];
      v34 = [(APSDNSResponse *)v38 initResponseForHostname:v39 ipv4Address:v40 ipv6Address:v41];

      v35 = [v6 hostname];
      v18 = v42;
      (*((void (**)(id, TASKRequest *, TASKInput *, void))v42 + 2))(v42, v35, v34, 0);
      goto LABEL_19;
    }
    id v25 = v14;

    v18 = v42;
    if (v25) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:

    v18 = v42;
  }
  [(NSMutableArray *)self->_dnsCache removeObject:0];
  id v25 = 0;
LABEL_15:

  objc_super v9 = [[APSOutstandingTask alloc] initWithDNSTask:v6];
  [(NSMutableArray *)self->_outstandingTaskList addObject:v9];
  id v26 = objc_retainBlock(v18);
  id remoteDNSResponseHandler = self->_remoteDNSResponseHandler;
  self->_id remoteDNSResponseHandler = v26;

  environmentName = self->_environmentName;
  if (!environmentName)
  {
    v29 = [v6 environment];
    v30 = (NSString *)[v29 copy];
    v31 = self->_environmentName;
    self->_environmentName = v30;

    environmentName = self->_environmentName;
  }
  v21 = [(APSTaskServer *)self _getCourierForEnvironmentName:environmentName];
  [v21 addTaskServer:self];
  id v32 = [v21 getNextTaskMessageId];
  v23 = objc_alloc_init(TASKEdgeDnsInput);
  [(TASKEdgeDnsInput *)v23 setRecordType:0];
  v33 = [v6 hostname];
  [(TASKEdgeDnsInput *)v23 setHostname:v33];

  v34 = objc_alloc_init(TASKInput);
  [(TASKInput *)v34 setEdgeDNS:v23];
  v35 = objc_alloc_init(TASKRequest);
  [(TASKRequest *)v35 setInput:v34];
  v36 = objc_alloc_init(TASKControlRequest);
  [(TASKControlRequest *)v36 setCreate:v35];
  v37 = [(TASKControlRequest *)v36 data];
  [v21 sendTaskControlMessageWithMetadata:v37 messageId:v32];

  [(NSMutableArray *)v9 setMessageId:v32];
  [(NSMutableArray *)v9 setTaskStatus:1];

  objc_super v20 = (void *)v43;
LABEL_19:
}

- (id)getTaskWithMessageId:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_outstandingTaskList;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "messageId", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)getTaskWithTaskId:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_outstandingTaskList;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "taskId", (void)v12) == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_handleTaskControlResponse:(id)a3 controlResponse:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = [a4 create];
  if ([v9 taskId])
  {
    id v11 = [v9 taskId];
    if (v11 != (id)[v10 taskId])
    {
      long long v12 = +[NSAssertionHandler currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"APSTaskServer.m", 154, @"taskId from message %u does not match the taskId in cache %lu", objc_msgSend(v10, "taskId"), objc_msgSend(v9, "taskId"));
    }
  }
  else
  {
    objc_msgSend(v9, "setTaskId:", objc_msgSend(v10, "taskId"));
  }
  switch([v10 status])
  {
    case 0u:
      [v9 setTaskStatus:2];
      long long v13 = +[APSLog taskManager];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        id v40 = [v9 messageId];
        __int16 v41 = 2048;
        id v42 = [v9 taskId];
        __int16 v43 = 2048;
        id v44 = [v9 taskType];
        __int16 v45 = 1024;
        int v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received response for task messageId %lu taskId %lu type %lu status %u\n", buf, 0x26u);
      }
      id v14 = 0;
      goto LABEL_29;
    case 1u:
      [v9 setTaskStatus:4];
      id v15 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      long long v13 = [v10 errorMessage];
      if (v13)
      {
        v16 = [v10 errorMessage];
      }
      else
      {
        v16 = @"This functionalty is disabled by server";
      }
      v38 = v16;
      objc_super v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v21 = v15;
      NSErrorDomain v22 = NSCocoaErrorDomain;
      uint64_t v23 = 3328;
      goto LABEL_27;
    case 2u:
      [v9 setTaskStatus:4];
      id v17 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      long long v13 = [v10 errorMessage];
      if (v13)
      {
        v16 = [v10 errorMessage];
      }
      else
      {
        v16 = @"Connection is not ready";
      }
      v36 = v16;
      objc_super v20 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      v21 = v17;
      NSErrorDomain v22 = NSCocoaErrorDomain;
      uint64_t v23 = 4609;
      goto LABEL_27;
    case 3u:
      [v9 setTaskStatus:4];
      id v18 = objc_alloc((Class)NSError);
      NSErrorDomain v19 = NSCocoaErrorDomain;
      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      long long v13 = [v10 errorMessage];
      if (v13)
      {
        v16 = [v10 errorMessage];
      }
      else
      {
        v16 = @"Too many running tasks on server";
      }
      id v32 = v16;
      id v24 = &v32;
      id v25 = &v31;
      goto LABEL_26;
    case 4u:
      [v9 setTaskStatus:4];
      id v18 = objc_alloc((Class)NSError);
      NSErrorDomain v19 = NSCocoaErrorDomain;
      NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
      long long v13 = [v10 errorMessage];
      if (v13)
      {
        v16 = [v10 errorMessage];
      }
      else
      {
        v16 = @"Server received invalid input";
      }
      v34 = v16;
      id v24 = &v34;
      id v25 = &v33;
LABEL_26:
      objc_super v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v25 count:1];
      v21 = v18;
      NSErrorDomain v22 = v19;
      uint64_t v23 = 4866;
LABEL_27:
      id v14 = [v21 initWithDomain:v22 code:v23 userInfo:v20];

      if (v13) {
LABEL_29:
      }

      break;
    default:
      id v14 = 0;
      break;
  }
  if ([v9 taskStatus] == (id)4 && objc_msgSend(v9, "taskType") == (id)1)
  {
    if (!v14)
    {
      v30 = +[NSAssertionHandler currentHandler];
      [v30 handleFailureInMethod:a2 object:self file:@"APSTaskServer.m" lineNumber:181 description:@"Returning nil error is unexpected"];
    }
    id remoteDNSResponseHandler = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
    if (remoteDNSResponseHandler)
    {
      v27 = [v9 dnsRequest];
      v28 = [v27 hostname];
      remoteDNSResponseHandler[2](remoteDNSResponseHandler, v28, 0, v14);
    }
  }
  if (a5 && v14) {
    *a5 = v14;
  }

  return v14 == 0;
}

- (void)handleTaskControlResponseMessage:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKey:@"APSProtocolTaskStatus"];
  id v10 = [v9 intValue];

  uint64_t v11 = (void)v10 << 56;
  if (!((void)v10 << 56))
  {
    [v7 setTaskStatus:2];
    id v17 = [v8 objectForKey:@"APSProtocolTaskControlPayload"];
    long long v13 = [[TASKControlResponse alloc] initWithData:v17];
    id v24 = 0;
    [(APSTaskServer *)self _handleTaskControlResponse:v7 controlResponse:v13 error:&v24];
    id v18 = v24;
LABEL_8:

    goto LABEL_10;
  }
  [v7 setTaskStatus:4];
  if (v11 == 0x200000000000000)
  {
    id v19 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Task handling is disabled";
    long long v13 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v14 = v19;
    NSErrorDomain v15 = NSCocoaErrorDomain;
    uint64_t v16 = 3328;
    goto LABEL_7;
  }
  if (v11 == 0x100000000000000)
  {
    id v12 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"Server failed to deserialize protobuf payload";
    long long v13 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v14 = v12;
    NSErrorDomain v15 = NSCocoaErrorDomain;
    uint64_t v16 = 2048;
LABEL_7:
    id v18 = [v14 initWithDomain:v15 code:v16 userInfo:v13];
    id v17 = 0;
    goto LABEL_8;
  }
  id v17 = 0;
  id v18 = 0;
LABEL_10:
  if ([v7 taskStatus] == (id)4)
  {
    if ([v7 taskType] == (id)1)
    {
      id remoteDNSResponseHandler = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
      if (remoteDNSResponseHandler)
      {
        if (!v18)
        {
          uint64_t v23 = +[NSAssertionHandler currentHandler];
          [v23 handleFailureInMethod:a2 object:self file:@"APSTaskServer.m" lineNumber:220 description:@"Returning nil error is unexpected"];

          id remoteDNSResponseHandler = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
        }
        v21 = [v7 dnsRequest];
        NSErrorDomain v22 = [v21 hostname];
        remoteDNSResponseHandler[2](remoteDNSResponseHandler, v22, 0, v18);
      }
    }
    [(NSMutableArray *)self->_outstandingTaskList removeObject:v7];
  }
}

- (id)_getCacheEntryForHostname:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_dnsCache;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "hostname", (void)v13);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handleTaskNotificationMessage:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 objectForKey:@"APSProtocolTaskStatus"];
  unsigned __int8 v10 = [v9 intValue];

  if (!v10)
  {
    if ([v7 taskType] != (id)1)
    {
      id v13 = 0;
      goto LABEL_52;
    }
    id v12 = [v8 objectForKey:@"APSProtocolTaskNotificationPayload"];
    long long v14 = [[TASKNotifyRequest alloc] initWithData:v12];
    long long v15 = [(TASKNotifyRequest *)v14 output];
    long long v16 = [v15 edgeDNS];

    if ([v16 status]
      || ![v16 ipv4sCount] && !objc_msgSend(v16, "ipv6sCount"))
    {
      v61 = +[NSAssertionHandler currentHandler];
      [v61 handleFailureInMethod:a2 object:self file:@"APSTaskServer.m" lineNumber:249 description:@"Did not receive any ipv4 or ipv6 addresses in DNS task notification"];
    }
    v66 = [v7 dnsRequest];
    id v17 = [v66 hostname];
    id v18 = [(APSTaskServer *)self _getCacheEntryForHostname:v17];

    unsigned int v19 = [v16 status];
    if (v19 - 1 >= 4)
    {
      if (v19)
      {
        id v13 = 0;
LABEL_50:

        goto LABEL_51;
      }
      [v7 setTaskStatus:3];
      uint64_t v23 = &objc_retain_x28_ptr;
      v65 = self;
      v62 = v14;
      if ([v16 ipv4sCount])
      {
        id v67 = objc_alloc_init((Class)NSMutableArray);
        if ([v16 ipv4sCount])
        {
          unint64_t v24 = 0;
          do
          {
            LODWORD(v68) = 0;
            NSErrorUserInfoKey v25 = [v16 ipv4AtIndex:v24];
            CFStringRef v26 = [v25 ipAddress];
            [v26 getBytes:&v68 length:4];

            if (inet_ntop(2, &v68, (char *)buf, 0x10u))
            {
              id v27 = [objc_alloc((Class)NSString) initWithCString:buf encoding:1];
              [v67 addObject:v27];
              if (!v18)
              {
                CFStringRef v28 = [APSDNSCacheEntry alloc];
                v29 = [v66 hostname];
                id v18 = [(APSDNSCacheEntry *)v28 initWithHostname:v29];

                self = v65;
                [(NSMutableArray *)v65->_dnsCache addObject:v18];
              }
              -[APSDNSCacheEntry addCacheIPAddress:addressFamily:timeToLive:](v18, "addCacheIPAddress:addressFamily:timeToLive:", v27, 1, (double)[v25 ttl]);
            }
            ++v24;
          }
          while ((unint64_t)[v16 ipv4sCount] > v24);
        }
        v30 = +[APSLog taskManager];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v31 = [v16 ipv4sCount];
          id v32 = [v7 dnsRequest];
          NSErrorUserInfoKey v33 = [v32 hostname];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v31;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v33;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v67;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Received %u IPv4 addresses for hostname %@: %@", buf, 0x1Cu);

          self = v65;
        }

        uint64_t v23 = &objc_retain_x28_ptr;
      }
      else
      {
        id v67 = 0;
      }
      if ([v16 ipv6sCount])
      {
        NSErrorUserInfoKey v35 = (__CFString *)objc_alloc_init((Class)v23[173]);
        v63 = v35;
        if ([v16 ipv6sCount])
        {
          unint64_t v36 = 0;
          do
          {
            uint64_t v68 = 0;
            v69[0] = 0;
            int v70 = 0;
            v69[1] = 0;
            memset(buf, 0, 46);
            NSErrorUserInfoKey v37 = [v16 ipv6AtIndex:v36];
            LOWORD(v68) = 7696;
            v38 = [v37 ipAddress];
            [v38 getBytes:v69 length:16];

            if (inet_ntop(30, v69, (char *)buf, 0x10u))
            {
              id v39 = [objc_alloc((Class)NSString) initWithCString:buf encoding:1];
              [(__CFString *)v35 addObject:v39];
              if (!v18)
              {
                id v40 = [APSDNSCacheEntry alloc];
                __int16 v41 = [v66 hostname];
                id v18 = [(APSDNSCacheEntry *)v40 initWithHostname:v41];

                NSErrorUserInfoKey v35 = v63;
                [(NSMutableArray *)v65->_dnsCache addObject:v18];
              }
              -[APSDNSCacheEntry addCacheIPAddress:addressFamily:timeToLive:](v18, "addCacheIPAddress:addressFamily:timeToLive:", v39, 2, (double)[v37 ttl]);
            }
            ++v36;
          }
          while ((unint64_t)[v16 ipv6sCount] > v36);
        }
        id v42 = +[APSLog taskManager];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v43 = [v16 ipv6sCount];
          id v44 = [v7 dnsRequest];
          __int16 v45 = [v44 hostname];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v45;
          *(_WORD *)&buf[18] = 2112;
          *(void *)&buf[20] = v63;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Received %u IPv6 addresses for hostname %@: %@", buf, 0x1Cu);
        }
        self = v65;
        long long v14 = v62;
      }
      else
      {
        v63 = 0;
      }
      if (self->_remoteDNSResponseHandler)
      {
        int v46 = [APSDNSResponse alloc];
        long long v47 = [v7 dnsRequest];
        v48 = [v47 hostname];
        v49 = [v67 componentsJoinedByString:@","];
        v50 = [(__CFString *)v63 componentsJoinedByString:@","];
        id v51 = [(APSDNSResponse *)v46 initResponseForHostname:v48 ipv4Address:v49 ipv6Address:v50];

        self = v65;
        id remoteDNSResponseHandler = (void (**)(id, void *, id, void))v65->_remoteDNSResponseHandler;
        v53 = [v7 dnsRequest];
        v54 = [v53 hostname];
        remoteDNSResponseHandler[2](remoteDNSResponseHandler, v54, v51, 0);

        long long v14 = v62;
      }
      if ([(TASKNotifyRequest *)v14 hasIsLast] && [(TASKNotifyRequest *)v14 isLast])
      {
        v55 = +[APSLog taskManager];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          [(TASKNotifyRequest *)v14 description];
          v57 = v56 = v14;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v57;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Received last notification for task, removing the task: %@", buf, 0xCu);

          long long v14 = v56;
        }

        [(NSMutableArray *)self->_outstandingTaskList removeObject:v7];
      }
      id v13 = 0;
      NSErrorDomain v22 = v63;
    }
    else
    {
      v64 = v18;
      objc_super v20 = v14;
      [v7 setTaskStatus:4];
      id v21 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v71 = NSLocalizedDescriptionKey;
      id v67 = [v16 errorMessage];
      if (v67)
      {
        NSErrorDomain v22 = [v16 errorMessage];
      }
      else
      {
        NSErrorDomain v22 = @"Server returned an error in Task notification";
      }
      v72 = v22;
      v34 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      id v13 = [v21 initWithDomain:NSCocoaErrorDomain code:4610 userInfo:v34];

      long long v14 = v20;
      id v18 = v64;
      if (!v67) {
        goto LABEL_49;
      }
    }

LABEL_49:
    goto LABEL_50;
  }
  [v7 setTaskStatus:4];
  id v11 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
  CFStringRef v75 = @"Server received invalid input";
  id v12 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  id v13 = [v11 initWithDomain:NSCocoaErrorDomain code:4866 userInfo:v12];
LABEL_51:

LABEL_52:
  if ([v7 taskStatus] == (id)4)
  {
    if ([v7 taskType] == (id)1)
    {
      v58 = (void (**)(id, void *, void, id))self->_remoteDNSResponseHandler;
      if (v58)
      {
        v59 = [v7 dnsRequest];
        v60 = [v59 hostname];
        v58[2](v58, v60, 0, v13);
      }
    }
    [(NSMutableArray *)self->_outstandingTaskList removeObject:v7];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (APSDaemon)daemon
{
  return self->_daemon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong(&self->_remoteDNSResponseHandler, 0);
  objc_storeStrong((id *)&self->_dnsCache, 0);
  objc_storeStrong((id *)&self->_outstandingTaskList, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end