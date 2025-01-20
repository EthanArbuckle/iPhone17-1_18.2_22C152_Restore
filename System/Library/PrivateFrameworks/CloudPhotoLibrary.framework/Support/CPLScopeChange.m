@interface CPLScopeChange
- (BOOL)canAcceptShareWithCloudKit;
- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4;
- (void)updateCKShare:(id)a3;
- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4;
- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5;
@end

@implementation CPLScopeChange

- (BOOL)canAcceptShareWithCloudKit
{
  switch((unint64_t)[(CPLScopeChange *)self scopeType])
  {
    case 2uLL:
    case 3uLL:
    case 5uLL:
      BOOL result = 1;
      break;
    case 4uLL:
      v3 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v4 = [v3 BOOLForKey:@"CPLAcceptOwnedShareURL"];

      BOOL result = v4;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)updateWithCKShare:(id)a3 currentUserID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [objc_alloc((Class)CPLShare) initWithCKShare:v7 currentUserID:v6];

  v8 = [v7 objectForKey:CKShareTitleKey];

  if (v8) {
    [(CPLScopeChange *)self setTitle:v8];
  }
  [(CPLScopeChange *)self setShare:v9];
}

- (void)updateWithLibraryInfoCKRecord:(id)a3 zone:(id)a4 userRecordID:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)CPLLibraryInfo) initWithCKRecord:v8 zone:v7];

  [(CPLScopeChange *)self setLibraryInfo:v9];
}

- (id)rootRecordUsingTempCKAssetURL:(id)a3 inZone:(id)a4
{
  return 0;
}

- (void)updateCKShare:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [(CPLScopeChange *)self share];
  v5 = v4;
  if (v4)
  {
    id v6 = (char *)[v4 publicPermission];
    if ((unint64_t)(v6 - 1) >= 3) {
      id v7 = 0;
    }
    else {
      id v7 = v6;
    }
    [v9 setPublicPermission:v7];
  }
  id v8 = [(CPLScopeChange *)self title];
  [v9 setObject:v8 forKey:CKShareTitleKey];
}

@end