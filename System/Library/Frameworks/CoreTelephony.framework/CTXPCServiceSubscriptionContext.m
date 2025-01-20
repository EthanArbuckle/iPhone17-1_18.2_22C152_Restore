@interface CTXPCServiceSubscriptionContext
+ (BOOL)supportsSecureCoding;
+ (CTXPCServiceSubscriptionContext)contextWithServiceDescriptor:(id)a3;
+ (CTXPCServiceSubscriptionContext)contextWithSlot:(int64_t)a3;
+ (CTXPCServiceSubscriptionContext)contextWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSimDataOnly;
- (BOOL)isSimGood;
- (BOOL)isSimHidden;
- (BOOL)isSimPresent;
- (CTXPCServiceSubscriptionContext)initWithCoder:(id)a3;
- (CTXPCServiceSubscriptionContext)initWithSlot:(int64_t)a3;
- (CTXPCServiceSubscriptionContext)initWithUUID:(id)a3;
- (CTXPCServiceSubscriptionContext)initWithUUID:(id)a3 andSlot:(int64_t)a4;
- (NSNumber)userDataPreferred;
- (NSNumber)userDefaultVoice;
- (NSString)label;
- (NSString)labelID;
- (NSString)phoneNumber;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (int64_t)slotID;
- (void)encodeWithCoder:(id)a3;
- (void)setIsSimDataOnly:(BOOL)a3;
- (void)setIsSimGood:(BOOL)a3;
- (void)setIsSimHidden:(BOOL)a3;
- (void)setIsSimPresent:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLabelID:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setUserDataPreferred:(id)a3;
- (void)setUserDefaultVoice:(id)a3;
@end

@implementation CTXPCServiceSubscriptionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CTXPCServiceSubscriptionContext)contextWithServiceDescriptor:(id)a3
{
  id v3 = a3;
  if ([v3 domain] == 1)
  {
    id v4 = objc_alloc((Class)objc_opt_class());
    v5 = [v3 instance];
    v6 = objc_msgSend(v4, "initWithSlot:", objc_msgSend(v5, "integerValue"));
  }
  else
  {
    v6 = 0;
  }

  return (CTXPCServiceSubscriptionContext *)v6;
}

- (CTXPCServiceSubscriptionContext)initWithSlot:(int64_t)a3
{
  v5 = CTSubscriptionSlotAsUUID(a3);
  v6 = [(CTXPCServiceSubscriptionContext *)self initWithUUID:v5 andSlot:a3];

  return v6;
}

