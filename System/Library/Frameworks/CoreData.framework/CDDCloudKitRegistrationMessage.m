@interface CDDCloudKitRegistrationMessage
+ (BOOL)supportsSecureCoding;
- (CDDCloudKitRegistrationMessage)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDDCloudKitRegistrationMessage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitRegistrationMessage;
  [(CDDCloudKitMessage *)&v3 dealloc];
}

- (CDDCloudKitRegistrationMessage)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitRegistrationMessage;
  v4 = -[CDDCloudKitMessage initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_bundleIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    v4->_storeFileHandle = (NSFileHandle *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"fileHandle"];
    v4->_storePath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storePath"];
    v4->_storeFileProtectionClass = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storeFileProtectionClass"];
    v4->_storeType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storeType"];
    v4->_storeConfigurationName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storeConfigurationName"];
    v4->_containerIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CDDCloudKitRegistrationMessage;
  -[CDDCloudKitMessage encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  if (([(NSFileHandle *)self->_storeFileHandle fileDescriptor] & 0x80000000) == 0) {
    [a3 encodeObject:self->_storeFileHandle forKey:@"fileHandle"];
  }
  [a3 encodeObject:self->_storePath forKey:@"storePath"];
  [a3 encodeObject:self->_storeFileProtectionClass forKey:@"storeFileProtectionClass"];
  [a3 encodeObject:self->_storeType forKey:@"storeType"];
  [a3 encodeObject:self->_storeConfigurationName forKey:@"storeConfigurationName"];
  [a3 encodeObject:self->_containerIdentifier forKey:@"containerIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end