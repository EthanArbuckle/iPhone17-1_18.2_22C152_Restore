@interface FSMetadataBlockRange
+ (id)rangeWithOffset:(int64_t)a3 blockLength:(unsigned int)a4 numberOfBlocks:(unsigned int)a5;
- (FSMetadataBlockRange)initWithOffset:(int64_t)a3 blockLength:(unsigned int)a4 numberOfBlocks:(unsigned int)a5;
- (int64_t)startBlockOffset;
- (unsigned)blockLength;
- (unsigned)numberOfBlocks;
@end

@implementation FSMetadataBlockRange

- (FSMetadataBlockRange)initWithOffset:(int64_t)a3 blockLength:(unsigned int)a4 numberOfBlocks:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FSMetadataBlockRange;
  result = [(FSMetadataBlockRange *)&v9 init];
  if (result)
  {
    result->_startBlockOffset = a3;
    result->_blockLength = a4;
    result->_numberOfBlocks = a5;
  }
  return result;
}

+ (id)rangeWithOffset:(int64_t)a3 blockLength:(unsigned int)a4 numberOfBlocks:(unsigned int)a5
{
  v5 = [[FSMetadataBlockRange alloc] initWithOffset:a3 blockLength:*(void *)&a4 numberOfBlocks:*(void *)&a5];
  return v5;
}

- (int64_t)startBlockOffset
{
  return self->_startBlockOffset;
}

- (unsigned)blockLength
{
  return self->_blockLength;
}

- (unsigned)numberOfBlocks
{
  return self->_numberOfBlocks;
}

@end