@interface MTLBinaryArchiveDescriptor
- (BOOL)isEqual:(id)a3;
- (MTLBinaryArchiveDescriptor)init;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)options;
- (unint64_t)writingOptions;
- (void)dealloc;
- (void)setOptions:(unint64_t)a3;
- (void)setUrl:(NSURL *)url;
- (void)setWritingOptions:(unint64_t)a3;
@end

@implementation MTLBinaryArchiveDescriptor

- (void)setUrl:(NSURL *)url
{
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSURL)url
{
  return self->_url;
}

- (MTLBinaryArchiveDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBinaryArchiveDescriptor;
  result = [(MTLBinaryArchiveDescriptor *)&v3 init];
  if (result) {
    result->_options = 2;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLBinaryArchiveDescriptor;
  [(MTLBinaryArchiveDescriptor *)&v3 dealloc];
}

- (unint64_t)writingOptions
{
  return self->_options;
}

- (void)setWritingOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)hash
{
  return self->_options ^ [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    url = self->_url;
    if (url == *((NSURL **)a3 + 1) || (int v6 = -[NSURL isEqual:](url, "isEqual:")) != 0) {
      LOBYTE(v6) = self->_options == *((void *)a3 + 2);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new();
  if (v5)
  {
    v5[1] = [(NSURL *)self->_url copyWithZone:a3];
    v5[2] = self->_options;
  }
  return v5;
}

@end