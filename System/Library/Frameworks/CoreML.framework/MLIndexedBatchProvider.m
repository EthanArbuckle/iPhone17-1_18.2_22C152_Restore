@interface MLIndexedBatchProvider
- (MLBatchProvider)fullBatch;
- (MLIndexedBatchProvider)initWithBatch:(id)a3 indices:(id)a4 error:(id *)a5;
- (NSArray)indices;
- (id)featuresAtIndex:(int64_t)a3;
- (int64_t)count;
- (void)setFullBatch:(id)a3;
- (void)setIndices:(id)a3;
@end

@implementation MLIndexedBatchProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indices, 0);

  objc_storeStrong((id *)&self->_fullBatch, 0);
}

- (void)setIndices:(id)a3
{
}

- (NSArray)indices
{
  return self->_indices;
}

- (void)setFullBatch:(id)a3
{
}

- (MLBatchProvider)fullBatch
{
  return self->_fullBatch;
}

- (id)featuresAtIndex:(int64_t)a3
{
  fullBatch = self->_fullBatch;
  v4 = [(NSArray *)self->_indices objectAtIndexedSubscript:a3];
  v5 = -[MLBatchProvider featuresAtIndex:](fullBatch, "featuresAtIndex:", [v4 integerValue]);

  return v5;
}

- (int64_t)count
{
  return [(NSArray *)self->_indices count];
}

- (MLIndexedBatchProvider)initWithBatch:(id)a3 indices:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MLIndexedBatchProvider;
  v10 = [(MLIndexedBatchProvider *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fullBatch, a3);
    objc_storeStrong((id *)&v11->_indices, a4);
  }

  return v11;
}

@end