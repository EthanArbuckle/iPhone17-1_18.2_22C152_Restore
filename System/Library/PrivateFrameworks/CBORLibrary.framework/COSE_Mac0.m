@interface COSE_Mac0
- (COSE_Mac0)initWithCBOR:(id)a3;
- (COSE_Mac0)initWithProtectedHeaders:(id)a3 unprotectedHeaders:(id)a4 payload:(id)a5 tag:(id)a6;
- (NSData)mac;
- (id)description;
- (id)generateMessageForMACWithApplicationProtectedAttributes:(id)a3;
@end

@implementation COSE_Mac0

- (COSE_Mac0)initWithCBOR:(id)a3
{
  id v4 = a3;
  if ([v4 type] != 4) {
    goto LABEL_11;
  }
  v5 = [v4 array];
  unint64_t v6 = [v5 count];

  if (v6 < 4) {
    goto LABEL_11;
  }
  uint64_t v7 = [v4 tag];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = [v4 tag];
  v10 = [v9 numeric];
  uint64_t v11 = [v10 integerValue];

  if (v11 == 17)
  {
LABEL_5:
    v12 = [v4 array];
    v13 = [v12 objectAtIndexedSubscript:2];

    if ([v13 type] == 2 || objc_msgSend(v13, "type") == 11)
    {
      v14 = [v4 array];
      v15 = [v14 objectAtIndexedSubscript:3];

      if ([v15 type] == 2)
      {
        v22.receiver = self;
        v22.super_class = (Class)COSE_Mac0;
        v16 = [(COSE *)&v22 initWithCBOR:v4];
        v17 = v16;
        if (v16)
        {
          -[COSE setType:]((uint64_t)v16, 17);
          uint64_t v18 = [v15 data];
          mac = v17->_mac;
          v17->_mac = (NSData *)v18;
        }
        self = v17;
        v20 = self;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
LABEL_11:
    v20 = 0;
  }

  return v20;
}

- (COSE_Mac0)initWithProtectedHeaders:(id)a3 unprotectedHeaders:(id)a4 payload:(id)a5 tag:(id)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[CBOR cborWithData:a6];
  v17[0] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  v15 = (COSE_Mac0 *)-[COSE initWithProtectedHeaders:unprotectedHeaders:payload:type:additionalCBORs:](self, v12, v11, v10, 17, v14);

  return v15;
}

- (id)generateMessageForMACWithApplicationProtectedAttributes:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v6 = +[CBOR cborWithUTF8String:@"MAC0"];
  [v5 addObject:v6];

  uint64_t v7 = objc_opt_new();
  id v8 = [(COSE *)self protectedHeaderParameters];
  if (!v8) {
    id v8 = v7;
  }
  v9 = +[CBOR cborWithData:v8];
  [v5 addObject:v9];

  if (v4)
  {
    id v10 = +[CBOR cborWithData:v4];
    [v5 addObject:v10];
  }
  else
  {
    [v5 addObject:v7];
  }
  id v11 = [(COSE *)self content];
  id v12 = +[CBOR cborWithData:v11];
  [v5 addObject:v12];

  v13 = +[CBOR cborWithArray:v5];
  v14 = [MEMORY[0x263EFF8F8] dataWithCBOR:v13];

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(COSE *)self protectedHeadererDictionary];
  id v5 = [(COSE_Mac0 *)self mac];
  unint64_t v6 = (void *)[v3 initWithFormat:@"ProtectedHeaders: %@, mac: %@", v4, v5];

  return v6;
}

- (NSData)mac
{
  return self->_mac;
}

- (void).cxx_destruct
{
}

@end