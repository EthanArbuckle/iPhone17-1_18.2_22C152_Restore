@interface CRKSignInHistoryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistoryItem:(id)a3;
- (CRKSignInHistoryItem)initWithCoder:(id)a3;
- (CRKSignInHistoryItem)initWithDictionary:(id)a3;
- (CRKSignInHistoryItem)initWithIdentifier:(id)a3 appleID:(id)a4 date:(id)a5 deviceName:(id)a6 deviceSerialNumber:(id)a7 userGivenName:(id)a8 userFamilyName:(id)a9 userFullName:(id)a10 userMonogram:(id)a11;
- (NSDate)date;
- (NSString)appleID;
- (NSString)deviceName;
- (NSString)deviceSerialNumber;
- (NSString)identifier;
- (NSString)userFamilyName;
- (NSString)userFullName;
- (NSString)userGivenName;
- (NSString)userMonogram;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKSignInHistoryItem

- (CRKSignInHistoryItem)initWithIdentifier:(id)a3 appleID:(id)a4 date:(id)a5 deviceName:(id)a6 deviceSerialNumber:(id)a7 userGivenName:(id)a8 userFamilyName:(id)a9 userFullName:(id)a10 userMonogram:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)CRKSignInHistoryItem;
  v19 = [(CRKSignInHistoryItem *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_appleID, a4);
    objc_storeStrong((id *)&v20->_date, a5);
    objc_storeStrong((id *)&v20->_deviceName, a6);
    objc_storeStrong((id *)&v20->_deviceSerialNumber, a7);
    objc_storeStrong((id *)&v20->_userGivenName, a8);
    objc_storeStrong((id *)&v20->_userFamilyName, a9);
    objc_storeStrong((id *)&v20->_userFullName, a10);
    objc_storeStrong((id *)&v20->_userMonogram, a11);
  }

  return v20;
}

