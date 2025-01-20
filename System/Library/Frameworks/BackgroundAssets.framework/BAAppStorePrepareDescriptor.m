@interface BAAppStorePrepareDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithAppBundleIdentifier:(id)a3 appStoreMetadata:(id)a4 client:(unint64_t)a5;
+ (id)new;
- (BAAppStorePrepareDescriptor)init;
- (BAAppStorePrepareDescriptor)initWithCoder:(id)a3;
- (BOOL)userInitiated;
- (NSDictionary)appStoreMetadata;
- (NSString)appBundleIdentifier;
- (id)initPrivatelyWithAppBundleIdentifier:(void *)a3 appStoreMetadata:(void *)a4 client:;
- (unint64_t)cellularPolicy;
- (unint64_t)clientType;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularPolicy:(unint64_t)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation BAAppStorePrepareDescriptor

- (BAAppStorePrepareDescriptor)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initPrivatelyWithAppBundleIdentifier:(void *)a3 appStoreMetadata:(void *)a4 client:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BAAppStorePrepareDescriptor;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
    }
  }

  return a1;
}

+ (id)descriptorWithAppBundleIdentifier:(id)a3 appStoreMetadata:(id)a4 client:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = -[BAAppStorePrepareDescriptor initPrivatelyWithAppBundleIdentifier:appStoreMetadata:client:]((id *)[BAAppStorePrepareDescriptor alloc], v8, v7, (void *)a5);

  return v9;
}

- (BAAppStorePrepareDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BAAppStorePrepareDescriptor;
  v5 = [(BAAppStorePrepareDescriptor *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleIdentifier"];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v6;

    id v8 = +[NSSet _baassets_propertyListClasses]();
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"appStoreMetadata"];
    appStoreMetadata = v5->_appStoreMetadata;
    v5->_appStoreMetadata = (NSDictionary *)v9;

    v5->_cellularPolicy = [v4 decodeIntegerForKey:@"cellularPolicy"];
    v5->_clientType = [v4 decodeIntegerForKey:@"clientType"];
    v5->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BAAppStorePrepareDescriptor *)self appBundleIdentifier];
  [v6 encodeObject:v4 forKey:@"appBundleIdentifier"];

  v5 = [(BAAppStorePrepareDescriptor *)self appStoreMetadata];
  [v6 encodeObject:v5 forKey:@"appStoreMetadata"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStorePrepareDescriptor cellularPolicy](self, "cellularPolicy"), @"cellularPolicy");
  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStorePrepareDescriptor clientType](self, "clientType"), @"clientType");
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStorePrepareDescriptor userInitiated](self, "userInitiated"), @"userInitiated");
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSDictionary)appStoreMetadata
{
  return self->_appStoreMetadata;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (unint64_t)cellularPolicy
{
  return self->_cellularPolicy;
}

- (void)setCellularPolicy:(unint64_t)a3
{
  self->_cellularPolicy = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreMetadata, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end