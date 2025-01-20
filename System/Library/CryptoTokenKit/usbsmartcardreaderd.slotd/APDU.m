@interface APDU
+ (id)APDUWithCLA:(unsigned __int8)a3 INS:(unsigned __int8)a4 P1:(unsigned __int8)a5 P2:(unsigned __int8)a6 dataField:(id)a7 Le:(id)a8;
- (APDU)initWithData:(id)a3;
- (NSData)data;
- (NSData)dataField;
- (NSNumber)Lc;
- (NSNumber)Le;
- (char)APDUCase;
- (id)description;
- (unint64_t)maxPayload;
- (unsigned)C5;
- (unsigned)C6C7;
- (unsigned)CLA;
- (unsigned)INS;
- (unsigned)P1;
- (unsigned)P2;
@end

@implementation APDU

+ (id)APDUWithCLA:(unsigned __int8)a3 INS:(unsigned __int8)a4 P1:(unsigned __int8)a5 P2:(unsigned __int8)a6 dataField:(id)a7 Le:(id)a8
{
  id v13 = a7;
  id v14 = a8;
  if ((unint64_t)[v13 length] <= 0xFF
    && [v14 unsignedIntValue] < 0x101)
  {
    int v15 = 0;
    if (v13) {
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v17 = 4;
    uint64_t v18 = 3;
    goto LABEL_10;
  }
  int v15 = 1;
  if (!v13) {
    goto LABEL_9;
  }
LABEL_4:
  if (v15) {
    uint64_t v16 = 7;
  }
  else {
    uint64_t v16 = 5;
  }
  uint64_t v17 = (uint64_t)[v13 length] + v16;
  uint64_t v18 = 2;
LABEL_10:
  if (!v15) {
    uint64_t v18 = 1;
  }
  if (!v14) {
    uint64_t v18 = 0;
  }
  id v19 = +[NSMutableData dataWithLength:v18 + v17];
  *(unsigned char *)[v19 mutableBytes] = a3;
  id v20 = v19;
  *((unsigned char *)[v20 mutableBytes] + 1) = a4;
  id v21 = v20;
  *((unsigned char *)[v21 mutableBytes] + 2) = a5;
  id v22 = v21;
  *((unsigned char *)[v22 mutableBytes] + 3) = a6;
  if (v13)
  {
    if ((unint64_t)[v13 length] >> 16 || !objc_msgSend(v13, "length"))
    {
      +[NSException raise:NSInvalidArgumentException format:@"dataField length should be between 1 and 65535"];
      if (v15) {
        goto LABEL_18;
      }
    }
    else if (v15)
    {
LABEL_18:
      id v23 = v22;
      *((unsigned char *)[v23 mutableBytes] + 4) = 0;
      unsigned __int16 v24 = (unsigned __int16)[v13 length];
      *(_WORD *)((char *)[v23 mutableBytes] + 5) = v24;
      uint64_t v25 = 7;
      goto LABEL_21;
    }
    unsigned __int8 v26 = [v13 length];
    *((unsigned char *)[v22 mutableBytes] + 4) = v26;
    uint64_t v25 = 5;
LABEL_21:
    v27 = (char *)[v22 mutableBytes] + v25;
    id v28 = v13;
    memcpy(v27, [v28 bytes], (size_t)objc_msgSend(v28, "length"));
    uint64_t v29 = (uint64_t)[v28 length] + v25;
    if (!v14) {
      goto LABEL_36;
    }
    goto LABEL_24;
  }
  uint64_t v29 = 4;
  if (!v14) {
    goto LABEL_36;
  }
LABEL_24:
  if ([v14 unsignedIntValue] > 0x10000) {
    +[NSException raise:NSInvalidArgumentException format:@"le should be between 0 and 65536"];
  }
  if (v15)
  {
    if (!v13) {
      *((unsigned char *)[v22 mutableBytes] + v29++) = 0;
    }
    if ([v14 unsignedIntValue] >> 16)
    {
      *(_WORD *)((char *)[v22 mutableBytes] + v29) = 0;
    }
    else
    {
      unsigned __int16 v30 = (unsigned __int16)[v14 unsignedShortValue];
      *(_WORD *)((char *)[v22 mutableBytes] + v29) = v30;
    }
  }
  else
  {
    if ([v14 unsignedShortValue] > 0xFF) {
      unsigned __int8 v31 = 0;
    }
    else {
      unsigned __int8 v31 = [v14 unsignedCharValue];
    }
    *((unsigned char *)[v22 mutableBytes] + v29) = v31;
  }
LABEL_36:
  v32 = [[APDU alloc] initWithData:v22];

  return v32;
}

- (APDU)initWithData:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)APDU;
  v6 = [(APDU *)&v23 init];
  uint64_t v7 = (uint64_t)v6;
  if (!v6) {
    goto LABEL_39;
  }
  objc_storeStrong((id *)&v6->_data, a3);
  *(void *)(v7 + 24) = 2;
  if ([v5 length] == (id)4)
  {
    *(unsigned char *)(v7 + 16) = 0;
    goto LABEL_39;
  }
  if ([v5 length] == (id)5)
  {
    *(unsigned char *)(v7 + 16) = 1;
    if ([(id)v7 C5]) {
      uint64_t v8 = [(id)v7 C5] + 2;
    }
    else {
      uint64_t v8 = 258;
    }
    *(void *)(v7 + 24) = v8;
LABEL_39:
    id v21 = sub_10000AB84();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100018164(v7, v21);
    }

    uint64_t v17 = (APDU *)(id)v7;
    goto LABEL_42;
  }
  if ([(id)v7 C5])
  {
    id v9 = [v5 length];
    if (v9 == (id)([(id)v7 C5] + 5))
    {
      char v10 = 3;
LABEL_10:
      *(unsigned char *)(v7 + 16) = v10;
      *(void *)(v7 + 24) = 0;
      goto LABEL_39;
    }
  }
  if ([(id)v7 C5])
  {
    id v11 = [v5 length];
    if (v11 == (id)([(id)v7 C5] + 6))
    {
      *(unsigned char *)(v7 + 16) = 5;
      v12 = [(id)v7 Le];
      if ([v12 unsignedCharValue])
      {
        id v13 = [(id)v7 Le];
        unsigned int v14 = [v13 unsignedCharValue];
LABEL_15:
        uint64_t v15 = v14 + 2;
LABEL_20:
        *(void *)(v7 + 24) = v15;

LABEL_38:
        goto LABEL_39;
      }
      uint64_t v20 = 258;
LABEL_37:
      *(void *)(v7 + 24) = v20;
      goto LABEL_38;
    }
  }
  if (![(id)v7 C5] && objc_msgSend(v5, "length") == (id)7)
  {
    *(unsigned char *)(v7 + 16) = 2;
    v12 = [(id)v7 Le];
    if ([v12 unsignedShortValue])
    {
      id v13 = [(id)v7 Le];
      uint64_t v15 = [v13 unsignedShortValue];
      goto LABEL_20;
    }
LABEL_36:
    uint64_t v20 = 65538;
    goto LABEL_37;
  }
  if (![(id)v7 C5])
  {
    if ([(id)v7 C6C7])
    {
      id v18 = [v5 length];
      if (v18 == (id)([(id)v7 C6C7] + 7))
      {
        char v10 = 4;
        goto LABEL_10;
      }
    }
  }
  if (![(id)v7 C5])
  {
    if ([(id)v7 C6C7])
    {
      id v19 = [v5 length];
      if (v19 == (id)([(id)v7 C6C7] + 9))
      {
        *(unsigned char *)(v7 + 16) = 6;
        v12 = [(id)v7 Le];
        if ([v12 unsignedShortValue])
        {
          id v13 = [(id)v7 Le];
          unsigned int v14 = [v13 unsignedShortValue];
          goto LABEL_15;
        }
        goto LABEL_36;
      }
    }
  }
  uint64_t v16 = sub_10000AB84();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000181DC((uint64_t *)(v7 + 8), v16);
  }

  uint64_t v17 = 0;
