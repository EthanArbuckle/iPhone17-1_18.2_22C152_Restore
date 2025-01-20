@interface MFBase64Encoder
- (BOOL)allowSlash;
- (MFBase64Encoder)initWithConsumers:(id)a3;
- (char)padChar;
- (int64_t)appendData:(id)a3;
- (unint64_t)lineBreak;
- (void)done;
- (void)setAllowSlash:(BOOL)a3;
- (void)setLineBreak:(unint64_t)a3;
- (void)setPadChar:(char)a3;
- (void)setStandardLineBreak;
@end

@implementation MFBase64Encoder

- (MFBase64Encoder)initWithConsumers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFBase64Encoder;
  result = [(MFBaseFilterDataConsumer *)&v4 initWithConsumers:a3];
  if (result)
  {
    result->_padChar = 61;
    result->_table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  }
  return result;
}

- (int64_t)appendData:(id)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  id v37 = v5;
  v6 = (char *)[v5 bytes];
  unint64_t v7 = [v5 length];
  memset(__b, 170, sizeof(__b));
  uint64_t v8 = *(void *)(v3 + 32);
  if (v8)
  {
    if (3 - v8 >= v7) {
      int64_t v9 = v7;
    }
    else {
      int64_t v9 = 3 - v8;
    }
    memmove((void *)(v3 + 40 + v8), v6, v9);
    int64_t v10 = *(void *)(v3 + 32) + v9;
    *(void *)(v3 + 32) = v10;
    v7 -= v9;
    if (v10 == 3)
    {
      int v11 = *(unsigned __int8 *)(v3 + 40);
      int v12 = *(unsigned __int8 *)(v3 + 41);
      uint64_t v13 = *(void *)(v3 + 24);
      unint64_t v14 = *(void *)(v3 + 56);
      int v15 = *(unsigned __int8 *)(v3 + 42);
      __b[0] = *(unsigned char *)(v13 + (v11 >> 2));
      __b[1] = *(unsigned char *)(v13 + (((unint64_t)(v12 | (v11 << 8)) >> 4) & 0x3F));
      __b[2] = *(unsigned char *)(v13 + (((unint64_t)(v15 | (v12 << 8)) >> 6) & 0x3F));
      __b[3] = *(unsigned char *)(v13 + (v15 & 0x3F));
      if (v14 && (unint64_t v16 = *(void *)(v3 + 48) + 4, *(void *)(v3 + 48) = v16, v17 = v16 - v14, v16 >= v14))
      {
        *(void *)(v3 + 48) = v17;
        memmove(&__b[v17 + 1], &__b[v17], v16 - v14);
        __b[-v17 + 4] = 10;
        unint64_t v18 = 5;
      }
      else
      {
        unint64_t v18 = 4;
      }
      *(void *)(v3 + 32) = 0;
    }
    else
    {
      unint64_t v18 = 0;
    }
  }
  else
  {
    unint64_t v18 = 0;
    int64_t v9 = 0;
  }
  int64_t v36 = v7;
  if (v7)
  {
    unint64_t v35 = v7 % 3;
    int64_t v19 = v7 + v9 - v7 % 3;
    unint64_t v34 = v7 + v9;
    if (v9 < v19)
    {
      v20 = (unsigned __int8 *)&v6[v19];
      v21 = (unsigned __int8 *)&v6[v9];
      do
      {
        v22 = &__b[v18];
        int v23 = *v21;
        uint64_t v24 = *(void *)(v3 + 24);
        int v25 = v21[1];
        unint64_t v26 = *(void *)(v3 + 56);
        int v27 = v21[2];
        unsigned char *v22 = *(unsigned char *)(v24 + (v23 >> 2));
        v22[1] = *(unsigned char *)(v24 + (((unint64_t)(v25 | (v23 << 8)) >> 4) & 0x3F));
        v22[2] = *(unsigned char *)(v24 + (((unint64_t)(v27 | (v25 << 8)) >> 6) & 0x3F));
        v22[3] = *(unsigned char *)(v24 + (v27 & 0x3F));
        if (v26)
        {
          unint64_t v28 = *(void *)(v3 + 48) + 4;
          *(void *)(v3 + 48) = v28;
          uint64_t v29 = v28 - v26;
          if (v28 >= v26)
          {
            *(void *)(v3 + 48) = v29;
            memmove(&v22[v29 + 1], &v22[v29], v28 - v26);
            v22[-v29 + 4] = 10;
            uint64_t v30 = 5;
          }
          else
          {
            uint64_t v30 = 4;
          }
          id v5 = v37;
        }
        else
        {
          uint64_t v30 = 4;
        }
        v18 += v30;
        if (v18 >> 3 >= 0xFFF)
        {
          v31 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v18 freeWhenDone:0];
          v39.receiver = (id)v3;
          v39.super_class = (Class)MFBase64Encoder;
          [(MFBaseFilterDataConsumer *)&v39 appendData:v31];

          unint64_t v18 = 0;
        }
        v21 += 3;
      }
      while (v21 < v20);
    }
    *(void *)(v3 + 32) = v35;
    if (v35)
    {
      *(_WORD *)(v3 + 40) = 0;
      *(unsigned char *)(v3 + 42) = 0;
      memmove((void *)(v3 + 40), &v6[v34 - *(void *)(v3 + 32)], *(void *)(v3 + 32));
    }
  }
  if (v18)
  {
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v18 freeWhenDone:0];
    v38.receiver = (id)v3;
    v38.super_class = (Class)MFBase64Encoder;
    [(MFBaseFilterDataConsumer *)&v38 appendData:v32];
  }
  return v36;
}

