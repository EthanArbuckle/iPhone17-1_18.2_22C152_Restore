@interface IMDRecordBatchFetcher
- (IMDRecordBatchFetcher)init;
- (NSPredicate)predicate;
- (id)nextBatch;
- (id)nextBatchWithSize:(unint64_t)a3;
- (int64_t)lastRowID;
- (unint64_t)batchSize;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)fastEnumerationBuffer count:(unint64_t)fastEnumerationBufferSize;
- (void)dealloc;
- (void)setBatchSize:(unint64_t)a3;
- (void)setLastRowID:(int64_t)a3;
- (void)setPredicate:(id)a3;
@end

@implementation IMDRecordBatchFetcher

- (IMDRecordBatchFetcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDRecordBatchFetcher;
  result = [(IMDRecordBatchFetcher *)&v3 init];
  if (result)
  {
    result->_batchSize = 16;
    result->_lastRowID = -1;
  }
  return result;
}

- (void)dealloc
{
  fastEnumerationBuffer = self->_fastEnumerationBuffer;
  if (fastEnumerationBuffer)
  {
    free(fastEnumerationBuffer);
    self->_fastEnumerationBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)IMDRecordBatchFetcher;
  [(IMDRecordBatchFetcher *)&v4 dealloc];
}

- (id)nextBatch
{
  unint64_t v3 = [(IMDRecordBatchFetcher *)self batchSize];
  return [(IMDRecordBatchFetcher *)self nextBatchWithSize:v3];
}

- (id)nextBatchWithSize:(unint64_t)a3
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"%@ is not implemented", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)fastEnumerationBuffer count:(unint64_t)fastEnumerationBufferSize
{
  if (a3->var0 == 2) {
    return 0;
  }
  if (!a3->var0)
  {
    a3->var2 = a3->var3;
    a3->var0 = 1;
  }
  size_t v9 = [(IMDRecordBatchFetcher *)self batchSize];
  if (v9 > fastEnumerationBufferSize)
  {
    fastEnumerationBuffer = self->_fastEnumerationBuffer;
    if (fastEnumerationBuffer)
    {
      fastEnumerationBufferSize = self->_fastEnumerationBufferSize;
    }
    else
    {
      unint64_t v10 = v9;
      fastEnumerationBuffer = (id *)malloc_type_calloc(v9, 8uLL, 0x80040B8603338uLL);
      self->_fastEnumerationBuffer = fastEnumerationBuffer;
      self->_fastEnumerationBufferSize = v10;
      fastEnumerationBufferSize = v10;
    }
  }
  a3->var1 = fastEnumerationBuffer;
  v11 = (void *)MEMORY[0x1B3E8A120]();
  v12 = [(IMDRecordBatchFetcher *)self nextBatchWithSize:fastEnumerationBufferSize];
  fastEnumerationLastBatch = self->_fastEnumerationLastBatch;
  self->_fastEnumerationLastBatch = v12;

  if ([(NSArray *)self->_fastEnumerationLastBatch count] < fastEnumerationBufferSize) {
    fastEnumerationBufferSize = [(NSArray *)self->_fastEnumerationLastBatch count];
  }
  [(NSArray *)self->_fastEnumerationLastBatch count];
  if (fastEnumerationBufferSize)
  {
    -[NSArray getObjects:range:](self->_fastEnumerationLastBatch, "getObjects:range:", a3->var1, 0, fastEnumerationBufferSize);
  }
  else
  {
    a3->var0 = 2;
    v14 = self->_fastEnumerationLastBatch;
    self->_fastEnumerationLastBatch = 0;

    v17 = self->_fastEnumerationBuffer;
    p_fastEnumerationBuffer = &self->_fastEnumerationBuffer;
    v15 = v17;
    if (v17)
    {
      free(v15);
      *p_fastEnumerationBuffer = 0;
      p_fastEnumerationBuffer[1] = 0;
    }
  }
  return fastEnumerationBufferSize;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (int64_t)lastRowID
{
  return self->_lastRowID;
}

- (void)setLastRowID:(int64_t)a3
{
  self->_lastRowID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_fastEnumerationLastBatch, 0);
}

@end