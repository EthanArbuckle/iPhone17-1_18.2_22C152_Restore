@interface TKSmartCardATR
- (NSArray)historicalRecords;
- (NSArray)protocols;
- (NSData)bytes;
- (NSData)historicalBytes;
- (TKSmartCardATR)initWithBytes:(NSData *)bytes;
- (TKSmartCardATR)initWithSource:(void *)source;
- (TKSmartCardATRInterfaceGroup)interfaceGroupAtIndex:(NSInteger)index;
- (TKSmartCardATRInterfaceGroup)interfaceGroupForProtocol:(TKSmartCardProtocol)protocol;
- (id)_formatHexData:(id)a3 to:(id)a4;
- (id)description;
- (id)parseFromSource:(id)a3;
@end

@implementation TKSmartCardATR

- (TKSmartCardATR)initWithBytes:(NSData *)bytes
{
  v5 = bytes;
  v20.receiver = self;
  v20.super_class = (Class)TKSmartCardATR;
  v6 = [(TKSmartCardATR *)&v20 init];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    interfaces = v7->_interfaces;
    v7->_interfaces = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_bytes, bytes);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v10 = v5;
    uint64_t v19 = [(NSData *)v10 bytes];
    uint64_t v11 = v17[3];
    uint64_t v12 = [(NSData *)v10 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__TKSmartCardATR_initWithBytes___block_invoke;
    v15[3] = &unk_1E63C8D80;
    v15[4] = &v16;
    v15[5] = v11 + v12;
    v13 = [(TKSmartCardATR *)v7 parseFromSource:v15];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __32__TKSmartCardATR_initWithBytes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(unsigned __int8 **)(v1 + 24);
  if ((unint64_t)v2 >= *(void *)(a1 + 40)) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(v1 + 24) = v2 + 1;
  return *v2;
}

- (TKSmartCardATR)initWithSource:(void *)source
{
  v4 = source;
  v21.receiver = self;
  v21.super_class = (Class)TKSmartCardATR;
  v5 = [(TKSmartCardATR *)&v21 init];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    interfaces = v6->_interfaces;
    v6->_interfaces = (NSMutableArray *)v7;

    v9 = [MEMORY[0x1E4F1CA58] data];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __33__TKSmartCardATR_initWithSource___block_invoke;
    uint64_t v18 = &unk_1E63C8DA8;
    id v20 = v4;
    id v10 = v9;
    id v19 = v10;
    uint64_t v11 = [(TKSmartCardATR *)v6 parseFromSource:&v15];

    if (v11)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithData:", v10, v15, v16, v17, v18);
      bytes = v11->_bytes;
      v11->_bytes = (NSData *)v12;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __33__TKSmartCardATR_initWithSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if ((v2 & 0x80000000) == 0)
  {
    char v5 = v2;
    [*(id *)(a1 + 32) appendBytes:&v5 length:1];
  }
  return v3;
}

- (id)parseFromSource:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(void))a3;
  if ((((uint64_t (*)(void))v4[2])() & 0x80000000) != 0 || (int v5 = v4[2](v4), v5 < 0))
  {
    v17 = 0;
  }
  else
  {
    char v6 = 0;
    id v7 = 0;
    char v22 = v5 & 0xF0;
    uint64_t v8 = v5 & 0xF;
    char v21 = 1;
    do
    {
      v9 = v7;
      id v10 = [[TKSmartCardATRInterfaceGroup alloc] initWithProtocol:v7];
      id v20 = v7;
      uint64_t v11 = [(TKSmartCardATRInterfaceGroup *)v10 parseWithY:&v22 toProtocol:&v20 fromSource:v4 hasNext:&v21];
      id v7 = v20;

      if (!v11)
      {
        v17 = 0;
        goto LABEL_18;
      }
      [(NSMutableArray *)self->_interfaces addObject:v11];
      if (v7) {
        v6 |= [v7 unsignedIntegerValue] != 1;
      }
    }
    while (v21);
    if (v8)
    {
      uint64_t v12 = v8;
      v13 = (char *)&v19 - (((_BYTE)v8 + 15) & 0x10);
      while (1)
      {
        int v14 = v4[2](v4);
        if (v14 < 0) {
          break;
        }
        *v13++ = v14;
        if (!--v12) {
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)&v19 - (((_BYTE)v8 + 15) & 0x10) length:v8];
      historicalBytes = self->_historicalBytes;
      self->_historicalBytes = v15;

      if ((v6 & 1) == 0 || (v4[2](v4) & 0x80000000) == 0)
      {
        v17 = self;
        goto LABEL_18;
      }
    }
    v17 = 0;
LABEL_18:
  }

  return v17;
}

- (TKSmartCardATRInterfaceGroup)interfaceGroupAtIndex:(NSInteger)index
{
  if ([(NSMutableArray *)self->_interfaces count] >= (unint64_t)index)
  {
    int v5 = [(NSMutableArray *)self->_interfaces objectAtIndex:index - 1];
  }
  else
  {
    int v5 = 0;
  }

  return (TKSmartCardATRInterfaceGroup *)v5;
}

