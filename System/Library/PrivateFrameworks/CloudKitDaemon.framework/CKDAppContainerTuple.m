@interface CKDAppContainerTuple
- (BOOL)isEqual:(id)a3;
- (CKContainerID)containerID;
- (CKDAppContainerTuple)initWithApplicationID:(id)a3 containerID:(id)a4 personaID:(id)a5;
- (CKDApplicationID)applicationID;
- (NSString)personaID;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
@end

@implementation CKDAppContainerTuple

- (BOOL)isEqual:(id)a3
{
  v4 = (CKDAppContainerTuple *)a3;
  if (self == v4)
  {
    char v26 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v8 = objc_msgSend_applicationID(self, v6, v7);
      v11 = objc_msgSend_applicationID(v5, v9, v10);
      int v12 = CKObjectsAreBothNilOrEqual();

      if (v12
        && (objc_msgSend_containerID(self, v13, v14),
            v15 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_containerID(v5, v16, v17),
            v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = CKObjectsAreBothNilOrEqual(),
            v18,
            v15,
            v19))
      {
        v22 = objc_msgSend_personaID(self, v20, v21);
        v25 = objc_msgSend_personaID(v5, v23, v24);
        char v26 = CKObjectsAreBothNilOrEqual();
      }
      else
      {
        char v26 = 0;
      }
    }
    else
    {
      char v26 = 0;
    }
  }

  return v26;
}

- (CKDApplicationID)applicationID
{
  return self->_applicationID;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (CKDAppContainerTuple)initWithApplicationID:(id)a3 containerID:(id)a4 personaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CKDAppContainerTuple;
  v13 = [(CKDAppContainerTuple *)&v25 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v11, v12);
    applicationID = v13->_applicationID;
    v13->_applicationID = (CKDApplicationID *)v14;

    uint64_t v18 = objc_msgSend_copy(v9, v16, v17);
    containerID = v13->_containerID;
    v13->_containerID = (CKContainerID *)v18;

    uint64_t v22 = objc_msgSend_copy(v10, v20, v21);
    personaID = v13->_personaID;
    v13->_personaID = (NSString *)v22;
  }
  return v13;
}

- (unint64_t)hash
{
  v4 = objc_msgSend_applicationID(self, a2, v2);
  uint64_t v7 = objc_msgSend_hash(v4, v5, v6);
  id v10 = objc_msgSend_containerID(self, v8, v9);
  uint64_t v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;
  v16 = objc_msgSend_personaID(self, v14, v15);
  unint64_t v19 = v13 ^ objc_msgSend_hash(v16, v17, v18);

  return v19;
}

- (id)CKPropertiesDescription
{
  v4 = NSString;
  v5 = objc_msgSend_applicationID(self, a2, v2);
  id v8 = objc_msgSend_containerID(self, v6, v7);
  v11 = objc_msgSend_personaID(self, v9, v10);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v4, v12, @"applicationID=\"%@\", containerID=\"%@\", personaID=\"%@\"", v5, v8, v11);

  return v13;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDAppContainerTuple *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

@end