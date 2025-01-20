@interface CBOR
+ (id)cborFalse;
+ (id)cborNil;
+ (id)cborTrue;
+ (id)cborWithArray:(id)a3;
+ (id)cborWithCOSE:(id)a3;
+ (id)cborWithCOSEKey:(id)a3;
+ (id)cborWithData:(id)a3;
+ (id)cborWithDateTime:(id)a3;
+ (id)cborWithDictionary:(id)a3;
+ (id)cborWithDictionary:(id)a3 keyOrderList:(id)a4;
+ (id)cborWithDouble:(double)a3;
+ (id)cborWithEmbeddedCBORData:(id)a3;
+ (id)cborWithEncodedTag24Data:(id)a3;
+ (id)cborWithFloat:(float)a3;
+ (id)cborWithFullDate:(id)a3;
+ (id)cborWithHalfFloat:(float)a3;
+ (id)cborWithInteger:(int64_t)a3;
+ (id)cborWithUTF8String:(id)a3;
+ (id)cborWithUnsignedInteger:(unint64_t)a3;
+ (id)decodeFromBytes:(const char *)a3 length:(unint64_t *)a4 recursionLevel:(int)a5 keepKeyOrdering:(BOOL)a6 noCopy:(BOOL)a7;
+ (id)decodeFromData:(id)a3;
+ (id)decodeFromData:(id)a3 keepKeyOrdering:(BOOL)a4;
+ (id)decodeFromData:(id)a3 keepKeyOrdering:(BOOL)a4 noCopy:(BOOL)a5;
+ (id)decodeMajorType0And1FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5;
+ (id)decodeMajorType2And3FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 indefiniteLenContainerType:(unint64_t)a6 noCopy:(BOOL)a7;
+ (id)decodeMajorType4FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 recursionLevel:(int)a6 keepKeyOrdering:(BOOL)a7 noCopy:(BOOL)a8;
+ (id)decodeMajorType5FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 recursionLevel:(int)a6 keepKeyOrdering:(BOOL)a7 noCopy:(BOOL)a8;
+ (id)decodeMajorType6FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5;
+ (id)decodeMajorType7FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5;
+ (id)encodeMajorType2or3:(uint64_t)a1;
+ (id)encodeMajorType7Bool:(uint64_t)a1;
+ (id)encodeMajorType7Undefined;
- (BOOL)BOOLValue;
- (BOOL)isBoolean;
- (BOOL)isDate;
- (BOOL)isEmbeddedCBORData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloatNumber;
- (BOOL)isWholeNumber;
- (CBOR)initWithCbor:(id)a3 tag:(id)a4;
- (CBOR)initWithType:(unint64_t)a3 value:(id)a4 valueSize:(int64_t)a5 tag:(id)a6;
- (CBOR)tag;
- (NSArray)array;
- (NSArray)orderedKeys;
- (NSData)data;
- (NSDate)date;
- (NSDictionary)dictionary;
- (NSNumber)numeric;
- (NSString)string;
- (double)doubleValue;
- (id)asJSON;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeToEmbeddedCBORData;
- (id)value;
- (int64_t)longLongValue;
- (int64_t)valueSize;
- (unint64_t)cachedHash;
- (unint64_t)type;
- (unint64_t)unsignedLongLongValue;
- (void)setCachedHash:(unint64_t)a3;
- (void)setOrderedKeys:(id)a3;
- (void)setTag:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueSize:(int64_t)a3;
@end

@implementation CBOR

+ (id)encodeMajorType2or3:(uint64_t)a1
{
  v12[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 dataUsingEncoding:4];
    char v4 = 96;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = (id)objc_opt_new();
      goto LABEL_17;
    }
    id v3 = v2;
    char v4 = 64;
  }
  [v3 length];
  if ((unint64_t)[v3 length] >> 32)
  {
    char v11 = v4 | 0x1B;
    v12[0] = bswap64([v3 length]);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v3, "length") + 9);
    [v5 appendBytes:&v11 length:1];
    v6 = (char *)v12;
    v7 = v5;
    uint64_t v8 = 8;
  }
  else if ((unint64_t)[v3 length] < 0x10000)
  {
    if ((unint64_t)[v3 length] < 0x100)
    {
      if ((unint64_t)[v3 length] < 0x18)
      {
        char v11 = v4 + [v3 length];
        v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v3, "length") + 1);
        v5 = v7;
        v6 = &v11;
      }
      else
      {
        char v11 = v4 | 0x18;
        LOBYTE(v12[0]) = [v3 length];
        v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v3, "length") + 2);
        [v5 appendBytes:&v11 length:1];
        v6 = (char *)v12;
        v7 = v5;
      }
      uint64_t v8 = 1;
    }
    else
    {
      char v11 = v4 | 0x19;
      LOWORD(v12[0]) = bswap32([v3 length]) >> 16;
      v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v3, "length") + 3);
      [v5 appendBytes:&v11 length:1];
      v6 = (char *)v12;
      v7 = v5;
      uint64_t v8 = 2;
    }
  }
  else
  {
    char v11 = v4 | 0x1A;
    LODWORD(v12[0]) = bswap32([v3 length]);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithCapacity:", objc_msgSend(v3, "length") + 5);
    [v5 appendBytes:&v11 length:1];
    v6 = (char *)v12;
    v7 = v5;
    uint64_t v8 = 4;
  }
  [v7 appendBytes:v6 length:v8];
  [v5 appendData:v3];
  id v9 = v5;

LABEL_17:
  return v9;
}

uint64_t __51__CBOR_Encoder__encodeMajorType5_encodingKeyOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [MEMORY[0x263EFF8F8] dataWithCBOR:v5];
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithCBOR:v6];
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = [v7 length];
  unint64_t v11 = [v8 length];
  if (v9)
  {
    if (v10 < v11)
    {
LABEL_3:
      uint64_t v12 = -1;
      goto LABEL_17;
    }
    unint64_t v25 = [v7 length];
    if (v25 <= [v8 length])
    {
      uint64_t v26 = [v7 length];
      v27 = (unsigned __int8 *)[v7 bytes];
      v28 = (unsigned __int8 *)[v8 bytes];
      if (!v26) {
        goto LABEL_3;
      }
      unsigned int v29 = *v27;
      unsigned int v30 = *v28;
      if (v29 <= v30)
      {
        v34 = v27 + 1;
        v35 = v28 + 1;
        uint64_t v12 = 1;
        while (v29 >= v30)
        {
          unsigned int v36 = *v34++;
          unsigned int v29 = v36;
          unsigned int v37 = *v35++;
          unsigned int v30 = v37;
          if (v29 > v37) {
            goto LABEL_17;
          }
        }
        goto LABEL_3;
      }
    }
LABEL_16:
    uint64_t v12 = 1;
    goto LABEL_17;
  }
  if (v10 <= v11) {
    v13 = v8;
  }
  else {
    v13 = v7;
  }
  uint64_t v14 = [v13 length];
  id v15 = v7;
  v16 = (unsigned __int8 *)[v15 bytes];
  id v17 = v8;
  v18 = (unsigned __int8 *)[v17 bytes];
  if (v14)
  {
    unsigned int v19 = *v16;
    unsigned int v20 = *v18;
    if (v19 <= v20)
    {
      v21 = v16 + 1;
      v22 = v18 + 1;
      uint64_t v12 = 1;
      while (v19 >= v20)
      {
        unsigned int v23 = *v21++;
        unsigned int v19 = v23;
        unsigned int v24 = *v22++;
        unsigned int v20 = v24;
        if (v19 > v24) {
          goto LABEL_17;
        }
      }
      goto LABEL_3;
    }
    goto LABEL_16;
  }
  uint64_t v32 = [v15 length];
  if (v32 == [v17 length])
  {
    uint64_t v12 = 0;
  }
  else
  {
    unint64_t v33 = [v15 length];
    if (v33 > [v17 length]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
  }
LABEL_17:

  return v12;
}

+ (id)encodeMajorType7Undefined
{
  self;
  char v2 = -9;
  v0 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v2 length:1];
  return v0;
}

+ (id)encodeMajorType7Bool:(uint64_t)a1
{
  self;
  if (a2) {
    char v3 = -11;
  }
  else {
    char v3 = -12;
  }
  char v6 = v3;
  char v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v6 length:1];
  return v4;
}

+ (id)decodeFromData:(id)a3
{
  return (id)[a1 decodeFromData:a3 keepKeyOrdering:1 noCopy:0];
}

+ (id)decodeFromData:(id)a3 keepKeyOrdering:(BOOL)a4
{
  return (id)[a1 decodeFromData:a3 keepKeyOrdering:a4 noCopy:0];
}

+ (id)decodeFromData:(id)a3 keepKeyOrdering:(BOOL)a4 noCopy:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v13 = [v8 bytes];
  uint64_t v9 = [v8 length];

  uint64_t v12 = v9;
  unint64_t v10 = [a1 decodeFromBytes:&v13 length:&v12 recursionLevel:0 keepKeyOrdering:v6 noCopy:v5];
  return v10;
}

