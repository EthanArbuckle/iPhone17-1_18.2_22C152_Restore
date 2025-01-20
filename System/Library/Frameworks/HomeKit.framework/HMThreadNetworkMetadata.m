@interface HMThreadNetworkMetadata
+ (BOOL)supportsSecureCoding;
- (HMThreadNetworkMetadata)initWithCoder:(id)a3;
- (HMThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9;
- (HMThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9 operationalDataset:(id)a10;
- (NSData)PANID;
- (NSData)PSKc;
- (NSData)extendedPANID;
- (NSData)masterKey;
- (NSData)operationalDataset;
- (NSString)name;
- (NSString)passPhrase;
- (unsigned)channel;
- (void)encodeWithCoder:(id)a3;
- (void)setOperationalDataset:(id)a3;
@end

@implementation HMThreadNetworkMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationalDataset, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_passPhrase, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_PANID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setOperationalDataset:(id)a3
{
}

- (NSData)operationalDataset
{
  return self->_operationalDataset;
}

- (NSData)PSKc
{
  return self->_PSKc;
}

- (NSString)passPhrase
{
  return self->_passPhrase;
}

- (NSData)masterKey
{
  return self->_masterKey;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (NSData)PANID
{
  return self->_PANID;
}

- (unsigned)channel
{
  return self->_channel;
}

- (NSString)name
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMThreadNetworkMetadata *)self name];
  [v4 encodeObject:v5 forKey:@"HMTNMN.name"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HMThreadNetworkMetadata channel](self, "channel"));
  [v4 encodeObject:v6 forKey:@"HMTNMN.channel"];

  v7 = [(HMThreadNetworkMetadata *)self PANID];
  [v4 encodeObject:v7 forKey:@"HMTNMN.panid"];

  v8 = [(HMThreadNetworkMetadata *)self extendedPANID];
  [v4 encodeObject:v8 forKey:@"HMTNMN.xpanid"];

  v9 = [(HMThreadNetworkMetadata *)self passPhrase];
  [v4 encodeObject:v9 forKey:@"HMTNMN.passPhrase"];

  v10 = [(HMThreadNetworkMetadata *)self PSKc];
  [v4 encodeObject:v10 forKey:@"HMTNMN.PSKc"];

  id v11 = [(HMThreadNetworkMetadata *)self operationalDataset];
  [v4 encodeObject:v11 forKey:@"HMTNMN.AOD"];
}

- (HMThreadNetworkMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.name"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.channel"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.panid"];
      if (v7)
      {
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.xpanid"];
        if (v8)
        {
          v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.passPhrase"];
          v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.PSKc"];
          id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMTNMN.AOD"];
          self = -[HMThreadNetworkMetadata initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:](self, "initWithName:channel:PANID:extendedPANID:masterKey:passPhrase:PSKc:operationalDataset:", v5, [v6 unsignedCharValue], v7, v8, 0, v9, v10, v11);

          v12 = self;
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HMThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9 operationalDataset:(id)a10
{
  uint64_t v14 = a4;
  id v17 = a10;
  v18 = [(HMThreadNetworkMetadata *)self initWithName:a3 channel:v14 PANID:a5 extendedPANID:a6 masterKey:a7 passPhrase:a8 PSKc:a9];
  v19 = (void *)[v17 copy];

  [(HMThreadNetworkMetadata *)v18 setOperationalDataset:v19];
  return v18;
}

- (HMThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v35.receiver = self;
  v35.super_class = (Class)HMThreadNetworkMetadata;
  v21 = [(HMThreadNetworkMetadata *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    name = v21->_name;
    v21->_name = (NSString *)v22;

    v21->_channel = a4;
    uint64_t v24 = [v16 copy];
    PANID = v21->_PANID;
    v21->_PANID = (NSData *)v24;

    uint64_t v26 = [v17 copy];
    extendedPANID = v21->_extendedPANID;
    v21->_extendedPANID = (NSData *)v26;

    uint64_t v28 = [v18 copy];
    masterKey = v21->_masterKey;
    v21->_masterKey = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    passPhrase = v21->_passPhrase;
    v21->_passPhrase = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    PSKc = v21->_PSKc;
    v21->_PSKc = (NSData *)v32;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end