@interface BRBaseWorkingSetEnumerator
+ (id)initialSyncAnchor;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation BRBaseWorkingSetEnumerator

+ (id)initialSyncAnchor
{
  return +[NSData dataWithBytes:"initialSyncAnchor" length:17];
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v4 = a3;
  v5 = +[BRDaemonConnection defaultConnection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002A478;
  v11[3] = &unk_100044728;
  id v6 = v4;
  id v12 = v6;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A484;
  v9[3] = &unk_1000455B8;
  id v10 = v6;
  id v8 = v6;
  [v7 currentNotifRankWithReply:v9];
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 suggestedBatchSize];
  if ((unint64_t)v7 >= 0xC8) {
    uint64_t v8 = 200;
  }
  else {
    uint64_t v8 = (uint64_t)v7;
  }
  v9 = +[BRDaemonConnection defaultConnection];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002A734;
  v19[3] = &unk_100044728;
  id v10 = v5;
  id v20 = v10;
  v11 = [v9 remoteObjectProxyWithErrorHandler:v19];
  id v12 = [(id)objc_opt_class() initialSyncAnchor];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002A740;
  v16[3] = &unk_1000455E0;
  if ([v6 isEqualToData:v12]) {
    id v13 = 0;
  }
  else {
    id v13 = v6;
  }
  id v17 = v10;
  id v18 = v6;
  id v14 = v6;
  id v15 = v10;
  [v11 enumerateWorkingSetChangesFromChangeToken:v13 limit:v8 completion:v16];
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() initialSyncAnchor];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

@end