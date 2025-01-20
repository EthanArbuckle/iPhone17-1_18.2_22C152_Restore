@interface KmlTlv
+ (_WORD)TLVWithTag:(char)a3 unsignedChar:;
+ (_WORD)TLVWithTag:(unsigned int)a3 unsignedShort:;
+ (_WORD)TLVWithTag:(void *)a3 value:;
+ (id)TLVsWithData:(uint64_t)a1;
+ (id)_intToData:(uint64_t)a1;
+ (id)_parseTLVs:(unint64_t)a3 end:;
- (id)asData;
- (id)description;
- (id)value;
- (uint64_t)tag;
- (uint64_t)valueAsUnsignedShort;
- (void)valueAsUnsignedChar;
@end

@implementation KmlTlv

+ (id)TLVsWithData:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if ([v2 length])
  {
    id v8 = v2;
    uint64_t v13 = [v8 bytes];
    uint64_t v9 = +[KmlTlv _parseTLVs:end:](v3, (unint64_t *)&v13, v13 + [v8 length]);
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv TLVsWithData:]", 29, @"nothing to parse", v4, v5, v6, v7, v12);
    uint64_t v9 = [MEMORY[0x263EFF8C0] array];
  }
  v10 = (void *)v9;

  return v10;
}

+ (id)_parseTLVs:(unint64_t)a3 end:
{
  self;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  unint64_t v6 = *a2;
  if (*a2 >= a3)
  {
LABEL_20:
    uint64_t v28 = [v5 count];
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 304, @"TLV: found %lu tlvs", v29, v30, v31, v32, v28);
    goto LABEL_28;
  }
  while (1)
  {
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:a3 - v6];
    id v8 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 0xFFFF, v7);

    uint64_t v13 = (unsigned __int8 *)*a2;
    v14 = (char *)(*a2 + 1);
    *a2 = (unint64_t)v14;
    int v15 = *v13;
    if ((~v15 & 0x1F) == 0)
    {
      while ((unint64_t)v14 < a3)
      {
        v16 = v14 + 1;
        *a2 = (unint64_t)(v14 + 1);
        int v17 = *v14++;
        BOOL v18 = v17 < -1;
        int v19 = v17 | (v15 << 8);
        int v15 = v19;
        if (!v18) {
          goto LABEL_7;
        }
      }
      v33 = @"TLV: Underflow";
      uint64_t v34 = 252;
      goto LABEL_26;
    }
    v16 = v14;
    LOWORD(v19) = v15;
LABEL_7:
    if ((unint64_t)v16 >= a3)
    {
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 266, @"TLV: Underflow: tag=0x%x", v9, v10, v11, v12, (unsigned __int16)v19);
      goto LABEL_27;
    }
    v20 = (unsigned __int8 *)(v16 + 1);
    *a2 = (unint64_t)(v16 + 1);
    int v21 = *v16;
    unsigned int v22 = v21;
    if (v21 < 0) {
      break;
    }
LABEL_9:
    if (!(_WORD)v19 && !v22)
    {
      v33 = @"TLV: tag and length is 0";
      uint64_t v34 = 287;
LABEL_26:
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", v34, v33, v9, v10, v11, v12, v36);
      goto LABEL_27;
    }
    if ((uint64_t)(a3 - (void)v20) < v22)
    {
      uint64_t v36 = (unsigned __int16)v19;
      v33 = @"TLV: Underflow: tag=0x%x len=%u";
      uint64_t v34 = 295;
      goto LABEL_26;
    }
    uint64_t v23 = v22;
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 299, @"TLV: adding tag:0x%x, len:%u", v9, v10, v11, v12, (unsigned __int16)v19);
    v24 = [MEMORY[0x263EFF8F8] dataWithBytes:*a2 length:v23];
    v25 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, v19, v24);
    [v5 addObject:v25];

    *a2 += v23;
    unint64_t v6 = *a2;
    if (*a2 >= a3) {
      goto LABEL_20;
    }
  }
  int v26 = v21 & 0x7F;
  if ((v22 & 0x7F) == 0)
  {
    unsigned int v22 = 0;
    goto LABEL_9;
  }
  unsigned int v22 = 0;
  v27 = v20;
  while ((unint64_t)v27 < a3)
  {
    v20 = v27 + 1;
    *a2 = (unint64_t)(v27 + 1);
    unsigned int v22 = *v27++ | (v22 << 8);
    if (!--v26) {
      goto LABEL_9;
    }
  }
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"+[KmlTlv _parseTLVs:end:]", 276, @"TLV: Underflow: tag=0x%x", v9, v10, v11, v12, (unsigned __int16)v19);
LABEL_27:
  [v5 addObject:v8];

