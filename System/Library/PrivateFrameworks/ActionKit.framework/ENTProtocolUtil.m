@interface ENTProtocolUtil
+ (id)_readValueForField:(id)a3 fromProtocol:(id)a4;
+ (id)readMessage:(id)a3 fromProtocol:(id)a4 withResponseTypes:(id)a5;
+ (void)_writeValue:(id)a3 forField:(id)a4 toProtocol:(id)a5;
+ (void)readFromProtocol:(id)a3 ontoObject:(id)a4;
+ (void)sendMessage:(id)a3 toProtocol:(id)a4 withArguments:(id)a5;
+ (void)skipType:(int)a3 onProtocol:(id)a4;
+ (void)writeObject:(id)a3 ontoProtocol:(id)a4;
@end

@implementation ENTProtocolUtil

+ (void)sendMessage:(id)a3 toProtocol:(id)a4 withArguments:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 writeMessageBeginWithName:v8 type:1 sequenceID:0];
  v22 = v8;
  v11 = [v8 stringByAppendingString:@"_args"];
  [v9 writeStructBeginWithName:v11];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v18 = [v17 field];
        v19 = [v17 value];
        v20 = [v18 name];
        objc_msgSend(v9, "writeFieldBeginWithName:type:fieldID:", v20, objc_msgSend(v18, "type"), objc_msgSend(v18, "index"));

        [a1 _writeValue:v19 forField:v18 toProtocol:v9];
        [v9 writeFieldEnd];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  [v9 writeFieldStop];
  [v9 writeStructEnd];
  [v9 writeMessageEnd];
  v21 = [v9 transport];
  [v21 flush];
}

+ (void)writeObject:(id)a3 ontoProtocol:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() structName];
  [v6 writeStructBeginWithName:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(id)objc_opt_class() structFields];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 name];
        uint64_t v15 = [v5 valueForKey:v14];
        if (v15)
        {
          unsigned int v16 = [v13 type];
          if (v16 == 16) {
            uint64_t v17 = 11;
          }
          else {
            uint64_t v17 = v16;
          }
          objc_msgSend(v6, "writeFieldBeginWithName:type:fieldID:", v14, v17, objc_msgSend(v13, "index"));
          [a1 _writeValue:v15 forField:v13 toProtocol:v6];
          [v6 writeFieldEnd];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [v6 writeFieldStop];
  [v6 writeStructEnd];
}

+ (id)readMessage:(id)a3 fromProtocol:(id)a4 withResponseTypes:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v45 = a5;
  int v66 = 0;
  [v9 readMessageBeginReturningName:0 type:&v66 sequenceID:0];
  if (v66 == 3)
  {
    uint64_t v43 = +[ENTApplicationException read:v9];
    [v9 readMessageEnd];
    v40 = (void *)v43;
LABEL_55:
    objc_exception_throw(v40);
  }
  v44 = v8;
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  [v9 readStructBeginReturningName:0];
  unsigned int v65 = 0;
  int v64 = 0;
  id v63 = 0;
  [v9 readFieldBeginReturningName:&v63 type:&v65 fieldID:&v64];
  for (id i = v63; v65; id i = v63)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v12 = v45;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v46 = i;
      char v15 = 0;
      uint64_t v16 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v60 != v16) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          int v19 = [v18 index];
          if (v19 == v64)
          {
            int v20 = [v18 type];
            if (v20 == v65 || ([v18 type] != 16 ? (BOOL v21 = v65 == 11) : (BOOL v21 = 1), v21))
            {
              long long v22 = [a1 _readValueForField:v18 fromProtocol:v9];
              if (v22) {
                [v10 addObject:v22];
              }

              char v15 = 1;
            }
            else
            {
              NSLog(&cfstr_SkippingFieldD.isa, v18, v65);
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v14);

      id i = v46;
      if (v15) {
        goto LABEL_24;
      }
    }
    else
    {
    }
    +[ENTProtocolUtil skipType:v65 onProtocol:v9];
LABEL_24:

    unsigned int v65 = 0;
    int v64 = 0;
    id v63 = 0;
    [v9 readFieldBeginReturningName:&v63 type:&v65 fieldID:&v64];
  }

  [v9 readStructEnd];
  [v9 readMessageEnd];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v23 = v10;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v56;
    while (2)
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v36 = v28;
          id v35 = v23;
          goto LABEL_51;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v55 objects:v69 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v29 = v23;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v52;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v52 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v51 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v40 = v34;
          goto LABEL_55;
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v31);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v35 = v45;
  id v36 = (id)[v35 countByEnumeratingWithState:&v47 objects:v67 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v48;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(v35);
        }
        if (!objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * (void)n), "structClass"), "isSubclassOfClass:", objc_opt_class()))
        {

          v41 = [v44 stringByAppendingString:@" failed: unknown result"];
          id v42 = +[ENTApplicationException exceptionWithType:5 reason:v41];

          objc_exception_throw(v42);
        }
      }
      id v36 = (id)[v35 countByEnumeratingWithState:&v47 objects:v67 count:16];
    }
    while (v36);
  }
