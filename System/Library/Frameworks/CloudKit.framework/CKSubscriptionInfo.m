@interface CKSubscriptionInfo
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation CKSubscriptionInfo

- (unint64_t)hash
{
  if (self) {
    subscriptionID = self->_subscriptionID;
  }
  else {
    subscriptionID = 0;
  }
  v4 = subscriptionID;
  uint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);
  if (self) {
    container = self->_container;
  }
  else {
    container = 0;
  }
  v10 = container;
  uint64_t v14 = objc_msgSend_hash(v10, v11, v12, v13);
  if (self) {
    database = self->_database;
  }
  else {
    database = 0;
  }
  v16 = database;
  uint64_t v23 = objc_msgSend_scope(v16, v17, v18, v19);
  if (self) {
    uint64_t v24 = objc_msgSend_hash(self->_environment, v20, v21, v22);
  }
  else {
    uint64_t v24 = objc_msgSend_hash(0, v20, v21, v22);
  }
  unint64_t v25 = v14 ^ v8 ^ v23 ^ v24;

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    uint64_t v6 = v5;
    if (v5) {
      uint64_t v7 = (void *)v5[5];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    if (self) {
      subscriptionID = self->_subscriptionID;
    }
    else {
      subscriptionID = 0;
    }
    v10 = subscriptionID;
    if (!CKObjectsAreBothNilOrEqual(v8, v10))
    {
      LOBYTE(v32) = 1;
LABEL_27:

      char v33 = v32 ^ 1;
      goto LABEL_28;
    }
    if (v6) {
      v11 = (void *)v6[2];
    }
    else {
      v11 = 0;
    }
    id v12 = v11;
    if (self) {
      container = self->_container;
    }
    else {
      container = 0;
    }
    uint64_t v14 = container;
    if (!objc_msgSend_isEqual_(v12, v15, (uint64_t)v14, v16))
    {
      LOBYTE(v32) = 1;
LABEL_26:

      goto LABEL_27;
    }
    if (v6) {
      v17 = (void *)v6[1];
    }
    else {
      v17 = 0;
    }
    id v18 = v17;
    uint64_t v22 = objc_msgSend_scope(v18, v19, v20, v21);
    if (self) {
      database = self->_database;
    }
    else {
      database = 0;
    }
    uint64_t v24 = database;
    if (v22 != objc_msgSend_scope(v24, v25, v26, v27))
    {
      LOBYTE(v32) = 1;
      goto LABEL_25;
    }
    if (v6)
    {
      v28 = (void *)v6[3];
      if (!self)
      {
LABEL_20:
        id v29 = v28;
        int v32 = objc_msgSend_isEqual_(v29, v30, (uint64_t)self, v31) ^ 1;

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      v28 = 0;
      if (!self) {
        goto LABEL_20;
      }
    }
    self = (CKSubscriptionInfo *)self->_environment;
    goto LABEL_20;
  }
  char v33 = 0;
LABEL_28:

  return v33;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v4);
  if (self)
  {
    id v8 = self->_database;
    v9 = self->_environment;
    objc_msgSend_stringWithFormat_(v3, v10, @"<%@: %p; database=%@ environment=%@ subscriptionID=%@>",
      v11,
      v7,
      self,
      v8,
      v9,
      self->_subscriptionID);
  }
  else
  {
    v9 = 0;
    id v8 = 0;
    objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p; database=%@ environment=%@ subscriptionID=%@>",
      v6,
      v7,
      0,
      0,
      0,
      0);
  id v12 = };

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionID, 0);
  objc_storeStrong(&self->_idHandler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end