@interface THCredentials
+ (BOOL)supportsSecureCoding;
- (NSData)PSKC;
- (NSData)activeOperationalDataSet;
- (NSData)borderAgentID;
- (NSData)extendedPANID;
- (NSData)networkKey;
- (NSData)panID;
- (NSDate)creationDate;
- (NSDate)lastModificationDate;
- (NSString)networkName;
- (THCredentials)initWithCoder:(id)a3;
- (id)initThreadCredentials:(id)a3 extendedPANID:(id)a4 borderAgentID:(id)a5 activeOperationalDataSet:(id)a6 PSKC:(id)a7 networkKey:(id)a8 channel:(unsigned __int8)a9 panID:(id)a10 creationDate:(id)a11 lastModificationDate:(id)a12;
- (uint8_t)channel;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(uint8_t)channel;
@end

@implementation THCredentials

- (id)initThreadCredentials:(id)a3 extendedPANID:(id)a4 borderAgentID:(id)a5 activeOperationalDataSet:(id)a6 PSKC:(id)a7 networkKey:(id)a8 channel:(unsigned __int8)a9 panID:(id)a10 creationDate:(id)a11 lastModificationDate:(id)a12
{
  id v33 = a3;
  id obj = a4;
  id v19 = a4;
  id v29 = a5;
  id v20 = a5;
  id v30 = a6;
  id v21 = a6;
  id v31 = a7;
  id v34 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  id v32 = a12;
  v35.receiver = self;
  v35.super_class = (Class)THCredentials;
  v25 = [(THCredentials *)&v35 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_networkName, a3);
    objc_storeStrong((id *)&v26->_extendedPANID, obj);
    objc_storeStrong((id *)&v26->_borderAgentID, v29);
    objc_storeStrong((id *)&v26->_activeOperationalDataSet, v30);
    objc_storeStrong((id *)&v26->_PSKC, v31);
    objc_storeStrong((id *)&v26->_networkKey, a8);
    v26->_channel = a9;
    objc_storeStrong((id *)&v26->_panID, a10);
    objc_storeStrong((id *)&v26->_creationDate, a11);
    objc_storeStrong((id *)&v26->_lastModificationDate, a12);
  }

  return v26;
}

- (THCredentials)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"xp"];
  uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ba"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nk"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"psk"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ch"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"panid"];
  uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dscreds"];
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cr"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lm"];

  v13 = (void *)v5;
  v14 = 0;
  v28 = v13;
  id v29 = v9;
  if (v13 && v6)
  {
    v25 = v7;
    v15 = (void *)v11;
    v16 = self;
    if (v9) {
      char v17 = [v9 charValue];
    }
    else {
      char v17 = -1;
    }
    id v21 = (void *)v26;
    id v20 = (void *)v27;
    id v24 = v15;
    id v19 = v15;
    LOBYTE(v23) = v17;
    v7 = v25;
    v18 = (THCredentials *)[(THCredentials *)v16 initThreadCredentials:v13 extendedPANID:v6 borderAgentID:v27 activeOperationalDataSet:v26 PSKC:v8 networkKey:v25 channel:v23 panID:v10 creationDate:v24 lastModificationDate:v12];
    v14 = v18;
  }
  else
  {
    v18 = self;
    id v19 = (void *)v11;
    id v21 = (void *)v26;
    id v20 = (void *)v27;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  id v4 = [(THCredentials *)self networkName];
  [v14 encodeObject:v4 forKey:@"name"];

  uint64_t v5 = [(THCredentials *)self extendedPANID];
  [v14 encodeObject:v5 forKey:@"xp"];

  v6 = [(THCredentials *)self borderAgentID];
  [v14 encodeObject:v6 forKey:@"ba"];

  v7 = [(THCredentials *)self networkKey];
  [v14 encodeObject:v7 forKey:@"nk"];

  v8 = [(THCredentials *)self PSKC];
  [v14 encodeObject:v8 forKey:@"psk"];

  if ([(THCredentials *)self channel] == 255)
  {
    [v14 encodeObject:0 forKey:@"ch"];
  }
  else
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[THCredentials channel](self, "channel"));
    [v14 encodeObject:v9 forKey:@"ch"];
  }
  v10 = [(THCredentials *)self panID];
  [v14 encodeObject:v10 forKey:@"panid"];

  uint64_t v11 = [(THCredentials *)self activeOperationalDataSet];
  [v14 encodeObject:v11 forKey:@"dscreds"];

  v12 = [(THCredentials *)self creationDate];
  [v14 encodeObject:v12 forKey:@"cr"];

  v13 = [(THCredentials *)self lastModificationDate];
  [v14 encodeObject:v13 forKey:@"lm"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)networkName
{
  return self->_networkName;
}

- (NSData)extendedPANID
{
  return self->_extendedPANID;
}

- (NSData)borderAgentID
{
  return self->_borderAgentID;
}

- (NSData)activeOperationalDataSet
{
  return self->_activeOperationalDataSet;
}

- (NSData)networkKey
{
  return self->_networkKey;
}

- (NSData)PSKC
{
  return self->_PSKC;
}

- (uint8_t)channel
{
  return self->_channel;
}

- (void)setChannel:(uint8_t)channel
{
  self->_channel = channel;
}

- (NSData)panID
{
  return self->_panID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModificationDate
{
  return self->_lastModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_panID, 0);
  objc_storeStrong((id *)&self->_PSKC, 0);
  objc_storeStrong((id *)&self->_networkKey, 0);
  objc_storeStrong((id *)&self->_activeOperationalDataSet, 0);
  objc_storeStrong((id *)&self->_borderAgentID, 0);
  objc_storeStrong((id *)&self->_extendedPANID, 0);

  objc_storeStrong((id *)&self->_networkName, 0);
}

@end