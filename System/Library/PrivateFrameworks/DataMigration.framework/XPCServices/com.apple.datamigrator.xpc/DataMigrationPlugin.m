@interface DataMigrationPlugin
+ (double)_minimumCalculatedTimeIntervalBeforeReboot;
+ (double)_minimumTimeIntervalBetweenWatchdogAndReboot;
- (BOOL)didRun;
- (BOOL)existsAndShouldRun;
- (BOOL)isConcurrent;
- (BOOL)isUserAgnostic;
- (BOOL)success;
- (DMPluginFileSystemRep)rep;
- (DataMigrationPlugin)initWithIdentifier:(id)a3 fileSystemRep:(id)a4 isUserAgnostic:(BOOL)a5;
- (NSString)identifier;
- (NSString)identifierOfDependency;
- (NSString)name;
- (double)appropriateTimeIntervalBeforeReboot;
- (double)pidReceiptTimeout;
- (double)runDuration;
- (double)timeIntervalBeforeReboot;
- (double)timeIntervalBeforeWatchdog;
- (float)timeEstimate;
- (id)_performOneMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 needsRetry:(BOOL *)a5;
- (id)description;
- (id)performMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 countOfAttempts:(unint64_t *)a5;
- (void)setIdentifierOfDependency:(id)a3;
- (void)setPidReceiptTimeout:(double)a3;
- (void)setTimeEstimate:(float)a3;
- (void)setTimeIntervalBeforeReboot:(double)a3;
- (void)setTimeIntervalBeforeWatchdog:(double)a3;
@end

@implementation DataMigrationPlugin

- (DataMigrationPlugin)initWithIdentifier:(id)a3 fileSystemRep:(id)a4 isUserAgnostic:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DataMigrationPlugin;
  v11 = [(DataMigrationPlugin *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_rep, a4);
    rep = v12->_rep;
    if (rep)
    {
      uint64_t v14 = [(DMPluginFileSystemRep *)rep name];
      name = v12->_name;
      v12->_name = (NSString *)v14;
    }
    else
    {
      name = v12->_name;
      v12->_name = (NSString *)@"<absent plugin>";
    }

    v12->_isUserAgnostic = a5;
    v12->_pidReceiptTimeout = 5.0;
  }

  return v12;
}

- (BOOL)existsAndShouldRun
{
  return self->_rep != 0;
}

- (double)appropriateTimeIntervalBeforeReboot
{
  [(DataMigrationPlugin *)self timeIntervalBeforeReboot];
  if (v3 == 0.0)
  {
    [(DataMigrationPlugin *)self timeIntervalBeforeWatchdog];
    double v5 = 0.0;
    if (v6 <= 0.0) {
      return v5;
    }
    [(DataMigrationPlugin *)self timeIntervalBeforeWatchdog];
    double v8 = v7;
    +[DataMigrationPlugin _minimumTimeIntervalBetweenWatchdogAndReboot];
    double v5 = v8 + v9;
    +[DataMigrationPlugin _minimumCalculatedTimeIntervalBeforeReboot];
    if (v10 <= v5)
    {
      return v5;
    }
    else
    {
      +[DataMigrationPlugin _minimumCalculatedTimeIntervalBeforeReboot];
    }
  }
  else
  {
    [(DataMigrationPlugin *)self timeIntervalBeforeReboot];
  }
  return result;
}

+ (double)_minimumCalculatedTimeIntervalBeforeReboot
{
  return 600.0;
}

+ (double)_minimumTimeIntervalBetweenWatchdogAndReboot
{
  return 60.0;
}

- (BOOL)isConcurrent
{
  v2 = [(DataMigrationPlugin *)self identifierOfDependency];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSString *)self->_name length]) {
    [v3 addObject:self->_name];
  }
  if ([(DataMigrationPlugin *)self isUserAgnostic]) {
    [v3 addObject:@"user-agnostic"];
  }
  if ([(DataMigrationPlugin *)self isConcurrent])
  {
    v4 = [(DataMigrationPlugin *)self identifierOfDependency];
    double v5 = +[NSString stringWithFormat:@"concurrent after %@", v4];
    [v3 addObject:v5];
  }
  double v6 = [v3 componentsJoinedByString:@", "];
  if ([v6 length])
  {
    uint64_t v7 = +[NSString stringWithFormat:@" (%@)", v6];

    double v6 = (void *)v7;
  }
  double v8 = [(DataMigrationPlugin *)self identifier];
  double v9 = +[NSString stringWithFormat:@"%@%@", v8, v6];

  return v9;
}

