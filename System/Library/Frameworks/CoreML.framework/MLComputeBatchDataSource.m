@interface MLComputeBatchDataSource
- (BOOL)useForPrediction;
- (MLBatchProvider)batchProvider;
- (MLComputeBatchDataSource)initWithBatchProvider:(id)a3 batchSize:(unint64_t)a4 forPrediction:(BOOL)a5 neuralNetworkEngine:(id)a6 error:(id *)a7;
- (MLNeuralNetworkEngine)nnEngine;
- (id)batchAtIndex:(unint64_t)a3 error:(id *)a4;
- (id)mlcDataSourceAtIndex:(int64_t)a3 error:(id *)a4;
- (unint64_t)batchSize;
- (unint64_t)numberOfBatches;
- (unint64_t)sizeOfBatchAtIndex:(unint64_t)a3;
- (void)setBatchSize:(unint64_t)a3;
@end

@implementation MLComputeBatchDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nnEngine, 0);

  objc_storeStrong((id *)&self->_batchProvider, 0);
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (BOOL)useForPrediction
{
  return self->_useForPrediction;
}

- (MLNeuralNetworkEngine)nnEngine
{
  return self->_nnEngine;
}

- (MLBatchProvider)batchProvider
{
  return self->_batchProvider;
}

- (unint64_t)numberOfBatches
{
  if (![(MLComputeBatchDataSource *)self batchSize]) {
    return 0;
  }
  v3 = [(MLComputeBatchDataSource *)self batchProvider];
  uint64_t v4 = [v3 count];
  unint64_t v5 = [(MLComputeBatchDataSource *)self batchSize];
  unint64_t v6 = (v4 + v5 - 1) / [(MLComputeBatchDataSource *)self batchSize];

  return v6;
}

- (unint64_t)sizeOfBatchAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(MLComputeBatchDataSource *)self batchProvider];
  uint64_t v6 = [v5 count];
  unint64_t v7 = v6 - [(MLComputeBatchDataSource *)self batchSize] * a3;

  if (v7 < [(MLComputeBatchDataSource *)self batchSize]) {
    return v7;
  }

  return [(MLComputeBatchDataSource *)self batchSize];
}

- (id)mlcDataSourceAtIndex:(int64_t)a3 error:(id *)a4
{
  unint64_t v7 = [(MLComputeBatchDataSource *)self batchProvider];
  v8 = [v7 featuresAtIndex:a3];

  v9 = [MLComputeDataSource alloc];
  BOOL v10 = [(MLComputeBatchDataSource *)self useForPrediction];
  v11 = [(MLComputeBatchDataSource *)self nnEngine];
  id v16 = 0;
  v12 = [(MLComputeDataSource *)v9 initWithFeatureProvider:v8 forPrediction:v10 neuralNetworkEngine:v11 error:&v16];
  id v13 = v16;

  if (v12)
  {
    v14 = v12;
  }
  else if (a4)
  {
    *a4 = +[MLModelErrorUtils errorWithCode:6, v13, @"Error in getting feature at index %lu ", a3 underlyingError format];
  }

  return v12;
}

