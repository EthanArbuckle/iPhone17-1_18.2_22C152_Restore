@interface MTROperationalCSRInfo
- (MTRCSRDERBytes)csr;
- (MTROperationalCSRInfo)initWithCSRElementsTLV:(MTRTLVBytes)csrElementsTLV attestationSignature:(NSData *)attestationSignature;
- (MTROperationalCSRInfo)initWithCSRNonce:(NSData *)csrNonce csrElementsTLV:(MTRTLVBytes)csrElementsTLV attestationSignature:(NSData *)attestationSignature;
- (MTROperationalCSRInfo)initWithCSRResponseParams:(MTROperationalCredentialsClusterCSRResponseParams *)responseParams;
- (MTRTLVBytes)csrElementsTLV;
- (NSData)attestationSignature;
- (NSData)csrNonce;
- (id)_initWithValidatedCSR:(id)a3 csrNonce:(id)a4 csrElementsTLV:(id)a5 attestationSignature:(id)a6;
@end

@implementation MTROperationalCSRInfo

- (id)_initWithValidatedCSR:(id)a3 csrNonce:(id)a4 csrElementsTLV:(id)a5 attestationSignature:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MTROperationalCSRInfo;
  v15 = [(MTROperationalCSRInfo *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_csr, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (MTROperationalCSRInfo)initWithCSRNonce:(NSData *)csrNonce csrElementsTLV:(MTRTLVBytes)csrElementsTLV attestationSignature:(NSData *)attestationSignature
{
  v8 = csrNonce;
  v9 = csrElementsTLV;
  v10 = attestationSignature;
  long long v27 = 0uLL;
  long long __s1 = 0uLL;
  sub_24484E678(v9, &v27, &__s1, &__s2);
  if (!__s2)
  {
    id v13 = v8;
    uint64_t v16 = objc_msgSend_bytes(v13, v14, v15);
    uint64_t v19 = objc_msgSend_length(v13, v17, v18);
    sub_2446C1098(&__s2, v16, v19);

    if (*((void *)&__s1 + 1) == __n && (!__n || !memcmp((const void *)__s1, __s2, __n)))
    {
      v22 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v20, v27, *((void *)&v27 + 1));
      self = (MTROperationalCSRInfo *)(id)objc_msgSend__initWithValidatedCSR_csrNonce_csrElementsTLV_attestationSignature_(self, v23, (uint64_t)v22, v13, v9, v10);

      id v11 = self;
      goto LABEL_3;
    }
    v21 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__s2) = 0;
      _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "Provided CSR nonce does not match provided csrElementsTLV", (uint8_t *)&__s2, 2u);
    }

    if (sub_244CC4E58(1u)) {
      sub_244CC4DE0(0, 1);
    }
  }
  id v11 = 0;
LABEL_3:

  return v11;
}

- (MTROperationalCSRInfo)initWithCSRElementsTLV:(MTRTLVBytes)csrElementsTLV attestationSignature:(NSData *)attestationSignature
{
  v6 = csrElementsTLV;
  v7 = attestationSignature;
  long long v17 = 0uLL;
  long long v16 = 0uLL;
  sub_24484E678(v6, &v17, &v16, v15);
  if (LODWORD(v15[0]))
  {
    v9 = 0;
  }
  else
  {
    v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, v17, *((void *)&v17 + 1));
    id v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v11, v16, *((void *)&v16 + 1));
    self = (MTROperationalCSRInfo *)(id)objc_msgSend__initWithValidatedCSR_csrNonce_csrElementsTLV_attestationSignature_(self, v13, (uint64_t)v10, v12, v6, v7);

    v9 = self;
  }

  return v9;
}

- (MTROperationalCSRInfo)initWithCSRResponseParams:(MTROperationalCredentialsClusterCSRResponseParams *)responseParams
{
  v4 = responseParams;
  v7 = objc_msgSend_nocsrElements(v4, v5, v6);
  v10 = objc_msgSend_attestationSignature(v4, v8, v9);
  id v12 = (MTROperationalCSRInfo *)objc_msgSend_initWithCSRElementsTLV_attestationSignature_(self, v11, (uint64_t)v7, v10);

  return v12;
}

- (MTRCSRDERBytes)csr
{
  return self->_csr;
}

- (NSData)csrNonce
{
  return self->_csrNonce;
}

- (MTRTLVBytes)csrElementsTLV
{
  return self->_csrElementsTLV;
}

- (NSData)attestationSignature
{
  return self->_attestationSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationSignature, 0);
  objc_storeStrong((id *)&self->_csrElementsTLV, 0);
  objc_storeStrong((id *)&self->_csrNonce, 0);

  objc_storeStrong((id *)&self->_csr, 0);
}

@end