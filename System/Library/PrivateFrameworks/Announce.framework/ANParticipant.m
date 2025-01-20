@interface ANParticipant
+ (BOOL)supportsSecureCoding;
- (ANParticipant)initWithCoder:(id)a3;
- (ANParticipant)initWithMessage:(id)a3;
- (ANParticipant)initWithSender:(id)a3;
- (BOOL)isAccessory;
- (BOOL)isEndpoint;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUser;
- (NSDictionary)info;
- (NSString)description;
- (NSString)homeKitID;
- (NSString)homeKitUserID;
- (NSString)idsID;
- (NSString)name;
- (NSString)rapportID;
- (NSString)userID;
- (id)copy;
- (id)message;
- (id)messageForCompanion;
- (unint64_t)hash;
- (void)clearIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeKitID:(id)a3;
- (void)setHomeKitUserID:(id)a3;
- (void)setIdsID:(id)a3;
- (void)setIsAccessory:(BOOL)a3;
- (void)setIsEndpoint:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRapportID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation ANParticipant

- (ANParticipant)initWithSender:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ANParticipant;
  v5 = [(ANParticipant *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 type];
    if (v6 == 2)
    {
LABEL_5:
      uint64_t v9 = [v4 identifier];
      rapportID = v5->_rapportID;
      v5->_rapportID = (NSString *)v9;

      goto LABEL_6;
    }
    if (v6 == 1)
    {
      uint64_t v7 = [v4 identifier];
      idsID = v5->_idsID;
      v5->_idsID = (NSString *)v7;

      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (NSDictionary)info
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(ANParticipant *)self name];
  [v3 setObject:v4 forKeyedSubscript:@"name"];

  v5 = [(ANParticipant *)self rapportID];
  [v3 setObject:v5 forKeyedSubscript:@"rapportID"];

  uint64_t v6 = [(ANParticipant *)self idsID];
  [v3 setObject:v6 forKeyedSubscript:@"idsID"];

  uint64_t v7 = [(ANParticipant *)self homeKitID];
  [v3 setObject:v7 forKeyedSubscript:@"homeKitID"];

  v8 = [(ANParticipant *)self homeKitUserID];
  [v3 setObject:v8 forKeyedSubscript:@"homeKitUserID"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ANParticipant isAccessory](self, "isAccessory"));
  [v3 setObject:v9 forKeyedSubscript:@"isAccessory"];

  v10 = [(ANParticipant *)self userID];
  [v3 setObject:v10 forKeyedSubscript:@"userID"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[ANParticipant isEndpoint](self, "isEndpoint"));
  [v3 setObject:v11 forKeyedSubscript:@"isEndpoint"];

  objc_super v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (NSString)description
{
  v2 = [(ANParticipant *)self info];
  id v3 = [v2 description];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_26;
  }
  v8 = [v6 homeKitID];
  if (!v8)
  {
LABEL_7:
    uint64_t v9 = [v7 homeKitUserID];
    if (v9)
    {
      id v3 = [(ANParticipant *)self homeKitUserID];
      id v4 = [v7 homeKitUserID];
      if ([v3 isEqualToString:v4])
      {
        char v10 = 1;
LABEL_21:

LABEL_22:
        if (v8)
        {
        }
        if (v10) {
          goto LABEL_25;
        }
LABEL_26:
        BOOL v20 = 0;
        goto LABEL_27;
      }
    }
    v11 = [v7 idsID];
    if (v11)
    {
      objc_super v12 = [(ANParticipant *)self idsID];
      v13 = [v7 idsID];
      if ([v12 isEqualToString:v13])
      {
        char v10 = 1;
        goto LABEL_19;
      }
      v22 = v13;
      v24 = v12;
    }
    uint64_t v14 = objc_msgSend(v7, "rapportID", v22, v24, v26, v27);
    if (v14)
    {
      v15 = (void *)v14;
      [(ANParticipant *)self rapportID];
      v16 = v4;
      v18 = v17 = v3;
      v19 = [v7 rapportID];
      char v10 = [v18 isEqualToString:v19];

      id v3 = v17;
      id v4 = v16;
    }
    else
    {
      char v10 = 0;
    }
    v13 = v23;
    objc_super v12 = v25;
    if (!v11)
    {
LABEL_20:
      if (!v9) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  id v3 = [(ANParticipant *)self homeKitID];
  id v4 = [v7 homeKitID];
  if (![v3 isEqualToString:v4])
  {
    v26 = v4;
    v27 = v3;
    goto LABEL_7;
  }

LABEL_25:
  BOOL v20 = 1;
LABEL_27:

  return v20;
}

- (unint64_t)hash
{
  id v3 = [(ANParticipant *)self homeKitID];
  uint64_t v4 = [v3 hash];
  v5 = [(ANParticipant *)self homeKitUserID];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(ANParticipant *)self idsID];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(ANParticipant *)self rapportID];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copy
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(ANParticipant *)self name];
  [v3 setName:v4];

  v5 = [(ANParticipant *)self rapportID];
  [v3 setRapportID:v5];

  uint64_t v6 = [(ANParticipant *)self idsID];
  [v3 setIdsID:v6];

  uint64_t v7 = [(ANParticipant *)self homeKitID];
  [v3 setHomeKitID:v7];

  uint64_t v8 = [(ANParticipant *)self homeKitUserID];
  [v3 setHomeKitUserID:v8];

  uint64_t v9 = [(ANParticipant *)self userID];
  [v3 setUserID:v9];

  objc_msgSend(v3, "setIsAccessory:", -[ANParticipant isAccessory](self, "isAccessory"));
  objc_msgSend(v3, "setIsEndpoint:", -[ANParticipant isEndpoint](self, "isEndpoint"));
  return v3;
}

