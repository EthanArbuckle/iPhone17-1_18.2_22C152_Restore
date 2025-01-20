@interface HAPThreadNetworkMetadata
+ (id)shortDescription;
- (HAPThreadNetworkMetadata)initWithActiveOperationalDataSet:(id)a3;
- (HAPThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9 activeOperationalDataSet:(id)a10;
- (NSData)PANID;
- (NSData)PSKc;
- (NSData)activeOperationalDataSet;
- (NSData)extendedPANID;
- (NSData)masterKey;
- (NSString)name;
- (NSString)passPhrase;
- (id)attributeDescriptions;
- (id)description;
- (id)shortDescription;
- (unsigned)channel;
@end

@implementation HAPThreadNetworkMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeOperationalDataSet, 0);
  objc_storeStrong((id *)&self->_PSKc, 0);
  objc_storeStrong((id *)&self->_passPhrase, 0);
  objc_storeStrong((id *)&self->_masterKey, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);
  objc_storeStrong((id *)&self->_PANID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSData)activeOperationalDataSet
{
  return self->_activeOperationalDataSet;
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

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HAPThreadNetworkMetadata *)self name];
  v5 = (void *)[v3 initWithName:@"Name" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[HAPThreadNetworkMetadata channel](self, "channel"));
  v8 = (void *)[v6 initWithName:@"Channel" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HAPThreadNetworkMetadata *)self PANID];
  v11 = (void *)[v9 initWithName:@"PAN ID" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HAPThreadNetworkMetadata *)self extendedPANID];
  v14 = (void *)[v12 initWithName:@"extended PAN ID" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (id)description
{
  return (id)MEMORY[0x1F411CB90](self, a2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (HAPThreadNetworkMetadata)initWithActiveOperationalDataSet:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HAPThreadNetworkMetadata;
  v5 = [(HAPThreadNetworkMetadata *)&v16 init];
  id v6 = v5;
  if (v5)
  {
    name = v5->_name;
    v5->_name = 0;

    v6->_channel = -1;
    PANID = v6->_PANID;
    v6->_PANID = 0;

    extendedPANID = v6->_extendedPANID;
    v6->_extendedPANID = 0;

    masterKey = v6->_masterKey;
    v6->_masterKey = 0;

    passPhrase = v6->_passPhrase;
    v6->_passPhrase = 0;

    PSKc = v6->_PSKc;
    v6->_PSKc = 0;

    uint64_t v13 = [v4 copy];
    activeOperationalDataSet = v6->_activeOperationalDataSet;
    v6->_activeOperationalDataSet = (NSData *)v13;
  }
  return v6;
}

- (HAPThreadNetworkMetadata)initWithName:(id)a3 channel:(unsigned __int8)a4 PANID:(id)a5 extendedPANID:(id)a6 masterKey:(id)a7 passPhrase:(id)a8 PSKc:(id)a9 activeOperationalDataSet:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)HAPThreadNetworkMetadata;
  v23 = [(HAPThreadNetworkMetadata *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    name = v23->_name;
    v23->_name = (NSString *)v24;

    v23->_channel = a4;
    uint64_t v26 = [v17 copy];
    PANID = v23->_PANID;
    v23->_PANID = (NSData *)v26;

    uint64_t v28 = [v18 copy];
    extendedPANID = v23->_extendedPANID;
    v23->_extendedPANID = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    masterKey = v23->_masterKey;
    v23->_masterKey = (NSData *)v30;

    uint64_t v32 = [v20 copy];
    passPhrase = v23->_passPhrase;
    v23->_passPhrase = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    PSKc = v23->_PSKc;
    v23->_PSKc = (NSData *)v34;

    uint64_t v36 = [v22 copy];
    activeOperationalDataSet = v23->_activeOperationalDataSet;
    v23->_activeOperationalDataSet = (NSData *)v36;
  }
  return v23;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end