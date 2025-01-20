@interface GEOWiFiQualityServiceServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (void)cancelWithMessage:(id)a3;
- (void)submitWithMessage:(id)a3;
- (void)tileWithMessage:(id)a3;
@end

@implementation GEOWiFiQualityServiceServer

+ (id)identifier
{
  return @"wifiqualsvc";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  int v12 = sub_100008D68(a3);
  switch(v12)
  {
    case 430:
      id v16 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v10 peer:v11];
      v14 = v16;
      BOOL v15 = v16 != 0;
      if (v16)
      {
        [v16 setSignpostId:a6];
        [(GEOWiFiQualityServiceServer *)self tileWithMessage:v14];
        goto LABEL_10;
      }
      break;
    case 614:
      id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v10 peer:v11];
      v14 = v17;
      BOOL v15 = v17 != 0;
      if (v17)
      {
        [v17 setSignpostId:a6];
        [(GEOWiFiQualityServiceServer *)self cancelWithMessage:v14];
        goto LABEL_10;
      }
      break;
    case 660:
      id v13 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v10 peer:v11];
      v14 = v13;
      BOOL v15 = v13 != 0;
      if (v13)
      {
        [v13 setSignpostId:a6];
        [(GEOWiFiQualityServiceServer *)self submitWithMessage:v14];
LABEL_10:
        BOOL v15 = 1;
      }
      break;
    default:
      BOOL v15 = 0;
      goto LABEL_13;
  }

LABEL_13:
  return v15;
}

- (void)submitWithMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"wifireq"];

  v6 = [v3 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"wifireqid"];

  id v8 = [objc_alloc((Class)GEOWiFiQualityServiceRequest) initWithData:v5];
  v9 = +[GEOWiFiQualityServiceManager sharedManager];
  id v10 = [v3 preferredAuditToken];
  id v11 = +[GEOXPCConnection defaultXPCServerConnectionQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003733C;
  v13[3] = &unk_100072A20;
  id v14 = v3;
  id v12 = v3;
  [v9 submitWiFiQualityServiceRequest:v8 requestId:v7 auditToken:v10 completionQueue:v11 completion:v13];
}

- (void)tileWithMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"wifitk"];

  v6 = [v3 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"wifiet"];

  id v8 = [v3 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"wifireqid"];

  id v10 = +[GEOWiFiQualityServiceManager sharedManager];
  id v11 = [v3 preferredAuditToken];
  id v12 = +[GEOXPCConnection defaultXPCServerConnectionQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000375D0;
  v14[3] = &unk_100072A48;
  id v15 = v3;
  id v13 = v3;
  [v10 submitWiFiQualityTileLoadForKey:v5 eTag:v7 requestId:v9 auditToken:v11 completionQueue:v12 completion:v14];
}

- (void)cancelWithMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 userInfo];
  id v6 = [v4 objectForKeyedSubscript:@"wifireqid"];

  v5 = +[GEOWiFiQualityServiceManager sharedManager];
  [v5 cancelRequestId:v6];

  [v3 sendReply:0];
}

@end