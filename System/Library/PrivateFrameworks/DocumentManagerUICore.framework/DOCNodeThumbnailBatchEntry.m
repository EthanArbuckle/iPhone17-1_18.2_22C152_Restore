@interface DOCNodeThumbnailBatchEntry
- (DOCNodeThumbnail)thumbnail;
- (unint64_t)fetchOptions;
- (void)setFetchOptions:(unint64_t)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation DOCNodeThumbnailBatchEntry

- (void).cxx_destruct
{
}

- (DOCNodeThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (unint64_t)fetchOptions
{
  return self->_fetchOptions;
}

- (void)setThumbnail:(id)a3
{
}

- (void)setFetchOptions:(unint64_t)a3
{
  self->_fetchOptions = a3;
}

@end