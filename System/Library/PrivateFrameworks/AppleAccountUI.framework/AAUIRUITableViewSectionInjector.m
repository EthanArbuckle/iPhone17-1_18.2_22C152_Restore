@interface AAUIRUITableViewSectionInjector
+ (BOOL)shouldInject:(id)a3 inPage:(id)a4;
- (AAUIRUITableViewSectionInjector)initWithTableView:(id)a3 ruiTableView:(id)a4 injectWith:(id)a5;
- (BOOL)_shouldInjectViewInSection:(int64_t)a3;
- (NSString)injectionType;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)setInjectionType:(id)a3;
@end

@implementation AAUIRUITableViewSectionInjector

- (AAUIRUITableViewSectionInjector)initWithTableView:(id)a3 ruiTableView:(id)a4 injectWith:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AAUIRUITableViewSectionInjector;
  v11 = [(AAUITableViewDecorator *)&v14 initWithTableView:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_remoteTableViewController, a4);
    objc_storeStrong((id *)&v12->_viewToInject, a5);
  }

  return v12;
}

+ (BOOL)shouldInject:(id)a3 inPage:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 hasTableView];
  BOOL v8 = 0;
  if (v5 && v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = objc_msgSend(v6, "tableViewOM", 0);
    id v10 = [v9 sections];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) attributes];
          v16 = [(id)v15 objectForKeyedSubscript:@"appleAccountAction"];

          LOBYTE(v15) = [v16 isEqualToString:v5];
          if (v15)
          {
            BOOL v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_13:
  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(AAUIRUITableViewSectionInjector *)self _shouldInjectViewInSection:a4])
  {
    [(UIView *)self->_viewToInject intrinsicContentSize];
    double v8 = v7;
  }
  else
  {
    [(RUITableView *)self->_remoteTableViewController tableView:v6 heightForFooterInSection:a4];
    double v8 = v9;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(AAUIRUITableViewSectionInjector *)self _shouldInjectViewInSection:a4])
  {
    [(UIView *)self->_viewToInject setAccessibilityIdentifier:@"injected-view"];
    double v7 = self->_viewToInject;
  }
  else
  {
    double v7 = [(RUITableView *)self->_remoteTableViewController tableView:v6 viewForFooterInSection:a4];
  }
  double v8 = v7;

  return v8;
}

- (BOOL)_shouldInjectViewInSection:(int64_t)a3
{
  p_injectionType = &self->_injectionType;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_injectionType);

  if (!WeakRetained) {
    return 0;
  }
  double v7 = [(RUITableView *)self->_remoteTableViewController sections];
  double v8 = [v7 objectAtIndexedSubscript:a3];
  double v9 = [v8 attributes];
  id v10 = [v9 objectForKeyedSubscript:@"appleAccountAction"];

  if (!v10) {
    return 0;
  }
  id v11 = objc_loadWeakRetained((id *)p_injectionType);
  char v12 = [v10 isEqualToString:v11];

  return (v12 & 1) != 0;
}

- (NSString)injectionType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_injectionType);
  return (NSString *)WeakRetained;
}

- (void)setInjectionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_injectionType);
  objc_storeStrong((id *)&self->_viewToInject, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end