- (id)asJSON
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ([(CBOR *)self type] == 4)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF980]);
    char v4 = [(CBOR *)self array];
    BOOL v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    BOOL v6 = [(CBOR *)self array];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v12 = [v11 asJSON];
          if (v12) {
            [v11 asJSON];
          }
          else {
          uint64_t v13 = [MEMORY[0x263EFF9D0] null];
          }
          [v5 addObject:v13];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v8);
    }
  }
  else if ([(CBOR *)self type] == 5)
  {
    id v14 = objc_alloc(MEMORY[0x263EFF9A0]);
    id v15 = [(CBOR *)self dictionary];
    BOOL v5 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v16 = [(CBOR *)self dictionary];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v22 = [(CBOR *)self dictionary];
          unsigned int v23 = [v22 objectForKeyedSubscript:v21];

          unsigned int v24 = [v21 asJSON];
          uint64_t v25 = [v23 asJSON];
          uint64_t v26 = (void *)v25;
          if (v24)
          {
            if (v25)
            {
              [v5 setObject:v25 forKey:v24];
            }
            else
            {
              v27 = [MEMORY[0x263EFF9D0] null];
              [v5 setObject:v27 forKey:v24];
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v18);
    }
  }
  else
  {
    BOOL v5 = [(CBOR *)self value];
    if (!v5)
    {
      BOOL v5 = [MEMORY[0x263EFF9D0] null];
    }
  }
  return v5;
}

+ (id)decodeFromBytes:(const char *)a3 length:(unint64_t *)a4 recursionLevel:(int)a5 keepKeyOrdering:(BOOL)a6 noCopy:(BOOL)a7
{
  if (!a4 || !*a4)
  {
    v16 = 0;
    goto LABEL_34;
  }
  if (!a3 || !*a3)
  {
    v16 = 0;
    *a4 = 0;
    goto LABEL_34;
  }
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = 0;
  int v13 = 0;
  while (1)
  {
    unsigned int v14 = *(unsigned __int8 *)*a3;
    if (v14 <= 0x3F)
    {
      uint64_t v17 = +[CBOR decodeMajorType0And1FromBuffer:a3 length:a4 tag:v12];
      goto LABEL_26;
    }
    if ((v14 & 0x80) == 0)
    {
      uint64_t v17 = +[CBOR decodeMajorType2And3FromBuffer:a3 length:a4 tag:v12 indefiniteLenContainerType:16 noCopy:v9];
      goto LABEL_26;
    }
    if (v14 <= 0x9F)
    {
      if ((int)v11 > 4999)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          goto LABEL_32;
        }
        __int16 v24 = 0;
        uint64_t v18 = &_os_log_internal;
        uint64_t v19 = "Max CBOR decoding level reached";
        unsigned int v20 = (uint8_t *)&v24;
        goto LABEL_38;
      }
      uint64_t v17 = +[CBOR decodeMajorType4FromBuffer:a3 length:a4 tag:v12 recursionLevel:v11 keepKeyOrdering:v10 noCopy:v9];
LABEL_26:
      v16 = (void *)v17;
      goto LABEL_33;
    }
    if (v14 <= 0xBF)
    {
      if ((int)v11 <= 4999)
      {
        uint64_t v17 = +[CBOR decodeMajorType5FromBuffer:a3 length:a4 tag:v12 recursionLevel:v11 keepKeyOrdering:v10 noCopy:v9];
        goto LABEL_26;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        goto LABEL_32;
      }
      *(_WORD *)buf = 0;
      uint64_t v18 = &_os_log_internal;
      uint64_t v19 = "Max CBOR decoding level reached";
      unsigned int v20 = buf;
LABEL_38:
      _os_log_fault_impl(&dword_218327000, v18, OS_LOG_TYPE_FAULT, v19, v20, 2u);
      goto LABEL_32;
    }
    if (v14 > 0xDF)
    {
      uint64_t v17 = +[CBOR decodeMajorType7FromBuffer:a3 length:a4 tag:v12];
      goto LABEL_26;
    }
    if (v13 == 100) {
      break;
    }
    uint64_t v15 = +[CBOR decodeMajorType6FromBuffer:a3 length:a4 tag:v12];

    if (v15) {
      ++v13;
    }
    else {
      int v13 = 0;
    }
    uint64_t v12 = (void *)v15;
    if (!*a4)
    {
      v16 = 0;
      uint64_t v12 = (void *)v15;
      goto LABEL_33;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    __int16 v22 = 0;
    uint64_t v18 = &_os_log_internal;
    uint64_t v19 = "Max CBOR recursive tagging level reached";
    unsigned int v20 = (uint8_t *)&v22;
    goto LABEL_38;
  }
LABEL_32:
  v16 = 0;
LABEL_33:

LABEL_34:
  return v16;
}

+ (id)decodeMajorType0And1FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5
{
  id v7 = a5;
  unint64_t v8 = *a4;
  if (*a4)
  {
    BOOL v9 = *a3;
    unint64_t v10 = *(unsigned __int8 *)*a3;
    unsigned int v11 = v10 & 0xFFFFFFDF;
    uint64_t v12 = (v10 >> 5) & 1;
    if ((v10 & 0xFFFFFFDF) > 0x17)
    {
      switch(v11)
      {
        case 0x18u:
          if (v8 == 1) {
            goto LABEL_27;
          }
          uint64_t v20 = *((unsigned __int8 *)v9 + 1);
          if ((v10 & 0x20) != 0) {
            uint64_t v21 = [objc_alloc(NSNumber) initWithInt:(char)~(_BYTE)v20];
          }
          else {
            uint64_t v21 = [objc_alloc(NSNumber) initWithUnsignedInt:v20];
          }
          long long v29 = (void *)v21;
          v16 = [[CBOR alloc] initWithType:v12 value:v21 valueSize:1 tag:v7];

          unint64_t v17 = v8 - 2;
          uint64_t v18 = 2;
          break;
        case 0x19u:
          unint64_t v17 = v8 - 3;
          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_27;
          }
          unsigned int v22 = *(unsigned __int16 *)(v9 + 1);
          if ((v10 & 0x20) != 0) {
            uint64_t v23 = [objc_alloc(NSNumber) initWithShort:((int)bswap32(~v22) >> 16)];
          }
          else {
            uint64_t v23 = [objc_alloc(NSNumber) initWithUnsignedShort:__rev16(v22)];
          }
          long long v30 = (void *)v23;
          v16 = [[CBOR alloc] initWithType:v12 value:v23 valueSize:2 tag:v7];

          uint64_t v18 = 3;
          break;
        case 0x1Au:
          unint64_t v17 = v8 - 5;
          if (v8 - 5 > 0xFFFFFFFFFFFFFFFBLL) {
            goto LABEL_27;
          }
          unsigned int v24 = *(_DWORD *)(v9 + 1);
          if ((v10 & 0x20) != 0) {
            uint64_t v25 = [objc_alloc(NSNumber) initWithInt:bswap32(~v24)];
          }
          else {
            uint64_t v25 = [objc_alloc(NSNumber) initWithUnsignedInt:bswap32(v24)];
          }
          long long v31 = (void *)v25;
          v16 = [[CBOR alloc] initWithType:v12 value:v25 valueSize:4 tag:v7];

          uint64_t v18 = 5;
          break;
        case 0x1Bu:
          unint64_t v17 = v8 - 9;
          if (v8 - 9 > 0xFFFFFFFFFFFFFFF7)
          {
LABEL_27:
            unint64_t v17 = 0;
            v16 = 0;
            goto LABEL_28;
          }
          unint64_t v26 = *(void *)(v9 + 1);
          if ((v10 & 0x20) != 0) {
            uint64_t v27 = [objc_alloc(NSNumber) initWithLongLong:bswap64(~v26)];
          }
          else {
            uint64_t v27 = [objc_alloc(NSNumber) initWithUnsignedLongLong:bswap64(v26)];
          }
          long long v32 = (void *)v27;
          v16 = [[CBOR alloc] initWithType:v12 value:v27 valueSize:8 tag:v7];

          uint64_t v18 = 9;
          break;
        default:
          unint64_t v17 = 0;
          uint64_t v19 = *a3;
          goto LABEL_15;
      }
    }
    else
    {
      if ((v10 & 0x20) != 0) {
        uint64_t v13 = ~v11;
      }
      else {
        uint64_t v13 = v11;
      }
      unsigned int v14 = [CBOR alloc];
      uint64_t v15 = (void *)[objc_alloc(NSNumber) initWithInt:v13];
      v16 = [(CBOR *)v14 initWithType:v12 value:v15 valueSize:0 tag:v7];

      unint64_t v17 = v8 - 1;
      uint64_t v18 = 1;
    }
    uint64_t v19 = &v9[v18];
    if (!v16) {
LABEL_15:
    }
      v16 = [[CBOR alloc] initWithType:16 value:0 valueSize:0 tag:v7];
    if (&v19[v17] > &v9[v8]) {
      __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType0And1FromBuffer:length:tag:]", "CBOR+decoder.m", 277, "buffer + bufferSize <= endOfBuffer");
    }
    *a3 = v19;
