@interface CTRemoteBlacklistPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTRemoteBlacklistPlan)initWithCoder:(id)a3;
- (CTRemoteBlacklistPlan)initWithkey:(id)a3 blacklistIMEI:(id)a4 blacklistEID:(id)a5 blacklistICCID:(id)a6 uploaderIMEI:(id)a7 uploaderEID:(id)a8;
- (NSString)blacklistEID;
- (NSString)blacklistICCID;
- (NSString)blacklistIMEI;
- (NSString)key;
- (NSString)uploaderEID;
- (NSString)uploaderIMEI;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTRemoteBlacklistPlan

- (CTRemoteBlacklistPlan)initWithkey:(id)a3 blacklistIMEI:(id)a4 blacklistEID:(id)a5 blacklistICCID:(id)a6 uploaderIMEI:(id)a7 uploaderEID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CTRemoteBlacklistPlan;
  v20 = [(CTRemoteBlacklistPlan *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    key = v20->_key;
    v20->_key = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    blacklistIMEI = v20->_blacklistIMEI;
    v20->_blacklistIMEI = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    blacklistEID = v20->_blacklistEID;
    v20->_blacklistEID = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    blacklistICCID = v20->_blacklistICCID;
    v20->_blacklistICCID = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    uploaderIMEI = v20->_uploaderIMEI;
    v20->_uploaderIMEI = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    uploaderEID = v20->_uploaderEID;
    v20->_uploaderEID = (NSString *)v31;
  }
  return v20;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTRemoteBlacklistPlan *)self key];
  [v3 appendFormat:@" RecordID=%@", v4];

  v5 = [(CTRemoteBlacklistPlan *)self blacklistIMEI];
  [v3 appendFormat:@" BlacklistIMEI=%@", v5];

  v6 = [(CTRemoteBlacklistPlan *)self blacklistEID];
  [v3 appendFormat:@" BlacklistEID=%@", v6];

  v7 = [(CTRemoteBlacklistPlan *)self blacklistICCID];
  [v3 appendFormat:@" BlacklistICCID=%@", v7];

  v8 = [(CTRemoteBlacklistPlan *)self uploaderIMEI];
  [v3 appendFormat:@" UploaderIMEI=%@", v8];

  v9 = [(CTRemoteBlacklistPlan *)self uploaderEID];
  [v3 appendFormat:@" UploaderEID=%@", v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTRemoteBlacklistPlan *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CTRemoteBlacklistPlan *)self key];
      v8 = [(CTRemoteBlacklistPlan *)v6 key];
      if (v7 != v8)
      {
        v3 = [(CTRemoteBlacklistPlan *)self key];
        v48 = [(CTRemoteBlacklistPlan *)v6 key];
        v49 = v3;
        if (!objc_msgSend(v3, "isEqualToString:"))
        {
          char v9 = 0;
          goto LABEL_36;
        }
      }
      v10 = [(CTRemoteBlacklistPlan *)self blacklistIMEI];
      v11 = [(CTRemoteBlacklistPlan *)v6 blacklistIMEI];
      if (v10 != v11)
      {
        v3 = [(CTRemoteBlacklistPlan *)self blacklistIMEI];
        v4 = [(CTRemoteBlacklistPlan *)v6 blacklistIMEI];
        if (![v3 isEqualToString:v4])
        {
          char v9 = 0;
LABEL_34:

LABEL_35:
          if (v7 == v8)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      uint64_t v12 = [(CTRemoteBlacklistPlan *)self blacklistEID];
      uint64_t v13 = [(CTRemoteBlacklistPlan *)v6 blacklistEID];
      v47 = (void *)v12;
      BOOL v14 = v12 == v13;
      id v15 = (void *)v13;
      if (!v14)
      {
        id v16 = [(CTRemoteBlacklistPlan *)self blacklistEID];
        v42 = [(CTRemoteBlacklistPlan *)v6 blacklistEID];
        v43 = v16;
        if (!objc_msgSend(v16, "isEqualToString:"))
        {
          char v9 = 0;
          id v17 = v47;
LABEL_32:

LABEL_33:
          if (v10 == v11) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
      }
      uint64_t v18 = [(CTRemoteBlacklistPlan *)self blacklistICCID];
      uint64_t v45 = [(CTRemoteBlacklistPlan *)v6 blacklistICCID];
      v46 = (void *)v18;
      v44 = v15;
      if (v18 == v45)
      {
        v38 = v11;
      }
      else
      {
        id v19 = v10;
        v20 = v4;
        uint64_t v21 = v3;
        v22 = [(CTRemoteBlacklistPlan *)self blacklistICCID];
        v40 = [(CTRemoteBlacklistPlan *)v6 blacklistICCID];
        v41 = v22;
        if (!objc_msgSend(v22, "isEqualToString:"))
        {
          char v9 = 0;
          uint64_t v25 = (void *)v45;
          v3 = v21;
          v4 = v20;
          v10 = v19;
LABEL_30:

LABEL_31:
          id v15 = v44;
          id v17 = v47;
          if (v47 == v44) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        v38 = v11;
        v3 = v21;
        v4 = v20;
        v10 = v19;
      }
      uint64_t v23 = [(CTRemoteBlacklistPlan *)self uploaderIMEI];
      uint64_t v39 = [(CTRemoteBlacklistPlan *)v6 uploaderIMEI];
      if (v23 == (void *)v39)
      {
        objc_super v34 = v4;
        v35 = v3;
      }
      else
      {
        v24 = [(CTRemoteBlacklistPlan *)self uploaderIMEI];
        v36 = [(CTRemoteBlacklistPlan *)v6 uploaderIMEI];
        v37 = v24;
        if (!objc_msgSend(v24, "isEqualToString:"))
        {
          char v9 = 0;
          v11 = v38;
          uint64_t v31 = (void *)v39;
          goto LABEL_28;
        }
        objc_super v34 = v4;
        v35 = v3;
      }
      v26 = [(CTRemoteBlacklistPlan *)self uploaderEID];
      uint64_t v27 = [(CTRemoteBlacklistPlan *)v6 uploaderEID];
      if (v26 == (void *)v27)
      {

        char v9 = 1;
      }
      else
      {
        v28 = (void *)v27;
        [(CTRemoteBlacklistPlan *)self uploaderEID];
        uint64_t v29 = v33 = v23;
        v30 = [(CTRemoteBlacklistPlan *)v6 uploaderEID];
        char v9 = [v29 isEqualToString:v30];

        uint64_t v23 = v33;
      }
      v11 = v38;
      uint64_t v31 = (void *)v39;
      v4 = v34;
      v3 = v35;
      if (v23 == (void *)v39)
      {
LABEL_29:

        uint64_t v25 = (void *)v45;
        if (v46 == (void *)v45) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
    char v9 = 0;
  }
LABEL_38:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemoteBlacklistPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CTRemoteBlacklistPlan;
  v5 = [(CTRemoteBlacklistPlan *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordId"];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blacklistIMEI"];
    blacklistIMEI = v5->_blacklistIMEI;
    v5->_blacklistIMEI = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blacklistEID"];
    blacklistEID = v5->_blacklistEID;
    v5->_blacklistEID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"blacklistICCID"];
    blacklistICCID = v5->_blacklistICCID;
    v5->_blacklistICCID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploaderIMEI"];
    uploaderIMEI = v5->_uploaderIMEI;
    v5->_uploaderIMEI = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploaderEID"];
    uploaderEID = v5->_uploaderEID;
    v5->_uploaderEID = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  key = self->_key;
  id v5 = a3;
  [v5 encodeObject:key forKey:@"recordId"];
  [v5 encodeObject:self->_blacklistIMEI forKey:@"blacklistIMEI"];
  [v5 encodeObject:self->_blacklistEID forKey:@"blacklistEID"];
  [v5 encodeObject:self->_blacklistICCID forKey:@"blacklistICCID"];
  [v5 encodeObject:self->_uploaderIMEI forKey:@"uploaderIMEI"];
  [v5 encodeObject:self->_uploaderEID forKey:@"uploaderEID"];
}

- (NSString)key
{
  return self->_key;
}

- (NSString)blacklistIMEI
{
  return self->_blacklistIMEI;
}

- (NSString)blacklistEID
{
  return self->_blacklistEID;
}

- (NSString)blacklistICCID
{
  return self->_blacklistICCID;
}

- (NSString)uploaderIMEI
{
  return self->_uploaderIMEI;
}

- (NSString)uploaderEID
{
  return self->_uploaderEID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploaderEID, 0);
  objc_storeStrong((id *)&self->_uploaderIMEI, 0);
  objc_storeStrong((id *)&self->_blacklistICCID, 0);
  objc_storeStrong((id *)&self->_blacklistEID, 0);
  objc_storeStrong((id *)&self->_blacklistIMEI, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end