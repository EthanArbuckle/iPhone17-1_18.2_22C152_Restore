@interface HMDSelectedRTPParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (HMDSelectedRTPParameters)initWithCoder:(id)a3;
- (HMDSelectedRTPParameters)initWithPayloadType:(id)a3 maximumBitrate:(id)a4 minimumBitrate:(id)a5 rtcpInterval:(id)a6 comfortNoisePayloadType:(id)a7;
- (NSData)tlvData;
- (NSNumber)comfortNoisePayloadType;
- (NSNumber)maxMTU;
- (NSNumber)maximumBitrate;
- (NSNumber)minimumBitrate;
- (NSNumber)payloadType;
- (NSNumber)rtcpInterval;
- (NSNumber)synchronizationSource;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxMTU:(id)a3;
- (void)setSynchronizationSource:(id)a3;
@end

@implementation HMDSelectedRTPParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comfortNoisePayloadType, 0);
  objc_storeStrong((id *)&self->_maxMTU, 0);
  objc_storeStrong((id *)&self->_rtcpInterval, 0);
  objc_storeStrong((id *)&self->_minimumBitrate, 0);
  objc_storeStrong((id *)&self->_maximumBitrate, 0);
  objc_storeStrong((id *)&self->_synchronizationSource, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

- (NSNumber)comfortNoisePayloadType
{
  return self->_comfortNoisePayloadType;
}

- (void)setMaxMTU:(id)a3
{
}

- (NSNumber)maxMTU
{
  return self->_maxMTU;
}

- (NSNumber)rtcpInterval
{
  return self->_rtcpInterval;
}

- (NSNumber)minimumBitrate
{
  return self->_minimumBitrate;
}

- (NSNumber)maximumBitrate
{
  return self->_maximumBitrate;
}

- (void)setSynchronizationSource:(id)a3
{
}

- (NSNumber)synchronizationSource
{
  return self->_synchronizationSource;
}

- (NSNumber)payloadType
{
  return self->_payloadType;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSelectedRTPParameters *)self payloadType];
  [v4 encodeObject:v5 forKey:@"kRTPParameters_PayloadType"];

  v6 = [(HMDSelectedRTPParameters *)self synchronizationSource];
  [v4 encodeObject:v6 forKey:@"kRTPParameters_SynchronizationSource"];

  v7 = [(HMDSelectedRTPParameters *)self minimumBitrate];
  [v4 encodeObject:v7 forKey:@"kRTPParameters_MinimumVideoBandwidth"];

  v8 = [(HMDSelectedRTPParameters *)self maximumBitrate];
  [v4 encodeObject:v8 forKey:@"kRTPParameters_MaximumVideoBandwidth"];

  v9 = [(HMDSelectedRTPParameters *)self rtcpInterval];
  [v4 encodeObject:v9 forKey:@"kRTPParameters_RTCPInterval"];

  v10 = [(HMDSelectedRTPParameters *)self maxMTU];
  [v4 encodeObject:v10 forKey:@"kRTPParameters_MaxMTU"];

  id v11 = [(HMDSelectedRTPParameters *)self comfortNoisePayloadType];
  [v4 encodeObject:v11 forKey:@"kRTPParameters_ComfortNoisePayloadType"];
}

- (HMDSelectedRTPParameters)initWithCoder:(id)a3
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HMDSelectedRTPParameters;
  v5 = [(HMDSelectedRTPParameters *)&v42 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v49[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kRTPParameters_PayloadType"];
    payloadType = v5->_payloadType;
    v5->_payloadType = (NSNumber *)v9;

    id v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v48 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kRTPParameters_SynchronizationSource"];
    synchronizationSource = v5->_synchronizationSource;
    v5->_synchronizationSource = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kRTPParameters_MinimumVideoBandwidth"];
    minimumBitrate = v5->_minimumBitrate;
    v5->_minimumBitrate = (NSNumber *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    v23 = [v21 setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"kRTPParameters_MaximumVideoBandwidth"];
    maximumBitrate = v5->_maximumBitrate;
    v5->_maximumBitrate = (NSNumber *)v24;

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    v28 = [v26 setWithArray:v27];
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"kRTPParameters_RTCPInterval"];
    rtcpInterval = v5->_rtcpInterval;
    v5->_rtcpInterval = (NSNumber *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v44 = objc_opt_class();
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    v33 = [v31 setWithArray:v32];
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"kRTPParameters_MaxMTU"];
    maxMTU = v5->_maxMTU;
    v5->_maxMTU = (NSNumber *)v34;

    v36 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v43 = objc_opt_class();
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    v38 = [v36 setWithArray:v37];
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"kRTPParameters_ComfortNoisePayloadType"];
    comfortNoisePayloadType = v5->_comfortNoisePayloadType;
    v5->_comfortNoisePayloadType = (NSNumber *)v39;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDSelectedRTPParameters *)self synchronizationSource];
  [v7 appendFormat:@"\n %@ syncSource = %@ ", v6, v9];

  v10 = [(HMDSelectedRTPParameters *)self payloadType];
  [v7 appendFormat:@"\n %@ payloadType = %@ ", v6, v10];

  id v11 = [(HMDSelectedRTPParameters *)self minimumBitrate];
  [v7 appendFormat:@"\n %@ minimumBitrate = %@ ", v6, v11];

  v12 = [(HMDSelectedRTPParameters *)self maximumBitrate];
  [v7 appendFormat:@"\n %@ maximumBitrate = %@ ", v6, v12];

  v13 = [(HMDSelectedRTPParameters *)self rtcpInterval];
  [v7 appendFormat:@"\n %@ rtcpInterval = %@ ", v6, v13];

  uint64_t v14 = [(HMDSelectedRTPParameters *)self maxMTU];
  [v7 appendFormat:@"\n %@ maxMTU = %@ ", v6, v14];

  id v15 = [(HMDSelectedRTPParameters *)self comfortNoisePayloadType];
  [v7 appendFormat:@"\n %@ comfortNoisePayloadType = %@ ", v6, v15];
}

