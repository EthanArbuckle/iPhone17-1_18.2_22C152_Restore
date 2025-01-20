@interface COSEKey
- (COSEKey)initWithCBOR:(id)a3;
- (COSEKey)initWithData:(id)a3;
- (NSArray)operations;
- (NSData)baseInitializationVector;
- (NSData)ecCurveD;
- (NSData)ecCurveX;
- (NSData)ecCurveY;
- (NSData)identifier;
- (NSData)okpCurveD;
- (NSData)okpCurveX;
- (NSData)symmetricKey;
- (NSNumber)ecCurveIdentifier;
- (NSNumber)okpCurveIdentifier;
- (id)initEC2WithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 signBit:(BOOL)a6 d:(id)a7 keyOperations:(id)a8 keyIdentifier:(id)a9;
- (id)initEC2WithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 y:(id)a6 d:(id)a7 keyOperations:(id)a8 keyIdentifier:(id)a9;
- (id)initOKPWithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 d:(id)a6 keyOperations:(id)a7 keyIdentifier:(id)a8;
- (int64_t)algorithm;
- (int64_t)type;
- (uint64_t)_initCBORWithMemberParams;
@end

@implementation COSEKey

- (COSEKey)initWithData:(id)a3
{
  v4 = +[CBOR decodeFromData:a3];
  v5 = [(COSEKey *)self initWithCBOR:v4];

  return v5;
}

