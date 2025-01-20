@interface PSListController
- (void)updateCellAccessories:(id)a3;
@end

@implementation PSListController

- (void)updateCellAccessories:(id)a3
{
  v4 = (uint64_t (**)(id, void *, void *))a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(PSListController *)self table];
    v6 = [v5 visibleCells];

    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [v11 specifier];
            objc_msgSend(v11, "setAccessoryType:", v4[2](v4, v12, v11));
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

@end