LABEL_28:
    *a4 = v17;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)decodeMajorType2And3FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 indefiniteLenContainerType:(unint64_t)a6 noCopy:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  uint64_t v12 = *a3;
  unint64_t v13 = *a4;
  unint64_t v70 = v13;
  v71 = (unsigned __int8 *)v12;
  if (!v13)
  {
    v16 = 0;
    goto LABEL_90;
  }
  unsigned int v14 = *(unsigned __int8 *)v12;
  if ((v14 & 0x20) != 0) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  if (a6 != 16 && v15 != a6)
  {
LABEL_7:
    v16 = 0;
    *a4 = 0;
    goto LABEL_90;
  }
  BOOL v67 = v7;
  unint64_t v17 = v13;
  if ((v14 & 0xFFFFFFDF) > 0x57)
  {
    int v21 = 0;
    unint64_t v18 = 0;
    int v19 = 1;
    v69 = 0;
    uint64_t v20 = 0;
    switch(v14 & 0xFFFFFFDF)
    {
      case 'X':
        int v21 = v13 - 1;
        unint64_t v70 = v13 - 1;
        v71 = (unsigned __int8 *)(v12 + 1);
        if (v13 == 1)
        {
          unint64_t v17 = 0;
          unint64_t v18 = 0;
          int v19 = 0;
          v69 = 0;
          goto LABEL_34;
        }
        int v19 = 0;
        unint64_t v22 = *((unsigned __int8 *)v12 + 1);
        unint64_t v17 = v13 - 2;
        v69 = 0;
        unint64_t v70 = v13 - 2;
        v71 = (unsigned __int8 *)(v12 + 2);
        int v21 = v13 - 2 < v22;
        uint64_t v20 = v13 - 2 >= v22;
        if (v13 - 2 >= v22) {
          unint64_t v18 = v22;
        }
        else {
          unint64_t v18 = 0;
        }
        goto LABEL_59;
      case 'Y':
        unint64_t v17 = v13 - 1;
        unint64_t v70 = v13 - 1;
        v71 = (unsigned __int8 *)(v12 + 1);
        if (v13 - 1 < 2) {
          goto LABEL_33;
        }
        int v19 = 0;
        unint64_t v23 = bswap32(*(unsigned __int16 *)(v12 + 1)) >> 16;
        unint64_t v17 = v13 - 3;
        v69 = 0;
        unint64_t v70 = v13 - 3;
        v71 = (unsigned __int8 *)(v12 + 3);
        int v21 = v13 - 3 < v23;
        if (v13 - 3 >= v23) {
          unint64_t v18 = v23;
        }
        else {
          unint64_t v18 = 0;
        }
        uint64_t v20 = 2 * (v13 - 3 >= v23);
        goto LABEL_59;
      case 'Z':
        unint64_t v17 = v13 - 1;
        unint64_t v70 = v13 - 1;
        v71 = (unsigned __int8 *)(v12 + 1);
        if (v13 - 1 < 4) {
          goto LABEL_33;
        }
        int v19 = 0;
        unint64_t v24 = bswap32(*(_DWORD *)(v12 + 1));
        unint64_t v17 = v13 - 5;
        v69 = 0;
        unint64_t v70 = v13 - 5;
        v71 = (unsigned __int8 *)(v12 + 5);
        int v21 = v13 - 5 < v24;
        if (v13 - 5 >= v24) {
          unint64_t v18 = v24;
        }
        else {
          unint64_t v18 = 0;
        }
        uint64_t v20 = 4 * (v13 - 5 >= v24);
        goto LABEL_59;
      case '[':
        unint64_t v17 = v13 - 1;
        unint64_t v70 = v13 - 1;
        v71 = (unsigned __int8 *)(v12 + 1);
        if (v13 - 1 < 8)
        {
LABEL_33:
          unint64_t v18 = 0;
          int v19 = 0;
          v69 = 0;
          int v21 = 0;
LABEL_34:
          uint64_t v20 = 0;
        }
        else
        {
          int v19 = 0;
          unint64_t v25 = bswap64(*(void *)(v12 + 1));
          unint64_t v17 = v13 - 9;
          v69 = 0;
          unint64_t v70 = v13 - 9;
          v71 = (unsigned __int8 *)(v12 + 9);
          int v21 = v13 - 9 < v25;
          if (v13 - 9 >= v25) {
            unint64_t v18 = v25;
          }
          else {
            unint64_t v18 = 0;
          }
          uint64_t v20 = 8 * (v13 - 9 >= v25);
        }
        goto LABEL_59;
      case '\\':
      case ']':
      case '^':
        goto LABEL_59;
      case '_':
        if (a6 != 16) {
          goto LABEL_7;
        }
        unint64_t v17 = v13 - 1;
        unint64_t v70 = v13 - 1;
        v71 = (unsigned __int8 *)(v12 + 1);
        unint64_t v26 = objc_opt_new();
        if (v13 == 1) {
          goto LABEL_54;
        }
        char v65 = 0;
        BOOL v27 = v67;
        break;
      default:
        v69 = 0;
        uint64_t v20 = 0;
        goto LABEL_59;
    }
    while (1)
    {
      int v28 = *v71;
      if (v28 == 255) {
        break;
      }
      BOOL v29 = (v14 & 0x20) == 0;
      if ((v28 & 0xE0) != 0x40) {
        BOOL v29 = 1;
      }
      int v30 = (v14 >> 5) & 1;
      if ((v28 & 0xE0) != 0x60) {
        int v30 = 1;
      }
      BOOL v31 = !v29 || v30 == 0;
      if (v31 || (v28 | 0x20) == 0x7F) {
        goto LABEL_55;
      }
      long long v32 = +[CBOR decodeMajorType2And3FromBuffer:&v71 length:&v70 tag:0 indefiniteLenContainerType:v15 noCopy:v27];
      long long v33 = v32;
      if (v32 && [v32 type] == v15)
      {
        [v33 data];
        v35 = long long v34 = v26;
        [v34 appendData:v35];

        unint64_t v26 = v34;
      }
      else
      {

        unint64_t v26 = 0;
        unint64_t v70 = 0;
        char v65 = 1;
      }

      unint64_t v17 = v70;
      BOOL v27 = v67;
      if (!v70)
      {
        char v36 = v65;
        if (v65)
        {
          unint64_t v17 = 0;
        }
        else
        {
LABEL_54:
          unint64_t v17 = 0;
LABEL_55:
          char v36 = 1;
        }
LABEL_56:
        v69 = v26;
        int v37 = v36 & 1;
        goto LABEL_57;
      }
    }
    char v36 = v65;
    if (v65) {
      goto LABEL_56;
    }
    int v37 = 0;
    --v17;
    v69 = v26;
    unint64_t v70 = v17;
    ++v71;
LABEL_57:
    unint64_t v18 = 0;
    int v19 = 0;
    uint64_t v20 = 0;
    int v21 = v37 != 0;
  }
  else
  {
    unint64_t v18 = v14 & 0x1F;
    if (v13 >= v18)
    {
      int v19 = 0;
      int v21 = 0;
      uint64_t v20 = 0;
      unint64_t v17 = v13 - 1;
      v69 = 0;
      unint64_t v70 = v13 - 1;
      v71 = (unsigned __int8 *)(v12 + 1);
    }
    else
    {
      unint64_t v18 = 0;
      int v19 = 0;
      v69 = 0;
      uint64_t v20 = 0;
      int v21 = 1;
    }
  }