- (void)clearIdentifiers
{
  [(ANParticipant *)self setName:&stru_26D2D46B0];
  [(ANParticipant *)self setRapportID:&stru_26D2D46B0];
  [(ANParticipant *)self setIdsID:&stru_26D2D46B0];
  if (![(ANParticipant *)self isAccessory]) {
    [(ANParticipant *)self setHomeKitID:&stru_26D2D46B0];
  }
  [(ANParticipant *)self setHomeKitUserID:&stru_26D2D46B0];

  [(ANParticipant *)self setUserID:&stru_26D2D46B0];
}

- (BOOL)isUser
{
  if (![(ANParticipant *)self isAccessory]) {
    return 1;
  }
  id v3 = [(ANParticipant *)self homeKitUserID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (ANParticipant)initWithMessage:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v18.receiver = self;
    v18.super_class = (Class)ANParticipant;
    v5 = [(ANParticipant *)&v18 init];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"homeKitID"];
      homeKitID = v5->_homeKitID;
      v5->_homeKitID = (NSString *)v6;

      uint64_t v8 = [v4 objectForKeyedSubscript:@"homeKitUserID"];
      homeKitUserID = v5->_homeKitUserID;
      v5->_homeKitUserID = (NSString *)v8;

      uint64_t v10 = [v4 objectForKeyedSubscript:@"userID"];
      userID = v5->_userID;
      v5->_userID = (NSString *)v10;

      uint64_t v12 = [v4 objectForKeyedSubscript:@"name"];
      name = v5->_name;
      v5->_name = (NSString *)v12;

      uint64_t v14 = [v4 objectForKeyedSubscript:@"isAccessory"];
      v5->_isAccessory = [v14 BOOLValue];
      v15 = [v4 objectForKeyedSubscript:@"isEndpoint"];
      v5->_isEndpoint = [v15 BOOLValue];
    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)message
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(ANParticipant *)self homeKitID];
  [v3 setObject:v4 forKeyedSubscript:@"homeKitID"];

  v5 = [(ANParticipant *)self homeKitUserID];
  [v3 setObject:v5 forKeyedSubscript:@"homeKitUserID"];

  uint64_t v6 = [(ANParticipant *)self userID];
  [v3 setObject:v6 forKeyedSubscript:@"userID"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ANParticipant isAccessory](self, "isAccessory"));
  [v3 setObject:v7 forKeyedSubscript:@"isAccessory"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ANParticipant isEndpoint](self, "isEndpoint"));
  [v3 setObject:v8 forKeyedSubscript:@"isEndpoint"];

  return v3;
}

- (id)messageForCompanion
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(ANParticipant *)self message];
  v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setObject:self->_name forKeyedSubscript:@"name"];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_rapportID forKey:@"rapportID"];
  [v5 encodeObject:self->_idsID forKey:@"idsID"];
  [v5 encodeObject:self->_homeKitID forKey:@"homeKitID"];
  [v5 encodeObject:self->_homeKitUserID forKey:@"homeKitUserID"];
  [v5 encodeObject:self->_userID forKey:@"userID"];
  uint64_t v6 = [NSNumber numberWithBool:self->_isAccessory];
  [v5 encodeObject:v6 forKey:@"isAccessory"];

  id v7 = [NSNumber numberWithBool:self->_isEndpoint];
  [v5 encodeObject:v7 forKey:@"isEndpoint"];
}

- (ANParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ANParticipant;
  id v5 = [(ANParticipant *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rapportID"];
    rapportID = v5->_rapportID;
    v5->_rapportID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsID"];
    idsID = v5->_idsID;
    v5->_idsID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeKitID"];
    homeKitID = v5->_homeKitID;
    v5->_homeKitID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeKitUserID"];
    homeKitUserID = v5->_homeKitUserID;
    v5->_homeKitUserID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
    userID = v5->_userID;
    v5->_userID = (NSString *)v16;

    objc_super v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAccessory"];
    v5->_isAccessory = [v18 BOOLValue];
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isEndpoint"];
    v5->_isEndpoint = [v19 BOOLValue];
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)rapportID
{
  return self->_rapportID;
}

- (void)setRapportID:(id)a3
{
}

- (NSString)idsID
{
  return self->_idsID;
}

- (void)setIdsID:(id)a3
{
}

- (NSString)homeKitID
{
  return self->_homeKitID;
}

- (void)setHomeKitID:(id)a3
{
}

- (NSString)homeKitUserID
{
  return self->_homeKitUserID;
}

- (void)setHomeKitUserID:(id)a3
{
}

- (BOOL)isAccessory
{
  return self->_isAccessory;
}

- (void)setIsAccessory:(BOOL)a3
{
  self->_isAccessory = a3;
}

- (BOOL)isEndpoint
{
  return self->_isEndpoint;
}

- (void)setIsEndpoint:(BOOL)a3
{
  self->_isEndpoint = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_homeKitUserID, 0);
  objc_storeStrong((id *)&self->_homeKitID, 0);
  objc_storeStrong((id *)&self->_idsID, 0);
  objc_storeStrong((id *)&self->_rapportID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end