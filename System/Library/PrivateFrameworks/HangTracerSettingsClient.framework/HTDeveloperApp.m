@interface HTDeveloperApp
- (HTDeveloperApp)initWithName:(id)a3 bundleID:(id)a4;
- (NSString)bundleID;
- (NSString)name;
@end

@implementation HTDeveloperApp

- (HTDeveloperApp)initWithName:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HTDeveloperApp;
  v8 = [(HTDeveloperApp *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v11;
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end