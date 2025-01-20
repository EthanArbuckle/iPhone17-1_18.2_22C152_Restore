@interface CTDedicatedBearerRequest
+ (BOOL)supportsSecureCoding;
- (CTDedicatedBearerRequest)init;
- (CTDedicatedBearerRequest)initWithCoder:(id)a3;
- (NSArray)details;
- (NSArray)remote_ports;
- (NSArray)src_ports;
- (NSString)remote_ip;
- (NSString)src_ip;
- (NSString)traffic_class;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)direction;
- (unint64_t)ip_protocol;
- (void)encodeWithCoder:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setIp_protocol:(unint64_t)a3;
- (void)setRemote_ip:(id)a3;
- (void)setRemote_ports:(id)a3;
- (void)setSrc_ip:(id)a3;
- (void)setSrc_ports:(id)a3;
- (void)setTraffic_class:(id)a3;
@end

@implementation CTDedicatedBearerRequest

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTDedicatedBearerRequest *)self details];
  [v3 appendFormat:@", details=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (CTDedicatedBearerRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTDedicatedBearerRequest;
  return [(CTDedicatedBearerRequest *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTDedicatedBearerRequest *)self details];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDetails:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTDedicatedBearerRequest *)self details];
  [v4 encodeObject:v5 forKey:@"kDBRdetails"];
}

- (CTDedicatedBearerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTDedicatedBearerRequest;
  id v5 = [(CTDedicatedBearerRequest *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kDBRdetails"];
    details = v5->_details;
    v5->_details = (NSArray *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSString)src_ip
{
  return self->_src_ip;
}

- (void)setSrc_ip:(id)a3
{
}

- (NSArray)src_ports
{
  return self->_src_ports;
}

- (void)setSrc_ports:(id)a3
{
}

- (NSString)remote_ip
{
  return self->_remote_ip;
}

- (void)setRemote_ip:(id)a3
{
}

- (NSArray)remote_ports
{
  return self->_remote_ports;
}

- (void)setRemote_ports:(id)a3
{
}

- (unint64_t)ip_protocol
{
  return self->_ip_protocol;
}

- (void)setIp_protocol:(unint64_t)a3
{
  self->_ip_protocol = a3;
}

- (NSString)traffic_class
{
  return self->_traffic_class;
}

- (void)setTraffic_class:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traffic_class, 0);
  objc_storeStrong((id *)&self->_remote_ports, 0);
  objc_storeStrong((id *)&self->_remote_ip, 0);
  objc_storeStrong((id *)&self->_src_ports, 0);
  objc_storeStrong((id *)&self->_src_ip, 0);

  objc_storeStrong((id *)&self->_details, 0);
}

@end