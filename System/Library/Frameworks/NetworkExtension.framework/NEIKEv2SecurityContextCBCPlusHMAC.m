@interface NEIKEv2SecurityContextCBCPlusHMAC
+ (uint64_t)fixedOverheadForEncryptionProtocol:(void *)a3 integrityProtocol:;
+ (uint64_t)overheadForPlaintextLength:(void *)a3 encryptionProtocol:(void *)a4 integrityProtocol:;
+ (uint64_t)paddingLengthForPlaintextLength:(void *)a3 encryptionProtocol:;
- (__CFData)computeIncomingHMACUsingContext:(void *)a3 authenticatedHeaders:(void *)a4 payloadData:;
- (__CFData)computeOutgoingHMACUsingContext:(void *)a3 payloadData:;
- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4;
- (uint64_t)fixedOverheadLength;
- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3;
- (unsigned)overheadForPlaintextLength:(unsigned int)a3;
- (void)dealloc;
@end

@implementation NEIKEv2SecurityContextCBCPlusHMAC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integrityProtocol, 0);

  objc_storeStrong((id *)&self->_encryptionProtocol, 0);
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v34 = "-[NEIKEv2SecurityContextCBCPlusHMAC decryptPayloadData:authenticatedHeaders:]";
    v28 = "%s called with null payloadData";
LABEL_37:
    _os_log_fault_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_40;
  }
  if (!v7)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)v34 = "-[NEIKEv2SecurityContextCBCPlusHMAC decryptPayloadData:authenticatedHeaders:]";
    v28 = "%s called with null authenticatedHeaders";
    goto LABEL_37;
  }
  if (self)
  {
    int v9 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)self->_encryptionProtocol);
    integrityProtocol = self->_integrityProtocol;
  }
  else
  {
    int v9 = -[NEIKEv2EncryptionProtocol ivLength](0);
    integrityProtocol = 0;
  }
  int v11 = -[NEIKEv2IntegrityProtocol digestLength]((uint64_t)integrityProtocol);
  unsigned int v12 = [v6 length];
  unsigned int v13 = v12;
  if (self)
  {
    if (self->super._minimumEncryptedPayloadSize > v12)
    {
      v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v34 = v13;
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Cannot decrypt, encrypted data length %u too short", buf, 8u);
      }
      goto LABEL_40;
    }
    incomingHMACBaseContext = self->_incomingHMACBaseContext;
    v15 = self;
  }
  else
  {
    v15 = 0;
    incomingHMACBaseContext = 0;
  }
  v16 = -[NEIKEv2SecurityContextCBCPlusHMAC computeIncomingHMACUsingContext:authenticatedHeaders:payloadData:]((uint64_t)v15, (uint64_t)incomingHMACBaseContext, v8, v6);
  if (v16)
  {
    [v6 bytes];
    [v16 bytes];
    if (cc_cmp_safe())
    {
      v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "Integrity check failure", buf, 2u);
      }
      goto LABEL_15;
    }

    size_t v17 = v13 - v9 - v11;
    if (self) {
      encryptionProtocol = self->_encryptionProtocol;
    }
    else {
      encryptionProtocol = 0;
    }
    if (v17 % -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)encryptionProtocol))
    {
      v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        if (self) {
          v27 = self->_encryptionProtocol;
        }
        else {
          v27 = 0;
        }
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v34 = v17;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)v27);
        _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "Ciphertext length %u is not a multiple of the cipher block length %u", buf, 0xEu);
      }
      v16 = 0;
LABEL_15:
      v20 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v19 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v17];
    v21 = (char *)[v6 bytes];
    if (self) {
      incomingEncryptionContext = self->_incomingEncryptionContext;
    }
    else {
      incomingEncryptionContext = 0;
    }
    CCCryptorStatus v23 = CCCryptorReset(incomingEncryptionContext, v21);
    if (v23)
    {
      CCCryptorStatus v29 = v23;
      v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v34 = v29;
        _os_log_fault_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_FAULT, "CCCryptorReset failed: %d)", buf, 8u);
      }
    }
    v24 = &v21[v9];
    size_t dataOutMoved = 0;
    if (self) {
      self = (NEIKEv2SecurityContextCBCPlusHMAC *)self->_incomingEncryptionContext;
    }
    CCCryptorStatus v25 = CCCryptorUpdate((CCCryptorRef)self, v24, v17, (void *)[v19 mutableBytes], v17, &dataOutMoved);
    if (v25 || dataOutMoved != v17)
    {
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v34 = v25;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v17;
        __int16 v35 = 2048;
        size_t v36 = dataOutMoved;
        _os_log_fault_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_FAULT, "CC decrypt failed: status %d, original %u, decrypted %zu)", buf, 0x18u);
      }
    }
    else if (+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]((uint64_t)NEIKEv2SecurityContext, v19))
    {
      v20 = v19;
LABEL_25:
      v16 = 0;
      goto LABEL_26;
    }
    v20 = 0;
    goto LABEL_25;
  }
