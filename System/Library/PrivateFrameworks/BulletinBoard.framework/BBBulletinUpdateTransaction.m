@interface BBBulletinUpdateTransaction
+ (BOOL)supportsSecureCoding;
+ (id)transactionWithBulletinUpdate:(id)a3 transactionID:(unint64_t)a4;
- (BBBulletinUpdate)bulletinUpdate;
- (BBBulletinUpdateTransaction)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_initWithBulletinUpdate:(id)a3 transactionID:(unint64_t)a4;
- (id)description;
- (unint64_t)hash;
- (unint64_t)transactionID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BBBulletinUpdateTransaction

+ (id)transactionWithBulletinUpdate:(id)a3 transactionID:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithBulletinUpdate:v6 transactionID:a4];

  return v7;
}

- (id)_initWithBulletinUpdate:(id)a3 transactionID:(unint64_t)a4
{
  id v7 = a3;
  if (!a4)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BBBulletinUpdateTransaction.m", 27, @"Invalid parameter not satisfying: %@", @"transactionID > 0" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)BBBulletinUpdateTransaction;
  v8 = [(BBBulletinUpdateTransaction *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    bulletinUpdate = v8->_bulletinUpdate;
    v8->_bulletinUpdate = (BBBulletinUpdate *)v9;

    v8->_transactionID = a4;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(BBBulletinUpdateTransaction *)self bulletinUpdate];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(BBBulletinUpdateTransaction *)self transactionID] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BBBulletinUpdateTransaction *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      unint64_t v5 = v4;
      id v6 = [(BBBulletinUpdateTransaction *)self bulletinUpdate];
      id v7 = [(BBBulletinUpdateTransaction *)v5 bulletinUpdate];
      if (BSEqualObjects())
      {
        unint64_t v8 = [(BBBulletinUpdateTransaction *)self transactionID];
        BOOL v9 = v8 == [(BBBulletinUpdateTransaction *)v5 transactionID];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(BBBulletinUpdateTransaction *)self bulletinUpdate];
  id v5 = (id)[v3 appendObject:v4 withName:@"Bulletin Update"];

  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BBBulletinUpdateTransaction transactionID](self, "transactionID"), @"Transaction ID");
  id v7 = [v3 build];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(BBBulletinUpdateTransaction *)self bulletinUpdate];
  [v5 encodeObject:v4 forKey:@"bulletinUpdate"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[BBBulletinUpdateTransaction transactionID](self, "transactionID"), @"transactionID");
}

- (BBBulletinUpdateTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bulletinUpdate"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"transactionID"];

  id v7 = [(BBBulletinUpdateTransaction *)self _initWithBulletinUpdate:v5 transactionID:v6];
  return v7;
}

- (BBBulletinUpdate)bulletinUpdate
{
  return self->_bulletinUpdate;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
}

@end