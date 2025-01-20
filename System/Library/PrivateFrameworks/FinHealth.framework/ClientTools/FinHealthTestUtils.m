@interface FinHealthTestUtils
+ (id)convertToFHTransaction:(id)a3;
+ (id)transactionsFromJsonFile:(id)a3;
@end

@implementation FinHealthTestUtils

+ (id)convertToFHTransaction:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 amount];
  if (v5) {
    [v3 amount];
  }
  else {
  v6 = +[NSDecimalNumber zero];
  }
  [v4 setAmount:v6];

  v7 = [v3 transactionDate];
  [v4 setTransactionDate:v7];

  v8 = [v3 identifier];
  [v4 setIdentifier:v8];

  return v4;
}

+ (id)transactionsFromJsonFile:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    v5 = +[NSData dataWithContentsOfFile:v3];
    id v20 = 0;
    v6 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v20];
    id v7 = v20;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_10000501C;
    v18 = sub_10000502C;
    id v19 = 0;
    if (v6)
    {
      uint64_t v8 = objc_opt_new();
      v9 = (void *)v15[5];
      v15[5] = v8;

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005034;
      v13[3] = &unk_1000086B8;
      v13[4] = &v14;
      [v6 enumerateObjectsUsingBlock:v13];
      uint64_t v10 = v15[5];
    }
    else
    {
      uint64_t v10 = 0;
    }
    v11 = +[NSArray arrayWithArray:v10];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    printf("jsonFile :%s does not exist\n", (const char *)[v3 UTF8String]);
    v11 = 0;
  }

  return v11;
}

@end