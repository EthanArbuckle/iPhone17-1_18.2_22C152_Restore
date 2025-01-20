@interface MFQuotedPrintableDecoder
- (BOOL)forTextPart;
- (int64_t)appendData:(id)a3;
- (void)done;
- (void)setForTextPart:(BOOL)a3;
@end

@implementation MFQuotedPrintableDecoder

- (int64_t)appendData:(id)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = v4;
  int64_t v23 = [v24 length];
  memset(__b, 170, sizeof(__b));
  if (*(unsigned char *)(v3 + 33))
  {
    v29.receiver = (id)v3;
    v29.super_class = (Class)MFQuotedPrintableDecoder;
    [(MFBaseFilterDataConsumer *)&v29 appendData:v24];
    goto LABEL_3;
  }
  if (v23)
  {
    uint64_t v6 = [v24 bytes];
    if (v23 >= 1)
    {
      v7 = (unsigned char *)v6;
      unint64_t v8 = 0;
      unint64_t v9 = v6 + v23;
      uint64_t v10 = v6 + v23 - 1;
      while (1)
      {
        if (*(unsigned char *)(v3 + 33))
        {
          if (v8)
          {
            v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v8 freeWhenDone:0];
            v28.receiver = (id)v3;
            v28.super_class = (Class)MFQuotedPrintableDecoder;
            [(MFBaseFilterDataConsumer *)&v28 appendData:v11];
          }
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:v9 - (void)v7 freeWhenDone:0];
          v27.receiver = (id)v3;
          v27.super_class = (Class)MFQuotedPrintableDecoder;
          [(MFBaseFilterDataConsumer *)&v27 appendData:v12];
          v7 = (unsigned char *)v10;
          goto LABEL_40;
        }
        uint64_t v13 = *(void *)(v3 + 24);
        uint64_t v14 = *v7;
        if (!v13)
        {
          if (v14 == 61)
          {
            *(void *)(v3 + 24) = 2;
            *(unsigned char *)(v3 + 17) = 0;
            goto LABEL_38;
          }
          if (v14 == 10 && *(unsigned char *)(v3 + 32) == 0)
          {
            __b[v8++] = 13;
            LOBYTE(v14) = *v7;
          }
          __b[v8] = v14;
LABEL_33:
          ++v8;
          goto LABEL_38;
        }
        if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v14 + 60) & 0x10000) != 0)
        {
          *(void *)(v3 + 24) = v13 - 1;
          __darwin_ct_rune_t v19 = *v7;
          if (v13 != 1)
          {
            *(unsigned char *)(v3 + 17) = v19;
            goto LABEL_38;
          }
          char v21 = __maskrune(v19, 0xFuLL);
          __b[v8] = v21 | (16 * __maskrune(*(unsigned __int8 *)(v3 + 17), 0xFuLL));
          goto LABEL_33;
        }
        if (v13 == 2 && v14 == 10)
        {
          *(void *)(v3 + 24) = 0;
          goto LABEL_38;
        }
        if (v13 == 2) {
          break;
        }
        unint64_t v18 = v8 + 1;
        __b[v8] = 61;
        if (v13 == 1)
        {
          char v16 = *(unsigned char *)(v3 + 17);
          uint64_t v17 = 2;
LABEL_36:
          __b[v18] = v16;
          unint64_t v18 = v8 + v17;
        }
        __b[v18] = *v7;
        unint64_t v8 = v18 + 1;
        *(void *)(v3 + 24) = 0;
        *(unsigned char *)(v3 + 33) = 1;
LABEL_38:
        if (v8 >= 0x3FFE)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v8 freeWhenDone:0];
          v26.receiver = (id)v3;
          v26.super_class = (Class)MFQuotedPrintableDecoder;
          [(MFBaseFilterDataConsumer *)&v26 appendData:v12];
LABEL_40:

          unint64_t v8 = 0;
        }
        if ((unint64_t)++v7 >= v9)
        {
          if (v8)
          {
            v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v8 freeWhenDone:0];
            v25.receiver = (id)v3;
            v25.super_class = (Class)MFQuotedPrintableDecoder;
            [(MFBaseFilterDataConsumer *)&v25 appendData:v22];
          }
          goto LABEL_3;
        }
      }
      if (v14 == 32) {
        goto LABEL_38;
      }
      char v16 = 61;
      uint64_t v17 = 1;
      unint64_t v18 = v8;
      goto LABEL_36;
    }
  }
LABEL_3:

  return v23;
}

- (void)done
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)&self->_lastEncoded;
  if (v2)
  {
    memset(&v7[1], 170, 0x3FFFuLL);
    v7[0] = 61;
    if (v2 == 1)
    {
      v7[1] = *(&self->super._serialAppend + 1);
      uint64_t v4 = 2;
    }
    else
    {
      uint64_t v4 = 1;
    }
    *(void *)&self->_lastEncoded = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:v4 freeWhenDone:0];
    v6.receiver = self;
    v6.super_class = (Class)MFQuotedPrintableDecoder;
    [(MFBaseFilterDataConsumer *)&v6 appendData:v5];
  }
}

- (BOOL)forTextPart
{
  return self->_required;
}

- (void)setForTextPart:(BOOL)a3
{
  LOBYTE(self->_required) = a3;
}

@end