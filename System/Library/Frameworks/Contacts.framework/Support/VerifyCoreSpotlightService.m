@interface VerifyCoreSpotlightService
+ (BOOL)verifyIndex;
+ (const)activityIdentifier;
+ (void)run;
@end

@implementation VerifyCoreSpotlightService

+ (const)activityIdentifier
{
  return "com.apple.contactsd.VerifyCoreSpotlightService";
}

+ (void)run
{
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
  NSLog(@"%@ is verifying CoreSpotlight index.", v3);

  if (([a1 verifyIndex] & 1) == 0)
  {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(@"%@ failed to verify CoreSpotlight index.", v4);
  }
}

+ (BOOL)verifyIndex
{
  v2 = +[IndexService sharedInstance];
  id v15 = 0;
  id v3 = [v2 verifyIndexLoggingSummary:1 error:&v15];
  id v4 = v15;

  if ([v4 code] == (id)1004)
  {
    BOOL v5 = 1;
    id v6 = [objc_alloc((Class)CNCountdownLatch) initWithStartingCount:1];
    v7 = +[IndexService sharedInstance];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10000E484;
    v13 = &unk_100024B98;
    id v14 = v6;
    id v8 = v6;
    [v7 reindexSearchableItemsWithIdentifiers:0 completionHandler:&v10];

    objc_msgSend(v8, "await", v10, v11, v12, v13);
  }
  else
  {
    BOOL v5 = v4 == 0;
  }

  return v5;
}

@end