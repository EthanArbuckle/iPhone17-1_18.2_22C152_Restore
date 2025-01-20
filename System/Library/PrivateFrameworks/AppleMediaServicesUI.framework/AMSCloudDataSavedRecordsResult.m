@interface AMSCloudDataSavedRecordsResult
- (AMSCloudDataSavedRecordsResult)initWithSavedRecords:(id)a3 deletedRecords:(id)a4 error:(id)a5;
- (NSArray)deletedRecords;
- (NSArray)savedRecords;
- (NSError)error;
- (NSString)hashedDescription;
@end

@implementation AMSCloudDataSavedRecordsResult

- (AMSCloudDataSavedRecordsResult)initWithSavedRecords:(id)a3 deletedRecords:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSCloudDataSavedRecordsResult;
  v12 = [(AMSCloudDataSavedRecordsResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_savedRecords, a3);
    objc_storeStrong((id *)&v13->_deletedRecords, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p> {", objc_opt_class(), self];
  v4 = [(AMSCloudDataSavedRecordsResult *)self savedRecords];
  v5 = AMSHashIfNeeded();
  [v3 appendFormat:@"  savedRecords = %@,\n", v5];

  v6 = [(AMSCloudDataSavedRecordsResult *)self deletedRecords];
  v7 = AMSHashIfNeeded();
  [v3 appendFormat:@"  deletedRecords = %@,\n", v7];

  v8 = [(AMSCloudDataSavedRecordsResult *)self error];
  id v9 = AMSHashIfNeeded();
  [v3 appendFormat:@"  error = %@,\n", v9];

  [v3 appendString:@"}"];
  return (NSString *)v3;
}

- (NSArray)savedRecords
{
  return self->_savedRecords;
}

- (NSArray)deletedRecords
{
  return self->_deletedRecords;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deletedRecords, 0);
  objc_storeStrong((id *)&self->_savedRecords, 0);
}

@end