LABEL_28:

  return v5;
}

+ (_WORD)TLVWithTag:(void *)a3 value:
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init((Class)self);
  v5[4] = a2;
  unint64_t v6 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v4;

  return v5;
}

+ (_WORD)TLVWithTag:(char)a3 unsignedChar:
{
  char v8 = a3;
  id v4 = objc_alloc_init((Class)self);
  v4[4] = a2;
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:1];
  unint64_t v6 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v5;

  return v4;
}

+ (_WORD)TLVWithTag:(unsigned int)a3 unsignedShort:
{
  uint64_t v5 = objc_alloc_init((Class)self);
  v5[4] = a2;
  __int16 v9 = __rev16(a3);
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v9 length:2];
  uint64_t v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  return v5;
}

- (id)description
{
  uint64_t v3 = (void *)[[NSString alloc] initWithData:self->_value encoding:1];
  id v4 = NSString;
  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)KmlTlv;
    uint64_t v5 = [(KmlTlv *)&v10 description];
    [v4 stringWithFormat:@"%@ %02x = %@ \"%@\"", v5, self->_tag, self->_value, v3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)KmlTlv;
    uint64_t v5 = [(KmlTlv *)&v9 description];
    [v4 stringWithFormat:@"%@ %02x = %@", v5, self->_tag, self->_value, v8];
  uint64_t v6 = };

  return v6;
}

- (uint64_t)tag
{
  if (result) {
    return *(unsigned __int16 *)(result + 8);
  }
  return result;
}

- (id)value
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)valueAsUnsignedChar
{
  if (result)
  {
    uint64_t v1 = result;
    result = (void *)result[2];
    if (result)
    {
      if ((unint64_t)[result length] < 2)
      {
        return (void *)*(unsigned __int8 *)[(id)v1[2] bytes];
      }
      else
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTlv valueAsUnsignedChar]", 132, @"TLV: Value too large: %@", v2, v3, v4, v5, v1[2]);
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)valueAsUnsignedShort
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    return 0;
  }
  if ((unint64_t)[v2 length] >= 3)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTlv valueAsUnsignedShort]", 147, @"TLV: Value too large: %@", v3, v4, v5, v6, *(void *)(a1 + 16));
    return 0;
  }
  uint64_t v7 = [*(id *)(a1 + 16) bytes];
  if (![*(id *)(a1 + 16) length]) {
    return 0;
  }
  unint64_t v8 = 0;
  unsigned __int16 v9 = 0;
  do
    unsigned __int16 v9 = *(unsigned __int8 *)(v7 + v8++) | (unsigned __int16)(v9 << 8);
  while ([*(id *)(a1 + 16) length] > v8);
  return v9;
}

+ (id)_intToData:(uint64_t)a1
{
  self;
  uint64_t v3 = [MEMORY[0x263EFF990] dataWithCapacity:4];
  uint64_t v4 = v3;
  char v8 = 0;
  if (a2)
  {
    int v5 = 4;
    if (HIBYTE(a2)) {
      goto LABEL_14;
    }
    do
    {
      unsigned int v6 = HIWORD(a2);
      a2 <<= 8;
      --v5;
    }
    while (!v6 && v5);
    if (v5)
    {
LABEL_14:
      do
      {
        char v8 = HIBYTE(a2);
        [v4 appendBytes:&v8 length:1];
        a2 <<= 8;
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    [v3 appendBytes:&v8 length:1];
  }

  return v4;
}

- (id)asData
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x263EFF990] data];
    uint64_t v3 = +[KmlTlv _intToData:]((uint64_t)KmlTlv, *(unsigned __int16 *)(a1 + 8));
    [v2 appendData:v3];

    id v4 = *(id *)(a1 + 16);
    unsigned int v5 = [v4 length];
    unsigned int v6 = +[KmlTlv _intToData:]((uint64_t)KmlTlv, v5);
    uint64_t v7 = v6;
    if (v5 >= 0x80)
    {
      char v9 = [v6 length] | 0x80;
      [v2 appendBytes:&v9 length:1];
    }
    [v2 appendData:v7];
    if (v4) {
      [v2 appendData:v4];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end