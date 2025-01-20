@interface AMSCloudDataFetchResult
- (AMSCloudDataFetchResult)initWithResults:(id)a3 failures:(id)a4;
- (NSDictionary)failures;
- (NSDictionary)results;
- (NSString)hashedDescription;
@end

@implementation AMSCloudDataFetchResult

- (AMSCloudDataFetchResult)initWithResults:(id)a3 failures:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSCloudDataFetchResult;
  v9 = [(AMSCloudDataFetchResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_failures, a4);
    objc_storeStrong((id *)&v10->_results, a3);
  }

  return v10;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p> {", objc_opt_class(), self];
  v4 = [(AMSCloudDataFetchResult *)self results];
  v5 = AMSHashIfNeeded();
  [v3 appendFormat:@"  results = %@,\n", v5];

  v6 = [(AMSCloudDataFetchResult *)self failures];
  id v7 = AMSHashIfNeeded();
  [v3 appendFormat:@"  failures = %@,\n", v7];

  [v3 appendString:@"}"];
  return (NSString *)v3;
}

- (NSDictionary)failures
{
  return self->_failures;
}

- (NSDictionary)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_failures, 0);
}

@end