@interface CalMigrationFailure
+ (id)_labelForStage:(unint64_t)a3;
- (BOOL)isFatal;
- (CalMigrationFailure)initWithDatabaseIntegrityErrors:(id)a3;
- (CalMigrationFailure)initWithDescription:(id)a3 stage:(unint64_t)a4 underlyingError:(id)a5 relatedPath:(id)a6 isFatal:(BOOL)a7;
- (NSArray)databaseIntegrityErrors;
- (NSError)underlyingError;
- (NSString)failureDescription;
- (NSString)relatedPath;
- (id)description;
- (unint64_t)stage;
@end

@implementation CalMigrationFailure

- (CalMigrationFailure)initWithDescription:(id)a3 stage:(unint64_t)a4 underlyingError:(id)a5 relatedPath:(id)a6 isFatal:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CalMigrationFailure;
  v15 = [(CalMigrationFailure *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    failureDescription = v15->_failureDescription;
    v15->_failureDescription = (NSString *)v16;

    v15->_stage = a4;
    uint64_t v18 = [v13 copy];
    underlyingError = v15->_underlyingError;
    v15->_underlyingError = (NSError *)v18;

    uint64_t v20 = [v14 copy];
    relatedPath = v15->_relatedPath;
    v15->_relatedPath = (NSString *)v20;

    v15->_isFatal = a7;
  }

  return v15;
}

- (CalMigrationFailure)initWithDatabaseIntegrityErrors:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CalMigrationFailure;
  v5 = [(CalMigrationFailure *)&v11 init];
  v6 = v5;
  if (v5)
  {
    failureDescription = v5->_failureDescription;
    v5->_failureDescription = (NSString *)@"Database integrity error";

    v6->_stage = 5;
    uint64_t v8 = [v4 copy];
    databaseIntegrityErrors = v6->_databaseIntegrityErrors;
    v6->_databaseIntegrityErrors = (NSArray *)v8;

    v6->_isFatal = 0;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CalMigrationFailure *)self failureDescription];
  v6 = objc_msgSend((id)objc_opt_class(), "_labelForStage:", -[CalMigrationFailure stage](self, "stage"));
  v7 = [(CalMigrationFailure *)self underlyingError];
  uint64_t v8 = [(CalMigrationFailure *)self relatedPath];
  v9 = [(CalMigrationFailure *)self databaseIntegrityErrors];
  v10 = [v3 stringWithFormat:@"<%@: %p>\n{\n  description = \"%@\"\n  stage = %@\n  underlyingError = %@\n  relatedPath = %@\n  databaseIntegrityErrors = %@\n}", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

+ (id)_labelForStage:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"Unknown";
  }
  else {
    return off_2645A4458[a3 - 1];
  }
}

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (NSString)relatedPath
{
  return self->_relatedPath;
}

- (BOOL)isFatal
{
  return self->_isFatal;
}

- (NSArray)databaseIntegrityErrors
{
  return self->_databaseIntegrityErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseIntegrityErrors, 0);
  objc_storeStrong((id *)&self->_relatedPath, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_failureDescription, 0);
}

@end