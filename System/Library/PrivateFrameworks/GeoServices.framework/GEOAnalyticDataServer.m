@interface GEOAnalyticDataServer
+ (id)identifier;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOAnalyticDataServer)initWithDaemon:(id)a3;
- (void)readNetEventDataWithMessage:(id)a3;
- (void)readReqRespMetadataWithMessage:(id)a3;
@end

@implementation GEOAnalyticDataServer

+ (id)identifier
{
  return @"analyticdata";
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  if (v13 != 1919)
  {
    if (v13 != 1599)
    {
      BOOL v16 = 0;
      goto LABEL_13;
    }
    if (sub_100019858(v12, v11, @"analyticdata", v10, &off_100077C60, 0))
    {
      id v14 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v15 = v14;
      BOOL v16 = v14 != 0;
      if (v14)
      {
        [v14 setSignpostId:a6];
        [(GEOAnalyticDataServer *)self readNetEventDataWithMessage:v15];
LABEL_9:
        BOOL v16 = 1;
        goto LABEL_10;
      }
      goto LABEL_10;
    }
LABEL_12:
    BOOL v16 = 1;
    goto LABEL_13;
  }
  if (!sub_100019858(v12, v11, @"analyticdata", v10, &off_100077C78, 0)) {
    goto LABEL_12;
  }
  id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
  v15 = v17;
  BOOL v16 = v17 != 0;
  if (v17)
  {
    [v17 setSignpostId:a6];
    [(GEOAnalyticDataServer *)self readReqRespMetadataWithMessage:v15];
    goto LABEL_9;
  }
LABEL_10:

LABEL_13:
  return v16;
}

- (GEOAnalyticDataServer)initWithDaemon:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEOAnalyticDataServer;
  return [(GEOAnalyticDataServer *)&v4 initWithDaemon:a3];
}

- (void)readNetEventDataWithMessage:(id)a3
{
  id v10 = a3;
  v3 = [v10 userInfo];
  objc_super v4 = [v3 objectForKeyedSubscript:@"day"];

  if (v4)
  {
    v5 = +[GEOAnalyticsDataService sharedService];
    int v6 = [v5 networkEventFileDescriptorForRepresentativeDate:v4];

    if ((v6 & 0x80000000) == 0)
    {
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_fd(empty, "fd", v6);
      [v10 sendReplyWithXPCUserInfo:empty];
      close(v6);
      goto LABEL_7;
    }
    uint64_t v8 = -8;
  }
  else
  {
    uint64_t v8 = -10;
  }
  empty = +[NSError GEOErrorWithCode:v8];
  v9 = +[NSDictionary _geo_replyDictionaryForError:empty key:@"err"];
  [v10 sendReply:v9];

LABEL_7:
}

- (void)readReqRespMetadataWithMessage:(id)a3
{
  id v11 = a3;
  v3 = [v11 userInfo];
  objc_super v4 = [v3 objectForKeyedSubscript:@"bid"];

  if (v4)
  {
    id v5 = [v4 longLongValue];
    int v6 = +[GEOAnalyticsDataService sharedService];
    int v7 = [v6 requestResponseMetadataFileDescriptorForBatchID:v5];

    if ((v7 & 0x80000000) == 0)
    {
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_fd(empty, "fd", v7);
      [v11 sendReplyWithXPCUserInfo:empty];
      close(v7);
      goto LABEL_7;
    }
    uint64_t v9 = -8;
  }
  else
  {
    uint64_t v9 = -10;
  }
  empty = +[NSError GEOErrorWithCode:v9];
  id v10 = +[NSDictionary _geo_replyDictionaryForError:empty key:@"err"];
  [v11 sendReply:v10];

LABEL_7:
}

@end