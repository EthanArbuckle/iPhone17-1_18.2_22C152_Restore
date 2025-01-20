@interface HMDHH2MigrationLogEvent
- (BOOL)isAutoMigration;
- (BOOL)isDryRun;
- (BOOL)isMigrationSuccessful;
- (HMDHH2MigrationLogEvent)initWithAutoMigration:(BOOL)a3 isDryRun:(BOOL)a4 migrationSuccessful:(BOOL)a5 totalMigrationTime:(int64_t)a6 totalMigrationAttempt:(int64_t)a7 migrationError:(id)a8 failureReason:(id)a9 coreDataValidationEntityClassName:(id)a10 coreDataValidationAttributeName:(id)a11 localizedErrorDescription:(id)a12;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)coreDataValidationAttributeName;
- (NSString)coreDataValidationEntityClassName;
- (NSString)failureReason;
- (NSString)localizedErrorDescription;
- (double)totalTimeTakenForMigration;
- (int64_t)migrationAttempt;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDHH2MigrationLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedErrorDescription, 0);
  objc_storeStrong((id *)&self->_coreDataValidationAttributeName, 0);
  objc_storeStrong((id *)&self->_coreDataValidationEntityClassName, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
}

- (NSString)localizedErrorDescription
{
  return self->_localizedErrorDescription;
}

- (NSString)coreDataValidationAttributeName
{
  return self->_coreDataValidationAttributeName;
}

- (NSString)coreDataValidationEntityClassName
{
  return self->_coreDataValidationEntityClassName;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (int64_t)migrationAttempt
{
  return self->_migrationAttempt;
}

- (BOOL)isMigrationSuccessful
{
  return self->_migrationSuccessful;
}

- (double)totalTimeTakenForMigration
{
  return self->_totalTimeTakenForMigration;
}

- (BOOL)isDryRun
{
  return self->_dryRun;
}

- (BOOL)isAutoMigration
{
  return self->_autoMigration;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHH2MigrationLogEvent isAutoMigration](self, "isAutoMigration"));
  [v3 setObject:v4 forKeyedSubscript:@"isAutoMigration"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHH2MigrationLogEvent isDryRun](self, "isDryRun"));
  [v3 setObject:v5 forKeyedSubscript:@"isDryRun"];

  v6 = NSNumber;
  [(HMDHH2MigrationLogEvent *)self totalTimeTakenForMigration];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"migrationTotalTime"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHH2MigrationLogEvent isMigrationSuccessful](self, "isMigrationSuccessful"));
  [v3 setObject:v8 forKeyedSubscript:@"migrationSuccess"];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHH2MigrationLogEvent migrationAttempt](self, "migrationAttempt"));
  [v3 setObject:v9 forKeyedSubscript:@"migrationAttemptCount"];

  v10 = [(HMDHH2MigrationLogEvent *)self failureReason];
  [v3 setObject:v10 forKeyedSubscript:@"migrationFailureReason"];

  v11 = [(HMDHH2MigrationLogEvent *)self coreDataValidationEntityClassName];
  [v3 setObject:v11 forKeyedSubscript:@"validationEntityClassName"];

  v12 = [(HMDHH2MigrationLogEvent *)self coreDataValidationAttributeName];
  [v3 setObject:v12 forKeyedSubscript:@"validationAttributeName"];

  v13 = [(HMDHH2MigrationLogEvent *)self localizedErrorDescription];
  [v3 setObject:v13 forKeyedSubscript:@"localizedDescription"];

  v14 = (void *)MEMORY[0x1D9452090]();
  v15 = objc_alloc_init(HMDHH2MigrationStateLogger);
  [(HMDHH2MigrationStateLogger *)v15 resetStoredMigrationState];

  v16 = (void *)[v3 copy];

  return (NSDictionary *)v16;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.hh2MigrationEvent";
}

- (HMDHH2MigrationLogEvent)initWithAutoMigration:(BOOL)a3 isDryRun:(BOOL)a4 migrationSuccessful:(BOOL)a5 totalMigrationTime:(int64_t)a6 totalMigrationAttempt:(int64_t)a7 migrationError:(id)a8 failureReason:(id)a9 coreDataValidationEntityClassName:(id)a10 coreDataValidationAttributeName:(id)a11 localizedErrorDescription:(id)a12
{
  id v16 = a8;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  id v17 = a12;
  v26.receiver = self;
  v26.super_class = (Class)HMDHH2MigrationLogEvent;
  v18 = [(HMMLogEvent *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_autoMigration = a3;
    v18->_dryRun = a4;
    v18->_migrationSuccessful = a5;
    v18->_totalTimeTakenForMigration = (double)a6;
    v18->_migrationAttempt = a7;
    objc_storeStrong((id *)&v18->_failureReason, a9);
    objc_storeStrong((id *)&v19->_coreDataValidationAttributeName, a11);
    objc_storeStrong((id *)&v19->_coreDataValidationEntityClassName, a10);
    objc_storeStrong((id *)&v19->_localizedErrorDescription, a12);
    [(HMMLogEvent *)v19 setError:v16];
  }

  return v19;
}

@end