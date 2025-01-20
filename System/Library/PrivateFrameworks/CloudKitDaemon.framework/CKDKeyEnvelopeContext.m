@interface CKDKeyEnvelopeContext
- (BOOL)encryptMergeableValueMetadata;
- (CKDKeyEnvelopeContext)envelopeContextWithIdentifier:(id)a3 error:(id *)a4;
- (CKDPCSManager)pcsManager;
- (CKMergeableValueID)mergeableValueID;
- (_OpaquePCSShareProtection)shareProtection;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setEncryptMergeableValueMetadata:(BOOL)a3;
- (void)setMergeableValueID:(id)a3;
- (void)setPcsManager:(id)a3;
- (void)setShareProtection:(_OpaquePCSShareProtection *)a3;
@end

@implementation CKDKeyEnvelopeContext

- (void)dealloc
{
  shareProtection = self->_shareProtection;
  if (shareProtection)
  {
    CFRelease(shareProtection);
    self->_shareProtection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDKeyEnvelopeContext;
  [(CKDKeyEnvelopeContext *)&v4 dealloc];
}

- (void)setShareProtection:(_OpaquePCSShareProtection *)a3
{
  shareProtection = self->_shareProtection;
  if (shareProtection != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      shareProtection = self->_shareProtection;
    }
    self->_shareProtection = a3;
    if (shareProtection)
    {
      CFRelease(shareProtection);
    }
  }
}

- (CKDKeyEnvelopeContext)envelopeContextWithIdentifier:(id)a3 error:(id *)a4
{
  id v8 = a3;
  if (v8)
  {
    v9 = objc_msgSend_mergeableValueID(self, v6, v7);
    v12 = objc_msgSend_recordID(v9, v10, v11);
    uint64_t v15 = objc_msgSend_key(v9, v13, v14);
    v18 = (void *)v15;
    if (v9 && v12 && v15)
    {
      v19 = NSString;
      v20 = objc_msgSend_zoneID(v12, v16, v17);
      v23 = objc_msgSend_zoneName(v20, v21, v22);
      v26 = objc_msgSend_recordName(v12, v24, v25);
      v29 = objc_msgSend_name(v9, v27, v28);
      v31 = objc_msgSend_stringWithFormat_(v19, v30, @"%@-%@-%@-%@-%@", v23, v26, v18, v29, v8);

      v32 = v31;
      uint64_t v34 = objc_msgSend_dataUsingEncoding_(v31, v33, 4);
      v36 = (void *)v34;
      if (a4 && !v34)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v35, *MEMORY[0x1E4F19DD8], 1000, @"Mergeable delta envelope context generation failed, invalid context encoding");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a4)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v16, *MEMORY[0x1E4F19DD8], 1017, @"Mergeable delta envelope context generation failed, invalid mergeable value ID");
      v36 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 1017, @"Mergeable delta envelope context generation failed, missing delta identifier");
    v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }

  return (CKDKeyEnvelopeContext *)v36;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v7 = (const void *)objc_msgSend_shareProtection(self, v5, v6);
  if (v7)
  {
    v10 = v7;
    CFRetain(v7);
    v4[2] = v10;
  }
  *((unsigned char *)v4 + 8) = objc_msgSend_encryptMergeableValueMetadata(self, v8, v9);
  v13 = objc_msgSend_mergeableValueID(self, v11, v12);
  uint64_t v16 = objc_msgSend_copy(v13, v14, v15);
  uint64_t v17 = (void *)v4[3];
  v4[3] = v16;

  return v4;
}

- (_OpaquePCSShareProtection)shareProtection
{
  return self->_shareProtection;
}

- (BOOL)encryptMergeableValueMetadata
{
  return self->_encryptMergeableValueMetadata;
}

- (void)setEncryptMergeableValueMetadata:(BOOL)a3
{
  self->_encryptMergeableValueMetadata = a3;
}

- (CKMergeableValueID)mergeableValueID
{
  return self->_mergeableValueID;
}

- (void)setMergeableValueID:(id)a3
{
}

- (CKDPCSManager)pcsManager
{
  return self->_pcsManager;
}

- (void)setPcsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pcsManager, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
}

@end