@interface STStorageLocalStorageController
- (id)createCollection;
- (void)deleteItems:(id)a3;
@end

@implementation STStorageLocalStorageController

- (id)createCollection
{
  v3 = [*(id *)&self->super.PSEditableListController_opaque[OBJC_IVAR___PSViewController__specifier] propertyForKey:STStorageAppKey];
  v4 = [v3 fpDomain];
  if (v4)
  {
    v5 = STStorageDeviceKey();
    v6 = +[NSString stringWithFormat:@"LOCAL_FILES_TITLE_%@", v5];
    v7 = STStorageLocStr(v6);
    v8 = [(STStorageLocalStorageController *)self navigationItem];
    [v8 setTitle:v7];

    [(STStorageFPFSController *)self setConfirmDelete:1];
    v9 = +[FPItemManager defaultManager];
    v10 = [v9 rootCollectionForProviderDomain:v4];

    v11 = +[FPItemManager defaultManager];
    v12 = [v11 trashCollectionForProviderDomain:v4];

    id v13 = objc_alloc((Class)FPUnionCollection);
    v18[0] = v10;
    v18[1] = v12;
    v14 = +[NSArray arrayWithObjects:v18 count:2];
    id v15 = [v13 initWithCollections:v14];
  }
  else
  {
    v16 = [v3 name];
    NSLog(@"No file provider specified for %@", v16);

    id v15 = 0;
  }

  return v15;
}

- (void)deleteItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    v7 = STStorageLocStr(@"CONFIRM_DELETE_TITLE");
    v8 = STStorageDeviceKey();
    v9 = +[NSString stringWithFormat:@"CONFIRM_DELETE_LOCAL_%@", v8];
    v10 = STStorageLocStr(v9);

    if ((unint64_t)[v4 count] >= 2)
    {
      v11 = STStorageLocStr(@"CONFIRM_DELETE_MULTIPLE_TITLE");
      uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, [v4 count]);

      id v13 = STStorageDeviceKey();
      v14 = +[NSString stringWithFormat:@"CONFIRM_DELETE_MULTIPLE_LOCAL_%@", v13];
      uint64_t v15 = STStorageLocStr(v14);

      v10 = (void *)v15;
      v7 = (void *)v12;
    }
    BOOL v16 = v6 == 0;
    v17 = +[UIAlertController alertControllerWithTitle:v7 message:v10 preferredStyle:0];
    v18 = STStorageLocStr(@"OK");
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_5BC4;
    v32[3] = &unk_2CAB8;
    id v33 = v4;
    v19 = +[UIAlertAction actionWithTitle:v18 style:2 handler:v32];

    v20 = STStorageLocStr(@"CANCEL");
    v21 = +[UIAlertAction actionWithTitle:v20 style:v16 handler:0];

    [v17 addAction:v19];
    [v17 addAction:v21];
    v22 = [(STStorageLocalStorageController *)self table];
    v23 = [v17 popoverPresentationController];
    if (v23)
    {
      [v22 frame];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      [v23 setSourceView:v22];
      objc_msgSend(v23, "setSourceRect:", v25 + v29 * 0.5, v27 + v31 * 0.5, 0.0, 0.0);
      [v23 setPermittedArrowDirections:0];
    }

    [(STStorageLocalStorageController *)self presentViewController:v17 animated:1 completion:0];
  }
}

@end