@interface DBLeafIcon
+ (Class)dataSourceClass;
- (BOOL)isLaunchEnabled;
- (DBApplication)application;
- (DBLeafIcon)initWithApplication:(id)a3;
- (DBLeafIcon)initWithApplication:(id)a3 drawBorder:(BOOL)a4;
@end

@implementation DBLeafIcon

+ (Class)dataSourceClass
{
  return (Class)objc_opt_class();
}

- (DBLeafIcon)initWithApplication:(id)a3
{
  return [(DBLeafIcon *)self initWithApplication:a3 drawBorder:0];
}

- (DBLeafIcon)initWithApplication:(id)a3 drawBorder:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [v7 bundleIdentifier];
  v13.receiver = self;
  v13.super_class = (Class)DBLeafIcon;
  v9 = [(SBLeafIcon *)&v13 initWithLeafIdentifier:v8 applicationBundleID:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_application, a3);
    v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "dataSourceClass"), "dataSourceForApplication:", v7);
    [v11 setDrawsBorder:v4];
    [(SBLeafIcon *)v10 addIconDataSource:v11];
  }
  return v10;
}

- (BOOL)isLaunchEnabled
{
  v2 = [(DBLeafIcon *)self application];
  char v3 = [v2 isPlaceholder] ^ 1;

  return v3;
}

- (DBApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
}

@end