LABEL_51:

  return v36;
}

+ (void)_writeValue:(id)a3 forField:(id)a4 toProtocol:(id)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  switch([v9 type])
  {
    case 2u:
      objc_msgSend(v10, "writeBool:", objc_msgSend(v8, "BOOLValue"));
      break;
    case 3u:
      objc_msgSend(v10, "writeByte:", objc_msgSend(v8, "charValue"));
      break;
    case 4u:
      [v8 doubleValue];
      objc_msgSend(v10, "writeDouble:");
      break;
    case 6u:
      objc_msgSend(v10, "writeI16:", objc_msgSend(v8, "shortValue"));
      break;
    case 8u:
      objc_msgSend(v10, "writeI32:", objc_msgSend(v8, "intValue"));
      break;
    case 0xAu:
      objc_msgSend(v10, "writeI64:", objc_msgSend(v8, "longLongValue"));
      break;
    case 0xBu:
      [v10 writeString:v8];
      break;
    case 0xCu:
      [v8 write:v10];
      break;
    case 0xDu:
      uint64_t v11 = [v9 keyField];
      id v12 = [v9 valueField];
      objc_msgSend(v10, "writeMapBeginWithKeyType:valueType:size:", objc_msgSend(v11, "type"), objc_msgSend(v12, "type"), objc_msgSend(v8, "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v31 = v8;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            [a1 _writeValue:v18 forField:v11 toProtocol:v10];
            int v19 = [v13 objectForKey:v18];
            [a1 _writeValue:v19 forField:v12 toProtocol:v10];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v15);
      }

      [v10 writeMapEnd];
      id v8 = v31;
      break;
    case 0xEu:
      int v20 = [v9 valueField];
      objc_msgSend(v10, "writeSetBeginWithElementType:size:", objc_msgSend(v20, "type"), objc_msgSend(v8, "count"));
      [v10 writeSetEnd];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v21 = v8;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            [a1 _writeValue:*(void *)(*((void *)&v36 + 1) + 8 * j) forField:v20 toProtocol:v10];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v23);
      }

      goto LABEL_34;
    case 0xFu:
      int v20 = [v9 valueField];
      objc_msgSend(v10, "writeListBeginWithElementType:size:", objc_msgSend(v20, "type"), objc_msgSend(v8, "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v26 = v8;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v33;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v33 != v29) {
              objc_enumerationMutation(v26);
            }
            [a1 _writeValue:*(void *)(*((void *)&v32 + 1) + 8 * k) forField:v20 toProtocol:v10];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v28);
      }

      [v10 writeListEnd];
LABEL_34:

      break;
    case 0x10u:
      [v10 writeBinary:v8];
      break;
    default:
      break;
  }
}

+ (void)readFromProtocol:(id)a3 ontoObject:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v6 readStructBeginReturningName:0];
  id v8 = [(id)objc_opt_class() structFields];
  uint64_t v25 = 0;
  [v6 readFieldBeginReturningName:0 type:(char *)&v25 + 4 fieldID:&v25];
  while (HIDWORD(v25))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        int v15 = [v14 index];
        if (v15 == v25) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v16 = v14;

      if (!v16) {
        goto LABEL_19;
      }
      int v17 = [v16 type];
      if (v17 != HIDWORD(v25) && [v16 type] != 16 && HIDWORD(v25) != 11)
      {
        NSLog(&cfstr_SkippingFieldD.isa, v16, HIDWORD(v25));
        goto LABEL_19;
      }
      int v19 = [a1 _readValueForField:v16 fromProtocol:v6];
      int v20 = [v16 name];
      [v7 setValue:v19 forKey:v20];

      [v6 readFieldEnd];
    }
    else
    {
LABEL_10:

      id v16 = 0;
LABEL_19:
      [a1 skipType:HIDWORD(v25) onProtocol:v6];
    }

    uint64_t v25 = 0;
    [v6 readFieldBeginReturningName:0 type:(char *)&v25 + 4 fieldID:&v25];
  }
  [v6 readStructEnd];
}

+ (id)_readValueForField:(id)a3 fromProtocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  switch([v6 type])
  {
    case 2u:
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "readBool"));
      goto LABEL_29;
    case 3u:
      uint64_t v10 = NSNumber;
      uint64_t v11 = [v7 readByte];
      goto LABEL_7;
    case 4u:
      uint64_t v12 = NSNumber;
      [v7 readDouble];
      uint64_t v9 = objc_msgSend(v12, "numberWithDouble:");
      goto LABEL_29;
    case 6u:
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v7, "readI16"));
      goto LABEL_29;
    case 8u:
      uint64_t v10 = NSNumber;
      uint64_t v11 = [v7 readI32];