- (CTXPCServiceSubscriptionContext)initWithUUID:(id)a3 andSlot:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTXPCServiceSubscriptionContext;
  v8 = [(CTXPCServiceSubscriptionContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    v9->_slotID = a4;
    *(_DWORD *)&v9->_isSimPresent = 256;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaultVoice, 0);
  objc_storeStrong((id *)&self->_userDataPreferred, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (CTXPCServiceSubscriptionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTXPCServiceSubscriptionContext;
  v5 = [(CTXPCServiceSubscriptionContext *)&v19 init];
  if (v5)
  {
    v5->_slotID = [v4 decodeIntegerForKey:@"slot_id"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label_id"];
    labelID = v5->_labelID;
    v5->_labelID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phone_number"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user_data_preferred"];
    userDataPreferred = v5->_userDataPreferred;
    v5->_userDataPreferred = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"user_default_voice"];
    userDefaultVoice = v5->_userDefaultVoice;
    v5->_userDefaultVoice = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v16;

    v5->_isSimPresent = [v4 decodeBoolForKey:@"isSimPresent"];
    v5->_isSimGood = [v4 decodeBoolForKey:@"isSimGood"];
    v5->_isSimHidden = [v4 decodeBoolForKey:@"isSimHidden"];
    v5->_isSimDataOnly = [v4 decodeBoolForKey:@"isSimDataOnly"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t slotID = self->_slotID;
  id v5 = a3;
  [v5 encodeInteger:slotID forKey:@"slot_id"];
  [v5 encodeObject:self->_labelID forKey:@"label_id"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phone_number"];
  [v5 encodeObject:self->_userDataPreferred forKey:@"user_data_preferred"];
  [v5 encodeObject:self->_userDefaultVoice forKey:@"user_default_voice"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeBool:self->_isSimPresent forKey:@"isSimPresent"];
  [v5 encodeBool:self->_isSimGood forKey:@"isSimGood"];
  [v5 encodeBool:self->_isSimHidden forKey:@"isSimHidden"];
  [v5 encodeBool:self->_isSimDataOnly forKey:@"isSimDataOnly"];
}

- (id)redactedDescription
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTXPCServiceSubscriptionContext *)self slotID];
  id v5 = "CTSubscriptionSlotUnknown";
  if (v4 == 2) {
    id v5 = "CTSubscriptionSlotTwo";
  }
  if (v4 == 1) {
    id v5 = "CTSubscriptionSlotOne";
  }
  objc_msgSend(v3, "appendFormat:", @" slotID=%s", v5);
  uint64_t v6 = [(CTXPCServiceSubscriptionContext *)self userDataPreferred];
  [v3 appendFormat:@", [userDataPreferred=%@", v6];

  id v7 = [(CTXPCServiceSubscriptionContext *)self userDefaultVoice];
  [v3 appendFormat:@", userDefaultVoice=%@", v7];

  BOOL v8 = [(CTXPCServiceSubscriptionContext *)self isSimPresent];
  v9 = "absent";
  if (v8) {
    v9 = "present";
  }
  objc_msgSend(v3, "appendFormat:", @", SIM:(%s"), v9;
  BOOL v10 = [(CTXPCServiceSubscriptionContext *)self isSimGood];
  objc_super v11 = "bad";
  if (v10) {
    objc_super v11 = "good";
  }
  [v3 appendFormat:@", %s", v11];
  BOOL v12 = [(CTXPCServiceSubscriptionContext *)self isSimHidden];
  v13 = "exposed";
  if (v12) {
    v13 = "hidden";
  }
  [v3 appendFormat:@", %s", v13];
  BOOL v14 = [(CTXPCServiceSubscriptionContext *)self isSimDataOnly];
  v15 = "voice+data";
  if (v14) {
    v15 = "dataonly";
  }
  [v3 appendFormat:@", %s]"], v15);
  [v3 appendString:@">"];

  return v3;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTXPCServiceSubscriptionContext *)self slotID];
  id v5 = "CTSubscriptionSlotUnknown";
  if (v4 == 2) {
    id v5 = "CTSubscriptionSlotTwo";
  }
  if (v4 == 1) {
    id v5 = "CTSubscriptionSlotOne";
  }
  objc_msgSend(v3, "appendFormat:", @" slotID=%s", v5);
  uint64_t v6 = [(CTXPCServiceSubscriptionContext *)self uuid];
  [v3 appendFormat:@", uuid=%@", v6];

  id v7 = [(CTXPCServiceSubscriptionContext *)self labelID];
  [v3 appendFormat:@", labelID=\"%@\"", v7];

  BOOL v8 = [(CTXPCServiceSubscriptionContext *)self label];
  [v3 appendFormat:@", label=\"%@\"", v8];

  v9 = [(CTXPCServiceSubscriptionContext *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber=\"%@\"", v9];

  BOOL v10 = [(CTXPCServiceSubscriptionContext *)self userDataPreferred];
  [v3 appendFormat:@", [userDataPreferred=%@", v10];

  objc_super v11 = [(CTXPCServiceSubscriptionContext *)self userDefaultVoice];
  [v3 appendFormat:@", userDefaultVoice=%@", v11];

  BOOL v12 = [(CTXPCServiceSubscriptionContext *)self isSimPresent];
  v13 = "absent";
  if (v12) {
    v13 = "present";
  }
  objc_msgSend(v3, "appendFormat:", @", SIM:(%s"), v13;
  BOOL v14 = [(CTXPCServiceSubscriptionContext *)self isSimGood];
  v15 = "bad";
  if (v14) {
    v15 = "good";
  }
  [v3 appendFormat:@", %s", v15];
  BOOL v16 = [(CTXPCServiceSubscriptionContext *)self isSimHidden];
  v17 = "exposed";
  if (v16) {
    v17 = "hidden";
  }
  [v3 appendFormat:@", %s", v17];
  BOOL v18 = [(CTXPCServiceSubscriptionContext *)self isSimDataOnly];
  objc_super v19 = "voice+data";
  if (v18) {
    objc_super v19 = "dataonly";
  }
  [v3 appendFormat:@", %s]"], v19);
  [v3 appendString:@">"];

  return v3;
}

