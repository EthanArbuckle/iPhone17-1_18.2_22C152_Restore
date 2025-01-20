@interface PFUbiquityEventLogging
+ (void)initialize;
- (PFUbiquityEventLogging)init;
- (void)dealloc;
@end

@implementation PFUbiquityEventLogging

+ (void)initialize
{
}

- (PFUbiquityEventLogging)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFUbiquityEventLogging;
  v2 = [(PFUbiquityEventLogging *)&v4 init];
  if (v2)
  {
    v2->_logEvents = (NSMutableSet *)objc_opt_new();
    v2->_logLevel = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"com.apple.coredata.ubiquity.logLevel");
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityEventLogging;
  [(PFUbiquityEventLogging *)&v3 dealloc];
}

@end