LABEL_42:

  return v17;
}

- (id)description
{
  unsigned int v3 = [(APDU *)self APDUCase];
  if (v3 > 6) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = (uint64_t)*(&off_1000247C0 + (int)v3);
  }
  unint64_t v4 = [(APDU *)self maxPayload];
  unsigned int v5 = [(APDU *)self CLA];
  unsigned int v6 = [(APDU *)self INS];
  unsigned int v7 = [(APDU *)self P1];
  unsigned int v8 = [(APDU *)self P2];
  id v9 = [(APDU *)self Lc];
  char v10 = [(APDU *)self dataField];
  id v11 = [v10 length];
  v12 = [(APDU *)self Le];
  id v13 = +[NSString stringWithFormat:@"case: %@ maxPayload: %lu\nCLA: 0x%.2x  INS: 0x%.2x  P1: 0x%.2x P2: 0x%.2x Lc: %@ dataLen: %lu le: %@", v15, v4, v5, v6, v7, v8, v9, v11, v12];

  return v13;
}

- (char)APDUCase
{
  return self->_case;
}

- (unint64_t)maxPayload
{
  return self->_maxPayload;
}

- (unsigned)C5
{
  unsigned __int8 v3 = 0;
  -[NSData getBytes:range:](self->_data, "getBytes:range:", &v3, 4, 1);
  return v3;
}

