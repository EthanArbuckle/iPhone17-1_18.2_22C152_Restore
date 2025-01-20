@interface ENSignature
- (BOOL)_encodeInfoWithProtobufCoder:(id)a3 error:(id *)a4;
- (BOOL)_readSignatureInfoPtr:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)encodeWithProtobufCoder:(id)a3 error:(id *)a4;
- (ENSignature)initWithBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (ENSignature)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSData)signatureData;
- (NSString)androidBundleID;
- (NSString)appleBundleID;
- (NSString)keyID;
- (NSString)keyVersion;
- (NSString)signatureAlgorithm;
- (id)description;
- (unsigned)batchCount;
- (unsigned)batchNumber;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAndroidBundleID:(id)a3;
- (void)setAppleBundleID:(id)a3;
- (void)setBatchCount:(unsigned int)a3;
- (void)setBatchNumber:(unsigned int)a3;
- (void)setKeyID:(id)a3;
- (void)setKeyVersion:(id)a3;
- (void)setSignatureAlgorithm:(id)a3;
- (void)setSignatureData:(id)a3;
@end

@implementation ENSignature

- (ENSignature)initWithBytes:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v44 = 0;
  v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__0;
  v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __42__ENSignature_initWithBytes_length_error___block_invoke;
  v43[3] = &unk_264244C68;
  v43[4] = &v44;
  v43[5] = a5;
  v8 = (void (**)(void))MEMORY[0x2166BC8A0](v43, a2);
  v9 = [(ENSignature *)self init];
  if (v9)
  {
    v10 = objc_alloc_init(ENProtobufCoder);
    uint64_t v11 = [(ENProtobufCoder *)v10 setReadMemory:a3 length:a4];
    do
    {
      v12 = (void *)MEMORY[0x2166BC6F0](v11);
      unsigned __int8 v42 = 0;
      v13 = v45;
      id obj = v45[5];
      uint64_t v41 = 0;
      BOOL v14 = [(ENProtobufCoder *)v10 readType:&v42 tag:&v41 eofOkay:1 error:&obj];
      objc_storeStrong(v13 + 5, obj);
      if (v14)
      {
        switch(v41)
        {
          case 1:
            uint64_t v39 = 0;
            v15 = v10;
            v16 = v45;
            id v38 = v45[5];
            uint64_t v17 = [(ENProtobufCoder *)v15 readLengthDelimited:&v39 error:&v38];
            objc_storeStrong(v16 + 5, v38);
            if (v17)
            {
              v18 = v45;
              id v37 = v45[5];
              BOOL v19 = [(ENSignature *)v9 _readSignatureInfoPtr:v17 length:v39 error:&v37];
              objc_storeStrong(v18 + 5, v37);
              if (v19) {
                goto LABEL_19;
              }
            }
            goto LABEL_7;
          case 2:
            LODWORD(v39) = 0;
            v23 = v45;
            id v36 = v45[5];
            BOOL v24 = [(ENProtobufCoder *)v10 readVarIntUInt32:&v39 error:&v36];
            objc_storeStrong(v23 + 5, v36);
            if (!v24) {
              goto LABEL_7;
            }
            v9->_batchNumber = v39;
            goto LABEL_19;
          case 3:
            LODWORD(v39) = 0;
            v25 = v45;
            id v35 = v45[5];
            BOOL v26 = [(ENProtobufCoder *)v10 readVarIntUInt32:&v39 error:&v35];
            objc_storeStrong(v25 + 5, v35);
            if (!v26) {
              goto LABEL_7;
            }
            v9->_batchCount = v39;
            goto LABEL_19;
          case 4:
            v27 = v45;
            id v34 = v45[5];
            uint64_t v28 = [(ENProtobufCoder *)v10 readNSDataAndReturnError:&v34];
            objc_storeStrong(v27 + 5, v34);
            if (!v28) {
              goto LABEL_7;
            }
            signatureData = v9->_signatureData;
            v9->_signatureData = (NSData *)v28;

            goto LABEL_19;
          default:
            v21 = v45;
            id v33 = v45[5];
            BOOL v22 = [(ENProtobufCoder *)v10 skipType:v42 error:&v33];
            objc_storeStrong(v21 + 5, v33);
            if (v22) {
LABEL_19:
            }
              int v20 = 0;
            else {
LABEL_7:
            }
              int v20 = 1;
            break;
        }
      }
      else if (v45[5])
      {
        int v20 = 1;
      }
      else
      {
        int v20 = 4;
      }
    }
    while (!v20);
    if (v20 == 4) {
      v30 = v9;
    }
    else {
      v30 = 0;
    }
  }
  else
  {
    uint64_t v32 = ENErrorF(1);
    v30 = 0;
    v10 = (ENProtobufCoder *)v45[5];
    v45[5] = (id)v32;
  }

  v8[2](v8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

id __42__ENSignature_initWithBytes_length_error___block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result)
  {
    if (*(void *)(a1 + 40))
    {
      id result = result;
      **(void **)(a1 + 40) = result;
    }
  }
  return result;
}

