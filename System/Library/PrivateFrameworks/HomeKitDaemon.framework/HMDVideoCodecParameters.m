@interface HMDVideoCodecParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDVideoCodecParameters)initWithCoder:(id)a3;
- (HMDVideoCodecParameters)initWithProfiles:(id)a3 levels:(id)a4 packetizationModes:(id)a5;
- (NSArray)h264Profiles;
- (NSArray)levels;
- (NSArray)packetizationModes;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDVideoCodecParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetizationModes, 0);
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_h264Profiles, 0);
}

- (NSArray)packetizationModes
{
  return self->_packetizationModes;
}

- (NSArray)levels
{
  return self->_levels;
}

- (NSArray)h264Profiles
{
  return self->_h264Profiles;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDVideoCodecParameters *)self h264Profiles];
  [v4 encodeObject:v5 forKey:@"kVideoCodecParameters__ProfileID"];

  v6 = [(HMDVideoCodecParameters *)self levels];
  [v4 encodeObject:v6 forKey:@"kVideoCodecParameters__Level"];

  id v7 = [(HMDVideoCodecParameters *)self packetizationModes];
  [v4 encodeObject:v7 forKey:@"kVideoCodecParameters__PacketizationMode"];
}

- (HMDVideoCodecParameters)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDVideoCodecParameters;
  v5 = [(HMDVideoCodecParameters *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kVideoCodecParameters__ProfileID"];
    h264Profiles = v5->_h264Profiles;
    v5->_h264Profiles = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kVideoCodecParameters__Level"];
    levels = v5->_levels;
    v5->_levels = (NSArray *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kVideoCodecParameters__PacketizationMode"];
    packetizationModes = v5->_packetizationModes;
    v5->_packetizationModes = (NSArray *)v19;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDVideoCodecParameters *)self h264Profiles];
  v10 = arrayToString(v9, v6);
  [v7 appendFormat:@"\n %@ h264Profile = %@ ", v6, v10];

  v11 = [(HMDVideoCodecParameters *)self levels];
  v12 = arrayToString(v11, v6);
  [v7 appendFormat:@"\n %@ levels = %@", v6, v12];

  id v14 = [(HMDVideoCodecParameters *)self packetizationModes];
  v13 = arrayToString(v14, v6);
  [v7 appendFormat:@"\n %@ packetizationModes = %@", v6, v13];
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x263F35AD8] creator];
  id v4 = NSNumber;
  v5 = [(HMDVideoCodecParameters *)self h264Profiles];
  id v6 = [v5 objectAtIndex:0];
  id v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "h264Profile"));
  [v3 addTLV:1 number:v7];

  v8 = NSNumber;
  uint64_t v9 = [(HMDVideoCodecParameters *)self levels];
  v10 = [v9 objectAtIndex:0];
  v11 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v10, "h264Level"));
  [v3 addTLV:2 number:v11];

  v12 = NSNumber;
  v13 = [(HMDVideoCodecParameters *)self packetizationModes];
  id v14 = [v13 objectAtIndex:0];
  v15 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v14, "packetizationMode"));
  [v3 addTLV:3 number:v15];

  v16 = [v3 serialize];

  return (NSData *)v16;
}

- (BOOL)_parseFromTLVData
{
  v15[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F358B8] wrappertlv:1 name:@"kVideoCodecParameters__ProfileID" objectCreator:&__block_literal_global_6405];
  id v4 = [MEMORY[0x263F358B8] wrappertlv:2 name:@"kVideoCodecParameters__Level" objectCreator:&__block_literal_global_112];
  v5 = [MEMORY[0x263F358B8] wrappertlv:3 name:@"kVideoCodecParameters__PacketizationMode" objectCreator:&__block_literal_global_115];
  v15[0] = v3;
  v15[1] = v4;
  v15[2] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    v8 = [v3 field];
    h264Profiles = self->_h264Profiles;
    self->_h264Profiles = v8;

    v10 = [v4 field];
    levels = self->_levels;
    self->_levels = v10;

    v12 = [v5 field];
    packetizationModes = self->_packetizationModes;
    self->_packetizationModes = v12;
  }
  return v7;
}

HMDPacketizationMode *__44__HMDVideoCodecParameters__parseFromTLVData__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDPacketizationMode alloc] initWithTLVData:v2];

  return v3;
}

HMDH264Level *__44__HMDVideoCodecParameters__parseFromTLVData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDH264Level alloc] initWithTLVData:v2];

  return v3;
}

HMDH264Profile *__44__HMDVideoCodecParameters__parseFromTLVData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HMDH264Profile alloc] initWithTLVData:v2];

  return v3;
}

- (HMDVideoCodecParameters)initWithProfiles:(id)a3 levels:(id)a4 packetizationModes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDVideoCodecParameters;
  v12 = [(HMDVideoCodecParameters *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_h264Profiles, a3);
    objc_storeStrong((id *)&v13->_levels, a4);
    objc_storeStrong((id *)&v13->_packetizationModes, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end