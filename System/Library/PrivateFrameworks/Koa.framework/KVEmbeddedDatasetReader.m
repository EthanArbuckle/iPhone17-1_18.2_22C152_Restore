@interface KVEmbeddedDatasetReader
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (KVEmbeddedDatasetReader)initWithData:(id)a3 dataset:(const Dataset *)a4 error:(id *)a5;
- (NSString)description;
- (id)datasetInfo;
@end

@implementation KVEmbeddedDatasetReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasetInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)description
{
  v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"dataset format: %@ info: %@", v2, v3, v4, @"Binary Embedded", self->_datasetInfo);

  return (NSString *)v5;
}

- (id)datasetInfo
{
  return self->_datasetInfo;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  v8 = (uint64_t (**)(id, void *))a4;
  dataset = self->_dataset;
  v10 = &dataset[-*(int *)dataset->var0];
  if (*(unsigned __int16 *)v10->var0 >= 7u
    && (uint64_t v11 = *(unsigned __int16 *)v10[6].var0) != 0
    && (uint64_t v12 = *(unsigned int *)dataset[v11].var0,
        v13 = &dataset[v11 + v12],
        uint64_t v14 = *(unsigned int *)v13->var0,
        v14))
  {
    uint64_t v15 = 0;
    uint64_t v16 = 4 * v14;
    v17 = &dataset[v11 + v12];
    while (1)
    {
      uint64_t v18 = *(unsigned int *)v13[v15 + 4].var0;
      uint64_t v19 = *(int *)v13[v15 + 4 + v18].var0;
      uint64_t v20 = *(unsigned __int16 *)v17[v15 + 8 + v18 - v19].var0;
      if (*(_WORD *)v17[v15 + 8 + v18 - v19].var0)
      {
        uint64_t v21 = *(unsigned int *)v17[v15 + 4 + v18 + v20].var0;
        uint64_t v22 = (uint64_t)&v17[v15 + 4 + v18 + v20 + v21];
      }
      else
      {
        uint64_t v20 = 0;
        uint64_t v22 = 0;
        uint64_t v21 = *(unsigned int *)v13[v15 + 4 + v18].var0;
      }
      v23 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v6, v22 + 4, *(unsigned int *)v17[v18 + 4 + v20 + v21 + v15].var0, 0, v7);
      v24 = [KVItem alloc];
      v26 = objc_msgSend_initWithBuffer_verify_copy_error_(v24, v25, (uint64_t)v23, 1, 0, (uint64_t)a3);
      if (!v26 || (v8[2](v8, v26) & 1) == 0) {
        break;
      }

      v15 += 4;
      if (v16 == v15) {
        goto LABEL_11;
      }
    }

    BOOL v27 = 0;
  }
  else
  {
LABEL_11:
    BOOL v27 = 1;
  }

  return v27;
}

- (KVEmbeddedDatasetReader)initWithData:(id)a3 dataset:(const Dataset *)a4 error:(id *)a5
{
  id v9 = a3;
  v27.receiver = self;
  v27.super_class = (Class)KVEmbeddedDatasetReader;
  v10 = [(KVEmbeddedDatasetReader *)&v27 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v10->_data, a3);
  v11->_dataset = a4;
  uint64_t v14 = *(int *)a4->var0;
  uint64_t v15 = *(unsigned __int16 *)a4[-v14 + 4].var0;
  if (*(_WORD *)a4[-v14 + 4].var0)
  {
    uint64_t v16 = *(unsigned int *)a4[v15].var0;
    v17 = &a4[v15 + v16];
  }
  else
  {
    uint64_t v15 = 0;
    v17 = 0;
    uint64_t v16 = *(unsigned int *)a4->var0;
  }
  uint64_t v18 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v12, (uint64_t)&v17[4], *(unsigned int *)a4[v15 + v16].var0, 0, v13);
  uint64_t v19 = [KVDatasetInfo alloc];
  uint64_t v23 = objc_msgSend_initWithBuffer_error_(v19, v20, (uint64_t)v18, (uint64_t)a5, v21, v22);
  datasetInfo = v11->_datasetInfo;
  v11->_datasetInfo = (KVDatasetInfo *)v23;

  v25 = (KVEmbeddedDatasetReader *)v11->_datasetInfo;
  if (v25) {
LABEL_6:
  }
    v25 = v11;

  return v25;
}

@end