- (CRKSignInHistoryItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CRKSignInHistoryItem;
  v5 = [(CRKSignInHistoryItem *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"identifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    v8 = v7;

    identifier = v5->_identifier;
    v5->_identifier = v8;

    v10 = [v4 objectForKeyedSubscript:@"appleID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    v12 = v11;

    appleID = v5->_appleID;
    v5->_appleID = v12;

    v14 = [v4 objectForKeyedSubscript:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    v16 = v15;

    date = v5->_date;
    v5->_date = v16;

    id v18 = [v4 objectForKeyedSubscript:@"deviceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    v20 = v19;

    deviceName = v5->_deviceName;
    v5->_deviceName = v20;

    id v22 = [v4 objectForKeyedSubscript:@"deviceSerialNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
    id v24 = v23;

    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = v24;

    id v26 = [v4 objectForKeyedSubscript:@"userGivenName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
    id v28 = v27;

    userGivenName = v5->_userGivenName;
    v5->_userGivenName = v28;

    objc_super v30 = [v4 objectForKeyedSubscript:@"userFamilyName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v31 = v30;
    }
    else {
      v31 = 0;
    }
    v32 = v31;

    userFamilyName = v5->_userFamilyName;
    v5->_userFamilyName = v32;

    v34 = [v4 objectForKeyedSubscript:@"userFullName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
    v36 = v35;

    userFullName = v5->_userFullName;
    v5->_userFullName = v36;

    v38 = [v4 objectForKeyedSubscript:@"userMonogram"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v39 = v38;
    }
    else {
      v39 = 0;
    }
    v40 = v39;

    userMonogram = v5->_userMonogram;
    v5->_userMonogram = v40;
  }
  return v5;
}

- (id)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = [(CRKSignInHistoryItem *)self identifier];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  v5 = [(CRKSignInHistoryItem *)self appleID];
  [v3 setObject:v5 forKeyedSubscript:@"appleID"];

  v6 = [(CRKSignInHistoryItem *)self date];
  [v3 setObject:v6 forKeyedSubscript:@"date"];

  v7 = [(CRKSignInHistoryItem *)self deviceName];
  [v3 setObject:v7 forKeyedSubscript:@"deviceName"];

  v8 = [(CRKSignInHistoryItem *)self deviceSerialNumber];
  [v3 setObject:v8 forKeyedSubscript:@"deviceSerialNumber"];

  v9 = [(CRKSignInHistoryItem *)self userGivenName];
  [v3 setObject:v9 forKeyedSubscript:@"userGivenName"];

  v10 = [(CRKSignInHistoryItem *)self userFamilyName];
  [v3 setObject:v10 forKeyedSubscript:@"userFamilyName"];

  v11 = [(CRKSignInHistoryItem *)self userFullName];
  [v3 setObject:v11 forKeyedSubscript:@"userFullName"];

  v12 = [(CRKSignInHistoryItem *)self userMonogram];
  [v3 setObject:v12 forKeyedSubscript:@"userMonogram"];

  v13 = (void *)[v3 copy];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSignInHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CRKSignInHistoryItem;
  v5 = [(CRKSignInHistoryItem *)&v34 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"appleID"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v16;

    id v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"deviceSerialNumber"];
    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = (NSString *)v19;

    v21 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"userGivenName"];
    userGivenName = v5->_userGivenName;
    v5->_userGivenName = (NSString *)v22;

    id v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"userFamilyName"];
    userFamilyName = v5->_userFamilyName;
    v5->_userFamilyName = (NSString *)v25;

    id v27 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"userFullName"];
    userFullName = v5->_userFullName;
    v5->_userFullName = (NSString *)v28;

    objc_super v30 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"userMonogram"];
    userMonogram = v5->_userMonogram;
    v5->_userMonogram = (NSString *)v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKSignInHistoryItem *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(CRKSignInHistoryItem *)self appleID];
  [v4 encodeObject:v6 forKey:@"appleID"];

  uint64_t v7 = [(CRKSignInHistoryItem *)self date];
  [v4 encodeObject:v7 forKey:@"date"];

  v8 = [(CRKSignInHistoryItem *)self deviceName];
  [v4 encodeObject:v8 forKey:@"deviceName"];

  v9 = [(CRKSignInHistoryItem *)self deviceSerialNumber];
  [v4 encodeObject:v9 forKey:@"deviceSerialNumber"];

  uint64_t v10 = [(CRKSignInHistoryItem *)self userGivenName];
  [v4 encodeObject:v10 forKey:@"userGivenName"];

  v11 = [(CRKSignInHistoryItem *)self userFamilyName];
  [v4 encodeObject:v11 forKey:@"userFamilyName"];

  v12 = [(CRKSignInHistoryItem *)self userFullName];
  [v4 encodeObject:v12 forKey:@"userFullName"];

  id v13 = [(CRKSignInHistoryItem *)self userMonogram];
  [v4 encodeObject:v13 forKey:@"userMonogram"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CRKSignInHistoryItem *)self dictionaryValue];
  v6 = (void *)[v4 initWithDictionary:v5];

  return v6;
}

