@interface CKXORCWriterOptions
- (BOOL)testRowsInterspersedWithNulls;
- (CKXORCWriterOptions)init;
- (CKXORCWriterOptions)initWithBatchSize:(unint64_t)a3;
- (NSString)testExceptionDuringCommitBatch;
- (double)batchCommitMarginPercentage;
- (int64_t)compressionKind;
- (unint64_t)batchResizeIncrement;
- (unint64_t)batchSize;
- (unint64_t)compressionBlockSize;
- (unint64_t)stripeSize;
- (unint64_t)testExceptionDuringCommitBatchCommitsToSkip;
- (void)setBatchCommitMarginPercentage:(double)a3;
- (void)setBatchResizeIncrement:(unint64_t)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setCompressionBlockSize:(unint64_t)a3;
- (void)setCompressionKind:(int64_t)a3;
- (void)setStripeSize:(unint64_t)a3;
- (void)setTestExceptionDuringCommitBatch:(id)a3;
- (void)setTestExceptionDuringCommitBatchCommitsToSkip:(unint64_t)a3;
- (void)setTestRowsInterspersedWithNulls:(BOOL)a3;
@end

@implementation CKXORCWriterOptions

- (CKXORCWriterOptions)init
{
  return (CKXORCWriterOptions *)MEMORY[0x1F4181798](self, sel_initWithBatchSize_, 200);
}

- (CKXORCWriterOptions)initWithBatchSize:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKXORCWriterOptions;
  result = [(CKXORCWriterOptions *)&v6 init];
  if (result)
  {
    if (a3 <= 1) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = a3;
    }
    result->_batchSize = v5;
    result->_batchCommitMarginPercentage = 1.0;
    *(_OWORD *)&result->_batchResizeIncrement = xmmword_1DD3262B0;
    *(_OWORD *)&result->_compressionKind = xmmword_1DD3262C0;
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

- (double)batchCommitMarginPercentage
{
  return self->_batchCommitMarginPercentage;
}

- (void)setBatchCommitMarginPercentage:(double)a3
{
  self->_batchCommitMarginPercentage = a3;
}

- (unint64_t)batchResizeIncrement
{
  return self->_batchResizeIncrement;
}

- (void)setBatchResizeIncrement:(unint64_t)a3
{
  self->_batchResizeIncrement = a3;
}

- (unint64_t)compressionBlockSize
{
  return self->_compressionBlockSize;
}

- (void)setCompressionBlockSize:(unint64_t)a3
{
  self->_compressionBlockSize = a3;
}

- (int64_t)compressionKind
{
  return self->_compressionKind;
}

- (void)setCompressionKind:(int64_t)a3
{
  self->_compressionKind = a3;
}

- (unint64_t)stripeSize
{
  return self->_stripeSize;
}

- (void)setStripeSize:(unint64_t)a3
{
  self->_stripeSize = a3;
}

- (BOOL)testRowsInterspersedWithNulls
{
  return self->_testRowsInterspersedWithNulls;
}

- (void)setTestRowsInterspersedWithNulls:(BOOL)a3
{
  self->_testRowsInterspersedWithNulls = a3;
}

- (NSString)testExceptionDuringCommitBatch
{
  return self->_testExceptionDuringCommitBatch;
}

- (void)setTestExceptionDuringCommitBatch:(id)a3
{
}

- (unint64_t)testExceptionDuringCommitBatchCommitsToSkip
{
  return self->_testExceptionDuringCommitBatchCommitsToSkip;
}

- (void)setTestExceptionDuringCommitBatchCommitsToSkip:(unint64_t)a3
{
  self->_testExceptionDuringCommitBatchCommitsToSkip = a3;
}

- (void).cxx_destruct
{
}

@end