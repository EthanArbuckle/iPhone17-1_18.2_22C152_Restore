@interface MTRCertificateInfo
- (BOOL)isEqual:(id)a3;
- (MTRCertificateInfo)initWithTLVBytes:(MTRCertificateTLVBytes)bytes;
- (MTRDistinguishedNameInfo)issuer;
- (MTRDistinguishedNameInfo)subject;
- (NSData)publicKeyData;
- (NSDate)notAfter;
- (NSDate)notBefore;
- (id).cxx_construct;
- (unint64_t)hash;
@end

@implementation MTRCertificateInfo

- (MTRCertificateInfo)initWithTLVBytes:(MTRCertificateTLVBytes)bytes
{
  v4 = bytes;
  v19.receiver = self;
  v19.super_class = (Class)MTRCertificateInfo;
  v7 = [(MTRCertificateInfo *)&v19 init];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = (MTRCertificateInfo *)objc_msgSend_copy(v4, v5, v6);
  v9 = v7->_bytes;
  v7->_bytes = (NSData *)v8;

  if (v8)
  {
    v10 = v7->_bytes;
    uint64_t v13 = objc_msgSend_bytes(v10, v11, v12);
    uint64_t v16 = objc_msgSend_length(v10, v14, v15);
    sub_2446C1098(v20, v13, v16);

    sub_244D97378(v20[0], v20[1], (uint64_t)&v7->_data, 0, v18);
    if (LODWORD(v18[0]))
    {
      v8 = 0;
      goto LABEL_6;
    }
LABEL_5:
    v8 = v7;
  }
LABEL_6:

  return v8;
}

- (MTRDistinguishedNameInfo)issuer
{
  v3 = [MTRDistinguishedNameInfo alloc];
  v5 = objc_msgSend_initWithDN_(v3, v4, (uint64_t)&self->_data.mIssuerDN);

  return (MTRDistinguishedNameInfo *)v5;
}

- (MTRDistinguishedNameInfo)subject
{
  v3 = [MTRDistinguishedNameInfo alloc];
  v5 = objc_msgSend_initWithDN_(v3, v4, (uint64_t)&self->_data.mSubjectDN);

  return (MTRDistinguishedNameInfo *)v5;
}

- (NSDate)notBefore
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x263EFF910], a2, v2, (double)((unint64_t)self->_data.mNotBeforeTime + 946684800));
}

- (NSData)publicKeyData
{
  uint64_t v13 = &unk_244EC2D00;
  memset(v12, 0, sizeof(v12));
  uint64_t v2 = self->_bytes;
  uint64_t v5 = objc_msgSend_bytes(v2, v3, v4);
  uint64_t v8 = objc_msgSend_length(v2, v6, v7);
  sub_2446C1098(&v14, v5, v8);

  sub_244D93C10((uint64_t)&v14, &v13, v12);
  if (LODWORD(v12[0]))
  {
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v9, (uint64_t)v13, 65);
  }

  return (NSData *)v10;
}

- (NSDate)notAfter
{
  uint64_t mNotAfterTime = self->_data.mNotAfterTime;
  if (mNotAfterTime) {
    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x263EFF910], a2, v2, (double)(unint64_t)(mNotAfterTime + 946684800));
  }
  else {
  uint64_t v4 = objc_msgSend_distantFuture(MEMORY[0x263EFF910], a2, v2);
  }

  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MTRCertificateInfo *)a3;
  if (self == v4)
  {
    char isEqual = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      char isEqual = objc_msgSend_isEqual_(self->_bytes, v6, (uint64_t)v4->_bytes);
    }
    else {
      char isEqual = 0;
    }
  }

  return isEqual;
}

- (unint64_t)hash
{
  return ((uint64_t (*)(NSData *, char *))MEMORY[0x270F9A6D0])(self->_bytes, sel_hash);
}

- (void).cxx_destruct
{
  nullsub_13(&self->_data, a2);

  objc_storeStrong((id *)&self->_bytes, 0);
}

- (id).cxx_construct
{
  return self;
}

@end