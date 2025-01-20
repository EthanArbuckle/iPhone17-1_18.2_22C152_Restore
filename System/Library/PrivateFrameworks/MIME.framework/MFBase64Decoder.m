@interface MFBase64Decoder
+ (BOOL)isValidBase64:(id)a3;
- (BOOL)convertCommas;
- (BOOL)isBound;
- (MFBase64Decoder)initWithConsumers:(id)a3;
- (int64_t)appendData:(id)a3;
- (unint64_t)_decodeBytes:(const char *)a3 end:(const char *)a4 into:(char *)a5 length:(unint64_t)a6 startingAt:(unint64_t)a7 outEncodedOffset:(unint64_t *)a8;
- (unint64_t)unconverted;
- (void)done;
- (void)setConvertCommas:(BOOL)a3;
- (void)setIsBound:(BOOL)a3;
@end

@implementation MFBase64Decoder

- (MFBase64Decoder)initWithConsumers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFBase64Decoder;
  result = [(MFBaseFilterDataConsumer *)&v4 initWithConsumers:a3];
  if (result) {
    result->_table = (const char *)&Decode64Table;
  }
  return result;
}

- (unint64_t)_decodeBytes:(const char *)a3 end:(const char *)a4 into:(char *)a5 length:(unint64_t)a6 startingAt:(unint64_t)a7 outEncodedOffset:(unint64_t *)a8
{
  unint64_t equalCount = self->_equalCount;
  unint64_t validBytes = self->_validBytes;
  unsigned int decodedBits = self->_decodedBits;
  if (a3 >= a4)
  {
    v18 = a3;
    goto LABEL_20;
  }
  v25 = a8;
  table = self->_table;
  int64_t v17 = a4 - a3;
  v18 = a3;
  do
  {
    int v19 = table[*(unsigned __int8 *)v18];
    if (table[*(unsigned __int8 *)v18] < 0)
    {
      if ((~v19 & 0xFB) == 0)
      {
LABEL_9:
        unint64_t equalCount = 0;
        goto LABEL_10;
      }
      if (v19 == 252 && validBytes != 0 && ++equalCount == 4 - validBytes) {
        goto LABEL_19;
      }
    }
    else
    {
      unsigned int decodedBits = v19 + (decodedBits << 6);
      if ((++validBytes & 3) != 0) {
        goto LABEL_9;
      }
      if (a7 + 2 >= a6)
      {
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a5 length:a7];
        v26.receiver = self;
        v26.super_class = (Class)MFBase64Decoder;
        [(MFBaseFilterDataConsumer *)&v26 appendData:v20];

        a7 = 0;
      }
      unint64_t equalCount = 0;
      v21 = &a5[a7];
      *(_WORD *)(v21 + 1) = bswap32(decodedBits) >> 16;
      char *v21 = BYTE2(decodedBits);
      a7 += 3;
      unsigned int decodedBits = 0;
    }
LABEL_10:
    ++v18;
    --v17;
  }
  while (v17);
  v18 = a4;
LABEL_19:
  a8 = v25;
LABEL_20:
  self->_unint64_t equalCount = equalCount;
  self->_unint64_t validBytes = validBytes & 3;
  self->_unsigned int decodedBits = decodedBits;
  if (a8) {
    *a8 = v18 - a3;
  }
  return a7;
}

