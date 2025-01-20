@interface DNDSIDSRecordID
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSIDSRecordID)initWithIdentifier:(id)a3 zone:(id)a4;
- (NSString)description;
- (NSString)identifier;
- (NSString)zone;
- (id)_initWithRecordID:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (unint64_t)hash;
@end

@implementation DNDSIDSRecordID

- (DNDSIDSRecordID)initWithIdentifier:(id)a3 zone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSIDSRecordID;
  v8 = [(DNDSIDSRecordID *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    zone = v8->_zone;
    v8->_zone = (NSString *)v11;
  }
  return v8;
}

- (id)_initWithRecordID:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  id v6 = [v4 zone];

  id v7 = [(DNDSIDSRecordID *)self initWithIdentifier:v5 zone:v6];
  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_zone hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSIDSRecordID *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(DNDSIDSRecordID *)self identifier];
      id v7 = [(DNDSIDSRecordID *)v5 identifier];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDSIDSRecordID *)self identifier];
        if (!v8)
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v9 = (void *)v8;
        v10 = [(DNDSIDSRecordID *)v5 identifier];
        if (!v10)
        {
          char v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        uint64_t v11 = [(DNDSIDSRecordID *)self identifier];
        v12 = [(DNDSIDSRecordID *)v5 identifier];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      objc_super v14 = [(DNDSIDSRecordID *)self zone];
      uint64_t v15 = [(DNDSIDSRecordID *)v5 zone];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(DNDSIDSRecordID *)self zone];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDSIDSRecordID *)v5 zone];
          if (v19)
          {
            v22 = [(DNDSIDSRecordID *)self zone];
            v20 = [(DNDSIDSRecordID *)v5 zone];
            char v13 = [v22 isEqual:v20];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {

          char v13 = 0;
        }
      }
      v10 = v25;
      uint64_t v9 = v26;
      v12 = v23;
      uint64_t v11 = v24;
      if (v6 == v7) {
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    char v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(DNDSIDSRecordID *)self identifier];
  id v6 = [(DNDSIDSRecordID *)self zone];
  id v7 = [v3 stringWithFormat:@"<%@: %p; identifier: %@; zone: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(v5, "bs_safeStringForKey:", @"identifier");
  id v7 = objc_msgSend(v5, "bs_safeStringForKey:", @"zone");

  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v6 zone:v7];
  return v8;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"zone";
  zone = self->_zone;
  v7[0] = self->_identifier;
  v7[1] = zone;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)zone
{
  return self->_zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end