LABEL_40:
  v20 = 0;
LABEL_27:

  return v20;
}

- (__CFData)computeIncomingHMACUsingContext:(void *)a3 authenticatedHeaders:(void *)a4 payloadData:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    CFIndex v9 = CCHmacOutputSizeFromRef();
    unsigned int v10 = -[NEIKEv2IntegrityProtocol digestLength](*(void *)(a1 + 40));
    int v11 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v9);
    if (v11)
    {
      unsigned int v12 = (CCHmacContext *)CCHmacClone();
      if (a2)
      {
        unsigned int v13 = v12;
        CCHmacUpdate(v12, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
        CCHmacUpdate(v13, (const void *)[v8 bytes], objc_msgSend(v8, "length") - v10);
        CCHmacFinal(v13, (void *)[(__CFData *)v11 mutableBytes]);
        [(__CFData *)v11 setLength:v10];
        CCHmacDestroy();
        v14 = v11;
LABEL_9:

        goto LABEL_10;
      }
      size_t v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v18) = 0;
        _os_log_fault_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_FAULT, "CCHmacClone failed", (uint8_t *)&v18, 2u);
      }
    }
    else
    {
      v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v18 = 134217984;
        CFIndex v19 = v9;
        _os_log_fault_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&v18, 0xCu);
      }
    }
    v14 = 0;
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unsigned int v8 = [v6 length];
    unsigned int v9 = [v7 length];
    if (self) {
      unsigned __int8 v10 = +[NEIKEv2SecurityContextCBCPlusHMAC paddingLengthForPlaintextLength:encryptionProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, v8, self->_encryptionProtocol);
    }
    else {
      unsigned __int8 v10 = 0;
    }
    unsigned __int8 v36 = v10;
    size_t v11 = v8 + v10 + 1;
    unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:-[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadLength]((uint64_t)self)+ v9+ v11];
    [v12 appendData:v7];
    if (self) {
      encryptionProtocol = self->_encryptionProtocol;
    }
    else {
      encryptionProtocol = 0;
    }
    unsigned int v14 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)encryptionProtocol);
    v15 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v14);
    v34 = v15;
    if (!v15)
    {
      int v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v14;
        _os_log_fault_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createRandomWithSize:%u] failed", buf, 8u);
      }
      id v19 = 0;
      goto LABEL_25;
    }
    id v33 = v7;
    [v12 appendData:v15];
    id v16 = v6;
    [v12 appendData:v6];
    if (v10)
    {
      int v17 = v10;
      int v18 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v10);
      if (!v18)
      {
        int v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v38 = v17;
          _os_log_fault_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createRandomWithSize:%u] failed", buf, 8u);
        }
        id v19 = 0;
        id v6 = v16;
        id v7 = v33;
        goto LABEL_25;
      }
    }
    else
    {
      int v18 = 0;
    }
    [v12 appendData:v18];
    [v12 appendBytes:&v36 length:1];
    uint64_t v20 = (char *)([v12 mutableBytes] + v9);
    if (self) {
      outgoingEncryptionContext = self->_outgoingEncryptionContext;
    }
    else {
      outgoingEncryptionContext = 0;
    }
    v22 = &v20[v14];
    CCCryptorStatus v23 = CCCryptorReset(outgoingEncryptionContext, v20);
    if (v23)
    {
      CCCryptorStatus v31 = v23;
      v32 = ne_log_obj();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v31;
        _os_log_fault_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_FAULT, "CCCryptorReset failed: %d)", buf, 8u);
      }
    }
    size_t dataOutMoved = 0;
    if (self) {
      v24 = self->_outgoingEncryptionContext;
    }
    else {
      v24 = 0;
    }
    id v6 = v16;
    CCCryptorStatus v25 = CCCryptorUpdate(v24, v22, v11, v22, v11, &dataOutMoved);
    id v7 = v33;
    if (v25 || dataOutMoved != v11)
    {
      v28 = ne_log_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v38 = v25;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        __int16 v39 = 2048;
        size_t v40 = dataOutMoved;
        _os_log_fault_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_FAULT, "CCCryptorUpdate failed: status %d, original %u, decrypted %zu)", buf, 0x18u);
      }
    }
    else
    {
      if (self)
      {
        outgoingHMACBaseContext = self->_outgoingHMACBaseContext;
        v27 = self;
      }
      else
      {
        v27 = 0;
        outgoingHMACBaseContext = 0;
      }
      v28 = -[NEIKEv2SecurityContextCBCPlusHMAC computeOutgoingHMACUsingContext:payloadData:]((uint64_t)v27, (uint64_t)outgoingHMACBaseContext, v12);
      if (v28)
      {
        [v12 appendData:v28];
        id v19 = v12;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    id v19 = 0;
    goto LABEL_24;
  }
  v30 = ne_log_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)v38 = "-[NEIKEv2SecurityContextCBCPlusHMAC constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
    _os_log_fault_impl(&dword_19DDAF000, v30, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", buf, 0xCu);
  }

  id v19 = 0;