- (TKSmartCardATRInterfaceGroup)interfaceGroupForProtocol:(TKSmartCardProtocol)protocol
{
  if (protocol == 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = 2;
  }
  for (i = self->_interfaces; v5 < [(NSMutableArray *)i count]; i = self->_interfaces)
  {
    id v7 = [(NSMutableArray *)self->_interfaces objectAtIndex:v5];
    uint64_t v8 = [v7 protocol];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9 == protocol) {
      goto LABEL_9;
    }

    ++v5;
  }
  id v7 = 0;
LABEL_9:

  return (TKSmartCardATRInterfaceGroup *)v7;
}

- (NSArray)protocols
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_interfaces, "count"));
  v4 = [(TKSmartCardATR *)self interfaceGroupAtIndex:2];
  unint64_t v5 = [v4 TA];

  if (v5)
  {
    char v6 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", 1 << (objc_msgSend(v5, "unsignedCharValue") & 0xF));
    [v3 addObject:v6];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = self->_interfaces;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "protocol", (void)v23);
          if (v13)
          {
            int v14 = (void *)v13;
            uint64_t v15 = [v12 protocol];
            unint64_t v16 = [v15 unsignedIntegerValue];

            if (!(v16 >> 15))
            {
              v17 = [v12 protocol];
              char v18 = [v3 containsObject:v17];

              if ((v18 & 1) == 0)
              {
                uint64_t v19 = [v12 protocol];
                uint64_t v20 = [v19 unsignedIntegerValue];

                char v21 = [v12 protocol];
                if (v20 == 2) {
                  [v3 insertObject:v21 atIndex:0];
                }
                else {
                  [v3 addObject:v21];
                }
              }
            }
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    if (![v3 count]) {
      [v3 addObject:&unk_1F19F8240];
    }
  }

  return (NSArray *)v3;
}

- (id)_formatHexData:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F28E78] string];
  }
  if ([v5 length])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = v5;
      objc_msgSend(v6, "appendFormat:", @"%02x", *(unsigned __int8 *)(objc_msgSend(v8, "bytes") + v7++));
    }
    while (v7 < [v8 length]);
  }

  return v6;
}

- (id)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<TKSmartCardATR: %p %02x", self, *(unsigned __int8 *)-[NSData bytes](self->_bytes, "bytes"));
  if ([(NSMutableArray *)self->_interfaces count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NSMutableArray *)self->_interfaces objectAtIndex:v4];
      id v6 = [v5 description];
      [v3 appendFormat:@" %@", v6];

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_interfaces count]);
  }
  [v3 appendString:@";"];
  unint64_t v7 = [(TKSmartCardATR *)self historicalRecords];
  id v8 = v7;
  if (v7)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      uint64_t v12 = "";
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          int v14 = v3;
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [v15 tag];
          v17 = [v15 value];
          char v18 = [(TKSmartCardATR *)self _formatHexData:v17 to:0];
          uint64_t v21 = v16;
          uint64_t v3 = v14;
          [v14 appendFormat:@"%s%x(%@)", v12, v21, v18];

          uint64_t v12 = " ";
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v19 = [(TKSmartCardATR *)self _formatHexData:self->_historicalBytes to:v3];
  }
  [v3 appendString:@">"];

  return v3;
}

- (NSArray)historicalRecords
{
  if (![(NSData *)self->_historicalBytes length])
  {
LABEL_5:
    id v5 = 0;
    goto LABEL_10;
  }
  uint64_t v3 = [(NSData *)self->_historicalBytes bytes];
  NSUInteger v4 = [(NSData *)self->_historicalBytes length];
  id v5 = 0;
  unint64_t v6 = v4 - 1;
  int v9 = *v3;
  id v8 = v3 + 1;
  int v7 = v9;
  if (v9 != 128)
  {
    if (v7) {
      goto LABEL_10;
    }
    if (v6 < 3) {
      goto LABEL_5;
    }
    unint64_t v6 = v4 - 4;
    uint64_t v10 = [TKCompactTLVRecord alloc];
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v8[v6] length:3];
    id v5 = [(TKCompactTLVRecord *)v10 initWithTag:8 value:v11];
  }
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 length:v6 freeWhenDone:0];
  uint64_t v13 = +[TKTLVRecord sequenceOfRecordsFromData:v12];
  int v14 = v13;
  if (v5)
  {
    uint64_t v15 = [(TKCompactTLVRecord *)v13 arrayByAddingObject:v5];

    int v14 = (TKCompactTLVRecord *)v15;
  }

  id v5 = v14;
LABEL_10:

  return (NSArray *)v5;
}

- (NSData)bytes
{
  return self->_bytes;
}

- (NSData)historicalBytes
{
  return self->_historicalBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalBytes, 0);
  objc_storeStrong((id *)&self->_bytes, 0);

  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end