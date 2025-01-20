@interface HKNotificationSyncStoreServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKNotificationSyncStoreServerConfiguration)initWithClientIdentifier:(id)a3;
- (HKNotificationSyncStoreServerConfiguration)initWithCoder:(id)a3;
- (NSString)clientIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKNotificationSyncStoreServerConfiguration

- (HKNotificationSyncStoreServerConfiguration)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKNotificationSyncStoreServerConfiguration;
  v5 = [(HKNotificationSyncStoreServerConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNotificationSyncStoreServerConfiguration)initWithCoder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKNotificationSyncStoreServerConfiguration;
  uint64_t v6 = [(HKTaskConfiguration *)&v11 initWithCoder:v5];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v6->_clientIdentifier;
    v6->_clientIdentifier = (NSString *)v7;

    if (!v6->_clientIdentifier)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v6, @"HKNotificationSyncStoreInterfaces.m", 50, @"Invalid parameter not satisfying: %@", @"_clientIdentifier" object file lineNumber description];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKNotificationSyncStoreServerConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientIdentifier, @"clientIdentifier", v5.receiver, v5.super_class);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
}

@end