- (BOOL)_parseFromTLVData
{
  v34[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kRTPParameters_PayloadType"];
  id v4 = [MEMORY[0x1E4F5BDE8] wrappertlv:2 name:@"kRTPParameters_SynchronizationSource"];
  v5 = [MEMORY[0x1E4F5BDE8] wrappertlv:3 name:@"kRTPParameters_MinimumVideoBandwidth"];
  id v6 = [MEMORY[0x1E4F5BDE8] wrappertlv:4 name:@"kRTPParameters_RTCPInterval"];
  id v7 = [MEMORY[0x1E4F5BDE8] wrappertlv:5 name:@"kRTPParameters_MaxMTU"];
  v8 = [MEMORY[0x1E4F5BDE8] wrappertlv:6 name:@"kRTPParameters_ComfortNoisePayloadType"];
  v32 = (void *)v3;
  v34[0] = v3;
  v34[1] = v4;
  uint64_t v9 = v4;
  v34[2] = v5;
  v34[3] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  v33[0] = v7;
  v33[1] = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  LODWORD(v12) = [(HAPTLVBase *)self _parseMandatory:v10 optional:v11];
  if (v12)
  {
    v13 = [v4 field];
    synchronizationSource = self->_synchronizationSource;
    self->_synchronizationSource = v13;

    id v15 = [v32 field];
    payloadType = self->_payloadType;
    self->_payloadType = v15;

    [v5 field];
    v17 = v11;
    v18 = v8;
    v12 = char v19 = (char)v12;
    v31 = v7;
    uint64_t v20 = [v12 unsignedIntegerValue];

    LOBYTE(v12) = v19;
    v8 = v18;
    id v11 = v17;
    uint64_t v21 = 1000 * v20;
    uint64_t v9 = v4;
    id v7 = v31;
    v22 = [NSNumber numberWithUnsignedInteger:v21];
    minimumBitrate = self->_minimumBitrate;
    self->_minimumBitrate = v22;

    uint64_t v24 = [v6 field];
    rtcpInterval = self->_rtcpInterval;
    self->_rtcpInterval = v24;

    v26 = [v31 field];
    maxMTU = self->_maxMTU;
    self->_maxMTU = v26;

    v28 = [v8 field];
    comfortNoisePayloadType = self->_comfortNoisePayloadType;
    self->_comfortNoisePayloadType = v28;
  }
  return (char)v12;
}

- (NSData)tlvData
{
  uint64_t v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDSelectedRTPParameters *)self payloadType];
  [v3 addTLV:1 length:1 number:v4];

  v5 = [(HMDSelectedRTPParameters *)self synchronizationSource];
  [v3 addTLV:2 length:4 number:v5];

  id v6 = [(HMDSelectedRTPParameters *)self minimumBitrate];
  unint64_t v7 = [v6 unsignedIntegerValue] / 0x3E8uLL;

  v8 = [NSNumber numberWithUnsignedInteger:v7];
  [v3 addTLV:3 length:2 number:v8];

  uint64_t v9 = [(HMDSelectedRTPParameters *)self rtcpInterval];
  [v3 addTLV:4 length:4 floatNumber:v9];

  v10 = [(HMDSelectedRTPParameters *)self maxMTU];
  [v3 addTLV:5 length:2 number:v10];

  id v11 = [(HMDSelectedRTPParameters *)self comfortNoisePayloadType];
  [v3 addTLV:6 length:1 number:v11];

  v12 = [v3 serialize];

  return (NSData *)v12;
}

- (HMDSelectedRTPParameters)initWithPayloadType:(id)a3 maximumBitrate:(id)a4 minimumBitrate:(id)a5 rtcpInterval:(id)a6 comfortNoisePayloadType:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDSelectedRTPParameters;
  v17 = [(HMDSelectedRTPParameters *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_payloadType, a3);
    objc_storeStrong((id *)&v18->_maximumBitrate, a4);
    objc_storeStrong((id *)&v18->_minimumBitrate, a5);
    objc_storeStrong((id *)&v18->_rtcpInterval, a6);
    objc_storeStrong((id *)&v18->_comfortNoisePayloadType, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end