@interface STStorageLocalStorageController
- (id)createCollection;
- (void)deleteItems:(id)a3;
@end

@implementation STStorageLocalStorageController

- (id)createCollection
{
  v36.receiver = self;
  v36.super_class = (Class)STStorageLocalStorageController;
  v3 = [(STStorageFPFSController *)&v36 storageApp];
  v4 = +[STFileProviderMonitor sharedMonitor];
  v5 = [v4 fpDomains];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v33;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v33 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      v12 = [v11 topLevelBundleIdentifier];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [v11 providerID];
      }
      v15 = v14;

      v16 = [v3 bundleIdentifier];
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        id v18 = v11;

        if (!v18) {
          goto LABEL_16;
        }
        v19 = STStorageDeviceKey();
        v20 = STLocalizedString(@"On My Device");
        if ([v19 isEqualToString:@"PHONE"])
        {
          v21 = @"On My iPhone";
        }
        else if ([v19 isEqualToString:@"PAD"])
        {
          v21 = @"On My iPad";
        }
        else
        {
          if (![v19 isEqualToString:@"IPOD"])
          {
LABEL_22:
            v24 = [(STStorageLocalStorageController *)self navigationItem];
            [v24 setTitle:v20];

            [(STStorageFPFSController *)self setConfirmDelete:1];
            v25 = +[FPItemManager defaultManager];
            v26 = [v25 rootCollectionForProviderDomain:v18];

            v27 = +[FPItemManager defaultManager];
            v28 = [v27 trashCollectionForProviderDomain:v18];

            id v29 = objc_alloc((Class)FPUnionCollection);
            v37[0] = v26;
            v37[1] = v28;
            v30 = +[NSArray arrayWithObjects:v37 count:2];
            id v22 = [v29 initWithCollections:v30];

            goto LABEL_23;
          }
          v21 = @"On My iPod touch";
        }
        uint64_t v23 = STLocalizedString(v21);

        v20 = (void *)v23;
        goto LABEL_22;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_12:

LABEL_16:
  id v18 = [v3 name];
  NSLog(@"No file provider specified for %@", v18);
  id v22 = 0;
LABEL_23:

  return v22;
}

- (void)deleteItems:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_12;
  }
  v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  id v7 = STStorageDeviceKey();
  id v8 = STLocalizedString(@"CONFIRM_DELETE_TITLE");
  uint64_t v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, [v4 count]);

  v10 = STLocalizedString(@"CONFIRM_DELETE_OTHER");
  v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, [v4 count]);

  if ([v7 isEqualToString:@"PHONE"])
  {
    v12 = @"CONFIRM_DELETE_PHONE";
LABEL_8:
    v13 = STLocalizedString(v12);
    uint64_t v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, [v4 count]);

    v11 = (void *)v14;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:@"PAD"])
  {
    v12 = @"CONFIRM_DELETE_PAD";
    goto LABEL_8;
  }
  if ([v7 isEqualToString:@"IPOD"])
  {
    v12 = @"CONFIRM_DELETE_IPOD";
    goto LABEL_8;
  }
LABEL_9:
  BOOL v15 = v6 == 0;
  v16 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:0];
  unsigned __int8 v17 = STLocalizedString(@"OK");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_12E60;
  v31[3] = &unk_967A8;
  id v32 = v4;
  id v18 = +[UIAlertAction actionWithTitle:v17 style:2 handler:v31];

  v19 = STLocalizedString(@"Cancel");
  v20 = +[UIAlertAction actionWithTitle:v19 style:v15 handler:0];

  [v16 addAction:v18];
  [v16 addAction:v20];
  v21 = [(STStorageLocalStorageController *)self table];
  id v22 = [v16 popoverPresentationController];
  if (v22)
  {
    [v21 frame];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    [v22 setSourceView:v21];
    objc_msgSend(v22, "setSourceRect:", v24 + v28 * 0.5, v26 + v30 * 0.5, 0.0, 0.0);
    [v22 setPermittedArrowDirections:0];
  }

  [(STStorageLocalStorageController *)self presentViewController:v16 animated:1 completion:0];
LABEL_12:
}

@end