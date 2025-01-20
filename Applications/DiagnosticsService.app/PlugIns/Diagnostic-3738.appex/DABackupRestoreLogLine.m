@interface DABackupRestoreLogLine
- (BOOL)didSucceed;
- (NSString)eventSubType;
- (int64_t)backupCode;
- (int64_t)backupRestoreEventType;
@end

@implementation DABackupRestoreLogLine

- (NSString)eventSubType
{
  v3 = [(DABackupRestoreLogLine *)self fields];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 3)
  {
    v6 = 0;
  }
  else
  {
    v5 = [(DABackupRestoreLogLine *)self fields];
    v6 = [v5 objectAtIndexedSubscript:2];
  }

  return (NSString *)v6;
}

- (int64_t)backupCode
{
  return (int)[(DABackupRestoreLogLine *)self integerFromFieldAtIndex:3];
}

- (BOOL)didSucceed
{
  return [(DABackupRestoreLogLine *)self backupCode] == 0;
}

- (int64_t)backupRestoreEventType
{
  v3 = [(DABackupRestoreLogLine *)self eventSubType];
  if ([v3 isEqualToString:@"iCloudBackup"])
  {

    return 1000;
  }
  id v4 = [(DABackupRestoreLogLine *)self eventSubType];
  unsigned int v5 = [v4 isEqualToString:@"iTunesBackup"];

  if (v5) {
    return 1000;
  }
  return 1001;
}

@end