- (COSEKey)initWithCBOR:(id)a3
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v98.receiver = self;
  v98.super_class = (Class)COSEKey;
  v6 = [(COSEKey *)&v98 init];
  if (!v6) {
    goto LABEL_105;
  }
  if ([v5 type] == 5)
  {
    objc_storeStrong((id *)&v6->_cborObj, a3);
    v7 = [v5 dictionary];
    v8 = +[CBOR cborWithInteger:1];
    v9 = [v7 objectForKey:v8];

    if (v9 && ([v9 type] == 3 || objc_msgSend(v9, "isWholeNumber")))
    {
      v10 = [v9 string];
      if ([v9 type] != 3)
      {
        uint64_t v11 = [v9 unsignedLongLongValue];
        v6->_type = v11;
        int v12 = 1;
        switch(v11)
        {
          case 1:
            goto LABEL_11;
          case 2:
            goto LABEL_22;
          case 3:
            break;
          case 4:
            goto LABEL_32;
          default:
            goto LABEL_48;
        }
LABEL_103:

        if (v12) {
          goto LABEL_104;
        }
LABEL_105:
        v86 = v6;
        goto LABEL_106;
      }
      if ([v10 isEqualToString:@"OKP"])
      {
        v6->_type = 1;
LABEL_11:
        v13 = v9;
        v14 = +[CBOR cborWithInteger:-1];
        v15 = [v7 objectForKey:v14];

        if (v15)
        {
          uint64_t v16 = [v15 numeric];
          curveID = v6->_curveID;
          v6->_curveID = (NSNumber *)v16;
        }
        v18 = v10;
        v19 = +[CBOR cborWithInteger:-2];
        v20 = [v7 objectForKey:v19];

        if (v20 && [v20 type] == 2)
        {
          uint64_t v21 = [v20 data];
          paramX = v6->_paramX;
          v6->_paramX = (NSData *)v21;
        }
        v23 = +[CBOR cborWithInteger:-4];
        v24 = [v7 objectForKey:v23];

        if (v24 && [v24 type] == 2)
        {
          uint64_t v25 = [v24 data];
          paramD = v6->_paramD;
          v6->_paramD = (NSData *)v25;
        }
        v9 = v13;
        v10 = v18;
        goto LABEL_48;
      }
      if (![v10 isEqualToString:@"EC2"])
      {
        if ([v10 isEqualToString:@"Symmetric"])
        {
          v6->_type = 4;
LABEL_32:
          v40 = +[CBOR cborWithInteger:-1];
          v41 = [v7 objectForKey:v40];

          if (v41 && [v41 type] == 2)
          {
            uint64_t v42 = [v41 data];
            symmetricKey = v6->_symmetricKey;
            v6->_symmetricKey = (NSData *)v42;
          }
        }
        else
        {
          if ([v10 isEqualToString:@"RSA"])
          {
            v6->_type = 3;
            int v12 = 1;
            goto LABEL_103;
          }
          v6->_type = 0;
        }
LABEL_48:
        v51 = +[CBOR cborWithInteger:2];
        v52 = [v7 objectForKey:v51];

        if (v52 && [v52 type] == 2)
        {
          uint64_t v53 = [v52 data];
          identifier = v6->_identifier;
          v6->_identifier = (NSData *)v53;
        }
        v55 = +[CBOR cborWithInteger:3];
        v56 = [v7 objectForKey:v55];

        v92 = v56;
        v93 = v52;
        if (v56 && ([v56 type] == 3 || objc_msgSend(v56, "isWholeNumber")))
        {
          if ([v56 type] == 3)
          {
            id v57 = [v56 string];
            if ([v57 isEqualToString:@"ES256"])
            {
              uint64_t v58 = -7;
            }
            else if ([v57 isEqualToString:@"ES384"])
            {
              uint64_t v58 = -35;
            }
            else if ([v57 isEqualToString:@"ES512"])
            {
              uint64_t v58 = -36;
            }
            else if ([v57 isEqualToString:@"A128GCM"])
            {
              uint64_t v58 = 1;
            }
            else if ([v57 isEqualToString:@"A192GCM"])
            {
              uint64_t v58 = 2;
            }
            else
            {
              if (![v57 isEqualToString:@"A256GCM"])
              {
                int v12 = 1;
LABEL_102:

                goto LABEL_103;
              }
              uint64_t v58 = 3;
            }
            v6->_algorithm = v58;
          }
          else
          {
            v6->_algorithm = 0;
          }
        }
        id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
        v59 = +[CBOR cborWithInteger:4];
        v60 = [v7 objectForKey:v59];

        if (v60 && [v60 type] == 4)
        {
          id v90 = v5;
          v88 = v9;
          v89 = v7;
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v61 = [v60 array];
          uint64_t v62 = [v61 countByEnumeratingWithState:&v94 objects:v99 count:16];
          if (!v62) {
            goto LABEL_95;
          }
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v95;
          while (1)
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v95 != v64) {
                objc_enumerationMutation(v61);
              }
              v66 = *(void **)(*((void *)&v94 + 1) + 8 * i);
              if ([v66 isWholeNumber])
              {
                v67 = [v60 numeric];
                v68 = v57;
                v69 = v67;
LABEL_91:
                [v68 addObject:v69];
                goto LABEL_92;
              }
              if ([v66 type] != 3) {
                continue;
              }
              v67 = [v66 string];
              char v70 = [v67 isEqualToString:@"sign"];
              v69 = &unk_26C987D70;
              if (v70) {
                goto LABEL_90;
              }
              char v71 = [v67 isEqualToString:@"verify"];
              v69 = &unk_26C987D88;
              if (v71) {
                goto LABEL_90;
              }
              char v72 = [v67 isEqualToString:@"encrypt"];
              v69 = &unk_26C987DA0;
              if (v72) {
                goto LABEL_90;
              }
              char v73 = [v67 isEqualToString:@"decrypt"];
              v69 = &unk_26C987DB8;
              if (v73) {
                goto LABEL_90;
              }
              char v74 = [v67 isEqualToString:@"wrapKey"];
              v69 = &unk_26C987DD0;
              if (v74) {
                goto LABEL_90;
              }
              char v75 = [v67 isEqualToString:@"unwrapKey"];
              v69 = &unk_26C987DE8;
              if (v75) {
                goto LABEL_90;
              }
              char v76 = [v67 isEqualToString:@"deriveKey"];
              v69 = &unk_26C987E00;
              if ((v76 & 1) != 0
                || (char v77 = [v67 isEqualToString:@"deriveBits"],
                    v69 = &unk_26C987E18,
                    (v77 & 1) != 0)
                || (char v78 = [v67 isEqualToString:@"MACCreate"], v69 = &unk_26C987E30,
                                                                                     (v78 & 1) != 0)
                || (int v79 = [v67 isEqualToString:@"MACVerify"], v69 = &unk_26C987E48, v79))
              {
LABEL_90:
                v68 = v57;
                goto LABEL_91;
              }
LABEL_92:
            }
            uint64_t v63 = [v61 countByEnumeratingWithState:&v94 objects:v99 count:16];
            if (!v63)
            {
LABEL_95:

              id v5 = v90;
              v9 = v88;
              v7 = v89;
              break;
            }
          }
        }
        if ([v57 count])
        {
          uint64_t v80 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v57 copyItems:0];
          operations = v6->_operations;
          v6->_operations = (NSArray *)v80;
        }
        v82 = +[CBOR cborWithInteger:5];
        v83 = [v7 objectForKey:v82];

        if (v83 && [v83 type] == 2)
        {
          uint64_t v84 = [v83 data];
          baseInitializationVector = v6->_baseInitializationVector;
          v6->_baseInitializationVector = (NSData *)v84;
        }
        int v12 = 0;
        goto LABEL_102;
      }
      v6->_type = 2;
