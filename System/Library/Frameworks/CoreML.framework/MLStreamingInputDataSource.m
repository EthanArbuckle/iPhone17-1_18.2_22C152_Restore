@interface MLStreamingInputDataSource
- (MLStreamingInputDataSource)initWithBatchSize:(unint64_t)a3;
- (NSMutableArray)dataSources;
- (id)batchAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)batchSize;
- (unint64_t)numberOfBatches;
- (unint64_t)sizeOfBatchAtIndex:(unint64_t)a3;
- (void)appendBatchedTensors:(id)a3 numberOfTensors:(unint64_t)a4;
- (void)setBatchSize:(unint64_t)a3;
- (void)setDataSources:(id)a3;
@end

@implementation MLStreamingInputDataSource

- (void).cxx_destruct
{
}

- (void)setDataSources:(id)a3
{
}

- (NSMutableArray)dataSources
{
  return self->_dataSources;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (unint64_t)sizeOfBatchAtIndex:(unint64_t)a3
{
  v4 = [(MLStreamingInputDataSource *)self dataSources];
  v5 = [v4 objectAtIndexedSubscript:a3];
  unint64_t v6 = [v5 numberOfTensors];

  return v6;
}

- (unint64_t)numberOfBatches
{
  v2 = [(MLStreamingInputDataSource *)self dataSources];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)batchAtIndex:(unint64_t)a3 error:(id *)a4
{
  v5 = [(MLStreamingInputDataSource *)self dataSources];
  unint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  v7 = [v6 batchedTensors];

  return v7;
}

- (void)appendBatchedTensors:(id)a3 numberOfTensors:(unint64_t)a4
{
  id v8 = a3;
  unint64_t v6 = [[MLBatchedTensorsHolder alloc] initWithBatchedTensors:v8 numberOfTensors:a4];
  v7 = [(MLStreamingInputDataSource *)self dataSources];
  [v7 addObject:v6];
}

- (MLStreamingInputDataSource)initWithBatchSize:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MLStreamingInputDataSource;
  v4 = [(MLStreamingInputDataSource *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_batchSize = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    dataSources = v5->_dataSources;
    v5->_dataSources = (NSMutableArray *)v6;
  }
  return v5;
}

@end