@interface CDDCloudKitMessage
+ (BOOL)supportsSecureCoding;
- (CDDCloudKitMessage)init;
- (CDDCloudKitMessage)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDDCloudKitMessage

- (CDDCloudKitMessage)init
{
  v4.receiver = self;
  v4.super_class = (Class)CDDCloudKitMessage;
  v2 = [(CDDCloudKitMessage *)&v4 init];
  if (v2) {
    v2->_identifier = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitMessage;
  [(CDDCloudKitMessage *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDDCloudKitMessage)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDDCloudKitMessage;
  objc_super v4 = [(CDDCloudKitMessage *)&v6 init];
  if (v4) {
    v4->_identifier = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

@end