LABEL_22:
      v91 = v10;
      v27 = +[CBOR cborWithInteger:-1];
      v28 = [v7 objectForKey:v27];

      if (v28)
      {
        uint64_t v29 = [v28 numeric];
        v30 = v6->_curveID;
        v6->_curveID = (NSNumber *)v29;
      }
      v31 = v9;
      v32 = +[CBOR cborWithInteger:-2];
      v33 = [v7 objectForKey:v32];

      if (v33 && [v33 type] == 2)
      {
        uint64_t v34 = [v33 data];
        v35 = v6->_paramX;
        v6->_paramX = (NSData *)v34;
      }
      v36 = +[CBOR cborWithInteger:-3];
      v37 = v7;
      v38 = [v7 objectForKey:v36];

      if (v38)
      {
        if ([v38 type] == 2)
        {
          uint64_t v39 = [v38 data];
        }
        else
        {
          if ([v38 type] == 10)
          {
            id v44 = objc_alloc(MEMORY[0x263EFF8F8]);
            v45 = &COMPRESSED_EC2_Y_ONE;
          }
          else
          {
            if ([v38 type] != 9) {
              goto LABEL_44;
            }
            id v44 = objc_alloc(MEMORY[0x263EFF8F8]);
            v45 = &COMPRESSED_EC2_Y_ZERO;
          }
          uint64_t v39 = [v44 initWithBytes:v45 length:1];
        }
        paramY = v6->_paramY;
        v6->_paramY = (NSData *)v39;
      }
LABEL_44:
      v47 = +[CBOR cborWithInteger:-4];
      v48 = [v37 objectForKey:v47];

      if (v48 && [v48 type] == 2)
      {
        uint64_t v49 = [v48 data];
        v50 = v6->_paramD;
        v6->_paramD = (NSData *)v49;
      }
      v7 = v37;
      v9 = v31;
      v10 = v91;
      goto LABEL_48;
    }
  }
LABEL_104:
  v86 = 0;
LABEL_106:

  return v86;
}

