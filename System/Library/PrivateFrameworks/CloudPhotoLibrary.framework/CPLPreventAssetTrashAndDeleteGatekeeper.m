@interface CPLPreventAssetTrashAndDeleteGatekeeper
- (int64_t)checkPushedChange:(id)a3;
@end

@implementation CPLPreventAssetTrashAndDeleteGatekeeper

- (int64_t)checkPushedChange:(id)a3
{
  id v4 = a3;
  if (![v4 isAssetChange]) {
    goto LABEL_6;
  }
  if (([v4 isDelete] & 1) == 0)
  {
    if ([v4 inTrash])
    {
      [v4 setInTrash:0];
      [v4 setDateDeleted:0];
      int64_t v5 = 2;
      goto LABEL_7;
    }
LABEL_6:
    v7.receiver = self;
    v7.super_class = (Class)CPLPreventAssetTrashAndDeleteGatekeeper;
    int64_t v5 = [(CPLPushPullGatekeeper *)&v7 checkPushedChange:v4];
    goto LABEL_7;
  }
  int64_t v5 = 1;
LABEL_7:

  return v5;
}

@end