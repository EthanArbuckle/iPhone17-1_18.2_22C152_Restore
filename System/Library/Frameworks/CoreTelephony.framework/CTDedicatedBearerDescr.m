@interface CTDedicatedBearerDescr
+ (BOOL)supportsSecureCoding;
- (CTDedicatedBearerDescr)init;
- (CTDedicatedBearerDescr)initWithCoder:(id)a3;
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
- (void)setDirection:(int64_t)a3;
- (void)setIp_protocol:(unint64_t)a3;
- (void)setRemote_ip:(id)a3;
- (void)setRemote_ports:(id)a3;
- (void)setSrc_ip:(id)a3;
- (void)setSrc_ports:(id)a3;
- (void)setTraffic_class:(id)a3;
@end

@implementation CTDedicatedBearerDescr

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTDedicatedBearerDescr *)self src_ip];
  [v3 appendFormat:@", src_ip=%@", v4];

  v5 = [(CTDedicatedBearerDescr *)self src_ports];
  [v3 appendFormat:@", src_ports=%@", v5];

  v6 = [(CTDedicatedBearerDescr *)self remote_ip];
  [v3 appendFormat:@", remote_ip=%@", v6];

  v7 = [(CTDedicatedBearerDescr *)self remote_ports];
  [v3 appendFormat:@", remote_ports=%@", v7];

  [v3 appendFormat:@", ip_protocol=%lu", -[CTDedicatedBearerDescr ip_protocol](self, "ip_protocol")];
  v8 = [(CTDedicatedBearerDescr *)self traffic_class];
  [v3 appendFormat:@", traffic_class=%@", v8];

  unint64_t v9 = [(CTDedicatedBearerDescr *)self direction];
  if (v9 > 2) {
    v10 = "???";
  }
  else {
    v10 = off_1E5265C58[v9];
  }
  [v3 appendFormat:@", direction=%s", v10];
  [v3 appendString:@">"];

  return v3;
}

- (CTDedicatedBearerDescr)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTDedicatedBearerDescr;
  v2 = [(CTDedicatedBearerDescr *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CTDedicatedBearerDescr *)v2 setIp_protocol:-1];
    [(CTDedicatedBearerDescr *)v3 setDirection:2];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTDedicatedBearerDescr *)self src_ip];
  v7 = (void *)[v6 copyWithZone:a3];
  objc_msgSend(v5, "setSrc_ip:", v7);

  v8 = [(CTDedicatedBearerDescr *)self src_ports];
  unint64_t v9 = (void *)[v8 copyWithZone:a3];
  objc_msgSend(v5, "setSrc_ports:", v9);

  v10 = [(CTDedicatedBearerDescr *)self remote_ip];
  v11 = (void *)[v10 copyWithZone:a3];
  objc_msgSend(v5, "setRemote_ip:", v11);

  v12 = [(CTDedicatedBearerDescr *)self remote_ports];
  v13 = (void *)[v12 copyWithZone:a3];
  objc_msgSend(v5, "setRemote_ports:", v13);

  objc_msgSend(v5, "setIp_protocol:", -[CTDedicatedBearerDescr ip_protocol](self, "ip_protocol"));
  v14 = [(CTDedicatedBearerDescr *)self traffic_class];
  v15 = (void *)[v14 copyWithZone:a3];
  objc_msgSend(v5, "setTraffic_class:", v15);

  objc_msgSend(v5, "setDirection:", -[CTDedicatedBearerDescr direction](self, "direction"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(CTDedicatedBearerDescr *)self src_ip];
  [v9 encodeObject:v4 forKey:@"src_ip"];

  objc_super v5 = [(CTDedicatedBearerDescr *)self src_ports];
  [v9 encodeObject:v5 forKey:@"src_ports"];

  v6 = [(CTDedicatedBearerDescr *)self remote_ip];
  [v9 encodeObject:v6 forKey:@"remote_ip"];

  v7 = [(CTDedicatedBearerDescr *)self remote_ports];
  [v9 encodeObject:v7 forKey:@"remote_ports"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTDedicatedBearerDescr ip_protocol](self, "ip_protocol"), @"ip_protocol");
  v8 = [(CTDedicatedBearerDescr *)self traffic_class];
  [v9 encodeObject:v8 forKey:@"traffic_class"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[CTDedicatedBearerDescr direction](self, "direction"), @"direction");
}

- (CTDedicatedBearerDescr)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTDedicatedBearerDescr;
  objc_super v5 = [(CTDedicatedBearerDescr *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"src_ip"];
    src_ip = v5->_src_ip;
    v5->_src_ip = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"src_ports"];
    src_ports = v5->_src_ports;
    v5->_src_ports = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remote_ip"];
    remote_ip = v5->_remote_ip;
    v5->_remote_ip = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"remote_ports"];
    remote_ports = v5->_remote_ports;
    v5->_remote_ports = (NSArray *)v18;

    v5->_ip_protocol = [v4 decodeIntegerForKey:@"ip_protocol"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traffic_class"];
    traffic_class = v5->_traffic_class;
    v5->_traffic_class = (NSString *)v20;

    v5->_direction = [v4 decodeIntegerForKey:@"direction"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
}

@end