LABEL_59:
  v38 = a3;
  int v39 = v19;
  if (v18 > v17) {
    int v40 = 1;
  }
  else {
    int v40 = v21;
  }
  v41 = objc_msgSend(v11, "numeric", v20);
  v68 = v41;
  if (v41)
  {
    if ([v41 unsignedIntValue] == 24) {
      int v42 = (v14 >> 5) & 1;
    }
    else {
      int v42 = 0;
    }
    if ((v42 | v40)) {
      goto LABEL_67;
    }
LABEL_69:
    v43 = v69;
    if (v69)
    {
      if ((v14 & 0x20) != 0)
      {
        if ([v69 length])
        {
          id v44 = [NSString alloc];
          id v45 = v69;
          uint64_t v46 = [v45 bytes];
          uint64_t v47 = [v45 length];
          if (v67) {
            uint64_t v48 = [v44 initWithBytesNoCopy:v46 length:v47 encoding:4 freeWhenDone:0];
          }
          else {
            uint64_t v48 = [v44 initWithBytes:v46 length:v47 encoding:4];
          }
          v53 = (void *)v48;
          v43 = v69;
          goto LABEL_85;
        }
LABEL_84:
        v53 = objc_opt_new();
LABEL_85:
        v54 = [CBOR alloc];
        uint64_t v55 = 3;
LABEL_86:
        v52 = [(CBOR *)v54 initWithType:v55 value:v53 valueSize:0 tag:v11];

        goto LABEL_87;
      }
      v49 = [CBOR alloc];
      uint64_t v50 = 2;
      v51 = v69;
    }
    else
    {
      if (!v39)
      {
        if (!v18)
        {
          if ((v14 & 0x20) == 0)
          {
            v53 = objc_opt_new();
            v54 = [CBOR alloc];
            uint64_t v55 = 2;
            goto LABEL_86;
          }
          goto LABEL_84;
        }
        if (v18 > v70)
        {
          v16 = 0;
          *a4 = 0;
          goto LABEL_89;
        }
        if ((v14 & 0x20) != 0)
        {
          id v58 = [NSString alloc];
          if (v67) {
            uint64_t v59 = [v58 initWithBytesNoCopy:v71 length:v18 encoding:4 freeWhenDone:0];
          }
          else {
            uint64_t v59 = [v58 initWithBytes:v71 length:v18 encoding:4];
          }
          v62 = (void *)v59;
          v63 = [CBOR alloc];
          uint64_t v64 = 3;
        }
        else
        {
          id v60 = objc_alloc(MEMORY[0x263EFF8F8]);
          if (v67) {
            uint64_t v61 = [v60 initWithBytesNoCopy:v71 length:v18 freeWhenDone:0];
          }
          else {
            uint64_t v61 = [v60 initWithBytes:v71 length:v18];
          }
          v62 = (void *)v61;
          v63 = [CBOR alloc];
          uint64_t v64 = 2;
        }
        v52 = [(CBOR *)v63 initWithType:v64 value:v62 valueSize:v66 tag:v11];

        v43 = 0;
        v70 -= v18;
        v71 += v18;
LABEL_87:
        unint64_t v56 = v70;
        if (&v71[v70] > (unsigned __int8 *)&v12[v13]) {
          __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType2And3FromBuffer:length:tag:indefiniteLenContainerType:noCopy:]", "CBOR+decoder.m", 541, "buffer + bufferSize <= endOfBuffer");
        }
        *v38 = (const char *)v71;
        *a4 = v56;
        v16 = v52;
        goto LABEL_89;
      }
      v49 = [CBOR alloc];
      uint64_t v50 = 16;
      v51 = 0;
    }
    v52 = [(CBOR *)v49 initWithType:v50 value:v51 valueSize:0 tag:v11];
    goto LABEL_87;
  }
  if (!v40) {
    goto LABEL_69;
  }
LABEL_67:
  v16 = 0;
  *a4 = 0;
  v43 = v69;
LABEL_89:

LABEL_90:
  return v16;
}

+ (id)decodeMajorType4FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 recursionLevel:(int)a6 keepKeyOrdering:(BOOL)a7 noCopy:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a5;
  uint64_t v15 = v14;
  v16 = *a3;
  id v45 = *a3;
  unint64_t v17 = *a4;
  if (!*a4) {
    goto LABEL_41;
  }
  unsigned int v18 = *(unsigned __int8 *)v16;
  id v42 = v14;
  if (v18 > 0x97)
  {
    switch(*v16)
    {
      case 0x98:
        unint64_t v44 = v17 - 1;
        id v45 = v16 + 1;
        if (v17 == 1) {
          goto LABEL_17;
        }
        unint64_t v20 = *((unsigned __int8 *)v16 + 1);
        unint64_t v21 = v17 - 2;
        unint64_t v44 = v17 - 2;
        id v45 = v16 + 2;
        uint64_t v19 = 1;
        goto LABEL_4;
      case 0x99:
        unint64_t v44 = v17 - 1;
        id v45 = v16 + 1;
        if (v17 - 1 < 2) {
          goto LABEL_17;
        }
        unint64_t v20 = bswap32(*(unsigned __int16 *)(v16 + 1)) >> 16;
        unint64_t v21 = v17 - 3;
        unint64_t v44 = v17 - 3;
        id v45 = v16 + 3;
        uint64_t v19 = 2;
        goto LABEL_4;
      case 0x9A:
        unint64_t v44 = v17 - 1;
        id v45 = v16 + 1;
        if (v17 - 1 < 4) {
          goto LABEL_17;
        }
        unint64_t v20 = bswap32(*(_DWORD *)(v16 + 1));
        unint64_t v21 = v17 - 5;
        unint64_t v44 = v17 - 5;
        id v45 = v16 + 5;
        uint64_t v19 = 4;
        goto LABEL_4;
      case 0x9B:
        unint64_t v44 = v17 - 1;
        id v45 = v16 + 1;
        if (v17 - 1 >= 8)
        {
          unint64_t v20 = bswap64(*(void *)(v16 + 1));
          unint64_t v21 = v17 - 9;
          unint64_t v44 = v17 - 9;
          id v45 = v16 + 9;
          uint64_t v19 = 8;
          goto LABEL_4;
        }
LABEL_17:
        unint64_t v20 = 0;
        uint64_t v19 = 0;
        goto LABEL_18;
      case 0x9F:
        int v39 = a3;
        v41 = a4;
        unint64_t v44 = v17 - 1;
        id v45 = v16 + 1;
        unint64_t v23 = objc_opt_new();
        uint64_t v31 = (a6 + 1);
        break;
      default:
        unint64_t v22 = [[CBOR alloc] initWithType:16 value:0 valueSize:0 tag:v14];
        unint64_t v29 = 0;
        unint64_t v44 = 0;
        int v30 = v16;
        goto LABEL_43;
    }
    while (1)
    {
      long long v32 = (void *)MEMORY[0x21D468040]();
      long long v33 = [a1 decodeFromBytes:&v45 length:&v44 recursionLevel:v31 keepKeyOrdering:v9 noCopy:v8];
      if (!v33) {
        break;
      }
      long long v34 = v33;
      if ([v33 type] != 15) {
        [v23 addObject:v34];
      }
      uint64_t v35 = objc_msgSend(v34, "type", v39);

      if (v35 == 15)
      {
        uint64_t v40 = 0;
        goto LABEL_35;
      }
    }
    uint64_t v40 = 0;
LABEL_37:
    char v28 = 1;
    goto LABEL_38;
  }
  uint64_t v19 = 0;
  unint64_t v20 = v18 & 0x1F;
  unint64_t v21 = v17 - 1;
  unint64_t v44 = v17 - 1;
  id v45 = v16 + 1;
LABEL_4:
  if (v21 < v20)
  {
    uint64_t v15 = v14;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_218327000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
    }
    unint64_t v22 = 0;
    *a4 = 0;
    goto LABEL_45;
  }
LABEL_18:
  int v39 = a3;
  uint64_t v40 = v19;
  v41 = a4;
  unint64_t v23 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v20];
  if (!v20)
  {
LABEL_35:
    char v28 = 0;
LABEL_38:
    uint64_t v15 = v42;
    goto LABEL_39;
  }
  uint64_t v24 = (a6 + 1);
  while (v44 >= v20)
  {
    unint64_t v25 = (void *)MEMORY[0x21D468040]();
    uint64_t v26 = [a1 decodeFromBytes:&v45 length:&v44 recursionLevel:v24 keepKeyOrdering:v9 noCopy:v8];
    if (!v26)
    {
      goto LABEL_37;
    }
    BOOL v27 = (void *)v26;
    [v23 addObject:v26];

    if (!--v20) {
      goto LABEL_35;
    }
  }
  uint64_t v15 = v42;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_218327000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
  }
  char v28 = 1;
LABEL_39:
  char v36 = [CBOR alloc];
  int v37 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v23 copyItems:0];
  unint64_t v22 = [(CBOR *)v36 initWithType:4 value:v37 valueSize:v40 tag:v15];

  if (v28)
  {
    unint64_t *v41 = 0;

LABEL_41:
    unint64_t v22 = 0;
    goto LABEL_45;
  }
  unint64_t v29 = v44;
  int v30 = v45;
  a4 = v41;
  a3 = v39;
LABEL_43:
  if (&v30[v29] > &v16[v17]) {
    __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType4FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:]", "CBOR+decoder.m", 697, "buffer + bufferSize <= endOfBuffer");
  }
  *a3 = v30;
  *a4 = v29;
LABEL_45:

  return v22;
}

