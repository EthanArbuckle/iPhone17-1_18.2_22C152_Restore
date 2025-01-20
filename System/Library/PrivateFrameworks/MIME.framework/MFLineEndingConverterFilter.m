@interface MFLineEndingConverterFilter
- (int64_t)appendData:(id)a3;
- (void)done;
@end

@implementation MFLineEndingConverterFilter

- (int64_t)appendData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(__b, 170, sizeof(__b));
  id v5 = v4;
  v6 = (unsigned char *)[v5 bytes];
  uint64_t v7 = [v5 length];
  v8 = &v6[v7];
  v9 = (SEL *)&unk_1E5F8A000;
  if (v7 < 1)
  {
    v19 = 0;
    unint64_t v13 = (unint64_t)v6;
    if (v6)
    {
LABEL_22:
      *(&self->super._serialAppend + 1) = 1;
      --v8;
    }
    goto LABEL_23;
  }
  v10 = 0;
  uint64_t v11 = 0;
  BOOL v12 = !*(&self->super._serialAppend + 1);
  unint64_t v13 = (unint64_t)v6;
  while (1)
  {
    if (!v12) {
      goto LABEL_6;
    }
    v14 = (char *)memchr(v6, 13, v8 - v6);
    if (!v14) {
      break;
    }
    v6 = v14 + 1;
LABEL_6:
    if (v6 >= v8) {
      goto LABEL_30;
    }
    if (*v6 == 10)
    {
      if (v12)
      {
        v15 = &v6[~v13];
        if ((unint64_t)&v15[v11] <= 0x4000)
        {
          memmove(&__b[v11], (const void *)v13, (size_t)&v6[~v13]);
          v11 += (uint64_t)v15;
          v17 = v10;
        }
        else
        {
          if (v11)
          {
            uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v11 freeWhenDone:0];

            v26.receiver = self;
            v26.super_class = (Class)MFLineEndingConverterFilter;
            v10 = (void *)v16;
            [(MFBaseFilterDataConsumer *)&v26 appendData:v16];
          }
          v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v13 length:&v6[~v13] freeWhenDone:0];

          v25.receiver = self;
          v25.super_class = (Class)MFLineEndingConverterFilter;
          [(MFBaseFilterDataConsumer *)&v25 appendData:v17];
          uint64_t v11 = 0;
        }
        unint64_t v13 = (unint64_t)v6;
        goto LABEL_19;
      }
    }
    else if (!v12)
    {
      if (v11) {
        __assert_rtn("-[MFLineEndingConverterFilter appendData:]", "MFDataConsumer.m", 407, "used == 0");
      }
      __b[0] = 13;
      uint64_t v11 = 1;
    }
    v17 = v10;
LABEL_19:
    *(&self->super._serialAppend + 1) = 0;
    BOOL v12 = 1;
    v10 = v17;
    if (v13 >= (unint64_t)v8)
    {
      if (v11) {
        goto LABEL_21;
      }
      goto LABEL_31;
    }
  }
  v6 = 0;
LABEL_30:
  v17 = v10;
  if (v11)
  {
LABEL_21:
    v9 = (SEL *)&unk_1E5F8A000;
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:__b length:v11 freeWhenDone:0];

    v24.receiver = self;
    v24.super_class = (Class)MFLineEndingConverterFilter;
    v19 = (void *)v18;
    [(MFBaseFilterDataConsumer *)&v24 appendData:v18];
    if (!v6) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_31:
  v19 = v17;
  v9 = (SEL *)&unk_1E5F8A000;
  if (v6) {
    goto LABEL_22;
  }
LABEL_23:
  if (v13 && v13 < (unint64_t)v8)
  {
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v13 length:&v8[-v13] freeWhenDone:0];

    v23.receiver = self;
    v23.super_class = (Class)MFLineEndingConverterFilter;
    v19 = (void *)v20;
    objc_msgSendSuper2(&v23, v9[262], v20);
  }
  int64_t v21 = [v5 length];

  return v21;
}

- (void)done
{
  if (*(&self->super._serialAppend + 1))
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:&kCarriageReturn length:1 freeWhenDone:0];
    v4.receiver = self;
    v4.super_class = (Class)MFLineEndingConverterFilter;
    [(MFBaseFilterDataConsumer *)&v4 appendData:v3];
    *(&self->super._serialAppend + 1) = 0;
  }
}

@end