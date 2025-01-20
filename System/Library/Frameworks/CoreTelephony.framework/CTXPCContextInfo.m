@interface CTXPCContextInfo
+ (BOOL)supportsSecureCoding;
+ (id)contextWithUUID:(id)a3 andAccountID:(id)a4 andSlot:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (CTXPCContextInfo)initWithCoder:(id)a3;
- (CTXPCContextInfo)initWithUUID:(id)a3 andAccountID:(id)a4 andSlot:(int64_t)a5;
- (NSString)accountID;
- (NSString)label;
- (NSString)labelID;
- (NSString)phoneNumber;
- (NSUUID)uuid;
- (id)context;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)slotID;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelID:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation CTXPCContextInfo

- (CTXPCContextInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTXPCContextInfo;
  v5 = [(CTXPCContextInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account_id"];
    accountID = v5->_accountID;
    v5->_accountID = (NSString *)v8;

    v5->_slotID = [v4 decodeIntegerForKey:@"slot_id"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label_id"];
    labelID = v5->_labelID;
    v5->_labelID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phone_number"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v14;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTXPCContextInfo *)self uuid];
  [v3 appendFormat:@", uuid=%@", v4];

  v5 = [(CTXPCContextInfo *)self accountID];
  [v3 appendFormat:@", accountID=\"%@\"", v5];

  int64_t v6 = [(CTXPCContextInfo *)self slotID];
  v7 = "CTSubscriptionSlotUnknown";
  if (v6 == 2) {
    v7 = "CTSubscriptionSlotTwo";
  }
  if (v6 == 1) {
    v7 = "CTSubscriptionSlotOne";
  }
  [v3 appendFormat:@", slotID=%s", v7];
  uint64_t v8 = [(CTXPCContextInfo *)self labelID];
  [v3 appendFormat:@", labelID=\"%@\"", v8];

  v9 = [(CTXPCContextInfo *)self label];
  [v3 appendFormat:@", label=\"%@\"", v9];

  uint64_t v10 = [(CTXPCContextInfo *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber=\"%@\"", v10];

  [v3 appendString:@">"];

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)slotID
{
  return self->_slotID;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)labelID
{
  return self->_labelID;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_accountID forKey:@"account_id"];
  [v5 encodeInteger:self->_slotID forKey:@"slot_id"];
  [v5 encodeObject:self->_labelID forKey:@"label_id"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phone_number"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)context
{
  v2 = [[CTXPCServiceSubscriptionContext alloc] initWithUUID:self->_uuid andSlot:self->_slotID];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (CTXPCContextInfo)initWithUUID:(id)a3 andAccountID:(id)a4 andSlot:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CTXPCContextInfo;
  v11 = [(CTXPCContextInfo *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    objc_storeStrong((id *)&v12->_accountID, a4);
    v12->_slotID = a5;
  }

  return v12;
}

+ (id)contextWithUUID:(id)a3 andAccountID:(id)a4 andSlot:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[CTXPCContextInfo alloc] initWithUUID:v8 andAccountID:v7 andSlot:a5];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v6 = (CTXPCContextInfo *)a3;
  if (v6 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(CTXPCContextInfo *)self uuid];
      id v8 = [(CTXPCContextInfo *)v6 uuid];
      if (![v7 isEqual:v8])
      {
        BOOL v13 = 0;
LABEL_54:

        goto LABEL_55;
      }
      id v9 = [(CTXPCContextInfo *)self accountID];
      id v10 = [(CTXPCContextInfo *)v6 accountID];
      if (![v9 isEqual:v10]
        || (int64_t v11 = [(CTXPCContextInfo *)self slotID], v11 != [(CTXPCContextInfo *)v6 slotID]))
      {
        BOOL v13 = 0;
LABEL_53:

        goto LABEL_54;
      }
      uint64_t v12 = [(CTXPCContextInfo *)self labelID];
      if (v12
        && ([(CTXPCContextInfo *)self labelID],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTXPCContextInfo *)v6 labelID],
            id v4 = objc_claimAutoreleasedReturnValue(),
            ([v3 isEqual:v4] & 1) != 0))
      {
        int v36 = 0;
      }
      else
      {
        objc_super v14 = [(CTXPCContextInfo *)self labelID];
        if (v14)
        {
          BOOL v13 = 0;
LABEL_49:

          goto LABEL_50;
        }
        v15 = [(CTXPCContextInfo *)v6 labelID];
        if (v15)
        {

          BOOL v13 = 0;
LABEL_50:
          if (v12)
          {
          }
          goto LABEL_53;
        }
        int v36 = 1;
      }
      uint64_t v16 = [(CTXPCContextInfo *)self label];
      objc_super v17 = (void *)v16;
      if (v16)
      {
        v33 = v12;
        v18 = (void *)v16;
        v19 = v4;
        v20 = [(CTXPCContextInfo *)self label];
        [(CTXPCContextInfo *)v6 label];
        v35 = v34 = v20;
        if (objc_msgSend(v20, "isEqual:"))
        {
          v32 = v3;
          int v31 = 0;
          id v4 = v19;
          objc_super v17 = v18;
          uint64_t v12 = v33;
          goto LABEL_28;
        }
        id v4 = v19;
        objc_super v17 = v18;
        uint64_t v12 = v33;
      }
      v21 = [(CTXPCContextInfo *)self label];
      if (v21)
      {
        BOOL v13 = 0;
        goto LABEL_41;
      }
      v22 = [(CTXPCContextInfo *)v6 label];
      if (v22)
      {

        BOOL v13 = 0;
        goto LABEL_45;
      }
      v32 = v3;
      int v31 = 1;
LABEL_28:
      uint64_t v23 = [(CTXPCContextInfo *)self phoneNumber];
      v24 = (void *)v23;
      if (v23)
      {
        v29 = (void *)v23;
        v25 = [(CTXPCContextInfo *)self phoneNumber];
        [(CTXPCContextInfo *)v6 phoneNumber];
        v30 = v33 = v25;
        if (objc_msgSend(v25, "isEqual:"))
        {
          BOOL v13 = 1;
          v24 = v29;
LABEL_35:

          if (v31)
          {
            v21 = 0;
            v3 = v32;
            goto LABEL_41;
          }
          v3 = v32;
          goto LABEL_45;
        }
        v24 = v29;
      }
      v26 = [(CTXPCContextInfo *)self phoneNumber];
      if (v26)
      {

        BOOL v13 = 0;
        if (v24) {
          goto LABEL_35;
        }
      }
      else
      {
        v27 = [(CTXPCContextInfo *)v6 phoneNumber];
        BOOL v13 = v27 == 0;

        if (v24) {
          goto LABEL_35;
        }
      }
      v3 = v32;
      if (v31)
      {
        v21 = 0;
LABEL_41:

        if (v17)
        {
        }
        if (!v36) {
          goto LABEL_50;
        }
        goto LABEL_48;
      }
LABEL_45:
      if (v17)
      {
      }
      if ((v36 & 1) == 0) {
        goto LABEL_50;
      }
LABEL_48:
      objc_super v14 = 0;
      goto LABEL_49;
    }
    BOOL v13 = 0;
  }
LABEL_55:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(CTXPCContextInfo *)self uuid];
  int64_t v6 = [(CTXPCContextInfo *)self accountID];
  id v7 = objc_msgSend(v4, "initWithUUID:andAccountID:andSlot:", v5, v6, -[CTXPCContextInfo slotID](self, "slotID"));

  return v7;
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

@end