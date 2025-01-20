@interface CKVSimulatedDatasetBridge
- (BOOL)_processDataset:(id)a3;
- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4;
- (CKVSimulatedDatasetBridge)init;
- (CKVSimulatedDatasetBridge)initWithDataset:(id)a3;
- (id)originAppId;
- (unsigned)cascadeItemType;
@end

@implementation CKVSimulatedDatasetBridge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v5 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  items = self->_items;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__CKVSimulatedDatasetBridge_enumerateItemsWithError_usingBlock___block_invoke;
  v9[3] = &unk_1E5CF94F8;
  id v7 = v5;
  id v10 = v7;
  v11 = &v12;
  [(NSArray *)items enumerateObjectsUsingBlock:v9];
  LOBYTE(items) = *((unsigned char *)v13 + 24) == 0;

  _Block_object_dispose(&v12, 8);
  return (char)items;
}

uint64_t __64__CKVSimulatedDatasetBridge_enumerateItemsWithError_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)originAppId
{
  return (id)[(KVDatasetInfo *)self->_datasetInfo originAppId];
}

- (unsigned)cascadeItemType
{
  return self->_cascadeItemType;
}

- (BOOL)_processDataset:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = objc_msgSend([v4 alloc], "initWithCapacity:", -[KVDatasetInfo itemCount](self->_datasetInfo, "itemCount"));
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__CKVSimulatedDatasetBridge__processDataset___block_invoke;
  v25[3] = &unk_1E5CF94D0;
  id v7 = v6;
  id v26 = v7;
  [v5 enumerateItemsWithError:&v27 usingBlock:v25];

  id v8 = v27;
  if (v8)
  {
    id v9 = v8;
    id v10 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      datasetInfo = self->_datasetInfo;
      *(_DWORD *)buf = 136315650;
      v29 = "-[CKVSimulatedDatasetBridge _processDataset:]";
      __int16 v30 = 2112;
      v31 = datasetInfo;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Failed to enumerate dataset: %@ error: %@", buf, 0x20u);
    }
LABEL_4:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  p_items = &self->_items;
  objc_storeStrong((id *)&self->_items, v6);
  if (![(NSArray *)self->_items count])
  {
    v16 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_datasetInfo;
      *(_DWORD *)buf = 136315394;
      v29 = "-[CKVSimulatedDatasetBridge _processDataset:]";
      __int16 v30 = 2112;
      v31 = v20;
      _os_log_error_impl(&dword_1A77B3000, v16, OS_LOG_TYPE_ERROR, "%s Unable to resolve Cascade item for empty dataset: %@", buf, 0x16u);
    }
    id v9 = 0;
    goto LABEL_4;
  }
  v13 = [(NSArray *)*p_items firstObject];
  id v24 = 0;
  uint64_t v14 = [v13 toCascadeItem:&v24];
  id v9 = v24;

  BOOL v11 = v14 != 0;
  if (v14)
  {
    char v15 = [v14 content];
    self->_cascadeItemType = [(id)objc_opt_class() itemType];
  }
  else
  {
    v17 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v21 = *p_items;
      v22 = v17;
      v23 = [(NSArray *)v21 firstObject];
      *(_DWORD *)buf = 136315650;
      v29 = "-[CKVSimulatedDatasetBridge _processDataset:]";
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_error_impl(&dword_1A77B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to convert first item: %@ error: %@", buf, 0x20u);
    }
  }

LABEL_14:
  return v11;
}

uint64_t __45__CKVSimulatedDatasetBridge__processDataset___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (CKVSimulatedDatasetBridge)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init not available" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVSimulatedDatasetBridge)initWithDataset:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVSimulatedDatasetBridge;
  id v5 = [(CKVSimulatedDatasetBridge *)&v10 init];
  if (v5
    && ([v4 datasetInfo],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        datasetInfo = v5->_datasetInfo,
        v5->_datasetInfo = (KVDatasetInfo *)v6,
        datasetInfo,
        ![(CKVSimulatedDatasetBridge *)v5 _processDataset:v4]))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

@end