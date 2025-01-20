@interface IDEGaugeDataProviderService
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
@end

@implementation IDEGaugeDataProviderService

- (id)startSamplingForPIDs:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  CFStringRef v11 = @"error";
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  v8 = +[NSString stringWithFormat:@"internal error: class %@ doesn't implement the required methods %@", v6, v7];
  v12 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  return v9;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v3 = a3;
  return v3;
}

@end