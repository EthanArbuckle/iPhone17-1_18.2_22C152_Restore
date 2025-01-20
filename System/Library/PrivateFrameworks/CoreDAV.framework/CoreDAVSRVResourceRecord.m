@interface CoreDAVSRVResourceRecord
- (NSNumber)port;
- (NSString)serviceString;
- (NSString)target;
- (id)description;
- (void)setPort:(id)a3;
- (void)setServiceString:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation CoreDAVSRVResourceRecord

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVSRVResourceRecord;
  v4 = [(CoreDAVSRVResourceRecord *)&v9 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVSRVResourceRecord *)self serviceString];
  [v3 appendFormat:@"\n  Service string: [%@]", v5];

  v6 = [(CoreDAVSRVResourceRecord *)self port];
  [v3 appendFormat:@"\n  Port: [%@]", v6];

  v7 = [(CoreDAVSRVResourceRecord *)self target];
  [v3 appendFormat:@"\n  Target: [%@]", v7];

  return v3;
}

- (NSString)serviceString
{
  return self->_serviceString;
}

- (void)setServiceString:(id)a3
{
}

- (NSNumber)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (NSString)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
}

@end