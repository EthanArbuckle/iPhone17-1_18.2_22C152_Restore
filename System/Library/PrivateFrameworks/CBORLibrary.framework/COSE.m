@interface COSE
- (CBOR)tag;
- (COSE)initWithCBOR:(id)a3;
- (COSE)initWithData:(id)a3;
- (COSE)initWithData:(id)a3 type:(int64_t)a4;
- (NSArray)criticalHeaderParameters;
- (NSData)content;
- (NSData)initializationVector;
- (NSData)keyIdentifier;
- (NSData)partialInitializationVector;
- (NSData)protectedHeaderParameters;
- (NSDictionary)protectedHeadererDictionary;
- (NSDictionary)unprotectedHeaderParameters;
- (NSString)contentType;
- (id)_searchForHeaderLabel:(id)a1;
- (id)initWithProtectedHeaders:(void *)a3 unprotectedHeaders:(void *)a4 payload:(uint64_t)a5 type:(void *)a6 additionalCBORs:;
- (id)sourceObject;
- (int64_t)algorithmIdentifier;
- (int64_t)type;
- (void)_parseCommonHeaderParameters:(void *)a1;
- (void)setType:(uint64_t)a1;
@end

@implementation COSE

- (COSE)initWithData:(id)a3
{
  v4 = +[CBOR decodeFromData:a3];
  v5 = [(COSE *)self initWithCBOR:v4];

  return v5;
}

