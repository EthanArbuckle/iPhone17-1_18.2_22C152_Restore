@interface CVNLPModelBase
- (CVNLPModelBase)initWithOptions:(id)a3;
- (CVNLPPerformance)perfResults;
- (NSDictionary)options;
- (id)performanceResults;
- (unint64_t)_blob_size:(id *)a3;
- (void)_copy_data_from_blob:(id *)a3 to:(void *)a4;
- (void)_copy_data_from_blob:(id *)a3 toPtr:(float *)a4;
- (void)_copy_data_to_blob:(float *)a3 to:(id *)a4;
- (void)_copy_data_to_blob:(id)a3 toBuffer:(id *)a4;
- (void)_copy_data_to_blob_repeated:(id)a3 to:(id *)a4;
@end

@implementation CVNLPModelBase

- (CVNLPModelBase)initWithOptions:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CVNLPModelBase;
  v5 = [(CVNLPModelBase *)&v17 init];
  if (v5)
  {
    v6 = [CVNLPPerformance alloc];
    uint64_t v9 = objc_msgSend_initWithOptions_(v6, v7, (uint64_t)v4, v8);
    perfResults = v5->_perfResults;
    v5->_perfResults = (CVNLPPerformance *)v9;

    uint64_t v14 = objc_msgSend_copy(v4, v11, v12, v13);
    options = v5->_options;
    v5->_options = (NSDictionary *)v14;
  }
  return v5;
}

- (unint64_t)_blob_size:(id *)a3
{
  return a3->var2[1] * a3->var2[0] * a3->var2[2] * a3->var2[3];
}

