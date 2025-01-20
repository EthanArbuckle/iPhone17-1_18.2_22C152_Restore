@interface CBDeviceIdentity
- (BOOL)isEqual:(id)a3;
- (CBDeviceIdentity)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)irkData;
- (NSString)accountID;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)idsDeviceID;
- (NSString)model;
- (NSString)name;
- (NSUUID)bluetoothIdentifier;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)type;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setBluetoothIdentifier:(id)a3;
- (void)setContactID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsDeviceID:(id)a3;
- (void)setIrkData:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int)a3;
@end

@implementation CBDeviceIdentity

- (CBDeviceIdentity)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CBDeviceIdentity;
  v13 = [(CBDeviceIdentity *)&v19 init];
  if (!v13)
  {
    if (!a4) {
      goto LABEL_21;
    }
    v17 = "CBDeviceIdentity super init failed";
LABEL_20:
    CBErrorF(-6756, (uint64_t)v17, v7, v8, v9, v10, v11, v12, v18);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_21;
    }
    v17 = "XPC non-dict";
    goto LABEL_20;
  }
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSUUID()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSDataOfLength()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString())
  {
    goto LABEL_21;
  }
  uint64_t v20 = 0;
  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5) {
      goto LABEL_14;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_15;
  }
  v13->_type = v20;
LABEL_14:
  v15 = v13;
LABEL_15:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSString *)self->_accountID UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "acID", v5);
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    *(void *)uuid = 0;
    uint64_t v32 = 0;
    id v7 = v4;
    [(NSUUID *)bluetoothIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v7, "btID", uuid);
  }
  contactID = self->_contactID;
  id v9 = v4;
  uint64_t v10 = [(NSString *)contactID UTF8String];
  if (v10) {
    xpc_dictionary_set_string(v9, "cnID", v10);
  }

  irkData = self->_irkData;
  if (irkData)
  {
    uint64_t v12 = irkData;
    id v13 = v9;
    int v14 = v12;
    uint64_t v15 = [(NSData *)v14 bytes];
    if (v15) {
      v16 = (const char *)v15;
    }
    else {
      v16 = "";
    }
    size_t v17 = [(NSData *)v14 length];

    xpc_dictionary_set_data(v13, "irkD", v16, v17);
  }
  identifier = self->_identifier;
  id v19 = v9;
  uint64_t v20 = [(NSString *)identifier UTF8String];
  if (v20) {
    xpc_dictionary_set_string(v19, "id", v20);
  }

  idsDeviceID = self->_idsDeviceID;
  id v22 = v19;
  v23 = [(NSString *)idsDeviceID UTF8String];
  if (v23) {
    xpc_dictionary_set_string(v22, "idsI", v23);
  }

  model = self->_model;
  id v25 = v22;
  v26 = [(NSString *)model UTF8String];
  if (v26) {
    xpc_dictionary_set_string(v25, "md", v26);
  }

  name = self->_name;
  id v28 = v25;
  v29 = [(NSString *)name UTF8String];
  if (v29) {
    xpc_dictionary_set_string(v28, "nm", v29);
  }

  int64_t type = self->_type;
  if (type) {
    xpc_dictionary_set_int64(v28, "idTy", type);
  }
}

