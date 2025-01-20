@interface HMDExtendedTypeReader
- (HMDExtendedTypeReader)initWithReader:(id)a3;
- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3;
- (uint64_t)_bufferPeekAtOffset:(uint64_t)result;
- (void)_bufferConsumeTokens:(uint64_t)a1;
@end

@implementation HMDExtendedTypeReader

- (void).cxx_destruct
{
  buffer = self->_buffer;
  for (uint64_t i = 56; i != -8; i -= 16)

  objc_storeStrong((id *)&self->_reader, 0);
}

- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3
{
  uint64_t v4 = -[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 0);
  if (*(void *)v4 != 3) {
    goto LABEL_19;
  }
  uint64_t v5 = -[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 1uLL);
  if (*(void *)v5 != 5) {
    goto LABEL_19;
  }
  id v6 = *(id *)(v5 + 8);
  if ([v6 characterAtIndex:0] != 36) {
    goto LABEL_18;
  }
  v7 = @"$null";
  int v8 = [v6 isEqualToString:@"$null"];
  if ((v8 & 1) == 0)
  {
    v7 = @"$base64";
    if ([v6 isEqualToString:@"$base64"])
    {
      int v10 = 0;
      int v11 = 0;
      int v9 = 1;
      goto LABEL_12;
    }
    v7 = @"$date";
    if ([v6 isEqualToString:@"$date"])
    {
      int v9 = 0;
      int v11 = 0;
      int v10 = 1;
      goto LABEL_12;
    }
    v7 = @"$uuid";
    if ([v6 isEqualToString:@"$uuid"])
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 1;
      goto LABEL_12;
    }
LABEL_18:

    goto LABEL_19;
  }
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
LABEL_12:

  v12 = (void *)-[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 2uLL);
  if (*v12 == 8)
  {
    v13 = v12;
    if (*(void *)-[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 3uLL) == 4)
    {
      id v14 = (id)v13[1];
      v22 = v7;
      if (!self)
      {
        id v23 = 0;
        uint64_t v24 = 0;
        goto LABEL_31;
      }
      if (v8)
      {
        if (![v14 length])
        {
          id v23 = 0;
          uint64_t v24 = 6;
LABEL_31:

          v25 = self;
          uint64_t v26 = 4;
          goto LABEL_20;
        }
      }
      else if (v9)
      {
        uint64_t v29 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v14 options:0];
        if (v29)
        {
          id v23 = (id)v29;
          uint64_t v24 = 10;
          goto LABEL_31;
        }
      }
      else if (v10)
      {
        v30 = HMDExtendedTypeDateFormatter();
        id v23 = [v30 dateFromString:v14];

        if (v23)
        {
          uint64_t v24 = 11;
          goto LABEL_31;
        }
      }
      else if (v11)
      {
        uint64_t v31 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
        if (v31)
        {
          id v23 = (id)v31;
          uint64_t v24 = 12;
          goto LABEL_31;
        }
      }
      uint64_t v24 = HMDStructuredDataErrorWithReason(@"Invalid extended value: %@", v15, v16, v17, v18, v19, v20, v21, (uint64_t)v22);
      id v23 = v32;
      goto LABEL_31;
    }
  }
LABEL_19:
  uint64_t v24 = *(void *)v4;
  id v23 = *(id *)(v4 + 8);
  v25 = self;
  uint64_t v26 = 1;
LABEL_20:
  -[HMDExtendedTypeReader _bufferConsumeTokens:]((uint64_t)v25, v26);
  int64_t v27 = v24;
  v28 = v23;
  result.value = v28;
  result.type = v27;
  return result;
}

- (uint64_t)_bufferPeekAtOffset:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)(result + 104);
    for (unint64_t i = *(void *)(result + 104); i <= a2; unint64_t i = *(void *)(v3 + 104))
    {
      *uint64_t v4 = i + 1;
      id v6 = (uint64_t *)(v3 + 32 + 16 * ((*(_DWORD *)(v3 + 96) + (_BYTE)i) & 3));
      uint64_t v7 = [*(id *)(v3 + 24) readToken];
      int v8 = (void *)v6[1];
      *id v6 = v7;
      v6[1] = v9;

      uint64_t v4 = (void *)(v3 + 104);
    }
    return v3 + 32 + 16 * ((*(_DWORD *)(v3 + 96) + (_BYTE)a2) & 3);
  }
  return result;
}

- (void)_bufferConsumeTokens:(uint64_t)a1
{
  if (a1)
  {
    do
    {
      uint64_t v4 = (void *)(a1 + 32 + 16 * (*(void *)(a1 + 96) & 3));
      uint64_t v5 = (void *)v4[1];
      *uint64_t v4 = 0;
      v4[1] = 0;

      *(void *)(a1 + 96) = (*(_DWORD *)(a1 + 96) + 1) & 3;
      --*(void *)(a1 + 104);
      --a2;
    }
    while (a2);
  }
}

- (HMDExtendedTypeReader)initWithReader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDExtendedTypeReader;
  id v6 = [(HMDExtendedTypeReader *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reader, a3);
  }

  return v7;
}

@end