- (int64_t)slotID
{
  return self->_slotID;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isSimHidden
{
  return self->_isSimHidden;
}

- (NSNumber)userDataPreferred
{
  return self->_userDataPreferred;
}

- (NSNumber)userDefaultVoice
{
  return self->_userDefaultVoice;
}

- (BOOL)isSimGood
{
  return self->_isSimGood;
}

- (BOOL)isSimDataOnly
{
  return self->_isSimDataOnly;
}

- (NSString)labelID
{
  return self->_labelID;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (BOOL)isSimPresent
{
  return self->_isSimPresent;
}

- (CTXPCServiceSubscriptionContext)initWithUUID:(id)a3
{
  return [(CTXPCServiceSubscriptionContext *)self initWithUUID:a3 andSlot:0];
}

+ (CTXPCServiceSubscriptionContext)contextWithSlot:(int64_t)a3
{
  id v3 = [[CTXPCServiceSubscriptionContext alloc] initWithSlot:a3];

  return v3;
}

+ (CTXPCServiceSubscriptionContext)contextWithUUID:(id)a3
{
  id v3 = a3;
  int64_t v4 = [[CTXPCServiceSubscriptionContext alloc] initWithUUID:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = (CTXPCServiceSubscriptionContext *)a3;
  if (v7 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v8 = [(CTXPCServiceSubscriptionContext *)self slotID];
      if (v8 == [(CTXPCServiceSubscriptionContext *)v7 slotID])
      {
        v9 = [(CTXPCServiceSubscriptionContext *)self uuid];
        BOOL v10 = [(CTXPCServiceSubscriptionContext *)v7 uuid];
        if (![v9 isEqual:v10])
        {
          LOBYTE(v13) = 0;
LABEL_91:

          goto LABEL_92;
        }
        objc_super v11 = [(CTXPCServiceSubscriptionContext *)self labelID];
        if (v11
          && ([(CTXPCServiceSubscriptionContext *)self labelID],
              id v3 = objc_claimAutoreleasedReturnValue(),
              [(CTXPCServiceSubscriptionContext *)v7 labelID],
              int64_t v4 = objc_claimAutoreleasedReturnValue(),
              ([v3 isEqual:v4] & 1) != 0))
        {
          char v12 = 0;
        }
        else
        {
          BOOL v14 = [(CTXPCServiceSubscriptionContext *)self labelID];
          if (v14)
          {
            LOBYTE(v13) = 0;
LABEL_87:

            goto LABEL_88;
          }
          v15 = [(CTXPCServiceSubscriptionContext *)v7 labelID];
          if (v15)
          {

LABEL_48:
            LOBYTE(v13) = 0;
            goto LABEL_88;
          }
          char v12 = 1;
        }
        BOOL v16 = [(CTXPCServiceSubscriptionContext *)self label];
        if (v16
          && ([(CTXPCServiceSubscriptionContext *)self label],
              id v5 = objc_claimAutoreleasedReturnValue(),
              [(CTXPCServiceSubscriptionContext *)v7 label],
              v48 = v5,
              v47 = objc_claimAutoreleasedReturnValue(),
              ([v5 isEqual:v47] & 1) != 0))
        {
          char v45 = v12;
          char v46 = 0;
        }
        else
        {
          v17 = [(CTXPCServiceSubscriptionContext *)self label];
          if (v17)
          {
            LOBYTE(v13) = 0;
            goto LABEL_83;
          }
          BOOL v18 = [(CTXPCServiceSubscriptionContext *)v7 label];
          if (v18)
          {

            if (!v16) {
              goto LABEL_48;
            }
            goto LABEL_46;
          }
          char v45 = v12;
          char v46 = 1;
        }
        objc_super v19 = [(CTXPCServiceSubscriptionContext *)self phoneNumber];
        if (v19
          && ([(CTXPCServiceSubscriptionContext *)self phoneNumber],
              id v5 = objc_claimAutoreleasedReturnValue(),
              [(CTXPCServiceSubscriptionContext *)v7 phoneNumber],
              v43 = objc_claimAutoreleasedReturnValue(),
              v44 = v5,
              ([v5 isEqual:v43] & 1) != 0))
        {
          char v41 = 0;
        }
        else
        {
          v20 = [(CTXPCServiceSubscriptionContext *)self phoneNumber];
          if (v20)
          {
            LOBYTE(v13) = 0;
            goto LABEL_78;
          }
          v21 = [(CTXPCServiceSubscriptionContext *)v7 phoneNumber];
          if (v21)
          {

            if (!v19)
            {
LABEL_45:
              if (!v16)
              {
LABEL_47:

                goto LABEL_48;
              }
LABEL_46:

              goto LABEL_47;
            }
LABEL_43:

LABEL_44:
            goto LABEL_45;
          }
          char v41 = 1;
        }
        v42 = [(CTXPCServiceSubscriptionContext *)self userDataPreferred];
        if (v42)
        {
          id v5 = [(CTXPCServiceSubscriptionContext *)self userDataPreferred];
          v39 = [(CTXPCServiceSubscriptionContext *)v7 userDataPreferred];
          v40 = v5;
          if ([v5 isEqual:v39])
          {
            int v37 = 0;
LABEL_50:
            uint64_t v38 = [(CTXPCServiceSubscriptionContext *)self userDefaultVoice];
            if (v38
              && ([(CTXPCServiceSubscriptionContext *)self userDefaultVoice],
                  id v5 = objc_claimAutoreleasedReturnValue(),
                  [(CTXPCServiceSubscriptionContext *)v7 userDefaultVoice],
                  v36 = objc_claimAutoreleasedReturnValue(),
                  (objc_msgSend(v5, "isEqual:") & 1) != 0))
            {
              char v32 = 0;
            }
            else
            {
              v24 = [(CTXPCServiceSubscriptionContext *)self userDefaultVoice];
              if (v24)
              {
LABEL_63:

                v26 = (void *)v38;
                if (v38)
                {

                  v26 = (void *)v38;
                }
                LOBYTE(v13) = 0;
LABEL_66:

                if (!v37) {
                  goto LABEL_74;
                }
LABEL_72:
                v22 = 0;
                goto LABEL_73;
              }
              v25 = [(CTXPCServiceSubscriptionContext *)v7 userDefaultVoice];
              if (v25)
              {
                LOBYTE(v13) = 0;
                goto LABEL_56;
              }
              char v32 = 1;
            }
            BOOL v33 = [(CTXPCServiceSubscriptionContext *)self isSimPresent];
            if (v33 != [(CTXPCServiceSubscriptionContext *)v7 isSimPresent]
              || (BOOL v34 = [(CTXPCServiceSubscriptionContext *)self isSimGood],
                  v34 != [(CTXPCServiceSubscriptionContext *)v7 isSimGood])
              || (BOOL v35 = [(CTXPCServiceSubscriptionContext *)self isSimHidden],
                  v35 != [(CTXPCServiceSubscriptionContext *)v7 isSimHidden]))
            {
              if (v32)
              {
                v24 = 0;
                goto LABEL_63;
              }
              LOBYTE(v13) = 0;
LABEL_69:
              v27 = (void *)v38;
              v28 = v36;
              if (!v38) {
                goto LABEL_71;
              }
              goto LABEL_70;
            }
            BOOL v31 = [(CTXPCServiceSubscriptionContext *)self isSimDataOnly];
            BOOL v13 = v31 ^ [(CTXPCServiceSubscriptionContext *)v7 isSimDataOnly] ^ 1;
            if ((v32 & 1) == 0)
            {
              v26 = (void *)v38;
              v28 = v36;
              if (!v38) {
                goto LABEL_66;
              }
LABEL_70:

              v27 = (void *)v38;
LABEL_71:

              if ((v37 & 1) == 0)
              {
LABEL_74:
                v29 = v42;
                if (v42)
                {

                  v29 = v42;
                }

                if ((v41 & 1) == 0) {
                  goto LABEL_79;
                }
                v20 = 0;
LABEL_78:

LABEL_79:
                if (v19)
                {
                }
                if ((v46 & 1) == 0)
                {
                  char v12 = v45;
                  if (!v16)
                  {
LABEL_85:

                    if (v12)
                    {
                      BOOL v14 = 0;
                      goto LABEL_87;
                    }
LABEL_88:
                    if (v11)
                    {
                    }
                    goto LABEL_91;
                  }
LABEL_84:

                  goto LABEL_85;
                }
                v17 = 0;
                char v12 = v45;
LABEL_83:

                if (!v16) {
                  goto LABEL_85;
                }
                goto LABEL_84;
              }
              goto LABEL_72;
            }
            v25 = 0;
LABEL_56:

            goto LABEL_69;
          }
        }
        v22 = [(CTXPCServiceSubscriptionContext *)self userDataPreferred];
        if (v22)
        {
          LOBYTE(v13) = 0;
LABEL_73:

          goto LABEL_74;
        }
        v23 = [(CTXPCServiceSubscriptionContext *)v7 userDataPreferred];
        if (!v23)
        {
          int v37 = 1;
          goto LABEL_50;
        }

        if (v42)
        {
        }
        if (!v19) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
    }
    LOBYTE(v13) = 0;
  }
LABEL_92:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(CTXPCServiceSubscriptionContext *)self uuid];
  uint64_t v6 = objc_msgSend(v4, "initWithUUID:andSlot:", v5, -[CTXPCServiceSubscriptionContext slotID](self, "slotID"));

  return v6;
}

- (void)setLabelID:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void)setPhoneNumber:(id)a3
{
}

- (void)setUserDataPreferred:(id)a3
{
}

- (void)setUserDefaultVoice:(id)a3
{
}

- (void)setIsSimPresent:(BOOL)a3
{
  self->_isSimPresent = a3;
}

- (void)setIsSimGood:(BOOL)a3
{
  self->_isSimGood = a3;
}

- (void)setIsSimHidden:(BOOL)a3
{
  self->_isSimHidden = a3;
}

- (void)setIsSimDataOnly:(BOOL)a3
{
  self->_isSimDataOnly = a3;
}

@end