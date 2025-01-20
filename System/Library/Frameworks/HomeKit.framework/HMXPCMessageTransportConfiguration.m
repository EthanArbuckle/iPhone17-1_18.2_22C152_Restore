@interface HMXPCMessageTransportConfiguration
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresHomeDataAccess;
- (HMXPCMessageTransportConfiguration)initWithMachServiceName:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)machServiceName;
- (NSString)serverStartNotification;
- (NSString)shortDescription;
- (OS_dispatch_queue)queue;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)requiredEntitlements;
- (void)setQueue:(id)a3;
- (void)setRequiredEntitlements:(unint64_t)a3;
- (void)setRequiresHomeDataAccess:(BOOL)a3;
@end

@implementation HMXPCMessageTransportConfiguration

- (BOOL)requiresHomeDataAccess
{
  return self->_requiresHomeDataAccess;
}

- (NSString)machServiceName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
}

- (HMXPCMessageTransportConfiguration)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v18.receiver = self;
    v18.super_class = (Class)HMXPCMessageTransportConfiguration;
    v6 = [(HMXPCMessageTransportConfiguration *)&v18 init];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      machServiceName = v6->_machServiceName;
      v6->_machServiceName = (NSString *)v7;

      v6->_requiredEntitlements = 1;
      v6->_requiresHomeDataAccess = 1;
      id v9 = [NSString stringWithFormat:@"com.apple.HomeKit.XPC.%@", v5];
      v10 = (const char *)[v9 UTF8String];
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v12;
    }
    return v6;
  }
  else
  {
    v15 = (HMXPCMessageTransportConfiguration *)_HMFPreconditionFailure();
    [(HMXPCMessageTransportConfiguration *)v15 setRequiresHomeDataAccess:v17];
  }
  return result;
}

- (void)setRequiresHomeDataAccess:(BOOL)a3
{
  self->_requiresHomeDataAccess = a3;
}

- (unint64_t)requiredEntitlements
{
  return self->_requiredEntitlements;
}

- (void)setRequiredEntitlements:(unint64_t)a3
{
  self->_requiredEntitlements = a3;
}

- (NSString)serverStartNotification
{
  v2 = [(HMXPCMessageTransportConfiguration *)self machServiceName];
  v3 = [v2 stringByAppendingString:@".start.notification"];

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_machServiceName, 0);
}

- (NSArray)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMXPCMessageTransportConfiguration *)self machServiceName];
  v5 = (void *)[v3 initWithName:@"Mach Service Name" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v7 = HMXPCClientEntitlementsShortDescription([(HMXPCMessageTransportConfiguration *)self requiredEntitlements]);
  v8 = (void *)[v6 initWithName:@"Required Entitlements" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMXPCMessageTransportConfiguration *)self requiresHomeDataAccess];
  v10 = HMFBooleanToString();
  v11 = (void *)[v9 initWithName:@"Requires Home Data Access" value:v10];
  v14[2] = v11;
  dispatch_queue_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableXPCMessageTransportConfiguration allocWithZone:a3];
  v5 = [(HMXPCMessageTransportConfiguration *)self machServiceName];
  id v6 = [(HMXPCMessageTransportConfiguration *)v4 initWithMachServiceName:v5];

  [(HMXPCMessageTransportConfiguration *)v6 setRequiredEntitlements:[(HMXPCMessageTransportConfiguration *)self requiredEntitlements]];
  [(HMXPCMessageTransportConfiguration *)v6 setRequiresHomeDataAccess:[(HMXPCMessageTransportConfiguration *)self requiresHomeDataAccess]];
  uint64_t v7 = [(HMXPCMessageTransportConfiguration *)self queue];
  [(HMXPCMessageTransportConfiguration *)v6 setQueue:v7];

  return v6;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (unint64_t)hash
{
  v2 = [(HMXPCMessageTransportConfiguration *)self machServiceName];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMXPCMessageTransportConfiguration *)self machServiceName];
    v8 = [v6 machServiceName];
    if ([v7 isEqualToString:v8]
      && (unint64_t v9 = [(HMXPCMessageTransportConfiguration *)self requiredEntitlements],
          v9 == [v6 requiredEntitlements])
      && (int v10 = [(HMXPCMessageTransportConfiguration *)self requiresHomeDataAccess],
          v10 == [v6 requiresHomeDataAccess]))
    {
      v13 = [(HMXPCMessageTransportConfiguration *)self queue];
      v14 = [v6 queue];
      char v11 = [v13 isEqual:v14];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

@end