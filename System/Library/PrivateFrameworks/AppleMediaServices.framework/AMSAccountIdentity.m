@interface AMSAccountIdentity
+ (BOOL)supportsSecureCoding;
- (AMSAccountIdentity)initWithCoder:(id)a3;
- (AMSAccountIdentity)initWithDSID:(id)a3 altDSID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSNumber)dsid;
- (NSString)altDSID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSAccountIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [(AMSAccountIdentity *)self altDSID];
  uint64_t v4 = [v3 hash];
  v5 = [(AMSAccountIdentity *)self dsid];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSAccountIdentity *)self altDSID];
  [v4 encodeObject:v5 forKey:@"kCodingKeyAltDSID"];

  id v6 = [(AMSAccountIdentity *)self dsid];
  [v4 encodeObject:v6 forKey:@"kCodingKeyDSID"];
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (AMSAccountIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSAccountIdentity;
  v5 = [(AMSAccountIdentity *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAltDSID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyDSID"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v8;
  }
  return v5;
}

- (AMSAccountIdentity)initWithDSID:(id)a3 altDSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSAccountIdentity;
  uint64_t v8 = [(AMSAccountIdentity *)&v15 init];
  if (!v8) {
    goto LABEL_5;
  }
  v9 = 0;
  if (v6 && v7)
  {
    uint64_t v10 = [v6 copy];
    dsid = v8->_dsid;
    v8->_dsid = (NSNumber *)v10;

    uint64_t v12 = [v7 copy];
    altDSID = v8->_altDSID;
    v8->_altDSID = (NSString *)v12;

LABEL_5:
    v9 = v8;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_altDSID copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSNumber *)self->_dsid copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = 0;
    char v10 = 0;
    uint64_t v6 = v4;
LABEL_9:

    goto LABEL_10;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [v5 altDSID];
    id v7 = [(AMSAccountIdentity *)self altDSID];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [v5 dsid];
      v9 = [(AMSAccountIdentity *)self dsid];
      char v10 = [v8 isEqualToNumber:v9];
    }
    else
    {
      char v10 = 0;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AMSAccountIdentity;
  v3 = [(AMSAccountIdentity *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" (altDSID: %@, dsid: %@)", self->_altDSID, self->_dsid];

  return v4;
}

@end