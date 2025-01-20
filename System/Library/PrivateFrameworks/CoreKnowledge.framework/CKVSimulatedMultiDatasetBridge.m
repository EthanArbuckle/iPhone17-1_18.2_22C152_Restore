@interface CKVSimulatedMultiDatasetBridge
- (CKVSimulatedMultiDatasetBridge)init;
- (CKVSimulatedMultiDatasetBridge)initWithTask:(unsigned __int16)a3;
- (id)_createDatasetInfoSummary:(int64_t)a3 withOriginAppId:(id)a4;
- (id)datasetInfoSummaryListForTask;
- (id)profileDirectory;
- (id)profileFileName;
- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4;
@end

@implementation CKVSimulatedMultiDatasetBridge

- (id)_createDatasetInfoSummary:(int64_t)a3 withOriginAppId:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F71FC8];
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithItemType:a3 originAppId:v6 itemCount:0 error:0];

  return v7;
}

- (void)enumerateAllDatasets:(unint64_t *)a3 usingBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = [(CKVSimulatedMultiDatasetBridge *)self profileFileName];
  v9 = [(CKVSimulatedMultiDatasetBridge *)self profileDirectory];
  v10 = [v7 fileURLWithPath:v8 isDirectory:0 relativeToURL:v9];

  id v21 = 0;
  v11 = [MEMORY[0x1E4F72008] profileWithContentsOfURL:v10 error:&v21];
  id v12 = v21;
  if (!v11)
  {
    v13 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CKVSimulatedMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_error_impl(&dword_1A77B3000, v13, OS_LOG_TYPE_ERROR, "%s Unable to read profile %@", buf, 0x16u);
    }
  }
  uint64_t v14 = [v11 profileInfo];
  *a3 = [(id)v14 datasetCount];

  id v20 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__CKVSimulatedMultiDatasetBridge_enumerateAllDatasets_usingBlock___block_invoke;
  v18[3] = &unk_1E5CF9520;
  id v15 = v6;
  id v19 = v15;
  LOBYTE(v14) = [v11 enumerateDatasetsWithError:&v20 usingBlock:v18];
  id v16 = v20;
  if ((v14 & 1) == 0)
  {
    v17 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[CKVSimulatedMultiDatasetBridge enumerateAllDatasets:usingBlock:]";
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_error_impl(&dword_1A77B3000, v17, OS_LOG_TYPE_ERROR, "%s Unable to enumerate datasets: %@", buf, 0x16u);
    }
  }
}

uint64_t __66__CKVSimulatedMultiDatasetBridge_enumerateAllDatasets_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  v4 = [[CKVSimulatedDatasetBridge alloc] initWithDataset:v3];

  (*(void (**)(uint64_t, CKVSimulatedDatasetBridge *))(v2 + 16))(v2, v4);
  return 1;
}

- (id)profileFileName
{
  uint64_t v2 = NSString;
  id v3 = CKVTaskIdDescription(self->_task);
  v4 = [v2 stringWithFormat:@"%@Profile", v3];

  return v4;
}

- (id)profileDirectory
{
  uint64_t v2 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library/Assistant/SiriVocabulary/Modules/TestEndToEnd"];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];

  return v3;
}

- (id)datasetInfoSummaryListForTask
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  switch(self->_task)
  {
    case 1u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:1 withOriginAppId:@"com.apple.test.app1"];
      v18[0] = v4;
      v5 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:1 withOriginAppId:@"com.apple.test.app2"];
      v18[1] = v5;
      uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

      goto LABEL_13;
    case 2u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:2 withOriginAppId:*MEMORY[0x1E4F71F68]];
      v17 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v17;
      goto LABEL_12;
    case 3u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:3 withOriginAppId:*MEMORY[0x1E4F71F50]];
      id v16 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v16;
      goto LABEL_12;
    case 4u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:4 withOriginAppId:*MEMORY[0x1E4F71F80]];
      id v15 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v15;
      goto LABEL_12;
    case 5u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:10 withOriginAppId:*MEMORY[0x1E4F71F88]];
      uint64_t v14 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v14;
      goto LABEL_12;
    case 6u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:12 withOriginAppId:*MEMORY[0x1E4F71F70]];
      v13 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v13;
      goto LABEL_12;
    case 7u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:13 withOriginAppId:*MEMORY[0x1E4F71FB0]];
      id v12 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v12;
      goto LABEL_12;
    case 8u:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:15 withOriginAppId:*MEMORY[0x1E4F71F58]];
      v11 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v11;
      goto LABEL_12;
    case 0xAu:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:21 withOriginAppId:*MEMORY[0x1E4F71F78]];
      v10 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v10;
      goto LABEL_12;
    case 0xBu:
      v4 = [(CKVSimulatedMultiDatasetBridge *)self _createDatasetInfoSummary:9 withOriginAppId:*MEMORY[0x1E4F71F60]];
      v9 = v4;
      id v6 = (void *)MEMORY[0x1E4F1C978];
      v7 = &v9;
LABEL_12:
      uint64_t v2 = objc_msgSend(v6, "arrayWithObjects:count:", v7, 1, v9, v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_13:

      break;
    default:
      break;
  }
  return v2;
}

- (CKVSimulatedMultiDatasetBridge)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init not available" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVSimulatedMultiDatasetBridge)initWithTask:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKVSimulatedMultiDatasetBridge;
  result = [(CKVSimulatedMultiDatasetBridge *)&v5 init];
  if (result) {
    result->_task = a3;
  }
  return result;
}

@end