- (BOOL)_readSignatureInfoPtr:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  uint64_t v39 = 0;
  v40 = (id *)&v39;
  uint64_t v41 = 0x3032000000;
  unsigned __int8 v42 = __Block_byref_object_copy__0;
  v43 = __Block_byref_object_dispose__0;
  id v44 = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __50__ENSignature__readSignatureInfoPtr_length_error___block_invoke;
  v38[3] = &unk_264244C68;
  v38[4] = &v39;
  v38[5] = a5;
  v8 = (void (**)(void))MEMORY[0x2166BC8A0](v38, a2);
  v9 = objc_alloc_init(ENProtobufCoder);
  uint64_t v10 = [(ENProtobufCoder *)v9 setReadMemory:a3 length:a4];
  do
  {
    uint64_t v11 = (void *)MEMORY[0x2166BC6F0](v10);
    unsigned __int8 v37 = 0;
    v12 = v40;
    id obj = v40[5];
    uint64_t v36 = 0;
    BOOL v13 = [(ENProtobufCoder *)v9 readType:&v37 tag:&v36 eofOkay:1 error:&obj];
    objc_storeStrong(v12 + 5, obj);
    if (v13)
    {
      switch(v36)
      {
        case 1:
          BOOL v14 = v40;
          id v34 = v40[5];
          v15 = [(ENProtobufCoder *)v9 readNSStringAndReturnError:&v34];
          objc_storeStrong(v14 + 5, v34);
          if (!v15) {
            goto LABEL_23;
          }
          appleBundleID = self->_appleBundleID;
          self->_appleBundleID = v15;
          goto LABEL_19;
        case 2:
          int v20 = v40;
          id v33 = v40[5];
          v21 = [(ENProtobufCoder *)v9 readNSStringAndReturnError:&v33];
          objc_storeStrong(v20 + 5, v33);
          if (!v21) {
            goto LABEL_23;
          }
          appleBundleID = self->_androidBundleID;
          self->_androidBundleID = v21;
          goto LABEL_19;
        case 3:
          BOOL v22 = v40;
          id v32 = v40[5];
          v23 = [(ENProtobufCoder *)v9 readNSStringAndReturnError:&v32];
          objc_storeStrong(v22 + 5, v32);
          if (!v23) {
            goto LABEL_23;
          }
          appleBundleID = self->_keyVersion;
          self->_keyVersion = v23;
          goto LABEL_19;
        case 4:
          BOOL v24 = v40;
          id v31 = v40[5];
          v25 = [(ENProtobufCoder *)v9 readNSStringAndReturnError:&v31];
          objc_storeStrong(v24 + 5, v31);
          if (!v25) {
            goto LABEL_23;
          }
          appleBundleID = self->_keyID;
          self->_keyID = v25;
          goto LABEL_19;
        case 5:
          BOOL v26 = v40;
          id v30 = v40[5];
          v27 = [(ENProtobufCoder *)v9 readNSStringAndReturnError:&v30];
          objc_storeStrong(v26 + 5, v30);
          if (!v27) {
            goto LABEL_23;
          }
          appleBundleID = self->_signatureAlgorithm;
          self->_signatureAlgorithm = v27;
LABEL_19:

          goto LABEL_20;
        default:
          v18 = v40;
          id v29 = v40[5];
          BOOL v19 = [(ENProtobufCoder *)v9 skipType:v37 error:&v29];
          objc_storeStrong(v18 + 5, v29);
          if (v19) {
LABEL_20:
          }
            int v17 = 0;
          else {
LABEL_23:
          }
            int v17 = 1;
          break;
      }
    }
    else if (v40[5])
    {
      int v17 = 1;
    }
    else
    {
      int v17 = 2;
    }
  }
  while (!v17);

  v8[2](v8);
  _Block_object_dispose(&v39, 8);

  return v17 == 2;
}

