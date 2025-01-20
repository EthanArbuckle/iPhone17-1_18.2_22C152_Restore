@interface InAppReceiptDatabaseShared
+ (id)databasePathsForBundleID:(id)a3 error:(id *)a4;
@end

@implementation InAppReceiptDatabaseShared

+ (id)databasePathsForBundleID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v17 = 0;
  id v6 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:&v17];

  id v7 = v17;
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    if (a4) {
      *a4 = v7;
    }
  }
  else
  {
    v10 = [v6 dataContainerURL];
    v11 = [v10 path];

    if (v11)
    {
      v12 = [v11 stringByAppendingPathComponent:@"/Library/Caches/StoreKit/"];
      v13 = [v12 stringByAppendingPathComponent:@"receipts.db"];
      v18[0] = v13;
      v14 = [v12 stringByAppendingPathComponent:@"receipts.db-shm"];
      v18[1] = v14;
      v15 = [v12 stringByAppendingPathComponent:@"receipts.db-wal"];
      v18[2] = v15;
      v9 = +[NSArray arrayWithObjects:v18 count:3];
    }
    else if (a4)
    {
      ASDErrorWithTitleAndMessage();
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

@end