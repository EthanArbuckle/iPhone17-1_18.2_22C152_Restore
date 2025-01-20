@interface DemotedApplication
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation DemotedApplication

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    *((void *)v5 + 6) = self->_accountID;
    id v7 = [(NSString *)self->_bundleID copyWithZone:a3];
    objc_setProperty_nonatomic_copy(v6, v8, v7, 8);

    *((void *)v6 + 7) = self->_downloaderID;
    *((void *)v6 + 2) = self->_externalVersionID;
    *((void *)v6 + 8) = self->_familyID;
    *((void *)v6 + 3) = self->_itemID;
    *(_OWORD *)(v6 + 72) = *(_OWORD *)&self->_purchaserID;
    *((void *)v6 + 4) = self->_storeFrontID;
    id v9 = [(NSString *)self->_vendorID copyWithZone:a3];
    objc_setProperty_nonatomic_copy(v6, v10, v9, 40);
  }
  else
  {

    id v9 = [(NSString *)self->_vendorID copyWithZone:a3];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end