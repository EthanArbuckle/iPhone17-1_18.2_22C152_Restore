@interface MTRDescriptorClusterSemanticTagStruct
- (MTRDescriptorClusterSemanticTagStruct)init;
- (NSNumber)mfgCode;
- (NSNumber)namespaceID;
- (NSNumber)tag;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLabel:(id)a3;
- (void)setMfgCode:(id)a3;
- (void)setNamespaceID:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation MTRDescriptorClusterSemanticTagStruct

- (MTRDescriptorClusterSemanticTagStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRDescriptorClusterSemanticTagStruct;
  v2 = [(MTRDescriptorClusterSemanticTagStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    mfgCode = v2->_mfgCode;
    v2->_mfgCode = 0;

    namespaceID = v3->_namespaceID;
    v3->_namespaceID = (NSNumber *)&unk_26F9C8620;

    tag = v3->_tag;
    v3->_tag = (NSNumber *)&unk_26F9C8620;

    label = v3->_label;
    v3->_label = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDescriptorClusterSemanticTagStruct);
  v7 = objc_msgSend_mfgCode(self, v5, v6);
  objc_msgSend_setMfgCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_namespaceID(self, v9, v10);
  objc_msgSend_setNamespaceID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_tag(self, v13, v14);
  objc_msgSend_setTag_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_label(self, v17, v18);
  objc_msgSend_setLabel_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: mfgCode:%@; namespaceID:%@; tag:%@; label:%@; >",
    v5,
    self->_mfgCode,
    self->_namespaceID,
    self->_tag,
  v7 = self->_label);

  return v7;
}

- (NSNumber)mfgCode
{
  return self->_mfgCode;
}

- (void)setMfgCode:(id)a3
{
}

- (NSNumber)namespaceID
{
  return self->_namespaceID;
}

- (void)setNamespaceID:(id)a3
{
}

- (NSNumber)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_namespaceID, 0);

  objc_storeStrong((id *)&self->_mfgCode, 0);
}

@end