+ (id)decodeMajorType5FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5 recursionLevel:(int)a6 keepKeyOrdering:(BOOL)a7 noCopy:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a5;
  uint64_t v15 = *a3;
  v51 = *a3;
  unint64_t v16 = *a4;
  if (*a4)
  {
    unsigned int v17 = *(unsigned __int8 *)v15;
    if (v17 > 0xB7)
    {
      switch(*v15)
      {
        case 0xB8:
          unint64_t v20 = v16 - 1;
          unint64_t v50 = v16 - 1;
          v51 = v15 + 1;
          if (v16 == 1) {
            goto LABEL_14;
          }
          unint64_t v19 = *((unsigned __int8 *)v15 + 1);
          unint64_t v20 = v16 - 2;
          unint64_t v50 = v16 - 2;
          v51 = v15 + 2;
          uint64_t v18 = 1;
          goto LABEL_15;
        case 0xB9:
          unint64_t v20 = v16 - 1;
          unint64_t v50 = v16 - 1;
          v51 = v15 + 1;
          if (v16 - 1 < 2) {
            goto LABEL_14;
          }
          unint64_t v19 = bswap32(*(unsigned __int16 *)(v15 + 1)) >> 16;
          unint64_t v20 = v16 - 3;
          unint64_t v50 = v16 - 3;
          v51 = v15 + 3;
          uint64_t v18 = 2;
          goto LABEL_15;
        case 0xBA:
          unint64_t v20 = v16 - 1;
          unint64_t v50 = v16 - 1;
          v51 = v15 + 1;
          if (v16 - 1 < 4) {
            goto LABEL_14;
          }
          unint64_t v19 = bswap32(*(_DWORD *)(v15 + 1));
          unint64_t v20 = v16 - 5;
          unint64_t v50 = v16 - 5;
          v51 = v15 + 5;
          uint64_t v18 = 4;
          goto LABEL_15;
        case 0xBB:
          unint64_t v20 = v16 - 1;
          unint64_t v50 = v16 - 1;
          v51 = v15 + 1;
          if (v16 - 1 <= 7)
          {
LABEL_14:
            uint64_t v18 = 0;
            unint64_t v19 = 0;
            goto LABEL_15;
          }
          unint64_t v19 = bswap64(*(void *)(v15 + 1));
          unint64_t v20 = v16 - 9;
          unint64_t v50 = v16 - 9;
          v51 = v15 + 9;
          if ((v19 & 0x8000000000000000) == 0)
          {
            uint64_t v18 = 8;
            goto LABEL_15;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_218327000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
          }
          goto LABEL_49;
        case 0xBF:
          uint64_t v46 = a3;
          unint64_t v47 = *a4;
          id v45 = v15;
          unint64_t v50 = v16 - 1;
          v51 = v15 + 1;
          unint64_t v21 = objc_opt_new();
          uint64_t v48 = objc_opt_new();
          long long v32 = (void *)MEMORY[0x21D468040]();
          uint64_t v33 = (a6 + 1);
          uint64_t v34 = [a1 decodeFromBytes:&v51 length:&v50 recursionLevel:v33 keepKeyOrdering:v9 noCopy:v8];
          if (!v34) {
            goto LABEL_44;
          }
          uint64_t v35 = (void *)v34;
          break;
        default:
          unint64_t v47 = *a4;
          unint64_t v29 = [[CBOR alloc] initWithType:16 value:0 valueSize:0 tag:v14];
          unint64_t v30 = 0;
          unint64_t v50 = 0;
          uint64_t v31 = v15;
          goto LABEL_41;
      }
      while (1)
      {
        if ([v35 type] == 15)
        {

          uint64_t v44 = 0;
          goto LABEL_38;
        }
        uint64_t v36 = [a1 decodeFromBytes:&v51 length:&v50 recursionLevel:v33 keepKeyOrdering:v9 noCopy:v8];
        if (!v36) {
          break;
        }
        int v37 = (void *)v36;
        [v21 addObject:v35];
        [v48 addObject:v37];

        long long v32 = (void *)MEMORY[0x21D468040]();
        uint64_t v35 = [a1 decodeFromBytes:&v51 length:&v50 recursionLevel:v33 keepKeyOrdering:v9 noCopy:v8];
        if (!v35) {
          goto LABEL_44;
        }
      }

LABEL_44:
      goto LABEL_45;
    }
    uint64_t v18 = 0;
    unint64_t v19 = v17 & 0x1F;
    unint64_t v20 = v16 - 1;
    unint64_t v50 = v16 - 1;
    v51 = v15 + 1;
LABEL_15:
    if (v20 < 2 * v19)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_218327000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
      }
      goto LABEL_46;
    }
    uint64_t v44 = v18;
    id v45 = v15;
    uint64_t v46 = a3;
    unint64_t v47 = v16;
    unint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v19];
    uint64_t v48 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v19];
    if (v19)
    {
      id v42 = a4;
      id v43 = v14;
      uint64_t v22 = (a6 + 1);
      unint64_t v23 = 2 * v19 + 2;
      while (1)
      {
        v23 -= 2;
        if (v50 < v23) {
          break;
        }
        uint64_t v24 = (void *)MEMORY[0x21D468040]();
        uint64_t v25 = [a1 decodeFromBytes:&v51 length:&v50 recursionLevel:v22 keepKeyOrdering:v9 noCopy:v8];
        if (!v25) {
          goto LABEL_36;
        }
        uint64_t v26 = (void *)v25;
        uint64_t v27 = [a1 decodeFromBytes:&v51 length:&v50 recursionLevel:v22 keepKeyOrdering:v9 noCopy:v8];
        if (!v27)
        {

LABEL_36:
          a4 = v42;
          id v14 = v43;
          goto LABEL_45;
        }
        char v28 = (void *)v27;
        --v19;
        [v21 addObject:v26];
        [v48 addObject:v28];

        if (!v19)
        {
          a4 = v42;
          id v14 = v43;
          goto LABEL_38;
        }
      }
      a4 = v42;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_218327000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Number of items is greater than buffer size", buf, 2u);
      }
      id v14 = v43;
LABEL_45:

LABEL_46:
      unint64_t v29 = 0;
      *a4 = 0;
      goto LABEL_50;
    }
LABEL_38:
    v38 = [CBOR alloc];
    int v39 = (void *)[objc_alloc(NSDictionary) initWithObjects:v48 forKeys:v21];
    unint64_t v29 = [(CBOR *)v38 initWithType:5 value:v39 valueSize:v44 tag:v14];

    if (v9)
    {
      uint64_t v40 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v21 copyItems:0];
      [(CBOR *)v29 setOrderedKeys:v40];
    }
    unint64_t v30 = v50;
    uint64_t v31 = v51;
    uint64_t v15 = v45;
    a3 = v46;
LABEL_41:
    if (&v31[v30] > &v15[v47]) {
      __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType5FromBuffer:length:tag:recursionLevel:keepKeyOrdering:noCopy:]", "CBOR+decoder.m", 896, "buffer + bufferSize <= endOfBuffer");
    }
    *a3 = v31;
    *a4 = v30;
  }
  else
  {
LABEL_49:
    unint64_t v29 = 0;
  }
LABEL_50:

  return v29;
}

