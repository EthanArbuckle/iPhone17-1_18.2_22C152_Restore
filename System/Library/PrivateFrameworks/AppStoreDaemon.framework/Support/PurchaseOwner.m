@interface PurchaseOwner
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation PurchaseOwner

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PurchaseOwner;
  v3 = [(PurchaseOwner *)&v6 description];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: {type = %ld; DSID = %@}",
    v3,
    self->_ownerType,
  v4 = self->_purchaserDSID);

  return v4;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSNumber *)self->_purchaserDSID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PurchaseOwner *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      LOBYTE(self) = 1;
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = v5;
      v8 = v6;
      if (!self)
      {
LABEL_13:

        goto LABEL_14;
      }
      purchaserDSID = self->_purchaserDSID;
      v10 = (NSNumber *)objc_getProperty(v6, v7, 16, 1);
      if (purchaserDSID == v10)
      {
        v12 = purchaserDSID;
      }
      else
      {
        v12 = v10;
        if (![(NSNumber *)self->_purchaserDSID isEqual:objc_getProperty(v8, v11, 16, 1)])
        {
          LOBYTE(self) = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      LOBYTE(self) = self->_ownerType == v8->_ownerType;
      goto LABEL_12;
    }
  }
  LOBYTE(self) = 0;
LABEL_14:

  return (char)self;
}

- (void).cxx_destruct
{
}

@end