- (id)description
{
  v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v3 = [(CRKSignInHistoryItem *)self identifier];
  id v4 = [(CRKSignInHistoryItem *)self appleID];
  v5 = [(CRKSignInHistoryItem *)self date];
  v6 = [(CRKSignInHistoryItem *)self deviceName];
  uint64_t v7 = [(CRKSignInHistoryItem *)self deviceSerialNumber];
  v8 = [(CRKSignInHistoryItem *)self userGivenName];
  v9 = [(CRKSignInHistoryItem *)self userFamilyName];
  uint64_t v10 = [(CRKSignInHistoryItem *)self userFullName];
  v11 = [(CRKSignInHistoryItem *)self userMonogram];
  v12 = [v15 stringWithFormat:@"<%@: %p { identifier = %@, appleID = %@, date = %@, deviceName = %@, deviceSerialNumber = %@, userGivenName = %@, userFamilyName = %@, userFullName = %@, userMonogram = %@ }>", v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRKSignInHistoryItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(CRKSignInHistoryItem *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(CRKSignInHistoryItem *)self isEqualToHistoryItem:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToHistoryItem:(id)a3
{
  v8 = (CRKSignInHistoryItem *)a3;
  if (v8 == self)
  {
    char v11 = 1;
    goto LABEL_91;
  }
  v9 = [(CRKSignInHistoryItem *)self identifier];
  if (v9
    || ([(CRKSignInHistoryItem *)v8 identifier], (v64 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CRKSignInHistoryItem *)self identifier];
    id v4 = [(CRKSignInHistoryItem *)v8 identifier];
    if (([v3 isEqual:v4] & 1) == 0)
    {

      char v11 = 0;
      goto LABEL_88;
    }
    int v10 = 1;
  }
  else
  {
    v64 = 0;
    int v10 = 0;
  }
  v12 = [(CRKSignInHistoryItem *)self appleID];
  if (!v12)
  {
    v59 = [(CRKSignInHistoryItem *)v8 appleID];
    if (!v59)
    {
      v65 = v8;
      int v62 = v10;
      int v63 = 0;
      v59 = 0;
      goto LABEL_19;
    }
  }
  BOOL v5 = [(CRKSignInHistoryItem *)self appleID];
  v6 = [(CRKSignInHistoryItem *)v8 appleID];
  if ([v5 isEqual:v6])
  {
    v65 = v8;
    int v62 = v10;
    int v63 = 1;
LABEL_19:
    id v13 = [(CRKSignInHistoryItem *)self date];
    if (v13 || ([(CRKSignInHistoryItem *)v65 date], (v54 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v14 = [(CRKSignInHistoryItem *)self date];
      v60 = [(CRKSignInHistoryItem *)v65 date];
      v61 = v14;
      if (!objc_msgSend(v14, "isEqual:"))
      {
        char v11 = 0;
        v8 = v65;
        goto LABEL_79;
      }
      int v57 = 1;
    }
    else
    {
      v54 = 0;
      int v57 = 0;
    }
    [(CRKSignInHistoryItem *)self deviceName];
    uint64_t v58 = v8 = v65;
    if (v58
      || ([(CRKSignInHistoryItem *)v65 deviceName],
          (v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = [(CRKSignInHistoryItem *)self deviceName];
      v55 = [(CRKSignInHistoryItem *)v65 deviceName];
      v56 = v15;
      if (![v15 isEqual:v55])
      {
        char v11 = 0;
        goto LABEL_75;
      }
      int v52 = 1;
    }
    else
    {
      v49 = 0;
      int v52 = 0;
    }
    uint64_t v53 = [(CRKSignInHistoryItem *)self deviceSerialNumber];
    if (v53
      || ([(CRKSignInHistoryItem *)v65 deviceSerialNumber],
          (v44 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v16 = [(CRKSignInHistoryItem *)self deviceSerialNumber];
      v50 = [(CRKSignInHistoryItem *)v65 deviceSerialNumber];
      v51 = v16;
      if (![v16 isEqual:v50])
      {
        char v11 = 0;
        goto LABEL_71;
      }
      int v47 = 1;
    }
    else
    {
      v44 = 0;
      int v47 = 0;
    }
    uint64_t v48 = [(CRKSignInHistoryItem *)self userGivenName];
    if (v48
      || ([(CRKSignInHistoryItem *)v65 userGivenName],
          (v39 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = [(CRKSignInHistoryItem *)self userGivenName];
      v45 = [(CRKSignInHistoryItem *)v65 userGivenName];
      v46 = v17;
      if (![v17 isEqual:v45])
      {
        char v11 = 0;
        goto LABEL_67;
      }
      int v42 = 1;
    }
    else
    {
      v39 = 0;
      int v42 = 0;
    }
    uint64_t v43 = [(CRKSignInHistoryItem *)self userFamilyName];
    if (v43
      || ([(CRKSignInHistoryItem *)v65 userFamilyName],
          (objc_super v34 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v18 = [(CRKSignInHistoryItem *)self userFamilyName];
      v40 = [(CRKSignInHistoryItem *)v65 userFamilyName];
      v41 = v18;
      if (![v18 isEqual:v40])
      {
        char v11 = 0;
        goto LABEL_63;
      }
      int v37 = 1;
    }
    else
    {
      objc_super v34 = 0;
      int v37 = 0;
    }
    uint64_t v38 = [(CRKSignInHistoryItem *)self userFullName];
    if (v38
      || ([(CRKSignInHistoryItem *)v65 userFullName],
          (objc_super v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v19 = [(CRKSignInHistoryItem *)self userFullName];
      v35 = [(CRKSignInHistoryItem *)v65 userFullName];
      v36 = v19;
      if (![v19 isEqual:v35])
      {
        char v11 = 0;
        goto LABEL_59;
      }
      int v33 = 1;
    }
    else
    {
      objc_super v30 = 0;
      int v33 = 0;
    }
    uint64_t v20 = [(CRKSignInHistoryItem *)self userMonogram];
    if (v20
      || ([(CRKSignInHistoryItem *)v65 userMonogram], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v31 = [(CRKSignInHistoryItem *)self userMonogram];
      [(CRKSignInHistoryItem *)v65 userMonogram];
      v21 = v32 = (void *)v20;
      char v11 = objc_msgSend(v31, "isEqual:");

      if (v32)
      {

        if (!v33) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }
      uint64_t v28 = (void *)v29;
    }
    else
    {
      uint64_t v28 = 0;
      char v11 = 1;
    }

    if ((v33 & 1) == 0)
    {
LABEL_60:
      uint64_t v22 = (void *)v38;
      if (!v38)
      {

        uint64_t v22 = 0;
      }

      if (!v37)
      {
LABEL_64:
        id v23 = (void *)v43;
        if (!v43)
        {

          id v23 = 0;
        }

        if (!v42)
        {
LABEL_68:
          id v24 = (void *)v48;
          if (!v48)
          {

            id v24 = 0;
          }

          if (!v47)
          {
LABEL_72:
            uint64_t v25 = (void *)v53;
            if (!v53)
            {

              uint64_t v25 = 0;
            }

            if (!v52)
            {
LABEL_76:
              id v26 = (void *)v58;
              if (!v58)
              {

                id v26 = 0;
              }

              if (!v57)
              {
LABEL_80:
                if (!v13) {

                }
                if (v63)
                {
                }
                if (!v12) {

                }
                if (!v62) {
                  goto LABEL_88;
                }
                goto LABEL_87;
              }
LABEL_79:

              goto LABEL_80;
            }
LABEL_75:

            goto LABEL_76;
          }
LABEL_71:

          goto LABEL_72;
        }
LABEL_67:

        goto LABEL_68;
      }
LABEL_63:

      goto LABEL_64;
    }
LABEL_59:

    goto LABEL_60;
  }

  if (v12) {
  else
  }

  char v11 = 0;
  if (v10)
  {
LABEL_87:
  }
LABEL_88:
  if (!v9) {

  }
LABEL_91:
  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (NSString)userGivenName
{
  return self->_userGivenName;
}

- (NSString)userFamilyName
{
  return self->_userFamilyName;
}

- (NSString)userFullName
{
  return self->_userFullName;
}

- (NSString)userMonogram
{
  return self->_userMonogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMonogram, 0);
  objc_storeStrong((id *)&self->_userFullName, 0);
  objc_storeStrong((id *)&self->_userFamilyName, 0);
  objc_storeStrong((id *)&self->_userGivenName, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_appleID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end