+ (id)decodeMajorType6FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5
{
  id v7 = a5;
  unint64_t v8 = *a4;
  if (*a4)
  {
    BOOL v9 = *a3;
    uint64_t v10 = **a3 & 0x3F;
    if (v10 > 0x17)
    {
      switch(**a3 & 0x3F)
      {
        case 0x18:
          if (v8 == 1) {
            goto LABEL_18;
          }
          id v11 = (void *)[objc_alloc(NSNumber) initWithInt:v9[1]];
          uint64_t v12 = [[CBOR alloc] initWithType:14 value:v11 valueSize:1 tag:v7];
          unint64_t v13 = v8 - 2;
          uint64_t v14 = 2;
          goto LABEL_4;
        case 0x19:
          unint64_t v13 = v8 - 3;
          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_18;
          }
          id v11 = (void *)[objc_alloc(NSNumber) initWithShort:((int)bswap32(*(unsigned __int16 *)(v9 + 1)) >> 16)];
          uint64_t v12 = [[CBOR alloc] initWithType:14 value:v11 valueSize:2 tag:v7];
          uint64_t v14 = 3;
          goto LABEL_4;
        case 0x1A:
          unint64_t v13 = v8 - 5;
          if (v8 - 5 > 0xFFFFFFFFFFFFFFFBLL) {
            goto LABEL_18;
          }
          id v11 = (void *)[objc_alloc(NSNumber) initWithInt:bswap32(*(_DWORD *)(v9 + 1))];
          uint64_t v12 = [[CBOR alloc] initWithType:14 value:v11 valueSize:4 tag:v7];
          uint64_t v14 = 5;
          goto LABEL_4;
        case 0x1B:
          unint64_t v13 = v8 - 9;
          if (v8 - 9 <= 0xFFFFFFFFFFFFFFF7)
          {
            id v11 = (void *)[objc_alloc(NSNumber) initWithLongLong:bswap64(*(void *)(v9 + 1))];
            uint64_t v12 = [[CBOR alloc] initWithType:14 value:v11 valueSize:8 tag:v7];
            uint64_t v14 = 9;
            goto LABEL_4;
          }
LABEL_18:
          unint64_t v13 = 0;
          uint64_t v12 = 0;
          break;
        default:
          uint64_t v12 = 0;
          unint64_t v13 = 0;
          uint64_t v15 = *a3;
          goto LABEL_5;
      }
    }
    else
    {
      id v11 = (void *)[objc_alloc(NSNumber) initWithInt:v10];
      uint64_t v12 = [[CBOR alloc] initWithType:14 value:v11 valueSize:0 tag:v7];
      unint64_t v13 = v8 - 1;
      uint64_t v14 = 1;
LABEL_4:
      uint64_t v15 = &v9[v14];

LABEL_5:
      if (&v15[v13] > &v9[v8]) {
        __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType6FromBuffer:length:tag:]", "CBOR+decoder.m", 1003, "buffer + bufferSize <= endOfBuffer");
      }
      *a3 = v15;
    }
    *a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)decodeMajorType7FromBuffer:(const char *)a3 length:(unint64_t *)a4 tag:(id)a5
{
  id v7 = a5;
  unint64_t v8 = *a4;
  if (*a4)
  {
    BOOL v9 = *a3;
    uint64_t v10 = **a3 & 0x1F;
    if (v10 > 0x17)
    {
      uint64_t v15 = *a3;
      uint64_t v14 = 0;
      unint64_t v16 = *a4;
      switch(**a3 & 0x1F)
      {
        case 0x18:
          if (v8 == 1) {
            goto LABEL_22;
          }
          unsigned int v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:*((unsigned __int8 *)v9 + 1)];
          uint64_t v14 = [[CBOR alloc] initWithType:13 value:v17 valueSize:1 tag:v7];
          unint64_t v16 = v8 - 2;
          uint64_t v15 = v9 + 2;
          goto LABEL_32;
        case 0x19:
          unint64_t v16 = v8 - 3;
          if (v8 - 3 > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_22;
          }
          unsigned int v20 = *((unsigned __int8 *)v9 + 1);
          int v21 = (char)v20;
          int v22 = (v20 >> 2) & 0x1F;
          int v23 = *((unsigned __int8 *)v9 + 2) | ((v20 & 3) << 8);
          if (v22 == 31)
          {
            if (v23) {
              double v29 = NAN;
            }
            else {
              double v29 = INFINITY;
            }
          }
          else
          {
            if (v22)
            {
              double v24 = (double)(v23 | 0x400);
              int v25 = v22 - 25;
            }
            else
            {
              double v24 = (double)v23;
              int v25 = -24;
            }
            double v29 = ldexp(v24, v25);
          }
          id v30 = objc_alloc(NSNumber);
          double v31 = -v29;
          if (v21 >= 0) {
            double v31 = v29;
          }
          unsigned int v17 = (void *)[v30 initWithDouble:v31];
          uint64_t v14 = [[CBOR alloc] initWithType:6 value:v17 valueSize:2 tag:v7];
          uint64_t v15 = v9 + 3;
          goto LABEL_32;
        case 0x1A:
          unint64_t v16 = v8 - 5;
          if (v8 - 5 > 0xFFFFFFFFFFFFFFFBLL) {
            goto LABEL_22;
          }
          unsigned int v26 = bswap32(*(_DWORD *)(v9 + 1));
          id v27 = objc_alloc(NSNumber);
          LODWORD(v28) = v26;
          unsigned int v17 = (void *)[v27 initWithFloat:v28];
          uint64_t v14 = [[CBOR alloc] initWithType:7 value:v17 valueSize:4 tag:v7];
          uint64_t v15 = v9 + 5;
          goto LABEL_32;
        case 0x1B:
          unint64_t v16 = v8 - 9;
          if (v8 - 9 > 0xFFFFFFFFFFFFFFF7)
          {
LABEL_22:
            unint64_t v16 = 0;
            uint64_t v14 = 0;
            goto LABEL_35;
          }
          unsigned int v17 = (void *)[objc_alloc(NSNumber) initWithDouble:COERCE_DOUBLE(bswap64(*(void *)(v9 + 1)))];
          uint64_t v14 = [[CBOR alloc] initWithType:8 value:v17 valueSize:8 tag:v7];
          uint64_t v15 = v9 + 9;
LABEL_32:

          break;
        case 0x1F:
          unint64_t v16 = v8 - 1;
          uint64_t v15 = v9 + 1;
          uint64_t v14 = [[CBOR alloc] initWithType:15 value:0 valueSize:0 tag:v7];
          break;
        default:
          break;
      }
    }
    else
    {
      switch(**a3 & 0x1F)
      {
        case 0x14:
          id v11 = (void *)[objc_alloc(NSNumber) initWithBool:0];
          uint64_t v12 = [CBOR alloc];
          uint64_t v13 = 9;
          break;
        case 0x15:
          id v11 = (void *)[objc_alloc(NSNumber) initWithBool:1];
          uint64_t v12 = [CBOR alloc];
          uint64_t v13 = 10;
          break;
        case 0x16:
          uint64_t v18 = [CBOR alloc];
          id v11 = [MEMORY[0x263EFF9D0] null];
          uint64_t v12 = v18;
          uint64_t v13 = 11;
          break;
        case 0x17:
          unint64_t v19 = [CBOR alloc];
          id v11 = [MEMORY[0x263EFF9D0] null];
          uint64_t v12 = v19;
          uint64_t v13 = 12;
          break;
        default:
          id v11 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v10];
          uint64_t v12 = [CBOR alloc];
          uint64_t v13 = 13;
          break;
      }
      uint64_t v14 = [(CBOR *)v12 initWithType:v13 value:v11 valueSize:0 tag:v7];

      unint64_t v16 = v8 - 1;
      uint64_t v15 = v9 + 1;
    }
    if (&v15[v16] > &v9[v8]) {
      __assert_rtn("+[CBOR(Decoder_Private) decodeMajorType7FromBuffer:length:tag:]", "CBOR+decoder.m", 1137, "buffer + bufferSize <= endOfBuffer");
    }
    *a3 = v15;
LABEL_35:
    *a4 = v16;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = [CBOR alloc];
  id value = self->_value;
  int64_t valueSize = self->_valueSize;
  unint64_t type = self->_type;
  tag = self->_tag;
  return [(CBOR *)v4 initWithType:type value:value valueSize:valueSize tag:tag];
}

- (CBOR)initWithType:(unint64_t)a3 value:(id)a4 valueSize:(int64_t)a5 tag:(id)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CBOR;
  uint64_t v13 = [(CBOR *)&v33 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_unint64_t type = a3;
    p_id value = &v13->_value;
    objc_storeStrong(&v13->_value, a4);
    v14->_int64_t valueSize = a5;
    p_tag = (id *)&v14->_tag;
    objc_storeStrong((id *)&v14->_tag, a6);
    uint64_t v17 = v14->_valueSize ^ v14->_type;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = v11;
      id v18 = v14->_value;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v18);
            }
            int v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            double v24 = [v18 objectForKeyedSubscript:v23];
            uint64_t v25 = [v23 hash] ^ v17;
            uint64_t v17 = v25 ^ [v24 hash];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v20);
      }

      id v11 = v32;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v26 = *p_value;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v35 != v29) {
                objc_enumerationMutation(v26);
              }
              v17 ^= [*(id *)(*((void *)&v34 + 1) + 8 * j) hash];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v28);
        }
      }
      else if (*p_value && [*p_value conformsToProtocol:&unk_26C988AE8])
      {
        v17 ^= [*p_value hash];
      }
    }
    if (*p_tag) {
      v17 ^= [*p_tag hash];
    }
    v14->_cachedHash = v17;
  }

  return v14;
}

