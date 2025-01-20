@interface CTXPCFirmwareUpdateInfoResponse
+ (BOOL)supportsSecureCoding;
- (CTXPCFirmwareUpdateInfoResponse)initWithCoder:(id)a3;
- (CTXPCFirmwareUpdateInfoResponse)initWithFimwareUpdateInfo:(id)a3;
- (NSDictionary)firmwareInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setFirmwareInfo:(id)a3;
@end

@implementation CTXPCFirmwareUpdateInfoResponse

- (CTXPCFirmwareUpdateInfoResponse)initWithFimwareUpdateInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTXPCFirmwareUpdateInfoResponse;
  v6 = [(CTXPCMessage *)&v9 initWithNamedArguments:MEMORY[0x1E4F1CC08]];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_firmwareInfo, a3);
  }

  return v7;
}

- (NSDictionary)firmwareInfo
{
  return self->_firmwareInfo;
}

- (CTXPCFirmwareUpdateInfoResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTXPCFirmwareUpdateInfoResponse;
  id v5 = [(CTXPCMessage *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"firmware-update-info"];
    firmwareInfo = v5->_firmwareInfo;
    v5->_firmwareInfo = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CTXPCFirmwareUpdateInfoResponse;
  [(CTXPCMessage *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_firmwareInfo forKey:@"firmware-update-info"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setFirmwareInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end