- (int64_t)appendData:(id)a3
{
  uint64_t v39 = MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v36 = v3;
  unint64_t v4 = [v36 length];
  id v37 = v36;
  uint64_t v5 = [v37 bytes];
  memset(__b, 170, sizeof(__b));
  char v6 = [(id)v39 convertCommas];
  if (!v4) {
    goto LABEL_66;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  char v38 = v6;
  do
  {
    v9 = (void *)v39;
    uint64_t v10 = *(void *)(v39 + 40);
    if (v10 && *(void *)(v39 + 48) == 4 - v10)
    {
      BOOL v11 = 0;
      unint64_t v12 = v4 - v7;
      goto LABEL_34;
    }
    if (v4 == v7)
    {
      unint64_t v12 = 0;
      BOOL v13 = 1;
      goto LABEL_33;
    }
    int v14 = 0;
    int v15 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = v5 + v7;
    BOOL v13 = 1;
    do
    {
      unint64_t v18 = *(unsigned __int8 *)(v17 + v16);
      if ((*(char *)(v17 + v16) & 0x80000000) == 0
        && (v18 == 44 ? (char v19 = v6) : (char v19 = 0),
            (v19 & 1) != 0 || ((1 << (v18 & 7)) & _IsValidBase64Chr_table[v18 >> 3]) != 0))
      {
        BOOL v13 = v14 == 0;
      }
      else
      {
        if (*(unsigned __int8 *)(v17 + v16) <= 0xCu)
        {
          if (v18 != 9)
          {
            if (v18 == 10)
            {
LABEL_23:
              int v15 = 1;
              goto LABEL_31;
            }
LABEL_30:
            BOOL v13 = 0;
            goto LABEL_31;
          }
        }
        else
        {
          if (v18 == 13) {
            goto LABEL_23;
          }
          if (v18 == 33)
          {
            if (v14) {
              BOOL v13 = 0;
            }
            int v14 = 1;
            goto LABEL_31;
          }
          if (v18 != 32) {
            goto LABEL_30;
          }
        }
        if (!v14) {
          goto LABEL_31;
        }
      }
      if (v15)
      {
        unint64_t v12 = v16 - 1;
        goto LABEL_33;
      }
LABEL_31:
      ++v16;
    }
    while (v4 - v7 != v16);
    unint64_t v12 = 0;
LABEL_33:
    BOOL v11 = v13;
    if (!v11)
    {
LABEL_34:
      if (v12)
      {
        if (*(void *)(v39 + 24))
        {
          v43.receiver = (id)v39;
          v43.super_class = (Class)MFBase64Decoder;
          -[MFBaseFilterDataConsumer appendData:](&v43, sel_appendData_);
          v20 = *(void **)(v39 + 24);
          *(void *)(v39 + 24) = 0;
        }
        for (unint64_t i = 0; i < v12; i += v23)
        {
          unint64_t v22 = 0x4000 - v8;
          if (v8 > 0x4000) {
            unint64_t v22 = 0x4000;
          }
          if (v22 >= v4 - (i + v7)) {
            size_t v23 = v4 - (i + v7);
          }
          else {
            size_t v23 = v22;
          }
          memmove(&__b[v8], (const void *)(v5 + i + v7), v23);
          v8 += v23;
          unint64_t v24 = v8 - 0x4000;
          if (v8 >= 0x4000)
          {
            v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:__b length:0x4000];
            v42.receiver = (id)v39;
            v42.super_class = (Class)MFBase64Decoder;
            [(MFBaseFilterDataConsumer *)&v42 appendData:v25];

            unint64_t v8 = v24;
          }
        }
        goto LABEL_53;
      }
    }
    if (!v12) {
      BOOL v11 = 0;
    }
    objc_super v26 = *(void **)(v39 + 24);
    if (!v11)
    {
      if ([v26 length] + v4 - v7 <= 0x4000) {
        goto LABEL_60;
      }
      v28 = *(void **)(v39 + 24);
      if (v28)
      {
        unint64_t v8 = objc_msgSend((id)v39, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:", objc_msgSend(v28, "bytes"), objc_msgSend(*(id *)(v39 + 24), "bytes") + objc_msgSend(*(id *)(v39 + 24), "length"), __b, 0x4000, v8, 0);
        v29 = *(void **)(v39 + 24);
        *(void *)(v39 + 24) = 0;
      }
      if (v4 - v7 <= 0x4000)
      {
LABEL_60:
        uint64_t v30 = v39;
      }
      else
      {
        uint64_t v41 = 0;
        uint64_t v30 = v39;
        unint64_t v8 = objc_msgSend((id)v39, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:");
      }
      v31 = *(void **)(v30 + 24);
      if (v31)
      {
        [v31 appendBytes:v5 + v7 length:v4 - v7];
      }
      else
      {
        uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:v5 + v7 length:v4 - v7];
        v33 = *(void **)(v39 + 24);
        *(void *)(v39 + 24) = v32;
      }
      break;
    }
    if (v26)
    {
      unint64_t v8 = objc_msgSend((id)v39, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:", objc_msgSend(v26, "bytes"), objc_msgSend(*(id *)(v39 + 24), "bytes") + objc_msgSend(*(id *)(v39 + 24), "length"), __b, 0x4000, v8, 0);
      v27 = *(void **)(v39 + 24);
      *(void *)(v39 + 24) = 0;

      v9 = (void *)v39;
    }
    unint64_t v8 = [v9 _decodeBytes:v5 + v7 end:v5 + v7 + v12 into:__b length:0x4000 startingAt:v8 outEncodedOffset:0];
LABEL_53:
    v7 += v12;
    char v6 = v38;
  }
  while (v7 < v4);
  if (v8)
  {
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:__b length:v8];
    v40.receiver = (id)v39;
    v40.super_class = (Class)MFBase64Decoder;
    [(MFBaseFilterDataConsumer *)&v40 appendData:v34];
  }
LABEL_66:

  return v4;
}

- (void)done
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  leftovers = self->_leftovers;
  if (leftovers)
  {
    unint64_t v4 = [(MFBase64Decoder *)self _decodeBytes:[(NSMutableData *)leftovers bytes] end:[(NSMutableData *)self->_leftovers bytes] + [(NSMutableData *)self->_leftovers length] into:__b length:0x2000 startingAt:0 outEncodedOffset:0];
    uint64_t v5 = self->_leftovers;
    self->_leftovers = 0;
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (self->_bound)
  {
    unint64_t validBytes = self->_validBytes;
    if (self->_equalCount != 4 - validBytes) {
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t validBytes = self->_validBytes;
  }
  if (validBytes == 2)
  {
    unsigned int v9 = self->_decodedBits >> 4;
    uint64_t v10 = 1;
    unint64_t v8 = v4;
  }
  else
  {
    if (validBytes != 3) {
      goto LABEL_13;
    }
    unsigned int decodedBits = self->_decodedBits;
    unint64_t v8 = v4 + 1;
    __b[v4] = decodedBits >> 10;
    unsigned int v9 = decodedBits >> 2;
    uint64_t v10 = 2;
  }
  v4 += v10;
  __b[v8] = v9;
  self->_unint64_t validBytes = 1;
  self->_unint64_t validBytes = 1 - self->_equalCount;
LABEL_13:
  if (v4)
  {
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:__b length:v4];
    v12.receiver = self;
    v12.super_class = (Class)MFBase64Decoder;
    [(MFBaseFilterDataConsumer *)&v12 appendData:v11];
  }
}

- (void)setConvertCommas:(BOOL)a3
{
  id v3 = (const char *)&Decode64Table;
  if (a3) {
    id v3 = (const char *)&Decode64AltTable;
  }
  self->_table = v3;
}

- (BOOL)convertCommas
{
  return self->_table == Decode64AltTable;
}

+ (BOOL)isValidBase64:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5 >= 1)
  {
    unsigned int v6 = 0;
    unint64_t v7 = (unsigned __int8 *)v4;
    while (1)
    {
      unint64_t v8 = *v7;
      if (v8 == 61)
      {
        ++v6;
        BOOL v9 = 1;
      }
      else
      {
        if (v6)
        {
          BOOL v12 = 0;
          goto LABEL_20;
        }
        if ((v8 & 0x80) != 0) {
          int v10 = 0;
        }
        else {
          int v10 = (_IsValidBase64Chr_table[v8 >> 3] >> (v8 & 7)) & 1;
        }
        unsigned int v6 = 0;
        BOOL v9 = v10 != 0;
      }
      ++v7;
      if (!v9 || (unint64_t)v7 >= v4 + v5) {
        goto LABEL_14;
      }
    }
  }
  unsigned int v6 = 0;
  BOOL v9 = 1;
  LOBYTE(v7) = v4;
LABEL_14:
  BOOL v11 = (((_BYTE)v7 - (_BYTE)v4) & 3) == 0;
  if (v6 > 2) {
    BOOL v11 = 0;
  }
  BOOL v12 = v9 && v11;
LABEL_20:

  return v12;
}

- (unint64_t)unconverted
{
  return self->_validBytes;
}

- (BOOL)isBound
{
  return self->_bound;
}

- (void)setIsBound:(BOOL)a3
{
  self->_bound = a3;
}

- (void).cxx_destruct
{
}

@end