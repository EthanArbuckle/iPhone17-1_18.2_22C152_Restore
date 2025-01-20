@interface HSPCCHIPPartnerRoomProvider
- (id)loadData;
- (id)userFacingStringForItem:(id)a3;
- (unint64_t)initialRowIndex;
@end

@implementation HSPCCHIPPartnerRoomProvider

- (id)loadData
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HSPCDataProvider *)self config];
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (!v6)
    {
      v7 = +[NSAssertionHandler currentHandler];
      v8 = +[NSString stringWithUTF8String:"id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"];
      [v7 handleFailureInFunction:v8, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v3, objc_opt_class() file lineNumber description];
    }
  }
  else
  {
    id v6 = 0;
  }

  v9 = [v6 selectedPartnerHome];
  if (v9)
  {
    id v10 = [v6 targetEcosystem];
    if (v10)
    {
      objc_initWeak(&location, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10005BC28;
      v19[3] = &unk_1000A98B8;
      id v10 = v10;
      id v20 = v10;
      id v21 = v9;
      v11 = +[NAFuture futureWithCompletionHandlerAdapterBlock:v19];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10005BC98;
      v17[3] = &unk_1000A9308;
      objc_copyWeak(&v18, &location);
      v12 = [v11 flatMap:v17];
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    else
    {
      v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100068DCC(v14);
      }

      v15 = +[NSError hmfErrorWithCode:8];
      v12 = +[NAFuture futureWithError:v15];
    }
  }
  else
  {
    v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100068D88(v13);
    }

    id v10 = +[NSError hmfErrorWithCode:8];
    v12 = +[NAFuture futureWithError:v10];
  }

  return v12;
}

- (id)userFacingStringForItem:(id)a3
{
  return [a3 name];
}

- (unint64_t)initialRowIndex
{
  v2 = [(HSPCDataProvider *)self items];
  unint64_t v3 = (unint64_t)[v2 count] >> 1;

  return v3;
}

@end