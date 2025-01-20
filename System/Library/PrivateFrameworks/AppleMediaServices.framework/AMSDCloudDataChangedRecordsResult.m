@interface AMSDCloudDataChangedRecordsResult
- (AMSDCloudDataChangedRecordsResult)initWithChangedRecords:(id)a3 deletedRecords:(id)a4 errors:(id)a5 changeTokens:(id)a6;
- (NSDictionary)changeTokens;
- (NSDictionary)changedRecords;
- (NSDictionary)deletedRecords;
- (NSDictionary)errors;
- (NSString)hashedDescription;
@end

@implementation AMSDCloudDataChangedRecordsResult

- (AMSDCloudDataChangedRecordsResult)initWithChangedRecords:(id)a3 deletedRecords:(id)a4 errors:(id)a5 changeTokens:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AMSDCloudDataChangedRecordsResult;
  v15 = [(AMSDCloudDataChangedRecordsResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_changedRecords, a3);
    objc_storeStrong((id *)&v16->_changeTokens, a6);
    objc_storeStrong((id *)&v16->_deletedRecords, a4);
    objc_storeStrong((id *)&v16->_errors, a5);
  }

  return v16;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p> {", objc_opt_class(), self];
  v4 = [(AMSDCloudDataChangedRecordsResult *)self changedRecords];
  v5 = AMSHashIfNeeded();
  [v3 appendFormat:@"  changedRecords = %@,\n", v5];

  v6 = [(AMSDCloudDataChangedRecordsResult *)self deletedRecords];
  v7 = AMSHashIfNeeded();
  [v3 appendFormat:@"  deletedRecords = %@,\n", v7];

  v8 = [(AMSDCloudDataChangedRecordsResult *)self errors];
  v9 = AMSHashIfNeeded();
  [v3 appendFormat:@"  errors = %@,\n", v9];

  v10 = [(AMSDCloudDataChangedRecordsResult *)self changeTokens];
  id v11 = AMSHashIfNeeded();
  [v3 appendFormat:@"  changeTokens = %@\n", v11];

  [v3 appendString:@"}"];
  return (NSString *)v3;
}

- (NSDictionary)changedRecords
{
  return self->_changedRecords;
}

- (NSDictionary)changeTokens
{
  return self->_changeTokens;
}

- (NSDictionary)deletedRecords
{
  return self->_deletedRecords;
}

- (NSDictionary)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_deletedRecords, 0);
  objc_storeStrong((id *)&self->_changeTokens, 0);
  objc_storeStrong((id *)&self->_changedRecords, 0);
}

@end