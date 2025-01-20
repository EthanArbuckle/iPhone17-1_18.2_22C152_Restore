@interface FAProfilePictureTableViewDecorator
+ (BOOL)_shouldShowPictureInSection:(id)a3;
+ (BOOL)shouldShowPicturesInPage:(id)a3;
- (FAProfilePictureTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 pictureStore:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_profilePictureStoreDidReload;
- (void)dealloc;
@end

@implementation FAProfilePictureTableViewDecorator

- (FAProfilePictureTableViewDecorator)initWithTableView:(id)a3 ruiTableView:(id)a4 pictureStore:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FAProfilePictureTableViewDecorator;
  v11 = [(FATableViewDecorator *)&v15 initWithTableView:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pictureStore, a5);
    objc_storeStrong((id *)&v12->_remoteTableViewController, a4);
    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v12 selector:sel__profilePictureStoreDidReload name:FAProfilePictureStoreDidReloadImagesNotification object:v10];
  }
  return v12;
}

- (void)_profilePictureStoreDidReload
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__FAProfilePictureTableViewDecorator__profilePictureStoreDidReload__block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__FAProfilePictureTableViewDecorator__profilePictureStoreDidReload__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FAProfilePictureTableViewDecorator;
  [(FAProfilePictureTableViewDecorator *)&v4 dealloc];
}

+ (BOOL)shouldShowPicturesInPage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasTableView])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = objc_msgSend(v4, "tableViewOM", 0);
    v6 = [v5 sections];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([a1 _shouldShowPictureInSection:*(void *)(*((void *)&v13 + 1) + 8 * i)])
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 0;
LABEL_13:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)_shouldShowPictureInSection:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "rows", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) attributes];
        uint64_t v9 = [v8 objectForKeyedSubscript:@"familyAction"];
        char v10 = [v9 isEqual:@"InjectMemberImage"];

        if (v10)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FATableViewDecorator *)self dataSource];
  uint64_t v9 = [v8 tableView:v7 cellForRowAtIndexPath:v6];

  char v10 = [(RUITableView *)self->_remoteTableViewController objectModelRowForIndexPath:v6];

  BOOL v11 = [v10 attributes];
  v12 = [v11 objectForKeyedSubscript:@"altDSID"];

  long long v13 = [v10 attributes];
  long long v14 = [v13 objectForKeyedSubscript:@"familyAction"];

  if ([v14 isEqualToString:@"InjectMemberImage"]) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    long long v16 = [(FAProfilePictureStore *)self->_pictureStore profilePictureForFamilyMemberWithAltDSID:v12 pictureDiameter:36.0];
    if (v16)
    {
      v17 = (void *)MEMORY[0x263F827E8];
      uint64_t v18 = [MEMORY[0x263F82B60] mainScreen];
      [v18 scale];
      v19 = objc_msgSend(v17, "imageWithData:scale:", v16);
      v20 = [v9 imageView];
      [v20 setImage:v19];

      v21 = [v9 imageView];
      [v21 setContentMode:4];
    }
    else
    {
      v21 = [v9 imageView];
      [v21 setImage:0];
    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end