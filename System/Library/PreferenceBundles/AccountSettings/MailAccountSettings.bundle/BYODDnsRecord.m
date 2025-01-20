@interface BYODDnsRecord
- (BYODDnsRecord)initWithDictionary:(id)a3;
- (NSString)dnsRecordType;
- (NSString)host;
- (NSString)type;
- (NSString)value;
- (int64_t)priority;
- (void)setDnsRecordType:(id)a3;
- (void)setHost:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BYODDnsRecord

- (BYODDnsRecord)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BYODDnsRecord;
  v5 = [(BYODDnsRecord *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"host"];
    host = v5->_host;
    v5->_host = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"dnsRecordType"];
    dnsRecordType = v5->_dnsRecordType;
    v5->_dnsRecordType = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v12;

    v5->_priority = -1;
    v14 = [v4 objectForKeyedSubscript:@"priority"];

    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:@"priority"];
      v5->_priority = (int64_t)[v15 integerValue];
    }
  }

  return v5;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)dnsRecordType
{
  return self->_dnsRecordType;
}

- (void)setDnsRecordType:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_dnsRecordType, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

@end