- (id)description
{
  return [(CBDeviceIdentity *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t type = self->_type;
  if (type > 6) {
    id v6 = "?";
  }
  else {
    id v6 = off_1E5E31EF8[type];
  }
  v30 = v6;
  NSAppendPrintF_safe();
  id v7 = 0;
  uint64_t v8 = self->_identifier;
  id v9 = self->_idsDeviceID;
  if (-[NSString isEqual:](v9, "isEqual:", v8, v30))
  {
    uint64_t v10 = v8;
    uint64_t v8 = 0;
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    NSAppendPrintF_safe();
    id v11 = v7;
    uint64_t v10 = (NSString *)v7;
    id v7 = v11;
  }

LABEL_9:
  if (v9)
  {
    NSAppendPrintF_safe();
    id v12 = v7;

    id v7 = v12;
  }
  bluetoothIdentifier = self->_bluetoothIdentifier;
  if (bluetoothIdentifier)
  {
    int v14 = bluetoothIdentifier;
    v31 = [(NSUUID *)v14 UUIDString];
    NSAppendPrintF_safe();
    id v15 = v7;

    id v7 = v15;
  }
  name = self->_name;
  if (name)
  {
    uint64_t v32 = name;
    NSAppendPrintF_safe();
    id v17 = v7;

    id v7 = v17;
  }
  model = self->_model;
  if (model)
  {
    uint64_t v33 = model;
    NSAppendPrintF_safe();
    id v19 = v7;

    id v7 = v19;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    v34 = accountID;
    NSAppendPrintF_safe();
    id v21 = v7;

    id v7 = v21;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    v35 = contactID;
    NSAppendPrintF_safe();
    id v23 = v7;

    id v7 = v23;
  }
  irkData = self->_irkData;
  if (irkData)
  {
    id v25 = irkData;
    v36 = CUPrintNSObjectMasked();
    NSAppendPrintF_safe();
    id v26 = v7;

    id v7 = v26;
  }
  if (a3 <= 20)
  {
    NSAppendPrintF_safe();
    id v27 = v7;

    id v7 = v27;
  }
  id v28 = v7;

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CBDeviceIdentity *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(CBDeviceIdentity *)v5 accountID];
      accountID = self->_accountID;
      id v8 = v6;
      id v9 = accountID;
      if (v8 == v9)
      {
      }
      else
      {
        uint64_t v10 = v9;
        if ((v8 == 0) == (v9 != 0)) {
          goto LABEL_44;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11) {
          goto LABEL_45;
        }
      }
      id v13 = [(CBDeviceIdentity *)v5 bluetoothIdentifier];
      bluetoothIdentifier = self->_bluetoothIdentifier;
      id v8 = v13;
      id v15 = bluetoothIdentifier;
      if (v8 == v15)
      {
      }
      else
      {
        uint64_t v10 = v15;
        if ((v8 == 0) == (v15 != 0)) {
          goto LABEL_44;
        }
        int v16 = [v8 isEqual:v15];

        if (!v16) {
          goto LABEL_45;
        }
      }
      id v17 = [(CBDeviceIdentity *)v5 contactID];
      contactID = self->_contactID;
      id v8 = v17;
      id v19 = contactID;
      if (v8 == v19)
      {
      }
      else
      {
        uint64_t v10 = v19;
        if ((v8 == 0) == (v19 != 0)) {
          goto LABEL_44;
        }
        int v20 = [v8 isEqual:v19];

        if (!v20) {
          goto LABEL_45;
        }
      }
      id v21 = [(CBDeviceIdentity *)v5 identifier];
      identifier = self->_identifier;
      id v8 = v21;
      id v23 = identifier;
      if (v8 == v23)
      {
      }
      else
      {
        uint64_t v10 = v23;
        if ((v8 == 0) == (v23 != 0)) {
          goto LABEL_44;
        }
        int v24 = [v8 isEqual:v23];

        if (!v24) {
          goto LABEL_45;
        }
      }
      id v25 = [(CBDeviceIdentity *)v5 idsDeviceID];
      idsDeviceID = self->_idsDeviceID;
      id v8 = v25;
      id v27 = idsDeviceID;
      if (v8 == v27)
      {
      }
      else
      {
        uint64_t v10 = v27;
        if ((v8 == 0) == (v27 != 0)) {
          goto LABEL_44;
        }
        int v28 = [v8 isEqual:v27];

        if (!v28) {
          goto LABEL_45;
        }
      }
      v29 = [(CBDeviceIdentity *)v5 irkData];
      irkData = self->_irkData;
      id v8 = v29;
      v31 = irkData;
      if (v8 == v31)
      {
      }
      else
      {
        uint64_t v10 = v31;
        if ((v8 == 0) == (v31 != 0)) {
          goto LABEL_44;
        }
        int v32 = [v8 isEqual:v31];

        if (!v32) {
          goto LABEL_45;
        }
      }
      uint64_t v33 = [(CBDeviceIdentity *)v5 model];
      model = self->_model;
      id v8 = v33;
      v35 = model;
      if (v8 == v35)
      {
      }
      else
      {
        uint64_t v10 = v35;
        if ((v8 == 0) == (v35 != 0)) {
          goto LABEL_44;
        }
        int v36 = [v8 isEqual:v35];

        if (!v36) {
          goto LABEL_45;
        }
      }
      v37 = [(CBDeviceIdentity *)v5 name];
      name = self->_name;
      id v8 = v37;
      v39 = name;
      if (v8 == v39)
      {

LABEL_49:
        BOOL v12 = [(CBDeviceIdentity *)v5 type] == self->_type;
        goto LABEL_46;
      }
      uint64_t v10 = v39;
      if ((v8 == 0) != (v39 != 0))
      {
        int v40 = [v8 isEqual:v39];

        if (v40) {
          goto LABEL_49;
        }
LABEL_45:
        BOOL v12 = 0;
LABEL_46:

        goto LABEL_47;
      }
LABEL_44:

      goto LABEL_45;
    }
    BOOL v12 = 0;
  }
LABEL_47:

  return v12;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (NSUUID)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (NSData)irkData
{
  return self->_irkData;
}

- (void)setIrkData:(id)a3
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_irkData, 0);
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end