- (void)_copy_data_from_blob:(id *)a3 to:(void *)a4
{
  long long v7 = *(_OWORD *)&a3->var12;
  v23[8] = *(_OWORD *)&a3->var10;
  v23[9] = v7;
  uint64_t v24 = *(void *)&a3->var14;
  long long v8 = *(_OWORD *)&a3->var4;
  v23[4] = *(_OWORD *)&a3->var3[2];
  v23[5] = v8;
  long long v9 = *(_OWORD *)&a3->var8;
  v23[6] = *(_OWORD *)&a3->var6;
  v23[7] = v9;
  long long v10 = *(_OWORD *)a3->var2;
  v23[0] = *(_OWORD *)&a3->var0;
  v23[1] = v10;
  long long v11 = *(_OWORD *)a3->var3;
  v23[2] = *(_OWORD *)&a3->var2[2];
  v23[3] = v11;
  unint64_t v12 = objc_msgSend__blob_size_(self, a2, (uint64_t)v23, (uint64_t)a4);
  uint64_t v13 = *(void *)a4;
  unint64_t v14 = (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 2;
  v15 = (const char *)(v12 - v14);
  if (v12 <= v14)
  {
    if (v12 < v14) {
      *((void *)a4 + 1) = v13 + 4 * v12;
    }
  }
  else
  {
    sub_1B4C52648((uint64_t)a4, (unint64_t)v15);
    uint64_t v13 = *(void *)a4;
  }
  long long v16 = *(_OWORD *)&a3->var12;
  v21[8] = *(_OWORD *)&a3->var10;
  v21[9] = v16;
  uint64_t v22 = *(void *)&a3->var14;
  long long v17 = *(_OWORD *)&a3->var4;
  v21[4] = *(_OWORD *)&a3->var3[2];
  v21[5] = v17;
  long long v18 = *(_OWORD *)&a3->var8;
  v21[6] = *(_OWORD *)&a3->var6;
  v21[7] = v18;
  long long v19 = *(_OWORD *)a3->var2;
  v21[0] = *(_OWORD *)&a3->var0;
  v21[1] = v19;
  long long v20 = *(_OWORD *)a3->var3;
  v21[2] = *(_OWORD *)&a3->var2[2];
  v21[3] = v20;
  objc_msgSend__copy_data_from_blob_toPtr_(self, v15, (uint64_t)v21, v13);
}

- (void)_copy_data_from_blob:(id *)a3 toPtr:(float *)a4
{
  long long v6 = *(_OWORD *)&a3->var12;
  v12[8] = *(_OWORD *)&a3->var10;
  v12[9] = v6;
  uint64_t v13 = *(void *)&a3->var14;
  long long v7 = *(_OWORD *)&a3->var4;
  v12[4] = *(_OWORD *)&a3->var3[2];
  v12[5] = v7;
  long long v8 = *(_OWORD *)&a3->var8;
  v12[6] = *(_OWORD *)&a3->var6;
  v12[7] = v8;
  long long v9 = *(_OWORD *)a3->var2;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v9;
  long long v10 = *(_OWORD *)a3->var3;
  v12[2] = *(_OWORD *)&a3->var2[2];
  v12[3] = v10;
  uint64_t v11 = objc_msgSend__blob_size_(self, a2, (uint64_t)v12, (uint64_t)a4);
  memcpy(a4, a3->var0, 4 * v11);
}

- (void)_copy_data_to_blob:(float *)a3 to:(id *)a4
{
  var0 = a4->var0;
  long long v6 = *(_OWORD *)&a4->var12;
  v12[8] = *(_OWORD *)&a4->var10;
  v12[9] = v6;
  uint64_t v13 = *(void *)&a4->var14;
  long long v7 = *(_OWORD *)&a4->var4;
  v12[4] = *(_OWORD *)&a4->var3[2];
  v12[5] = v7;
  long long v8 = *(_OWORD *)&a4->var8;
  v12[6] = *(_OWORD *)&a4->var6;
  v12[7] = v8;
  long long v9 = *(_OWORD *)a4->var2;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v9;
  long long v10 = *(_OWORD *)a4->var3;
  v12[2] = *(_OWORD *)&a4->var2[2];
  v12[3] = v10;
  uint64_t v11 = objc_msgSend__blob_size_(self, a2, (uint64_t)v12, (uint64_t)a4);
  memcpy(var0, a3, 4 * v11);
}

- (void)_copy_data_to_blob:(id)a3 toBuffer:(id *)a4
{
  id v6 = a3;
  var0 = a4->var0;
  long long v8 = *(_OWORD *)&a4->var12;
  v21[8] = *(_OWORD *)&a4->var10;
  v21[9] = v8;
  uint64_t v22 = *(void *)&a4->var14;
  long long v9 = *(_OWORD *)&a4->var4;
  v21[4] = *(_OWORD *)&a4->var3[2];
  v21[5] = v9;
  long long v10 = *(_OWORD *)&a4->var8;
  v21[6] = *(_OWORD *)&a4->var6;
  v21[7] = v10;
  long long v11 = *(_OWORD *)a4->var2;
  v21[0] = *(_OWORD *)&a4->var0;
  v21[1] = v11;
  long long v12 = *(_OWORD *)a4->var3;
  v21[2] = *(_OWORD *)&a4->var2[2];
  v21[3] = v12;
  uint64_t v15 = objc_msgSend__blob_size_(self, v13, (uint64_t)v21, v14);
  id v16 = v6;
  long long v20 = (const void *)objc_msgSend_bytes(v16, v17, v18, v19);
  memcpy(var0, v20, 4 * v15);
}

- (void)_copy_data_to_blob_repeated:(id)a3 to:(id *)a4
{
  id v6 = a3;
  var0 = (char *)a4->var0;
  long long v8 = *(_OWORD *)&a4->var12;
  v27[8] = *(_OWORD *)&a4->var10;
  v27[9] = v8;
  uint64_t v28 = *(void *)&a4->var14;
  long long v9 = *(_OWORD *)&a4->var4;
  v27[4] = *(_OWORD *)&a4->var3[2];
  v27[5] = v9;
  long long v10 = *(_OWORD *)&a4->var8;
  v27[6] = *(_OWORD *)&a4->var6;
  v27[7] = v10;
  long long v11 = *(_OWORD *)a4->var2;
  v27[0] = *(_OWORD *)&a4->var0;
  v27[1] = v11;
  long long v12 = *(_OWORD *)a4->var3;
  v27[2] = *(_OWORD *)&a4->var2[2];
  v27[3] = v12;
  unint64_t v15 = objc_msgSend__blob_size_(self, v13, (uint64_t)v27, v14);
  id v16 = v6;
  long long v20 = (const void *)objc_msgSend_bytes(v16, v17, v18, v19);
  unint64_t v24 = objc_msgSend_length(v16, v21, v22, v23);
  if (v24 >> 2 <= v15)
  {
    size_t v25 = v24 & 0xFFFFFFFFFFFFFFFCLL;
    if (v15 / (v24 >> 2) <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v15 / (v24 >> 2);
    }
    do
    {
      memcpy(var0, v20, v25);
      var0 += v25;
      --v26;
    }
    while (v26);
  }
}

- (id)performanceResults
{
  id v4 = objc_msgSend_perfResults(self, a2, v2, v3);
  long long v8 = objc_msgSend_results(v4, v5, v6, v7);

  return v8;
}

- (CVNLPPerformance)perfResults
{
  return self->_perfResults;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_perfResults, 0);
}

@end