- (uint64_t)_initCBORWithMemberParams
{
  v44[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
  v3 = +[CBOR cborWithInteger:1];
  v43 = v3;
  v4 = +[CBOR cborWithInteger:*(void *)(a1 + 48)];
  v44[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v44 forKeys:&v43 count:1];
  v6 = (void *)[v2 initWithDictionary:v5];

  if (*(void *)(a1 + 64))
  {
    v7 = +[CBOR cborWithData:](CBOR, "cborWithData:");
    v8 = +[CBOR cborWithInteger:2];
    [v6 setObject:v7 forKeyedSubscript:v8];
  }
  if (*(void *)(a1 + 56))
  {
    v9 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:");
    v10 = +[CBOR cborWithInteger:3];
    [v6 setObject:v9 forKeyedSubscript:v10];
  }
  uint64_t v11 = 0;
  switch(*(void *)(a1 + 48))
  {
    case 0:
    case 3:
      goto LABEL_30;
    case 1:
      int v12 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", [*(id *)(a1 + 16) integerValue]);
      v13 = +[CBOR cborWithInteger:-1];
      [v6 setObject:v12 forKeyedSubscript:v13];

      if (![*(id *)(a1 + 24) length]) {
        goto LABEL_13;
      }
      v14 = +[CBOR cborWithData:*(void *)(a1 + 24)];
      uint64_t v15 = -2;
      goto LABEL_12;
    case 2:
      uint64_t v16 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", [*(id *)(a1 + 16) integerValue]);
      v17 = +[CBOR cborWithInteger:-1];
      [v6 setObject:v16 forKeyedSubscript:v17];

      if ([*(id *)(a1 + 24) length])
      {
        v18 = +[CBOR cborWithData:*(void *)(a1 + 24)];
        v19 = +[CBOR cborWithInteger:-2];
        [v6 setObject:v18 forKeyedSubscript:v19];
      }
      if ([*(id *)(a1 + 32) length])
      {
        v14 = +[CBOR cborWithData:*(void *)(a1 + 32)];
        uint64_t v15 = -3;
LABEL_12:
        v20 = +[CBOR cborWithInteger:v15];
        [v6 setObject:v14 forKeyedSubscript:v20];
      }
LABEL_13:
      if (![*(id *)(a1 + 40) length]) {
        goto LABEL_18;
      }
      uint64_t v21 = +[CBOR cborWithData:*(void *)(a1 + 40)];
      uint64_t v22 = -4;
      break;
    case 4:
      if (![*(id *)(a1 + 88) length]) {
        goto LABEL_18;
      }
      uint64_t v21 = +[CBOR cborWithData:*(void *)(a1 + 88)];
      uint64_t v22 = -1;
      break;
    default:
      goto LABEL_18;
  }
  v23 = +[CBOR cborWithInteger:v22];
  [v6 setObject:v21 forKeyedSubscript:v23];

LABEL_18:
  if ([*(id *)(a1 + 72) count])
  {
    v24 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v25 = *(id *)(a1 + 72);
    uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "integerValue", (void)v38));
          [v24 addObject:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v27);
    }

    v31 = +[CBOR cborWithArray:v24];
    v32 = +[CBOR cborWithInteger:4];
    [v6 setObject:v31 forKeyedSubscript:v32];
  }
  if (objc_msgSend(*(id *)(a1 + 80), "length", (void)v38))
  {
    v33 = +[CBOR cborWithData:*(void *)(a1 + 80)];
    uint64_t v34 = +[CBOR cborWithInteger:5];
    [v6 setObject:v33 forKeyedSubscript:v34];
  }
  uint64_t v35 = +[CBOR cborWithDictionary:v6];
  v36 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v35;

  uint64_t v11 = 1;
LABEL_30:

  return v11;
}

