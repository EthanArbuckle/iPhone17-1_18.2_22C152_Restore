@interface HDClinicalEntitySyncAnchor
+ (id)nextClinicalAccountSyncAnchorWithProfile:(id)a3 error:(id *)a4;
+ (id)nextClinicalGatewaySyncAnchorWithProfile:(id)a3 error:(id *)a4;
+ (id)nextSyncAnchorWithProfile:(id)a3 key:(id)a4 error:(id *)a5;
@end

@implementation HDClinicalEntitySyncAnchor

+ (id)nextClinicalAccountSyncAnchorWithProfile:(id)a3 error:(id *)a4
{
  return [a1 nextSyncAnchorWithProfile:a3 key:@"ClinicalAccountNextSyncAnchor" error:a4];
}

+ (id)nextClinicalGatewaySyncAnchorWithProfile:(id)a3 error:(id *)a4
{
  return [a1 nextSyncAnchorWithProfile:a3 key:@"ClinicalGatewayNextSyncAnchor" error:a4];
}

+ (id)nextSyncAnchorWithProfile:(id)a3 key:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)HDKeyValueDomain) initWithCategory:100 domainName:@"com.apple.health.records.syncanchors" profile:v8];

  id v16 = 0;
  v10 = [v9 numberForKey:v7 error:&v16];
  id v11 = v16;
  v12 = v11;
  if (v10)
  {
LABEL_2:
    v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v10 longLongValue] + 1);
    if ([v9 setNumber:v13 forKey:v7 error:a5]) {
      v14 = v10;
    }
    else {
      v14 = 0;
    }

    goto LABEL_9;
  }
  if (!v11)
  {
    v10 = &off_11CEB8;
    goto LABEL_2;
  }
  if (a5)
  {
    v14 = 0;
    *a5 = v11;
  }
  else
  {
    _HKLogDroppedError();
    v14 = 0;
  }
LABEL_9:

  return v14;
}

@end