@interface DBAppDockItem
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAppDockItem:(id)a3;
- (DBAppDockItem)initWithBundleIdentifier:(id)a3 category:(unint64_t)a4 active:(BOOL)a5;
- (NSString)bundleIdentifier;
- (unint64_t)category;
@end

@implementation DBAppDockItem

- (DBAppDockItem)initWithBundleIdentifier:(id)a3 category:(unint64_t)a4 active:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DBAppDockItem;
  v9 = [(DBAppDockItem *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    v9->_category = a4;
    v9->_active = a5;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  BOOL v6 = v5
    && (objc_opt_isKindOfClass() & 1) != 0
    && [(DBAppDockItem *)self isEqualToAppDockItem:v5];

  return v6;
}

- (BOOL)isEqualToAppDockItem:(id)a3
{
  id v4 = a3;
  id v5 = [(DBAppDockItem *)self bundleIdentifier];
  BOOL v6 = [v4 bundleIdentifier];
  if ((v5 == v6 || [v5 isEqual:v6])
    && (unint64_t v7 = -[DBAppDockItem category](self, "category"), v7 == [v4 category]))
  {
    BOOL v8 = [(DBAppDockItem *)self isActive];
    int v9 = v8 ^ [v4 isActive] ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)category
{
  return self->_category;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
}

@end