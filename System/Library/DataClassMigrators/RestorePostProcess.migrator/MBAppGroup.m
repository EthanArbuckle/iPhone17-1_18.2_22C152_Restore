@interface MBAppGroup
- (id)domain;
@end

@implementation MBAppGroup

- (id)domain
{
  v3 = [(MBContainer *)self identifier];
  v4 = [(MBContainer *)self volumeMountPoint];
  v5 = [(MBContainer *)self containerDir];
  v6 = +[MBDomain appGroupDomainWithIdentifier:v3 volumeMountPoint:v4 rootPath:v5];

  if (qword_2EAE8 != -1) {
    dispatch_once(&qword_2EAE8, &stru_28B58);
  }
  [v6 setRelativePathsToBackupAndRestore:qword_2EAE0];
  if (qword_2EAF8 != -1) {
    dispatch_once(&qword_2EAF8, &stru_28B78);
  }
  [v6 setRelativePathsNotToBackup:qword_2EAF0];
  if (qword_2EB08 != -1) {
    dispatch_once(&qword_2EB08, &stru_28B98);
  }
  [v6 setRelativePathsNotToRestore:qword_2EB00];
  [v6 setShouldDigest:0];

  return v6;
}

@end