@interface HKEADFFileParser
- (HKEADFFileParser)initWithData:(id)a3;
- (NSData)data;
- (id)newBuilderWithStartDate:(id)a3;
- (id)payloadInRange:(_NSRange)a3;
- (void)_enumerateHeadersWithHandler:(id)a3;
- (void)enumerateChannelsWithHandler:(id)a3;
- (void)setData:(id)a3;
@end

@implementation HKEADFFileParser

- (HKEADFFileParser)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKEADFFileParser;
  v6 = [(HKEADFFileParser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_data, a3);
  }

  return v7;
}

- (void)_enumerateHeadersWithHandler:(id)a3
{
  id v5 = (void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, char *))a3;
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = v6 + 12;
    v8 = [(HKEADFFileParser *)self data];
    unint64_t v9 = [v8 length];

    if (v6 + 12 > v9) {
      break;
    }
    unsigned int v14 = 0;
    uint64_t v13 = 0;
    v10 = [(HKEADFFileParser *)self data];
    objc_msgSend(v10, "getBytes:range:", &v13, v6, 12);

    uint64_t v11 = HIDWORD(v13);
    char v12 = 0;
    unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v14;
    v5[2](v5, v13, v3, v7, 4 * HIDWORD(v13), &v12);
    uint64_t v6 = v7 + 4 * v11;
  }
  while (!v12);
}

- (void)enumerateChannelsWithHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__HKEADFFileParser_enumerateChannelsWithHandler___block_invoke;
  v6[3] = &unk_1E58C60C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(HKEADFFileParser *)self _enumerateHeadersWithHandler:v6];
}

void __49__HKEADFFileParser_enumerateChannelsWithHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (*(float *)&a3 <= 0.0)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = +[HKUnit hertzUnit];
    id v6 = +[HKQuantity quantityWithUnit:v5 doubleValue:*(float *)&a3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)payloadInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(HKEADFFileParser *)self data];
  id v6 = objc_msgSend(v5, "subdataWithRange:", location, length);

  return v6;
}

- (id)newBuilderWithStartDate:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__41;
  v25 = __Block_byref_object_dispose__41;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__41;
  v19 = __Block_byref_object_dispose__41;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__HKEADFFileParser_newBuilderWithStartDate___block_invoke;
  v14[3] = &unk_1E58C60E8;
  v14[4] = &v21;
  v14[5] = &v15;
  [(HKEADFFileParser *)self enumerateChannelsWithHandler:v14];
  id v5 = (void *)v22[5];
  if (v5 && v16[5])
  {
    unint64_t v6 = [v5 length];
    id v7 = (_DWORD *)((char *)&v14[-1] - ((4 * (v6 >> 2) + 15) & 0xFFFFFFFFFFFFFFF0));
    [(id)v22[5] getBytes:v7 length:v6 & 0xFFFFFFFFFFFFFFFCLL];
    v8 = [HKElectrocardiogramBuilder alloc];
    unint64_t v9 = [(HKElectrocardiogramBuilder *)v8 initWithStartDate:v4 frequency:v16[5]];
    if (v6 >= 4)
    {
      if (v6 >> 2 <= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = v6 >> 2;
      }
      do
      {
        LODWORD(v10) = *v7;
        [(HKElectrocardiogramBuilder *)v9 addValue:1 lead:v10];
        ++v7;
        --v11;
      }
      while (v11);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __44__HKEADFFileParser_newBuilderWithStartDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12 = a6;
  if (a3 == 503)
  {
    id v16 = v12;
    uint64_t v13 = objc_msgSend(a2, "payloadInRange:", a4, a5);
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a6);
    id v12 = v16;
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end