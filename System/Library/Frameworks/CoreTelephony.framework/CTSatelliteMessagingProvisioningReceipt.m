@interface CTSatelliteMessagingProvisioningReceipt
+ (BOOL)supportsSecureCoding;
- (CTSatelliteMessagingProvisioningReceipt)initWithCoder:(id)a3;
- (CTSatelliteMessagingProvisioningReceipt)initWithID:(id)a3 result:(id)a4 sps:(id)a5;
- (NSError)result;
- (NSString)sps_environment;
- (NSUUID)cfg_id;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCfg_id:(id)a3;
- (void)setResult:(id)a3;
- (void)setSps_environment:(id)a3;
@end

@implementation CTSatelliteMessagingProvisioningReceipt

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSatelliteMessagingProvisioningReceipt *)self cfg_id];
  [v3 appendFormat:@", cfg_id=%@", v4];

  v5 = [(CTSatelliteMessagingProvisioningReceipt *)self result];
  [v3 appendFormat:@", result=%@", v5];

  v6 = [(CTSatelliteMessagingProvisioningReceipt *)self sps_environment];
  [v3 appendFormat:@", env=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (CTSatelliteMessagingProvisioningReceipt)initWithID:(id)a3 result:(id)a4 sps:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CTSatelliteMessagingProvisioningReceipt;
  v11 = [(CTSatelliteMessagingProvisioningReceipt *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CTSatelliteMessagingProvisioningReceipt *)v11 setCfg_id:v8];
    [(CTSatelliteMessagingProvisioningReceipt *)v12 setResult:v9];
    [(CTSatelliteMessagingProvisioningReceipt *)v12 setSps_environment:v10];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSatelliteMessagingProvisioningReceipt *)self cfg_id];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setCfg_id:", v6);

  v7 = [(CTSatelliteMessagingProvisioningReceipt *)self result];
  id v8 = (void *)[v7 copy];
  [v4 setResult:v8];

  id v9 = [(CTSatelliteMessagingProvisioningReceipt *)self sps_environment];
  id v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setSps_environment:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTSatelliteMessagingProvisioningReceipt *)self cfg_id];
  [v4 encodeObject:v5 forKey:@"cfg_idx"];

  v6 = [(CTSatelliteMessagingProvisioningReceipt *)self result];
  [v4 encodeObject:v6 forKey:@"result"];

  id v7 = [(CTSatelliteMessagingProvisioningReceipt *)self sps_environment];
  [v4 encodeObject:v7 forKey:@"sps_environment"];
}

- (CTSatelliteMessagingProvisioningReceipt)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSatelliteMessagingProvisioningReceipt;
  v5 = [(CTSatelliteMessagingProvisioningReceipt *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cfg_idx"];
    cfg_id = v5->_cfg_id;
    v5->_cfg_id = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    id v9 = v5->_result;
    v5->_result = (NSError *)v8;

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

- (NSError)result
{
  return self->_result;
}

- (void)setResult:(id)a3
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
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_cfg_id, 0);
}

@end