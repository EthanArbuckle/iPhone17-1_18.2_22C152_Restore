@interface CDDCloudKitServerConfiguration
+ (BOOL)supportsSecureCoding;
- (CDDCloudKitServerConfiguration)init;
- (CDDCloudKitServerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDDCloudKitServerConfiguration

- (CDDCloudKitServerConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)CDDCloudKitServerConfiguration;
  v2 = [(CDDCloudKitServerConfiguration *)&v4 init];
  if (v2)
  {
    v2->_storeDirectoryPath = (NSString *)(id)objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", @"com.apple.coredatad");
    v2->_machServiceName = +[NSCloudKitMirroringDelegate cloudKitMachServiceName];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitServerConfiguration;
  [(CDDCloudKitServerConfiguration *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[CDDCloudKitServerConfiguration allocWithZone:a3];
  if (!v4) {
    return 0;
  }
  v7.receiver = v4;
  v7.super_class = (Class)CDDCloudKitServerConfiguration;
  v5 = [(CDDCloudKitServerConfiguration *)&v7 init];
  if (v5)
  {
    v5->_storeDirectoryPath = self->_storeDirectoryPath;
    v5->_machServiceName = self->_machServiceName;
  }
  return v5;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)CDDCloudKitServerConfiguration;
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[CDDCloudKitServerConfiguration description](&v5, sel_description));
  [v3 appendFormat:@"\nstoreDirectoryPath: %@", self->_storeDirectoryPath];
  [v3 appendFormat:@"\nmachServiceName: %@", self->_machServiceName];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitServerConfiguration)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitServerConfiguration;
  objc_super v4 = [(CDDCloudKitServerConfiguration *)&v6 init];
  if (v4)
  {
    v4->_storeDirectoryPath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"storeDirectoryPath"];
    v4->_machServiceName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"machServiceName"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_storeDirectoryPath forKey:@"storeDirectoryPath"];
  machServiceName = self->_machServiceName;

  [a3 encodeObject:machServiceName forKey:@"machServiceName"];
}

@end