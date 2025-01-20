@interface ACXGizmoApplicationInstallStatusItem
+ (ACXGizmoApplicationInstallStatusItem)itemWithStatus:(unint64_t)a3 companionBundleID:(id)a4;
- (NSString)companionBundleID;
- (NSString)watchAppExecutableHash;
- (unint64_t)installStatus;
- (void)setCompanionBundleID:(id)a3;
- (void)setInstallStatus:(unint64_t)a3;
- (void)setWatchAppExecutableHash:(id)a3;
@end

@implementation ACXGizmoApplicationInstallStatusItem

+ (ACXGizmoApplicationInstallStatusItem)itemWithStatus:(unint64_t)a3 companionBundleID:(id)a4
{
  id v5 = a4;
  v6 = objc_alloc_init(ACXGizmoApplicationInstallStatusItem);
  [(ACXGizmoApplicationInstallStatusItem *)v6 setInstallStatus:a3];
  [(ACXGizmoApplicationInstallStatusItem *)v6 setCompanionBundleID:v5];

  return v6;
}

- (unint64_t)installStatus
{
  return self->_installStatus;
}

- (void)setInstallStatus:(unint64_t)a3
{
  self->_installStatus = a3;
}

- (NSString)companionBundleID
{
  return self->_companionBundleID;
}

- (void)setCompanionBundleID:(id)a3
{
}

- (NSString)watchAppExecutableHash
{
  return self->_watchAppExecutableHash;
}

- (void)setWatchAppExecutableHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchAppExecutableHash, 0);

  objc_storeStrong((id *)&self->_companionBundleID, 0);
}

@end