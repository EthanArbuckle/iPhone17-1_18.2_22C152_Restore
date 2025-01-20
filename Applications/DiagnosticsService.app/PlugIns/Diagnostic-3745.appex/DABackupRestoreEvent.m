@interface DABackupRestoreEvent
- (BOOL)successfulBackup;
- (DABackupRestoreEvent)initWithDate:(id)a3 eventSubType:(id)a4 successfulBackup:(BOOL)a5 eventCode:(int64_t)a6;
- (NSDate)date;
- (NSString)engine;
- (id)dictionary;
- (int64_t)backupRestoreEventCode;
- (void)setBackupRestoreEventCode:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setSuccessfulBackup:(BOOL)a3;
@end

@implementation DABackupRestoreEvent

- (DABackupRestoreEvent)initWithDate:(id)a3 eventSubType:(id)a4 successfulBackup:(BOOL)a5 eventCode:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DABackupRestoreEvent;
  v13 = [(DABackupRestoreEvent *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a3);
    v14->_backupRestoreEventCode = a6;
    v14->_successfulBackup = a5;
    if (([v12 isEqualToString:@"iTunesBackup"] & 1) != 0
      || [v12 isEqualToString:@"iTunesRestore"])
    {
      engine = v14->_engine;
      CFStringRef v16 = @"iTunes";
LABEL_8:
      v14->_engine = &v16->isa;

      goto LABEL_9;
    }
    if (([v12 isEqualToString:@"iCloudBackup"] & 1) != 0
      || [v12 isEqualToString:@"iCloudRestore"])
    {
      engine = v14->_engine;
      CFStringRef v16 = @"iCloud";
      goto LABEL_8;
    }
  }
LABEL_9:

  return v14;
}

- (id)dictionary
{
  v14[0] = @"date";
  v3 = +[DSDateFormatter sharedFormatter];
  v4 = [v3 formatterWithType:0];
  v5 = [(DABackupRestoreEvent *)self date];
  v6 = [v4 stringFromDate:v5];
  v7 = stringOrNull(v6);
  v15[0] = v7;
  v14[1] = @"engine";
  v8 = [(DABackupRestoreEvent *)self engine];
  v9 = stringOrNull(v8);
  v15[1] = v9;
  v14[2] = @"code";
  v10 = +[NSNumber numberWithInteger:[(DABackupRestoreEvent *)self backupRestoreEventCode]];
  id v11 = numberOrNull(v10);
  v15[2] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (int64_t)backupRestoreEventCode
{
  return self->_backupRestoreEventCode;
}

- (void)setBackupRestoreEventCode:(int64_t)a3
{
  self->_backupRestoreEventCode = a3;
}

- (BOOL)successfulBackup
{
  return self->_successfulBackup;
}

- (void)setSuccessfulBackup:(BOOL)a3
{
  self->_successfulBackup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end