- (id)performMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 countOfAttempts:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  *a5 = 1;
  char v21 = 0;
  uint64_t v10 = [(DataMigrationPlugin *)self _performOneMigrationWithParameters:v8 watchdogCoordinator:v9 needsRetry:&v21];
  v11 = (void *)v10;
  if (v21) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    int v13 = 4;
    while (--v13 > 1)
    {
      _DMLogFunc();
      ++*a5;
      char v21 = 0;
      uint64_t v14 = -[DataMigrationPlugin _performOneMigrationWithParameters:watchdogCoordinator:needsRetry:](self, "_performOneMigrationWithParameters:watchdogCoordinator:needsRetry:", v8, v9, &v21, self);
      if (v21) {
        BOOL v15 = v14 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (!v15)
      {
        v11 = (void *)v14;
        goto LABEL_14;
      }
    }
    rep = self->_rep;
    objc_super v17 = [v8 dispositionSupersetOfContext];
    v18 = +[NSString stringWithFormat:@"%@ — Crashed", self];
    v11 = +[DMIncident incidentWithKind:2 responsiblePluginRep:rep userDataDisposition:v17 details:v18];

    v19 = +[DMDiagnostics sharedInstance];
    [v19 captureDiagnosticsForIncident:v11 async:1];
  }
LABEL_14:

  return v11;
}

- (id)_performOneMigrationWithParameters:(id)a3 watchdogCoordinator:(id)a4 needsRetry:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  int v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_100005380;
  v28 = sub_100015818;
  id v29 = 0;
  uint64_t v10 = +[DMEnvironment sharedInstance];
  uint64_t v11 = 0;
  if ([v10 shouldWatchdogPluginsAfterTimeout])
  {
    [(DataMigrationPlugin *)self timeIntervalBeforeWatchdog];
    uint64_t v11 = v12;
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100015820;
  v17[3] = &unk_100024F20;
  uint64_t v22 = v11;
  v20 = v30;
  v17[4] = self;
  char v21 = &v24;
  id v13 = v8;
  id v18 = v13;
  id v14 = v9;
  id v19 = v14;
  v23 = a5;
  [v14 callRunEventBlock:v17 forPlugin:self];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v30, 8);

  return v15;
}

- (BOOL)isUserAgnostic
{
  return self->_isUserAgnostic;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (DMPluginFileSystemRep)rep
{
  return self->_rep;
}

- (float)timeEstimate
{
  return self->_timeEstimate;
}

- (void)setTimeEstimate:(float)a3
{
  self->_timeEstimate = a3;
}

- (double)timeIntervalBeforeWatchdog
{
  return self->_timeIntervalBeforeWatchdog;
}

- (void)setTimeIntervalBeforeWatchdog:(double)a3
{
  self->_timeIntervalBeforeWatchdog = a3;
}

- (double)timeIntervalBeforeReboot
{
  return self->_timeIntervalBeforeReboot;
}

- (void)setTimeIntervalBeforeReboot:(double)a3
{
  self->_timeIntervalBeforeReboot = a3;
}

- (NSString)identifierOfDependency
{
  return self->_identifierOfDependency;
}

- (void)setIdentifierOfDependency:(id)a3
{
}

- (BOOL)didRun
{
  return self->_didRun;
}

- (BOOL)success
{
  return self->_success;
}

- (double)runDuration
{
  return self->_runDuration;
}

- (double)pidReceiptTimeout
{
  return self->_pidReceiptTimeout;
}

- (void)setPidReceiptTimeout:(double)a3
{
  self->_pidReceiptTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierOfDependency, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rep, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end