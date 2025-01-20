@interface MFDataHolder
+ (id)dataHolder;
+ (id)dataHolderWithData:(id)a3;
- (MFDataHolder)init;
- (MFDataHolder)initWithData:(id)a3;
- (id)data;
- (unint64_t)length;
- (unint64_t)numberOfNewlinesNeedingConversion:(BOOL)a3;
- (void)addData:(id)a3;
- (void)enumerateByteRangesUsingBlock:(id)a3;
- (void)enumerateConvertingNewlinesUsingBlock:(id)a3;
- (void)enumerateDatasUsingBlock:(id)a3;
@end

@implementation MFDataHolder

- (MFDataHolder)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFDataHolder;
  v2 = [(MFDataHolder *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    datas = v2->_datas;
    v2->_datas = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

+ (id)dataHolder
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)dataHolderWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithData:v4];

  return v5;
}

- (MFDataHolder)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [(MFDataHolder *)self init];
  v6 = v5;
  if (v5) {
    [(MFDataHolder *)v5 addData:v4];
  }

  return v6;
}

- (void)addData:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->_datas, "addObject:");
  self->_length += [v4 length];
}

- (id)data
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_datas count] == 1)
  {
    uint64_t v3 = [(NSMutableArray *)self->_datas objectAtIndexedSubscript:0];
    goto LABEL_19;
  }
  if ([(MFDataHolder *)self length] <= 0x20000)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", -[MFDataHolder length](self, "length"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v7 = self->_datas;
    uint64_t v10 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v7);
          }
          [v3 appendData:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
        uint64_t v10 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v24 count:16];
      }
      while (v10);
    }
    goto LABEL_18;
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = MFDataGetDataPath();
  v6 = objc_msgSend(v4, "mf_makeUniqueFileInDirectory:", v5);

  objc_super v7 = v6;
  int v8 = open((const char *)[(NSMutableArray *)v7 fileSystemRepresentation], 1537, 438);
  int v9 = v8;
  if (v8 == -1) {
    goto LABEL_17;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  MFProtectFileDescriptor(v8, 3);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __20__MFDataHolder_data__block_invoke;
  v18[3] = &unk_1E5F898C0;
  v18[4] = &v20;
  int v19 = v9;
  [(MFDataHolder *)self enumerateByteRangesUsingBlock:v18];
  close(v9);
  if (!*((unsigned char *)v21 + 24))
  {
    _Block_object_dispose(&v20, 8);
LABEL_17:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Could not create cache file at %@ (%d).", v7, *__error() format];
    uint64_t v3 = 0;
    goto LABEL_18;
  }
  uint64_t v3 = +[MFData dataWithContentsOfFile:v7];
  _Block_object_dispose(&v20, 8);
  if (!v3) {
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
  return v3;
}

ssize_t __20__MFDataHolder_data__block_invoke(uint64_t a1, const void *a2, int a3, size_t __nbyte, unsigned char *a5)
{
  ssize_t result = write(*(_DWORD *)(a1 + 40), a2, __nbyte);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == __nbyte;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^ 1;
  return result;
}

- (void)enumerateDatasUsingBlock:(id)a3
{
}

- (void)enumerateByteRangesUsingBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_datas;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "enumerateByteRangesUsingBlock:", v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)numberOfNewlinesNeedingConversion:(BOOL)a3
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MFDataHolder_numberOfNewlinesNeedingConversion___block_invoke;
  v5[3] = &unk_1E5F898E8;
  v5[4] = &v7;
  v5[5] = v11;
  BOOL v6 = a3;
  [(MFDataHolder *)self enumerateConvertingNewlinesUsingBlock:v5];
  unint64_t v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
  return v3;
}

uint64_t __50__MFDataHolder_numberOfNewlinesNeedingConversion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (*(unsigned char *)(a1 + 48)) {
        return 0;
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 == 0;
  return 1;
}

- (void)enumerateConvertingNewlinesUsingBlock:(id)a3
{
  id v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = -86;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke;
  v6[3] = &unk_1E5F89938;
  uint64_t v8 = v13;
  uint64_t v9 = v14;
  uint64_t v10 = v11;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MFDataHolder *)self enumerateDatasUsingBlock:v6];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
}

void __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke_2;
  v9[3] = &unk_1E5F89910;
  v9[4] = *(void *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v8;
  long long v10 = v8;
  [a2 enumerateByteRangesUsingBlock:v9];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) ^ 1;
}

uint64_t __54__MFDataHolder_enumerateConvertingNewlinesUsingBlock___block_invoke_2(uint64_t a1, char *a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + a4;
  uint64_t result = [*(id *)(a1 + 32) length];
  uint64_t v10 = result;
  long long v11 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v11 = a2;
    if (*a2 == 10)
    {
      uint64_t result = (*(uint64_t (**)(void, void *, uint64_t, void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), &CRLF, 2, 0, a4 < 2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
      long long v11 = a2 + 1;
    }
  }
  char v12 = &a2[a4];
  BOOL v13 = v8 != v10 && *(v12 - 1) == 13;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    BOOL v14 = v11 >= v12;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    while (1)
    {
      char v15 = (char *)memchr(v11, 10, v12 - v11);
      if (!v15)
      {
        uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
        goto LABEL_25;
      }
      long long v16 = v15;
      if (v11 < v15 && *(v15 - 1) == 13) {
        break;
      }
      int v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t result = 0;
      if (v18)
      {
        long long v17 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_17;
      }
LABEL_18:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
      long long v11 = v16 + 1;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        BOOL v19 = v11 >= v12;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19) {
        goto LABEL_25;
      }
    }
    long long v17 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_17:
    uint64_t result = v17();
    goto LABEL_18;
  }
LABEL_25:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a4;
  *a5 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) ^ 1;
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (void).cxx_destruct
{
}

@end