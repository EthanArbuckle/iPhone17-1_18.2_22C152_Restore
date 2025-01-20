@interface ComfortSoundsDetailViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (ComfortSoundsDetailViewController)init;
- (NSArray)availableAssets;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)configureBarButton;
- (void)donePressed;
- (void)editPressed;
- (void)setAvailableAssets:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ComfortSoundsDetailViewController

- (ComfortSoundsDetailViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)ComfortSoundsDetailViewController;
  v2 = [(ComfortSoundsDetailViewController *)&v11 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXHAServer sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_545C;
    v8[3] = &unk_3C828;
    objc_copyWeak(&v9, &location);
    [v3 registerListener:v2 forComfortSoundsModelUpdatesHandler:v8];

    v4 = +[HUComfortSoundsSettings sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_5708;
    v6[3] = &unk_3C850;
    v7 = v2;
    [v4 registerUpdateBlock:v6 forRetrieveSelector:"selectedComfortSound" withListener:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ComfortSoundsDetailViewController;
  [(ComfortSoundsDetailViewController *)&v4 viewWillAppear:a3];
  [(ComfortSoundsDetailViewController *)self configureBarButton];
}

- (void)configureBarButton
{
  v3 = [(ComfortSoundsDetailViewController *)self availableAssets];
  id v4 = [v3 indexOfObjectPassingTest:&stru_3C890];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [(ComfortSoundsDetailViewController *)self navigationItem];
    [v10 setRightBarButtonItem:0];
  }
  else
  {
    unsigned __int8 v5 = [(ComfortSoundsDetailViewController *)self isEditing];
    id v6 = objc_allocWithZone((Class)UIBarButtonItem);
    if (v5)
    {
      v7 = "donePressed";
      uint64_t v8 = 0;
    }
    else
    {
      v7 = "editPressed";
      uint64_t v8 = 2;
    }
    id v10 = [v6 initWithBarButtonSystemItem:v8 target:self action:v7];
    id v9 = [(ComfortSoundsDetailViewController *)self navigationItem];
    [v9 setRightBarButtonItem:v10];
  }
}

- (void)editPressed
{
  [(ComfortSoundsDetailViewController *)self setEditing:1 animated:1];
  v3 = [(ComfortSoundsDetailViewController *)self table];
  [v3 setEditing:1 animated:1];

  [(ComfortSoundsDetailViewController *)self configureBarButton];
}

- (void)donePressed
{
  [(ComfortSoundsDetailViewController *)self setEditing:0 animated:1];
  v3 = [(ComfortSoundsDetailViewController *)self table];
  [v3 setEditing:0 animated:1];

  [(ComfortSoundsDetailViewController *)self configureBarButton];
  id v4 = [(ComfortSoundsDetailViewController *)self table];
  [v4 reloadData];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ComfortSoundsDetailViewController;
  -[ComfortSoundsDetailViewController setEditing:animated:](&v8, "setEditing:animated:");
  v7 = [(ComfortSoundsDetailViewController *)self table];
  [v7 setEditing:v5 animated:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  BOOL v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [objc_allocWithZone((Class)NSMutableArray) init];
    id v6 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v6];
    v7 = +[HUComfortSoundsSettings sharedInstance];
    objc_super v8 = [v7 selectedComfortSound];

    id v9 = +[NSMutableArray array];
    id v10 = [(ComfortSoundsDetailViewController *)self availableAssets];
    v19 = v10;
    if ([v10 count])
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_5C6C;
      v24[3] = &unk_3C8B8;
      id v25 = v9;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v24, v10);
    }
    else
    {
      for (uint64_t i = 1; i != 9; ++i)
      {
        v12 = +[HUComfortSound defaultComfortSoundForGroup:](HUComfortSound, "defaultComfortSoundForGroup:", i, v19);
        [v9 hcSafeAddObject:v12];
      }
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_5CCC;
    v20[3] = &unk_3C8E0;
    v20[4] = self;
    id v21 = v8;
    id v22 = v6;
    id v23 = v5;
    id v13 = v5;
    id v14 = v6;
    id v15 = v8;
    [v9 enumerateObjectsUsingBlock:v20];
    id v16 = [v13 copy];
    v17 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v16;

    BOOL v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)ComfortSoundsDetailViewController;
  id v6 = a4;
  [(ComfortSoundsDetailViewController *)&v20 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = -[ComfortSoundsDetailViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v20.receiver, v20.super_class);

  objc_super v8 = [v7 userInfo];
  if (([(ComfortSoundsDetailViewController *)self isEditing] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = [v9 asset];
      if (!v10
        || (objc_super v11 = (void *)v10,
            [v9 asset],
            v12 = objc_claimAutoreleasedReturnValue(),
            unsigned int v13 = [v12 isInstalled],
            v12,
            v11,
            v13))
      {
        id v14 = +[HUComfortSoundsSettings sharedInstance];
        [v14 setSelectedComfortSound:v9];
LABEL_11:

        [(ComfortSoundsDetailViewController *)self reloadSpecifiers];
        goto LABEL_12;
      }
      id v15 = [v9 asset];
      if (([v15 isInstalled] & 1) == 0)
      {
        id v16 = [v9 asset];
        unsigned __int8 v17 = [v16 isDownloading];

        if (v17)
        {
LABEL_10:
          id v14 = +[HUComfortSoundsSettings sharedInstance];
          v19 = +[HUComfortSound defaultComfortSoundForGroup:](HUComfortSound, "defaultComfortSoundForGroup:", [v9 soundGroup]);
          [v14 setSelectedComfortSound:v19];

          goto LABEL_11;
        }
        id v15 = +[AXHAServer sharedInstance];
        v18 = [v9 asset];
        [v15 downloadComfortSoundAsset:v18];
      }
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v4 = [(ComfortSoundsDetailViewController *)self specifierAtIndexPath:a4];
  id v5 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 asset];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(ComfortSoundsDetailViewController *)self specifierAtIndexPath:a4];
  id v5 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 asset];
    unsigned int v7 = [v6 isInstalled];

    int64_t v8 = v7;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  unsigned int v7 = [(ComfortSoundsDetailViewController *)self specifierAtIndexPath:a5];
  int64_t v8 = [v7 userInfo];
  if (a4 == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      uint64_t v10 = hearingLocString();
      objc_super v11 = [v9 localizedName];
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
      unsigned int v13 = hearingLocString();
      id v14 = +[UIAlertController alertControllerWithTitle:v12 message:v13 preferredStyle:1];

      id v15 = hearingLocString();
      id v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:&stru_3C920];
      [v14 addAction:v16];

      unsigned __int8 v17 = hearingLocString();
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_6314;
      v20[3] = &unk_3C948;
      id v21 = v9;
      id v22 = self;
      id v18 = v9;
      v19 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v20];
      [v14 addAction:v19];

      [(ComfortSoundsDetailViewController *)self presentViewController:v14 animated:1 completion:0];
    }
  }
}

- (NSArray)availableAssets
{
  return self->_availableAssets;
}

- (void)setAvailableAssets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end