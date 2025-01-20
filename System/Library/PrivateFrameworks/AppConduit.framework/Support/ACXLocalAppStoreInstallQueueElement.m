@interface ACXLocalAppStoreInstallQueueElement
- (ACXApplication)app;
- (ACXLocalAppStoreInstallQueueElement)initWithApp:(id)a3 isUserInitiated:(BOOL)a4 completion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserInitiated;
- (NSUUID)installID;
- (id)completion;
- (unint64_t)hash;
- (void)setInstallID:(id)a3;
@end

@implementation ACXLocalAppStoreInstallQueueElement

- (ACXLocalAppStoreInstallQueueElement)initWithApp:(id)a3 isUserInitiated:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ACXLocalAppStoreInstallQueueElement;
  v11 = [(ACXLocalAppStoreInstallQueueElement *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_app, a3);
    v12->_isUserInitiated = a4;
    id v13 = [v10 copy];
    id completion = v12->_completion;
    v12->_id completion = v13;
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(ACXLocalAppStoreInstallQueueElement *)self app];
  v3 = [v2 bundleIdentifier];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ACXLocalAppStoreInstallQueueElement *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ACXLocalAppStoreInstallQueueElement *)self app];
      v7 = [v6 bundleIdentifier];
      v8 = [(ACXLocalAppStoreInstallQueueElement *)v5 app];

      id v9 = [v8 bundleIdentifier];
      unsigned __int8 v10 = [v7 isEqualToString:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (ACXApplication)app
{
  return self->_app;
}

- (BOOL)isUserInitiated
{
  return self->_isUserInitiated;
}

- (id)completion
{
  return self->_completion;
}

- (NSUUID)installID
{
  return self->_installID;
}

- (void)setInstallID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installID, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_app, 0);
}

@end