@interface CKXORCReaderOptions
- (CKXORCReaderOptions)init;
- (CKXORCReaderOptions)initWithBatchSize:(unint64_t)a3;
- (NSString)testExceptionDuringLoadBatch;
- (unint64_t)batchSize;
- (unint64_t)testExceptionDuringLoadBatchLoadsToSkip;
- (void)setBatchSize:(unint64_t)a3;
- (void)setTestExceptionDuringLoadBatch:(id)a3;
- (void)setTestExceptionDuringLoadBatchLoadsToSkip:(unint64_t)a3;
@end

@implementation CKXORCReaderOptions

- (CKXORCReaderOptions)init
{
  return (CKXORCReaderOptions *)MEMORY[0x1F4181798](self, sel_initWithBatchSize_, 200);
}

- (CKXORCReaderOptions)initWithBatchSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKXORCReaderOptions;
  result = [(CKXORCReaderOptions *)&v5 init];
  if (result) {
    result->_batchSize = a3;
  }
  return result;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSString)testExceptionDuringLoadBatch
{
  return self->_testExceptionDuringLoadBatch;
}

- (void)setTestExceptionDuringLoadBatch:(id)a3
{
}

- (unint64_t)testExceptionDuringLoadBatchLoadsToSkip
{
  return self->_testExceptionDuringLoadBatchLoadsToSkip;
}

- (void)setTestExceptionDuringLoadBatchLoadsToSkip:(unint64_t)a3
{
  self->_testExceptionDuringLoadBatchLoadsToSkip = a3;
}

- (void).cxx_destruct
{
}

@end