- (COSE)initWithData:(id)a3 type:(int64_t)a4
{
  v6 = +[CBOR decodeFromData:a3];
  v7 = [v6 tag];

  if (v7)
  {
    v8 = [v6 tag];
    uint64_t v9 = [v8 numeric];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [v6 tag];
      v12 = [v11 numeric];
      uint64_t v13 = [v12 integerValue];

      if (v13 != a4)
      {
        v14 = 0;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v15 = [(COSE *)self initWithCBOR:v6];
  if (v15) {
    v15->_type = a4;
  }
  self = v15;
  v14 = self;
LABEL_9:

  return v14;
}

- (COSE)initWithCBOR:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)COSE;
  v6 = [(COSE *)&v28 init];
  if (!v6) {
    goto LABEL_23;
  }
  if ([v5 type] == 4)
  {
    v7 = [v5 array];
    unint64_t v8 = [v7 count];

    if (v8 >= 2)
    {
      objc_storeStrong((id *)&v6->_cborObj, a3);
      v10 = [(CBOR *)v6->_cborObj tag];

      if (!v10) {
        goto LABEL_8;
      }
      v11 = [(CBOR *)v6->_cborObj tag];
      v12 = [v11 numeric];
      v6->_int64_t type = [v12 integerValue];

      int64_t type = v6->_type;
      if ((unint64_t)(type - 96) < 3 || (unint64_t)(type - 16) <= 2)
      {
LABEL_8:
        v14 = v6->_cborObj;
        if ([(CBOR *)v14 type] != 4)
        {
LABEL_22:

LABEL_23:
          uint64_t v9 = v6;
          goto LABEL_24;
        }
        v15 = [(CBOR *)v14 array];
        if ((unint64_t)[v15 count] < 2)
        {
LABEL_21:

          goto LABEL_22;
        }
        v16 = [(CBOR *)v14 array];
        v17 = [v16 objectAtIndexedSubscript:0];

        if ([v17 type] == 2)
        {
          v18 = [v17 data];
          if (![v18 length])
          {
            v22 = 0;
LABEL_20:

            protectedHeadererDictionary = v6->_protectedHeadererDictionary;
            v6->_protectedHeadererDictionary = v22;

            -[COSE _parseCommonHeaderParameters:](v6, v6->_protectedHeadererDictionary);
            v24 = [v15 objectAtIndexedSubscript:1];
            v25 = [v24 dictionary];

            -[COSE _parseCommonHeaderParameters:](v6, v25);
            v26 = [v15 objectAtIndexedSubscript:2];
            [v26 type];

            goto LABEL_21;
          }
          v19 = +[CBOR decodeFromData:v18];
          uint64_t v20 = [v19 dictionary];

          v18 = (void *)v20;
        }
        else if ([v17 type] == 5)
        {
          v18 = [v17 dictionary];
        }
        else
        {
          v18 = 0;
        }
        v21 = (void *)MEMORY[0x263EFFA78];
        if (v18) {
          v21 = v18;
        }
        v22 = v21;
        goto LABEL_20;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_24:

  return v9;
}

- (id)initWithProtectedHeaders:(void *)a3 unprotectedHeaders:(void *)a4 payload:(uint64_t)a5 type:(void *)a6 additionalCBORs:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a6;
  if (a1)
  {
    v14 = (objc_class *)MEMORY[0x263EFF980];
    id v15 = a3;
    id v16 = objc_alloc_init(v14);
    if ([v11 count])
    {
      v17 = +[CBOR cborWithDictionary:v11];
      id v18 = [MEMORY[0x263EFF8F8] dataWithCBOR:v17];
    }
    else
    {
      id v18 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    }
    v19 = +[CBOR cborWithData:v18];
    [v16 addObject:v19];

    uint64_t v20 = +[CBOR cborWithDictionary:v15];

    [v16 addObject:v20];
    if (v12) {
      +[CBOR cborWithData:v12];
    }
    else {
    v21 = +[CBOR cborNil];
    }
    [v16 addObject:v21];

    if (v13) {
      [v16 addObjectsFromArray:v13];
    }
    v22 = +[CBOR cborWithArray:v16];
    if (a5 != -1)
    {
      v23 = +[CBOR cborWithInteger:a5];
      [v22 setTag:v23];
    }
    a1 = (id)[a1 initWithCBOR:v22];
  }
  return a1;
}

- (NSData)protectedHeaderParameters
{
  v2 = [(CBOR *)self->_cborObj array];
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v3 data];

  return (NSData *)v4;
}

- (NSDictionary)unprotectedHeaderParameters
{
  v2 = [(CBOR *)self->_cborObj array];
  v3 = [v2 objectAtIndexedSubscript:1];
  v4 = [v3 dictionary];

  return (NSDictionary *)v4;
}

- (NSData)content
{
  v2 = [(CBOR *)self->_cborObj array];
  v3 = [v2 objectAtIndexedSubscript:2];

  if ([v3 type] == 2)
  {
    v4 = [v3 data];
  }
  else
  {
    v4 = 0;
  }

  return (NSData *)v4;
}

- (CBOR)tag
{
  cborObj = self->_cborObj;
  if (cborObj)
  {
    cborObj = [cborObj tag];
  }
  return (CBOR *)cborObj;
}

- (void)_parseCommonHeaderParameters:(void *)a1
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v60;
    uint64_t v54 = *(void *)v60;
    id v51 = v3;
    v52 = a1;
    do
    {
      uint64_t v7 = 0;
      uint64_t v53 = v5;
      do
      {
        if (*(void *)v60 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v59 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, v51);
        unint64_t v10 = [v8 type];
        if (v10 < 2) {
          goto LABEL_9;
        }
        if (v10 != 3)
        {
          if (v10 != 13) {
            goto LABEL_61;
          }
LABEL_9:
          id v11 = [v8 numeric];
          goto LABEL_11;
        }
        id v11 = [v8 string];
LABEL_11:
        id v12 = v11;
        uint64_t v13 = [v11 integerValue];

        switch(v13)
        {
          case 1:
            if ([v9 type] == 3)
            {
              v14 = [v9 string];
            }
            else
            {
              if (![v9 isWholeNumber]) {
                goto LABEL_61;
              }
              v14 = [v9 numeric];
            }
            id v16 = v14;
            a1[4] = [v14 integerValue];
            goto LABEL_60;
          case 2:
            if ([v9 type] != 4) {
              goto LABEL_61;
            }
            id v16 = objc_opt_new();
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            v17 = [v9 array];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v55 objects:v63 count:16];
            if (!v18) {
              goto LABEL_29;
            }
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v56;
            break;
          case 3:
            if ([v9 type] == 3)
            {
              v29 = [v9 string];
              int v30 = [v29 isEqualToString:@"application/cose; cose-type=\"cose-sign\""];

              if (v30)
              {
                v31 = &unk_26C987C98;
              }
              else
              {
                v36 = [v9 string];
                int v37 = [v36 isEqualToString:@"application/cose; cose-type=\"cose-sign1\""];

                if (v37)
                {
                  v31 = &unk_26C987CB0;
                }
                else
                {
                  v38 = [v9 string];
                  int v39 = [v38 isEqualToString:@"application/cose; cose-type=\"cose-encrypt\""];

                  if (v39)
                  {
                    v31 = &unk_26C987CC8;
                  }
                  else
                  {
                    v40 = [v9 string];
                    int v41 = [v40 isEqualToString:@"application/cose; cose-type=\"cose-encrypt0\""];

                    if (v41)
                    {
                      v31 = &unk_26C987CE0;
                    }
                    else
                    {
                      v42 = [v9 string];
                      int v43 = [v42 isEqualToString:@"application/cose; cose-type=\"cose-mac\""];

                      if (v43)
                      {
                        v31 = &unk_26C987CF8;
                      }
                      else
                      {
                        v44 = [v9 string];
                        int v45 = [v44 isEqualToString:@"application/cose; cose-type=\"cose-mac0\""];

                        if (v45)
                        {
                          v31 = &unk_26C987D10;
                        }
                        else
                        {
                          v46 = [v9 string];
                          int v47 = [v46 isEqualToString:@"application/cose-key"];

                          if (v47)
                          {
                            v31 = &unk_26C987D28;
                          }
                          else
                          {
                            v48 = [v9 string];
                            int v49 = [v48 isEqualToString:@"application/cose-key-set"];

                            if (!v49) {
                              goto LABEL_61;
                            }
                            v31 = &unk_26C987D40;
                          }
                        }
                      }
                    }
                  }
                }
              }
              uint64_t v50 = [v31 stringValue];
              id v16 = (void *)a1[6];
              a1[6] = v50;
            }
            else
            {
              if (![v9 isWholeNumber]) {
                goto LABEL_61;
              }
              id v16 = [v9 numeric];
              uint64_t v34 = [v16 stringValue];
              v35 = (void *)a1[6];
              a1[6] = v34;
            }
            goto LABEL_60;
          case 4:
            if ([v9 type] != 2) {
              goto LABEL_61;
            }
            uint64_t v32 = [v9 data];
            id v16 = (void *)a1[7];
            a1[7] = v32;
            goto LABEL_60;
          case 5:
            if ([v9 type] != 2) {
              goto LABEL_61;
            }
            uint64_t v15 = [v9 data];
            id v16 = (void *)a1[8];
            a1[8] = v15;
            goto LABEL_60;
          case 6:
            if ([v9 type] != 2) {
              goto LABEL_61;
            }
            uint64_t v33 = [v9 data];
            id v16 = (void *)a1[9];
            a1[9] = v33;
            goto LABEL_60;
          default:
            goto LABEL_61;
        }
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v56 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            if ([v22 isWholeNumber])
            {
              v23 = [v22 numeric];
              [v16 addObject:v23];
            }
            else
            {
              v24 = [v22 string];

              if (!v24) {
                continue;
              }
              v25 = NSNumber;
              v23 = [v22 string];
              v26 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
              [v16 addObject:v26];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v19);
LABEL_29:

        if ([v16 count])
        {
          uint64_t v27 = [v16 copy];
          a1 = v52;
          objc_super v28 = (void *)v52[5];
          v52[5] = v27;
        }
        else
        {
          a1 = v52;
        }
        id v3 = v51;
        uint64_t v5 = v53;
LABEL_60:

        uint64_t v6 = v54;
LABEL_61:

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v5);
  }
}

