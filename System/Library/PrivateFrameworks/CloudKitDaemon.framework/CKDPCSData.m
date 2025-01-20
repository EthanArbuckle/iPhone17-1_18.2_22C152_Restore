@interface CKDPCSData
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldEncodePCSData;
- (CKDPCSData)initWithCoder:(id)a3;
- (CKDPCSData)initWithPCSData:(id)a3;
- (NSData)pcsData;
- (NSSecureCoding)itemID;
- (NSString)etag;
- (NSString)pcsKeyID;
- (_OpaquePCSShareProtection)pcs;
- (id)CKPropertiesDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setEtag:(id)a3;
- (void)setPcs:(_OpaquePCSShareProtection *)a3;
- (void)setPcsData:(id)a3;
- (void)setPcsKeyID:(id)a3;
@end

@implementation CKDPCSData

- (CKDPCSData)initWithPCSData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCSData;
  v7 = [(CKDPCSData *)&v11 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
    pcsData = v7->_pcsData;
    v7->_pcsData = (NSData *)v8;
  }
  return v7;
}

- (void)dealloc
{
  pcs = self->_pcs;
  if (pcs)
  {
    CFRelease(pcs);
    self->_pcs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDPCSData;
  [(CKDPCSData *)&v4 dealloc];
}

- (BOOL)shouldEncodePCSData
{
  return 1;
}

- (void)setPcs:(_OpaquePCSShareProtection *)a3
{
  obj = self;
  objc_sync_enter(obj);
  pcs = obj->_pcs;
  if (pcs != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      v5 = obj;
      pcs = obj->_pcs;
    }
    else
    {
      v5 = obj;
    }
    v5->_pcs = a3;
    if (pcs)
    {
      CFRelease(pcs);
      a3 = obj->_pcs;
    }
    if (a3)
    {
      uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
      v7 = (void *)PCSFPCreateUniqueID();
      v10 = objc_msgSend_CKBase64URLSafeString(v7, v8, v9);
      objc_msgSend_setPcsKeyID_(obj, v11, (uint64_t)v10);
    }
  }
  objc_sync_exit(obj);
}

- (_OpaquePCSShareProtection)pcs
{
  return self->_pcs;
}

- (NSSecureCoding)itemID
{
  return 0;
}

- (id)CKPropertiesDescription
{
  v3 = (void *)MEMORY[0x1C8789E70](self, a2);
  objc_super v4 = (void *)MEMORY[0x1E4F28E78];
  v7 = objc_msgSend_itemID(self, v5, v6);
  v10 = objc_msgSend_etag(self, v8, v9);
  v12 = objc_msgSend_stringWithFormat_(v4, v11, @"itemID=%@, etag=%@", v7, v10);

  if (objc_msgSend_pcs(self, v13, v14))
  {
    uint64_t v17 = objc_msgSend_pcs(self, v15, v16);
    objc_msgSend_appendFormat_(v12, v18, @", pcs=%@", v17);
  }
  v19 = objc_msgSend_pcsData(self, v15, v16);

  if (v19)
  {
    v22 = objc_msgSend_pcsData(self, v20, v21);
    objc_msgSend_appendFormat_(v12, v23, @", pcsData=%@", v22);
  }
  return v12;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDPCSData *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v7 = objc_msgSend_pcsData(self, v5, v6);
  v10 = objc_msgSend_copy(v7, v8, v9);
  objc_msgSend_setPcsData_(v4, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_etag(self, v12, v13);
  uint64_t v17 = objc_msgSend_copy(v14, v15, v16);
  objc_msgSend_setEtag_(v4, v18, (uint64_t)v17);

  uint64_t v21 = objc_msgSend_pcsKeyID(self, v19, v20);
  v24 = objc_msgSend_copy(v21, v22, v23);
  objc_msgSend_setPcsKeyID_(v4, v25, (uint64_t)v24);

  objc_msgSend_pcs(self, v26, v27);
  v28 = (const void *)PCSFPCopyObject();
  objc_msgSend_setPcs_(v4, v29, (uint64_t)v28);
  if (v28) {
    CFRelease(v28);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = (void *)MEMORY[0x1C8789E70]();
  if (objc_msgSend_shouldEncodePCSData(self, v5, v6))
  {
    uint64_t v9 = objc_msgSend_pcsData(self, v7, v8);
    objc_msgSend_encodeObject_forKey_(v17, v10, (uint64_t)v9, @"PCSData");

    uint64_t v13 = objc_msgSend_etag(self, v11, v12);
    objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)v13, @"Etag");
  }
  v15 = objc_msgSend_pcsKeyID(self, v7, v8);
  objc_msgSend_encodeObject_forKey_(v17, v16, (uint64_t)v15, @"KeyID");
}

- (CKDPCSData)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKDPCSData;
  v5 = [(CKDPCSData *)&v20 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1C8789E70]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"PCSData");
    pcsData = v5->_pcsData;
    v5->_pcsData = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"Etag");
    etag = v5->_etag;
    v5->_etag = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"KeyID");
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSString *)v17;
  }

  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSData)pcsData
{
  return self->_pcsData;
}

- (void)setPcsData:(id)a3
{
}

- (NSString)pcsKeyID
{
  return self->_pcsKeyID;
}

- (void)setPcsKeyID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsKeyID, 0);
  objc_storeStrong((id *)&self->_pcsData, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end