LABEL_26:

  return v19;
}

- (uint64_t)fixedOverheadLength
{
  if (result)
  {
    v1 = *(void **)(result + 40);
    id v2 = *(id *)(result + 16);
    uint64_t v3 = +[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadForEncryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, v2, v1);

    return v3;
  }
  return result;
}

- (__CFData)computeOutgoingHMACUsingContext:(void *)a3 payloadData:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    CFIndex v6 = CCHmacOutputSizeFromRef();
    unsigned int v7 = -[NEIKEv2IntegrityProtocol digestLength](*(void *)(a1 + 40));
    unsigned int v8 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E4F1CA58], v6);
    if (v8)
    {
      unsigned int v9 = (CCHmacContext *)CCHmacClone();
      if (a2)
      {
        unsigned __int8 v10 = v9;
        CCHmacUpdate(v9, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
        CCHmacFinal(v10, (void *)[(__CFData *)v8 mutableBytes]);
        [(__CFData *)v8 setLength:v7];
        CCHmacDestroy();
        size_t v11 = v8;
LABEL_9:

        goto LABEL_10;
      }
      unsigned int v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v15) = 0;
        _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "CCHmacClone failed", (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      unsigned int v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v15 = 134217984;
        CFIndex v16 = v6;
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&v15, 0xCu);
      }
    }
    size_t v11 = 0;
    goto LABEL_9;
  }
  size_t v11 = 0;
LABEL_10:

  return v11;
}

+ (uint64_t)fixedOverheadForEncryptionProtocol:(void *)a3 integrityProtocol:
{
  id v4 = a3;
  id v5 = a2;
  self;
  int v6 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)v5);

  LODWORD(v5) = -[NEIKEv2IntegrityProtocol digestLength]((uint64_t)v4);
  return (v5 + v6);
}

+ (uint64_t)paddingLengthForPlaintextLength:(void *)a3 encryptionProtocol:
{
  id v4 = a3;
  self;
  unsigned int v5 = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)v4);

  int v6 = ((unint64_t)a2 + 1) % v5;
  if (v6) {
    return v5 - v6;
  }
  else {
    return 0;
  }
}

- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3
{
  unsigned int v5 = -[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadLength]((uint64_t)self);
  BOOL v6 = a3 >= v5;
  unsigned int v7 = a3 - v5;
  if (v7 == 0 || !v6) {
    return 0;
  }
  if (self) {
    encryptionProtocol = self->_encryptionProtocol;
  }
  else {
    encryptionProtocol = 0;
  }
  unsigned int v9 = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)encryptionProtocol);
  if (v7 - 1 >= v7 % v9) {
    return v7 - 1 - v7 % v9;
  }
  else {
    return 0;
  }
}

- (unsigned)overheadForPlaintextLength:(unsigned int)a3
{
  if (self)
  {
    unsigned int v5 = self->_encryptionProtocol;
    integrityProtocol = self->_integrityProtocol;
  }
  else
  {
    unsigned int v5 = 0;
    integrityProtocol = 0;
  }
  unsigned int v7 = +[NEIKEv2SecurityContextCBCPlusHMAC overheadForPlaintextLength:encryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, a3, v5, integrityProtocol);

  return v7;
}

+ (uint64_t)overheadForPlaintextLength:(void *)a3 encryptionProtocol:(void *)a4 integrityProtocol:
{
  id v6 = a4;
  id v7 = a3;
  self;
  int v8 = +[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadForEncryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, v7, v6);

  int v9 = +[NEIKEv2SecurityContextCBCPlusHMAC paddingLengthForPlaintextLength:encryptionProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, a2, v7);
  return (v8 + v9 + 1);
}

- (void)dealloc
{
  if (self)
  {
    outgoingEncryptionContext = self->_outgoingEncryptionContext;
    if (outgoingEncryptionContext)
    {
      CCCryptorRelease(outgoingEncryptionContext);
      self->_outgoingEncryptionContext = 0;
    }
    incomingEncryptionContext = self->_incomingEncryptionContext;
    if (incomingEncryptionContext)
    {
      CCCryptorRelease(incomingEncryptionContext);
      self->_incomingEncryptionContext = 0;
    }
    if (self->_outgoingHMACBaseContext)
    {
      CCHmacDestroy();
      self->_outgoingHMACBaseContext = 0;
    }
    if (self->_incomingHMACBaseContext)
    {
      CCHmacDestroy();
      self->_incomingHMACBaseContext = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NEIKEv2SecurityContextCBCPlusHMAC;
  [(NEIKEv2SecurityContextCBCPlusHMAC *)&v5 dealloc];
}

@end