id __50__ENSignature__readSignatureInfoPtr_length_error___block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result)
  {
    if (*(void *)(a1 + 40))
    {
      id result = result;
      **(void **)(a1 + 40) = result;
    }
  }
  return result;
}

- (BOOL)encodeWithProtobufCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc_init(ENProtobufCoder);
  id v8 = objc_alloc_init(MEMORY[0x263EFF990]);
  [(ENProtobufCoder *)v7 setWriteMutableData:v8];
  BOOL v11 = 0;
  if ([(ENSignature *)self _encodeInfoWithProtobufCoder:v7 error:a4])
  {
    uint64_t v9 = [v8 length];
    if (!v9
      || objc_msgSend(v6, "writeLengthDelimitedPtr:length:tag:error:", objc_msgSend(v8, "bytes"), v9, 1, a4))
    {
      if ([v6 writeVarIntUInt32:self->_batchNumber tag:2 error:a4])
      {
        if ([v6 writeVarIntUInt32:self->_batchCount tag:3 error:a4])
        {
          signatureData = self->_signatureData;
          if (!signatureData || [v6 writeNSData:signatureData tag:4 error:a4]) {
            BOOL v11 = 1;
          }
        }
      }
    }
  }

  return v11;
}

- (BOOL)_encodeInfoWithProtobufCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  appleBundleID = self->_appleBundleID;
  BOOL v13 = 0;
  if (!appleBundleID || [v6 writeNSString:appleBundleID tag:1 error:a4])
  {
    androidBundleID = self->_androidBundleID;
    if (!androidBundleID || [v7 writeNSString:androidBundleID tag:2 error:a4])
    {
      keyVersion = self->_keyVersion;
      if (!keyVersion || [v7 writeNSString:keyVersion tag:3 error:a4])
      {
        keyID = self->_keyID;
        if (!keyID || [v7 writeNSString:keyID tag:4 error:a4])
        {
          signatureAlgorithm = self->_signatureAlgorithm;
          if (!signatureAlgorithm
            || [v7 writeNSString:signatureAlgorithm tag:5 error:a4])
          {
            BOOL v13 = 1;
          }
        }
      }
    }
  }

  return v13;
}