LABEL_7:
      uint64_t v9 = [v10 numberWithInt:v11];
      goto LABEL_29;
    case 0xAu:
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "readI64"));
      goto LABEL_29;
    case 0xBu:
      uint64_t v9 = [v7 readString];
      goto LABEL_29;
    case 0xCu:
      id v8 = objc_alloc_init((Class)[v6 structClass]);
      [v8 read:v7];
      break;
    case 0xDu:
      uint64_t v27 = 0;
      int v26 = 0;
      [v7 readMapBeginReturningKeyType:&v27 valueType:&v26 size:(char *)&v27 + 4];
      uint64_t v13 = [v6 keyField];
      uint64_t v14 = [v6 valueField];
      id v15 = objc_alloc(MEMORY[0x263EFF9A0]);
      id v8 = (id)[v15 initWithCapacity:SHIDWORD(v27)];
      if (SHIDWORD(v27) >= 1)
      {
        int v16 = 0;
        do
        {
          int v17 = [a1 _readValueForField:v13 fromProtocol:v7];
          uint64_t v18 = [a1 _readValueForField:v14 fromProtocol:v7];
          [v8 setObject:v18 forKey:v17];

          ++v16;
        }
        while (v16 < SHIDWORD(v27));
      }
      [v7 readMapEnd];

      goto LABEL_27;
    case 0xEu:
      uint64_t v27 = 0;
      [v7 readSetBeginReturningElementType:&v27 size:(char *)&v27 + 4];
      uint64_t v13 = [v6 valueField];
      id v19 = objc_alloc(MEMORY[0x263EFF9C0]);
      id v8 = (id)[v19 initWithCapacity:SHIDWORD(v27)];
      if (SHIDWORD(v27) >= 1)
      {
        int v20 = 0;
        do
        {
          long long v21 = [a1 _readValueForField:v13 fromProtocol:v7];
          if (v21) {
            [v8 addObject:v21];
          }

          ++v20;
        }
        while (v20 < SHIDWORD(v27));
      }
      goto LABEL_26;
    case 0xFu:
      uint64_t v27 = 0;
      [v7 readListBeginReturningElementType:&v27 size:(char *)&v27 + 4];
      uint64_t v13 = [v6 valueField];
      id v22 = objc_alloc(MEMORY[0x263EFF980]);
      id v8 = (id)[v22 initWithCapacity:SHIDWORD(v27)];
      if (SHIDWORD(v27) >= 1)
      {
        int v23 = 0;
        do
        {
          long long v24 = [a1 _readValueForField:v13 fromProtocol:v7];
          if (v24) {
            [v8 addObject:v24];
          }

          ++v23;
        }
        while (v23 < SHIDWORD(v27));
      }
LABEL_26:
      [v7 readListEnd];
LABEL_27:

      break;
    case 0x10u:
      uint64_t v9 = [v7 readBinary];
LABEL_29:
      id v8 = (id)v9;
      break;
    default:
      break;
  }

  return v8;
}

+ (void)skipType:(int)a3 onProtocol:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 2:
      [v6 readBool];
      break;
    case 3:
      [v6 readByte];
      break;
    case 4:
      [v6 readDouble];
      break;
    case 6:
      [v6 readI16];
      break;
    case 8:
      [v6 readI32];
      break;
    case 10:
      [v6 readI64];
      break;
    case 11:
      id v8 = (id)[v6 readString];
      break;
    case 12:
      [v6 readStructBeginReturningName:0];
      while (1)
      {
        HIDWORD(v13) = 0;
        [v7 readFieldBeginReturningName:0 type:(char *)&v13 + 4 fieldID:0];
        if (!HIDWORD(v13)) {
          break;
        }
        objc_msgSend(a1, "skipType:onProtocol:");
        [v7 readFieldEnd];
      }
      [v7 readStructEnd];
      break;
    case 13:
      uint64_t v13 = 0;
      int v12 = 0;
      [v6 readMapBeginReturningKeyType:(char *)&v13 + 4 valueType:&v13 size:&v12];
      if (v12 >= 1)
      {
        for (int i = 0; i < v12; ++i)
        {
          [a1 skipType:HIDWORD(v13) onProtocol:v7];
          [a1 skipType:v13 onProtocol:v7];
        }
      }
      [v7 readMapEnd];
      break;
    case 14:
      uint64_t v13 = 0;
      [v6 readSetBeginReturningElementType:(char *)&v13 + 4 size:&v13];
      if ((int)v13 >= 1)
      {
        int v10 = 0;
        do
        {
          [a1 skipType:HIDWORD(v13) onProtocol:v7];
          ++v10;
        }
        while (v10 < (int)v13);
      }
      [v7 readSetEnd];
      break;
    case 15:
      uint64_t v13 = 0;
      [v6 readListBeginReturningElementType:(char *)&v13 + 4 size:&v13];
      if ((int)v13 >= 1)
      {
        int v11 = 0;
        do
        {
          [a1 skipType:HIDWORD(v13) onProtocol:v7];
          ++v11;
        }
        while (v11 < (int)v13);
      }
      [v7 readListEnd];
      break;
    default:
      break;
  }
}

@end