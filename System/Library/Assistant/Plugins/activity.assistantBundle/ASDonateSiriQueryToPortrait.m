@interface ASDonateSiriQueryToPortrait
- (void)performWithCompletion:(id)a3;
@end

@implementation ASDonateSiriQueryToPortrait

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(ASDonateSiriQueryToPortrait *)self originalQuery];
  v6 = [(ASDonateSiriQueryToPortrait *)self qid];
  if (v5)
  {
    v7 = [(ASDonateSiriQueryToPortrait *)self domain];

    if (v7)
    {
      id v8 = objc_alloc((Class)PPSiriQueryResult);
      v9 = [(ASDonateSiriQueryToPortrait *)self domain];
      [(ASDonateSiriQueryToPortrait *)self rankerConfidence];
      v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      id v11 = [v8 initWithQid:v6 domain:v9 confidence:v10];

      id v20 = v11;
      v12 = +[NSArray arrayWithObjects:&v20 count:1];
      id v19 = 0;
      LODWORD(v10) = +[PPCustomDonation donateSiriQuery:v5 results:v12 error:&v19];
      id v13 = v19;

      if (v10)
      {

LABEL_11:
        if (!v4)
        {
          v14 = 0;
          goto LABEL_14;
        }
        id v17 = objc_alloc_init((Class)SACommandSucceeded);
        v14 = 0;
        goto LABEL_13;
      }
      v15 = [v13 localizedDescription];
      v14 = +[NSString stringWithFormat:@"donation failed: %@", v15];

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
      v14 = @"domain is missing";
    }
  }
  else
  {
    v14 = @"originalQuery is missing";
  }
  v16 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    sub_74C0((uint64_t)v14, v16);
    if (!v4) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (v4)
  {
LABEL_10:
    id v17 = [objc_alloc((Class)SACommandFailed) initWithReason:v14];
LABEL_13:
    v18 = [v17 dictionary];
    v4[2](v4, v18);
  }
LABEL_14:
}

@end