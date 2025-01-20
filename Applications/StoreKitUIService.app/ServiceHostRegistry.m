@interface ServiceHostRegistry
+ (id)sharedInstance;
- (NSString)registeredHostBundleId;
- (void)setRegisteredHostBundleId:(id)a3;
@end

@implementation ServiceHostRegistry

+ (id)sharedInstance
{
  if (qword_100067388 != -1) {
    dispatch_once(&qword_100067388, &stru_10004D738);
  }
  v2 = (void *)qword_100067380;

  return v2;
}

- (NSString)registeredHostBundleId
{
  return self->_registeredHostBundleId;
}

- (void)setRegisteredHostBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end