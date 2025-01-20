@interface HMDSRTPParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)_parseFromTLVData;
- (BOOL)isCompatibleWithRemoteSRTPParameters:(id)a3;
- (HMDSRTPCryptoSuite)srtpCryptoSuite;
- (HMDSRTPParameters)initWithCoder:(id)a3;
- (HMDSRTPParameters)initWithCryptoSuite:(id)a3 masterKey:(id)a4 masterSalt:(id)a5;
- (NSData)srtpMasterKey;
- (NSData)srtpMasterSalt;
- (NSData)tlvData;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSRTPParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srtpMasterSalt, 0);
  objc_storeStrong((id *)&self->_srtpMasterKey, 0);
  objc_storeStrong((id *)&self->_srtpCryptoSuite, 0);
}

- (NSData)srtpMasterSalt
{
  return self->_srtpMasterSalt;
}

- (NSData)srtpMasterKey
{
  return self->_srtpMasterKey;
}

- (HMDSRTPCryptoSuite)srtpCryptoSuite
{
  return self->_srtpCryptoSuite;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSRTPParameters *)self srtpCryptoSuite];
  [v4 encodeObject:v5 forKey:@"kSRTPParameters_SRTPCryptoSuite"];

  v6 = [(HMDSRTPParameters *)self srtpMasterKey];
  [v4 encodeObject:v6 forKey:@"kSRTPParameters_SRTPMasterKey"];

  id v7 = [(HMDSRTPParameters *)self srtpMasterSalt];
  [v4 encodeObject:v7 forKey:@"kSRTPParameters_SRTPMasterSalt"];
}

- (HMDSRTPParameters)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDSRTPParameters;
  v5 = [(HMDSRTPParameters *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kSRTPParameters_SRTPCryptoSuite"];
    srtpCryptoSuite = v5->_srtpCryptoSuite;
    v5->_srtpCryptoSuite = (HMDSRTPCryptoSuite *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kSRTPParameters_SRTPMasterKey"];
    srtpMasterKey = v5->_srtpMasterKey;
    v5->_srtpMasterKey = (NSData *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"kSRTPParameters_SRTPMasterSalt"];
    srtpMasterSalt = v5->_srtpMasterSalt;
    v5->_srtpMasterSalt = (NSData *)v19;
  }
  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HAPTLVBase *)self tlvDatablob];
  [v7 appendFormat:@"\n %@ tlvDatablob = %@ ", v6, v8];

  uint64_t v9 = [(HMDSRTPParameters *)self srtpMasterKey];
  [v7 appendFormat:@"\n %@ srtpMasterKey = %@ ", v6, v9];

  v10 = [(HMDSRTPParameters *)self srtpMasterSalt];
  [v7 appendFormat:@"\n %@ srtpMasterSalt = %@ ", v6, v10];

  id v11 = [(HMDSRTPParameters *)self srtpCryptoSuite];
  [v7 appendFormat:@"\n %@ srtpCryptoSuite = %@ ", v6, v11];
}

- (BOOL)_parseFromTLVData
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F5BD28] wrappertlv:2 name:@"kSRTPParameters_SRTPMasterKey"];
  id v4 = [MEMORY[0x1E4F5BD28] wrappertlv:3 name:@"kSRTPParameters_SRTPMasterSalt"];
  v5 = [MEMORY[0x1E4F5BDE8] wrappertlv:1 name:@"kSRTPParameters_SRTPCryptoSuite"];
  v19[0] = v3;
  v19[1] = v4;
  v19[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  BOOL v7 = [(HAPTLVBase *)self _parse:v6];
  if (v7)
  {
    v8 = [v5 field];
    unint64_t v9 = [v8 unsignedIntegerValue];

    v10 = [[HMDSRTPCryptoSuite alloc] initWithCryptoSuite:v9];
    srtpCryptoSuite = self->_srtpCryptoSuite;
    self->_srtpCryptoSuite = v10;

    if (v9 < 2)
    {
      v12 = [v3 field];
      srtpMasterKey = self->_srtpMasterKey;
      self->_srtpMasterKey = v12;

      uint64_t v14 = [v4 field];
LABEL_6:
      srtpMasterSalt = self->_srtpMasterSalt;
      self->_srtpMasterSalt = v14;

      goto LABEL_7;
    }
    if (v9 == 2)
    {
      v15 = [MEMORY[0x1E4F1C9B8] data];
      v16 = self->_srtpMasterKey;
      self->_srtpMasterKey = v15;

      uint64_t v14 = [MEMORY[0x1E4F1C9B8] data];
      goto LABEL_6;
    }
  }
LABEL_7:

  return v7;
}

- (NSData)tlvData
{
  v3 = [MEMORY[0x1E4F5BE50] creator];
  id v4 = [(HMDSRTPParameters *)self srtpMasterKey];
  [v3 addTLV:2 data:v4];

  v5 = [(HMDSRTPParameters *)self srtpMasterSalt];
  [v3 addTLV:3 data:v5];

  id v6 = NSNumber;
  BOOL v7 = [(HMDSRTPParameters *)self srtpCryptoSuite];
  v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "srtpCryptoSuite"));
  [v3 addTLV:1 number:v8];

  unint64_t v9 = [v3 serialize];

  return (NSData *)v9;
}

- (BOOL)isCompatibleWithRemoteSRTPParameters:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSRTPParameters *)self srtpCryptoSuite];
  id v6 = [v4 srtpCryptoSuite];
  int v7 = HMFEqualObjects();

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [(HMDSRTPParameters *)self srtpMasterKey];
  uint64_t v9 = [v8 length];
  v10 = [v4 srtpMasterKey];
  uint64_t v11 = [v10 length];

  if (v9 == v11)
  {
    v12 = [(HMDSRTPParameters *)self srtpMasterSalt];
    uint64_t v13 = [v12 length];
    uint64_t v14 = [v4 srtpMasterSalt];
    BOOL v15 = v13 == [v14 length];
  }
  else
  {
LABEL_4:
    BOOL v15 = 0;
  }

  return v15;
}

- (HMDSRTPParameters)initWithCryptoSuite:(id)a3 masterKey:(id)a4 masterSalt:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDSRTPParameters;
  v12 = [(HMDSRTPParameters *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_srtpCryptoSuite, a3);
    objc_storeStrong((id *)&v13->_srtpMasterKey, a4);
    objc_storeStrong((id *)&v13->_srtpMasterSalt, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end