- (id)initEC2WithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 signBit:(BOOL)a6 d:(id)a7 keyOperations:(id)a8 keyIdentifier:(id)a9
{
  BOOL v27 = a6;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  id v28 = a9;
  v30.receiver = self;
  v30.super_class = (Class)COSEKey;
  v18 = [(COSEKey *)&v30 init];
  uint64_t v19 = (uint64_t)v18;
  if (!v18) {
    goto LABEL_6;
  }
  v18->_type = 2;
  v18->_algorithm = a3;
  uint64_t v20 = [NSNumber numberWithInteger:a4];
  uint64_t v21 = *(void **)(v19 + 16);
  *(void *)(v19 + 16) = v20;

  objc_storeStrong((id *)(v19 + 24), a5);
  char v22 = v27 ? 3 : 2;
  char v29 = v22;
  uint64_t v23 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v29 length:1];
  v24 = *(void **)(v19 + 32);
  *(void *)(v19 + 32) = v23;

  objc_storeStrong((id *)(v19 + 40), a7);
  objc_storeStrong((id *)(v19 + 72), a8);
  objc_storeStrong((id *)(v19 + 64), a9);
  if (!-[COSEKey _initCBORWithMemberParams](v19)) {
    id v25 = 0;
  }
  else {
LABEL_6:
  }
    id v25 = (id)v19;

  return v25;
}

- (id)initEC2WithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 y:(id)a6 d:(id)a7 keyOperations:(id)a8 keyIdentifier:(id)a9
{
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)COSEKey;
  v18 = [(COSEKey *)&v27 init];
  uint64_t v19 = (uint64_t)v18;
  if (!v18) {
    goto LABEL_3;
  }
  v18->_type = 2;
  v18->_algorithm = a3;
  uint64_t v20 = [NSNumber numberWithInteger:a4];
  uint64_t v21 = *(void **)(v19 + 16);
  *(void *)(v19 + 16) = v20;

  objc_storeStrong((id *)(v19 + 24), a5);
  objc_storeStrong((id *)(v19 + 32), a6);
  objc_storeStrong((id *)(v19 + 40), a7);
  objc_storeStrong((id *)(v19 + 72), a8);
  objc_storeStrong((id *)(v19 + 64), a9);
  if (!-[COSEKey _initCBORWithMemberParams](v19)) {
    id v22 = 0;
  }
  else {
LABEL_3:
  }
    id v22 = (id)v19;

  return v22;
}

- (id)initOKPWithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 d:(id)a6 keyOperations:(id)a7 keyIdentifier:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)COSEKey;
  v18 = [(COSEKey *)&v24 init];
  uint64_t v19 = (uint64_t)v18;
  if (!v18) {
    goto LABEL_3;
  }
  v18->_type = 1;
  uint64_t v20 = [NSNumber numberWithInteger:a4];
  uint64_t v21 = *(void **)(v19 + 16);
  *(void *)(v19 + 16) = v20;

  objc_storeStrong((id *)(v19 + 24), a5);
  objc_storeStrong((id *)(v19 + 40), a6);
  objc_storeStrong((id *)(v19 + 72), a7);
  objc_storeStrong((id *)(v19 + 64), a8);
  if (!-[COSEKey _initCBORWithMemberParams](v19)) {
    id v22 = 0;
  }
  else {
LABEL_3:
  }
    id v22 = (id)v19;

  return v22;
}

- (NSNumber)ecCurveIdentifier
{
  if (self->_type == 2) {
    id v2 = self->_curveID;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (NSData)ecCurveX
{
  if (self->_type == 2) {
    id v2 = self->_paramX;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (NSData)ecCurveY
{
  if (self->_type == 2) {
    id v2 = self->_paramY;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (NSData)ecCurveD
{
  if (self->_type == 2) {
    id v2 = self->_paramD;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (NSNumber)okpCurveIdentifier
{
  if (self->_type == 1) {
    id v2 = self->_curveID;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (NSData)okpCurveX
{
  if (self->_type == 1) {
    id v2 = self->_paramX;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (NSData)okpCurveD
{
  if (self->_type == 1) {
    id v2 = self->_paramD;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSArray)operations
{
  return self->_operations;
}

- (NSData)baseInitializationVector
{
  return self->_baseInitializationVector;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_baseInitializationVector, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_paramD, 0);
  objc_storeStrong((id *)&self->_paramY, 0);
  objc_storeStrong((id *)&self->_paramX, 0);
  objc_storeStrong((id *)&self->_curveID, 0);
  objc_storeStrong((id *)&self->_cborObj, 0);
}

@end