@interface PFCloudKitUnhandledPartialErrorMetric
- (PFCloudKitUnhandledPartialErrorMetric)initWithContainerIdentifier:(id)a3 error:(id)a4;
- (id)name;
- (id)payload;
- (void)dealloc;
@end

@implementation PFCloudKitUnhandledPartialErrorMetric

- (PFCloudKitUnhandledPartialErrorMetric)initWithContainerIdentifier:(id)a3 error:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitUnhandledPartialErrorMetric;
  v5 = [(PFCloudKitBaseMetric *)&v7 initWithContainerIdentifier:a3];
  if (v5)
  {
    v5->_errorCode = (NSNumber *)objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", objc_msgSend(a4, "code"));
    v5->_errorDomain = (NSString *)(id)[a4 domain];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitUnhandledPartialErrorMetric;
  [(PFCloudKitBaseMetric *)&v3 dealloc];
}

- (id)name
{
  return @"com.apple.coredata.cloudkit.unhandledPartialError";
}

- (id)payload
{
  v7.receiver = self;
  v7.super_class = (Class)PFCloudKitUnhandledPartialErrorMetric;
  objc_super v3 = (void *)[(NSDictionary *)[(PFCloudKitBaseMetric *)&v7 payload] mutableCopy];
  errorDomain = self->_errorDomain;
  if (!errorDomain) {
    errorDomain = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:errorDomain forKey:@"errorDomain"];
  errorCode = self->_errorCode;
  if (!errorCode) {
    errorCode = (NSNumber *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:errorCode forKey:@"errorCode"];
  return v3;
}

@end