- (id)batchAtIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v55 = 0;
  v49 = 0;
  unint64_t v50 = [(MLComputeBatchDataSource *)self batchSize] * a3;
  while (1)
  {
    if (v55 >= [(MLComputeBatchDataSource *)self batchSize]
      || ([(MLComputeBatchDataSource *)self batchProvider],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          BOOL v7 = v55 + v50 < [v6 count],
          v6,
          !v7))
    {
      id v54 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v19 = v5;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v71 count:16];
      if (!v20) {
        goto LABEL_38;
      }
      uint64_t v56 = *(void *)v62;
      uint64_t v51 = *MEMORY[0x1E4F1C3B8];
      while (1)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v62 != v56) {
            objc_enumerationMutation(v19);
          }
          uint64_t v22 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          v23 = [v19 objectForKeyedSubscript:v22];
          v24 = [v23 objectAtIndexedSubscript:0];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v26 = [v19 objectForKeyedSubscript:v22];
            v27 = +[MLMultiArray multiArrayByConcatenatingMultiArrays:v26 alongAxis:0 dataType:65568];

            if ([v27 isContiguousInOrder:0])
            {
              v28 = v27;
            }
            else
            {
              v38 = [MLMultiArray alloc];
              v39 = [v27 shape];
              v28 = -[MLMultiArray initWithShape:dataType:error:](v38, "initWithShape:dataType:error:", v39, [v27 dataType], a4);

              [v27 vectorizeIntoMultiArray:v28 storageOrder:0 error:a4];
            }
            v40 = [(MLMultiArray *)v28 shape];
            unint64_t v41 = +[MLDataConversionUtils sizeFromShape:v40];
            unint64_t v42 = +[MLDataConversionUtils mlComputeDataTypeSize:65568];

            size_t v43 = v42 * v41;
            v44 = malloc_type_malloc(v42 * v41, 0x24C764D7uLL);
            v32 = v28;
            memcpy(v44, [(MLMultiArray *)v32 bytes], v43);
            v45 = [MEMORY[0x1E4F30C80] dataWithBytesNoCopy:v44 length:v43 freeWhenDone:1];
            [v54 setObject:v45 forKeyedSubscript:v22];
            goto LABEL_35;
          }
          v29 = [v19 objectForKeyedSubscript:v22];
          v30 = [v29 objectAtIndexedSubscript:0];
          objc_opt_class();
          char v31 = objc_opt_isKindOfClass();

          if ((v31 & 1) == 0)
          {
            v46 = (void *)MEMORY[0x1E4F1CA00];
            v32 = [v19 objectForKeyedSubscript:v22];
            v27 = [(MLMultiArray *)v32 objectAtIndexedSubscript:0];
            v47 = (objc_class *)objc_opt_class();
            v45 = NSStringFromClass(v47);
            [v46 raise:v51, @"MLComputeDataSource has unexpected element type: %@", v45 format];
LABEL_35:

            goto LABEL_36;
          }
          v32 = [MEMORY[0x1E4F1CA58] data];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          v33 = [v19 objectForKeyedSubscript:v22];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v70 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v58;
            do
            {
              for (uint64_t j = 0; j != v34; ++j)
              {
                if (*(void *)v58 != v35) {
                  objc_enumerationMutation(v33);
                }
                [(MLMultiArray *)v32 appendData:*(void *)(*((void *)&v57 + 1) + 8 * j)];
              }
              uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v70 count:16];
            }
            while (v34);
          }

          v37 = malloc_type_malloc([(MLMultiArray *)v32 length], 0xB8CC4EAuLL);
          [(MLMultiArray *)v32 getBytes:v37 length:[(MLMultiArray *)v32 length]];
          v27 = objc_msgSend(MEMORY[0x1E4F30C80], "dataWithBytesNoCopy:length:freeWhenDone:", v37, -[MLMultiArray length](v32, "length"), 1);
          [v54 setObject:v27 forKeyedSubscript:v22];
LABEL_36:
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (!v20)
        {
LABEL_38:

          id v10 = v49;
          goto LABEL_42;
        }
      }
    }
    v8 = (void *)MEMORY[0x19F3C29E0]();
    id v69 = v49;
    v9 = [(MLComputeBatchDataSource *)self mlcDataSourceAtIndex:v55 + v50 error:&v69];
    id v10 = v69;

    if (!v9) {
      break;
    }
    v11 = [v9 dataDictionary];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v13; ++k)
        {
          if (*(void *)v66 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v65 + 1) + 8 * k);
          id v17 = [v5 objectForKeyedSubscript:v16];
          if (!v17)
          {
            id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v5 setObject:v17 forKeyedSubscript:v16];
          }
          v18 = [v12 objectForKeyedSubscript:v16];
          [v17 addObject:v18];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v13);
    }

    ++v55;
    v49 = v10;
  }
  if (a4)
  {
    id v10 = v10;
    id v54 = 0;
    *a4 = v10;
  }
  else
  {
    id v54 = 0;
  }
LABEL_42:

  return v54;
}

- (MLComputeBatchDataSource)initWithBatchProvider:(id)a3 batchSize:(unint64_t)a4 forPrediction:(BOOL)a5 neuralNetworkEngine:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MLComputeBatchDataSource;
  uint64_t v14 = [(MLComputeBatchDataSource *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_batchProvider, a3);
    objc_storeStrong((id *)&v15->_nnEngine, a6);
    v15->_useForPrediction = a5;
    v15->_batchSize = a4;
  }

  return v15;
}

@end