@interface URLDecodingResult
- (NSURL)url;
- (int64_t)urlDecodingStateInternal;
- (void)setUrl:(id)a3;
- (void)setUrlDecodingStateInternal:(int64_t)a3;
@end

@implementation URLDecodingResult

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)urlDecodingStateInternal
{
  return self->_urlDecodingStateInternal;
}

- (void)setUrlDecodingStateInternal:(int64_t)a3
{
  self->_urlDecodingStateInternal = a3;
}

- (void).cxx_destruct
{
}

@end