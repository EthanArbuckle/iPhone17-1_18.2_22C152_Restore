@interface _NSHTTPAlternativeServiceEntry
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (NSString)alternateHost;
- (NSString)host;
- (NSString)partition;
- (_NSHTTPAlternativeServiceEntry)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)alternatePort;
- (int64_t)port;
- (int64_t)serviceType;
- (unint64_t)hash;
- (void)setAlternateHost:(id)a3;
- (void)setAlternatePort:(int64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHost:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPort:(int64_t)a3;
- (void)setServiceType:(int64_t)a3;
@end

@implementation _NSHTTPAlternativeServiceEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_alternateHost, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (void)setPartition:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"none";
  }
  partition = self->_partition;
  self->_partition = &v5->isa;
}

- (void)setHost:(id)a3
{
}

- (void)setAlternatePort:(int64_t)a3
{
  self->_alternatePort = a3;
}

- (void)setAlternateHost:(id)a3
{
}

- (_NSHTTPAlternativeServiceEntry)init
{
  v8.receiver = self;
  v8.super_class = (Class)_NSHTTPAlternativeServiceEntry;
  v2 = [(_NSHTTPAlternativeServiceEntry *)&v8 init];
  v3 = v2;
  if (v2)
  {
    partition = v2->_partition;
    v2->_partition = (NSString *)@"none";

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:86400.0];
    expirationDate = v3->_expirationDate;
    v3->_expirationDate = (NSDate *)v5;
  }
  return v3;
}

- (void)setExpirationDate:(id)a3
{
}

- (int64_t)alternatePort
{
  return self->_alternatePort;
}

- (unint64_t)hash
{
  v3 = [(_NSHTTPAlternativeServiceEntry *)self host];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(_NSHTTPAlternativeServiceEntry *)self port];
  v6 = [(_NSHTTPAlternativeServiceEntry *)self partition];
  uint64_t v7 = [v6 hash];
  unint64_t v8 = v5 ^ v4 ^ v7 ^ [(_NSHTTPAlternativeServiceEntry *)self serviceType];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_NSHTTPAlternativeServiceEntry *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      v6 = [(_NSHTTPAlternativeServiceEntry *)self host];
      uint64_t v7 = [(_NSHTTPAlternativeServiceEntry *)v5 host];
      if ([v6 isEqual:v7])
      {
        unint64_t v8 = [(_NSHTTPAlternativeServiceEntry *)self partition];
        v9 = [(_NSHTTPAlternativeServiceEntry *)v5 partition];
        if ([v8 isEqual:v9]
          && (int64_t v10 = [(_NSHTTPAlternativeServiceEntry *)self port],
              v10 == [(_NSHTTPAlternativeServiceEntry *)v5 port]))
        {
          int64_t v11 = [(_NSHTTPAlternativeServiceEntry *)self serviceType];
          BOOL v12 = v11 == [(_NSHTTPAlternativeServiceEntry *)v5 serviceType];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (int64_t)port
{
  return self->_port;
}

- (NSString)partition
{
  return self->_partition;
}

- (NSString)host
{
  return self->_host;
}

- (NSString)alternateHost
{
  return self->_alternateHost;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_NSHTTPAlternativeServiceEntry> {\n \t\t\tHost = %@ \n \t\t\tPort = %ld \n \t\t\tPartition = %@ \n \t\t\tAlternate-Host = %@ \n \t\t\tAlternate-Port = %ld \n \t\t\tExpiration = %@ \n} ", self->_host, self->_port, self->_partition, self->_alternateHost, self->_alternatePort, self->_expirationDate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_NSHTTPAlternativeServiceEntry);
  int64_t v5 = [(_NSHTTPAlternativeServiceEntry *)self alternateHost];
  [(_NSHTTPAlternativeServiceEntry *)v4 setAlternateHost:v5];

  [(_NSHTTPAlternativeServiceEntry *)v4 setAlternatePort:[(_NSHTTPAlternativeServiceEntry *)self alternatePort]];
  v6 = [(_NSHTTPAlternativeServiceEntry *)self host];
  [(_NSHTTPAlternativeServiceEntry *)v4 setHost:v6];

  [(_NSHTTPAlternativeServiceEntry *)v4 setPort:[(_NSHTTPAlternativeServiceEntry *)self port]];
  uint64_t v7 = [(_NSHTTPAlternativeServiceEntry *)self partition];
  [(_NSHTTPAlternativeServiceEntry *)v4 setPartition:v7];

  unint64_t v8 = [(_NSHTTPAlternativeServiceEntry *)self expirationDate];
  [(_NSHTTPAlternativeServiceEntry *)v4 setExpirationDate:v8];

  [(_NSHTTPAlternativeServiceEntry *)v4 setServiceType:[(_NSHTTPAlternativeServiceEntry *)self serviceType]];
  return v4;
}

@end