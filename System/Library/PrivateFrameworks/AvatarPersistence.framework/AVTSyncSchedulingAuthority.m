@interface AVTSyncSchedulingAuthority
- (AVTSyncSchedulingAuthority)initWithLogger:(id)a3;
- (AVTUILogger)logger;
- (BOOL)importRequired;
- (void)didReceivePushNotification;
- (void)didResetSync;
- (void)exportDidCompleteSuccessfully;
- (void)importDidCompleteSuccessfully;
- (void)madeLocalChanges;
@end

@implementation AVTSyncSchedulingAuthority

- (AVTSyncSchedulingAuthority)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTSyncSchedulingAuthority;
  v6 = [(AVTSyncSchedulingAuthority *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (BOOL)importRequired
{
  v3 = AVTUISyncSuccessfulImportDate();
  if (v3
    && ([MEMORY[0x263EFF910] date],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 timeIntervalSinceDate:v3],
        double v6 = 86400.0 - v5,
        v4,
        v6 >= 0.0))
  {
    v8 = [(AVTSyncSchedulingAuthority *)self logger];
    [v8 logNotImportingOnLaunchWithRemainingTime:v6];

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)importDidCompleteSuccessfully
{
  id v2 = [MEMORY[0x263EFF910] date];
  AVTUISyncSetSuccessfulImportDate(v2);
}

- (void)exportDidCompleteSuccessfully
{
}

- (void)didReceivePushNotification
{
}

- (void)didResetSync
{
  AVTUISyncSetSuccessfulImportDate(0);

  AVTUISyncSetExportRequired(1);
}

- (void)madeLocalChanges
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
}

@end