- (CBOR)initWithCbor:(id)a3 tag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 type];
  BOOL v9 = [v7 value];
  uint64_t v10 = [v7 valueSize];

  id v11 = [(CBOR *)self initWithType:v8 value:v9 valueSize:v10 tag:v6];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (CBOR *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if ([(CBOR *)v6 type] == self->_type)
    {
      unint64_t v7 = [(CBOR *)self hash];
      BOOL v8 = v7 == [(CBOR *)v6 hash];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)longLongValue
{
  unint64_t type = self->_type;
  if (type != 13 && type != 1) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id value = self->_value;
  return [value longLongValue];
}

- (unint64_t)unsignedLongLongValue
{
  unint64_t type = self->_type;
  BOOL v3 = type > 0xE;
  uint64_t v4 = (1 << type) & 0x6001;
  if (v3 || v4 == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id value = self->_value;
  return [value unsignedLongLongValue];
}

- (double)doubleValue
{
  if (self->_type - 6 > 2) {
    return 0.0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0.0;
  }
  id value = self->_value;
  [value doubleValue];
  return result;
}

- (NSNumber)numeric
{
  unint64_t type = self->_type;
  BOOL v3 = type > 0xE;
  uint64_t v4 = (1 << type) & 0x61C3;
  BOOL v5 = v3 || v4 == 0;
  if (v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    id v7 = &unk_26C987C50;
  }
  else {
    id v7 = self->_value;
  }
  return (NSNumber *)v7;
}

- (BOOL)BOOLValue
{
  unint64_t type = self->_type;
  if (type == 10) {
    return 1;
  }
  if (type == 9) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id value = self->_value;
  return [value BOOLValue];
}

- (NSString)string
{
  unint64_t type = self->_type;
  if (type != 3)
  {
LABEL_5:
    if (type == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id value = self->_value;
      id v6 = (objc_class *)NSString;
      id v7 = value;
      id v8 = [v6 alloc];
      id v9 = v7;
      uint64_t v10 = [v9 bytes];
      uint64_t v11 = [v9 length];

      id v4 = (id)[v8 initWithBytes:v10 length:v11 encoding:4];
    }
    else
    {
      id v4 = 0;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t type = self->_type;
    goto LABEL_5;
  }
  id v4 = self->_value;
LABEL_9:
  return (NSString *)v4;
}

- (NSData)data
{
  unint64_t type = self->_type;
  if (type != 3)
  {
LABEL_5:
    if (type == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v4 = self->_value;
    }
    else {
      id v4 = 0;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t type = self->_type;
    goto LABEL_5;
  }
  id v4 = [self->_value dataUsingEncoding:4];
LABEL_9:
  return (NSData *)v4;
}

- (NSArray)array
{
  if (self->_type == 4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }
  return (NSArray *)v3;
}

- (NSDictionary)dictionary
{
  if (self->_type == 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_value;
  }
  else {
    id v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (NSDate)date
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (self->_type != 3) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  id v3 = [(CBOR *)self->_tag numeric];
  int v4 = [v3 intValue];

  if (v4 == 1004)
  {
    int v23 = _getRFC3339DateFormatter(0);
    id v9 = [v23 dateFromString:self->_value];

    goto LABEL_18;
  }
  if (v4)
  {
LABEL_17:
    id v9 = 0;
    goto LABEL_18;
  }
  id v5 = self->_value;
  uint64_t v6 = [v5 cStringUsingEncoding:4];
  if (!v6) {
    goto LABEL_48;
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v5 lengthOfBytesUsingEncoding:4];
  if ((unint64_t)v8 < 0x14 || *(unsigned char *)(v7 + 10) != 84) {
    goto LABEL_48;
  }
  id v9 = 0;
  uint64_t v10 = (char *)(v7 + v8);
  memset(&v33, 0, sizeof(v33));
  id v12 = (char *)(v7 + 19);
  unsigned int v11 = *(unsigned __int8 *)(v7 + 19);
  if (v11 <= 0x2D)
  {
    if (v11 != 43 && v11 != 45) {
      goto LABEL_49;
    }
    int v13 = *(v10 - 1);
    long long v34 = 0;
    uint64_t v35 = 0;
    char v37 = 0;
    uint64_t v36 = 0;
    __strlcpy_chk();
    double v14 = -1.0;
    if (v13 == 90) {
      goto LABEL_12;
    }
LABEL_45:
    if (v10 - v12 == 6 && v12[3] == 58)
    {
      __strlcpy_chk();
      __strlcpy_chk();
      uint64_t v15 = "%Y-%m-%dT%H:%M:%S%z";
      goto LABEL_13;
    }
LABEL_48:
    id v9 = 0;
    goto LABEL_49;
  }
  if (v11 == 46)
  {
    if (v8 < 21) {
      goto LABEL_48;
    }
    uint64_t v26 = 20;
    do
    {
      int v27 = *(unsigned __int8 *)(v7 + v26);
      if ((v27 - 43) <= 0x2F && ((1 << (v27 - 43)) & 0x800000000005) != 0)
      {
        unint64_t v29 = v26 - 20;
        id v30 = (char *)(v7 + v26);
        goto LABEL_37;
      }
      if (((char)v27 - 48) > 9) {
        goto LABEL_48;
      }
      ++v26;
      id v30 = (char *)(v7 + v26);
    }
    while (v7 + v26 < (unint64_t)v10);
    unint64_t v29 = v26 - 20;
LABEL_37:
    id v9 = 0;
    if (v30 == v10 || !v29 || v29 > 3) {
      goto LABEL_49;
    }
    long long v34 = &v12[v29];
    double v31 = strtod((const char *)(v7 + 19), &v34);
    if (v34 == v12) {
      goto LABEL_48;
    }
    double v14 = v31;
    int v32 = *(v10 - 1);
    if (*v30 == 90 && v32 != 90) {
      goto LABEL_48;
    }
    long long v34 = 0;
    uint64_t v35 = 0;
    char v37 = 0;
    uint64_t v36 = 0;
    __strlcpy_chk();
    if (v32 == 90)
    {
LABEL_12:
      uint64_t v15 = "%Y-%m-%dT%H:%M:%S";
LABEL_13:
      unint64_t v16 = strptime_l((const char *)&v34, v15, &v33, 0);
      if (v16 && !*v16)
      {
        id v17 = objc_alloc(MEMORY[0x263EFF910]);
        time_t v18 = mktime(&v33);
        uint64_t v19 = objc_msgSend(v17, "initWithTimeIntervalSince1970:", (double)v18, *(_OWORD *)&v33.tm_sec, *(_OWORD *)&v33.tm_mon, *(_OWORD *)&v33.tm_isdst, v33.tm_zone);
        uint64_t v20 = v19;
        if (v14 <= 0.0)
        {
          id v21 = v19;
        }
        else
        {
          id v21 = [v19 dateByAddingTimeInterval:v14];
        }
        id v9 = v21;

        goto LABEL_49;
      }
      goto LABEL_48;
    }
    id v12 = v30;
    goto LABEL_45;
  }
  if (v11 == 90)
  {
    if (v8 > 20 || !strptime_l((const char *)v7, "%Y-%m-%dT%H:%M:%S", &v33, 0)) {
      goto LABEL_48;
    }
    id v24 = objc_alloc(MEMORY[0x263EFF910]);
    time_t v25 = timegm(&v33);
    id v9 = objc_msgSend(v24, "initWithTimeIntervalSince1970:", (double)v25, *(_OWORD *)&v33.tm_sec, *(_OWORD *)&v33.tm_mon, *(_OWORD *)&v33.tm_isdst, v33.tm_zone);
  }
LABEL_49:

LABEL_18:
  return (NSDate *)v9;
}

- (BOOL)isWholeNumber
{
  return (self->_type < 0xE) & (0x2003u >> self->_type);
}

- (BOOL)isFloatNumber
{
  return self->_type - 6 < 3;
}

- (BOOL)isBoolean
{
  return self->_type - 9 < 2;
}

- (BOOL)isDate
{
  if (self->_type != 3) {
    return 0;
  }
  tag = self->_tag;
  if (!tag) {
    return 0;
  }
  int v4 = [(CBOR *)tag numeric];
  if ([v4 intValue])
  {
    id v5 = [(CBOR *)self->_tag numeric];
    BOOL v6 = [v5 intValue] == 1004;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isEmbeddedCBORData
{
  if (self->_type != 2) {
    return 0;
  }
  tag = self->_tag;
  if (!tag) {
    return 0;
  }
  id v3 = [(CBOR *)tag numeric];
  BOOL v4 = [v3 intValue] == 24;

  return v4;
}

- (id)description
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  tag = self->_tag;
  if (tag)
  {
    id v5 = [(CBOR *)tag description];
    [v3 appendFormat:@"(%@)", v5];
  }
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"unsigned int<%@>", self->_value];
      goto LABEL_20;
    case 1uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"negative int<%@>", self->_value];
      goto LABEL_20;
    case 2uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"byte string<%@>", self->_value];
      goto LABEL_20;
    case 3uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"UTF8 string<%@>", self->_value];
      goto LABEL_20;
    case 4uLL:
      uint64_t v7 = @"array";
      break;
    case 5uLL:
      uint64_t v7 = @"dictionary";
      break;
    case 6uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"half float<%@>", self->_value];
      goto LABEL_20;
    case 7uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"single float<%@>", self->_value];
      goto LABEL_20;
    case 8uLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"double float<%@>", self->_value];
      goto LABEL_20;
    case 9uLL:
      uint64_t v7 = @"false";
      break;
    case 0xAuLL:
      uint64_t v7 = @"true";
      break;
    case 0xBuLL:
      uint64_t v7 = @"null";
      break;
    case 0xCuLL:
      uint64_t v7 = @"undefined";
      break;
    case 0xDuLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"simple<%@>", self->_value];
      goto LABEL_20;
    case 0xEuLL:
      uint64_t v6 = [[NSString alloc] initWithFormat:@"tag<%@>", self->_value];
LABEL_20:
      uint64_t v7 = (__CFString *)v6;
      break;
    case 0xFuLL:
      uint64_t v7 = @"break";
      break;
    case 0x10uLL:
      uint64_t v7 = @"uknown";
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  [v3 appendString:v7];
  unint64_t type = self->_type;
  if (type == 4)
  {
    id v21 = self->_value;
    [v3 appendString:@"<["];
    uint64_t v22 = [v21 count];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v21;
    uint64_t v23 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      double v31 = v7;
      uint64_t v25 = *(void *)v34;
      do
      {
        uint64_t v26 = 0;
        uint64_t v27 = v22;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v11);
          }
          uint64_t v28 = [*(id *)(*((void *)&v33 + 1) + 8 * v26) description];
          [v3 appendFormat:@"%@", v28];

          if (v27 >= 2) {
            [v3 appendString:@", "];
          }
          ++v26;
          --v27;
        }
        while (v24 != v26);
        v22 -= v24;
        uint64_t v24 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v24);
      uint64_t v7 = v31;
    }
    uint64_t v20 = @"]>";
  }
  else
  {
    if (type != 5) {
      goto LABEL_46;
    }
    id v9 = self->_value;
    [v3 appendString:@"<{"];
    uint64_t v10 = [v9 count];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v30 = v7;
      uint64_t v14 = *(void *)v38;
      do
      {
        uint64_t v15 = 0;
        uint64_t v32 = v10;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          unint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
          id v17 = [v11 objectForKeyedSubscript:v16];
          time_t v18 = [v16 description];
          uint64_t v19 = [v17 description];
          [v3 appendFormat:@"%@: %@", v18, v19];

          if (v10 >= 2) {
            [v3 appendString:@", "];
          }

          ++v15;
          --v10;
        }
        while (v13 != v15);
        uint64_t v10 = v32 - v13;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
      uint64_t v7 = v30;
    }
    uint64_t v20 = @"}>";
  }

  [v3 appendString:v20];
