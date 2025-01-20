@interface DMMigrationWatchdog
- (DMMigrationWatchdog)initWithMigrationPluginDescription:(id)a3 userDataDisposition:(id)a4 migrationStartTime:(double)a5;
- (DMTimer)timer;
- (unint64_t)nextSecondsBeforeNextStackshotAdditionForUnitTesting;
- (unint64_t)secondsBeforeNextStackshot;
- (unint64_t)stackshotTimerLeewaySeconds;
- (void)_takeStackshot;
- (void)cancel;
- (void)resume;
- (void)setNextSecondsBeforeNextStackshotAdditionForUnitTesting:(unint64_t)a3;
- (void)setSecondsBeforeNextStackshot:(unint64_t)a3;
- (void)setStackshotTimerLeewaySeconds:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation DMMigrationWatchdog

- (DMMigrationWatchdog)initWithMigrationPluginDescription:(id)a3 userDataDisposition:(id)a4 migrationStartTime:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DMMigrationWatchdog;
  v10 = [(DMMigrationWatchdog *)&v14 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    migrationPluginDescription = v10->_migrationPluginDescription;
    v10->_migrationPluginDescription = v11;

    objc_storeStrong((id *)&v10->_userDataDisposition, a4);
    v10->_migrationStartTime = a5;
    [(DMMigrationWatchdog *)v10 setSecondsBeforeNextStackshot:120];
    v10->_minutesSinceStarting = 0;
    [(DMMigrationWatchdog *)v10 setNextSecondsBeforeNextStackshotAdditionForUnitTesting:0];
    [(DMMigrationWatchdog *)v10 setStackshotTimerLeewaySeconds:10];
  }

  return v10;
}

- (void)resume
{
  [(DMMigrationWatchdog *)self timer];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_100016370();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006F9C;
  v5[3] = &unk_1000246B0;
  v5[4] = self;
  id v3 = objc_msgSend(objc_alloc((Class)DMTimer), "initWithSecondsBeforeFirstFire:secondsOfLeeway:fireBlock:", -[DMMigrationWatchdog secondsBeforeNextStackshot](self, "secondsBeforeNextStackshot"), -[DMMigrationWatchdog stackshotTimerLeewaySeconds](self, "stackshotTimerLeewaySeconds"), v5);
  [(DMMigrationWatchdog *)self setTimer:v3];

  v4 = [(DMMigrationWatchdog *)self timer];
  [v4 resume];
}

- (void)cancel
{
  id v2 = [(DMMigrationWatchdog *)self timer];
  [v2 cancel];
}

- (void)_takeStackshot
{
  _DMLogFunc();
  id v5 = +[NSString stringWithFormat:@"PRECAUTIONARY stackshot - migration might be hung or deadlocked. Plugin: %@ (%llu minutes) (overall migration start %llu)", self->_migrationPluginDescription, self->_minutesSinceStarting, (unint64_t)self->_migrationStartTime];
  id v3 = +[DMIncident incidentWithKind:0 responsiblePluginRep:0 userDataDisposition:self->_userDataDisposition details:v5];
  v4 = +[DMDiagnostics sharedInstance];
  [v4 captureDiagnosticsForIncident:v3 async:1];
}

- (DMTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (unint64_t)secondsBeforeNextStackshot
{
  return self->_secondsBeforeNextStackshot;
}

- (void)setSecondsBeforeNextStackshot:(unint64_t)a3
{
  self->_secondsBeforeNextStackshot = a3;
}

- (unint64_t)nextSecondsBeforeNextStackshotAdditionForUnitTesting
{
  return self->_nextSecondsBeforeNextStackshotAdditionForUnitTesting;
}

- (void)setNextSecondsBeforeNextStackshotAdditionForUnitTesting:(unint64_t)a3
{
  self->_nextSecondsBeforeNextStackshotAdditionForUnitTesting = a3;
}

- (unint64_t)stackshotTimerLeewaySeconds
{
  return self->_stackshotTimerLeewaySeconds;
}

- (void)setStackshotTimerLeewaySeconds:(unint64_t)a3
{
  self->_stackshotTimerLeewaySeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_userDataDisposition, 0);

  objc_storeStrong((id *)&self->_migrationPluginDescription, 0);
}

@end