@interface CTSatelliteMessagingProvisioning
+ (BOOL)supportsSecureCoding;
- (CTSatelliteMessagingProvisioning)initWithCoder:(id)a3;
- (CTSatelliteMessagingProvisioning)initWithID:(id)a3 data:(id)a4 sps:(id)a5;
- (NSData)cfg;
- (NSString)sps_environment;
- (NSUUID)cfg_id;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCfg:(id)a3;
- (void)setCfg_id:(id)a3;
- (void)setSps_environment:(id)a3;
@end

@implementation CTSatelliteMessagingProvisioning

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSatelliteMessagingProvisioning *)self cfg_id];
  [v3 appendFormat:@", cfg_id=%@", v4];

  v5 = [(CTSatelliteMessagingProvisioning *)self cfg];
  [v3 appendFormat:@", cfg=%@", v5];

  v6 = [(CTSatelliteMessagingProvisioning *)self sps_environment];
  [v3 appendFormat:@", env=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (CTSatelliteMessagingProvisioning)initWithID:(id)a3 data:(id)a4 sps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CTSatelliteMessagingProvisioning;
  v11 = [(CTSatelliteMessagingProvisioning *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CTSatelliteMessagingProvisioning *)v11 setCfg_id:v8];
    [(CTSatelliteMessagingProvisioning *)v12 setCfg:v9];
    [(CTSatelliteMessagingProvisioning *)v12 setSps_environment:v10];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSatelliteMessagingProvisioning *)self cfg_id];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setCfg_id:", v6);

  v7 = [(CTSatelliteMessagingProvisioning *)self cfg];
  id v8 = (void *)[v7 copy];
  [v4 setCfg:v8];

  id v9 = [(CTSatelliteMessagingProvisioning *)self sps_environment];
  id v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setSps_environment:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTSatelliteMessagingProvisioning *)self cfg_id];
  [v4 encodeObject:v5 forKey:@"cfg_idx"];

  v6 = [(CTSatelliteMessagingProvisioning *)self cfg];
  [v4 encodeObject:v6 forKey:@"cfg"];

  id v7 = [(CTSatelliteMessagingProvisioning *)self sps_environment];
  [v4 encodeObject:v7 forKey:@"sps_environment"];
}

- (CTSatelliteMessagingProvisioning)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSatelliteMessagingProvisioning;
  v5 = [(CTSatelliteMessagingProvisioning *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cfg_idx"];
    cfg_id = v5->_cfg_id;
    v5->_cfg_id = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cfg"];
    cfg = v5->_cfg;
    v5->_cfg = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sps_environment"];
    sps_environment = v5->_sps_environment;
    v5->_sps_environment = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)cfg_id
{
  return self->_cfg_id;
}

- (void)setCfg_id:(id)a3
{
}

- (NSData)cfg
{
  return self->_cfg;
}

- (void)setCfg:(id)a3
{
}

- (NSString)sps_environment
{
  return self->_sps_environment;
}

- (void)setSps_environment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sps_environment, 0);
  objc_storeStrong((id *)&self->_cfg, 0);

  objc_storeStrong((id *)&self->_cfg_id, 0);
}

@end