LABEL_46:

  return v3;
}

+ (id)cborWithInteger:(int64_t)a3
{
  unint64_t v3 = a3 ^ (a3 >> 63);
  uint64_t v4 = 1;
  uint64_t v5 = 2;
  uint64_t v6 = 8;
  if (!HIDWORD(v3)) {
    uint64_t v6 = 4;
  }
  if (v3 >= 0x10000) {
    uint64_t v5 = v6;
  }
  if (v3 >= 0x100) {
    uint64_t v4 = v5;
  }
  if ((uint64_t)v3 >= 24) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = (unint64_t)a3 >> 63;
  id v9 = (void *)[objc_alloc(NSNumber) initWithLongLong:a3];
  uint64_t v10 = [[CBOR alloc] initWithType:v8 value:v9 valueSize:v7 tag:0];

  return v10;
}

+ (id)cborWithUnsignedInteger:(unint64_t)a3
{
  uint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 8;
  if (!HIDWORD(a3)) {
    uint64_t v5 = 4;
  }
  if (a3 >= 0x10000) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0x100) {
    uint64_t v3 = v4;
  }
  if ((uint64_t)a3 >= 24) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:a3];
  unint64_t v8 = [[CBOR alloc] initWithType:0 value:v7 valueSize:v6 tag:0];

  return v8;
}

+ (id)cborWithHalfFloat:(float)a3
{
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = a3;
  uint64_t v6 = (void *)[v4 initWithFloat:v5];
  uint64_t v7 = [[CBOR alloc] initWithType:6 value:v6 valueSize:2 tag:0];

  return v7;
}

+ (id)cborWithFloat:(float)a3
{
  id v4 = objc_alloc(NSNumber);
  *(float *)&double v5 = a3;
  uint64_t v6 = (void *)[v4 initWithFloat:v5];
  uint64_t v7 = [[CBOR alloc] initWithType:7 value:v6 valueSize:4 tag:0];

  return v7;
}

+ (id)cborWithDouble:(double)a3
{
  uint64_t v3 = (void *)[objc_alloc(NSNumber) initWithDouble:a3];
  id v4 = [[CBOR alloc] initWithType:8 value:v3 valueSize:8 tag:0];

  return v4;
}

+ (id)cborWithArray:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  uint64_t v5 = 1;
  uint64_t v6 = 2;
  uint64_t v7 = 8;
  if (!HIDWORD(v4)) {
    uint64_t v7 = 4;
  }
  if (v4 >= 0x10000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x100) {
    uint64_t v5 = v6;
  }
  if ((uint64_t)v4 >= 24) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [[CBOR alloc] initWithType:4 value:v3 valueSize:v8 tag:0];

  return v9;
}

+ (id)cborWithDictionary:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 count];
  uint64_t v5 = 1;
  uint64_t v6 = 2;
  uint64_t v7 = 8;
  if (!HIDWORD(v4)) {
    uint64_t v7 = 4;
  }
  if (v4 >= 0x10000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x100) {
    uint64_t v5 = v6;
  }
  if ((uint64_t)v4 >= 24) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [[CBOR alloc] initWithType:5 value:v3 valueSize:v8 tag:0];

  return v9;
}

+ (id)cborWithDictionary:(id)a3 keyOrderList:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[CBOR cborWithDictionary:a3];
  uint64_t v7 = (void *)v6[6];
  v6[6] = v5;

  return v6;
}

+ (id)cborWithData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  uint64_t v5 = 1;
  uint64_t v6 = 2;
  uint64_t v7 = 8;
  if (!HIDWORD(v4)) {
    uint64_t v7 = 4;
  }
  if (v4 >= 0x10000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x100) {
    uint64_t v5 = v6;
  }
  if ((uint64_t)v4 >= 24) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = [[CBOR alloc] initWithType:2 value:v3 valueSize:v8 tag:0];

  return v9;
}

+ (id)cborWithEncodedTag24Data:(id)a3
{
  id v3 = a3;
  uint64_t v9 = [v3 bytes];
  uint64_t v8 = [v3 length];
  unint64_t v4 = [v3 length];

  if (v4 >= 2)
  {
    uint64_t v6 = +[CBOR decodeMajorType6FromBuffer:&v9 length:&v8 tag:0];
    uint64_t v5 = 0;
    if (v6 && v8)
    {
      uint64_t v5 = +[CBOR decodeMajorType2And3FromBuffer:&v9 length:&v8 tag:v6 indefiniteLenContainerType:16 noCopy:0];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

+ (id)cborWithUTF8String:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  uint64_t v5 = 1;
  uint64_t v6 = 2;
  uint64_t v7 = 8;
  if (!HIDWORD(v4)) {
    uint64_t v7 = 4;
  }
  if (v4 >= 0x10000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x100) {
    uint64_t v5 = v6;
  }
  if ((uint64_t)v4 >= 24) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [[CBOR alloc] initWithType:3 value:v3 valueSize:v8 tag:0];

  return v9;
}

+ (id)cborWithFullDate:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CBOR alloc] initWithType:14 value:&unk_26C987C68 valueSize:2 tag:0];
  uint64_t v5 = _getRFC3339DateFormatter(0);
  uint64_t v6 = [v5 stringFromDate:v3];

  uint64_t v7 = [CBOR alloc];
  unint64_t v8 = [v6 length];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 8;
  if (!HIDWORD(v8)) {
    uint64_t v11 = 4;
  }
  if (v8 >= 0x10000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x100) {
    uint64_t v9 = v10;
  }
  if ((uint64_t)v8 >= 24) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(CBOR *)v7 initWithType:3 value:v6 valueSize:v12 tag:v4];

  return v13;
}

+ (id)cborWithDateTime:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CBOR alloc] initWithType:14 value:&unk_26C987C80 valueSize:0 tag:0];
  uint64_t v5 = _getRFC3339DateFormatter(1);
  uint64_t v6 = [v5 stringFromDate:v3];

  uint64_t v7 = [CBOR alloc];
  unint64_t v8 = [v6 length];
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  uint64_t v11 = 8;
  if (!HIDWORD(v8)) {
    uint64_t v11 = 4;
  }
  if (v8 >= 0x10000) {
    uint64_t v10 = v11;
  }
  if (v8 >= 0x100) {
    uint64_t v9 = v10;
  }
  if ((uint64_t)v8 >= 24) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(CBOR *)v7 initWithType:3 value:v6 valueSize:v12 tag:v4];

  return v13;
}

+ (id)cborNil
{
  char v2 = [[CBOR alloc] initWithType:11 value:0 valueSize:0 tag:0];
  return v2;
}

+ (id)cborTrue
{
  char v2 = [[CBOR alloc] initWithType:10 value:0 valueSize:0 tag:0];
  return v2;
}

+ (id)cborFalse
{
  char v2 = [[CBOR alloc] initWithType:9 value:0 valueSize:0 tag:0];
  return v2;
}

+ (id)cborWithEmbeddedCBORData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  uint64_t v5 = 1;
  uint64_t v6 = 2;
  uint64_t v7 = 8;
  if (!HIDWORD(v4)) {
    uint64_t v7 = 4;
  }
  if (v4 >= 0x10000) {
    uint64_t v6 = v7;
  }
  if (v4 >= 0x100) {
    uint64_t v5 = v6;
  }
  if ((uint64_t)v4 >= 24) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = +[CBOR cborWithInteger:24];
  uint64_t v10 = [[CBOR alloc] initWithType:2 value:v3 valueSize:v8 tag:v9];

  return v10;
}

- (id)encodeToEmbeddedCBORData
{
  char v2 = [MEMORY[0x263EFF8F8] dataWithCBOR:self];
  id v3 = +[CBOR cborWithEmbeddedCBORData:v2];

  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

- (CBOR)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)valueSize
{
  return self->_valueSize;
}

- (void)setValueSize:(int64_t)a3
{
  self->_int64_t valueSize = a3;
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void)setCachedHash:(unint64_t)a3
{
  self->_cachedHash = a3;
}

- (NSArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void)setOrderedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

+ (id)cborWithCOSE:(id)a3
{
  return -[COSE sourceObject]((id *)a3);
}

+ (id)cborWithCOSEKey:(id)a3
{
  return -[COSE sourceObject]((id *)a3);
}

@end