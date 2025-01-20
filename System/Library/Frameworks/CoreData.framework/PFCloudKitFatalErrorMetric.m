@interface PFCloudKitFatalErrorMetric
- (PFCloudKitFatalErrorMetric)initWithContainerIdentifier:(id)a3 result:(id)a4;
- (id)name;
- (id)payload;
- (void)dealloc;
@end

@implementation PFCloudKitFatalErrorMetric

- (PFCloudKitFatalErrorMetric)initWithContainerIdentifier:(id)a3 result:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitFatalErrorMetric;
  v5 = -[PFCloudKitUnhandledPartialErrorMetric initWithContainerIdentifier:error:](&v8, sel_initWithContainerIdentifier_error_, a3, [a4 error]);
  if (v5)
  {
    [a4 request];
    v6 = (objc_class *)objc_opt_class();
    v5->_requestClass = NSStringFromClass(v6);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitFatalErrorMetric;
  [(PFCloudKitUnhandledPartialErrorMetric *)&v3 dealloc];
}

- (id)name
{
  return @"com.apple.coredata.cloudkit.fatalError";
}

- (id)payload
{
  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitFatalErrorMetric;
  objc_super v3 = objc_msgSend(-[PFCloudKitUnhandledPartialErrorMetric payload](&v6, sel_payload), "mutableCopy");
  requestClass = self->_requestClass;
  if (!requestClass) {
    requestClass = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 setObject:requestClass forKey:@"requestClass"];
  return v3;
}

@end