@interface DEDClientConnection
+ (BOOL)supportsSecureCoding;
- (DEDClientConnection)initWithCoder:(id)a3;
- (NSNumber)pid;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPid:(id)a3;
@end

@implementation DEDClientConnection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEDClientConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DEDClientConnection;
  v5 = [(DEDClientConnection *)&v7 init];
  if (v5) {
    v5->_pid = (NSNumber *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"pid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDClientConnection *)self pid];
  [v4 encodeObject:v5 forKey:@"pid"];
}

- (id)description
{
  v2 = NSString;
  v3 = [(DEDClientConnection *)self pid];
  id v4 = [v2 stringWithFormat:@"DEDClientConnection to PID [%@]", v3];

  return v4;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (void)setPid:(id)a3
{
  self->_pid = (NSNumber *)a3;
}

@end