@interface MIPluginDataContainer
+ (id)pluginDataContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7;
- (NSString)parentBundleID;
- (void)setParentBundleID:(id)a3;
@end

@implementation MIPluginDataContainer

+ (id)pluginDataContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(id)objc_opt_class() containerWithIdentifier:v12 forPersona:v11 ofContentClass:4 createIfNeeded:v9 created:a6 error:a7];

  return v13;
}

- (NSString)parentBundleID
{
  parentBundleID = self->_parentBundleID;
  if (parentBundleID) {
    goto LABEL_6;
  }
  id v12 = 0;
  v4 = [(MIContainer *)self infoValueForKey:@"com.apple.MobileInstallation.ParentBundleID" error:&v12];
  id v5 = v12;
  objc_opt_class();
  id v6 = v4;
  v7 = 0;
  if (objc_opt_isKindOfClass()) {
    v7 = (NSString *)v6;
  }

  if (v7)
  {
    v8 = self->_parentBundleID;
    self->_parentBundleID = v7;

    parentBundleID = self->_parentBundleID;
LABEL_6:
    BOOL v9 = parentBundleID;
    goto LABEL_7;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    id v11 = [(MIContainer *)self identifier];
    MOLogWrite();
  }
  BOOL v9 = 0;
LABEL_7:
  return v9;
}

- (void)setParentBundleID:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  BOOL v5 = [(MIContainer *)self setInfoValue:v4 forKey:@"com.apple.MobileInstallation.ParentBundleID" error:&v10];
  id v6 = v10;
  if (v5)
  {
    v7 = (NSString *)v4;
    parentBundleID = self->_parentBundleID;
    self->_parentBundleID = v7;
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      BOOL v9 = [(MIContainer *)self identifier];
      MOLogWrite();
    }
    parentBundleID = self->_parentBundleID;
    self->_parentBundleID = 0;
  }
}

- (void).cxx_destruct
{
}

@end