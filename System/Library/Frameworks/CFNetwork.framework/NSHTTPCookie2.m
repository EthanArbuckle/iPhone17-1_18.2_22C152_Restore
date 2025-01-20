@interface NSHTTPCookie2
- (BOOL)hostOnly;
- (BOOL)httpOnly;
- (BOOL)secure;
- (BOOL)sesion;
- (NSDate)creationDate;
- (NSDate)expirationDate;
- (NSHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5;
- (NSString)domain;
- (NSString)name;
- (NSString)partition;
- (NSString)path;
- (NSString)value;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)sameSite;
- (int64_t)source;
@end

@implementation NSHTTPCookie2

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->creationDate, 0);
  objc_storeStrong((id *)&self->_etldPlusOne, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (int64_t)sameSite
{
  return self->_sameSite;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)partition
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)hostOnly
{
  return self->_hostOnly;
}

- (BOOL)httpOnly
{
  return self->_httpOnly;
}

- (BOOL)secure
{
  return self->_secure;
}

- (BOOL)sesion
{
  return self->_sesion;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [NSMutableHTTPCookie2 alloc];
  v5 = [(NSHTTPCookie2 *)self name];
  v6 = [(NSHTTPCookie2 *)self value];
  v7 = [(NSHTTPCookie2 *)self domain];
  v8 = [(NSMutableHTTPCookie2 *)v4 initWithName:v5 value:v6 domain:v7];

  v9 = [(NSHTTPCookie2 *)self partition];
  [(NSMutableHTTPCookie2 *)v8 setPartition:v9];

  v10 = [(NSHTTPCookie2 *)self value];
  [(NSMutableHTTPCookie2 *)v8 setValue:v10];

  v11 = [(NSHTTPCookie2 *)self path];
  [(NSMutableHTTPCookie2 *)v8 setPath:v11];

  [(NSMutableHTTPCookie2 *)v8 setSecure:[(NSHTTPCookie2 *)self secure]];
  [(NSMutableHTTPCookie2 *)v8 setSameSite:[(NSHTTPCookie2 *)self sameSite]];
  v12 = [(NSHTTPCookie2 *)self expirationDate];
  [(NSMutableHTTPCookie2 *)v8 setExpirationDate:v12];

  [(NSMutableHTTPCookie2 *)v8 setHostOnly:[(NSHTTPCookie2 *)self hostOnly]];
  [(NSMutableHTTPCookie2 *)v8 setHttpOnly:[(NSHTTPCookie2 *)self httpOnly]];
  return v8;
}

- (id)description
{
  v3 = NSString;
  v11 = [(NSHTTPCookie2 *)self name];
  v4 = [(NSHTTPCookie2 *)self value];
  v5 = [(NSHTTPCookie2 *)self domain];
  v6 = [(NSHTTPCookie2 *)self partition];
  v7 = [(NSHTTPCookie2 *)self path];
  v8 = [(NSHTTPCookie2 *)self expirationDate];
  v9 = [v3 stringWithFormat:@"NSHTTPCookie2 = <\n Name=%@\n Value=%@\n Domain=%@\n Partition=%@\n Path=%@\n Expiry=%@\n Secure=%d\n HttpOnly=%d\n HostOnly=%d\n sameSite=%ld\n>", v11, v4, v5, v6, v7, v8, -[NSHTTPCookie2 secure](self, "secure"), -[NSHTTPCookie2 httpOnly](self, "httpOnly"), -[NSHTTPCookie2 hostOnly](self, "hostOnly"), -[NSHTTPCookie2 sameSite](self, "sameSite")];

  return v9;
}

- (NSDate)expirationDate
{
  if (self->_session)
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)self->_sExpirationDate];
  }

  return (NSDate *)v2;
}

- (NSDate)creationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)self->_sCreationDate];
}

- (NSHTTPCookie2)initWithName:(id)a3 value:(id)a4 domain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NSHTTPCookie2;
  v12 = [(NSHTTPCookie2 *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_value, a4);
    if ([v11 hasPrefix:@"."])
    {
      uint64_t v14 = [v11 lowercaseString];
      domain = v13->_domain;
      v13->_domain = (NSString *)v14;
    }
    else
    {
      domain = [@"." stringByAppendingString:v11];
      uint64_t v16 = [domain lowercaseString];
      v17 = v13->_domain;
      v13->_domain = (NSString *)v16;
    }
    path = v13->_path;
    v13->_path = (NSString *)@"/";

    partition = v13->_partition;
    v13->_partition = (NSString *)@"none";

    *(_DWORD *)&v13->_secure = 0x1000000;
    v13->_sameSite = 0;
    v13->_source = 0;
  }

  return v13;
}

@end