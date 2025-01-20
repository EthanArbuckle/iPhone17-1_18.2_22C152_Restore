@interface ASDEphemeralRequest
- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4;
@end

@implementation ASDEphemeralRequest

- (void)startUsingProxy:(id)a3 withErrorHandler:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() requestType];
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained(v6 + 1);
    v10 = WeakRetained;
    if (WeakRetained)
    {
      v11 = (void *)*((void *)WeakRetained + 1);
      goto LABEL_4;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
LABEL_4:
  id v12 = v11;
  v13 = [(ASDEphemeralRequest *)self options];
  id v14 = v12;
  id v15 = v13;
  switch((unint64_t)v8)
  {
    case 0uLL:
      v16 = AccountLookupRequestTask;
      goto LABEL_23;
    case 1uLL:
      v16 = CompleteCoordinatorsRequestTask;
      goto LABEL_23;
    case 2uLL:
      v16 = CreatePlaceholdersRequestTask;
      goto LABEL_23;
    case 3uLL:
      v16 = ExternalManifestRequestTask;
      goto LABEL_23;
    case 4uLL:
      v16 = IAPInfoRequestTask;
      goto LABEL_23;
    case 5uLL:
      v16 = IAPInfoUpdateRequestTask;
      goto LABEL_23;
    case 6uLL:
      v16 = LegacyManifestRequestTask;
      goto LABEL_23;
    case 7uLL:
      v16 = LaunchableAppRequestTask;
      goto LABEL_23;
    case 8uLL:
      id v17 = [[MigrationRequestTask alloc] initForClient:v14 withOptions:v15];
      v19 = [v14 clientID];
      if (v17) {
        objc_setProperty_atomic_copy(v17, v18, v19, 64);
      }

      break;
    case 9uLL:
      v16 = PostBulletinRequestTask;
      goto LABEL_23;
    case 0xAuLL:
      v16 = PurchaseRequestTask;
      goto LABEL_23;
    case 0xBuLL:
      v16 = PurgeableAppRequestTask;
      goto LABEL_23;
    case 0xCuLL:
      v16 = PurgeAppsRequestTask;
      goto LABEL_23;
    case 0xDuLL:
      v16 = PushCacheDeleteUpdateRequestTask;
      goto LABEL_23;
    case 0xEuLL:
      v16 = RestoreApplicationsRequestTask;
      goto LABEL_23;
    case 0xFuLL:
      v16 = RestoreDemotedApplicationsRequestTask;
LABEL_23:
      id v17 = [[v16 alloc] initForClient:v14 withOptions:v15];
      break;
    default:
      id v17 = 0;
      break;
  }

  objc_initWeak(&location, v17);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000EF9C;
  v22[3] = &unk_10052D848;
  objc_copyWeak(&v25, &location);
  v22[4] = self;
  v20 = v6;
  v23 = v20;
  id v21 = v7;
  id v24 = v21;
  [v17 setCompletionBlock:v22];
  if (v6) {
    v6 = (id *)objc_loadWeakRetained(v20 + 1);
  }
  sub_100010FF4((uint64_t)v6, v17);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

@end