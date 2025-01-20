@interface GTReplayUpdateTermination
+ (BOOL)supportsSecureCoding;
- (GTReplayUpdateTermination)initWithCoder:(id)a3;
- (OS_xpc_object)connection;
- (OS_xpc_object)path;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation GTReplayUpdateTermination

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateTermination)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTReplayUpdateTermination;
  v3 = [(GTReplayRequest *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GTReplayUpdateTermination;
  [(GTReplayRequest *)&v3 encodeWithCoder:a3];
}

- (OS_xpc_object)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end