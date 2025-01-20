@interface CKDAppContainerAccountTuple
- (BOOL)isEqual:(id)a3;
- (CKDAppContainerAccountTuple)initWithAppContainerTuple:(id)a3 accountID:(id)a4;
- (CKDAppContainerTuple)appContainerTuple;
- (NSString)accountID;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation CKDAppContainerAccountTuple

- (CKDAppContainerAccountTuple)initWithAppContainerTuple:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKDAppContainerAccountTuple;
  v10 = [(CKDAppContainerAccountTuple *)&v18 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    appContainerTuple = v10->_appContainerTuple;
    v10->_appContainerTuple = (CKDAppContainerTuple *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    accountID = v10->_accountID;
    v10->_accountID = (NSString *)v15;
  }
  return v10;
}

- (CKDAppContainerTuple)appContainerTuple
{
  return self->_appContainerTuple;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_appContainerTuple, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDAppContainerAccountTuple *)a3;
  if (self == v4)
  {
    char v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v8 = objc_msgSend_accountID(self, v6, v7);
      uint64_t v11 = objc_msgSend_accountID(v5, v9, v10);
      int v12 = CKObjectsAreBothNilOrEqual();

      if (v12)
      {
        uint64_t v15 = objc_msgSend_appContainerTuple(self, v13, v14);
        objc_super v18 = objc_msgSend_appContainerTuple(v5, v16, v17);
        char v19 = CKObjectsAreBothNilOrEqual();
      }
      else
      {
        char v19 = 0;
      }
    }
    else
    {
      char v19 = 0;
    }
  }

  return v19;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_appContainerTuple(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  uint64_t v10 = objc_msgSend_accountID(self, v8, v9);
  unint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  return v13;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_appContainerTuple(self, a2, v2);
  v8 = objc_msgSend_accountID(self, v6, v7);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v4, v9, @"%@, accountID=\"%@\"", v5, v8);

  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAppContainerAccountTuple *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

@end