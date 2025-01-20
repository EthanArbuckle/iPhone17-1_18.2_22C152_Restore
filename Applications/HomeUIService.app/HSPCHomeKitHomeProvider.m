@interface HSPCHomeKitHomeProvider
- (id)loadData;
- (id)userFacingStringForItem:(id)a3;
@end

@implementation HSPCHomeKitHomeProvider

- (id)loadData
{
  objc_initWeak(&location, self);
  v2 = +[HFHomeKitDispatcher sharedDispatcher];
  v3 = [v2 allHomesFuture];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100059C70;
  v6[3] = &unk_1000AB330;
  objc_copyWeak(&v7, &location);
  v4 = [v3 addSuccessBlock:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

- (id)userFacingStringForItem:(id)a3
{
  return [a3 name];
}

@end