- (unsigned)C6C7
{
  __int16 v3 = *((unsigned __int8 *)[(NSData *)self->_data bytes] + 5);
  return *((unsigned __int8 *)[(NSData *)self->_data bytes] + 6) | (unsigned __int16)(v3 << 8);
}

- (unsigned)CLA
{
  id v2 = [(APDU *)self data];
  unsigned __int8 v3 = *(unsigned char *)[v2 bytes];

  return v3;
}

- (unsigned)INS
{
  id v2 = [(APDU *)self data];
  unsigned __int8 v3 = *((unsigned char *)[v2 bytes] + 1);

  return v3;
}

- (unsigned)P1
{
  id v2 = [(APDU *)self data];
  unsigned __int8 v3 = *((unsigned char *)[v2 bytes] + 2);

  return v3;
}

- (unsigned)P2
{
  id v2 = [(APDU *)self data];
  unsigned __int8 v3 = *((unsigned char *)[v2 bytes] + 3);

  return v3;
}

- (NSData)dataField
{
  if ([(APDU *)self APDUCase] == 4 || [(APDU *)self APDUCase] == 6)
  {
    uint64_t v3 = 7;
LABEL_7:
    data = self->_data;
    unsigned int v5 = [(APDU *)self Lc];
    unsigned int v6 = -[NSData subdataWithRange:](data, "subdataWithRange:", v3, [v5 unsignedIntValue]);

    goto LABEL_8;
  }
  if ([(APDU *)self APDUCase] == 3 || [(APDU *)self APDUCase] == 5)
  {
    uint64_t v3 = 5;
    goto LABEL_7;
  }
  unsigned int v6 = 0;
LABEL_8:

  return (NSData *)v6;
}

- (NSNumber)Lc
{
  if ([(APDU *)self APDUCase] == 4 || [(APDU *)self APDUCase] == 6)
  {
    uint64_t v3 = +[NSNumber numberWithUnsignedShort:[(APDU *)self C6C7]];
  }
  else if ([(APDU *)self APDUCase] == 3 || [(APDU *)self APDUCase] == 5)
  {
    uint64_t v3 = +[NSNumber numberWithUnsignedChar:[(APDU *)self C5]];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSNumber)Le
{
  if ([(APDU *)self APDUCase] == 2 || [(APDU *)self APDUCase] == 6)
  {
    unsigned __int16 v6 = 0;
    -[NSData getBytes:range:](self->_data, "getBytes:range:", &v6, (char *)[(NSData *)self->_data length] - 2, 2);
    uint64_t v3 = +[NSNumber numberWithUnsignedShort:v6];
  }
  else if ([(APDU *)self APDUCase] == 1 || [(APDU *)self APDUCase] == 5)
  {
    unsigned __int8 v5 = 0;
    -[NSData getBytes:range:](self->_data, "getBytes:range:", &v5, (char *)[(NSData *)self->_data length] - 1, 1);
    uint64_t v3 = +[NSNumber numberWithUnsignedChar:v5];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSNumber *)v3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end