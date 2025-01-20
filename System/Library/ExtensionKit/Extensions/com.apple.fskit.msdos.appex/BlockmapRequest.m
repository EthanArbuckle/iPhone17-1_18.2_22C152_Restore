@interface BlockmapRequest
- (BlockmapRequest)initWithOriginalSize:(unint64_t)a3;
- (unint64_t)originalFileSize;
- (void)setOriginalFileSize:(unint64_t)a3;
@end

@implementation BlockmapRequest

- (BlockmapRequest)initWithOriginalSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BlockmapRequest;
  result = [(BlockmapRequest *)&v5 init];
  if (result) {
    result->_originalFileSize = a3;
  }
  return result;
}

- (unint64_t)originalFileSize
{
  return self->_originalFileSize;
}

- (void)setOriginalFileSize:(unint64_t)a3
{
  self->_originalFileSize = a3;
}

@end