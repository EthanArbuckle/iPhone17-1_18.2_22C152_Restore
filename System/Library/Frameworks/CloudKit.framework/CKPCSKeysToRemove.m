@interface CKPCSKeysToRemove
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CKPCSKeysToRemove)initWithCoder:(id)a3;
- (CKPCSKeysToRemove)initWithEtag:(id)a3 keys:(id)a4;
- (NSArray)keys;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initInternal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEtag:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation CKPCSKeysToRemove

- (id)initInternal
{
  v8.receiver = self;
  v8.super_class = (Class)CKPCSKeysToRemove;
  v2 = [(CKPCSKeysToRemove *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    etag = v2->_etag;
    v2->_etag = (NSString *)v3;

    uint64_t v5 = objc_opt_new();
    keys = v2->_keys;
    v2->_keys = (NSArray *)v5;
  }
  return v2;
}

- (CKPCSKeysToRemove)initWithEtag:(id)a3 keys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CKPCSKeysToRemove;
  v11 = [(CKPCSKeysToRemove *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    etag = v11->_etag;
    v11->_etag = (NSString *)v12;

    uint64_t v17 = objc_msgSend_CKDeepCopy(v7, v14, v15, v16);
    keys = v11->_keys;
    v11->_keys = (NSArray *)v17;
  }
  return v11;
}

- (BOOL)isEmpty
{
  v4 = objc_msgSend_keys(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_count(v4, v5, v6, v7) == 0;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && (objc_msgSend_etag(self, v8, v9, v10),
        v11 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_etag(v4, v12, v13, v14),
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v11, v16, (uint64_t)v15, v17),
        v15,
        v11,
        isEqualToString))
  {
    id v19 = objc_alloc(MEMORY[0x1E4F29008]);
    v21 = objc_msgSend_initWithKey_ascending_comparator_(v19, v20, @"pcsKeyID", 1, &unk_1ED7EF578);
    id v22 = objc_alloc(MEMORY[0x1E4F29008]);
    v24 = objc_msgSend_initWithKey_ascending_(v22, v23, @"keyType", 1);
    v28 = objc_msgSend_keys(self, v25, v26, v27);
    v48[0] = v21;
    v48[1] = v24;
    v30 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v29, (uint64_t)v48, 2);
    v33 = objc_msgSend_sortedArrayUsingDescriptors_(v28, v31, (uint64_t)v30, v32);

    v37 = objc_msgSend_keys(v4, v34, v35, v36);
    v47[0] = v21;
    v47[1] = v24;
    v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)v47, 2);
    v42 = objc_msgSend_sortedArrayUsingDescriptors_(v37, v40, (uint64_t)v39, v41);

    char isEqual = objc_msgSend_isEqual_(v33, v43, (uint64_t)v42, v44);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_etag(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_keys(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)description
{
  v24.receiver = self;
  v24.super_class = (Class)CKPCSKeysToRemove;
  uint64_t v3 = [(CKPCSKeysToRemove *)&v24 description];
  uint64_t v7 = objc_msgSend_etag(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_description(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_keys(self, v12, v13, v14);
  id v19 = objc_msgSend_description(v15, v16, v17, v18);
  id v22 = objc_msgSend_stringByAppendingFormat_(v3, v20, @": etag:%@ keys:%@", v21, v11, v19);

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_etag(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  objc_msgSend_setEtag_(v4, v13, (uint64_t)v12, v14);

  uint64_t v18 = objc_msgSend_keys(self, v15, v16, v17);
  id v22 = objc_msgSend_CKDeepCopy(v18, v19, v20, v21);
  objc_msgSend_setKeys_(v4, v23, (uint64_t)v22, v24);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_etag(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"Etag");

  objc_msgSend_keys(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v14, @"Keys");
}

- (CKPCSKeysToRemove)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKPCSKeysToRemove;
  uint64_t v5 = [(CKPCSKeysToRemove *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"Etag");
    etag = v5->_etag;
    v5->_etag = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v16 = objc_msgSend_setWithObjects_(v10, v14, v11, v15, v12, v13, 0);
    uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, @"Keys");
    keys = v5->_keys;
    v5->_keys = (NSArray *)v18;
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

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);

  objc_storeStrong((id *)&self->_etag, 0);
}

@end