- (void)done
{
  v23[2] = *MEMORY[0x1E4F143B8];
  memset(v23, 170, 11);
  unint64_t left = self->_left;
  if (!left) {
    return;
  }
  if (left != 1)
  {
    if (left != 2)
    {
      uint64_t v11 = 0;
      goto LABEL_20;
    }
    table = self->_table;
    LOBYTE(v23[0]) = table[(unint64_t)self->_leftovers[0] >> 2];
    if (self->_lineBreak)
    {
      unint64_t v5 = self->_line + 1;
      self->_line = v5;
      unint64_t lineBreak = self->_lineBreak;
      if (!(v5 % lineBreak))
      {
        BYTE1(v23[0]) = 10;
        uint64_t v7 = 2;
        goto LABEL_13;
      }
    }
    else
    {
      unint64_t lineBreak = 0;
    }
    uint64_t v7 = 1;
LABEL_13:
    leftovers = &self->_leftovers[1];
    uint64_t v10 = v7 + 1;
    *(unsigned char *)((unint64_t)v23 | v7) = table[((unint64_t)(self->_leftovers[1] | (self->_leftovers[0] << 8)) >> 4) & 0x3F];
    if (lineBreak)
    {
      unint64_t v12 = self->_line + 1;
      self->_line = v12;
      if (!(v12 % self->_lineBreak))
      {
        *(unsigned char *)((unint64_t)v23 | v10) = 10;
        uint64_t v10 = v7 + 2;
      }
    }
    uint64_t v13 = &self->_leftovers[2];
    char v14 = 6;
    goto LABEL_19;
  }
  table = self->_table;
  leftovers = self->_leftovers;
  LOBYTE(v23[0]) = table[(unint64_t)self->_leftovers[0] >> 2];
  if (self->_lineBreak && (unint64_t v9 = self->_line + 1, self->_line = v9, !(v9 % self->_lineBreak)))
  {
    BYTE1(v23[0]) = 10;
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 1;
  }
  uint64_t v13 = &self->_leftovers[1];
  char v14 = 4;
LABEL_19:
  char v15 = table[((*v13 | ((unint64_t)*leftovers << 8)) >> v14) & 0x3F];
  uint64_t v11 = v10 + 1;
  *(unsigned char *)((unint64_t)v23 | v10) = v15;
LABEL_20:
  if (self->_padChar && (unint64_t v16 = self->_left - 3, self->_left != 3))
  {
    unint64_t v18 = self->_lineBreak;
    do
    {
      uint64_t v17 = v11 + 1;
      *((unsigned char *)v23 + v11) = self->_padChar;
      if (v18)
      {
        unint64_t v19 = self->_line + 1;
        self->_line = v19;
        unint64_t v18 = self->_lineBreak;
        if (!(v19 % v18))
        {
          *((unsigned char *)v23 + v17) = 10;
          uint64_t v17 = v11 + 2;
        }
      }
      uint64_t v11 = v17;
      BOOL v20 = __CFADD__(v16++, 1);
    }
    while (!v20);
  }
  else
  {
    uint64_t v17 = v11;
  }
  if (v17)
  {
    if (!self->_lineBreak
      || *((unsigned char *)v23 + v17 - 1) == 10
      || (*((unsigned char *)v23 + v17) = 10, BOOL v20 = __CFADD__(v17, 1), ++v17, !v20))
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v23 length:v17 freeWhenDone:0];
      v22.receiver = self;
      v22.super_class = (Class)MFBase64Encoder;
      [(MFBaseFilterDataConsumer *)&v22 appendData:v21];
    }
  }
}

- (void)setAllowSlash:(BOOL)a3
{
  uint64_t v3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+,";
  if (a3) {
    uint64_t v3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  }
  self->_table = v3;
}

- (BOOL)allowSlash
{
  return self->_table == "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
}

- (void)setStandardLineBreak
{
}

- (unint64_t)lineBreak
{
  return self->_lineBreak;
}

- (void)setLineBreak:(unint64_t)a3
{
  self->_unint64_t lineBreak = a3;
}

- (char)padChar
{
  return self->_padChar;
}

- (void)setPadChar:(char)a3
{
  self->_padChar = a3;
}

@end