@interface COSE_Sign1
- (COSE_Sign1)initWithCBOR:(id)a3;
- (COSE_Sign1)initWithProtectedHeaders:(id)a3 unprotectedHeaders:(id)a4 payload:(id)a5 signature:(id)a6 includeCBORTag:(BOOL)a7;
- (NSArray)x509bag;
- (NSArray)x509chain;
- (NSData)signature;
- (NSData)x509hashValue;
- (NSString)x509hashAlgorithmIdentifier;
- (NSString)x509uri;
- (id)description;
@end

@implementation COSE_Sign1

- (COSE_Sign1)initWithProtectedHeaders:(id)a3 unprotectedHeaders:(id)a4 payload:(id)a5 signature:(id)a6 includeCBORTag:(BOOL)a7
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a7) {
    uint64_t v11 = 18;
  }
  else {
    uint64_t v11 = -1;
  }
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[CBOR cborWithData:a6];
  v19[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  v17 = (COSE_Sign1 *)-[COSE initWithProtectedHeaders:unprotectedHeaders:payload:type:additionalCBORs:](self, v14, v13, v12, v11, v16);

  return v17;
}

- (COSE_Sign1)initWithCBOR:(id)a3
{
  id v4 = a3;
  if ([v4 type] != 4) {
    goto LABEL_9;
  }
  v5 = [v4 array];
  unint64_t v6 = [v5 count];

  if (v6 < 4) {
    goto LABEL_9;
  }
  uint64_t v7 = [v4 tag];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = [v4 tag];
  v10 = [v9 numeric];
  uint64_t v11 = [v10 integerValue];

  if (v11 == 18)
  {
LABEL_5:
    id v12 = [v4 array];
    id v13 = [v12 objectAtIndexedSubscript:2];

    if ([v13 type] == 2 || objc_msgSend(v13, "type") == 11)
    {
      id v14 = [v4 array];
      v15 = [v14 objectAtIndexedSubscript:3];

      if ([v15 type] == 2)
      {
        v19.receiver = self;
        v19.super_class = (Class)COSE_Sign1;
        v16 = [(COSE *)&v19 initWithCBOR:v4];
        -[COSE setType:]((uint64_t)v16, 18);
        self = v16;
        v17 = self;
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
LABEL_9:
    v17 = 0;
  }

  return v17;
}

- (NSArray)x509bag
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Bag);
  v3 = v2;
  if (v2)
  {
    if ([v2 type] == 4)
    {
      id v4 = [MEMORY[0x263EFF980] array];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v5 = objc_msgSend(v3, "array", 0);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v5);
            }
            v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) data];
            if (v10) {
              [v4 addObject:v10];
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
        }
        while (v7);
      }

      uint64_t v11 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v4 copyItems:0];
      goto LABEL_15;
    }
    if ([v3 type] == 2)
    {
      id v4 = [v3 data];
      v18 = v4;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
LABEL_15:
      id v12 = (void *)v11;

      goto LABEL_17;
    }
  }
  id v12 = 0;
LABEL_17:

  return (NSArray *)v12;
}

- (NSArray)x509chain
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [&unk_26C987D58 stringValue];
  id v4 = -[COSE _searchForHeaderLabel:](self, v3);

  if (v4)
  {
    if ([v4 type] == 4)
    {
      v5 = objc_opt_new();
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v6 = objc_msgSend(v4, "array", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) data];
            if (v11) {
              [v5 addObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v8);
      }

      uint64_t v12 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v5 copyItems:0];
      goto LABEL_15;
    }
    if ([v4 type] == 2)
    {
      v5 = [v4 data];
      objc_super v19 = v5;
      uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
LABEL_15:
      id v13 = (void *)v12;

      goto LABEL_17;
    }
  }
  id v13 = 0;
LABEL_17:

  return (NSArray *)v13;
}

- (NSString)x509uri
{
  v3 = -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Uri);
  if ((v3
     || (-[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509UriSender),
         (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    && [v3 type] == 3)
  {
    id v4 = [v3 string];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)x509hashAlgorithmIdentifier
{
  v3 = -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Hash);
  if ((v3
     || (-[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509HashSender),
         (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    && [v3 type] == 4
    && ([v3 array],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5 == 2))
  {
    uint64_t v6 = [v3 array];
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];

    if ([v7 isWholeNumber])
    {
      uint64_t v8 = [v7 numeric];
      uint64_t v9 = [v8 stringValue];
    }
    else if ([v7 type] == 3)
    {
      uint64_t v9 = [v7 string];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (NSString *)v9;
}

- (NSData)x509hashValue
{
  v3 = -[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509Hash);
  if ((v3
     || (-[COSE _searchForHeaderLabel:](self, (void *)COSEHeaderX509HashSender),
         (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    && [v3 type] == 4
    && ([v3 array],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5 == 2))
  {
    uint64_t v6 = [v3 array];
    uint64_t v7 = [v6 objectAtIndexedSubscript:1];

    if ([v7 type] == 2)
    {
      uint64_t v8 = [v7 data];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSData *)v8;
}

- (NSData)signature
{
  v2 = -[COSE sourceObject]((id *)&self->super.super.isa);
  v3 = [v2 array];
  id v4 = [v3 objectAtIndex:3];

  if (v4 && [v4 type] == 2)
  {
    uint64_t v5 = [v4 data];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSData *)v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(COSE *)self protectedHeadererDictionary];
  uint64_t v5 = [(COSE *)self unprotectedHeaderParameters];
  uint64_t v6 = [(COSE_Sign1 *)self signature];
  uint64_t v7 = [(COSE *)self tag];
  uint64_t v8 = [v3 stringWithFormat:@"ProtectedHeaders: %@, UnprotectedHeaders: %@, signature: %@, tag: %@", v4, v5, v6, v7];

  return v8;
}

@end