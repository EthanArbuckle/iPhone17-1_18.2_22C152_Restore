@interface DBIconManager
- (DBIconManager)initWithEnvironment:(id)a3;
- (_DBIconListLayoutProvider)layoutProvider;
- (void)setLayoutProvider:(id)a3;
@end

@implementation DBIconManager

- (DBIconManager)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBIconManager;
  v5 = [(SBHIconManager *)&v9 init];
  if (v5)
  {
    v6 = [[_DBIconListLayoutProvider alloc] initWithEnvironment:v4];
    layoutProvider = v5->_layoutProvider;
    v5->_layoutProvider = v6;
  }
  return v5;
}

- (_DBIconListLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (void)setLayoutProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end