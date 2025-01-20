@interface CWFAWDLPeerContext
+ (BOOL)supportsSecureCoding;
+ (id)AWDLPeerContextWithMACAddress:(id)a3 interfaceName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAWDLPeerContext:(id)a3;
- (CWFAWDLPeerContext)initWithCoder:(id)a3;
- (NSString)MACAddress;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setMACAddress:(id)a3;
@end

@implementation CWFAWDLPeerContext

+ (id)AWDLPeerContextWithMACAddress:(id)a3 interfaceName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(CWFAWDLPeerContext);
  objc_msgSend_setMACAddress_(v7, v8, (uint64_t)v6, v9, v10);

  objc_msgSend_setInterfaceName_(v7, v11, (uint64_t)v5, v12, v13);
  return v7;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"MACAddress=%@, interfaceName=%@", v2, v3, self->_MACAddress, self->_interfaceName);
}

- (BOOL)isEqualToAWDLPeerContext:(id)a3
{
  id v6 = a3;
  MACAddress = self->_MACAddress;
  objc_msgSend_MACAddress(v6, v8, v9, v10, v11);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (MACAddress != v16)
  {
    if (!self->_MACAddress
      || (objc_msgSend_MACAddress(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_14;
    }
    uint64_t v3 = (void *)v17;
    v22 = self->_MACAddress;
    v4 = objc_msgSend_MACAddress(v6, v18, v19, v20, v21);
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      char isEqual = 0;
LABEL_12:

      goto LABEL_14;
    }
  }
  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v6, v12, v13, v14, v15);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  char isEqual = interfaceName == v32;
  if (isEqual || !self->_interfaceName) {
    goto LABEL_10;
  }
  uint64_t v33 = objc_msgSend_interfaceName(v6, v28, v29, v30, v31);
  if (v33)
  {
    v38 = (void *)v33;
    v39 = self->_interfaceName;
    v40 = objc_msgSend_interfaceName(v6, v34, v35, v36, v37);
    char isEqual = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43);

LABEL_10:
    goto LABEL_11;
  }

  char isEqual = 0;
LABEL_11:
  if (MACAddress != v16) {
    goto LABEL_12;
  }
LABEL_14:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFAWDLPeerContext *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToAWDLPeerContext = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAWDLPeerContext = objc_msgSend_isEqualToAWDLPeerContext_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToAWDLPeerContext = 0;
  }

  return isEqualToAWDLPeerContext;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_MACAddress, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10) ^ v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFAWDLPeerContext, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMACAddress_(v11, v12, (uint64_t)self->_MACAddress, v13, v14);
  objc_msgSend_setInterfaceName_(v11, v15, (uint64_t)self->_interfaceName, v16, v17);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MACAddress = self->_MACAddress;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)MACAddress, @"_MACAddress", v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_interfaceName, @"_interfaceName", v8);
}

- (CWFAWDLPeerContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CWFAWDLPeerContext;
  id v5 = [(CWFAWDLPeerContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_MACAddress", v8);
    MACAddress = v5->_MACAddress;
    v5->_MACAddress = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_interfaceName", v13);
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v14;
  }
  return v5;
}

- (NSString)MACAddress
{
  return self->_MACAddress;
}

- (void)setMACAddress:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_MACAddress, 0);
}

@end