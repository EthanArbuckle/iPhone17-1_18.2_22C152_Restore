@interface ACUIAccountCollectionViewController
- (id)specifiers;
- (void)removeContiguousSpecifiers:(id)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ACUIAccountCollectionViewController

- (void)viewWillAppear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id v4 = (id)[(ACUIAccountCollectionViewController *)self specifier];
  id location = (id)[v4 propertyForKey:@"ACUIAccountCollectionTitle"];

  if (location)
  {
    id v3 = (id)[(ACUIAccountCollectionViewController *)v9 navigationItem];
    [v3 setTitle:location];
  }
  v5.receiver = v9;
  v5.super_class = (Class)ACUIAccountCollectionViewController;
  [(ACUIAccountCollectionViewController *)&v5 viewWillAppear:v7];
  objc_storeStrong(&location, 0);
}

- (id)specifiers
{
  BOOL v7 = self;
  v6[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]))
  {
    v6[0] = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = (id)[(ACUIAccountCollectionViewController *)v7 specifier];
    id location = (id)[v4 propertyForKey:@"ACUIAccountCollectionSpecifiers"];

    if (location) {
      [v6[0] addObjectsFromArray:location];
    }
    objc_storeStrong((id *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]), v6[0]);
    objc_storeStrong(&location, 0);
    objc_storeStrong(v6, 0);
  }
  v2 = *(Class *)((char *)&v7->super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  return v2;
}

- (void)removeContiguousSpecifiers:(id)a3 animated:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  v17.receiver = v20;
  v17.super_class = (Class)ACUIAccountCollectionViewController;
  [(ACUIAccountCollectionViewController *)&v17 removeContiguousSpecifiers:location[0] animated:a4];
  char v16 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = [(ACUIAccountCollectionViewController *)v20 specifiers];
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v13)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v13;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(__b[1] + 8 * v9);
      if (*(void *)(v15 + (int)*MEMORY[0x1E4F92F28])) {
        break;
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v10) {
          goto LABEL_9;
        }
      }
    }
    char v16 = 1;
  }
LABEL_9:

  if ((v16 & 1) == 0)
  {
    id v6 = (id)[(ACUIAccountCollectionViewController *)v20 navigationController];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&v20->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E4F92F90]));
    id v4 = (id)objc_msgSend(v6, "popToViewController:animated:");
  }
  objc_storeStrong(location, 0);
}

@end