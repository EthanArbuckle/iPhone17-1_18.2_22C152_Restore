@interface DSNSURLBatchEnumerator
- (DSNSURLBatchEnumerator)initWithURLs:(id)a3 targets:(id)a4 batchSize:(unint64_t)a5;
- (id)nextBatch;
@end

@implementation DSNSURLBatchEnumerator

- (DSNSURLBatchEnumerator)initWithURLs:(id)a3 targets:(id)a4 batchSize:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DSNSURLBatchEnumerator;
  v11 = [(DSNSURLBatchEnumerator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_index = 0;
    v11->_batchSize = a5;
    objc_storeStrong((id *)&v11->_urls, a3);
    objc_storeStrong((id *)&v12->_targetNames, a4);
  }

  return v12;
}

- (id)nextBatch
{
  v16[2] = *MEMORY[0x1E4F143B8];
  unint64_t index = self->_index;
  if (index >= [(NSArray *)self->_urls count])
  {
    v13 = 0;
  }
  else
  {
    NSUInteger v4 = [(NSArray *)self->_urls count];
    unint64_t v5 = self->_index;
    if (v4 - v5 >= self->_batchSize) {
      unint64_t batchSize = self->_batchSize;
    }
    else {
      unint64_t batchSize = v4 - v5;
    }
    urls = self->_urls;
    v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
    id v9 = [(NSArray *)urls objectsAtIndexes:v8];

    targetNames = self->_targetNames;
    v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", self->_index, batchSize);
    v12 = [(NSArray *)targetNames objectsAtIndexes:v11];

    self->_index += batchSize;
    v15[0] = @"SourceURLs";
    v15[1] = @"TargetNames";
    v16[0] = v9;
    v16[1] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNames, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end