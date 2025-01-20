@interface MTRFabricInfo
- (MTRCertificateDERBytes)intermediateCertificate;
- (MTRCertificateDERBytes)operationalCertificate;
- (MTRCertificateDERBytes)rootCertificate;
- (MTRCertificateTLVBytes)intermediateCertificateTLV;
- (MTRCertificateTLVBytes)operationalCertificateTLV;
- (MTRCertificateTLVBytes)rootCertificateTLV;
- (MTRFabricInfo)initWithFabricTable:(const void *)a3 fabricInfo:(const void *)a4;
- (NSData)rootPublicKey;
- (NSNumber)fabricID;
- (NSNumber)fabricIndex;
- (NSNumber)nodeID;
- (NSNumber)vendorID;
- (NSString)label;
@end

@implementation MTRFabricInfo

- (MTRFabricInfo)initWithFabricTable:(const void *)a3 fabricInfo:(const void *)a4
{
  v44[9] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)MTRFabricInfo;
  id v6 = [(MTRFabricInfo *)&v36 init];
  if (!v6) {
    goto LABEL_11;
  }
  v43 = &unk_26F954540;
  long long v34 = 0uLL;
  uint64_t v35 = 0;
  sub_244D9E2F8((uint64_t)a4, (uint64_t)&v43, (uint64_t)&v34);
  if (v34)
  {
    v8 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = *((unsigned __int8 *)a4 + 137);
      long long v37 = v34;
      uint64_t v38 = v35;
      v10 = sub_244CB7B34((const char **)&v37, 1);
      *(_DWORD *)buf = 67109378;
      int v40 = v9;
      __int16 v41 = 2080;
      v42 = v10;
      _os_log_impl(&dword_2446BD000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch root public key for fabric index %x: %s", buf, 0x12u);
    }

    if (sub_244CC4E58(1u))
    {
      long long v37 = v34;
      uint64_t v38 = v35;
      sub_244CB7B34((const char **)&v37, 1);
      sub_244CC4DE0(0, 1);
    }
    goto LABEL_11;
  }
  uint64_t v11 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v7, (uint64_t)v44, 65);
  v12 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v11;

  uint64_t v14 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v13, *((unsigned __int16 *)a4 + 69));
  v15 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v14;

  uint64_t v17 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v16, *((void *)a4 + 1));
  v18 = (void *)*((void *)v6 + 3);
  *((void *)v6 + 3) = v17;

  uint64_t v20 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v19, *(void *)a4);
  v21 = (void *)*((void *)v6 + 4);
  *((void *)v6 + 4) = v20;

  uint64_t v22 = sub_244B87CFC((uint64_t)a4);
  uint64_t v24 = v23;
  id v25 = [NSString alloc];
  uint64_t v27 = objc_msgSend_initWithBytes_length_encoding_(v25, v26, v22, v24, 4);
  v28 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v27;

  if (!sub_244B87D44((void **)v6 + 6, (uint64_t *)v6 + 7, (uint64_t)a3, *((unsigned __int8 *)a4 + 137), sub_244D9E6A4, 0, (uint64_t)"root")|| !sub_244B87D44((void **)v6 + 8, (uint64_t *)v6 + 9, (uint64_t)a3, *((unsigned __int8 *)a4 + 137), sub_244D9ED74, 0, (uint64_t)"intermediate")|| !sub_244B87D44((void **)v6 + 10, (uint64_t *)v6 + 11, (uint64_t)a3,
          *((unsigned __int8 *)a4 + 137),
          sub_244D9EF98,
          0,
          (uint64_t)"operational"))
  {
LABEL_11:
    v32 = 0;
    goto LABEL_12;
  }
  uint64_t v30 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v29, *((unsigned __int8 *)a4 + 137));
  v31 = (void *)*((void *)v6 + 12);
  *((void *)v6 + 12) = v30;

  v32 = (MTRFabricInfo *)v6;
LABEL_12:

  return v32;
}

- (NSData)rootPublicKey
{
  return self->_rootPublicKey;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (NSString)label
{
  return self->_label;
}

- (MTRCertificateDERBytes)rootCertificate
{
  return self->_rootCertificate;
}

- (MTRCertificateTLVBytes)rootCertificateTLV
{
  return self->_rootCertificateTLV;
}

- (MTRCertificateDERBytes)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (MTRCertificateTLVBytes)intermediateCertificateTLV
{
  return self->_intermediateCertificateTLV;
}

- (MTRCertificateDERBytes)operationalCertificate
{
  return self->_operationalCertificate;
}

- (MTRCertificateTLVBytes)operationalCertificateTLV
{
  return self->_operationalCertificateTLV;
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_operationalCertificateTLV, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificateTLV, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_rootCertificateTLV, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);

  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

@end