- (ENSignature)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(ENSignature *)self init];
  if (!v7)
  {
    if (!a4) {
      goto LABEL_21;
    }
LABEL_20:
    ENErrorF(2);
    uint64_t v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (MEMORY[0x2166BCD00](v6) != MEMORY[0x263EF8708])
  {
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!CUXPCDecodeNSString() || !CUXPCDecodeNSString()) {
    goto LABEL_21;
  }
  int v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_batchCount = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_21;
  }
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 != 6)
  {
    if (v9 != 5) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  v7->_batchNumber = 0;
LABEL_11:
  if (!CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSString()
    || !CUXPCDecodeNSData())
  {
    goto LABEL_21;
  }
  uint64_t v10 = v7;
LABEL_16:

  return v10;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = [(NSString *)self->_appleBundleID UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "aBid", v5);
  }
  androidBundleID = self->_androidBundleID;
  id v7 = v4;
  int v8 = [(NSString *)androidBundleID UTF8String];
  if (v8) {
    xpc_dictionary_set_string(v7, "andBid", v8);
  }

  uint64_t batchCount = self->_batchCount;
  if (batchCount) {
    xpc_dictionary_set_uint64(v7, "btCnt", batchCount);
  }
  uint64_t batchNumber = self->_batchNumber;
  if (batchNumber) {
    xpc_dictionary_set_uint64(v7, "btNum", batchNumber);
  }
  keyID = self->_keyID;
  id v12 = v7;
  BOOL v13 = [(NSString *)keyID UTF8String];
  if (v13) {
    xpc_dictionary_set_string(v12, "keyID", v13);
  }

  keyVersion = self->_keyVersion;
  id v15 = v12;
  v16 = [(NSString *)keyVersion UTF8String];
  if (v16) {
    xpc_dictionary_set_string(v15, "keyV", v16);
  }

  signatureAlgorithm = self->_signatureAlgorithm;
  xpc_object_t xdict = v15;
  v18 = [(NSString *)signatureAlgorithm UTF8String];
  if (v18) {
    xpc_dictionary_set_string(xdict, "sigAlg", v18);
  }

  signatureData = self->_signatureData;
  if (signatureData)
  {
    int v20 = signatureData;
    id v21 = xdict;
    uint64_t v22 = [(NSData *)v20 bytes];
    if (v22) {
      v23 = (const char *)v22;
    }
    else {
      v23 = "";
    }
    size_t v24 = [(NSData *)v20 length];

    xpc_dictionary_set_data(v21, "sigD", v23, v24);
  }
}

- (id)description
{
  NSAppendPrintF_safe();
  id v3 = 0;
  id v4 = v3;
  if (self->_appleBundleID)
  {
    uint64_t v10 = v3;
    appleBundleID = self->_appleBundleID;
    NSAppendPrintF_safe();
    id v5 = v10;

    id v4 = v5;
  }
  if (self->_androidBundleID)
  {
    appleBundleID = self->_androidBundleID;
    NSAppendPrintF_safe();
    id v6 = v4;

    id v4 = v6;
  }
  [(NSData *)self->_signatureData length];
  NSAppendPrintF_safe();
  id v7 = v4;

  return v7;
}

- (NSString)appleBundleID
{
  return self->_appleBundleID;
}

- (void)setAppleBundleID:(id)a3
{
}

- (NSString)androidBundleID
{
  return self->_androidBundleID;
}

- (void)setAndroidBundleID:(id)a3
{
}

- (unsigned)batchNumber
{
  return self->_batchNumber;
}

- (void)setBatchNumber:(unsigned int)a3
{
  self->_uint64_t batchNumber = a3;
}

- (unsigned)batchCount
{
  return self->_batchCount;
}

- (void)setBatchCount:(unsigned int)a3
{
  self->_uint64_t batchCount = a3;
}

- (NSString)keyID
{
  return self->_keyID;
}

- (void)setKeyID:(id)a3
{
}

- (NSString)keyVersion
{
  return self->_keyVersion;
}

- (void)setKeyVersion:(id)a3
{
}

- (NSString)signatureAlgorithm
{
  return self->_signatureAlgorithm;
}

- (void)setSignatureAlgorithm:(id)a3
{
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_signatureAlgorithm, 0);
  objc_storeStrong((id *)&self->_keyVersion, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_androidBundleID, 0);

  objc_storeStrong((id *)&self->_appleBundleID, 0);
}

@end