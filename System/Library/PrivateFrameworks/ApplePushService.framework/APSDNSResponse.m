@interface APSDNSResponse
+ (BOOL)supportsSecureCoding;
- (APSDNSResponse)initWithCoder:(id)a3;
- (NSArray)ipv4Address;
- (NSArray)ipv6Address;
- (NSString)hostname;
- (id)initResponseForHostname:(id)a3 ipv4Address:(id)a4 ipv6Address:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APSDNSResponse

- (id)initResponseForHostname:(id)a3 ipv4Address:(id)a4 ipv6Address:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APSDNSResponse;
  v11 = [(APSDNSResponse *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    hostname = v11->_hostname;
    v11->_hostname = v12;

    uint64_t v14 = [v9 componentsSeparatedByString:@","];
    ipv4Address = v11->_ipv4Address;
    v11->_ipv4Address = (NSArray *)v14;

    uint64_t v16 = [v10 componentsSeparatedByString:@","];
    ipv6Address = v11->_ipv6Address;
    v11->_ipv6Address = (NSArray *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APSDNSResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)APSDNSResponse;
  v5 = [(APSDNSResponse *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"APSDNSHostname"];
    hostname = v5->_hostname;
    v5->_hostname = (NSString *)v6;

    uint64_t v8 = objc_opt_class();
    id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"APSDNSIPv4Address"];
    ipv4Address = v5->_ipv4Address;
    v5->_ipv4Address = (NSArray *)v10;

    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"APSDNSIPv6Address"];
    ipv6Address = v5->_ipv6Address;
    v5->_ipv6Address = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  hostname = self->_hostname;
  id v5 = a3;
  [v5 encodeObject:hostname forKey:@"APSDNSHostname"];
  [v5 encodeObject:self->_ipv4Address forKey:@"APSDNSIPv4Address"];
  [v5 encodeObject:self->_ipv6Address forKey:@"APSDNSIPv6Address"];
}

- (NSString)hostname
{
  return self->_hostname;
}

- (NSArray)ipv4Address
{
  return self->_ipv4Address;
}

- (NSArray)ipv6Address
{
  return self->_ipv6Address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6Address, 0);
  objc_storeStrong((id *)&self->_ipv4Address, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
}

@end