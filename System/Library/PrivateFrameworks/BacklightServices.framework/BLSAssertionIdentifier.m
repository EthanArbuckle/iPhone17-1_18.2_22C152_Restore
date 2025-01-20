@interface BLSAssertionIdentifier
+ (BOOL)supportsSecureCoding;
+ (unint64_t)nextCount;
- (BLSAssertionIdentifier)initWithClientPid:(int)a3 hostPid:(int)a4 count:(unint64_t)a5;
- (BLSAssertionIdentifier)initWithCoder:(id)a3;
- (BLSAssertionIdentifier)initWithXPCDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (int)clientPid;
- (int)hostPid;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSAssertionIdentifier

+ (unint64_t)nextCount
{
  return atomic_fetch_add_explicit(&nextCount___count, 1uLL, memory_order_relaxed);
}

- (BLSAssertionIdentifier)initWithClientPid:(int)a3 hostPid:(int)a4 count:(unint64_t)a5
{
  v7 = self;
  if (a3 < 1 || a4 <= 0)
  {
    v11 = bls_assertions_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BLSAssertionIdentifier initWithClientPid:hostPid:count:](a3, a4, v11);
    }

    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BLSAssertionIdentifier;
    v9 = [(BLSAssertionIdentifier *)&v13 init];
    if (v9)
    {
      v9->_hostPid = a4;
      v9->_clientPid = a3;
      v9->_count = a5;
    }
    v7 = v9;
    v10 = v7;
  }

  return v10;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_clientPid withName:@"clientPid"];
  id v5 = (id)[v3 appendInt:self->_hostPid withName:@"hostPid"];
  id v6 = (id)[v3 appendUInt64:self->_count withName:@"count"];
  v7 = [v3 build];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_clientPid];
  id v5 = (id)[v3 appendInteger:self->_hostPid];
  id v6 = (id)[v3 appendUnsignedInteger:self->_count];
  id v7 = (id)[v3 appendUnsignedInteger:HIDWORD(self->_count)];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLSAssertionIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int clientPid = self->_clientPid;
      if (clientPid == [(BLSAssertionIdentifier *)v5 clientPid]
        && (int hostPid = self->_hostPid, hostPid == [(BLSAssertionIdentifier *)v5 hostPid]))
      {
        unint64_t count = self->_count;
        BOOL v9 = count == [(BLSAssertionIdentifier *)v5 count];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BLSAssertionIdentifier)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (const char *)[@"clientPid" UTF8String];
  id v6 = (const char *)[@"hostPid" UTF8String];
  id v7 = (const char *)[@"count" UTF8String];
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, v5);
  uint64_t v9 = xpc_dictionary_get_uint64(v4, v6);
  uint64_t v10 = xpc_dictionary_get_uint64(v4, v7);

  return [(BLSAssertionIdentifier *)self initWithClientPid:uint64 hostPid:v9 count:v10];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  id v4 = (const char *)[@"clientPid" UTF8String];
  id v5 = (const char *)[@"hostPid" UTF8String];
  id v6 = (const char *)[@"count" UTF8String];
  xpc_dictionary_set_uint64(xdict, v4, self->_clientPid);
  xpc_dictionary_set_uint64(xdict, v5, self->_hostPid);
  xpc_dictionary_set_uint64(xdict, v6, self->_count);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAssertionIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"clientPid"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"hostPid"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"count"];

  return [(BLSAssertionIdentifier *)self initWithClientPid:v5 hostPid:v6 count:v7];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t clientPid = self->_clientPid;
  id v5 = a3;
  [v5 encodeInt32:clientPid forKey:@"clientPid"];
  [v5 encodeInt32:self->_hostPid forKey:@"hostPid"];
  [v5 encodeInt64:self->_count forKey:@"count"];
}

- (int)hostPid
{
  return self->_hostPid;
}

- (int)clientPid
{
  return self->_clientPid;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)initWithClientPid:(int)a1 hostPid:(int)a2 count:(os_log_t)log .cold.1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_fault_impl(&dword_1B55DE000, log, OS_LOG_TYPE_FAULT, "BLSAssertionIdentifier initialized with invalid clientPid:%d hostPid:%d", (uint8_t *)v3, 0xEu);
}

@end