- (id)_searchForHeaderLabel:(id)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    uint64_t v5 = (void *)*((void *)a1 + 3);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __30__COSE__searchForHeaderLabel___block_invoke;
    v15[3] = &unk_26431C140;
    id v6 = v3;
    id v16 = v6;
    v17 = &v25;
    uint64_t v18 = &v19;
    [v5 enumerateKeysAndObjectsUsingBlock:v15];
    if (*((unsigned char *)v26 + 24))
    {
      a1 = (id)v20[5];
    }
    else
    {
      uint64_t v7 = [*((id *)a1 + 1) array];
      unint64_t v8 = [v7 objectAtIndexedSubscript:1];
      uint64_t v9 = [v8 dictionary];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __30__COSE__searchForHeaderLabel___block_invoke_2;
      v11[3] = &unk_26431C140;
      id v12 = v6;
      uint64_t v13 = &v25;
      v14 = &v19;
      [v9 enumerateKeysAndObjectsUsingBlock:v11];

      a1 = (id)v20[5];
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
  }

  return a1;
}

void __30__COSE__searchForHeaderLabel___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  unint64_t v8 = [v11 type];
  if (v8 < 2)
  {
LABEL_4:
    uint64_t v9 = [v11 numeric];
    unint64_t v10 = [v9 stringValue];

    goto LABEL_6;
  }
  if (v8 != 3)
  {
    if (v8 != 13)
    {
      unint64_t v10 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  unint64_t v10 = [v11 string];
LABEL_6:
  if (![*(id *)(a1 + 32) compare:v10])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
LABEL_9:
}

void __30__COSE__searchForHeaderLabel___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  unint64_t v8 = [v11 type];
  if (v8 < 2)
  {
LABEL_4:
    uint64_t v9 = [v11 numeric];
    unint64_t v10 = [v9 stringValue];

    goto LABEL_6;
  }
  if (v8 != 3)
  {
    if (v8 != 13)
    {
      unint64_t v10 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  unint64_t v10 = [v11 string];
LABEL_6:
  if (![*(id *)(a1 + 32) compare:v10])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
LABEL_9:
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)protectedHeadererDictionary
{
  return self->_protectedHeadererDictionary;
}

- (int64_t)algorithmIdentifier
{
  return self->_algorithmIdentifier;
}

- (NSArray)criticalHeaderParameters
{
  return self->_criticalHeaderParameters;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (NSData)partialInitializationVector
{
  return self->_partialInitializationVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialInitializationVector, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_criticalHeaderParameters, 0);
  objc_storeStrong((id *)&self->_protectedHeadererDictionary, 0);
  objc_storeStrong((id *)&self->_cborObj, 0);
}

- (void)setType:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 8) tag];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 8) tag];
      [v5 numeric];
    }
    *(void *)(a1 + 16) = a2;
  }
}

- (id)sourceObject
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

@end