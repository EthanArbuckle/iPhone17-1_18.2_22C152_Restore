@interface DTTapFactory
+ (id)defaultFactory;
- (id)createNewTapWithConfig:(id)a3 connection:(id)a4 options:(id)a5;
@end

@implementation DTTapFactory

+ (id)defaultFactory
{
  if (qword_268707FB0 != -1) {
    dispatch_once(&qword_268707FB0, &unk_26E515708);
  }
  v2 = (void *)sTapFactory;
  return v2;
}

- (id)createNewTapWithConfig:(id)a3 connection:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v16 = 0;
    goto LABEL_46;
  }
  v10 = (void *)[v7 copy];
  v11 = [v9 objectForKeyedSubscript:@"DTTap_Option_MessageArchiveFileURL"];
  v12 = [v10 serviceName];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v9;
    id v13 = v10;
    uint64_t v14 = objc_opt_new();
    if (!v8)
    {
      v26 = [[DTKTraceTapLocalDelegate alloc] initWithConfig:v13];
      v19 = 0;
      int v15 = -1;
LABEL_35:

      if (v11)
      {
        if (v19) {
          sub_23093DC20();
        }
        v19 = [[DTTapMessageHandlerArchiver alloc] initWithConfig:v10 archiveURL:v11];
      }
      v23 = [[DTTapMemoHandler alloc] initWithConfig:v10 delegate:v14];
      v20 = (void *)v14;
      if (v8)
      {
        if (v12)
        {
          [v10 setServiceName:v12];
          [v10 setServiceVersion:v15];
          v24 = [[DTTapRemote alloc] initWithConfig:v10 memoHandler:v23 messageHandler:v19 connection:v8];
        }
        else
        {
          v24 = 0;
        }
        v21 = v26;
      }
      else
      {
        v21 = v26;
        v24 = [[DTTapLocal alloc] initWithConfig:v10 memoHandler:v23 delegate:v26];
      }
      v16 = v24;

      id v9 = v27;
      goto LABEL_45;
    }
    if (v12)
    {
      int v15 = [v8 remoteCapabilityVersion:v12];
      if (v15 <= 0)
      {

LABEL_23:
        v19 = 0;
        v12 = 0;
LABEL_27:
        v26 = 0;
        goto LABEL_35;
      }
    }
    else
    {
      v12 = @"com.apple.instruments.server.services.coreprofilesessiontap";
      int v15 = [v8 remoteCapabilityVersion:@"com.apple.instruments.server.services.coreprofilesessiontap"];
      if (v15 < 1) {
        goto LABEL_23;
      }
    }
    if (v11) {
      v19 = 0;
    }
    else {
      v19 = [[DTKTraceTapMessageHandler alloc] initWithConfig:v13];
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v9;
    id v17 = v10;
    uint64_t v18 = objc_opt_new();
    if (v8)
    {

      int v15 = [v8 remoteCapabilityVersion:@"com.apple.instruments.server.services.activitytracetap"];
      if (v15 >= 1)
      {
        if (v11) {
          v19 = 0;
        }
        else {
          v19 = [(DTTapMessageHandler *)[DTActivityTraceTapMessageHandler alloc] initWithConfig:v17];
        }
        v26 = 0;
        v12 = @"com.apple.instruments.server.services.activitytracetap";
        goto LABEL_34;
      }
      goto LABEL_25;
    }
    v22 = DTActivityTraceTapLocalDelegate;
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v9;
    id v17 = v10;
    uint64_t v18 = objc_opt_new();
    if (v8)
    {

      int v15 = [v8 remoteCapabilityVersion:@"com.apple.instruments.server.services.sysmontap"];
      if (v15 >= 1)
      {
        if (v11) {
          v19 = 0;
        }
        else {
          v19 = [(DTTapMessageHandler *)[DTSysmonTapMessageHandler alloc] initWithConfig:v17];
        }
        v26 = 0;
        v12 = @"com.apple.instruments.server.services.sysmontap";
        goto LABEL_34;
      }
LABEL_25:
      v19 = 0;
      v12 = 0;
      v26 = 0;
LABEL_34:
      uint64_t v14 = v18;
      goto LABEL_35;
    }
    v22 = DTSysmonTapLocalDelegate;
LABEL_29:
    v26 = (DTKTraceTapLocalDelegate *)[[v22 alloc] initWithConfig:v17];
    v19 = 0;
    int v15 = -1;
    goto LABEL_34;
  }
  v20 = 0;
  v19 = 0;
  v21 = 0;
  v16 = 0;
LABEL_45:

LABEL_46:
  return v16;
}

@end