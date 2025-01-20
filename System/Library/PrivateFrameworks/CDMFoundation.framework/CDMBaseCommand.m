@interface CDMBaseCommand
- (CDMBaseCommand)init;
- (CDMBaseCommand)initWithCoder:(id)a3;
- (NSError)cmdError;
- (NSString)commandName;
- (NSString)uuid;
- (void)encodeWithCoder:(id)a3;
- (void)setCmdError:(id)a3;
@end

@implementation CDMBaseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdError, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)commandName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSError)cmdError
{
  return self->_cmdError;
}

- (CDMBaseCommand)init
{
  v8.receiver = self;
  v8.super_class = (Class)CDMBaseCommand;
  v2 = [(CDMBaseCommand *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    cmdError = v2->_cmdError;
    v2->_cmdError = 0;
  }
  return v2;
}

- (void)setCmdError:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_cmdError forKey:@"cmdError"];
}

- (CDMBaseCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDMBaseCommand;
  id v5 = [(CDMBaseCommand *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cmdError"];
    cmdError = v5->_cmdError;
    v5->_cmdError = (NSError *)v8;
  }
  return v5;
}

@end