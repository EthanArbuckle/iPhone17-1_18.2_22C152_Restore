@interface GEOExperimentServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
+ (void)submitBackgroundTasksNeededDuringDaemonStart;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOExperimentServer)initWithDaemon:(id)a3;
- (void)fetchAllExperimentsWithMessage:(id)a3;
- (void)fetchAssignUUIDSyncWithMessage:(id)a3;
- (void)fetchAssignUUIDWithMessage:(id)a3;
- (void)refreshDatasetWithMessage:(id)a3;
- (void)runBackgroundTask:(id)a3;
- (void)setActiveBranchWithMessage:(id)a3;
- (void)setBucketIdWithMessage:(id)a3;
- (void)setQuerySubstringWithMessage:(id)a3;
- (void)updateWithMessage:(id)a3;
@end

@implementation GEOExperimentServer

+ (id)identifier
{
  return @"experiments";
}

+ (unint64_t)launchMode
{
  return 1;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077780;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 > 1525)
  {
    if (v13 > 1858)
    {
      if (v13 == 1859)
      {
        id v23 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v23;
        BOOL v14 = v23 != 0;
        if (v23)
        {
          [v23 setSignpostId:a6];
          [(GEOExperimentServer *)self fetchAssignUUIDSyncWithMessage:v16];
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      if (v13 != 1975) {
        goto LABEL_35;
      }
      if (sub_100019858(v12, v11, @"experiments", v10, &off_1000777E0, 0))
      {
        id v19 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v19;
        BOOL v14 = v19 != 0;
        if (v19)
        {
          [v19 setSignpostId:a6];
          [(GEOExperimentServer *)self fetchAllExperimentsWithMessage:v16];
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
    else
    {
      if (v13 != 1526)
      {
        if (v13 == 1827)
        {
          if (sub_100019858(v12, v11, @"experiments", v10, &off_100077798, 0))
          {
            id v17 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
            v16 = v17;
            BOOL v14 = v17 != 0;
            if (v17)
            {
              [v17 setSignpostId:a6];
              [(GEOExperimentServer *)self setQuerySubstringWithMessage:v16];
              goto LABEL_33;
            }
LABEL_34:

            goto LABEL_35;
          }
          goto LABEL_28;
        }
        goto LABEL_35;
      }
      if (sub_100019858(v12, v11, @"experiments", v10, &off_1000777B0, 0))
      {
        id v21 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v21;
        BOOL v14 = v21 != 0;
        if (v21)
        {
          [v21 setSignpostId:a6];
          [(GEOExperimentServer *)self setActiveBranchWithMessage:v16];
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
LABEL_28:
    BOOL v14 = 1;
    goto LABEL_35;
  }
  if (v13 > 1445)
  {
    if (v13 == 1446)
    {
      id v22 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v22;
      BOOL v14 = v22 != 0;
      if (v22)
      {
        [v22 setSignpostId:a6];
        [(GEOExperimentServer *)self fetchAssignUUIDWithMessage:v16];
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (v13 == 1461)
    {
      id v18 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v18;
      BOOL v14 = v18 != 0;
      if (v18)
      {
        [v18 setSignpostId:a6];
        [(GEOExperimentServer *)self refreshDatasetWithMessage:v16];
        goto LABEL_33;
      }
      goto LABEL_34;
    }
  }
  else
  {
    if (v13 == 643)
    {
      id v20 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
      v16 = v20;
      BOOL v14 = v20 != 0;
      if (v20)
      {
        [v20 setSignpostId:a6];
        [(GEOExperimentServer *)self updateWithMessage:v16];
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (v13 == 1111)
    {
      if (sub_100019858(v12, v11, @"experiments", v10, &off_1000777C8, 0))
      {
        id v15 = [objc_alloc((Class)GEOMessage) initWithXPCMessage:v11 peer:v12];
        v16 = v15;
        BOOL v14 = v15 != 0;
        if (v15)
        {
          [v15 setSignpostId:a6];
          [(GEOExperimentServer *)self setBucketIdWithMessage:v16];
LABEL_33:
          BOOL v14 = 1;
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      goto LABEL_28;
    }
  }
LABEL_35:

  return v14;
}

- (GEOExperimentServer)initWithDaemon:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOExperimentServer;
  v3 = [(GEOExperimentServer *)&v7 initWithDaemon:a3];
  if (v3)
  {
    id v4 = +[GEOExperimentConfiguration sharedConfiguration];
    v5 = v3;
  }

  return v3;
}

- (void)updateWithMessage:(id)a3
{
  id v3 = +[GEOExperimentConfiguration sharedConfiguration];
  objc_msgSend(v3, "_debug_forceUpdate");
}

- (void)refreshDatasetWithMessage:(id)a3
{
  id v3 = [a3 userInfo];
  id v6 = [v3 objectForKeyedSubscript:@"datasetABStatus"];

  id v4 = [objc_alloc((Class)GEOPDDatasetABStatus) initWithData:v6];
  v5 = +[GEOExperimentConfiguration sharedConfiguration];
  [v5 refreshDatasetABStatus:v4];
}

- (void)setQuerySubstringWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v10 = [v4 objectForKey:@"type"];

  v5 = [v3 userInfo];
  id v6 = [v5 objectForKey:@"placeRequestType"];

  objc_super v7 = [v3 userInfo];

  v8 = [v7 objectForKey:@"querySubstring"];

  if (v10)
  {
    v9 = +[GEOExperimentConfiguration sharedConfiguration];
    objc_msgSend(v9, "_debug_setCustomQuerySubstring:forExperimentType:dispatcherRequestType:", v8, objc_msgSend(v10, "integerValue"), objc_msgSend(v6, "intValue"));
  }
}

- (void)setActiveBranchWithMessage:(id)a3
{
  id v3 = [a3 userInfo];
  id v5 = [v3 objectForKey:@"abdr"];

  id v4 = +[GEOExperimentConfiguration sharedConfiguration];
  [v4 _setActiveExperimentBranchDictionaryRepresentation:v5];
}

- (void)setBucketIdWithMessage:(id)a3
{
  id v3 = [a3 userInfo];
  id v5 = [v3 objectForKey:@"bucketIdDR"];

  id v4 = +[GEOExperimentConfiguration sharedConfiguration];
  objc_msgSend(v4, "_debug_setBucketIdDictionaryRepresentation:", v5);
}

- (void)fetchAllExperimentsWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOExperimentConfiguration sharedConfiguration];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EE34;
  v6[3] = &unk_100071C68;
  id v7 = v3;
  id v5 = v3;
  [v4 _fetchAllAvailableExperimentsResponse:v6];
}

- (void)fetchAssignUUIDWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOExperimentConfiguration sharedConfiguration];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EFBC;
  v6[3] = &unk_100071C90;
  id v7 = v3;
  id v5 = v3;
  [v4 abAssignUUIDWithCompletionHandler:v6];
}

- (void)fetchAssignUUIDSyncWithMessage:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOExperimentConfiguration sharedConfiguration];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F198;
  v6[3] = &unk_100071C90;
  id v7 = v3;
  id v5 = v3;
  [v4 abAssignUUIDWithSyncCompletionHandler:v6];
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = [v4 identifier];
  if ([v6 isEqualToString:GEOExperimentServerLocalProxyBackgroundTaskIdentifier])
  {
  }
  else
  {
    id v7 = [v4 identifier];
    unsigned int v8 = [v7 isEqualToString:GEOExperimentServerLocalProxyBackgroundTaskRetryIdentifier];

    if (!v8)
    {
      v11.receiver = self;
      v11.super_class = (Class)GEOExperimentServer;
      [(GEOExperimentServer *)&v11 runBackgroundTask:v4];
      goto LABEL_6;
    }
  }
  id v9 = v4;
  id v10 = +[GEOExperimentConfiguration sharedConfiguration];
  [v10 forceUpdate:v9];

LABEL_6:
}

+ (void)submitBackgroundTasksNeededDuringDaemonStart
{
  id v2 = +[GEOExperimentConfiguration sharedConfiguration];
  [v2 submitBackgroundTasksNeededDuringDaemonStart];
}

@end